﻿using AutoMapper;
using ICMD.API.Helpers;
using ICMD.Core.Account;
using ICMD.Core.Common;
using ICMD.Core.Constants;
using ICMD.Core.DBModels;
using ICMD.Core.Dtos.ImportValidation;
using ICMD.Core.Dtos.JunctionBox;
using ICMD.Core.Dtos.Project;
using ICMD.Core.Dtos.UIChangeLog;
using ICMD.Core.Shared.Extension;
using ICMD.Core.Shared.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq.Dynamic.Core;
using System.Net;

namespace ICMD.API.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class PanelController : BaseController
    {
        private readonly IPanelService _panelService;
        private readonly IDeviceService _deviceService;
        private readonly IMapper _mapper;
        private readonly CommonMethods _commonMethods;
        private static string ModuleName = "Panel";
        private readonly ChangeLogHelper _changeLogHelper;
        public PanelController(IMapper mapper, IPanelService panelService, CommonMethods commonMethods, IDeviceService deviceService, ChangeLogHelper changeLogHelper)
        {
            _panelService = panelService;
            _mapper = mapper;
            _commonMethods = commonMethods;
            _deviceService = deviceService;
            _changeLogHelper = changeLogHelper;
        }

        #region Panel
        [HttpPost]
        [AuthorizePermission()]
        public async Task<PagedResultDto<JunctionBoxListDto>> GetAllPanels(PagedAndSortedResultRequestDto input)
        {
            IQueryable<JunctionBoxListDto> allPanels = _panelService.GetAll(s => !s.IsDeleted).Select(s => new JunctionBoxListDto
            {
                Id = s.Id,
                Tag = s.Tag != null ? s.Tag.TagName : "",
                Process = (s.Tag != null && s.Tag.Process != null) ? s.Tag.Process.ProcessName : "",
                SubProcess = (s.Tag != null && s.Tag.SubProcess != null) ? s.Tag.SubProcess.SubProcessName : "",
                Stream = (s.Tag != null && s.Tag.Stream != null) ? s.Tag.Stream.StreamName : "",
                EquipmentCode = (s.Tag != null && s.Tag.EquipmentCode != null) ? s.Tag.EquipmentCode.Code : "",
                SequenceNumber = (s.Tag != null && s.Tag.SequenceNumber != null) ? s.Tag.SequenceNumber : "",
                EquipmentIdentifier = (s.Tag != null && s.Tag.EquipmentIdentifier != null) ? s.Tag.EquipmentIdentifier : "",
                Type = s.Type,
                Description = s.Description,
                Number = (s.ReferenceDocument != null) ? s.ReferenceDocument.DocumentNumber : "",
                ReferenceDocumentType = (s.ReferenceDocument != null) ? s.ReferenceDocument.ReferenceDocumentType.Type : string.Empty,
                DocumentNumber = (s.ReferenceDocument != null) ? _commonMethods.GenerateFullReportName(s.ReferenceDocument) : "",
                Revision = (s.ReferenceDocument != null) ? s.ReferenceDocument.Revision : "",
                Sheet = (s.ReferenceDocument != null) ? s.ReferenceDocument.Sheet : "",
                Version = (s.ReferenceDocument != null) ? s.ReferenceDocument.Version : "",
                IsVDPDocumentNumber = (s.ReferenceDocument != null) ? s.ReferenceDocument.IsVDPDocumentNumber : false,
                ProjectId = s.Tag != null ? s.Tag.ProjectId : null,
                IsActive = s.IsActive
            });

            if (!string.IsNullOrEmpty(input.Search))
            {
                allPanels = allPanels.Where(s =>
                (!string.IsNullOrEmpty(s.Tag) && s.Tag.ToLower().Contains(input.Search.ToLower())) ||
                (!string.IsNullOrEmpty(s.Process) && s.Process.ToLower().Contains(input.Search.ToLower())) ||
                (!string.IsNullOrEmpty(s.SubProcess) && s.SubProcess.ToLower().Contains(input.Search.ToLower())) ||
                (!string.IsNullOrEmpty(s.Stream) && s.Stream.ToLower().Contains(input.Search.ToLower())) ||
                (!string.IsNullOrEmpty(s.EquipmentCode) && s.EquipmentCode.ToLower().Contains(input.Search.ToLower())) ||
                (!string.IsNullOrEmpty(s.SequenceNumber) && s.SequenceNumber.ToLower().Contains(input.Search.ToLower())) ||
                (!string.IsNullOrEmpty(s.EquipmentIdentifier) && s.EquipmentIdentifier.ToLower().Contains(input.Search.ToLower())) ||
                (!string.IsNullOrEmpty(s.Type) && s.Type.ToLower().Contains(input.Search.ToLower())) ||
                (!string.IsNullOrEmpty(s.Revision) && s.Revision.ToLower().Contains(input.Search.ToLower())) ||
                (!string.IsNullOrEmpty(s.Version) && s.Version.ToLower().Contains(input.Search.ToLower())) ||
                (!string.IsNullOrEmpty(s.Sheet) && s.Sheet.ToLower().Contains(input.Search.ToLower())) ||
                (!string.IsNullOrEmpty(s.Number) && s.Number.ToLower().Contains(input.Search.ToLower())) ||
                (!string.IsNullOrEmpty(s.Description) && s.Description.ToLower().Contains(input.Search.ToLower())));
            }

            if (input.CustomSearchs != null && input.CustomSearchs.Count != 0)
            {
                foreach (var item in input.CustomSearchs)
                {
                    if (item.FieldName.ToLower() == "projectIds".ToLower() && !string.IsNullOrEmpty(item.FieldValue))
                    {
                        var ids = item.FieldValue?.Split(",");
                        allPanels = allPanels.Where(x => ids != null && ids.Contains(x.ProjectId.ToString()));
                    }


                    if (item.FieldName.ToLower() == "type".ToLower() && !string.IsNullOrEmpty(item.FieldValue))
                    {
                        int value = Convert.ToInt16(item.FieldValue);
                        if (value == (int)RecordType.Active)
                        {
                            allPanels = allPanels.Where(x => x.IsActive);
                        }
                        else if (value == (int)RecordType.Inactive)
                        {
                            allPanels = allPanels.Where(x => !x.IsActive);
                        }
                    }
                }
            }

            if (input.CustomColumnSearch != null && input.CustomColumnSearch.Count != 0 && !string.IsNullOrEmpty(input.SearchColumnFilterQuery))
                allPanels = allPanels.Where(input.SearchColumnFilterQuery);

            allPanels = allPanels.OrderBy(@$"{(string.IsNullOrEmpty(input.Sorting) ? "id" : input.Sorting)} {(input.SortAcending ? "asc" : "desc")}");

            bool isExport = input.CustomSearchs != null && input.CustomSearchs.Any(s => s.FieldName == "isExport") ? Convert.ToBoolean(input.CustomSearchs.FirstOrDefault(s => s.FieldName == "isExport")?.FieldValue) : false;
            IQueryable<JunctionBoxListDto> paginatedData = !isExport ? allPanels.Skip((input.PageNumber - 1) * input.PageSize).Take(input.PageSize) : allPanels;


            return new PagedResultDto<JunctionBoxListDto>(
               allPanels.Count(),
               await paginatedData.ToListAsync()
           );
        }

        [HttpGet]
        public async Task<CreateOrEditJunctionBoxDto?> GetPanelInfo(Guid id)
        {
            Panel? panelDetails = await _panelService.GetAll(s => !s.IsDeleted && s.Id == id).FirstOrDefaultAsync();
            if (panelDetails != null)
            {
                CreateOrEditJunctionBoxDto panelInfo = _mapper.Map<CreateOrEditJunctionBoxDto>(panelDetails);
                panelInfo.ReferenceDocumentTypeId = panelDetails.ReferenceDocument != null ? panelDetails.ReferenceDocument.ReferenceDocumentTypeId : null;
                return panelInfo;
            }
            return null;
        }

        [HttpPost]
        [AuthorizePermission(Operations.Add, Operations.Edit)]
        public async Task<BaseResponse> CreateOrEditPanel(CreateOrEditJunctionBoxDto info)
        {
            if (info.Id == Guid.Empty)
            {
                return await CreatePanel(info);
            }
            else
            {
                return await UpdatePanel(info);
            }
        }

        private async Task<BaseResponse> CreatePanel(CreateOrEditJunctionBoxDto info)
        {
            if (ModelState.IsValid)
            {
                Panel panelInfo = _mapper.Map<Panel>(info);
                panelInfo.IsActive = true;
                var response = await _panelService.AddAsync(panelInfo, User.GetUserId());

                if (response == null)
                    return new BaseResponse(false, ResponseMessages.ModuleNotCreated.ToString().Replace("{module}", ModuleName), HttpStatusCode.NoContent);

                await _changeLogHelper.CreatePanelChangeLog(new Panel(), info);
                return new BaseResponse(true, ResponseMessages.ModuleCreated.ToString().Replace("{module}", ModuleName), HttpStatusCode.NoContent);
            }
            else
                return new BaseResponse(false, ResponseMessages.GlobalModelValidationMessage, HttpStatusCode.BadRequest);
        }

        private async Task<BaseResponse> UpdatePanel(CreateOrEditJunctionBoxDto info)
        {
            if (ModelState.IsValid)
            {
                Guid userId = User.GetUserId();
                Panel panelDetails = await _panelService.GetSingleAsync(s => s.Id == info.Id && !s.IsDeleted);
                if (panelDetails == null)
                    return new BaseResponse(false, ResponseMessages.ModuleNotExist.ToString().Replace("{module}", ModuleName), HttpStatusCode.BadRequest);

                Panel panelInfo = _mapper.Map<Panel>(info);
                panelInfo.CreatedBy = panelDetails.CreatedBy;
                panelInfo.CreatedDate = panelDetails.CreatedDate;
                panelInfo.IsActive = panelDetails.IsActive;
                var response = _panelService.Update(panelInfo, panelDetails, userId);

                if (response == null)
                    return new BaseResponse(false, ResponseMessages.ModuleNotUpdated.ToString().Replace("{module}", ModuleName), HttpStatusCode.NoContent);

                await _changeLogHelper.CreatePanelChangeLog(panelDetails, info);
                return new BaseResponse(true, ResponseMessages.ModuleUpdated.ToString().Replace("{module}", ModuleName), HttpStatusCode.NoContent);
            }
            else
                return new BaseResponse(false, ResponseMessages.GlobalModelValidationMessage, HttpStatusCode.BadRequest);
        }

        [HttpGet]
        [AuthorizePermission(Operations.Delete)]
        public async Task<BaseResponse> DeletePanel(Guid id)
        {
            Panel panelDetails = await _panelService.GetSingleAsync(s => s.Id == id && !s.IsDeleted);
            if (panelDetails != null)
            {
                bool isChkExist = _deviceService.GetAll(s => s.IsActive && !s.IsDeleted && s.TagId == panelDetails.TagId).Any();

                if (isChkExist)
                    return new BaseResponse(false, ResponseMessages.ModuleTagNotDeleteAlreadyAssigned.ToString().Replace("{module}", ModuleName), HttpStatusCode.InternalServerError, panelDetails);

                panelDetails.IsDeleted = true;
                var response = _panelService.Update(panelDetails, panelDetails, User.GetUserId(), true, true);
                if (response == null)
                    return new BaseResponse(false, ResponseMessages.ModuleNotDeleted.ToString().Replace("{module}", ModuleName), HttpStatusCode.InternalServerError, panelDetails);

                await _changeLogHelper.CreateActivationChangeLog(true, panelDetails?.Tag?.TagName ?? "", "Panel", ChangeLogOptions.Deleted);
                return new BaseResponse(true, ResponseMessages.ModuleDeleted.ToString().Replace("{module}", ModuleName), HttpStatusCode.OK, panelDetails);
            }
            else
            {
                return new BaseResponse(false, ResponseMessages.ModuleNotExist.ToString().Replace("{module}", ModuleName), HttpStatusCode.BadRequest);
            }
        }

        [HttpDelete]
        [AuthorizePermission(Operations.Delete)]
        public async Task<BaseResponse> DeleteBulkPanels(List<Guid> ids)
        {
            try
            {
                if (ids == null || ids.Count == 0)
                {
                    return new BaseResponse(false, "Empty record was provided", HttpStatusCode.BadRequest);
                }

                List<BaseResponse> result = [];
                List<BulkDeleteLogDto> bulkLog = [];
                foreach (var id in ids)
                {
                    var deleteResponse = await DeletePanel(id);
                    if (deleteResponse.Data != null)
                    {
                        var record = deleteResponse.Data as Panel;
                        bulkLog.Add(new BulkDeleteLogDto()
                        {
                            Name = record?.Tag.TagName,
                            Status = deleteResponse.IsSucceeded,
                            Message = deleteResponse.Message,
                        });
                    }
                    result.Add(deleteResponse);
                }

                // Record logs
                await _changeLogHelper.CreateBulkDeleteLog(ModuleName, bulkLog);

                if (result.Count != 0 && result.All(r => !r.IsSucceeded))
                {
                    return new BaseResponse()
                    {
                        StatusCode = HttpStatusCode.OK,
                        IsSucceeded = false,
                        Message = $"Failed to delete panels.",
                        Data = result,
                    };
                }

                if (result.Count != 0 && result.All(r => r.IsSucceeded))
                {
                    return new BaseResponse()
                    {
                        StatusCode = HttpStatusCode.OK,
                        IsSucceeded = true,
                        Message = $"Successfully deleted panels. \n" +
                                  $"Success: {result.Where(r => r.IsSucceeded).Count()}",
                        Data = result,
                    };
                }

                return new BaseResponse()
                {
                    StatusCode = HttpStatusCode.OK,
                    IsSucceeded = true,
                    IsWarning = result.Any(r => !r.IsSucceeded),
                    Message = $"Some records of panels have not been successfully deleted. \n" +
                    $"Success: {result.Where(r => r.IsSucceeded).Count()} \n" +
                    $"Failed: {result.Where(r => !r.IsSucceeded).Count()} \n" +
                    $"Please check logs for more details.",
                    Data = result
                };
            }
            catch (Exception)
            {
                return new BaseResponse(false, "Unexpected error occured. Please try again", HttpStatusCode.BadRequest);
            }
        }

        [HttpPost]
        [AuthorizePermission(Operations.ActiveInActive)]
        public async Task<BaseResponse> ActiveInActivePanel(ActiveInActiveDto info)
        {
            Guid userId = User.GetUserId();
            Panel panelDetails = await _panelService.GetSingleAsync(s => s.Id == info.Id);
            if (panelDetails != null)
            {
                Panel oldPanelDetails = panelDetails;
                if (!info.IsActive)
                {
                    bool isChkExist = _deviceService.GetAll(s => s.IsActive && !s.IsDeleted && s.TagId == panelDetails.TagId).Any();

                    if (isChkExist)
                        return new BaseResponse(false, ResponseMessages.ModuleTagNotDeactivatedAlreadyAssigned.ToString().Replace("{module}", ModuleName), HttpStatusCode.InternalServerError);
                }
                panelDetails.IsActive = info.IsActive;
                var response = _panelService.Update(panelDetails, oldPanelDetails, userId);

                if (response == null)
                    return new BaseResponse(false, ResponseMessages.ModuleNotUpdated.ToString().Replace("{module}", ModuleName), HttpStatusCode.InternalServerError);

                await _changeLogHelper.CreateActivationChangeLog(info.IsActive, panelDetails?.Tag?.TagName ?? "", "Panel", ChangeLogOptions.ActiveDeactive);
                return new BaseResponse(true, info.IsActive ? ResponseMessages.ModuleActivate.ToString().Replace("{module}", ModuleName) : ResponseMessages.ModuleDeactivate.ToString().Replace("{module}", ModuleName), HttpStatusCode.OK);
            }
            else
            {
                return new BaseResponse(false, ResponseMessages.ModuleNotExist.ToString().Replace("{module}", ModuleName), HttpStatusCode.BadRequest);
            }
        }
        #endregion

        [HttpPost]
        [AuthorizePermission(Operations.Add)]
        public async Task<ImportFileResultDto<JunctionBoxListDto>> ImportPanel([FromForm] FileUploadModel info)
        {
            return await _commonMethods.CommonBulkImport(info, FileType.Panel, User.GetUserId(), ModuleName);
        }

        [HttpPost]
        [AuthorizePermission(Operations.Add)]
        public async Task<ImportFileResultDto<ValidationDataDto>> ValidateImportPanel([FromForm] FileUploadModel info)
        {
            return await _commonMethods.ValidateCommonBulkImport(info, FileType.Panel, User.GetUserId(), ModuleName);
        }
    }
}
