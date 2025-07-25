import {
  download,
  generateCsv,
  mkConfig
} from 'export-to-csv';
import { ToastrService } from 'ngx-toastr';
import {
  combineLatest,
  BehaviorSubject,
  Subject
} from 'rxjs';
import {
  take,
  takeUntil
} from 'rxjs/operators';
import { AppConfig } from 'src/app/app.config';
import { ColumnSelectorDialogsService } from 'src/app/service/column-selector';
import {
  CommonService,
  DialogsService
} from 'src/app/service/common';
import { ProjectService } from 'src/app/service/manage-projects';
import {
  WorkAreaPackDialogsService,
  WorkAreaPackSearchHelperService,
  WorkAreaPackService
} from 'src/app/service/workAreaPack';

import { CommonModule } from '@angular/common';
import {
  ChangeDetectorRef,
  Component,
  ElementRef,
  ViewChild
} from '@angular/core';
import {
  MatDialog,
  MatDialogModule
} from '@angular/material/dialog';
import { MatExpansionModule } from '@angular/material/expansion';
import {
  ListWorkAreaTableComponent,
  WorkAreaPackInfoDtoModel
} from '@c/masters/workAreaPack/list-work-area-table';
import { WapBulkDialogComponent } from '@c/shared/bulkDelete-dialog/project-master/wap-master/wap-bulk-dialog.component';
import { FormDefaultsModule } from '@c/shared/forms';
import { ImportPreviewDialogComponent } from '@c/shared/import-preview-dialog/import-preview-dialog.component';
import { ListActionsComponent } from '@c/shared/list-actions';
import { PermissionWrapperComponent } from '@c/shared/permission-wrapper';
import { SearchType } from '@e/common';
import { CustomFieldSearchModel } from '@m/common';
import {
  importBankFileColumns,
  importWorkAreaPackFileColumns,
  masterWorkAreaListTableColumn
} from '@u/constants';
import { listColumnMemoryCacheKey } from '@u/default';
import { ExcelHelper } from '@u/helper';

@Component({
    standalone: true,
    selector: "app-list-work-area-page",
    templateUrl: "./list-work-area-page.component.html",
    imports: [
        CommonModule,
        FormDefaultsModule,
        MatDialogModule,
        MatExpansionModule,
        ListWorkAreaTableComponent,
        PermissionWrapperComponent,
        ListActionsComponent
    ],
    providers: [
        WorkAreaPackService,
        WorkAreaPackSearchHelperService,
        WorkAreaPackDialogsService,
        DialogsService,
        ProjectService,
        ExcelHelper, CommonService,
        ColumnSelectorDialogsService
    ]
})
export class ListWorkAreaPageComponent {
    @ViewChild('importFileInput', { static: false }) importFileInput!: ElementRef;
    @ViewChild(ListWorkAreaTableComponent) workAreaTable: ListWorkAreaTableComponent;
    private customFilters$: BehaviorSubject<CustomFieldSearchModel[]> = new BehaviorSubject([]);
    protected projectId: string = null;
    private _destroy$ = new Subject<void>();
    protected workAreaListColumns = [...masterWorkAreaListTableColumn.filter(x => x.key != 'actions')];
    private selectedColumns: string[] = [];
    private columnFilterList: CustomFieldSearchModel[] = [];
    private filterState: { [key: string]: any } = {};

    constructor(
        protected _workAreaPackSearchHelperService: WorkAreaPackSearchHelperService,
        private _workAreaPackService: WorkAreaPackService,
        private _toastr: ToastrService,
        private _dialog: DialogsService,
        private dialog: MatDialog,
        private _projectService: ProjectService,
        private _workAreaPackDialogService: WorkAreaPackDialogsService,
        private _excelHelper: ExcelHelper,
        protected appConfig: AppConfig,
        private _columnSelectorDialogService: ColumnSelectorDialogsService,
        private _cd: ChangeDetectorRef,
        private _commonService: CommonService) {

        this.getWorkAreaPackData();
    }

    ngAfterViewInit(): void {
        this.workAreaTable.sortingChanged.pipe().subscribe((res) => {
            this.defaultCustomFilter();
            this._workAreaPackSearchHelperService.updateSortingChange(res);
        });

        this.workAreaTable.pagingChanged.pipe().subscribe((page) => {
            this.defaultCustomFilter();
            this._workAreaPackSearchHelperService.updatePagingChange(page);
        });

        this.customFilters$.pipe(takeUntil(this._destroy$)).subscribe((filter) => {
            this._workAreaPackSearchHelperService.updateFilterChange(filter);
        });

        this.appConfig.projectIdFilter$.subscribe((res) => {
            if (res) {
                this.projectId = res?.id?.toString() ?? null;
                this.getWorkAreaPackData();
                this.getMemoryCacheItem();
            }
        })

        this.workAreaTable.columnsChanged.subscribe(() => {
            this.tableColumnchanges();
        });
    }

    protected search($event): void {
        this.defaultCustomFilter();
        this._workAreaPackSearchHelperService.commonSearch($event);
    }

    //#region delete
    protected async delete($event): Promise<void> {
        const isOk = await this._dialog.confirm(
            "Are you sure you want to delete this work area pack?",
            "Confirm"
        );
        if (isOk) {
            this._workAreaPackService.deleteWorkAreaPack($event).pipe(takeUntil(this._destroy$)).subscribe(
                (res) => {
                    if (res && res.isSucceeded) {
                        this._toastr.success(res.message);
                        this.getWorkAreaPackData();
                    } else {
                        this._toastr.error(res.message);
                    }
                },
                (errorRes) => {
                    this._toastr.error(errorRes?.error?.message);
                }
            );
        }
    }

    //#region Delete Bulk
    protected async deleteBulkBank(ids: string[]): Promise<void> {
        const dialogRef = this.dialog.open(WapBulkDialogComponent, {
            width: '600px',
            data: ids,
        });

          dialogRef.afterClosed().subscribe((result: string[] | null) => {

            if (result) {
                this._workAreaPackService.deleteBulkWorkAreaPack(result).pipe(takeUntil(this._destroy$)).subscribe(
                    (res) => {
                        if (res && res.isSucceeded) {
                            this._toastr.success(res.message);
                            this.getWorkAreaPackData();
                        } else {
                            this._toastr.error(res.message);
                        }
                    },
                    (errorRes) => {
                        this._toastr.error(errorRes?.error?.message);
                    }
                );
            }
          });
    }

    protected async addEditWorkAreaPackDialog(event: string = null): Promise<void> {
        await this._workAreaPackDialogService.openWorkAreaPackDialog(event, this.projectId);
        this.getWorkAreaPackData();
    }

    protected async bulkEditWap(): Promise<void> {
        const fileName = "Edit_WorkAreaPack"

        this.defaultCustomFilter(true, this.columnFilterList);
        this._workAreaPackSearchHelperService
            .loadDataFromRequest()
            .pipe(takeUntil(this._destroy$), take(1))
            .subscribe((model) => {
                const res = model.items;
                const columnMapping: Record<string, string> = [{ key: 'id', label: 'Id' }]
                .concat(masterWorkAreaListTableColumn.filter(({ key }) => key !== 'actions'))
                .reduce((acc, { key, label }) => {
                    acc[`${key}`] = `${label}`;
                    return acc;
                }, {} as Record<string, string>);

                this._excelHelper.exportExcel(res, columnMapping, fileName);
            });
    }

    protected exportData(): void {
        const fileName = 'Export_WorkAreaPacks';

        this.defaultCustomFilter(true, this.columnFilterList);
        this._workAreaPackSearchHelperService
            .loadDataFromRequest()
            .pipe(takeUntil(this._destroy$), take(1))
            .subscribe((model) => {
                const columnMapping = this.workAreaListColumns.filter(x => this.selectedColumns.includes(x.key)).reduce((acc, column) => {
                    acc[column.key] = column.label;
                    return acc;
                }, {});
                this._excelHelper.exportExcel(model.items ?? [], columnMapping, fileName);
            });
    }

    protected async openColumnSelectorDialog() {
        const data = await this._columnSelectorDialogService.openColumnSelectorDialog(this.workAreaListColumns, listColumnMemoryCacheKey.workAreaPack);
        let selectedColumn = masterWorkAreaListTableColumn.map(x => x.key);
        if (data.selectedColumns.length > 0)
            selectedColumn = data.selectedColumns;

        if (data.success) {
            this.selectedColumns = selectedColumn;
            this.workAreaTable.displayedColumns = this.selectedColumns;
            this._cd.detectChanges();
            this.tableColumnchanges();
            this.getWorkAreaPackData();
        }
    }

    private getWorkAreaPackData(): void {
        if (this.projectId) {
            this.defaultCustomFilter();
            this._workAreaPackSearchHelperService
                .loadDataFromRequest()
                .pipe(takeUntil(this._destroy$))
                .subscribe((model) => { });
        }
    }

    protected defaultCustomFilter(isExport: boolean = false, columnFilterList: CustomFieldSearchModel[] = []): void {
        let filters: CustomFieldSearchModel[] = [
            { fieldName: "projectIds", fieldValue: this.projectId, searchType: SearchType.Contains, isColumnFilter: false },
            { fieldName: "isExport", fieldValue: isExport ? "true" : "false", searchType: SearchType.Contains, isColumnFilter: false }
        ];

        if (columnFilterList && columnFilterList.length > 0)
            filters.push(...columnFilterList)

        this.customFilters$.next(filters);
    }

    private getMemoryCacheItem(): void {
        this._commonService.getMemoryCacheItem(listColumnMemoryCacheKey.workAreaPack).pipe(takeUntil(this._destroy$))
            .subscribe((res) => {
                const selectedColumn = res;
                if (selectedColumn != null && selectedColumn.length > 0) {
                    this.selectedColumns = selectedColumn;
                    this.workAreaTable.displayedColumns = [...this.selectedColumns, masterWorkAreaListTableColumn[masterWorkAreaListTableColumn.length - 1].key];
                } else {
                    this.selectedColumns = this.workAreaListColumns.map(x => x.key);
                }
                this._cd.detectChanges();
                this.tableColumnchanges();
            });
    }

    private tableColumnchanges() {
        this._cd.detectChanges();
        this.workAreaTable.columnFiltersList.forEach((filterComponent) => {
            const columnKey = filterComponent.fieldName;
            const currentFilterValue = filterComponent.columnFilterModel$.value;
            if (currentFilterValue) {
                this.filterState[columnKey] = currentFilterValue;
            }
        });
        this.workAreaTable.columnFiltersList.forEach((filterComponent) => {
            const columnKey = filterComponent.fieldName;
            if (this.filterState[columnKey] !== undefined) {
                filterComponent.setFilter(this.filterState[columnKey]);
            }
        });

        combineLatest(this.workAreaTable.columnFiltersList.map(x => x.columnFilterModel$))
        .pipe(takeUntil(this._destroy$))
        .subscribe((res) => {
            if (res && res.length > 0) {
                this.columnFilterList = res.filter(x => x);
                this.defaultCustomFilter(false, this.columnFilterList);
            }
        });
    }

    //#region Import Functionality
    protected importFileDownload() {
        const csvConfig = mkConfig({ filename: 'Sample_WorkAreaPack', columnHeaders: importWorkAreaPackFileColumns, fieldSeparator: "," });
        const csv = generateCsv(csvConfig)([]);
        download(csvConfig)(csv);
    }

    protected onFileSelected(event: any): void {
        if (!event) return;

        const selectedFile = event.target.files[0] ?? null;
        if (!selectedFile) {
            this._toastr.error("Please select a file for import.");
            this.clearFileInput();
            return;
        }

        if (!this.projectId) {
            this._toastr.error("Please select a project.");
            this.clearFileInput();
            return;
        }

        this._workAreaPackService.validateImportWap(this.projectId, selectedFile)
            .pipe(takeUntil(this._destroy$))
            .subscribe({
                next: (res) => {
                    if (!res || !res.isSucceeded) {
                        this._toastr.error("Validation failed. Please check your file.");
                        this.clearFileInput();
                        return;
                    }

                    const dialogRef = this.dialog.open(ImportPreviewDialogComponent, {
                        width: '750px',
                        data: res.records
                    });

                    dialogRef.afterClosed().subscribe((confirmed) => {
                        if (confirmed) {
                            this.proceedImport(selectedFile);
                        } else {
                            this.clearFileInput();
                        }
                    });
                },
                error: (errorRes) => {
                    this.clearFileInput();
                    this._toastr.error(errorRes?.error?.message || "File validation failed.");
                }
        });
    }

    private proceedImport(selectedFile: File): void {
        this._workAreaPackService.importWorkAreaPack(this.projectId, selectedFile)
            .pipe(takeUntil(this._destroy$))
            .subscribe({
                next: (res) => {
                    if (res && res.isSucceeded) {
                        (res.isWarning) ? this._toastr.warning(res.message) : this._toastr.success(res.message);
                        this.getWorkAreaPackData();

                        if (res.records && res.records?.length > 0)
                            this._excelHelper.downloadImportResponseFile<WorkAreaPackInfoDtoModel>("WorkAreaPack", res.records, importWorkAreaPackFileColumns);

                    } else {
                        this._toastr.error(res.message);
                    }
                    this.clearFileInput();
                },
                error: (errorRes) => {
                    this.clearFileInput();
                    this._toastr.error(errorRes?.error?.message || "Import failed.");
                }
            });
    }

    private clearFileInput(): void {
        if (this.importFileInput)
            this.importFileInput.nativeElement.value = '';

        this._cd.detectChanges();
    }
    //#endregion

    ngOnDestroy(): void {
        this._destroy$.next();
        this._destroy$.complete();
    }
}