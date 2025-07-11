PGDMP  5                
    |            electrical-icmd    16.4    16.0 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    71911    electrical-icmd    DATABASE     |   CREATE DATABASE "electrical-icmd" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
 !   DROP DATABASE "electrical-icmd";
                FMxHWQ43Xh2rpTegRGYBV9    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                azure_pg_admin    false            �           0    0 4   FUNCTION pg_replication_origin_advance(text, pg_lsn)    ACL     `   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO azure_pg_admin;
       
   pg_catalog          azuresu    false    336            �           0    0 +   FUNCTION pg_replication_origin_create(text)    ACL     W   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO azure_pg_admin;
       
   pg_catalog          azuresu    false    354            �           0    0 )   FUNCTION pg_replication_origin_drop(text)    ACL     U   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO azure_pg_admin;
       
   pg_catalog          azuresu    false    346            �           0    0 (   FUNCTION pg_replication_origin_oid(text)    ACL     T   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO azure_pg_admin;
       
   pg_catalog          azuresu    false    347            �           0    0 6   FUNCTION pg_replication_origin_progress(text, boolean)    ACL     b   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO azure_pg_admin;
       
   pg_catalog          azuresu    false    348            �           0    0 1   FUNCTION pg_replication_origin_session_is_setup()    ACL     ]   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO azure_pg_admin;
       
   pg_catalog          azuresu    false    349            �           0    0 8   FUNCTION pg_replication_origin_session_progress(boolean)    ACL     d   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO azure_pg_admin;
       
   pg_catalog          azuresu    false    350            �           0    0 .   FUNCTION pg_replication_origin_session_reset()    ACL     Z   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO azure_pg_admin;
       
   pg_catalog          azuresu    false    355            �           0    0 2   FUNCTION pg_replication_origin_session_setup(text)    ACL     ^   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO azure_pg_admin;
       
   pg_catalog          azuresu    false    351            �           0    0 +   FUNCTION pg_replication_origin_xact_reset()    ACL     W   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO azure_pg_admin;
       
   pg_catalog          azuresu    false    352            �           0    0 K   FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone)    ACL     w   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO azure_pg_admin;
       
   pg_catalog          azuresu    false    353            �           0    0    FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn)    ACL     �   GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO azure_pg_admin;
       
   pg_catalog          azuresu    false    356            �           0    0    FUNCTION pg_stat_reset()    ACL     D   GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset() TO azure_pg_admin;
       
   pg_catalog          azuresu    false    337            �           0    0 #   FUNCTION pg_stat_reset_shared(text)    ACL     O   GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_shared(text) TO azure_pg_admin;
       
   pg_catalog          azuresu    false    338            �           0    0 4   FUNCTION pg_stat_reset_single_function_counters(oid)    ACL     `   GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_function_counters(oid) TO azure_pg_admin;
       
   pg_catalog          azuresu    false    342            �           0    0 1   FUNCTION pg_stat_reset_single_table_counters(oid)    ACL     ]   GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_table_counters(oid) TO azure_pg_admin;
       
   pg_catalog          azuresu    false    341            �           1255    72892 $   fnGetDeviceAttributesInColumns(uuid)    FUNCTION     U  CREATE FUNCTION public."fnGetDeviceAttributesInColumns"("_DeviceId" uuid) RETURNS TABLE("GSDType" text, "ControlPanelNumber" text, "PLCSlotNumber" text, "DPNodeAddress" text, "PLCNumber" text, "DPDPCoupler" text, "AFDHubNumber" text, "ChannelNo" text, "DPPACoupler" text, "PANodeAddress" text, "RackNo" text, "SlotNo" text, "CalibratedRangeMin" text, "CalibratedRangeMax" text, "CalibratedRangeUnits" text, "ProcessRangeMin" text, "ProcessRangeMax" text, "ProcessRangeUnits" text, "RLPosition" text)
    LANGUAGE plpgsql
    AS $$


            BEGIN
                RETURN QUERY
                SELECT
                    MIN(CASE "Name" WHEN 'GSD Type' THEN "Value" END) AS "GSDType",
                    MIN(CASE "Name" WHEN 'Control Panel Number' THEN "Value" END) AS "ControlPanelNumber",
                    MIN(CASE "Name" WHEN 'PLC Slot Number' THEN "Value" END) AS "PLCSlotNumber",
                    MIN(CASE "Name" WHEN 'DP Node Address' THEN "Value" END) AS "DPNodeAddress",
                    MIN(CASE "Name" WHEN 'PLC Number' THEN "Value" END) AS "PLCNumber",
                    MIN(CASE "Name" WHEN 'DP/DP Coupler' THEN "Value" END) AS "DPDPCoupler",
                    MIN(CASE "Name"
                            WHEN 'AFD Number' THEN "Value"
                            WHEN 'DP Hub Number' THEN "Value"
                        END) AS "AFDHubNumber",
                    MIN(CASE "Name" WHEN 'Channel Number' THEN "Value" END) AS "ChannelNo",
                    MIN(CASE "Name" WHEN 'DP/PA Coupler' THEN "Value" END) AS "DPPACoupler",
                    MIN(CASE "Name" WHEN 'PA Node Address' THEN "Value" END) AS "PANodeAddress",

                    MIN(CASE "Name"
                            WHEN 'RIO Rack Number' THEN "Value"
                            WHEN 'VMB Rack Number' THEN "Value"
                        END) AS "RackNo",
                    MIN(CASE "Name" WHEN 'Slot Number' THEN "Value" END) AS "SlotNo",
                    MIN(CASE "Name" WHEN 'Calibrated Range Min' THEN "Value" END) AS "CalibratedRangeMin",
                    MIN(CASE "Name" WHEN 'Calibrated Range Max' THEN "Value" END) AS "CalibratedRangeMax",
                    MIN(CASE "Name" WHEN 'Calibrated Range Units' THEN "Value" END) AS "CalibratedRangeUnits",
                    MIN(CASE "Name" WHEN 'Process Range Min' THEN "Value" END) AS "ProcessRangeMin",
                    MIN(CASE "Name" WHEN 'Process Range Max' THEN "Value" END) AS "ProcessRangeMax",
                    MIN(CASE "Name" WHEN 'Process Range Units' THEN "Value" END) AS "ProcessRangeUnits",
                    MIN(CASE "Name" WHEN 'RL / Position' THEN "Value" END) AS "RLPosition"
                FROM
                    "View_AllAttributes"
                RIGHT OUTER JOIN "Device" ON "Device"."Id" = "View_AllAttributes"."Id" WHERE "Device"."Id"="_DeviceId";

                RETURN;
            END;

$$;
 I   DROP FUNCTION public."fnGetDeviceAttributesInColumns"("_DeviceId" uuid);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            �           1255    72893 #   fnGetDeviceDocumentsInColumns(uuid)    FUNCTION     @  CREATE FUNCTION public."fnGetDeviceDocumentsInColumns"("_DeviceId" uuid) RETURNS TABLE("DatasheetNumber" text, "SheetNumber" text, "HookupDrawing" text, "TerminationDiagram" text, "PIDNumber" text, "LayoutDrawing" text, "ArchitecturalDrawing" text, "FunctionalDescriptionDocument" text, "ProductProcurementNumber" text)
    LANGUAGE plpgsql
    AS $$


                BEGIN
                    RETURN QUERY
                    SELECT
                		public."Aggregate_Concat" (CASE "Type" WHEN 'Datasheet' THEN "DocumentNumber" END) AS "DatasheetNumber",
                		public."Aggregate_Concat" (CASE "Type" WHEN 'Datasheet' THEN "Sheet" END) AS "SheetNumber",
                		public."Aggregate_Concat" (CASE "Type" WHEN 'Hookup Drawing' THEN "DocumentNumber" END) AS "HookupDrawing",
                		public."Aggregate_Concat" (CASE "Type" WHEN 'Termination Diagram' THEN "DocumentNumber" END) AS "TerminationDiagram",
                		public."Aggregate_Concat" (CASE "Type" WHEN 'P&ID' THEN "DocumentNumber" END) AS "PIDNumber",
                		public."Aggregate_Concat" (CASE "Type" WHEN 'Layout Drawing' THEN "DocumentNumber" END) AS "LayoutDrawing",
                		public."Aggregate_Concat" (CASE "Type" WHEN 'Architectural Drawing' THEN "DocumentNumber" END) AS "ArchitecturalDrawing",
                		public."Aggregate_Concat" (CASE "Type" WHEN 'Functional Description Document' THEN "DocumentNumber" END) AS "FunctionalDescriptionDocument",
                		public."Aggregate_Concat" (CASE "Type" WHEN 'Product Procurement Number' THEN "DocumentNumber" END) AS "ProductProcurementNumber"
                	FROM
                		"View_AllDocuments"
                	RIGHT JOIN "Device" ON "Device"."Id"="View_AllDocuments"."DeviceId"
                	WHERE
                		"Device"."Id" = "_DeviceId";
                END;

$$;
 H   DROP FUNCTION public."fnGetDeviceDocumentsInColumns"("_DeviceId" uuid);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            v           1255    73036 4   fnParseDocumentReference(character varying, boolean)    FUNCTION     �  CREATE FUNCTION public."fnParseDocumentReference"("_DocumentReference" character varying, "_SplitMultipleReferences" boolean) RETURNS TABLE("DocumentReference" character varying, "DocType" character varying, "Originator" character varying, "Function" character varying, "Area" character varying, "SubArea" character varying, "Zone" character varying, "DocNumber" character varying, "Revision" character varying, "Version" character varying, "IsVDPDocumentNumber" boolean)
    LANGUAGE plpgsql
    AS $$

DECLARE
    "parts" text[];
    result_record record;
BEGIN
    IF "_DocumentReference" IS NULL OR "_DocumentReference" = '' THEN
        -- If the document reference is empty or NULL, set all fields to NULL.
       RETURN QUERY
    		 SELECT "_DocumentReference" as "DocumentReference", 
			 null::character varying as "DocType", 
			 null::character varying as "Originator", 
			 null::character varying as "Function", 
			 null::character varying as "Area", 
			 null::character varying as "SubArea",
			 null::character varying as "Zone", 
			 null::character varying as "DocNumber", 
			 null::character varying as "Revision", 
			 null::character varying as "Version", 
			 false as "IsVDPDocumentNumber";
    ELSE
        "parts" := string_to_array("_DocumentReference", '-');
        
        "DocumentReference" := "_DocumentReference";
        "DocType" := parts[1];
        "Originator" := parts[2];
        "Function" := parts[3];
        "Area" := parts[4];
        "SubArea" := parts[5];
        "Zone" := parts[6];
        "DocNumber" := parts[7];
        "Revision" := parts[8];
        "Version" := parts[9];

        -- Check if DocNumber is empty and set IsVDPDocumentNumber accordingly.
        IF "DocNumber" IS NULL OR "DocNumber" = '' THEN
            "IsVDPDocumentNumber" := FALSE;
        ELSE
            "IsVDPDocumentNumber" := TRUE;
        END IF;

        -- If DocNumber is empty, set all fields to NULL.
        IF "DocNumber" IS NULL OR "DocNumber" = '' THEN
             RETURN QUERY
    		 SELECT "_DocumentReference" as "DocumentReference", 
			 null::character varying as "DocType", 
			 null::character varying as "Originator", 
			 null::character varying as "Function", 
			 null::character varying as "Area", 
			 null::character varying as "SubArea",
			 null::character varying as "Zone", 
			 null::character varying as "DocNumber", 
			 null::character varying as "Revision", 
			 null::character varying as "Version", 
			 "IsVDPDocumentNumber" as "IsVDPDocumentNumber";
        ELSE
            RETURN QUERY
    SELECT
        "DocumentReference" as "DocumentReference",
        "DocType" as "DocType",
        "Originator" as "Originator",
        "Function" as "Function",
        "Area" as "Area",
        "SubArea" as "SubArea",
        "Zone" as "Zone",
        "DocNumber" as "DocNumber",
        "Revision" as "Revision",
        "Version" as "Version",
        "IsVDPDocumentNumber" as "IsVDPDocumentNumber";
        END IF;
    END IF;

   
END;
$$;
 }   DROP FUNCTION public."fnParseDocumentReference"("_DocumentReference" character varying, "_SplitMultipleReferences" boolean);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            Y           1255    73081 D   fnSlotChannelsInUseByPLC(character varying, character varying, uuid)    FUNCTION     �  CREATE FUNCTION public."fnSlotChannelsInUseByPLC"("_PLC" character varying, "_NatureOfSignal" character varying, "_ProjectId" uuid) RETURNS integer
    LANGUAGE plpgsql
    AS $$

DECLARE
  "_Cnt" INT;

BEGIN

	-- first find all devices that have rack numbers matching (to reduce search space)
	CREATE TEMP TABLE "_Candidate"("DeviceId" uuid PRIMARY KEY) ON COMMIT DROP;
	
	INSERT INTO "_Candidate" ("DeviceId") (
		SELECT "vd"."Id"
		FROM "View_Device" "vd"
		WHERE   
			"vd"."ProjectId" = "_ProjectId"
			AND "vd"."IsInstrument" <> '-'
			AND "vd"."IsDeleted" = false 
			AND ("vd"."NatureOfSignalName" = "_NatureOfSignal")
		INTERSECT
		SELECT "Id" FROM "View_DeviceRackAttributesInColumns" "vdr"
			WHERE	("vdr"."PLCNumber" = "_PLC") AND "vdr"."ChannelNo" IS NOT NULL
	);

	SELECT COUNT("vdr"."ChannelNo") INTO "_Cnt"
	FROM "View_DeviceRackAttributesInColumns" "vdr"
	INNER JOIN "_Candidate" ON "_Candidate"."DeviceId"="vdr"."Id";
	DROP table "_Candidate";
	RETURN "_Cnt";
END; 
$$;
 �   DROP FUNCTION public."fnSlotChannelsInUseByPLC"("_PLC" character varying, "_NatureOfSignal" character varying, "_ProjectId" uuid);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            z           1255    73073 E   fnSlotChannelsInUseByRack(character varying, character varying, uuid)    FUNCTION       CREATE FUNCTION public."fnSlotChannelsInUseByRack"("_RackNo" character varying, "_NatureOfSignal" character varying, "_ProjectId" uuid) RETURNS integer
    LANGUAGE plpgsql
    AS $$

DECLARE
   "_Cnt" INT;

BEGIN
	-- first find all devices that have rack numbers matching (to reduce search space)
	CREATE TEMP TABLE "_Candidate"("DeviceId" uuid ) ON COMMIT DROP;
	
	INSERT INTO "_Candidate" ("DeviceId") (
		SELECT "vd"."Id"
		FROM "View_Device" "vd"
		WHERE "vd"."ProjectId" = "_ProjectId"
			AND "vd"."IsInstrument" <> '-'
			AND "vd"."IsDeleted" = false 
			AND ("vd"."NatureOfSignalName" = "_NatureOfSignal")
		INTERSECT
		SELECT "Id" FROM "View_DeviceRackAttributesInColumns"  "vdr"
			WHERE "vdr"."ProjectId" = "_ProjectId"
				AND "vdr"."RackNo" = "_RackNo"
				AND "vdr"."ChannelNo" IS NOT NULL
	);

	SELECT COUNT(distinct "vdr"."ChannelNo") INTO "_Cnt"
	FROM "View_DeviceRackAttributesInColumns" "vdr"
	INNER JOIN "_Candidate" ON "_Candidate"."DeviceId"="vdr"."Id";
	
	Drop table "_Candidate";
	RETURN "_Cnt";
END; 
$$;
 �   DROP FUNCTION public."fnSlotChannelsInUseByRack"("_RackNo" character varying, "_NatureOfSignal" character varying, "_ProjectId" uuid);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            S           1255    72890    fn_concat_agg(text, text)    FUNCTION     �  CREATE FUNCTION public.fn_concat_agg(text, text) RETURNS text
    LANGUAGE plpgsql
    AS $_$
                BEGIN
                     IF $1 IS NULL THEN
                        RETURN $2;
                    ELSIF $2 IS NULL THEN
                        RETURN $1;
                    ELSE
                        RETURN $1 || ', ' || $2;
                    END IF;
                END;
                $_$;
 0   DROP FUNCTION public.fn_concat_agg(text, text);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            ~           1255    73119 4   fn_trAttributeValue_MaintainAttributeLookup_Delete()    FUNCTION     $  CREATE FUNCTION public."fn_trAttributeValue_MaintainAttributeLookup_Delete"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
            BEGIN
	            UPDATE "MetaData" SET "Value" = 0 WHERE "Property"='Attribute Cache Valid'; 
            RETURN NULL;
            END; 
            $$;
 M   DROP FUNCTION public."fn_trAttributeValue_MaintainAttributeLookup_Delete"();
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            t           1255    73030 �   spCreateReferenceDocument(character varying, character varying, uuid, character varying, character varying, character varying, character varying, date, character varying, uuid, uuid) 	   PROCEDURE     �  CREATE PROCEDURE public."spCreateReferenceDocument"(IN "_ReferenceDocumentType" character varying, IN "_DocumentNumber" character varying, IN "_ProjectId" uuid, IN "_URL" character varying DEFAULT NULL::character varying, IN "_Description" character varying DEFAULT NULL::character varying, IN "_Version" character varying DEFAULT NULL::character varying, IN "_Revision" character varying DEFAULT NULL::character varying, IN "_Date" date DEFAULT NULL::date, IN "_Sheet" character varying DEFAULT NULL::character varying, IN "_CreatedBy" uuid DEFAULT NULL::uuid, INOUT "_ReferenceDocumentId" uuid DEFAULT NULL::uuid)
    LANGUAGE plpgsql
    AS $$

DECLARE
  "_DocTypeId" uuid;
  "_NewDocumentNumber" character varying(100);
  "_IsVDPDocumentNumber" boolean = false;
  "_NewRevision" character varying(50);
  "_NewVersion" character varying(50);

BEGIN
	SELECT "Id" INTO "_DocTypeId" FROM "ReferenceDocumentType" WHERE "Type"="_ReferenceDocumentType";
	IF "_DocTypeId" IS NULL THEN
		RAISE EXCEPTION '%', FORMAT('unknown document type %s', "_ReferenceDocumentType");
	END IF;
	
	SELECT 
		"ref"."DocType" || '-' || "ref"."Originator" || '-' || "ref"."Function" || '-' || "ref"."Area" || '-' || "ref"."SubArea" || '-' || "ref"."Zone" || '-' || "ref"."DocNumber",
		"ref"."Revision",
		"ref"."Version",
		"ref"."IsVDPDocumentNumber" INTO "_NewDocumentNumber", "_NewRevision", "_NewVersion", "_IsVDPDocumentNumber"
	FROM public."fnParseDocumentReference"("_DocumentNumber", false) AS ref;

	IF "_IsVDPDocumentNumber" = true THEN
		RAISE NOTICE '%', "_NewDocumentNumber" || COALESCE(', ' || "_NewRevision", '') || COALESCE(', ' || "_NewVersion", '') || COALESCE(', VDP: ' || CAST("_IsVDPDocumentNumber" as VARCHAR(10)), '');
		"_ReferenceDocumentId":=uuid_in(md5(random()::text || random()::text)::cstring);
		INSERT INTO "ReferenceDocument"(
			"Id",
			"ReferenceDocumentTypeId", 
			"DocumentNumber", 
			"URL", 
			"Description", 
			"Version", 
			"Revision", 
			"Date", 
			"Sheet",
			"IsVDPDocumentNumber",
			"ProjectId","CreatedBy","CreatedDate","IsActive","IsDeleted")
		VALUES (
			"_ReferenceDocumentId",
			"_DocTypeId", 
			"_NewDocumentNumber", 
			"_URL", 
			"_Description", 
			"_NewVersion",
			"_NewRevision",
			"_Date",
			"_Sheet",
			 (CASE WHEN "_IsVDPDocumentNumber" THEN true ELSE false END),"_ProjectId","_CreatedBy",timezone('utc', now()),true,false);
	ELSE
		RAISE NOTICE '%', "_DocumentNumber" || COALESCE(', ' || "_Revision", '') || COALESCE(', ' || "_Version", '') || COALESCE(', ' || "_Sheet", '') || COALESCE(', VDP: ' || CAST("_IsVDPDocumentNumber" as VARCHAR(10)), '');
		"_ReferenceDocumentId":=uuid_in(md5(random()::text || random()::text)::cstring);
		INSERT INTO "ReferenceDocument" (
			"Id",
			"ReferenceDocumentTypeId", 
			"DocumentNumber", 
			"URL", 
			"Description", 
			"Version", 
			"Revision", 
			"Date", 
			"Sheet",
			"IsVDPDocumentNumber","ProjectId","CreatedBy","CreatedDate","IsActive","IsDeleted")
		VALUES (
			"_ReferenceDocumentId",
			"_DocTypeId",
			"_DocumentNumber",
			"_URL",
			"_Description",
			"_Version",
			"_Revision",
			"_Date",
			"_Sheet",
			 (CASE WHEN "_IsVDPDocumentNumber" THEN true ELSE false END),"_ProjectId","_CreatedBy",timezone('utc', now()),true,false);
			 
	END IF;
	--RETURN;
END; 
$$;
 �  DROP PROCEDURE public."spCreateReferenceDocument"(IN "_ReferenceDocumentType" character varying, IN "_DocumentNumber" character varying, IN "_ProjectId" uuid, IN "_URL" character varying, IN "_Description" character varying, IN "_Version" character varying, IN "_Revision" character varying, IN "_Date" date, IN "_Sheet" character varying, IN "_CreatedBy" uuid, INOUT "_ReferenceDocumentId" uuid);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            u           1255    73033 S   spCreateSkid(character varying, uuid, character varying, boolean, uuid, uuid, uuid) 	   PROCEDURE       CREATE PROCEDURE public."spCreateSkid"(IN "_SkidTag" character varying, IN "_ProjectId" uuid, IN "_EquipmentCode" character varying DEFAULT 'K'::character varying, IN "_Quiet" boolean DEFAULT false, IN "_CreatedBy" uuid DEFAULT NULL::uuid, INOUT "_SkidId" uuid DEFAULT NULL::uuid, INOUT "_TagId" uuid DEFAULT NULL::uuid)
    LANGUAGE plpgsql
    AS $$

DECLARE
  "_DeProcess" character varying(255);
  "_DeSubProcess" character varying(255);
  "_DeStream" character varying(50);
  "_DeSequenceNumber" character varying(10);
  "_DeEquipmentIdentifier" character varying(10);
  "_DeSuffix" character varying(10);

BEGIN
	IF NOT EXISTS (SELECT "Id" FROM "Tag" WHERE "TagName"="_SkidTag") THEN
		CALL public."spDeComposeTagGivenEquipmentCode"("_Tag" => "_SkidTag",
			"_EquipmentCode" => "_EquipmentCode",
			"_Process" => "_DeProcess",
			"_SubProcess" => "_DeSubProcess",
			"_Stream" => "_DeStream",
			"_SequenceNumber" => "_DeSequenceNumber",
			"_EquipmentIdentifier" => "_DeEquipmentIdentifier",
			"_TagSuffix" => "_DeSuffix");

		CALL public."spCreateTag"("_Tag" => "_SkidTag",
			"_Process" => "_DeProcess",
			"_SubProcess" => "_DeSubProcess",
			"_Stream" => "_DeStream",
			"_SequenceNumber" =>"_DeSequenceNumber",
			"_EquipmentIdentifier" =>"_DeEquipmentIdentifier",
			"_EquipmentCode" => "_EquipmentCode",
			"_ProjectId" => "_ProjectId",
			"_Suffix" => "_DeSuffix",
			"_CreatedBy" => "_CreatedBy",
			"_Quiet" => "_Quiet",
			"_TagId" => "_TagId");
	END IF;
	SELECT "Id" INTO "_TagId" FROM "Tag" WHERE "TagName"="_SkidTag";

	INSERT INTO "Skid"("Id","TagId","CreatedBy","CreatedDate","IsActive","IsDeleted") VALUES (
		uuid_in(md5(random()::text || random()::text)::cstring),
		"_TagId",
	"_CreatedBy",timezone('utc', now()),true,false) RETURNING "Id" INTO "_SkidId";
END; 
$$;
 �   DROP PROCEDURE public."spCreateSkid"(IN "_SkidTag" character varying, IN "_ProjectId" uuid, IN "_EquipmentCode" character varying, IN "_Quiet" boolean, IN "_CreatedBy" uuid, INOUT "_SkidId" uuid, INOUT "_TagId" uuid);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5                       1255    73031 �   spCreateTag(character varying, character varying, character varying, character varying, character varying, character varying, character varying, uuid, character varying, boolean, boolean, uuid, uuid) 	   PROCEDURE     �  CREATE PROCEDURE public."spCreateTag"(IN "_Tag" character varying, IN "_Process" character varying, IN "_SubProcess" character varying, IN "_Stream" character varying, IN "_SequenceNumber" character varying, IN "_EquipmentIdentifier" character varying, IN "_EquipmentCode" character varying, IN "_ProjectId" uuid, IN "_Suffix" character varying DEFAULT NULL::character varying, IN "_CreateMissing" boolean DEFAULT false, IN "_Quiet" boolean DEFAULT false, IN "_CreatedBy" uuid DEFAULT NULL::uuid, INOUT "_TagId" uuid DEFAULT NULL::uuid)
    LANGUAGE plpgsql
    AS $$



DECLARE
  "_DeProcess" character varying(255);
  "_DeSubProcess" character varying(255);
  "_DeStream" character varying(50);
  "_DeSequenceNumber" character varying;
  "_DeEquipmentIdentifier" character varying;
  "_DeSuffix" character varying;
  "_EquipmentCodeId" uuid;
  "_StreamId" uuid;
  "_ProcessId" uuid;
  "_SubProcessId" uuid;

BEGIN

	CALL "spDeComposeTagGivenEquipmentCode"("_Tag" => "_Tag",
		"_EquipmentCode" => "_EquipmentCode",
		"_Process" => "_DeProcess",
		"_SubProcess" => "_DeSubProcess",
		"_Stream" => "_DeStream",
		"_SequenceNumber" => "_DeSequenceNumber",
		"_EquipmentIdentifier" => "_DeEquipmentIdentifier",
		"_TagSuffix" => "_DeSuffix");

	-- sometimes can't distinguish between suffix and equipment identifier (and some tags don't have the latter),
	-- so combine into one field for comparison

	"_DeSuffix" := "_DeEquipmentIdentifier" || "_DeSuffix";
	"_Suffix" := "_EquipmentIdentifier" || "_Suffix";

	IF ("_Process" IS NOT NULL AND "_Process"	<> "_DeProcess") OR
	   ("_SubProcess" IS NOT NULL AND "_SubProcess" <> "_DeSubProcess") OR
	  ("_Stream" IS NOT NULL AND "_Stream" <> "_DeStream") OR
	   ("_SequenceNumber" IS NOT NULL AND "_SequenceNumber" <> "_SequenceNumber") OR
	   ("_Suffix" IS NOT NULL AND "_Suffix" <> "_DeSuffix") THEN
		RAISE NOTICE '%',
			COALESCE("_DeProcess",'') || ',' ||
			COALESCE("_SubProcess",'') || ',' ||
			COALESCE("_Stream",'') || ',' ||
			COALESCE("_EquipmentCode",'') || ',' ||
			COALESCE("_SequenceNumber",'') || ',' ||
			COALESCE("_Suffix", '') || ' != ' ||
			COALESCE("_DeProcess",'') || ',' ||
			COALESCE("_DeSubProcess",'') || ',' ||
			COALESCE("_DeStream",'') || ',' ||
			COALESCE("_EquipmentCode",'') || ',' ||
			COALESCE("_DeSequenceNumber",'') || ',' ||
			COALESCE("_DeSuffix", '');

		RAISE WARNING '%', FORMAT('Warning: Tag validation failed: %s', "_Tag");
	END IF;

	"_EquipmentCodeId" := NULL;
	"_StreamId" := NULL;
	"_ProcessId" := NULL;
	"_SubProcessId" := NULL;

	IF "_Stream" IS NOT NULL THEN
		SELECT "Id" INTO "_StreamId" FROM "Stream" WHERE "StreamName"="_Stream";
		IF "_StreamId" IS NULL AND "_CreateMissing"=false THEN
			RAISE WARNING '%', FORMAT('Stream not found %s', "_Stream");
		 ELSEIF "_StreamId" IS NULL THEN
		 "_StreamId" := uuid_in(md5(random()::text || random()::text)::cstring);
		 INSERT INTO "Stream"("Id","StreamName","Description", "ProjectId","CreatedBy","CreatedDate","IsActive","IsDeleted") VALUES (
				"_StreamId",
				"_Stream",'',"_ProjectId","_CreatedBy",timezone('utc', now()),true,false);
		END IF;
	END IF;


	IF "_Process" IS NOT NULL THEN
		SELECT "Id" INTO "_ProcessId" FROM "Process" WHERE "ProcessName"="_Process";
		IF "_ProcessId" IS NULL AND "_CreateMissing"=false THEN
			RAISE WARNING '%', FORMAT('Process not found %s', "_Process");
		 ELSEIF "_ProcessId" IS NULL THEN
		 	"_ProcessId" := uuid_in(md5(random()::text || random()::text)::cstring);
			INSERT INTO "Process"("Id","ProcessName","Description","ProjectId","CreatedBy","CreatedDate","IsActive","IsDeleted") VALUES
			("_ProcessId", "_Process",'',"_ProjectId","_CreatedBy",timezone('utc', now()),true,false);
		END IF;
	END IF;

	IF "_SubProcess" IS NOT NULL THEN
		SELECT "Id" INTO "_SubProcessId" FROM "SubProcess" WHERE "SubProcessName"="_SubProcess";
		IF "_SubProcessId" IS NULL AND "_CreateMissing"=false THEN
			RAISE WARNING '%', FORMAT('SubProcess not found %s', "_SubProcess");
		 ELSEIF "_SubProcessId" IS NULL THEN
		 	"_SubProcessId" := uuid_in(md5(random()::text || random()::text)::cstring);
			INSERT INTO "SubProcess"("Id","SubProcessName","Description", "ProjectId","CreatedBy","CreatedDate","IsActive","IsDeleted") VALUES
			("_SubProcessId",
			 "_SubProcess",'',"_ProjectId","_CreatedBy",timezone('utc', now()),true,false);
		END IF;
	END IF;

	IF "_EquipmentCode" IS NOT NULL THEN
		SELECT "Id" INTO "_EquipmentCodeId" FROM "EquipmentCode" WHERE "Code"="_EquipmentCode";
		IF "_EquipmentCodeId" IS NULL AND "_CreateMissing"=false THEN
			RAISE WARNING '%', FORMAT('EquipmentCode not found %s', "_EquipmentCode");
		 ELSEIF "_EquipmentCodeId" IS NULL THEN
		   "_EquipmentCodeId" := uuid_in(md5(random()::text || random()::text)::cstring);
			INSERT INTO "EquipmentCode"("Id","Code","CreatedBy","CreatedDate","IsActive","IsDeleted")
			VALUES ("_EquipmentCodeId",
					"_EquipmentCode","_CreatedBy",timezone('utc', now()),true,false);
		END IF;
	END IF;

	IF "_Quiet" = false THEN RAISE NOTICE '%', COALESCE("_Tag", '(null) Tag');
	END IF;

	"_TagId" := uuid_in(md5(random()::text || random()::text)::cstring);

	INSERT INTO "Tag" ("Id","TagName", "ProcessId", "SubProcessId", "StreamId", "SequenceNumber", "EquipmentIdentifier", "EquipmentCodeId",
					   "CreatedBy","CreatedDate","IsActive","IsDeleted","ProjectId") VALUES (
		"_TagId",
		"_Tag",
		"_ProcessId",
		"_SubProcessId",
		"_StreamId",
		"_SequenceNumber",
		"_EquipmentIdentifier",
		"_EquipmentCodeId",
		"_CreatedBy",timezone('utc', now()),true,false,"_ProjectId");
END;
$$;
 �  DROP PROCEDURE public."spCreateTag"(IN "_Tag" character varying, IN "_Process" character varying, IN "_SubProcess" character varying, IN "_Stream" character varying, IN "_SequenceNumber" character varying, IN "_EquipmentIdentifier" character varying, IN "_EquipmentCode" character varying, IN "_ProjectId" uuid, IN "_Suffix" character varying, IN "_CreateMissing" boolean, IN "_Quiet" boolean, IN "_CreatedBy" uuid, INOUT "_TagId" uuid);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            W           1255    73034 �   spDeComposeTagGivenEquipmentCode(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying) 	   PROCEDURE       CREATE PROCEDURE public."spDeComposeTagGivenEquipmentCode"(IN "_Tag" character varying, IN "_EquipmentCode" character varying, INOUT "_Process" character varying, INOUT "_SubProcess" character varying, INOUT "_Stream" character varying, INOUT "_SequenceNumber" character varying, INOUT "_EquipmentIdentifier" character varying, INOUT "_TagSuffix" character varying)
    LANGUAGE plpgsql
    AS $$


BEGIN
	"_Process" := SUBSTRING("_Tag", 1, 3);
	"_SubProcess" := SUBSTRING("_Tag", 4, 1);
	"_Stream" := SUBSTRING("_Tag", 5, 1);
	"_SequenceNumber" := SUBSTRING("_Tag", 6 + OCTET_LENGTH("_EquipmentCode")/2, 3);
	"_EquipmentIdentifier" := SUBSTRING("_Tag", 9 + OCTET_LENGTH("_EquipmentCode")/2, 1);
	"_TagSuffix" := SUBSTRING("_Tag", 10 + OCTET_LENGTH("_EquipmentCode")/2, 10);
END; 
$$;
 m  DROP PROCEDURE public."spDeComposeTagGivenEquipmentCode"(IN "_Tag" character varying, IN "_EquipmentCode" character varying, INOUT "_Process" character varying, INOUT "_SubProcess" character varying, INOUT "_Stream" character varying, INOUT "_SequenceNumber" character varying, INOUT "_EquipmentIdentifier" character varying, INOUT "_TagSuffix" character varying);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            w           1255    73048 )   spDuplicateDPNodeAddress(uuid, refcursor) 	   PROCEDURE     h  CREATE PROCEDURE public."spDuplicateDPNodeAddress"(IN "_ProjectId" uuid, INOUT "resultData" refcursor)
    LANGUAGE plpgsql
    AS $$

BEGIN

	CREATE TEMP TABLE "_Duplicates"("CouplerTag" character varying(25) NOT NULL, "NodeAddress" character varying) ON COMMIT DROP;

	INSERT INTO "_Duplicates"
	SELECT "vw"."DP/DP Coupler", "vw"."DP Node Address"
	FROM "View_InstrumentListLive" "vw" 
	WHERE "vw"."ProjectId" = "_ProjectId" AND "vw"."DP/DP Coupler" IS NOT NULL AND "vw"."DP Node Address" IS NOT NULL 
	GROUP BY "vw"."DP/DP Coupler", "vw"."DP Node Address"
	HAVING COUNT(*)>1;

	Open "resultData" FOR
	SELECT "vw".*
	FROM "_Duplicates" "dup" 
		INNER JOIN "View_InstrumentListLive" "vw" ON "vw"."DP/DP Coupler"="dup"."CouplerTag" AND "vw"."DP Node Address"="dup"."NodeAddress"
	ORDER BY "vw"."DP/DP Coupler", "vw"."DP Node Address", "vw"."TagName";

	RETURN;

END; 
$$;
 f   DROP PROCEDURE public."spDuplicateDPNodeAddress"(IN "_ProjectId" uuid, INOUT "resultData" refcursor);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            x           1255    73049 )   spDuplicatePANodeAddress(uuid, refcursor) 	   PROCEDURE     `  CREATE PROCEDURE public."spDuplicatePANodeAddress"(IN "_ProjectId" uuid, INOUT "resultData" refcursor)
    LANGUAGE plpgsql
    AS $$

BEGIN

CREATE TEMP TABLE "_Duplicates"("CouplerTag" character varying(25) NOT NULL, "NodeAddress" character varying) ON COMMIT DROP;

INSERT INTO "_Duplicates"
	SELECT "vw"."DP/PA Coupler", "vw"."PA Node Address"
	FROM "View_InstrumentListLive" "vw" 
	WHERE "vw"."ProjectId" = "_ProjectId" AND "vw"."DP/PA Coupler" IS NOT NULL AND "vw"."PA Node Address" IS NOT NULL 
	GROUP BY "vw"."DP/PA Coupler", "vw"."PA Node Address"
	HAVING COUNT(*)>1;

Open "resultData" FOR
SELECT "vw".*
FROM "_Duplicates" "dup" 
	INNER JOIN "View_InstrumentListLive" "vw" ON "vw"."DP/PA Coupler"="dup"."CouplerTag" AND "vw"."PA Node Address"="dup"."NodeAddress"
ORDER BY "vw"."DP/PA Coupler", "vw"."PA Node Address", "vw"."TagName";

RETURN;

END; 
$$;
 f   DROP PROCEDURE public."spDuplicatePANodeAddress"(IN "_ProjectId" uuid, INOUT "resultData" refcursor);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            y           1255    73050 ,   spDuplicateRackSlotChannels(uuid, refcursor) 	   PROCEDURE     {  CREATE PROCEDURE public."spDuplicateRackSlotChannels"(IN "_ProjectId" uuid, INOUT "resultData" refcursor)
    LANGUAGE plpgsql
    AS $$

BEGIN

CREATE TEMP TABLE "_Duplicates"("RackNo" character varying(25), "Slot" character varying, "Channel" character varying) ON COMMIT DROP;

INSERT INTO "_Duplicates"
	SELECT "vw"."Rack No", "vw"."Slot No", "vw"."Channel No"
	FROM "View_InstrumentListLive" "vw"
	WHERE "vw"."ProjectId" = "_ProjectId" AND "vw"."Slot No" IS NOT NULL AND "vw"."Channel No" IS NOT NULL
	GROUP BY "vw"."Rack No", "vw"."Slot No", "vw"."Channel No"
	HAVING COUNT(*)>1;

Open "resultData" FOR
SELECT "vw".*
FROM "_Duplicates" "dup" 
	INNER JOIN "View_InstrumentListLive" "vw" ON "vw"."Rack No"="dup"."RackNo" AND "vw"."Slot No"="dup"."Slot" AND "vw"."Channel No"="dup"."Channel"
ORDER BY "vw"."Rack No", "vw"."Slot No", "vw"."Channel No", "vw"."TagName";

RETURN;

END; 
$$;
 i   DROP PROCEDURE public."spDuplicateRackSlotChannels"(IN "_ProjectId" uuid, INOUT "resultData" refcursor);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            q           1255    72980 G   spGetDeviceConfigurableAttributeDefinitionIDs(uuid, boolean, refcursor) 	   PROCEDURE     >  CREATE PROCEDURE public."spGetDeviceConfigurableAttributeDefinitionIDs"(IN "_DeviceId" uuid, IN "_ParentsOnly" boolean DEFAULT false, INOUT "resultData" refcursor DEFAULT NULL::refcursor)
    LANGUAGE plpgsql
    AS $$

DECLARE
	"curs1" refcursor;
	 "record_data" RECORD;

BEGIN
 	-- Create a temporary table
    CREATE TEMP TABLE "configurable_attributes" (
        "AttributeDefinitionId" uuid,
        "Name" character varying(255),
        "ValueType" character varying(255),
        "Required" boolean
    ) on commit drop;
	
	CALL  public."spGetDeviceConfigurableAttributes"("_DeviceId","curs1");
	  
	 LOOP
        FETCH "curs1" INTO "record_data";

        EXIT WHEN NOT FOUND;
        
		 INSERT INTO "configurable_attributes" ("AttributeDefinitionId", "Name", "ValueType", "Required")
         VALUES (record_data."AttributeDefinitionId", record_data."Name", record_data."ValueType", record_data."Required");
    END LOOP;

    -- Close the cursor
    CLOSE "curs1";
	
	Open "resultData" FOR
	SELECT "AttributeDefinitionId" FROM "configurable_attributes";
	
	return;
END;
$$;
 �   DROP PROCEDURE public."spGetDeviceConfigurableAttributeDefinitionIDs"(IN "_DeviceId" uuid, IN "_ParentsOnly" boolean, INOUT "resultData" refcursor);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            T           1255    72981 2   spGetDeviceConfigurableAttributes(uuid, refcursor) 	   PROCEDURE     U  CREATE PROCEDURE public."spGetDeviceConfigurableAttributes"(IN "_DeviceId" uuid, INOUT "resultData" refcursor)
    LANGUAGE plpgsql
    AS $$

BEGIN
	-- navigate hierarchy from child to parent (top level)
	Open "resultData" FOR
	WITH RECURSIVE "DeviceTree" ("ParentId", "DeviceId", "TreeLevel")
	AS (
		SELECT "_DeviceId" as "ParentId", NULL::uuid As "DeviceId", 0 as "TreeLevel"
		UNION ALL
		SELECT "ControlSystemHierarchy"."ParentDeviceId", "Device"."Id", "TreeLevel" - 1
		FROM "DeviceTree"
		INNER JOIN "ControlSystemHierarchy" ON "ChildDeviceId" = "DeviceTree"."ParentId"
		INNER JOIN "Device" ON "ControlSystemHierarchy"."ChildDeviceId" = "Device"."Id"
	)
	-- For each row get the attributes for that device type/model. Configurable attributes are 
	-- identified by the fact that they either device model or type Id in the attribute definition record
	SELECT 
		"def"."Id" as "AttributeDefinitionId", 
		"def"."Name", 
		"def"."ValueType",
		"def"."Required"
	FROM "DeviceTree" 
		INNER JOIN "Device" ON "DeviceTree"."ParentId" = "Device"."Id" 
		INNER JOIN "DeviceType" ON "DeviceType"."Id" = "Device"."DeviceTypeId" 
		INNER JOIN "AttributeDefinition" "def" ON "def"."DeviceTypeId" = "DeviceType"."Id"
		WHERE 
			"def"."Inherit" = true
	UNION  
	SELECT 
		"def"."Id" as "AttributeDefinitionId", 
		"def"."Name", 
		"def"."ValueType",
		"def"."Required"
	FROM "DeviceTree" 
		INNER JOIN "Device" ON "DeviceTree"."ParentId" = "Device"."Id" 
		INNER JOIN "DeviceModel" ON "DeviceModel"."Id" = "Device"."DeviceModelId" 
		INNER JOIN "AttributeDefinition" "def" ON "def"."DeviceModelId" = "DeviceModel"."Id"
		WHERE 
			"def"."Inherit" = true
	UNION  
	SELECT 
		"def"."Id" as "AttributeDefinitionId", 
		"def"."Name", 
		"def"."ValueType",
		"def"."Required"
	FROM "DeviceTree" 
		INNER JOIN "Device" ON "DeviceTree"."ParentId" = "Device"."Id" 
		INNER JOIN "NatureOfSignal" ON "NatureOfSignal"."Id" = "Device"."NatureOfSignalId"
		INNER JOIN "AttributeDefinition" "def" ON "def"."NatureOfSignalId" = "NatureOfSignal"."Id"
		WHERE 
			"def"."Inherit" = true AND "Device"."NatureOfSignalId" IS NOT NULL;
			
	return;
END; 
$$;
 n   DROP PROCEDURE public."spGetDeviceConfigurableAttributes"(IN "_DeviceId" uuid, INOUT "resultData" refcursor);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            p           1255    72979 U   spGetDeviceTypeModelNatureOfSignalAttributeDefinitionIDs(uuid, uuid, uuid, refcursor) 	   PROCEDURE     �  CREATE PROCEDURE public."spGetDeviceTypeModelNatureOfSignalAttributeDefinitionIDs"(IN "_DeviceTypeId" uuid, IN "_DeviceModelId" uuid, IN "_NatureOfSignalId" uuid, INOUT "resultData" refcursor DEFAULT NULL::refcursor)
    LANGUAGE plpgsql
    AS $$

BEGIN
	Open "resultData" FOR
	SELECT 
		"AttributeDefinition"."Id" AS "AttributeDefinitionId"
	FROM "AttributeDefinition" 
	WHERE "_DeviceModelId" = "AttributeDefinition"."DeviceModelId" AND "AttributeDefinition"."Inherit" = false

	UNION 
	
	SELECT 
		"AttributeDefinition"."Id" AS "AttributeDefinitionId"
	FROM "AttributeDefinition" 
	WHERE "_DeviceTypeId" = "AttributeDefinition"."DeviceTypeId" AND "AttributeDefinition"."Inherit" = false

	UNION 
	
	SELECT 
		"AttributeDefinition"."Id" AS "AttributeDefinitionId"
	FROM "AttributeDefinition" 
	WHERE "_NatureOfSignalId" IS NOT NULL AND ("_NatureOfSignalId" = "AttributeDefinition"."NatureOfSignalId" AND "AttributeDefinition"."Inherit" = false);
	
	return;
END; 
$$;
 �   DROP PROCEDURE public."spGetDeviceTypeModelNatureOfSignalAttributeDefinitionIDs"(IN "_DeviceTypeId" uuid, IN "_DeviceModelId" uuid, IN "_NatureOfSignalId" uuid, INOUT "resultData" refcursor);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            r           1255    73016 #   spImportOMServiceDescriptions(uuid) 	   PROCEDURE     W  CREATE PROCEDURE public."spImportOMServiceDescriptions"(IN "_CreatedBy" uuid)
    LANGUAGE plpgsql
    AS $$

BEGIN

INSERT INTO "ServiceZone" ("Id","Zone", "ProjectId","CreatedBy","CreatedDate","IsActive","IsDeleted") 
	SELECT uuid_in(md5(random()::text || random()::text)::cstring) as "Id", "OMServiceDescriptionImport"."Area", "OMServiceDescriptionImport"."ProjectId",
	"_CreatedBy" as "CreatedBy",timezone('utc', now()) as "CreatedDate",true as "IsActive",false as "IsDeleted"
	FROM "OMServiceDescriptionImport"
	WHERE "OMServiceDescriptionImport"."Area" IS NOT NULL and "OMServiceDescriptionImport"."Area" != '' and "OMServiceDescriptionImport"."Area" NOT IN (
		SELECT "imp"."Area" FROM "OMServiceDescriptionImport" AS "imp"
		INNER JOIN "ServiceZone" ON "imp"."Area" = "ServiceZone"."Zone"
		GROUP BY "imp"."Area")
	GROUP BY "OMServiceDescriptionImport"."Area", "OMServiceDescriptionImport"."ProjectId";

INSERT INTO "ServiceBank" ("Id","Bank", "ProjectId","CreatedBy","CreatedDate","IsActive","IsDeleted") 
	SELECT uuid_in(md5(random()::text || random()::text)::cstring) as "Id","OMServiceDescriptionImport"."Bank", "OMServiceDescriptionImport"."ProjectId",
	"_CreatedBy" as "CreatedBy",timezone('utc', now()) as "CreatedDate",true,false
	FROM "OMServiceDescriptionImport"
	WHERE "OMServiceDescriptionImport"."Bank" IS NOT NULL and "OMServiceDescriptionImport"."Bank" != '' and "OMServiceDescriptionImport"."Bank" NOT IN (
		SELECT "imp"."Bank" FROM "OMServiceDescriptionImport" AS "imp"
		INNER JOIN "ServiceBank" ON "imp"."Bank" = "ServiceBank"."Bank"
		GROUP BY "imp"."Bank")
	GROUP BY "OMServiceDescriptionImport"."Bank", "OMServiceDescriptionImport"."ProjectId";

INSERT INTO "ServiceTrain" ("Id","Train", "ProjectId","CreatedBy","CreatedDate","IsActive","IsDeleted")  
	SELECT uuid_in(md5(random()::text || random()::text)::cstring) as "Id", "OMServiceDescriptionImport"."Train", "OMServiceDescriptionImport"."ProjectId",
	"_CreatedBy" as "CreatedBy",timezone('utc', now()) as "CreatedDate",true,false
	FROM "OMServiceDescriptionImport"
	WHERE "OMServiceDescriptionImport"."Train" IS NOT NULL and "OMServiceDescriptionImport"."Train" != '' and "OMServiceDescriptionImport"."Train" NOT IN (
		SELECT "imp"."Train" FROM "OMServiceDescriptionImport" AS "imp"
		INNER JOIN "ServiceTrain" ON "imp"."Train" = "ServiceTrain"."Train"
		GROUP BY "imp"."Train")
	GROUP BY "OMServiceDescriptionImport"."Train", "OMServiceDescriptionImport"."ProjectId";

UPDATE "Device" SET 
	"ServiceDescription" = 
	(
		SELECT "OMServiceDescriptionImport"."ServiceDescription" 
		FROM "OMServiceDescriptionImport" 
			INNER JOIN "Tag" ON "Tag"."TagName" = "OMServiceDescriptionImport"."Tag" 
		WHERE "Tag"."Id" = "Device"."TagId"
		order by "OMServiceDescriptionImport"."CreatedDate" desc
		limit 1
	)
	,"ServiceZoneId" = 
	(
		SELECT "ServiceZone"."Id"
		FROM "ServiceZone" 
			INNER JOIN "OMServiceDescriptionImport" ON "OMServiceDescriptionImport"."Area"="ServiceZone"."Zone"
			INNER JOIN "Tag" ON "Tag"."TagName" = "OMServiceDescriptionImport"."Tag"
		WHERE "Tag"."Id" = "Device"."TagId"
		order by "OMServiceDescriptionImport"."CreatedDate" desc
		limit 1
	)
	,"ServiceBankId" = 
	(
		SELECT "ServiceBank"."Id"
		FROM "ServiceBank" 
			INNER JOIN "OMServiceDescriptionImport" ON "OMServiceDescriptionImport"."Bank"="ServiceBank"."Bank"
			INNER JOIN "Tag" ON "Tag"."TagName" = "OMServiceDescriptionImport"."Tag"
		WHERE "Tag"."Id" = "Device"."TagId"
		order by "OMServiceDescriptionImport"."CreatedDate" desc
		limit 1
	)
	,"ServiceTrainId" = 
	(
		SELECT "ServiceTrain"."Id"
		FROM "ServiceTrain" 
			INNER JOIN "OMServiceDescriptionImport" ON "OMServiceDescriptionImport"."Train"="ServiceTrain"."Train"
			INNER JOIN "Tag" ON "Tag"."TagName" = "OMServiceDescriptionImport"."Tag"
		WHERE "Tag"."Id" = "Device"."TagId"
		order by "OMServiceDescriptionImport"."CreatedDate" desc
		limit 1
	)
	,"Service" = 
	(
		SELECT "OMServiceDescriptionImport"."Service" 
		FROM "OMServiceDescriptionImport" 
			INNER JOIN "Tag" ON "Tag"."TagName" = "OMServiceDescriptionImport"."Tag" 
		WHERE "Tag"."Id" = "Device"."TagId"
		order by "OMServiceDescriptionImport"."CreatedDate" desc
		limit 1
	)
	,"Variable" = 
	(
		SELECT "OMServiceDescriptionImport"."Variable" 
		FROM "OMServiceDescriptionImport" 
			INNER JOIN "Tag" ON "Tag"."TagName" = "OMServiceDescriptionImport"."Tag" 
		WHERE "Tag"."Id" = "Device"."TagId"
		order by "OMServiceDescriptionImport"."CreatedDate" desc
		limit 1
	)
WHERE "Device"."TagId" IN (
	SELECT "Tag"."Id" FROM "Tag" INNER JOIN "OMServiceDescriptionImport" ON "OMServiceDescriptionImport"."Tag" = "Tag"."TagName"
	WHERE "OMServiceDescriptionImport"."ServiceDescription" IS NOT NULL AND "Tag"."ProjectId" = (SELECT "ProjectId" FROM "OMServiceDescriptionImport"
	                                                                                        LIMIT 1)
) AND "Device"."IsDeleted"=false AND "Device"."IsActive"=true;
RETURN;

END;
 
$$;
 M   DROP PROCEDURE public."spImportOMServiceDescriptions"(IN "_CreatedBy" uuid);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            s           1255    73028    spImportPnIDTags(uuid, uuid) 	   PROCEDURE     }  CREATE PROCEDURE public."spImportPnIDTags"(IN "_ProjectId" uuid, IN "_CreatedBy" uuid)
    LANGUAGE plpgsql
    AS $$

DECLARE
  "_Process" character varying(255);
  "_Subprocess" character varying(255);
  "_Stream" character varying(50);
  "_Sequencenumber" character varying(10);
  "_Equipmentidentifier" character varying(10);
  "_Equipmentcode" character varying(50);
  "_Suffix" character varying(50);
  "_Tagid" uuid;
  "_Tag" character varying(25);
  "_Description" character varying(255);
  "_Switches" character varying(100);
  "_Pipelinetag" character varying(50);
  "_Onskid" character varying(50);
  "_Failstate" character varying(255);
  "_Pnpid" int;
  "_Docid" uuid;
  "_Docnum" character varying(255);
  "_Docver" character varying(255);
  "_Docrev" character varying(255);
  "_Skidid" uuid;
  "_Failstateid" uuid;
  "pnid" refcursor;
  "_Vdpdocnum" character varying(255);
  "_Skidtagid" uuid;

BEGIN

	--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	--BEGIN  --(EXCEPTION)

		
		IF EXISTS (select * from "SSISEquipmentList") THEN 
			delete from "PnIdTag" where "PnIdTag"."Source"='E';
		END IF;
		IF EXISTS (select * from "SSISInstruments") THEN 
			delete from "PnIdTag" where "PnIdTag"."Source"='I';
		END IF;
		IF EXISTS (select * from "SSISValveList") THEN 
			delete from "PnIdTag" where "PnIdTag"."Source"='V';
		END IF;
		IF EXISTS (select * from "SSISFittings") THEN 
			delete from "PnIdTag" where "PnIdTag"."Source"='F';
		END IF;

		OPEN "pnid" for 
			select cast("l"."PnPId" as int) as "_Pnpid", "l"."Tag", "l"."DWGTitle","l"."Rev","l"."Version" ,"l"."Description",NULL,NULL, 
				"l"."ProcessNumber", "l"."SubProcess", "l"."Stream", "l"."EquipmentCode", "l"."SequenceNumber", "l"."EquipmentIdentifier", 
				"l"."OnSkid", NULL
			from "SSISEquipmentList" "l"
			union
			select cast("l"."PnPId" as int) as "_Pnpid", "l"."Tag","l"."DWGTitle","l"."Rev","l"."Version","l"."Description","l"."Switches","l"."PipeLinesTag" ,
				"l"."ProcessNumber", "l"."SubProcess", "l"."Stream", "l"."EquipmentCode", "l"."SequenceNumber", "l"."EquipmentIdentifier", 
				"l"."OnSkid", "l"."Failure"	
			from "SSISValveList" "l" 
			union
			select cast("l"."PnPId" as int) as "_Pnpid", "l"."Tag","l"."DWGTitle","l"."Rev","l"."Version","l"."Description",NULL,"l"."PipeLinesTag" ,
				"l"."ProcessNumber", "l"."SubProcess", "l"."Stream", "l"."EquipmentCode", "l"."SequenceNumber", "l"."EquipmentIdentifier", 
				NULL, NULL	
			from "SSISInstruments" "l" 
			union
			select cast("l"."PnPId" as int) as "_Pnpid", "l"."Tag","l"."DWGTitle","l"."Rev","l"."Version","l"."Description",NULL,NULL ,
				"l"."ProcessNumber", "l"."SubProcess", "l"."Stream", "l"."EquipmentCode", "l"."SequenceNumber", "l"."EquipmentIdentifier", 
				"l"."OnSkid", NULL
			from "SSISFittings" "l";
		while(1=1) LOOP
			fetch next from "pnid" into "_Pnpid","_Tag","_Docnum","_Docrev","_Docver","_Description","_Switches","_Pipelinetag",
				"_Process","_Subprocess","_Stream","_Equipmentcode","_Sequencenumber","_Equipmentidentifier","_Onskid","_Failstate";
			
			IF Not found THEN EXIT;
			END IF;
		
			IF (substring("_Tag" FROM 1 FOR 3) ~ '[0-9][0-9][0-9]') = false THEN
				RAISE WARNING '%', FORMAT('invalid tag %s (skipped)', "_Tag");
				continue;
			END IF;
			
			"_Vdpdocnum" := "_Docnum" || COALESCE('-'||"_Docrev" || COALESCE('-'||"_Docver",''),'');

			"_Docid":=null;
			SELECT "doc"."Id" INTO "_Docid"
			FROM "ReferenceDocument" AS "doc" 
				INNER JOIN "ReferenceDocumentType" AS "doctype" ON "doctype"."Type" = 'P&ID'
			WHERE "doc"."DocumentNumber" = "_Docnum"
				AND COALESCE("doc"."Version", '') = COALESCE("_Docver",'')
				AND COALESCE("doc"."Revision",'') = COALESCE("_Docrev",'');
				IF "_Docid" is null THEN
				
				CALL public."spCreateReferenceDocument"("_ReferenceDocumentType" => 'P&ID',
					"_DocumentNumber" => "_Vdpdocnum",
					"_Version" => "_Docver",
					"_Revision" => "_Docrev",
					"_ProjectId" => "_ProjectId",
					"_ReferenceDocumentId" => "_Docid",
					"_CreatedBy" => "_CreatedBy");
					
			END IF;

			"_Tagid" := null;
			
			select "Id" INTO "_Tagid" from "Tag" where "TagName"="_Tag";
			
			IF "_Tagid" is null THEN
				CALL public."spCreateTag"("_Tag" => "_Tag",
					"_Process" => "_Process",
					"_SubProcess" => "_Subprocess",
					"_Stream" => "_Stream",
					"_SequenceNumber" => "_Sequencenumber",
					"_EquipmentIdentifier" => "_Equipmentidentifier",
					"_EquipmentCode" => "_Equipmentcode",
					"_Suffix" => "_Suffix",
					"_CreateMissing" => true,
					"_Quiet" => false,
					"_ProjectId" => "_ProjectId",
					"_TagId" => "_Tagid",
										 "_CreatedBy" => "_CreatedBy");
			END IF;

			"_Skidid" := null;
			IF "_Onskid" is not null and "_Onskid" != '' THEN
				select "Skid"."Id" INTO "_Skidid" from "Skid" inner join "Tag" on "Tag"."Id"="Skid"."TagId" where "Tag"."TagName"="_Onskid";
				IF "_Skidid" is null THEN
					
				IF (regexp_matches(substring("_Onskid", 1, 3), '[0-9][0-9][0-9]') IS NULL) = false THEN
						RAISE WARNING '%', FORMAT('invalid skid tag %s (skipped)', "_Onskid");
					else
					RAISE NOTICE '_Onskid: %', "_Onskid";
						CALL public."spCreateSkid"("_SkidTag" => "_Onskid",
							"_EquipmentCode" => 'K',
							"_Quiet" => 'true',
							"_SkidId" => "_Skidid",
							"_ProjectId" => "_ProjectId",
							"_TagId" => "_Skidtagid",
							"_CreatedBy" => "_CreatedBy");
					END IF;
				END IF;
			END IF;
		
	
			"_Failstateid" := null;
			IF "_Failstate" is not null and "_Failstate" != '' THEN
				select "Id" INTO "_Failstateid" from "FailState" where "FailState"."FailStateName"="_Failstate";
				IF "_Failstateid" is null THEN
					"_Failstateid" := uuid_in(md5(random()::text || random()::text)::cstring);
					insert into "FailState"("Id","FailStateName","CreatedBy","CreatedDate","IsActive","IsDeleted") values (
						"_Failstateid","_Failstate","_CreatedBy",timezone('utc', now()),true,false);
				END IF;
			END IF;

			IF NOT EXISTS(select "Id" from "PnIdTag" where "TagId"="_Tagid") THEN
			
				insert into "PnIdTag"("Id", "PnPId", "DocumentReferenceId", "Description", "Switches", "PipelineTag", "TagId", "SkidId", "FailStateId",
									 "CreatedBy","CreatedDate","IsActive","IsDeleted")
				values (uuid_in(md5(random()::text || random()::text)::cstring), "_Pnpid", "_Docid", "_Description", "_Switches", "_Pipelinetag", "_Tagid", "_Skidid", "_Failstateid",
					  "_CreatedBy",timezone('utc', now()),true,false);
			END IF;
		END LOOP;
		close "pnid";

		delete from "SSISEquipmentList";
		delete from "SSISFittings";
		delete from "SSISInstruments";
		delete from "SSISValveList";

		-- COMMIT;
	--EXCEPTION WHEN OTHERS THEN
		--RAISE NOTICE '% %', SQLERRM, SQLSTATE;
		--CALL public."usp_GetErrorInfo"();
		 --ROLLBACK;
		-- COMMIT;
	--END;
	

	--RETURN;
END; 
$$;
 V   DROP PROCEDURE public."spImportPnIDTags"(IN "_ProjectId" uuid, IN "_CreatedBy" uuid);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            {           1255    73072    spSparesReport(uuid, refcursor) 	   PROCEDURE     `  CREATE PROCEDURE public."spSparesReport"(IN "_ProjectId" uuid, INOUT "resultData" refcursor)
    LANGUAGE plpgsql
    AS $_$


BEGIN

CREATE TEMP TABLE "_Capacity"("Total Channels" int, "Used Channels" int, "Rack" character varying(25), "PLC Number" character varying(25), "Nature of Signal" character varying(10)) ON COMMIT DROP;

INSERT INTO "_Capacity"
	SELECT
		SUM(CASE
            WHEN "No of Slots or Channels" ~ E'^\\d+$' THEN CAST("No of Slots or Channels" AS INTEGER)
            ELSE null
        END) AS "Total Channels",
		0 AS "Used Channels",
		"View_NonInstrumentList"."Connection Parent" AS "Rack",
		"View_NonInstrumentList"."PLC Number",
		"View_NonInstrumentList"."Nature of Signal"
	FROM "View_NonInstrumentList"
	WHERE "ProjectId" = "_ProjectId"
	AND "View_NonInstrumentList"."Nature of Signal" NOT IN ('DP', 'PA')
	AND "Device Type" = 'Slot number in a Rack'
	AND "View_NonInstrumentList"."IsDeleted" = false
	GROUP BY
		"View_NonInstrumentList"."Connection Parent",
		"View_NonInstrumentList"."PLC Number",
		"View_NonInstrumentList"."Nature of Signal";

--RAISE WARNING 'Nature', "Nature of Signal";
UPDATE "_Capacity"
	SET "Used Channels" = public."fnSlotChannelsInUseByRack"("Rack", "Nature of Signal", "_ProjectId")
	where "Rack" is not null and "Nature of Signal" is not null;

Open "resultData" FOR
SELECT * FROM "_Capacity";

RETURN;

END;
$_$;
 \   DROP PROCEDURE public."spSparesReport"(IN "_ProjectId" uuid, INOUT "resultData" refcursor);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            |           1255    73079 (   spSparesReportNoSDetail(uuid, refcursor) 	   PROCEDURE     z  CREATE PROCEDURE public."spSparesReportNoSDetail"(IN "_ProjectId" uuid, INOUT "resultData" refcursor)
    LANGUAGE plpgsql
    AS $$


BEGIN

CREATE TEMP TABLE "_Capacity"(
	"PLC Number" character varying(25),
	"Rack" character varying(25),
	"Total Channels" INT,
	"Used Channels" INT,
	"Slot Number" INT,
	"Nature Of Signal" character varying(10)
) ON COMMIT DROP;

INSERT INTO "_Capacity"
SELECT
	"View_NonInstrumentList"."PLC Number",
	"View_NonInstrumentList"."Connection Parent" AS "Rack",
	COALESCE(CAST("View_NonInstrumentList"."No of Slots or Channels" AS INTEGER), null) AS "Total Channels",
	count(distinct "View_DeviceRackAttributesInColumns"."ChannelNo") AS "Used Channels",
	COALESCE(CAST("View_NonInstrumentList"."Slot Number" AS real), 0) AS "Slot Number",
	"View_DeviceRackAttributesInColumns"."NatureOfSignalName" AS "Nature Of Signal"
FROM "View_NonInstrumentList"
	LEFT OUTER JOIN "View_DeviceRackAttributesInColumns"
		ON "View_DeviceRackAttributesInColumns"."RackNo" = "View_NonInstrumentList"."Connection Parent"
		AND "View_DeviceRackAttributesInColumns"."SlotNo" =   COALESCE(CAST("View_NonInstrumentList"."Slot Number" AS REAL), 0)
	INNER JOIN "Device" on "Device"."Id"="View_DeviceRackAttributesInColumns"."Id"
WHERE "View_NonInstrumentList"."ProjectId" = "_ProjectId"
	AND "View_NonInstrumentList"."IsDeleted" = false
	AND "View_NonInstrumentList"."Device Type"='Slot number in a Rack'
	AND "Device"."IsDeleted"=false
	AND "Device"."IsInstrument"<>'-'
group by
	"View_DeviceRackAttributesInColumns"."RackNo",
	"View_DeviceRackAttributesInColumns"."NatureOfSignalName",
	"View_NonInstrumentList"."PLC Number",
	"View_NonInstrumentList"."Connection Parent",
	"View_NonInstrumentList"."No of Slots or Channels",
	"View_NonInstrumentList"."Slot Number"
order by
	"View_DeviceRackAttributesInColumns"."RackNo",
	"View_NonInstrumentList"."Slot Number";

INSERT INTO "_Capacity"
SELECT
	'ALL PLCs',
	'ALL Racks',
	SUM("_Capacity"."Total Channels"),
	SUM("_Capacity"."Used Channels"),
	NULL,
	"_Capacity"."Nature Of Signal"
FROM "_Capacity"
GROUP BY "_Capacity"."Nature Of Signal";

Open "resultData" FOR
SELECT * FROM "_Capacity";

RETURN;

END;
$$;
 e   DROP PROCEDURE public."spSparesReportNoSDetail"(IN "_ProjectId" uuid, INOUT "resultData" refcursor);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            }           1255    73082 )   spSparesReportPLCSummary(uuid, refcursor) 	   PROCEDURE     u  CREATE PROCEDURE public."spSparesReportPLCSummary"(IN "_ProjectId" uuid, INOUT "resultData" refcursor)
    LANGUAGE plpgsql
    AS $_$


BEGIN

CREATE TEMP TABLE "_Capacity"("Total Channels" INT, "Used Channels" INT, "PLC Number" character varying(25), "Nature of Signal" character varying(10)) ON COMMIT DROP;

INSERT INTO "_Capacity"
	SELECT
		SUM(CASE
            WHEN "No of Slots or Channels" ~ E'^\\d+$' THEN CAST("No of Slots or Channels" AS INTEGER)
            ELSE null
        END) AS "Total Channels",
		0::int AS "Used Channels",
		"View_NonInstrumentList"."PLC Number",
		"View_NonInstrumentList"."Nature of Signal"
	FROM "View_NonInstrumentList"
	WHERE "ProjectId" = "_ProjectId"
	AND "View_NonInstrumentList"."Nature of Signal" NOT IN ('DP', 'PA')
	AND "Device Type" = 'Slot number in a Rack'
	AND "View_NonInstrumentList"."IsDeleted" = false
	GROUP BY
		"View_NonInstrumentList"."PLC Number",
		"View_NonInstrumentList"."Nature of Signal";

	UPDATE "_Capacity"
 	SET "Used Channels" = public."fnSlotChannelsInUseByPLC"("PLC Number", "Nature of Signal", "_ProjectId")
	where "PLC Number" is not null and "Nature of Signal" is not null;

 	INSERT INTO "_Capacity"
 	SELECT SUM("Total Channels"), SUM("Used Channels"), 'Total For All PLCs', "Nature of Signal"
 	FROM "_Capacity"
 	GROUP BY "Nature of Signal";

	Open "resultData" FOR
	 SELECT * FROM "_Capacity";

	return;
END;
$_$;
 f   DROP PROCEDURE public."spSparesReportPLCSummary"(IN "_ProjectId" uuid, INOUT "resultData" refcursor);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            X           1255    73035    usp_GetErrorInfo() 	   PROCEDURE     Y  CREATE PROCEDURE public."usp_GetErrorInfo"()
    LANGUAGE plpgsql
    AS $$


DECLARE
    "_sqlstate" character varying;
	"_severity" character varying;
    "_message" character varying;
	"_line" character varying;
	"_procedure" character varying;
BEGIN
    BEGIN
         
     EXCEPTION WHEN OTHERS THEN
        "_sqlstate" := SQLSTATE;
		"_message" := SQLERRM;
		"_severity" := SQLSTATE;
		"_line" := PG_EXCEPTION_LINE;
		SELECT "ProName" INTO "_procedure"
		FROM pg_stat_activity
		WHERE pg_backend_pid() = pg_stat_activity.pid;
    END;

    RAISE NOTICE 'ErrorNumber: %', "_sqlstate";
	RAISE NOTICE 'ErrorSeverity: %', "_severity";
	RAISE NOTICE 'ErrorState: %', substring("_sqlstate" FROM 3 FOR 2);
	RAISE NOTICE 'ErrorLine: %', "_line";
	RAISE NOTICE 'ErrorMessage: %', "_message";
	RAISE NOTICE 'ErrorProcedure: %', "_procedure";
   
    
END 
$$;
 ,   DROP PROCEDURE public."usp_GetErrorInfo"();
       public          FMxHWQ43Xh2rpTegRGYBV9    false    5            �           1255    72891    Aggregate_Concat(text) 	   AGGREGATE     i   CREATE AGGREGATE public."Aggregate_Concat"(text) (
    SFUNC = public.fn_concat_agg,
    STYPE = text
);
 0   DROP AGGREGATE public."Aggregate_Concat"(text);
       public          FMxHWQ43Xh2rpTegRGYBV9    false    339    5            �           0    0    COLUMN pg_config.name    ACL     D   GRANT SELECT(name) ON TABLE pg_catalog.pg_config TO azure_pg_admin;
       
   pg_catalog          azuresu    false    128            �           0    0    COLUMN pg_config.setting    ACL     G   GRANT SELECT(setting) ON TABLE pg_catalog.pg_config TO azure_pg_admin;
       
   pg_catalog          azuresu    false    128            �           0    0 $   COLUMN pg_hba_file_rules.line_number    ACL     S   GRANT SELECT(line_number) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;
       
   pg_catalog          azuresu    false    124            �           0    0    COLUMN pg_hba_file_rules.type    ACL     L   GRANT SELECT(type) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;
       
   pg_catalog          azuresu    false    124            �           0    0 !   COLUMN pg_hba_file_rules.database    ACL     P   GRANT SELECT(database) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;
       
   pg_catalog          azuresu    false    124            �           0    0 "   COLUMN pg_hba_file_rules.user_name    ACL     Q   GRANT SELECT(user_name) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;
       
   pg_catalog          azuresu    false    124            �           0    0     COLUMN pg_hba_file_rules.address    ACL     O   GRANT SELECT(address) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;
       
   pg_catalog          azuresu    false    124            �           0    0     COLUMN pg_hba_file_rules.netmask    ACL     O   GRANT SELECT(netmask) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;
       
   pg_catalog          azuresu    false    124            �           0    0 $   COLUMN pg_hba_file_rules.auth_method    ACL     S   GRANT SELECT(auth_method) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;
       
   pg_catalog          azuresu    false    124            �           0    0     COLUMN pg_hba_file_rules.options    ACL     O   GRANT SELECT(options) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;
       
   pg_catalog          azuresu    false    124            �           0    0    COLUMN pg_hba_file_rules.error    ACL     M   GRANT SELECT(error) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;
       
   pg_catalog          azuresu    false    124            �           0    0 ,   COLUMN pg_replication_origin_status.local_id    ACL     [   GRANT SELECT(local_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;
       
   pg_catalog          azuresu    false    174            �           0    0 /   COLUMN pg_replication_origin_status.external_id    ACL     ^   GRANT SELECT(external_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;
       
   pg_catalog          azuresu    false    174            �           0    0 .   COLUMN pg_replication_origin_status.remote_lsn    ACL     ]   GRANT SELECT(remote_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;
       
   pg_catalog          azuresu    false    174            �           0    0 -   COLUMN pg_replication_origin_status.local_lsn    ACL     \   GRANT SELECT(local_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;
       
   pg_catalog          azuresu    false    174            �           0    0     COLUMN pg_shmem_allocations.name    ACL     O   GRANT SELECT(name) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;
       
   pg_catalog          azuresu    false    129            �           0    0    COLUMN pg_shmem_allocations.off    ACL     N   GRANT SELECT(off) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;
       
   pg_catalog          azuresu    false    129            �           0    0     COLUMN pg_shmem_allocations.size    ACL     O   GRANT SELECT(size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;
       
   pg_catalog          azuresu    false    129            �           0    0 *   COLUMN pg_shmem_allocations.allocated_size    ACL     Y   GRANT SELECT(allocated_size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;
       
   pg_catalog          azuresu    false    129            �           0    0    COLUMN pg_statistic.starelid    ACL     K   GRANT SELECT(starelid) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.staattnum    ACL     L   GRANT SELECT(staattnum) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stainherit    ACL     M   GRANT SELECT(stainherit) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stanullfrac    ACL     N   GRANT SELECT(stanullfrac) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stawidth    ACL     K   GRANT SELECT(stawidth) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stadistinct    ACL     N   GRANT SELECT(stadistinct) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stakind1    ACL     K   GRANT SELECT(stakind1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stakind2    ACL     K   GRANT SELECT(stakind2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stakind3    ACL     K   GRANT SELECT(stakind3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stakind4    ACL     K   GRANT SELECT(stakind4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stakind5    ACL     K   GRANT SELECT(stakind5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.staop1    ACL     I   GRANT SELECT(staop1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.staop2    ACL     I   GRANT SELECT(staop2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.staop3    ACL     I   GRANT SELECT(staop3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.staop4    ACL     I   GRANT SELECT(staop4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.staop5    ACL     I   GRANT SELECT(staop5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stacoll1    ACL     K   GRANT SELECT(stacoll1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stacoll2    ACL     K   GRANT SELECT(stacoll2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stacoll3    ACL     K   GRANT SELECT(stacoll3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stacoll4    ACL     K   GRANT SELECT(stacoll4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stacoll5    ACL     K   GRANT SELECT(stacoll5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stanumbers1    ACL     N   GRANT SELECT(stanumbers1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stanumbers2    ACL     N   GRANT SELECT(stanumbers2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stanumbers3    ACL     N   GRANT SELECT(stanumbers3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stanumbers4    ACL     N   GRANT SELECT(stanumbers4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stanumbers5    ACL     N   GRANT SELECT(stanumbers5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stavalues1    ACL     M   GRANT SELECT(stavalues1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stavalues2    ACL     M   GRANT SELECT(stavalues2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stavalues3    ACL     M   GRANT SELECT(stavalues3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stavalues4    ACL     M   GRANT SELECT(stavalues4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_statistic.stavalues5    ACL     M   GRANT SELECT(stavalues5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;
       
   pg_catalog          azuresu    false    69            �           0    0    COLUMN pg_subscription.oid    ACL     I   GRANT SELECT(oid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;
       
   pg_catalog          azuresu    false    94            �           0    0    COLUMN pg_subscription.subdbid    ACL     M   GRANT SELECT(subdbid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;
       
   pg_catalog          azuresu    false    94            �           0    0    COLUMN pg_subscription.subname    ACL     M   GRANT SELECT(subname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;
       
   pg_catalog          azuresu    false    94            �           0    0    COLUMN pg_subscription.subowner    ACL     N   GRANT SELECT(subowner) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;
       
   pg_catalog          azuresu    false    94            �           0    0 !   COLUMN pg_subscription.subenabled    ACL     P   GRANT SELECT(subenabled) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;
       
   pg_catalog          azuresu    false    94            �           0    0 "   COLUMN pg_subscription.subconninfo    ACL     Q   GRANT SELECT(subconninfo) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;
       
   pg_catalog          azuresu    false    94            �           0    0 "   COLUMN pg_subscription.subslotname    ACL     Q   GRANT SELECT(subslotname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;
       
   pg_catalog          azuresu    false    94            �           0    0 $   COLUMN pg_subscription.subsynccommit    ACL     S   GRANT SELECT(subsynccommit) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;
       
   pg_catalog          azuresu    false    94            �           0    0 &   COLUMN pg_subscription.subpublications    ACL     U   GRANT SELECT(subpublications) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;
       
   pg_catalog          azuresu    false    94            (           1259    72376    AttributeDefinition    TABLE     �  CREATE TABLE public."AttributeDefinition" (
    "Id" uuid NOT NULL,
    "Category" character varying(255),
    "Name" character varying(255) NOT NULL,
    "Description" character varying(255),
    "ValueType" character varying(20),
    "Inherit" boolean NOT NULL,
    "Private" boolean NOT NULL,
    "Required" boolean NOT NULL,
    "DeviceTypeId" uuid,
    "DeviceModelId" uuid,
    "NatureOfSignalId" uuid,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 )   DROP TABLE public."AttributeDefinition";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            1           1259    72596    AttributeValue    TABLE     �  CREATE TABLE public."AttributeValue" (
    "Id" uuid NOT NULL,
    "Revision" character varying(20),
    "Unit" character varying(20),
    "Requirement" character varying(255),
    "Value" character varying(255),
    "ItemNumber" character varying(20),
    "IncludeInDatasheet" boolean NOT NULL,
    "DeviceId" uuid,
    "DeviceTypeId" uuid,
    "DeviceModelId" uuid,
    "NatureOfSignalId" uuid,
    "AttributeDefinitionId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 $   DROP TABLE public."AttributeValue";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            )           1259    72398    Cable    TABLE     �  CREATE TABLE public."Cable" (
    "Id" uuid NOT NULL,
    "Type" character varying(50) NOT NULL,
    "OriginDescription" character varying(100) NOT NULL,
    "DestDescription" character varying(100) NOT NULL,
    "Length" character varying(50) NOT NULL,
    "CableRoute" character varying(255) NOT NULL,
    "TagId" uuid NOT NULL,
    "OriginTagId" uuid NOT NULL,
    "DestTagId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."Cable";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                        1259    72008 	   ChangeLog    TABLE     �  CREATE TABLE public."ChangeLog" (
    "Id" uuid NOT NULL,
    "Context" character varying(255) NOT NULL,
    "ContextId" uuid NOT NULL,
    "EntityName" character varying(100) NOT NULL,
    "Status" character varying(20) NOT NULL,
    "OriginalValues" character varying(4000) NOT NULL,
    "NewValues" character varying(4000) NOT NULL,
    "ProjectId" uuid,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone,
    "EntityId" uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL
);
    DROP TABLE public."ChangeLog";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            2           1259    72628    ControlSystemHierarchy    TABLE     �  CREATE TABLE public."ControlSystemHierarchy" (
    "Id" uuid NOT NULL,
    "Instrument" boolean NOT NULL,
    "ParentDeviceId" uuid NOT NULL,
    "ChildDeviceId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 ,   DROP TABLE public."ControlSystemHierarchy";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            0           1259    72519    Device    TABLE     �  CREATE TABLE public."Device" (
    "Id" uuid NOT NULL,
    "ServiceDescription" character varying(32),
    "LineVesselNumber" character varying(255),
    "VendorSupply" boolean,
    "SerialNumber" character varying(50),
    "HistoricalLogging" boolean,
    "HistoricalLoggingFrequency" double precision,
    "HistoricalLoggingResolution" double precision,
    "Revision" integer NOT NULL,
    "RevisionChanges" character varying(1000),
    "Service" character varying(50),
    "Variable" character varying(50),
    "IsInstrument" character varying(1) NOT NULL,
    "TagId" uuid NOT NULL,
    "DeviceTypeId" uuid NOT NULL,
    "DeviceModelId" uuid,
    "ProcessLevelId" uuid,
    "ServiceZoneId" uuid,
    "ServiceBankId" uuid,
    "ServiceTrainId" uuid,
    "NatureOfSignalId" uuid,
    "PanelTagId" uuid,
    "SkidTagId" uuid,
    "StandTagId" uuid,
    "JunctionBoxTagId" uuid,
    "FailStateId" uuid,
    "SubSystemId" uuid,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."Device";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            4           1259    72658    DeviceAttributeValue    TABLE     �  CREATE TABLE public."DeviceAttributeValue" (
    "Id" uuid NOT NULL,
    "DeviceId" uuid NOT NULL,
    "AttributeValueId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 *   DROP TABLE public."DeviceAttributeValue";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72015    DeviceClassification    TABLE     �  CREATE TABLE public."DeviceClassification" (
    "Id" uuid NOT NULL,
    "Classification" character varying(20) NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 *   DROP TABLE public."DeviceClassification";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            !           1259    72265    DeviceModel    TABLE     �  CREATE TABLE public."DeviceModel" (
    "Id" uuid NOT NULL,
    "Model" character varying(255) NOT NULL,
    "Description" character varying(255),
    "ManufacturerId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 !   DROP TABLE public."DeviceModel";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72020 
   DeviceType    TABLE     �  CREATE TABLE public."DeviceType" (
    "Id" uuid NOT NULL,
    "Type" character varying(50) NOT NULL,
    "Description" character varying(100),
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
     DROP TABLE public."DeviceType";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72025    EquipmentCode    TABLE     �  CREATE TABLE public."EquipmentCode" (
    "Id" uuid NOT NULL,
    "Code" character varying(50) NOT NULL,
    "Descriptor" character varying(100),
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 #   DROP TABLE public."EquipmentCode";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72030 	   FailState    TABLE     �  CREATE TABLE public."FailState" (
    "Id" uuid NOT NULL,
    "FailStateName" character varying(255) NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."FailState";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72035    GSDType    TABLE     �  CREATE TABLE public."GSDType" (
    "Id" uuid NOT NULL,
    "GSDTypeName" character varying(255) NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."GSDType";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            $           1259    72309    GSDType_SignalExtension    TABLE     �  CREATE TABLE public."GSDType_SignalExtension" (
    "Id" uuid NOT NULL,
    "GSDTypeId" uuid NOT NULL,
    "SignalExtensionId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 -   DROP TABLE public."GSDType_SignalExtension";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            �            1259    71917    ICMDRole    TABLE     w  CREATE TABLE public."ICMDRole" (
    "Id" uuid NOT NULL,
    "DisplayName" text NOT NULL,
    "Description" text NOT NULL,
    "CreatedBy" uuid,
    "CreatedDate" timestamp with time zone NOT NULL,
    "UpdatedBy" uuid,
    "UpdatedDate" timestamp with time zone,
    "Name" character varying(256),
    "NormalizedName" character varying(256),
    "ConcurrencyStamp" text
);
    DROP TABLE public."ICMDRole";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            �            1259    71932    ICMDRoleClaim    TABLE     �   CREATE TABLE public."ICMDRoleClaim" (
    "Id" integer NOT NULL,
    "RoleId" uuid NOT NULL,
    "ClaimType" text,
    "ClaimValue" text
);
 #   DROP TABLE public."ICMDRoleClaim";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            �            1259    71931    ICMDRoleClaim_Id_seq    SEQUENCE     �   ALTER TABLE public."ICMDRoleClaim" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."ICMDRoleClaim_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          FMxHWQ43Xh2rpTegRGYBV9    false    249    5            �            1259    71924    ICMDUser    TABLE     I  CREATE TABLE public."ICMDUser" (
    "Id" uuid NOT NULL,
    "FirstName" character varying(50) NOT NULL,
    "LastName" character varying(50) NOT NULL,
    "IsActive" boolean NOT NULL,
    "IsDeleted" boolean NOT NULL,
    "CreatedBy" uuid,
    "CreatedDate" timestamp with time zone NOT NULL,
    "UserName" character varying(256),
    "NormalizedUserName" character varying(256),
    "Email" character varying(256),
    "NormalizedEmail" character varying(256),
    "EmailConfirmed" boolean NOT NULL,
    "PasswordHash" text,
    "SecurityStamp" text,
    "ConcurrencyStamp" text,
    "PhoneNumber" text,
    "PhoneNumberConfirmed" boolean NOT NULL,
    "TwoFactorEnabled" boolean NOT NULL,
    "LockoutEnd" timestamp with time zone,
    "LockoutEnabled" boolean NOT NULL,
    "AccessFailedCount" integer NOT NULL,
    "ProjectId" uuid
);
    DROP TABLE public."ICMDUser";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            �            1259    71945    ICMDUserClaim    TABLE     �   CREATE TABLE public."ICMDUserClaim" (
    "Id" integer NOT NULL,
    "UserId" uuid NOT NULL,
    "ClaimType" text,
    "ClaimValue" text
);
 #   DROP TABLE public."ICMDUserClaim";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            �            1259    71944    ICMDUserClaim_Id_seq    SEQUENCE     �   ALTER TABLE public."ICMDUserClaim" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."ICMDUserClaim_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          FMxHWQ43Xh2rpTegRGYBV9    false    5    251            �            1259    71957    ICMDUserLogin    TABLE     �   CREATE TABLE public."ICMDUserLogin" (
    "LoginProvider" text NOT NULL,
    "ProviderKey" text NOT NULL,
    "ProviderDisplayName" text,
    "UserId" uuid NOT NULL
);
 #   DROP TABLE public."ICMDUserLogin";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            �            1259    71969    ICMDUserRole    TABLE     _   CREATE TABLE public."ICMDUserRole" (
    "UserId" uuid NOT NULL,
    "RoleId" uuid NOT NULL
);
 "   DROP TABLE public."ICMDUserRole";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            �            1259    71984    ICMDUserToken    TABLE     �   CREATE TABLE public."ICMDUserToken" (
    "UserId" uuid NOT NULL,
    "LoginProvider" text NOT NULL,
    "Name" text NOT NULL,
    "Value" text
);
 #   DROP TABLE public."ICMDUserToken";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72040    InstrumentListImport    TABLE     ]
  CREATE TABLE public."InstrumentListImport" (
    "Id" uuid NOT NULL,
    "ProcessNo" character varying(255),
    "SubProcess" character varying(255),
    "Stream" character varying(50),
    "EquipmentCode" character varying(50),
    "SequenceNumber" character varying(10),
    "EquipmentIdentifier" character varying(10),
    "Tag" character varying(50) NOT NULL,
    "ServiceDescription" character varying(255),
    "Manufacturer" character varying(255),
    "ModelNumber" character varying(255),
    "CalibratedRangeMin" real,
    "CalibratedRangeMax" real,
    "ProcessRangeMin" real,
    "ProcessRangeMax" real,
    "DataSheetNumber" character varying(255),
    "SheetNumber" character varying(255),
    "HookupDrawing" character varying(255),
    "TerminationDiagram" character varying(255),
    "PIDNumber" character varying(255),
    "NatureOfSignal" character varying(10),
    "GSDType" character varying(255),
    "ControlPanelNumber" character varying(25),
    "PLCNumber" character varying(25),
    "PLCSlotNumber" integer,
    "FieldPanelNumber" character varying(25),
    "DPDPCoupler" character varying(25),
    "DPPACoupler" character varying(25),
    "AFDHubNumber" character varying(25),
    "RackNo" character varying(25),
    "SlotNo" integer,
    "SlotNoExt" integer,
    "ChannelNo" integer,
    "ChannelNoExt" integer,
    "DPNodeAddress" integer,
    "PANodeAddress" integer,
    "Revision" integer NOT NULL,
    "RevisionChanges" character varying(1000),
    "Service" character varying(255),
    "Variable" character varying(255),
    "Train" character varying(255),
    "Units" character varying(255),
    "Area" character varying(100),
    "Bank" character varying(255),
    "InstparentTag" character varying(25),
    "Plant" character varying(255),
    "SubPlantArea" character varying(255),
    "VendorSupply" boolean,
    "SkidNo" character varying(25),
    "RLPosition" character varying(255),
    "LayoutDrawing" character varying(255),
    "ArchitectureDrawing" character varying(255),
    "JunctionBox" character varying(25),
    "FailState" character varying(255),
    "InstrumentStand" character varying(25),
    "WorkPackage" integer,
    "SystemNo" integer,
    "SubSystemNo" integer,
    "LineVesselNumber" character varying(255),
    "FunctionalDescDoc" character varying(255),
    "ProcurementPkgNum" character varying(255),
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 *   DROP TABLE public."InstrumentListImport";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            *           1259    72420    JunctionBox    TABLE     �  CREATE TABLE public."JunctionBox" (
    "Id" uuid NOT NULL,
    "Type" character varying(100),
    "Description" character varying(255),
    "TagId" uuid NOT NULL,
    "ReferenceDocumentId" uuid,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 !   DROP TABLE public."JunctionBox";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72047    Manufacturer    TABLE     �  CREATE TABLE public."Manufacturer" (
    "Id" uuid NOT NULL,
    "Name" character varying(255) NOT NULL,
    "Description" character varying(255),
    "Comment" character varying(255),
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 "   DROP TABLE public."Manufacturer";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            8           1259    73125 	   MenuItems    TABLE     &  CREATE TABLE public."MenuItems" (
    "Id" uuid NOT NULL,
    "MenuName" text,
    "ControllerName" text,
    "MenuDescription" text,
    "Url" text,
    "Icon" text,
    "SortOrder" integer NOT NULL,
    "ParentMenuId" uuid,
    "IsPermission" boolean NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."MenuItems";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            9           1259    73137    MenuPermission    TABLE     �  CREATE TABLE public."MenuPermission" (
    "Id" uuid NOT NULL,
    "MenuId" uuid NOT NULL,
    "RoleId" uuid NOT NULL,
    "IsGranted" boolean NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 $   DROP TABLE public."MenuPermission";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            ;           1259    73166    MetaData    TABLE     �  CREATE TABLE public."MetaData" (
    "Id" uuid NOT NULL,
    "Property" character varying(100) NOT NULL,
    "Value" text,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."MetaData";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72054    NatureOfSignal    TABLE     �  CREATE TABLE public."NatureOfSignal" (
    "Id" uuid NOT NULL,
    "NatureOfSignalName" character varying(10) NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 $   DROP TABLE public."NatureOfSignal";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            %           1259    72324    NatureOfSignalSignalExtension    TABLE     �  CREATE TABLE public."NatureOfSignalSignalExtension" (
    "Id" uuid NOT NULL,
    "NatureOfSignalId" uuid NOT NULL,
    "SignalExtensionId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 3   DROP TABLE public."NatureOfSignalSignalExtension";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            	           1259    72059    NonInstrumentListImport    TABLE       CREATE TABLE public."NonInstrumentListImport" (
    "Id" uuid NOT NULL,
    "ProcessNo" character varying(255),
    "SubProcess" character varying(255),
    "Stream" character varying(255),
    "EquipmentCode" character varying(255),
    "SequenceNumber" character varying(255),
    "EquipmentIdentifier" character varying(255),
    "Tag" character varying(255),
    "DeviceType" character varying(255),
    "Description" character varying(255),
    "NatureOfSignal" character varying(255),
    "DPNodeAddress" integer,
    "NoSlotsChannels" integer,
    "ConnectionParent" character varying(255),
    "PLCNumber" character varying(255),
    "PLCSlotNumber" integer,
    "Location" character varying(255),
    "Manufacturer" character varying(255),
    "ModelNumber" character varying(255),
    "ModelDescription" character varying(255),
    "ArchitecturalDrawing" character varying(255),
    "ArchitecturalDrawingSheet" character varying(255),
    "Revision" integer,
    "RevisionChanges" character varying(255),
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 -   DROP TABLE public."NonInstrumentListImport";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            
           1259    72066 	   OLMDPTDPR    TABLE     @  CREATE TABLE public."OLMDPTDPR" (
    "Id" uuid NOT NULL,
    "No" double precision,
    "OLMDPTDPRDeviceTag" uuid NOT NULL,
    "PLCSlotNo" double precision,
    "DeviceType" character varying(255),
    "DevicePhysicalLocation" character varying(255),
    "PLCNo" character varying(255),
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."OLMDPTDPR";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72073    OMItem    TABLE     >  CREATE TABLE public."OMItem" (
    "Id" uuid NOT NULL,
    "ItemId" character varying(25) NOT NULL,
    "ItemDescription" character varying(500) NOT NULL,
    "ParentItemId" character varying(25) NOT NULL,
    "AssetTypeId" character varying(10) NOT NULL,
    "ProjectId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."OMItem";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72080    OMServiceDescriptionImport    TABLE     �  CREATE TABLE public."OMServiceDescriptionImport" (
    "Id" uuid NOT NULL,
    "Tag" character varying(50) NOT NULL,
    "ServiceDescription" character varying(255) NOT NULL,
    "Area" character varying(100),
    "Stream" character varying(50),
    "Bank" character varying(255),
    "Service" character varying(50),
    "Variable" character varying(50),
    "Train" character varying(255),
    "ProjectId" uuid,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 0   DROP TABLE public."OMServiceDescriptionImport";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            +           1259    72435    Panel    TABLE     �  CREATE TABLE public."Panel" (
    "Id" uuid NOT NULL,
    "Type" character varying(100),
    "Description" character varying(255),
    "TagId" uuid NOT NULL,
    "ReferenceDocumentId" uuid,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."Panel";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            :           1259    73155    PermissionManagement    TABLE     �  CREATE TABLE public."PermissionManagement" (
    "Id" uuid NOT NULL,
    "MenuPermissionId" uuid NOT NULL,
    "Operation" integer NOT NULL,
    "IsGranted" boolean NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 *   DROP TABLE public."PermissionManagement";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            /           1259    72494    PnIdTag    TABLE     x  CREATE TABLE public."PnIdTag" (
    "Id" uuid NOT NULL,
    "Description" character varying(255),
    "Switches" character varying(100),
    "PipelineTag" character varying(50),
    "PnPId" integer,
    "Source" character varying(1),
    "TagId" uuid NOT NULL,
    "DocumentReferenceId" uuid NOT NULL,
    "SkidId" uuid,
    "FailStateId" uuid,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."PnIdTag";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72092    Process    TABLE     �  CREATE TABLE public."Process" (
    "Id" uuid NOT NULL,
    "ProcessName" character varying(255) NOT NULL,
    "Description" character varying(255) NOT NULL,
    "ProjectId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."Process";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            "           1259    72277    ProcessHierarchy    TABLE     �  CREATE TABLE public."ProcessHierarchy" (
    "Id" uuid NOT NULL,
    "ChildProcessLevelId" uuid NOT NULL,
    "ParentProcessLevelId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 &   DROP TABLE public."ProcessHierarchy";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72104    ProcessLevel    TABLE     �  CREATE TABLE public."ProcessLevel" (
    "Id" uuid NOT NULL,
    "Name" character varying(255) NOT NULL,
    "Description" character varying(255),
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 "   DROP TABLE public."ProcessLevel";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            �            1259    72003    Project    TABLE     �  CREATE TABLE public."Project" (
    "Id" uuid NOT NULL,
    "Name" character varying(50) NOT NULL,
    "Description" character varying(255) NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."Project";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72111    ProjectUser    TABLE     �  CREATE TABLE public."ProjectUser" (
    "Id" uuid NOT NULL,
    "ProjectId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone,
    "Authorization" character varying(20)
);
 !   DROP TABLE public."ProjectUser";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            #           1259    72292    ReferenceDocument    TABLE     �  CREATE TABLE public."ReferenceDocument" (
    "Id" uuid NOT NULL,
    "DocumentNumber" character varying(100) NOT NULL,
    "URL" character varying(2000),
    "Description" character varying(500),
    "Version" character varying(50),
    "Revision" character varying(50),
    "Date" timestamp with time zone,
    "Sheet" character varying(50),
    "IsVDPDocumentNumber" boolean NOT NULL,
    "ProjectId" uuid NOT NULL,
    "ReferenceDocumentTypeId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 '   DROP TABLE public."ReferenceDocument";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            3           1259    72643    ReferenceDocumentDevice    TABLE     �  CREATE TABLE public."ReferenceDocumentDevice" (
    "Id" uuid NOT NULL,
    "DeviceId" uuid NOT NULL,
    "ReferenceDocumentId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 -   DROP TABLE public."ReferenceDocumentDevice";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72126    ReferenceDocumentType    TABLE     �  CREATE TABLE public."ReferenceDocumentType" (
    "Id" uuid NOT NULL,
    "Type" character varying(50) NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 +   DROP TABLE public."ReferenceDocumentType";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72131    Report    TABLE       CREATE TABLE public."Report" (
    "Id" uuid NOT NULL,
    "Group" character varying(50),
    "Name" character varying(50) NOT NULL,
    "URL" character varying(2000) NOT NULL,
    "Description" character varying(255),
    "Order" integer NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."Report";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72175    SSISEquipmentList    TABLE       CREATE TABLE public."SSISEquipmentList" (
    "Id" uuid NOT NULL,
    "PnPId" character varying(255),
    "ProcessNumber" character varying(255),
    "SubProcess" character varying(255),
    "Stream" character varying(255),
    "EquipmentCode" character varying(255),
    "SequenceNumber" character varying(255),
    "EquipmentIdentifier" character varying(255),
    "Tag" character varying(255),
    "DWGTitle" character varying(255),
    "Rev" character varying(255),
    "Version" character varying(255),
    "Description" character varying(255),
    "PipingClass" character varying(255),
    "OnSkid" character varying(255),
    "Function" character varying(255),
    "TrackingNumber" character varying(255),
    "ProjectId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 '   DROP TABLE public."SSISEquipmentList";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72182    SSISFittings    TABLE     �  CREATE TABLE public."SSISFittings" (
    "Id" uuid NOT NULL,
    "PnPId" character varying(255),
    "ProcessNumber" character varying(255),
    "SubProcess" character varying(255),
    "Stream" character varying(255),
    "EquipmentCode" character varying(255),
    "SequenceNumber" character varying(255),
    "EquipmentIdentifier" character varying(255),
    "Tag" character varying(255),
    "DWGTitle" character varying(255),
    "Rev" character varying(255),
    "Version" character varying(255),
    "Description" character varying(255),
    "PipingClass" character varying(255),
    "OnSkid" character varying(255),
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 "   DROP TABLE public."SSISFittings";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72189    SSISInstruments    TABLE     �  CREATE TABLE public."SSISInstruments" (
    "Id" uuid NOT NULL,
    "PnPId" character varying(255),
    "ProcessNumber" character varying(255),
    "SubProcess" character varying(255),
    "Stream" character varying(255),
    "EquipmentCode" character varying(255),
    "SequenceNumber" character varying(255),
    "EquipmentIdentifier" character varying(255),
    "Tag" character varying(255),
    "OnEquipment" character varying(255),
    "OnSkid" character varying(255),
    "Description" character varying(255),
    "FluidCode" character varying(255),
    "PipeLinesTag" character varying(255),
    "Size" character varying(255),
    "DWGTitle" character varying(255),
    "Rev" character varying(255),
    "Version" character varying(255),
    "To" character varying(255),
    "From" character varying(255),
    "TrackingNumber" character varying(255),
    "ProjectId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 %   DROP TABLE public."SSISInstruments";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72196    SSISInstrumentsVsStands110728    TABLE     �  CREATE TABLE public."SSISInstrumentsVsStands110728" (
    "Id" uuid NOT NULL,
    "DF" double precision,
    "PLCNumber" character varying(255),
    "ProcessNo" character varying(255),
    "SubProcess" character varying(255),
    "Stream" character varying(255),
    "EquipmentCode" character varying(255),
    "SequenceNumber" character varying(255),
    "EquipmentIdentifier" character varying(255),
    "Tag" character varying(255),
    "Function" character varying(255),
    "Manufacturer" character varying(255),
    "DatasheetNumber" character varying(255),
    "SheetNumber" double precision,
    "GeneralArrangement" character varying(255),
    "TerminationDiagram" character varying(255),
    "PIDNumber" character varying(255),
    "HubNumber" character varying(255),
    "VendorSkid" character varying(255),
    "StandReqd" double precision,
    "HookupDrawing" character varying(255),
    "InstrumentStandTAG" character varying(255),
    "InstrumentStandType" character varying(255),
    "AncillaryPlate" character varying(255),
    "Remark" character varying(255),
    "OldHOOKUP_172011" character varying(255),
    "OldStandTAG_172011" character varying(255),
    "OldStandTYPE_172011" character varying(255),
    "PDMSSTANDQUERYSTANDPRESENT" character varying(255),
    "PDMSALLINSTRU" character varying(255),
    "Working" character varying(255),
    "Working2" character varying(255),
    "F32" character varying(255),
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 3   DROP TABLE public."SSISInstrumentsVsStands110728";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72203    SSISStandList    TABLE       CREATE TABLE public."SSISStandList" (
    "Id" uuid NOT NULL,
    "Item" double precision,
    "Rev" character varying(255),
    "InstrumentStandTag" character varying(255),
    "InstrumentStandType" character varying(255),
    "Qrea" character varying(255),
    "QTY" double precision,
    "DrawingReference" character varying(255),
    "Figure" character varying(255),
    "AFD1" character varying(255),
    "AFD2" character varying(255),
    "AFD3" character varying(255),
    "AFDPlates" character varying(255),
    "DPH1" character varying(255),
    "DPH2" character varying(255),
    "DPHPlates" character varying(255),
    "Instrument1" character varying(255),
    "Instrument2" character varying(255),
    "Instrument3" character varying(255),
    "Instrument4" character varying(255),
    "ReasonsForChange" character varying(255),
    "ChangeBy" character varying(255),
    "F23" character varying(255),
    "F24" character varying(255),
    "F25" character varying(255),
    "F26" character varying(255),
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 #   DROP TABLE public."SSISStandList";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72210    SSISStandTypes    TABLE     �  CREATE TABLE public."SSISStandTypes" (
    "Id" uuid NOT NULL,
    "Item" character varying(255),
    "Rev" character varying(255),
    "InstrumentStandCode" character varying(255),
    "InstrumentStandType" character varying(255),
    "VendorReferenceDrawing" character varying(255),
    "QTY" double precision,
    "ProjectDrawingReference" character varying(255),
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 $   DROP TABLE public."SSISStandTypes";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72217    SSISValveList    TABLE     �  CREATE TABLE public."SSISValveList" (
    "Id" uuid NOT NULL,
    "PnPId" character varying(255),
    "ProcessNumber" character varying(255),
    "SubProcess" character varying(255),
    "Stream" character varying(255),
    "EquipmentCode" character varying(255),
    "SequenceNumber" character varying(255),
    "EquipmentIdentifier" character varying(255),
    "Tag" character varying(255),
    "DWGTitle" character varying(255),
    "Rev" character varying(255),
    "Version" character varying(255),
    "Description" character varying(255),
    "Size" character varying(255),
    "FluidCode" character varying(255),
    "PipeLinesTag" character varying(255),
    "PipingClass" character varying(255),
    "ClassName" character varying(255),
    "OnSkid" character varying(255),
    "Failure" character varying(255),
    "Switches" character varying(255),
    "From" character varying(255),
    "To" character varying(255),
    "Accessories" character varying(255),
    "DesignTemp" character varying(255),
    "NominalPressure" character varying(255),
    "ValveSpecNumber" character varying(255),
    "PNRating" character varying(255),
    "TrackingNumber" character varying(255),
    "ProjectId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 #   DROP TABLE public."SSISValveList";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72138    ServiceBank    TABLE     �  CREATE TABLE public."ServiceBank" (
    "Id" uuid NOT NULL,
    "Bank" character varying(255) NOT NULL,
    "ProjectId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 !   DROP TABLE public."ServiceBank";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72148    ServiceTrain    TABLE     �  CREATE TABLE public."ServiceTrain" (
    "Id" uuid NOT NULL,
    "Train" character varying(255) NOT NULL,
    "ProjectId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 "   DROP TABLE public."ServiceTrain";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72158    ServiceZone    TABLE     �  CREATE TABLE public."ServiceZone" (
    "Id" uuid NOT NULL,
    "Zone" character varying(100) NOT NULL,
    "Description" character varying(500),
    "Area" integer,
    "ProjectId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 !   DROP TABLE public."ServiceZone";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72170    SignalExtension    TABLE     %  CREATE TABLE public."SignalExtension" (
    "Id" uuid NOT NULL,
    "Extension" character varying(10) NOT NULL,
    "CBVariableType" character varying(10) NOT NULL,
    "PCS7VariableType" character varying(10) NOT NULL,
    "Kind" character varying(5) NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 %   DROP TABLE public."SignalExtension";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            ,           1259    72450    Skid    TABLE     �  CREATE TABLE public."Skid" (
    "Id" uuid NOT NULL,
    "Type" character varying(50),
    "Description" character varying(255),
    "TagId" uuid NOT NULL,
    "ReferenceDocumentId" uuid,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."Skid";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            -           1259    72465    Stand    TABLE     �  CREATE TABLE public."Stand" (
    "Id" uuid NOT NULL,
    "Type" character varying(255),
    "Area" character varying(30),
    "Description" character varying(255),
    "ReferenceDocumentId" uuid,
    "TagId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."Stand";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72224    Stream    TABLE     �  CREATE TABLE public."Stream" (
    "Id" uuid NOT NULL,
    "StreamName" character varying(50) NOT NULL,
    "Description" character varying(255),
    "ProjectId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."Stream";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72234 
   SubProcess    TABLE     �  CREATE TABLE public."SubProcess" (
    "Id" uuid NOT NULL,
    "SubProcessName" character varying(255) NOT NULL,
    "Description" character varying(255) NOT NULL,
    "ProjectId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
     DROP TABLE public."SubProcess";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            .           1259    72482 	   SubSystem    TABLE     �  CREATE TABLE public."SubSystem" (
    "Id" uuid NOT NULL,
    "Number" character varying(10) NOT NULL,
    "Description" character varying(500) NOT NULL,
    "SystemId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."SubSystem";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            '           1259    72364    System    TABLE     �  CREATE TABLE public."System" (
    "Id" uuid NOT NULL,
    "Number" character varying(10) NOT NULL,
    "Description" character varying(500) NOT NULL,
    "WorkAreaPackId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."System";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            &           1259    72339    Tag    TABLE     l  CREATE TABLE public."Tag" (
    "Id" uuid NOT NULL,
    "TagName" character varying(50) NOT NULL,
    "SequenceNumber" character varying(10),
    "EquipmentIdentifier" character varying(10),
    "ProcessId" uuid,
    "SubProcessId" uuid,
    "StreamId" uuid,
    "EquipmentCodeId" uuid,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone,
    "ProjectId" uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    "Field1String" character varying(10),
    "Field2String" character varying(10),
    "Field3String" character varying(10),
    "Field4String" character varying(10),
    "TagDescriptorId" uuid,
    "TagTypeId" uuid
);
    DROP TABLE public."Tag";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            6           1259    72765    TagDescriptor    TABLE     �  CREATE TABLE public."TagDescriptor" (
    "Id" uuid NOT NULL,
    "Name" character varying(50) NOT NULL,
    "Description" character varying(80),
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 #   DROP TABLE public."TagDescriptor";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            5           1259    72754    TagField    TABLE       CREATE TABLE public."TagField" (
    "Id" uuid NOT NULL,
    "Name" character varying(100),
    "Source" character varying(100),
    "Separator" character varying(20),
    "Position" integer NOT NULL,
    "ProjectId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."TagField";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            7           1259    72770    TagType    TABLE     �  CREATE TABLE public."TagType" (
    "Id" uuid NOT NULL,
    "Name" character varying(30) NOT NULL,
    "Description" character varying(80),
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
    DROP TABLE public."TagType";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5                       1259    72246    UIChangeLog    TABLE     �  CREATE TABLE public."UIChangeLog" (
    "Id" uuid NOT NULL,
    "Tag" character varying(50) NOT NULL,
    "PLCNumber" character varying(25),
    "Changes" text NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone,
    "Type" text DEFAULT ''::text NOT NULL
);
 !   DROP TABLE public."UIChangeLog";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            ?           1259    85103    View_AllAttributes    VIEW     �  CREATE VIEW public."View_AllAttributes" AS
 SELECT cache."DeviceId" AS "Id",
    def."Id" AS "AttributeDefinitionId",
    def."Name",
    def."ValueType",
    val."Id" AS "AttributeValueId",
    val."Value"
   FROM ((public."DeviceAttributeValue" cache
     JOIN public."AttributeValue" val ON ((val."Id" = cache."AttributeValueId")))
     JOIN public."AttributeDefinition" def ON ((def."Id" = val."AttributeDefinitionId")))
  WHERE (cache."IsDeleted" = false);
 '   DROP VIEW public."View_AllAttributes";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    296    296    305    305    305    308    308    308    296    5            C           1259    85123    View_AllDocuments    VIEW     y  CREATE VIEW public."View_AllDocuments" AS
 SELECT h."DeviceId",
    tp."Type",
        CASE
            WHEN (ref."IsVDPDocumentNumber" = true) THEN ((((ref."DocumentNumber")::text || COALESCE(('-'::text || (ref."Revision")::text), ''::text)) || COALESCE(('-'::text || (ref."Version")::text), ''::text)))::character varying
            ELSE ref."DocumentNumber"
        END AS "DocumentNumber",
    ref."Sheet"
   FROM ((public."ReferenceDocument" ref
     JOIN public."ReferenceDocumentDevice" h ON ((h."ReferenceDocumentId" = ref."Id")))
     JOIN public."ReferenceDocumentType" tp ON ((tp."Id" = ref."ReferenceDocumentTypeId")));
 &   DROP VIEW public."View_AllDocuments";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    291    291    291    307    307    291    291    291    272    272    291    5            D           1259    85128    View_Tag    VIEW     �  CREATE VIEW public."View_Tag" AS
 SELECT "Tag"."Id",
    "Tag"."TagName",
    "Process"."ProcessName",
    "SubProcess"."SubProcessName",
    "Stream"."StreamName",
    "EquipmentCode"."Code" AS "EquipmentCode",
    "Tag"."SequenceNumber",
    "Tag"."EquipmentIdentifier",
    "Tag"."ProjectId"
   FROM ((((public."Tag"
     LEFT JOIN public."Process" ON (("Process"."Id" = "Tag"."ProcessId")))
     LEFT JOIN public."SubProcess" ON (("SubProcess"."Id" = "Tag"."SubProcessId")))
     LEFT JOIN public."Stream" ON (("Stream"."Id" = "Tag"."StreamId")))
     LEFT JOIN public."EquipmentCode" ON (("EquipmentCode"."Id" = "Tag"."EquipmentCodeId")));
    DROP VIEW public."View_Tag";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    294    294    286    286    285    285    294    294    294    269    269    259    294    294    294    294    259    5                        1259    72253    WorkAreaPack    TABLE     �  CREATE TABLE public."WorkAreaPack" (
    "Id" uuid NOT NULL,
    "Number" character varying(10) NOT NULL,
    "Description" character varying(500) NOT NULL,
    "ProjectId" uuid NOT NULL,
    "CreatedBy" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "ModifiedBy" uuid,
    "ModifiedDate" timestamp with time zone,
    "IsDeleted" boolean NOT NULL,
    "DeletedBy" uuid,
    "DeletedDate" timestamp with time zone
);
 "   DROP TABLE public."WorkAreaPack";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            I           1259    85153    View_Device_Instruments    VIEW     
  CREATE VIEW public."View_Device_Instruments" AS
 SELECT "Device"."Id",
    "DeviceModel"."Model",
    "DeviceModel"."Description" AS "ModelDescription",
    "View_Tag"."TagName",
    "DeviceType"."Type",
    "View_Tag"."ProcessName",
    "ServiceZone"."Zone",
    "ServiceBank"."Bank",
    "Device"."Service",
    "NatureOfSignal"."NatureOfSignalName",
    "View_Tag"."SubProcessName",
    "View_Tag"."StreamName",
    "View_Tag"."EquipmentCode",
    "Device"."ServiceDescription",
    "Device"."LineVesselNumber",
    "Device"."VendorSupply",
    "FailState"."FailStateName",
    "Device"."Revision",
    "Device"."RevisionChanges",
    "Device"."ModifiedBy",
    "Device"."ModifiedDate",
    "Device"."IsDeleted",
    "Manufacturer"."Name" AS "Manufacturer",
    "Device"."Variable",
    "ServiceTrain"."Train",
    "Device"."DeviceModelId",
    "View_Tag"."SequenceNumber",
    "View_Tag"."EquipmentIdentifier",
    "Device"."PanelTagId",
    "Device"."SkidTagId",
    "Device"."StandTagId",
    "Device"."JunctionBoxTagId",
    "Device"."DeviceTypeId",
    "Device"."IsInstrument",
    "SubSystem"."Number" AS "SubSystem",
    "System"."Number" AS "System",
    "WorkAreaPack"."Number" AS "WorkAreaPack",
    "Device"."HistoricalLogging",
    "Device"."HistoricalLoggingFrequency",
    "Device"."HistoricalLoggingResolution",
    "View_Tag"."ProjectId",
    "Device"."IsActive"
   FROM ((((((public."DeviceModel"
     JOIN public."Manufacturer" ON (("DeviceModel"."ManufacturerId" = "Manufacturer"."Id")))
     RIGHT JOIN (public."ServiceTrain"
     RIGHT JOIN (public."DeviceType"
     RIGHT JOIN (public."FailState"
     RIGHT JOIN (((public."System"
     JOIN public."WorkAreaPack" ON (("System"."WorkAreaPackId" = "WorkAreaPack"."Id")))
     JOIN public."SubSystem" ON (("System"."Id" = "SubSystem"."SystemId")))
     RIGHT JOIN public."Device" ON (("Device"."SubSystemId" = "SubSystem"."Id"))) ON (("FailState"."Id" = "Device"."FailStateId"))) ON (("DeviceType"."Id" = "Device"."DeviceTypeId"))) ON (("ServiceTrain"."Id" = "Device"."ServiceTrainId"))) ON (("DeviceModel"."Id" = "Device"."DeviceModelId")))
     JOIN public."View_Tag" ON (("Device"."TagId" = "View_Tag"."Id")))
     LEFT JOIN public."NatureOfSignal" ON (("Device"."NatureOfSignalId" = "NatureOfSignal"."Id")))
     LEFT JOIN public."ServiceZone" ON (("Device"."ServiceZoneId" = "ServiceZone"."Id")))
     LEFT JOIN public."ServiceBank" ON (("Device"."ServiceBankId" = "ServiceBank"."Id")))
  WHERE ((("Device"."IsInstrument")::bpchar = 'Y'::bpchar) OR (("Device"."IsInstrument")::bpchar = 'B'::bpchar));
 ,   DROP VIEW public."View_Device_Instruments";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    275    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304    302    302    302    295    295    295    289    289    289    289    288    288    276    276    275    324    324    324    324    324    324    274    274    264    264    263    263    260    260    258    258    324    324    324    304    304    304    304    304    304    304    304    304    304    304    304    5            K           1259    86384    View_InstrumentListLive    VIEW       CREATE VIEW public."View_InstrumentListLive" AS
 SELECT "View_Device_Instruments"."Id" AS "DeviceId",
    "View_Device_Instruments"."ProcessName" AS "Process No",
    "View_Device_Instruments"."SubProcessName" AS "Sub Process",
    "View_Device_Instruments"."StreamName",
    "View_Device_Instruments"."EquipmentCode" AS "Equipment Code",
    "View_Device_Instruments"."SequenceNumber" AS "Sequence Number",
    "View_Device_Instruments"."EquipmentIdentifier" AS "Equipment Identifier",
    "View_Device_Instruments"."TagName",
    "View_Device_Instruments"."Type" AS "Device Type",
    "View_Device_Instruments"."IsInstrument",
    max((
        CASE
            WHEN (h."Instrument" = false) THEN pt."TagName"
            ELSE NULL::character varying
        END)::text) AS "Connection Parent Tag",
    max((
        CASE
            WHEN (h."Instrument" = true) THEN pt."TagName"
            ELSE NULL::character varying
        END)::text) AS "Instr Parent Tag",
    "View_Device_Instruments"."ServiceDescription" AS "Service Description",
    "View_Device_Instruments"."LineVesselNumber" AS "Line / Vessel Number",
    NULL::text AS "Plant",
    NULL::text AS "Area",
    "View_Device_Instruments"."VendorSupply" AS "Vendor Supply",
    skidtag."TagName" AS "Skid Number",
    standtag."TagName" AS "Stand Number",
    "View_Device_Instruments"."Manufacturer",
    "View_Device_Instruments"."Model" AS "Model Number",
    attrs."CalibratedRangeMin" AS "Calibrated Range (Min)",
    attrs."CalibratedRangeMax" AS "Calibrated Range (Max)",
    attrs."CalibratedRangeUnits" AS "CR Units",
    attrs."ProcessRangeMin" AS "Process Range (Min)",
    attrs."ProcessRangeMax" AS "Process Range (Max)",
    attrs."ProcessRangeUnits" AS "PR Units",
    attrs."RLPosition" AS "RL / Position",
    docs."DatasheetNumber" AS "Datasheet Number",
    docs."SheetNumber" AS "Sheet Number",
    docs."HookupDrawing" AS "Hook-up Drawing",
    docs."TerminationDiagram" AS "Termination Diagram",
    docs."PIDNumber" AS "P&Id Number",
    docs."LayoutDrawing" AS "Layout Drawing",
    docs."ArchitecturalDrawing" AS "Architectural Drawing",
    docs."FunctionalDescriptionDocument" AS "Functional Description Document",
    docs."ProductProcurementNumber" AS "Product Procurement Number",
    jbtag."TagName" AS "Junction Box Number",
    "View_Device_Instruments"."NatureOfSignalName" AS "Nature Of Signal",
    "View_Device_Instruments"."FailStateName" AS "Fail State",
    attrs."GSDType" AS "GSD Type",
    attrs."ControlPanelNumber" AS "Control Panel Number",
    attrs."PLCNumber" AS "PLC Number",
    attrs."PLCSlotNumber" AS "PLC Slot Number",
    "panelTag"."TagName" AS "Field Panel Number",
    attrs."DPDPCoupler" AS "DP/DP Coupler",
    attrs."DPPACoupler" AS "DP/PA Coupler",
    attrs."AFDHubNumber" AS "AFD / Hub Number",
    attrs."RackNo" AS "Rack No",
    attrs."SlotNo" AS "Slot No",
    attrs."ChannelNo" AS "Channel No",
    attrs."DPNodeAddress" AS "DP Node Address",
    attrs."PANodeAddress" AS "PA Node Address",
    "View_Device_Instruments"."Revision",
    "View_Device_Instruments"."RevisionChanges" AS "Revision Changes / Outstanding Comments",
    "View_Device_Instruments"."Zone",
    "View_Device_Instruments"."Bank",
    "View_Device_Instruments"."Service",
    "View_Device_Instruments"."Variable",
    "View_Device_Instruments"."Train",
    "View_Device_Instruments"."WorkAreaPack" AS "Work Area Pack",
    "View_Device_Instruments"."System" AS "System Code",
    "View_Device_Instruments"."SubSystem" AS "SubSystem Code",
    "View_Device_Instruments"."HistoricalLogging" AS "Historical Logging",
    "View_Device_Instruments"."HistoricalLoggingFrequency" AS "Historical Logging Frequency",
    "View_Device_Instruments"."HistoricalLoggingResolution" AS "Historical Logging Resolution",
    "View_Device_Instruments"."IsDeleted",
    "View_Device_Instruments"."ProjectId",
    "View_Device_Instruments"."IsActive"
   FROM (((((((((public."View_Device_Instruments"
     CROSS JOIN LATERAL public."fnGetDeviceAttributesInColumns"("View_Device_Instruments"."Id") attrs("GSDType", "ControlPanelNumber", "PLCSlotNumber", "DPNodeAddress", "PLCNumber", "DPDPCoupler", "AFDHubNumber", "ChannelNo", "DPPACoupler", "PANodeAddress", "RackNo", "SlotNo", "CalibratedRangeMin", "CalibratedRangeMax", "CalibratedRangeUnits", "ProcessRangeMin", "ProcessRangeMax", "ProcessRangeUnits", "RLPosition"))
     CROSS JOIN LATERAL public."fnGetDeviceDocumentsInColumns"("View_Device_Instruments"."Id") docs("DatasheetNumber", "SheetNumber", "HookupDrawing", "TerminationDiagram", "PIDNumber", "LayoutDrawing", "ArchitecturalDrawing", "FunctionalDescriptionDocument", "ProductProcurementNumber"))
     LEFT JOIN public."ControlSystemHierarchy" h ON ((h."ChildDeviceId" = "View_Device_Instruments"."Id")))
     LEFT JOIN public."Device" pd ON ((h."ParentDeviceId" = pd."Id")))
     LEFT JOIN public."Tag" pt ON ((pd."TagId" = pt."Id")))
     LEFT JOIN public."Tag" skidtag ON ((skidtag."Id" = "View_Device_Instruments"."SkidTagId")))
     LEFT JOIN public."Tag" standtag ON ((standtag."Id" = "View_Device_Instruments"."StandTagId")))
     LEFT JOIN public."Tag" jbtag ON ((jbtag."Id" = "View_Device_Instruments"."JunctionBoxTagId")))
     LEFT JOIN public."Tag" "panelTag" ON (("panelTag"."Id" = "View_Device_Instruments"."PanelTagId")))
  GROUP BY "View_Device_Instruments"."Id", "View_Device_Instruments"."ProcessName", "View_Device_Instruments"."SubProcessName", "View_Device_Instruments"."StreamName", "View_Device_Instruments"."EquipmentCode", "View_Device_Instruments"."SequenceNumber", "View_Device_Instruments"."EquipmentIdentifier", "View_Device_Instruments"."TagName", "View_Device_Instruments"."ServiceDescription", "View_Device_Instruments"."LineVesselNumber", "View_Device_Instruments"."VendorSupply", skidtag."TagName", standtag."TagName", "View_Device_Instruments"."Manufacturer", "View_Device_Instruments"."Model", attrs."CalibratedRangeMin", attrs."CalibratedRangeMax", attrs."CalibratedRangeUnits", attrs."ProcessRangeMin", attrs."ProcessRangeMax", attrs."ProcessRangeUnits", attrs."RLPosition", docs."DatasheetNumber", docs."SheetNumber", docs."HookupDrawing", docs."TerminationDiagram", docs."PIDNumber", docs."LayoutDrawing", docs."ArchitecturalDrawing", docs."FunctionalDescriptionDocument", docs."ProductProcurementNumber", jbtag."TagName", "View_Device_Instruments"."NatureOfSignalName", "View_Device_Instruments"."FailStateName", attrs."GSDType", attrs."ControlPanelNumber", attrs."PLCNumber", attrs."PLCSlotNumber", "panelTag"."TagName", attrs."DPDPCoupler", attrs."DPPACoupler", attrs."AFDHubNumber", attrs."RackNo", attrs."SlotNo", attrs."ChannelNo", attrs."DPNodeAddress", attrs."PANodeAddress", "View_Device_Instruments"."Revision", "View_Device_Instruments"."RevisionChanges", "View_Device_Instruments"."Zone", "View_Device_Instruments"."Bank", "View_Device_Instruments"."Service", "View_Device_Instruments"."Variable", "View_Device_Instruments"."Train", "View_Device_Instruments"."WorkAreaPack", "View_Device_Instruments"."System", "View_Device_Instruments"."SubSystem", "View_Device_Instruments"."HistoricalLogging", "View_Device_Instruments"."HistoricalLoggingFrequency", "View_Device_Instruments"."HistoricalLoggingResolution", "View_Device_Instruments"."IsInstrument", "View_Device_Instruments"."IsDeleted", "View_Device_Instruments"."ProjectId", "View_Device_Instruments"."IsActive", "View_Device_Instruments"."Type";
 ,   DROP VIEW public."View_InstrumentListLive";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    329    329    329    329    329    329    329    329    306    306    306    384    329    385    329    329    329    329    329    329    329    329    329    329    329    329    329    329    329    329    329    329    329    329    329    329    329    329    329    329    329    294    294    304    304    329    5            M           1259    86394    View_CountDPPADevices    VIEW       CREATE VIEW public."View_CountDPPADevices" AS
 SELECT "ProjectId",
    "PLC Number" AS "PLC_Number",
    "PLC Slot Number" AS "PLC_Slot_Number",
        CASE
            WHEN ("DP/DP Coupler" IS NOT NULL) THEN "DP/DP Coupler"
            ELSE "DP/PA Coupler"
        END AS "DP_or_PA_Coupler",
    "AFD / Hub Number" AS "AFD___Hub_Number",
        CASE
            WHEN ("DP/DP Coupler" IS NOT NULL) THEN count(*)
            ELSE (0)::bigint
        END AS "No__of_DP_Devices",
        CASE
            WHEN ("DP/DP Coupler" IS NULL) THEN count(*)
            ELSE (0)::bigint
        END AS "No__of_PA_Devices"
   FROM public."View_InstrumentListLive"
  WHERE ((("PLC Number" IS NOT NULL) AND ("PLC Slot Number" IS NOT NULL) AND ("DP/DP Coupler" IS NOT NULL) AND ("AFD / Hub Number" IS NOT NULL)) OR (("PLC Number" IS NOT NULL) AND ("PLC Slot Number" IS NOT NULL) AND ("AFD / Hub Number" IS NOT NULL) AND ("DP/PA Coupler" IS NOT NULL)))
  GROUP BY "ProjectId", "PLC Number", "PLC Slot Number", "DP/DP Coupler", "DP/PA Coupler", "AFD / Hub Number";
 *   DROP VIEW public."View_CountDPPADevices";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    331    331    331    331    331    331    5            E           1259    85133    View_Device    VIEW     �
  CREATE VIEW public."View_Device" AS
 SELECT "Device"."Id",
    "DeviceModel"."Model",
    "DeviceModel"."Description" AS "ModelDescription",
    "Tag"."TagName",
    "DeviceType"."Type",
    "Process"."ProcessName",
    "ServiceZone"."Zone",
    "ServiceBank"."Bank",
    "Device"."Service",
    "NatureOfSignal"."NatureOfSignalName",
    "SubProcess"."SubProcessName",
    "Stream"."StreamName",
    "EquipmentCode"."Code" AS "EquipmentCode",
    "Device"."ServiceDescription",
    "Device"."LineVesselNumber",
    "Device"."VendorSupply",
    "FailState"."FailStateName",
    "Device"."Revision",
    "Device"."RevisionChanges",
    "Device"."ModifiedBy",
    "Device"."ModifiedDate",
    "Device"."IsDeleted",
    "Manufacturer"."Name" AS "Manufacturer",
    "Device"."Variable",
    "ServiceTrain"."Train",
    "Device"."DeviceModelId",
    "Tag"."SequenceNumber",
    "Tag"."EquipmentIdentifier",
    "Device"."PanelTagId",
    "Device"."SkidTagId",
    "Device"."StandTagId",
    "Device"."JunctionBoxTagId",
    "Device"."DeviceTypeId",
    "Device"."IsInstrument",
    "SubSystem"."Number" AS "SubSystem",
    "System"."Number" AS "System",
    "WorkAreaPack"."Number" AS "WorkAreaPack",
    "Device"."HistoricalLogging",
    "Device"."HistoricalLoggingFrequency",
    "Device"."HistoricalLoggingResolution",
    "Tag"."ProjectId"
   FROM ((public."DeviceModel"
     LEFT JOIN public."Manufacturer" ON (("DeviceModel"."ManufacturerId" = "Manufacturer"."Id")))
     RIGHT JOIN (public."ServiceTrain"
     RIGHT JOIN (public."DeviceType"
     RIGHT JOIN (((((((public."EquipmentCode"
     RIGHT JOIN (public."FailState"
     RIGHT JOIN (((public."System"
     JOIN public."WorkAreaPack" ON (("System"."WorkAreaPackId" = "WorkAreaPack"."Id")))
     JOIN public."SubSystem" ON (("System"."Id" = "SubSystem"."SystemId")))
     RIGHT JOIN (public."Device"
     JOIN public."Tag" ON (("Device"."TagId" = "Tag"."Id"))) ON (("SubSystem"."Id" = "Device"."SubSystemId"))) ON (("FailState"."Id" = "Device"."FailStateId"))) ON (("EquipmentCode"."Id" = "Tag"."EquipmentCodeId")))
     LEFT JOIN public."Stream" ON (("Tag"."StreamId" = "Stream"."Id")))
     LEFT JOIN public."Process" ON (("Tag"."ProcessId" = "Process"."Id")))
     LEFT JOIN public."SubProcess" ON (("Tag"."SubProcessId" = "SubProcess"."Id")))
     LEFT JOIN public."NatureOfSignal" ON (("Device"."NatureOfSignalId" = "NatureOfSignal"."Id")))
     LEFT JOIN public."ServiceZone" ON (("Device"."ServiceZoneId" = "ServiceZone"."Id")))
     LEFT JOIN public."ServiceBank" ON (("Device"."ServiceBankId" = "ServiceBank"."Id"))) ON (("DeviceType"."Id" = "Device"."DeviceTypeId"))) ON (("ServiceTrain"."Id" = "Device"."ServiceTrainId"))) ON (("DeviceModel"."Id" = "Device"."DeviceModelId")));
     DROP VIEW public."View_Device";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    259    274    275    304    295    295    295    294    274    269    269    264    264    263    304    304    304    294    294    294    294    304    304    304    294    294    294    294    304    304    304    289    263    260    260    289    289    289    304    304    304    288    288    286    304    304    304    304    304    304    304    304    304    304    304    304    286    304    302    302    302    304    304    275    276    258    276    285    285    258    259    5            J           1259    85163 "   View_DeviceRackAttributesInColumns    VIEW       CREATE VIEW public."View_DeviceRackAttributesInColumns" AS
 SELECT "Device"."Id",
    min(
        CASE "View_AllAttributes"."Name"
            WHEN 'PLC Slot Number'::text THEN ("View_AllAttributes"."Value")::real
            ELSE NULL::real
        END) AS "PLCSlotNumber",
    min((
        CASE "View_AllAttributes"."Name"
            WHEN 'PLC Number'::text THEN "View_AllAttributes"."Value"
            ELSE NULL::character varying
        END)::text) AS "PLCNumber",
    min(
        CASE "View_AllAttributes"."Name"
            WHEN 'Channel Number'::text THEN ("View_AllAttributes"."Value")::real
            ELSE NULL::real
        END) AS "ChannelNo",
    min((
        CASE "View_AllAttributes"."Name"
            WHEN 'RIO Rack Number'::text THEN "View_AllAttributes"."Value"
            WHEN 'VMB Rack Number'::text THEN "View_AllAttributes"."Value"
            ELSE NULL::character varying
        END)::text) AS "RackNo",
    min(
        CASE "View_AllAttributes"."Name"
            WHEN 'Slot Number'::text THEN ("View_AllAttributes"."Value")::real
            ELSE NULL::real
        END) AS "SlotNo",
    "NatureOfSignal"."NatureOfSignalName",
    "Tag"."ProjectId"
   FROM (((public."View_AllAttributes"
     RIGHT JOIN public."Device" ON (("Device"."Id" = "View_AllAttributes"."Id")))
     JOIN public."Tag" ON (("Tag"."Id" = "Device"."TagId")))
     LEFT JOIN public."NatureOfSignal" ON (("Device"."NatureOfSignalId" = "NatureOfSignal"."Id")))
  GROUP BY "Device"."Id", "Tag"."ProjectId", "NatureOfSignal"."NatureOfSignalName";
 7   DROP VIEW public."View_DeviceRackAttributesInColumns";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    319    319    319    304    304    304    294    294    264    264    5            >           1259    85098    View_Device_NonInstruments    VIEW     �
  CREATE VIEW public."View_Device_NonInstruments" AS
 SELECT "Device"."Id",
    "DeviceModel"."Model",
    "DeviceModel"."Description" AS "ModelDescription",
    "Tag"."TagName",
    "DeviceType"."Type",
    "Process"."ProcessName",
    "ServiceZone"."Zone",
    "ServiceBank"."Bank",
    "Device"."Service",
    "NatureOfSignal"."NatureOfSignalName",
    "SubProcess"."SubProcessName",
    "Stream"."StreamName",
    "EquipmentCode"."Code" AS "EquipmentCode",
    "Device"."ServiceDescription",
    "Device"."LineVesselNumber",
    "Device"."VendorSupply",
    "FailState"."FailStateName",
    "Device"."Revision",
    "Device"."RevisionChanges",
    "Device"."ModifiedBy",
    "Device"."ModifiedDate",
    "Device"."IsDeleted",
    "Device"."IsActive",
    "Manufacturer"."Name" AS "Manufacturer",
    "Device"."Variable",
    "ServiceTrain"."Train",
    "Device"."DeviceModelId",
    "Tag"."SequenceNumber",
    "Tag"."EquipmentIdentifier",
    "Device"."PanelTagId",
    "Device"."SkidTagId",
    "Device"."StandTagId",
    "Device"."JunctionBoxTagId",
    "Device"."DeviceTypeId",
    "Device"."IsInstrument",
    "SubSystem"."Number" AS "SubSystem",
    "System"."Number" AS "System",
    "WorkAreaPack"."Number" AS "WorkAreaPack",
    "Tag"."ProjectId"
   FROM ((public."DeviceModel"
     LEFT JOIN public."Manufacturer" ON (("DeviceModel"."ManufacturerId" = "Manufacturer"."Id")))
     RIGHT JOIN (public."ServiceTrain"
     RIGHT JOIN (public."DeviceType"
     RIGHT JOIN (((((((public."EquipmentCode"
     RIGHT JOIN (public."FailState"
     RIGHT JOIN (((public."System"
     JOIN public."WorkAreaPack" ON (("System"."WorkAreaPackId" = "WorkAreaPack"."Id")))
     JOIN public."SubSystem" ON (("System"."Id" = "SubSystem"."SystemId")))
     RIGHT JOIN (public."Device"
     JOIN public."Tag" ON (("Device"."TagId" = "Tag"."Id"))) ON (("SubSystem"."Id" = "Device"."SubSystemId"))) ON (("FailState"."Id" = "Device"."FailStateId"))) ON (("EquipmentCode"."Id" = "Tag"."EquipmentCodeId")))
     LEFT JOIN public."Stream" ON (("Tag"."StreamId" = "Stream"."Id")))
     LEFT JOIN public."Process" ON (("Tag"."ProcessId" = "Process"."Id")))
     LEFT JOIN public."SubProcess" ON (("Tag"."SubProcessId" = "SubProcess"."Id")))
     LEFT JOIN public."NatureOfSignal" ON (("Device"."NatureOfSignalId" = "NatureOfSignal"."Id")))
     LEFT JOIN public."ServiceZone" ON (("Device"."ServiceZoneId" = "ServiceZone"."Id")))
     LEFT JOIN public."ServiceBank" ON (("Device"."ServiceBankId" = "ServiceBank"."Id"))) ON (("DeviceType"."Id" = "Device"."DeviceTypeId"))) ON (("ServiceTrain"."Id" = "Device"."ServiceTrainId"))) ON (("DeviceModel"."Id" = "Device"."DeviceModelId")))
  WHERE ((("Device"."IsInstrument")::bpchar = 'N'::bpchar) OR (("Device"."IsInstrument")::bpchar = 'B'::bpchar));
 /   DROP VIEW public."View_Device_NonInstruments";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    304    258    258    259    259    260    260    263    263    264    264    269    269    274    274    275    275    276    276    285    285    286    286    288    288    289    289    289    289    294    294    294    294    294    294    294    294    294    295    295    295    302    302    302    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304    5            N           1259    86399 %   View_NatureOfSignalValidationFailures    VIEW     �  CREATE VIEW public."View_NatureOfSignalValidationFailures" AS
 SELECT list."DeviceId",
    list."Process No",
    list."Sub Process",
    list."StreamName",
    list."Equipment Code",
    list."Sequence Number",
    list."Equipment Identifier",
    list."TagName",
    list."Instr Parent Tag",
    list."Service Description",
    list."Line / Vessel Number",
    list."Plant",
    list."Area",
    list."Vendor Supply",
    list."Skid Number",
    list."Stand Number",
    list."Manufacturer",
    list."Model Number",
    list."Calibrated Range (Min)",
    list."Calibrated Range (Max)",
    list."CR Units",
    list."Process Range (Min)",
    list."Process Range (Max)",
    list."PR Units",
    list."RL / Position",
    list."Datasheet Number",
    list."Sheet Number",
    list."Hook-up Drawing",
    list."Termination Diagram",
    list."P&Id Number",
    list."Layout Drawing",
    list."Architectural Drawing",
    list."Functional Description Document",
    list."Product Procurement Number",
    list."Junction Box Number",
    list."Nature Of Signal",
    list."Fail State",
    list."GSD Type",
    list."Control Panel Number",
    list."PLC Number",
    list."PLC Slot Number",
    list."Field Panel Number",
    list."DP/DP Coupler",
    list."DP/PA Coupler",
    list."AFD / Hub Number",
    list."Rack No",
    list."Slot No",
    list."Channel No",
    list."DP Node Address",
    list."PA Node Address",
    list."Revision",
    list."Revision Changes / Outstanding Comments",
    list."Zone",
    list."Bank",
    list."Service",
    list."Variable",
    list."Train",
    list."Work Area Pack",
    list."System Code",
    list."SubSystem Code",
    list."Historical Logging",
    list."Historical Logging Frequency",
    list."Historical Logging Resolution",
    list."IsInstrument",
    list."IsDeleted",
    list."ProjectId",
    list."IsActive"
   FROM public."View_InstrumentListLive" list
  WHERE (((list."Nature Of Signal")::text = 'DP'::text) AND (list."DP Node Address" IS NULL) AND (list."IsDeleted" = false))
UNION
 SELECT list."DeviceId",
    list."Process No",
    list."Sub Process",
    list."StreamName",
    list."Equipment Code",
    list."Sequence Number",
    list."Equipment Identifier",
    list."TagName",
    list."Instr Parent Tag",
    list."Service Description",
    list."Line / Vessel Number",
    list."Plant",
    list."Area",
    list."Vendor Supply",
    list."Skid Number",
    list."Stand Number",
    list."Manufacturer",
    list."Model Number",
    list."Calibrated Range (Min)",
    list."Calibrated Range (Max)",
    list."CR Units",
    list."Process Range (Min)",
    list."Process Range (Max)",
    list."PR Units",
    list."RL / Position",
    list."Datasheet Number",
    list."Sheet Number",
    list."Hook-up Drawing",
    list."Termination Diagram",
    list."P&Id Number",
    list."Layout Drawing",
    list."Architectural Drawing",
    list."Functional Description Document",
    list."Product Procurement Number",
    list."Junction Box Number",
    list."Nature Of Signal",
    list."Fail State",
    list."GSD Type",
    list."Control Panel Number",
    list."PLC Number",
    list."PLC Slot Number",
    list."Field Panel Number",
    list."DP/DP Coupler",
    list."DP/PA Coupler",
    list."AFD / Hub Number",
    list."Rack No",
    list."Slot No",
    list."Channel No",
    list."DP Node Address",
    list."PA Node Address",
    list."Revision",
    list."Revision Changes / Outstanding Comments",
    list."Zone",
    list."Bank",
    list."Service",
    list."Variable",
    list."Train",
    list."Work Area Pack",
    list."System Code",
    list."SubSystem Code",
    list."Historical Logging",
    list."Historical Logging Frequency",
    list."Historical Logging Resolution",
    list."IsInstrument",
    list."IsDeleted",
    list."ProjectId",
    list."IsActive"
   FROM public."View_InstrumentListLive" list
  WHERE (((list."Nature Of Signal")::text = 'PA'::text) AND (list."PA Node Address" IS NULL) AND (list."IsDeleted" = false))
UNION
 SELECT list."DeviceId",
    list."Process No",
    list."Sub Process",
    list."StreamName",
    list."Equipment Code",
    list."Sequence Number",
    list."Equipment Identifier",
    list."TagName",
    list."Instr Parent Tag",
    list."Service Description",
    list."Line / Vessel Number",
    list."Plant",
    list."Area",
    list."Vendor Supply",
    list."Skid Number",
    list."Stand Number",
    list."Manufacturer",
    list."Model Number",
    list."Calibrated Range (Min)",
    list."Calibrated Range (Max)",
    list."CR Units",
    list."Process Range (Min)",
    list."Process Range (Max)",
    list."PR Units",
    list."RL / Position",
    list."Datasheet Number",
    list."Sheet Number",
    list."Hook-up Drawing",
    list."Termination Diagram",
    list."P&Id Number",
    list."Layout Drawing",
    list."Architectural Drawing",
    list."Functional Description Document",
    list."Product Procurement Number",
    list."Junction Box Number",
    list."Nature Of Signal",
    list."Fail State",
    list."GSD Type",
    list."Control Panel Number",
    list."PLC Number",
    list."PLC Slot Number",
    list."Field Panel Number",
    list."DP/DP Coupler",
    list."DP/PA Coupler",
    list."AFD / Hub Number",
    list."Rack No",
    list."Slot No",
    list."Channel No",
    list."DP Node Address",
    list."PA Node Address",
    list."Revision",
    list."Revision Changes / Outstanding Comments",
    list."Zone",
    list."Bank",
    list."Service",
    list."Variable",
    list."Train",
    list."Work Area Pack",
    list."System Code",
    list."SubSystem Code",
    list."Historical Logging",
    list."Historical Logging Frequency",
    list."Historical Logging Resolution",
    list."IsInstrument",
    list."IsDeleted",
    list."ProjectId",
    list."IsActive"
   FROM public."View_InstrumentListLive" list
  WHERE (((list."Nature Of Signal")::text = ANY (ARRAY[('DI'::character varying)::text, ('DO'::character varying)::text, ('MO'::character varying)::text, ('AI'::character varying)::text, ('AO'::character varying)::text, ('SDI'::character varying)::text, ('SDO'::character varying)::text, ('RTD'::character varying)::text, ('SRTD'::character varying)::text])) AND ((list."Rack No" IS NULL) OR (list."Slot No" IS NULL) OR (list."Channel No" IS NULL)) AND (list."IsDeleted" = false));
 :   DROP VIEW public."View_NatureOfSignalValidationFailures";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    5            O           1259    87707    View_NonInstrumentList    VIEW     )  CREATE VIEW public."View_NonInstrumentList" AS
 SELECT "View_Device_NonInstruments"."Id" AS "DeviceId",
    "View_Device_NonInstruments"."ProcessName" AS "Process No",
    "View_Device_NonInstruments"."SubProcessName" AS "Sub Process",
    "View_Device_NonInstruments"."StreamName",
    "View_Device_NonInstruments"."EquipmentCode" AS "Equipment Code",
    "View_Device_NonInstruments"."SequenceNumber" AS "Sequence Number",
    "View_Device_NonInstruments"."EquipmentIdentifier" AS "Equipment Identifier",
    "View_Device_NonInstruments"."TagName",
    dvt."Description" AS "Device Type",
    "View_Device_NonInstruments"."ServiceDescription" AS "Service Description",
    min((
        CASE "View_AllAttributes"."Name"
            WHEN 'Description'::text THEN "View_AllAttributes"."Value"
            ELSE NULL::character varying
        END)::text) AS "Description",
    "View_Device_NonInstruments"."NatureOfSignalName" AS "Nature of Signal",
    min(
        CASE "View_AllAttributes"."Name"
            WHEN 'DP Node Address'::text THEN ("View_AllAttributes"."Value")::text
            ELSE NULL::text
        END) AS "DP Node Address",
    min(
        CASE "View_AllAttributes"."Name"
            WHEN 'No of Slots/Channels'::text THEN ("View_AllAttributes"."Value")::text
            ELSE NULL::text
        END) AS "No of Slots or Channels",
    min(
        CASE "View_AllAttributes"."Name"
            WHEN 'Slot Number'::text THEN ("View_AllAttributes"."Value")::text
            ELSE NULL::text
        END) AS "Slot Number",
    min((
        CASE "View_AllAttributes"."Name"
            WHEN 'PLC Number'::text THEN "View_AllAttributes"."Value"
            ELSE NULL::character varying
        END)::text) AS "PLC Number",
    min(
        CASE "View_AllAttributes"."Name"
            WHEN 'PLC Slot Number'::text THEN ("View_AllAttributes"."Value")::text
            ELSE NULL::text
        END) AS "PLC Slot Number",
    "panelTag"."TagName" AS "Location",
    "View_Device_NonInstruments"."Manufacturer",
    "View_Device_NonInstruments"."Model" AS "Model Number",
    "View_Device_NonInstruments"."ModelDescription" AS "Model Description",
    max((
        CASE
            WHEN (h."Instrument" = false) THEN pt."TagName"
            ELSE NULL::character varying
        END)::text) AS "Connection Parent Tag",
    max((
        CASE
            WHEN (h."Instrument" = true) THEN pt."TagName"
            ELSE NULL::character varying
        END)::text) AS "Instr Parent Tag",
    min((
        CASE "View_AllDocuments"."Type"
            WHEN 'Architecture Drawing'::text THEN "View_AllDocuments"."DocumentNumber"
            ELSE NULL::character varying
        END)::text) AS "Architecture Drawing",
    min((
        CASE "View_AllDocuments"."Type"
            WHEN 'Architecture Drawing'::text THEN "View_AllDocuments"."Sheet"
            ELSE NULL::character varying
        END)::text) AS "Architecture Drawing Sheet",
    "View_Device_NonInstruments"."Revision",
    "View_Device_NonInstruments"."RevisionChanges",
    "View_Device_NonInstruments"."IsInstrument",
    "View_Device_NonInstruments"."IsDeleted",
    "View_Device_NonInstruments"."IsActive",
    "View_Device_NonInstruments"."ProjectId"
   FROM (((((((public."View_Device_NonInstruments"
     LEFT JOIN public."View_AllDocuments" ON (("View_AllDocuments"."DeviceId" = "View_Device_NonInstruments"."Id")))
     LEFT JOIN public."View_AllAttributes" ON (("View_AllAttributes"."Id" = "View_Device_NonInstruments"."Id")))
     LEFT JOIN public."ControlSystemHierarchy" h ON ((h."ChildDeviceId" = "View_Device_NonInstruments"."Id")))
     LEFT JOIN public."Device" pd ON ((h."ParentDeviceId" = pd."Id")))
     LEFT JOIN public."Tag" pt ON ((pd."TagId" = pt."Id")))
     LEFT JOIN public."DeviceType" dvt ON ((dvt."Id" = "View_Device_NonInstruments"."DeviceTypeId")))
     LEFT JOIN public."Tag" "panelTag" ON (("panelTag"."Id" = "View_Device_NonInstruments"."PanelTagId")))
  GROUP BY "View_Device_NonInstruments"."ProcessName", "View_Device_NonInstruments"."SubProcessName", "View_Device_NonInstruments"."StreamName", "View_Device_NonInstruments"."EquipmentCode", "View_Device_NonInstruments"."SequenceNumber", "View_Device_NonInstruments"."EquipmentIdentifier", "View_Device_NonInstruments"."TagName", "View_Device_NonInstruments"."ServiceDescription", "View_Device_NonInstruments"."Manufacturer", "View_Device_NonInstruments"."Model", "View_Device_NonInstruments"."Revision", "View_Device_NonInstruments"."RevisionChanges", "View_Device_NonInstruments"."IsDeleted", "View_Device_NonInstruments"."IsActive", "View_Device_NonInstruments"."Id", "View_Device_NonInstruments"."PanelTagId", "panelTag"."TagName", "View_Device_NonInstruments"."IsInstrument", dvt."Description", "View_Device_NonInstruments"."NatureOfSignalName", "View_Device_NonInstruments"."ModelDescription", "View_Device_NonInstruments"."ProjectId";
 +   DROP VIEW public."View_NonInstrumentList";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    258    323    323    323    323    319    319    319    318    318    318    318    318    318    318    318    318    318    318    318    318    318    318    318    318    318    318    318    318    306    306    306    304    304    294    294    258    5            L           1259    86389    View_OMItem_InstrumentList    VIEW     �  CREATE VIEW public."View_OMItem_InstrumentList" AS
 SELECT "OMItem"."Id",
    "OMItem"."ItemId",
    "OMItem"."ItemDescription",
    "OMItem"."ParentItemId",
    "OMItem"."AssetTypeId",
    "View_InstrumentListLive"."DeviceId",
    "View_InstrumentListLive"."Process No",
    "View_InstrumentListLive"."Sub Process",
    "View_InstrumentListLive"."StreamName",
    "View_InstrumentListLive"."Equipment Code",
    "View_InstrumentListLive"."Sequence Number",
    "View_InstrumentListLive"."Equipment Identifier",
    "View_InstrumentListLive"."TagName" AS "Tag",
    "View_InstrumentListLive"."Instr Parent Tag",
    "View_InstrumentListLive"."Service Description",
    "View_InstrumentListLive"."Line / Vessel Number",
    "View_InstrumentListLive"."Plant",
    "View_InstrumentListLive"."Area",
    "View_InstrumentListLive"."Vendor Supply",
    "View_InstrumentListLive"."Skid Number",
    "View_InstrumentListLive"."Stand Number",
    "View_InstrumentListLive"."Manufacturer",
    "View_InstrumentListLive"."Model Number",
    "View_InstrumentListLive"."Calibrated Range (Min)",
    "View_InstrumentListLive"."Calibrated Range (Max)",
    "View_InstrumentListLive"."CR Units",
    "View_InstrumentListLive"."Process Range (Min)",
    "View_InstrumentListLive"."Process Range (Max)",
    "View_InstrumentListLive"."PR Units",
    "View_InstrumentListLive"."RL / Position",
    "View_InstrumentListLive"."Datasheet Number",
    "View_InstrumentListLive"."Sheet Number",
    "View_InstrumentListLive"."Hook-up Drawing",
    "View_InstrumentListLive"."Termination Diagram",
    "View_InstrumentListLive"."P&Id Number",
    "View_InstrumentListLive"."Layout Drawing",
    "View_InstrumentListLive"."Architectural Drawing",
    "View_InstrumentListLive"."Functional Description Document",
    "View_InstrumentListLive"."Product Procurement Number",
    "View_InstrumentListLive"."Junction Box Number",
    "View_InstrumentListLive"."Nature Of Signal",
    "View_InstrumentListLive"."Fail State",
    "View_InstrumentListLive"."GSD Type",
    "View_InstrumentListLive"."Control Panel Number",
    "View_InstrumentListLive"."PLC Number",
    "View_InstrumentListLive"."PLC Slot Number",
    "View_InstrumentListLive"."Field Panel Number",
    "View_InstrumentListLive"."DP/DP Coupler",
    "View_InstrumentListLive"."DP/PA Coupler",
    "View_InstrumentListLive"."AFD / Hub Number",
    "View_InstrumentListLive"."Rack No",
    "View_InstrumentListLive"."Slot No",
    "View_InstrumentListLive"."Channel No",
    "View_InstrumentListLive"."DP Node Address",
    "View_InstrumentListLive"."PA Node Address",
    "View_InstrumentListLive"."Revision",
    "View_InstrumentListLive"."Revision Changes / Outstanding Comments",
    "View_InstrumentListLive"."Zone",
    "View_InstrumentListLive"."Bank",
    "View_InstrumentListLive"."Service",
    "View_InstrumentListLive"."Variable",
    "View_InstrumentListLive"."Train",
    "View_InstrumentListLive"."Work Area Pack",
    "View_InstrumentListLive"."System Code",
    "View_InstrumentListLive"."SubSystem Code",
    "View_InstrumentListLive"."Historical Logging",
    "View_InstrumentListLive"."Historical Logging Frequency",
    "View_InstrumentListLive"."Historical Logging Resolution",
    "View_InstrumentListLive"."IsInstrument",
        CASE
            WHEN ("View_InstrumentListLive"."IsActive" IS NULL) THEN "OMItem"."IsActive"
            ELSE "View_InstrumentListLive"."IsActive"
        END AS "IsActive",
        CASE
            WHEN ("View_InstrumentListLive"."IsDeleted" IS NULL) THEN "OMItem"."IsDeleted"
            ELSE "View_InstrumentListLive"."IsDeleted"
        END AS "IsDeleted",
        CASE
            WHEN ("View_InstrumentListLive"."ProjectId" IS NULL) THEN "OMItem"."ProjectId"
            ELSE "View_InstrumentListLive"."ProjectId"
        END AS "ProjectId"
   FROM (public."View_InstrumentListLive"
     FULL JOIN public."OMItem" ON ((("OMItem"."ItemId")::text = ("View_InstrumentListLive"."TagName")::text)));
 /   DROP VIEW public."View_OMItem_InstrumentList";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    267    267    267    267    267    331    331    331    331    267    267    267    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    331    5            =           1259    85093    View_PSSTags    VIEW     n  CREATE VIEW public."View_PSSTags" AS
 WITH unionpart1 AS (
         SELECT sigtype_ext."Kind",
            (('Z'::text || (t."TagName")::text) || COALESCE(('_'::text || (sigtype_ext."Extension")::text), ''::text)) AS "CBTagNumber",
            sigtype_ext."CBVariableType",
            ((('"'::text || (t."TagName")::text) || COALESCE(('_'::text || (sigtype_ext."Extension")::text), ''::text)) || '"'::text) AS "PLCTag",
            sigtype_ext."PCS7VariableType",
            sigtype_ext."Extension" AS "SignalExtension",
            p."ProcessName",
            sp."SubProcessName",
            st."StreamName",
            ec."Code" AS "EquipmentCode",
            t."SequenceNumber",
            t."EquipmentIdentifier",
            t."TagName",
            min((
                CASE dad."Name"
                    WHEN 'PLC Number'::text THEN dav."Value"
                    ELSE NULL::character varying
                END)::text) AS "PLCNumber",
            sigtype."NatureOfSignalName",
            NULL::text AS "GSDType",
            "Manufacturer"."Name" AS "Manufacturer",
            "DeviceModel"."Model",
            t."ProjectId"
           FROM (((((((((((public."Tag" t
             JOIN public."Device" d ON ((t."Id" = d."TagId")))
             LEFT JOIN public."DeviceModel" ON ((d."DeviceModelId" = "DeviceModel"."Id")))
             LEFT JOIN public."Manufacturer" ON (("DeviceModel"."ManufacturerId" = "Manufacturer"."Id")))
             LEFT JOIN ((public."AttributeValue" dav
             JOIN public."DeviceAttributeValue" map ON ((dav."Id" = map."AttributeValueId")))
             JOIN public."AttributeDefinition" dad ON ((dav."AttributeDefinitionId" = dad."Id"))) ON ((d."Id" = map."DeviceId")))
             JOIN public."NatureOfSignal" sigtype ON ((sigtype."Id" = d."NatureOfSignalId")))
             JOIN public."NatureOfSignalSignalExtension" sigtype_map ON ((sigtype_map."NatureOfSignalId" = sigtype."Id")))
             JOIN public."SignalExtension" sigtype_ext ON ((sigtype_ext."Id" = sigtype_map."SignalExtensionId")))
             LEFT JOIN public."Process" p ON ((p."Id" = t."ProcessId")))
             LEFT JOIN public."SubProcess" sp ON ((sp."Id" = t."SubProcessId")))
             LEFT JOIN public."Stream" st ON ((st."Id" = t."StreamId")))
             JOIN public."EquipmentCode" ec ON ((ec."Id" = t."EquipmentCodeId")))
          WHERE ((d."NatureOfSignalId" IS NOT NULL) AND (((d."IsInstrument")::bpchar = 'Y'::bpchar) OR ((d."IsInstrument")::bpchar = 'B'::bpchar)) AND (d."IsDeleted" = false))
          GROUP BY "Manufacturer"."Name", "DeviceModel"."Model", t."TagName", t."SequenceNumber", t."EquipmentIdentifier", p."ProcessName", sp."SubProcessName", st."StreamName", ec."Code", sigtype_ext."Kind", sigtype_ext."Extension", sigtype_ext."CBVariableType", sigtype_ext."PCS7VariableType", sigtype."NatureOfSignalName", t."ProjectId"
        ), unionpart2 AS (
         SELECT sig."Kind",
            (('Z'::text || (t."TagName")::text) || COALESCE(('_'::text || (sig."Extension")::text), ''::text)) AS "CBTagNumber",
            sig."CBVariableType",
            ((('"'::text || (t."TagName")::text) || COALESCE(('_'::text || (sig."Extension")::text), ''::text)) || '"'::text) AS "PLCTag",
            sig."PCS7VariableType",
            sig."Extension" AS "SignalExtension",
            p."ProcessName",
            sp."SubProcessName",
            st."StreamName",
            ec."Code" AS "EquipmentCode",
            t."SequenceNumber",
            t."EquipmentIdentifier",
            t."TagName",
            min((
                CASE dad."Name"
                    WHEN 'PLC Number'::text THEN dav."Value"
                    ELSE NULL::character varying
                END)::text) AS "PLCNumber",
            sigtype."NatureOfSignalName",
            gsd."GSDTypeName",
            "Manufacturer"."Name" AS "Manufacturer",
            "DeviceModel"."Model",
            t."ProjectId"
           FROM (((((((((((((((public."Tag" t
             JOIN public."Device" d ON ((t."Id" = d."TagId")))
             LEFT JOIN public."DeviceType" dt ON ((d."DeviceTypeId" = dt."Id")))
             LEFT JOIN public."DeviceModel" ON ((d."DeviceModelId" = "DeviceModel"."Id")))
             LEFT JOIN public."Manufacturer" ON (("DeviceModel"."ManufacturerId" = "Manufacturer"."Id")))
             LEFT JOIN ((public."AttributeValue" dav
             JOIN public."DeviceAttributeValue" map ON ((dav."Id" = map."AttributeValueId")))
             JOIN public."AttributeDefinition" dad ON ((dav."AttributeDefinitionId" = dad."Id"))) ON ((d."Id" = map."DeviceId")))
             LEFT JOIN public."AttributeValue" mv ON ((mv."DeviceModelId" = d."DeviceModelId")))
             LEFT JOIN public."AttributeDefinition" md ON (((md."Id" = mv."AttributeDefinitionId") AND ((md."Name")::text = 'GSD Type'::text))))
             JOIN public."GSDType" gsd ON (((gsd."GSDTypeName")::text = (mv."Value")::text)))
             JOIN public."GSDType_SignalExtension" gsdmap ON ((gsdmap."GSDTypeId" = gsd."Id")))
             JOIN public."SignalExtension" sig ON ((sig."Id" = gsdmap."SignalExtensionId")))
             JOIN public."NatureOfSignal" sigtype ON ((sigtype."Id" = d."NatureOfSignalId")))
             LEFT JOIN public."Process" p ON ((p."Id" = t."ProcessId")))
             LEFT JOIN public."SubProcess" sp ON ((sp."Id" = t."SubProcessId")))
             LEFT JOIN public."Stream" st ON ((st."Id" = t."StreamId")))
             JOIN public."EquipmentCode" ec ON ((ec."Id" = t."EquipmentCodeId")))
          WHERE ((d."NatureOfSignalId" IS NOT NULL) AND (((d."IsInstrument")::bpchar = 'Y'::bpchar) OR ((d."IsInstrument")::bpchar = 'B'::bpchar)) AND (d."IsDeleted" = false))
          GROUP BY "Manufacturer"."Name", "DeviceModel"."Model", t."TagName", mv."Value", gsd."GSDTypeName", t."SequenceNumber", t."EquipmentIdentifier", p."ProcessName", sp."SubProcessName", st."StreamName", ec."Code", sig."Kind", sig."Extension", sig."PCS7VariableType", sig."CBVariableType", sigtype."NatureOfSignalName", t."ProjectId"
        )
 SELECT unionpart1."Kind",
    unionpart1."CBTagNumber",
    unionpart1."CBVariableType",
    unionpart1."PLCTag",
    unionpart1."PCS7VariableType",
    unionpart1."SignalExtension",
    unionpart1."ProcessName",
    unionpart1."SubProcessName",
    unionpart1."StreamName",
    unionpart1."EquipmentCode",
    unionpart1."SequenceNumber",
    unionpart1."EquipmentIdentifier",
    unionpart1."TagName",
    unionpart1."PLCNumber",
    unionpart1."NatureOfSignalName",
    unionpart1."GSDType",
    unionpart1."Manufacturer",
    unionpart1."Model",
    unionpart1."ProjectId"
   FROM unionpart1
UNION
 SELECT unionpart2."Kind",
    unionpart2."CBTagNumber",
    unionpart2."CBVariableType",
    unionpart2."PLCTag",
    unionpart2."PCS7VariableType",
    unionpart2."SignalExtension",
    unionpart2."ProcessName",
    unionpart2."SubProcessName",
    unionpart2."StreamName",
    unionpart2."EquipmentCode",
    unionpart2."SequenceNumber",
    unionpart2."EquipmentIdentifier",
    unionpart2."TagName",
    unionpart2."PLCNumber",
    unionpart2."NatureOfSignalName",
    unionpart2."GSDTypeName" AS "GSDType",
    unionpart2."Manufacturer",
    unionpart2."Model",
    unionpart2."ProjectId"
   FROM unionpart2;
 !   DROP VIEW public."View_PSSTags";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    293    292    294    294    294    292    289    289    289    294    296    296    286    286    285    285    304    304    304    277    277    277    277    304    304    304    277    269    269    264    304    305    305    264    263    263    261    305    305    308    261    259    259    258    308    294    294    294    294    294    293    5            H           1259    85148    View_PnIDTagException    VIEW       CREATE VIEW public."View_PnIDTagException" AS
 SELECT vw."TagName",
    vw."EquipmentCode",
    vw."ProcessName",
    vw."SubProcessName",
    vw."StreamName",
    vw."SequenceNumber",
    vw."EquipmentIdentifier",
    vw."ServiceDescription",
    skidtag."TagName" AS "SkidTag",
    "Tag"."ProjectId"
   FROM (((public."Device"
     JOIN public."Tag" ON (("Tag"."Id" = "Device"."TagId")))
     JOIN public."View_Device" vw ON ((vw."Id" = "Device"."Id")))
     LEFT JOIN public."Tag" skidtag ON ((skidtag."Id" = vw."SkidTagId")))
  WHERE ((NOT ("Device"."TagId" IN ( SELECT "PnIdTag"."TagId"
           FROM public."PnIdTag"))) AND ((("Device"."IsInstrument")::bpchar = 'Y'::bpchar) OR (("Device"."IsInstrument")::bpchar = 'B'::bpchar)) AND ("Device"."IsDeleted" = false));
 *   DROP VIEW public."View_PnIDTagException";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    294    294    325    325    325    325    325    325    325    325    325    294    304    304    325    304    304    303    5            F           1259    85138 )   View_PnID_Device_DocumentReferenceCompare    VIEW     �  CREATE VIEW public."View_PnID_Device_DocumentReferenceCompare" AS
 SELECT t."ProjectId",
    d."Id" AS "DeviceId",
    t."TagName" AS "Tag",
    doc."DocumentNumber",
    doc."Revision",
    doc."Version",
    pniddoc."DocumentNumber" AS "PnIdDocumentNumber",
    pniddoc."Revision" AS "PnIdRevision",
    pniddoc."Version" AS "PnIdVersion"
   FROM ((((((public."Device" d
     JOIN public."ReferenceDocumentDevice" map ON ((map."DeviceId" = d."Id")))
     JOIN public."ReferenceDocument" doc ON ((doc."Id" = map."ReferenceDocumentId")))
     JOIN public."ReferenceDocumentType" doctype ON (((doctype."Id" = doc."ReferenceDocumentTypeId") AND ((doctype."Type")::text = 'P&ID'::text))))
     JOIN public."Tag" t ON ((t."Id" = d."TagId")))
     JOIN public."PnIdTag" pid ON ((pid."TagId" = t."Id")))
     JOIN public."ReferenceDocument" pniddoc ON ((pniddoc."Id" = pid."DocumentReferenceId")))
  WHERE (d."IsDeleted" = false);
 >   DROP VIEW public."View_PnID_Device_DocumentReferenceCompare";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    304    272    272    291    291    291    291    291    307    294    294    294    303    303    304    304    307    5            <           1259    85088    View_UnassociatedJunctionBoxes    VIEW     m  CREATE VIEW public."View_UnassociatedJunctionBoxes" AS
 SELECT "JunctionBox"."Id",
    "JunctionBox"."TagId",
    "JunctionBox"."Type",
    "JunctionBox"."Description",
    "JunctionBox"."ModifiedDate",
    "JunctionBox"."ModifiedBy",
    "JunctionBox"."IsDeleted",
    "JunctionBox"."ReferenceDocumentId",
    doc."DocumentNumber",
    doc."Revision",
    doc."Version",
    "Tag"."TagName",
    "Tag"."ProjectId"
   FROM ((public."JunctionBox"
     LEFT JOIN public."Tag" ON (("Tag"."Id" = "JunctionBox"."TagId")))
     LEFT JOIN public."ReferenceDocument" doc ON ((doc."Id" = "JunctionBox"."ReferenceDocumentId")))
  WHERE ((NOT ("JunctionBox"."TagId" IN ( SELECT "Device"."JunctionBoxTagId"
           FROM public."Device"
          WHERE ("Device"."JunctionBoxTagId" IS NOT NULL)
          GROUP BY "Device"."JunctionBoxTagId"))) AND ("JunctionBox"."IsDeleted" = false));
 3   DROP VIEW public."View_UnassociatedJunctionBoxes";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    298    298    298    298    294    294    294    291    291    291    291    304    298    298    298    298    5            A           1259    85113    View_UnassociatedPanels    VIEW       CREATE VIEW public."View_UnassociatedPanels" AS
 SELECT "Panel"."Id",
    "Panel"."TagId",
    "Panel"."Type",
    "Panel"."Description",
    "Panel"."ModifiedDate",
    "Panel"."ModifiedBy",
    "Panel"."IsDeleted",
    "Panel"."ReferenceDocumentId",
    doc."DocumentNumber",
    doc."Revision",
    doc."Version",
    "Tag"."TagName",
    "Tag"."ProjectId"
   FROM ((public."Panel"
     LEFT JOIN public."Tag" ON (("Tag"."Id" = "Panel"."TagId")))
     LEFT JOIN public."ReferenceDocument" doc ON ((doc."Id" = "Panel"."ReferenceDocumentId")))
  WHERE ((NOT ("Panel"."TagId" IN ( SELECT "Device"."PanelTagId"
           FROM public."Device"
          WHERE ("Device"."PanelTagId" IS NOT NULL)
          GROUP BY "Device"."PanelTagId"))) AND ("Panel"."IsDeleted" = false));
 ,   DROP VIEW public."View_UnassociatedPanels";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    299    291    291    291    291    294    294    294    299    299    299    299    299    299    299    304    5            @           1259    85108    View_UnassociatedSkids    VIEW     �  CREATE VIEW public."View_UnassociatedSkids" AS
 SELECT "Skid"."Id",
    "Skid"."TagId",
    "Skid"."Type",
    "Skid"."Description",
    "Skid"."ModifiedDate",
    "Skid"."ModifiedBy",
    "Skid"."IsDeleted",
    "Skid"."ReferenceDocumentId",
    doc."DocumentNumber",
    doc."Revision",
    doc."Version",
    "Tag"."TagName",
    "Tag"."ProjectId"
   FROM ((public."Skid"
     LEFT JOIN public."Tag" ON (("Tag"."Id" = "Skid"."TagId")))
     LEFT JOIN public."ReferenceDocument" doc ON ((doc."Id" = "Skid"."ReferenceDocumentId")))
  WHERE ((NOT ("Skid"."TagId" IN ( SELECT "Device"."SkidTagId"
           FROM public."Device"
          WHERE ("Device"."SkidTagId" IS NOT NULL)
          GROUP BY "Device"."SkidTagId"))) AND ("Skid"."IsDeleted" = false));
 +   DROP VIEW public."View_UnassociatedSkids";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    294    294    291    291    291    291    294    300    300    300    300    300    300    300    304    300    5            B           1259    85118    View_UnassociatedStands    VIEW       CREATE VIEW public."View_UnassociatedStands" AS
 SELECT "Stand"."Id",
    "Stand"."TagId",
    "Stand"."ReferenceDocumentId",
    "Stand"."Type",
    "Stand"."Area",
    "Stand"."Description",
    "Stand"."ModifiedDate",
    "Stand"."ModifiedBy",
    "Stand"."IsDeleted",
    doc."DocumentNumber",
    doc."Revision",
    doc."Version",
    "Tag"."TagName",
    "Tag"."ProjectId"
   FROM ((public."Stand"
     LEFT JOIN public."Tag" ON (("Tag"."Id" = "Stand"."TagId")))
     LEFT JOIN public."ReferenceDocument" doc ON ((doc."Id" = "Stand"."ReferenceDocumentId")))
  WHERE ((NOT ("Stand"."TagId" IN ( SELECT "Device"."StandTagId"
           FROM public."Device"
          WHERE ("Device"."StandTagId" IS NOT NULL)
          GROUP BY "Device"."StandTagId"))) AND ("Stand"."IsDeleted" = false));
 ,   DROP VIEW public."View_UnassociatedStands";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    294    294    294    301    301    301    301    301    301    301    301    301    291    291    291    304    291    5            G           1259    85143    View_UnassociatedTags    VIEW     �  CREATE VIEW public."View_UnassociatedTags" AS
 SELECT "Tag"."Id",
    "Tag"."TagName",
    "Tag"."ProcessId",
    "Tag"."SubProcessId",
    "Tag"."StreamId",
    "Tag"."SequenceNumber",
    "Tag"."EquipmentIdentifier",
    "Tag"."EquipmentCodeId",
    "Tag"."ModifiedDate",
    "Tag"."ModifiedBy",
    "Tag"."ProjectId",
    doc."DocumentNumber",
    doc."Revision",
    doc."Version"
   FROM ((public."Tag"
     LEFT JOIN public."PnIdTag" pid ON ((pid."TagId" = "Tag"."Id")))
     LEFT JOIN public."ReferenceDocument" doc ON ((doc."Id" = pid."DocumentReferenceId")))
  WHERE ("Tag"."IsDeleted" = false)
EXCEPT (
         SELECT "Tag"."Id",
            "Tag"."TagName",
            "Tag"."ProcessId",
            "Tag"."SubProcessId",
            "Tag"."StreamId",
            "Tag"."SequenceNumber",
            "Tag"."EquipmentIdentifier",
            "Tag"."EquipmentCodeId",
            "Tag"."ModifiedDate",
            "Tag"."ModifiedBy",
            "Tag"."ProjectId",
            doc."DocumentNumber",
            doc."Revision",
            doc."Version"
           FROM (((public."Tag"
             JOIN public."Device" ON (("Device"."TagId" = "Tag"."Id")))
             LEFT JOIN public."PnIdTag" pid ON ((pid."TagId" = "Tag"."Id")))
             LEFT JOIN public."ReferenceDocument" doc ON ((doc."Id" = pid."DocumentReferenceId")))
          WHERE ("Tag"."IsDeleted" = false)
        UNION
         SELECT "Tag"."Id",
            "Tag"."TagName",
            "Tag"."ProcessId",
            "Tag"."SubProcessId",
            "Tag"."StreamId",
            "Tag"."SequenceNumber",
            "Tag"."EquipmentIdentifier",
            "Tag"."EquipmentCodeId",
            "Tag"."ModifiedDate",
            "Tag"."ModifiedBy",
            "Tag"."ProjectId",
            doc."DocumentNumber",
            doc."Revision",
            doc."Version"
           FROM (((public."Tag"
             JOIN public."Skid" ON (("Skid"."TagId" = "Tag"."Id")))
             LEFT JOIN public."PnIdTag" pid ON ((pid."TagId" = "Tag"."Id")))
             LEFT JOIN public."ReferenceDocument" doc ON ((doc."Id" = pid."DocumentReferenceId")))
          WHERE ("Tag"."IsDeleted" = false)
        UNION
         SELECT "Tag"."Id",
            "Tag"."TagName",
            "Tag"."ProcessId",
            "Tag"."SubProcessId",
            "Tag"."StreamId",
            "Tag"."SequenceNumber",
            "Tag"."EquipmentIdentifier",
            "Tag"."EquipmentCodeId",
            "Tag"."ModifiedDate",
            "Tag"."ModifiedBy",
            "Tag"."ProjectId",
            doc."DocumentNumber",
            doc."Revision",
            doc."Version"
           FROM (((public."Tag"
             JOIN public."Stand" ON (("Stand"."TagId" = "Tag"."Id")))
             LEFT JOIN public."PnIdTag" pid ON ((pid."TagId" = "Tag"."Id")))
             LEFT JOIN public."ReferenceDocument" doc ON ((doc."Id" = pid."DocumentReferenceId")))
          WHERE ("Tag"."IsDeleted" = false)
        UNION
         SELECT "Tag"."Id",
            "Tag"."TagName",
            "Tag"."ProcessId",
            "Tag"."SubProcessId",
            "Tag"."StreamId",
            "Tag"."SequenceNumber",
            "Tag"."EquipmentIdentifier",
            "Tag"."EquipmentCodeId",
            "Tag"."ModifiedDate",
            "Tag"."ModifiedBy",
            "Tag"."ProjectId",
            doc."DocumentNumber",
            doc."Revision",
            doc."Version"
           FROM (((public."Tag"
             JOIN public."JunctionBox" ON (("JunctionBox"."TagId" = "Tag"."Id")))
             LEFT JOIN public."PnIdTag" pid ON ((pid."TagId" = "Tag"."Id")))
             LEFT JOIN public."ReferenceDocument" doc ON ((doc."Id" = pid."DocumentReferenceId")))
          WHERE ("Tag"."IsDeleted" = false)
        UNION
         SELECT "Tag"."Id",
            "Tag"."TagName",
            "Tag"."ProcessId",
            "Tag"."SubProcessId",
            "Tag"."StreamId",
            "Tag"."SequenceNumber",
            "Tag"."EquipmentIdentifier",
            "Tag"."EquipmentCodeId",
            "Tag"."ModifiedDate",
            "Tag"."ModifiedBy",
            "Tag"."ProjectId",
            doc."DocumentNumber",
            doc."Revision",
            doc."Version"
           FROM (((public."Tag"
             JOIN public."Cable" ON (("Cable"."TagId" = "Tag"."Id")))
             LEFT JOIN public."PnIdTag" pid ON ((pid."TagId" = "Tag"."Id")))
             LEFT JOIN public."ReferenceDocument" doc ON ((doc."Id" = pid."DocumentReferenceId")))
          WHERE ("Tag"."IsDeleted" = false)
        UNION
         SELECT "Tag"."Id",
            "Tag"."TagName",
            "Tag"."ProcessId",
            "Tag"."SubProcessId",
            "Tag"."StreamId",
            "Tag"."SequenceNumber",
            "Tag"."EquipmentIdentifier",
            "Tag"."EquipmentCodeId",
            "Tag"."ModifiedDate",
            "Tag"."ModifiedBy",
            "Tag"."ProjectId",
            doc."DocumentNumber",
            doc."Revision",
            doc."Version"
           FROM (((public."Tag"
             JOIN public."Panel" ON (("Panel"."TagId" = "Tag"."Id")))
             LEFT JOIN public."PnIdTag" pid ON ((pid."TagId" = "Tag"."Id")))
             LEFT JOIN public."ReferenceDocument" doc ON ((doc."Id" = pid."DocumentReferenceId")))
          WHERE ("Tag"."IsDeleted" = false)
);
 *   DROP VIEW public."View_UnassociatedTags";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    298    294    294    294    294    294    294    294    294    297    294    299    300    301    303    303    304    291    291    291    291    294    294    294    5            �            1259    71912    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);
 +   DROP TABLE public."__EFMigrationsHistory";
       public         heap    FMxHWQ43Xh2rpTegRGYBV9    false    5            m          0    72376    AttributeDefinition 
   TABLE DATA           +  COPY public."AttributeDefinition" ("Id", "Category", "Name", "Description", "ValueType", "Inherit", "Private", "Required", "DeviceTypeId", "DeviceModelId", "NatureOfSignalId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    296   
�      v          0    72596    AttributeValue 
   TABLE DATA           I  COPY public."AttributeValue" ("Id", "Revision", "Unit", "Requirement", "Value", "ItemNumber", "IncludeInDatasheet", "DeviceId", "DeviceTypeId", "DeviceModelId", "NatureOfSignalId", "AttributeDefinitionId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    305   �      n          0    72398    Cable 
   TABLE DATA             COPY public."Cable" ("Id", "Type", "OriginDescription", "DestDescription", "Length", "CableRoute", "TagId", "OriginTagId", "DestTagId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    297   ��      E          0    72008 	   ChangeLog 
   TABLE DATA             COPY public."ChangeLog" ("Id", "Context", "ContextId", "EntityName", "Status", "OriginalValues", "NewValues", "ProjectId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate", "EntityId") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    256   ��      w          0    72628    ControlSystemHierarchy 
   TABLE DATA           �   COPY public."ControlSystemHierarchy" ("Id", "Instrument", "ParentDeviceId", "ChildDeviceId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    306   �!
      u          0    72519    Device 
   TABLE DATA           X  COPY public."Device" ("Id", "ServiceDescription", "LineVesselNumber", "VendorSupply", "SerialNumber", "HistoricalLogging", "HistoricalLoggingFrequency", "HistoricalLoggingResolution", "Revision", "RevisionChanges", "Service", "Variable", "IsInstrument", "TagId", "DeviceTypeId", "DeviceModelId", "ProcessLevelId", "ServiceZoneId", "ServiceBankId", "ServiceTrainId", "NatureOfSignalId", "PanelTagId", "SkidTagId", "StandTagId", "JunctionBoxTagId", "FailStateId", "SubSystemId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    304   �
      y          0    72658    DeviceAttributeValue 
   TABLE DATA           �   COPY public."DeviceAttributeValue" ("Id", "DeviceId", "AttributeValueId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    308   6�
      F          0    72015    DeviceClassification 
   TABLE DATA           �   COPY public."DeviceClassification" ("Id", "Classification", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    257   S�
      f          0    72265    DeviceModel 
   TABLE DATA           �   COPY public."DeviceModel" ("Id", "Model", "Description", "ManufacturerId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    289   p�
      G          0    72020 
   DeviceType 
   TABLE DATA           �   COPY public."DeviceType" ("Id", "Type", "Description", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    258   ��
      H          0    72025    EquipmentCode 
   TABLE DATA           �   COPY public."EquipmentCode" ("Id", "Code", "Descriptor", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    259   �	      I          0    72030 	   FailState 
   TABLE DATA           �   COPY public."FailState" ("Id", "FailStateName", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    260   �      J          0    72035    GSDType 
   TABLE DATA           �   COPY public."GSDType" ("Id", "GSDTypeName", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    261   �      i          0    72309    GSDType_SignalExtension 
   TABLE DATA           �   COPY public."GSDType_SignalExtension" ("Id", "GSDTypeId", "SignalExtensionId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    292   N      ;          0    71917    ICMDRole 
   TABLE DATA           �   COPY public."ICMDRole" ("Id", "DisplayName", "Description", "CreatedBy", "CreatedDate", "UpdatedBy", "UpdatedDate", "Name", "NormalizedName", "ConcurrencyStamp") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    246   k      >          0    71932    ICMDRoleClaim 
   TABLE DATA           T   COPY public."ICMDRoleClaim" ("Id", "RoleId", "ClaimType", "ClaimValue") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    249   L      <          0    71924    ICMDUser 
   TABLE DATA           z  COPY public."ICMDUser" ("Id", "FirstName", "LastName", "IsActive", "IsDeleted", "CreatedBy", "CreatedDate", "UserName", "NormalizedUserName", "Email", "NormalizedEmail", "EmailConfirmed", "PasswordHash", "SecurityStamp", "ConcurrencyStamp", "PhoneNumber", "PhoneNumberConfirmed", "TwoFactorEnabled", "LockoutEnd", "LockoutEnabled", "AccessFailedCount", "ProjectId") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    247   i      @          0    71945    ICMDUserClaim 
   TABLE DATA           T   COPY public."ICMDUserClaim" ("Id", "UserId", "ClaimType", "ClaimValue") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    251   V       A          0    71957    ICMDUserLogin 
   TABLE DATA           j   COPY public."ICMDUserLogin" ("LoginProvider", "ProviderKey", "ProviderDisplayName", "UserId") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    252   s       B          0    71969    ICMDUserRole 
   TABLE DATA           <   COPY public."ICMDUserRole" ("UserId", "RoleId") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    253   �       C          0    71984    ICMDUserToken 
   TABLE DATA           U   COPY public."ICMDUserToken" ("UserId", "LoginProvider", "Name", "Value") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    254   j!      K          0    72040    InstrumentListImport 
   TABLE DATA           D  COPY public."InstrumentListImport" ("Id", "ProcessNo", "SubProcess", "Stream", "EquipmentCode", "SequenceNumber", "EquipmentIdentifier", "Tag", "ServiceDescription", "Manufacturer", "ModelNumber", "CalibratedRangeMin", "CalibratedRangeMax", "ProcessRangeMin", "ProcessRangeMax", "DataSheetNumber", "SheetNumber", "HookupDrawing", "TerminationDiagram", "PIDNumber", "NatureOfSignal", "GSDType", "ControlPanelNumber", "PLCNumber", "PLCSlotNumber", "FieldPanelNumber", "DPDPCoupler", "DPPACoupler", "AFDHubNumber", "RackNo", "SlotNo", "SlotNoExt", "ChannelNo", "ChannelNoExt", "DPNodeAddress", "PANodeAddress", "Revision", "RevisionChanges", "Service", "Variable", "Train", "Units", "Area", "Bank", "InstparentTag", "Plant", "SubPlantArea", "VendorSupply", "SkidNo", "RLPosition", "LayoutDrawing", "ArchitectureDrawing", "JunctionBox", "FailState", "InstrumentStand", "WorkPackage", "SystemNo", "SubSystemNo", "LineVesselNumber", "FunctionalDescDoc", "ProcurementPkgNum", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    262   �!      o          0    72420    JunctionBox 
   TABLE DATA           �   COPY public."JunctionBox" ("Id", "Type", "Description", "TagId", "ReferenceDocumentId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    298   �!      L          0    72047    Manufacturer 
   TABLE DATA           �   COPY public."Manufacturer" ("Id", "Name", "Description", "Comment", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    263   �$      }          0    73125 	   MenuItems 
   TABLE DATA             COPY public."MenuItems" ("Id", "MenuName", "ControllerName", "MenuDescription", "Url", "Icon", "SortOrder", "ParentMenuId", "IsPermission", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    312   �&      ~          0    73137    MenuPermission 
   TABLE DATA           �   COPY public."MenuPermission" ("Id", "MenuId", "RoleId", "IsGranted", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    313   K.      �          0    73166    MetaData 
   TABLE DATA           �   COPY public."MetaData" ("Id", "Property", "Value", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    315   @      M          0    72054    NatureOfSignal 
   TABLE DATA           �   COPY public."NatureOfSignal" ("Id", "NatureOfSignalName", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    264   NB      j          0    72324    NatureOfSignalSignalExtension 
   TABLE DATA           �   COPY public."NatureOfSignalSignalExtension" ("Id", "NatureOfSignalId", "SignalExtensionId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    293   uF      N          0    72059    NonInstrumentListImport 
   TABLE DATA           &  COPY public."NonInstrumentListImport" ("Id", "ProcessNo", "SubProcess", "Stream", "EquipmentCode", "SequenceNumber", "EquipmentIdentifier", "Tag", "DeviceType", "Description", "NatureOfSignal", "DPNodeAddress", "NoSlotsChannels", "ConnectionParent", "PLCNumber", "PLCSlotNumber", "Location", "Manufacturer", "ModelNumber", "ModelDescription", "ArchitecturalDrawing", "ArchitecturalDrawingSheet", "Revision", "RevisionChanges", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    265   �F      O          0    72066 	   OLMDPTDPR 
   TABLE DATA           �   COPY public."OLMDPTDPR" ("Id", "No", "OLMDPTDPRDeviceTag", "PLCSlotNo", "DeviceType", "DevicePhysicalLocation", "PLCNo", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    266   �F      P          0    72073    OMItem 
   TABLE DATA           �   COPY public."OMItem" ("Id", "ItemId", "ItemDescription", "ParentItemId", "AssetTypeId", "ProjectId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    267   �F      Q          0    72080    OMServiceDescriptionImport 
   TABLE DATA             COPY public."OMServiceDescriptionImport" ("Id", "Tag", "ServiceDescription", "Area", "Stream", "Bank", "Service", "Variable", "Train", "ProjectId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    268   �F      p          0    72435    Panel 
   TABLE DATA           �   COPY public."Panel" ("Id", "Type", "Description", "TagId", "ReferenceDocumentId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    299   G                0    73155    PermissionManagement 
   TABLE DATA           �   COPY public."PermissionManagement" ("Id", "MenuPermissionId", "Operation", "IsGranted", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    314   SI      t          0    72494    PnIdTag 
   TABLE DATA             COPY public."PnIdTag" ("Id", "Description", "Switches", "PipelineTag", "PnPId", "Source", "TagId", "DocumentReferenceId", "SkidId", "FailStateId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    303   �u      R          0    72092    Process 
   TABLE DATA           �   COPY public."Process" ("Id", "ProcessName", "Description", "ProjectId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    269   �u      g          0    72277    ProcessHierarchy 
   TABLE DATA           �   COPY public."ProcessHierarchy" ("Id", "ChildProcessLevelId", "ParentProcessLevelId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    290   �y      S          0    72104    ProcessLevel 
   TABLE DATA           �   COPY public."ProcessLevel" ("Id", "Name", "Description", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    270   �y      D          0    72003    Project 
   TABLE DATA           �   COPY public."Project" ("Id", "Name", "Description", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    255   �y      T          0    72111    ProjectUser 
   TABLE DATA           �   COPY public."ProjectUser" ("Id", "ProjectId", "UserId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate", "Authorization") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    271   {      h          0    72292    ReferenceDocument 
   TABLE DATA           1  COPY public."ReferenceDocument" ("Id", "DocumentNumber", "URL", "Description", "Version", "Revision", "Date", "Sheet", "IsVDPDocumentNumber", "ProjectId", "ReferenceDocumentTypeId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    291   u}      x          0    72643    ReferenceDocumentDevice 
   TABLE DATA           �   COPY public."ReferenceDocumentDevice" ("Id", "DeviceId", "ReferenceDocumentId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    307   �      U          0    72126    ReferenceDocumentType 
   TABLE DATA           �   COPY public."ReferenceDocumentType" ("Id", "Type", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    272   �      V          0    72131    Report 
   TABLE DATA           �   COPY public."Report" ("Id", "Group", "Name", "URL", "Description", "Order", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    273   1�      [          0    72175    SSISEquipmentList 
   TABLE DATA           �  COPY public."SSISEquipmentList" ("Id", "PnPId", "ProcessNumber", "SubProcess", "Stream", "EquipmentCode", "SequenceNumber", "EquipmentIdentifier", "Tag", "DWGTitle", "Rev", "Version", "Description", "PipingClass", "OnSkid", "Function", "TrackingNumber", "ProjectId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    278   ��      \          0    72182    SSISFittings 
   TABLE DATA           V  COPY public."SSISFittings" ("Id", "PnPId", "ProcessNumber", "SubProcess", "Stream", "EquipmentCode", "SequenceNumber", "EquipmentIdentifier", "Tag", "DWGTitle", "Rev", "Version", "Description", "PipingClass", "OnSkid", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    279   ʇ      ]          0    72189    SSISInstruments 
   TABLE DATA           �  COPY public."SSISInstruments" ("Id", "PnPId", "ProcessNumber", "SubProcess", "Stream", "EquipmentCode", "SequenceNumber", "EquipmentIdentifier", "Tag", "OnEquipment", "OnSkid", "Description", "FluidCode", "PipeLinesTag", "Size", "DWGTitle", "Rev", "Version", "To", "From", "TrackingNumber", "ProjectId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    280   �      ^          0    72196    SSISInstrumentsVsStands110728 
   TABLE DATA           �  COPY public."SSISInstrumentsVsStands110728" ("Id", "DF", "PLCNumber", "ProcessNo", "SubProcess", "Stream", "EquipmentCode", "SequenceNumber", "EquipmentIdentifier", "Tag", "Function", "Manufacturer", "DatasheetNumber", "SheetNumber", "GeneralArrangement", "TerminationDiagram", "PIDNumber", "HubNumber", "VendorSkid", "StandReqd", "HookupDrawing", "InstrumentStandTAG", "InstrumentStandType", "AncillaryPlate", "Remark", "OldHOOKUP_172011", "OldStandTAG_172011", "OldStandTYPE_172011", "PDMSSTANDQUERYSTANDPRESENT", "PDMSALLINSTRU", "Working", "Working2", "F32", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    281   Y�      _          0    72203    SSISStandList 
   TABLE DATA           �  COPY public."SSISStandList" ("Id", "Item", "Rev", "InstrumentStandTag", "InstrumentStandType", "Qrea", "QTY", "DrawingReference", "Figure", "AFD1", "AFD2", "AFD3", "AFDPlates", "DPH1", "DPH2", "DPHPlates", "Instrument1", "Instrument2", "Instrument3", "Instrument4", "ReasonsForChange", "ChangeBy", "F23", "F24", "F25", "F26", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    282   v�      `          0    72210    SSISStandTypes 
   TABLE DATA             COPY public."SSISStandTypes" ("Id", "Item", "Rev", "InstrumentStandCode", "InstrumentStandType", "VendorReferenceDrawing", "QTY", "ProjectDrawingReference", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    283   ��      a          0    72217    SSISValveList 
   TABLE DATA             COPY public."SSISValveList" ("Id", "PnPId", "ProcessNumber", "SubProcess", "Stream", "EquipmentCode", "SequenceNumber", "EquipmentIdentifier", "Tag", "DWGTitle", "Rev", "Version", "Description", "Size", "FluidCode", "PipeLinesTag", "PipingClass", "ClassName", "OnSkid", "Failure", "Switches", "From", "To", "Accessories", "DesignTemp", "NominalPressure", "ValveSpecNumber", "PNRating", "TrackingNumber", "ProjectId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    284   ��      W          0    72138    ServiceBank 
   TABLE DATA           �   COPY public."ServiceBank" ("Id", "Bank", "ProjectId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    274   ͋      X          0    72148    ServiceTrain 
   TABLE DATA           �   COPY public."ServiceTrain" ("Id", "Train", "ProjectId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    275   ō      Y          0    72158    ServiceZone 
   TABLE DATA           �   COPY public."ServiceZone" ("Id", "Zone", "Description", "Area", "ProjectId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    276   >�      Z          0    72170    SignalExtension 
   TABLE DATA           �   COPY public."SignalExtension" ("Id", "Extension", "CBVariableType", "PCS7VariableType", "Kind", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    277   �      q          0    72450    Skid 
   TABLE DATA           �   COPY public."Skid" ("Id", "Type", "Description", "TagId", "ReferenceDocumentId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    300   S�      r          0    72465    Stand 
   TABLE DATA           �   COPY public."Stand" ("Id", "Type", "Area", "Description", "ReferenceDocumentId", "TagId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    301   ��      b          0    72224    Stream 
   TABLE DATA           �   COPY public."Stream" ("Id", "StreamName", "Description", "ProjectId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    285   �      c          0    72234 
   SubProcess 
   TABLE DATA           �   COPY public."SubProcess" ("Id", "SubProcessName", "Description", "ProjectId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    286   �      s          0    72482 	   SubSystem 
   TABLE DATA           �   COPY public."SubSystem" ("Id", "Number", "Description", "SystemId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    302   ��      l          0    72364    System 
   TABLE DATA           �   COPY public."System" ("Id", "Number", "Description", "WorkAreaPackId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    295   ��      k          0    72339    Tag 
   TABLE DATA           q  COPY public."Tag" ("Id", "TagName", "SequenceNumber", "EquipmentIdentifier", "ProcessId", "SubProcessId", "StreamId", "EquipmentCodeId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate", "ProjectId", "Field1String", "Field2String", "Field3String", "Field4String", "TagDescriptorId", "TagTypeId") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    294   ��      {          0    72765    TagDescriptor 
   TABLE DATA           �   COPY public."TagDescriptor" ("Id", "Name", "Description", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    310   �V      z          0    72754    TagField 
   TABLE DATA           �   COPY public."TagField" ("Id", "Name", "Source", "Separator", "Position", "ProjectId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    309   �Y      |          0    72770    TagType 
   TABLE DATA           �   COPY public."TagType" ("Id", "Name", "Description", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    311   �]      d          0    72246    UIChangeLog 
   TABLE DATA           �   COPY public."UIChangeLog" ("Id", "Tag", "PLCNumber", "Changes", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate", "Type") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    287   bz      e          0    72253    WorkAreaPack 
   TABLE DATA           �   COPY public."WorkAreaPack" ("Id", "Number", "Description", "ProjectId", "CreatedBy", "CreatedDate", "IsActive", "ModifiedBy", "ModifiedDate", "IsDeleted", "DeletedBy", "DeletedDate") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    288   ��      :          0    71912    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          FMxHWQ43Xh2rpTegRGYBV9    false    245   ��      �           0    0    ICMDRoleClaim_Id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."ICMDRoleClaim_Id_seq"', 1, false);
          public          FMxHWQ43Xh2rpTegRGYBV9    false    248            �           0    0    ICMDUserClaim_Id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."ICMDUserClaim_Id_seq"', 1, false);
          public          FMxHWQ43Xh2rpTegRGYBV9    false    250            �           2606    72382 *   AttributeDefinition PK_AttributeDefinition 
   CONSTRAINT     n   ALTER TABLE ONLY public."AttributeDefinition"
    ADD CONSTRAINT "PK_AttributeDefinition" PRIMARY KEY ("Id");
 X   ALTER TABLE ONLY public."AttributeDefinition" DROP CONSTRAINT "PK_AttributeDefinition";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    296                       2606    72602     AttributeValue PK_AttributeValue 
   CONSTRAINT     d   ALTER TABLE ONLY public."AttributeValue"
    ADD CONSTRAINT "PK_AttributeValue" PRIMARY KEY ("Id");
 N   ALTER TABLE ONLY public."AttributeValue" DROP CONSTRAINT "PK_AttributeValue";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    305            �           2606    72404    Cable PK_Cable 
   CONSTRAINT     R   ALTER TABLE ONLY public."Cable"
    ADD CONSTRAINT "PK_Cable" PRIMARY KEY ("Id");
 <   ALTER TABLE ONLY public."Cable" DROP CONSTRAINT "PK_Cable";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    297            z           2606    72014    ChangeLog PK_ChangeLog 
   CONSTRAINT     Z   ALTER TABLE ONLY public."ChangeLog"
    ADD CONSTRAINT "PK_ChangeLog" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."ChangeLog" DROP CONSTRAINT "PK_ChangeLog";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    256            #           2606    72632 0   ControlSystemHierarchy PK_ControlSystemHierarchy 
   CONSTRAINT     t   ALTER TABLE ONLY public."ControlSystemHierarchy"
    ADD CONSTRAINT "PK_ControlSystemHierarchy" PRIMARY KEY ("Id");
 ^   ALTER TABLE ONLY public."ControlSystemHierarchy" DROP CONSTRAINT "PK_ControlSystemHierarchy";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    306                       2606    72525    Device PK_Device 
   CONSTRAINT     T   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "PK_Device" PRIMARY KEY ("Id");
 >   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "PK_Device";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304            +           2606    72662 ,   DeviceAttributeValue PK_DeviceAttributeValue 
   CONSTRAINT     p   ALTER TABLE ONLY public."DeviceAttributeValue"
    ADD CONSTRAINT "PK_DeviceAttributeValue" PRIMARY KEY ("Id");
 Z   ALTER TABLE ONLY public."DeviceAttributeValue" DROP CONSTRAINT "PK_DeviceAttributeValue";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    308            |           2606    72019 ,   DeviceClassification PK_DeviceClassification 
   CONSTRAINT     p   ALTER TABLE ONLY public."DeviceClassification"
    ADD CONSTRAINT "PK_DeviceClassification" PRIMARY KEY ("Id");
 Z   ALTER TABLE ONLY public."DeviceClassification" DROP CONSTRAINT "PK_DeviceClassification";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    257            �           2606    72271    DeviceModel PK_DeviceModel 
   CONSTRAINT     ^   ALTER TABLE ONLY public."DeviceModel"
    ADD CONSTRAINT "PK_DeviceModel" PRIMARY KEY ("Id");
 H   ALTER TABLE ONLY public."DeviceModel" DROP CONSTRAINT "PK_DeviceModel";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    289            ~           2606    72024    DeviceType PK_DeviceType 
   CONSTRAINT     \   ALTER TABLE ONLY public."DeviceType"
    ADD CONSTRAINT "PK_DeviceType" PRIMARY KEY ("Id");
 F   ALTER TABLE ONLY public."DeviceType" DROP CONSTRAINT "PK_DeviceType";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    258            �           2606    72029    EquipmentCode PK_EquipmentCode 
   CONSTRAINT     b   ALTER TABLE ONLY public."EquipmentCode"
    ADD CONSTRAINT "PK_EquipmentCode" PRIMARY KEY ("Id");
 L   ALTER TABLE ONLY public."EquipmentCode" DROP CONSTRAINT "PK_EquipmentCode";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    259            �           2606    72034    FailState PK_FailState 
   CONSTRAINT     Z   ALTER TABLE ONLY public."FailState"
    ADD CONSTRAINT "PK_FailState" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."FailState" DROP CONSTRAINT "PK_FailState";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    260            �           2606    72039    GSDType PK_GSDType 
   CONSTRAINT     V   ALTER TABLE ONLY public."GSDType"
    ADD CONSTRAINT "PK_GSDType" PRIMARY KEY ("Id");
 @   ALTER TABLE ONLY public."GSDType" DROP CONSTRAINT "PK_GSDType";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    261            �           2606    72313 2   GSDType_SignalExtension PK_GSDType_SignalExtension 
   CONSTRAINT     v   ALTER TABLE ONLY public."GSDType_SignalExtension"
    ADD CONSTRAINT "PK_GSDType_SignalExtension" PRIMARY KEY ("Id");
 `   ALTER TABLE ONLY public."GSDType_SignalExtension" DROP CONSTRAINT "PK_GSDType_SignalExtension";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    292            b           2606    71923    ICMDRole PK_ICMDRole 
   CONSTRAINT     X   ALTER TABLE ONLY public."ICMDRole"
    ADD CONSTRAINT "PK_ICMDRole" PRIMARY KEY ("Id");
 B   ALTER TABLE ONLY public."ICMDRole" DROP CONSTRAINT "PK_ICMDRole";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    246            k           2606    71938    ICMDRoleClaim PK_ICMDRoleClaim 
   CONSTRAINT     b   ALTER TABLE ONLY public."ICMDRoleClaim"
    ADD CONSTRAINT "PK_ICMDRoleClaim" PRIMARY KEY ("Id");
 L   ALTER TABLE ONLY public."ICMDRoleClaim" DROP CONSTRAINT "PK_ICMDRoleClaim";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    249            g           2606    71930    ICMDUser PK_ICMDUser 
   CONSTRAINT     X   ALTER TABLE ONLY public."ICMDUser"
    ADD CONSTRAINT "PK_ICMDUser" PRIMARY KEY ("Id");
 B   ALTER TABLE ONLY public."ICMDUser" DROP CONSTRAINT "PK_ICMDUser";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    247            n           2606    71951    ICMDUserClaim PK_ICMDUserClaim 
   CONSTRAINT     b   ALTER TABLE ONLY public."ICMDUserClaim"
    ADD CONSTRAINT "PK_ICMDUserClaim" PRIMARY KEY ("Id");
 L   ALTER TABLE ONLY public."ICMDUserClaim" DROP CONSTRAINT "PK_ICMDUserClaim";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    251            q           2606    71963    ICMDUserLogin PK_ICMDUserLogin 
   CONSTRAINT     |   ALTER TABLE ONLY public."ICMDUserLogin"
    ADD CONSTRAINT "PK_ICMDUserLogin" PRIMARY KEY ("LoginProvider", "ProviderKey");
 L   ALTER TABLE ONLY public."ICMDUserLogin" DROP CONSTRAINT "PK_ICMDUserLogin";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    252    252            t           2606    71973    ICMDUserRole PK_ICMDUserRole 
   CONSTRAINT     n   ALTER TABLE ONLY public."ICMDUserRole"
    ADD CONSTRAINT "PK_ICMDUserRole" PRIMARY KEY ("UserId", "RoleId");
 J   ALTER TABLE ONLY public."ICMDUserRole" DROP CONSTRAINT "PK_ICMDUserRole";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    253    253            v           2606    71990    ICMDUserToken PK_ICMDUserToken 
   CONSTRAINT        ALTER TABLE ONLY public."ICMDUserToken"
    ADD CONSTRAINT "PK_ICMDUserToken" PRIMARY KEY ("UserId", "LoginProvider", "Name");
 L   ALTER TABLE ONLY public."ICMDUserToken" DROP CONSTRAINT "PK_ICMDUserToken";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    254    254    254            �           2606    72046 ,   InstrumentListImport PK_InstrumentListImport 
   CONSTRAINT     p   ALTER TABLE ONLY public."InstrumentListImport"
    ADD CONSTRAINT "PK_InstrumentListImport" PRIMARY KEY ("Id");
 Z   ALTER TABLE ONLY public."InstrumentListImport" DROP CONSTRAINT "PK_InstrumentListImport";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    262            �           2606    72424    JunctionBox PK_JunctionBox 
   CONSTRAINT     ^   ALTER TABLE ONLY public."JunctionBox"
    ADD CONSTRAINT "PK_JunctionBox" PRIMARY KEY ("Id");
 H   ALTER TABLE ONLY public."JunctionBox" DROP CONSTRAINT "PK_JunctionBox";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    298            �           2606    72053    Manufacturer PK_Manufacturer 
   CONSTRAINT     `   ALTER TABLE ONLY public."Manufacturer"
    ADD CONSTRAINT "PK_Manufacturer" PRIMARY KEY ("Id");
 J   ALTER TABLE ONLY public."Manufacturer" DROP CONSTRAINT "PK_Manufacturer";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    263            5           2606    73131    MenuItems PK_MenuItems 
   CONSTRAINT     Z   ALTER TABLE ONLY public."MenuItems"
    ADD CONSTRAINT "PK_MenuItems" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."MenuItems" DROP CONSTRAINT "PK_MenuItems";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    312            9           2606    73141     MenuPermission PK_MenuPermission 
   CONSTRAINT     d   ALTER TABLE ONLY public."MenuPermission"
    ADD CONSTRAINT "PK_MenuPermission" PRIMARY KEY ("Id");
 N   ALTER TABLE ONLY public."MenuPermission" DROP CONSTRAINT "PK_MenuPermission";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    313            >           2606    73172    MetaData PK_MetaData 
   CONSTRAINT     X   ALTER TABLE ONLY public."MetaData"
    ADD CONSTRAINT "PK_MetaData" PRIMARY KEY ("Id");
 B   ALTER TABLE ONLY public."MetaData" DROP CONSTRAINT "PK_MetaData";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    315            �           2606    72058     NatureOfSignal PK_NatureOfSignal 
   CONSTRAINT     d   ALTER TABLE ONLY public."NatureOfSignal"
    ADD CONSTRAINT "PK_NatureOfSignal" PRIMARY KEY ("Id");
 N   ALTER TABLE ONLY public."NatureOfSignal" DROP CONSTRAINT "PK_NatureOfSignal";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    264            �           2606    72328 >   NatureOfSignalSignalExtension PK_NatureOfSignalSignalExtension 
   CONSTRAINT     �   ALTER TABLE ONLY public."NatureOfSignalSignalExtension"
    ADD CONSTRAINT "PK_NatureOfSignalSignalExtension" PRIMARY KEY ("Id");
 l   ALTER TABLE ONLY public."NatureOfSignalSignalExtension" DROP CONSTRAINT "PK_NatureOfSignalSignalExtension";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    293            �           2606    72065 2   NonInstrumentListImport PK_NonInstrumentListImport 
   CONSTRAINT     v   ALTER TABLE ONLY public."NonInstrumentListImport"
    ADD CONSTRAINT "PK_NonInstrumentListImport" PRIMARY KEY ("Id");
 `   ALTER TABLE ONLY public."NonInstrumentListImport" DROP CONSTRAINT "PK_NonInstrumentListImport";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    265            �           2606    72072    OLMDPTDPR PK_OLMDPTDPR 
   CONSTRAINT     Z   ALTER TABLE ONLY public."OLMDPTDPR"
    ADD CONSTRAINT "PK_OLMDPTDPR" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."OLMDPTDPR" DROP CONSTRAINT "PK_OLMDPTDPR";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    266            �           2606    72079    OMItem PK_OMItem 
   CONSTRAINT     T   ALTER TABLE ONLY public."OMItem"
    ADD CONSTRAINT "PK_OMItem" PRIMARY KEY ("Id");
 >   ALTER TABLE ONLY public."OMItem" DROP CONSTRAINT "PK_OMItem";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    267            �           2606    72086 8   OMServiceDescriptionImport PK_OMServiceDescriptionImport 
   CONSTRAINT     |   ALTER TABLE ONLY public."OMServiceDescriptionImport"
    ADD CONSTRAINT "PK_OMServiceDescriptionImport" PRIMARY KEY ("Id");
 f   ALTER TABLE ONLY public."OMServiceDescriptionImport" DROP CONSTRAINT "PK_OMServiceDescriptionImport";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    268            �           2606    72439    Panel PK_Panel 
   CONSTRAINT     R   ALTER TABLE ONLY public."Panel"
    ADD CONSTRAINT "PK_Panel" PRIMARY KEY ("Id");
 <   ALTER TABLE ONLY public."Panel" DROP CONSTRAINT "PK_Panel";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    299            <           2606    73159 ,   PermissionManagement PK_PermissionManagement 
   CONSTRAINT     p   ALTER TABLE ONLY public."PermissionManagement"
    ADD CONSTRAINT "PK_PermissionManagement" PRIMARY KEY ("Id");
 Z   ALTER TABLE ONLY public."PermissionManagement" DROP CONSTRAINT "PK_PermissionManagement";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    314                       2606    72498    PnIdTag PK_PnIdTag 
   CONSTRAINT     V   ALTER TABLE ONLY public."PnIdTag"
    ADD CONSTRAINT "PK_PnIdTag" PRIMARY KEY ("Id");
 @   ALTER TABLE ONLY public."PnIdTag" DROP CONSTRAINT "PK_PnIdTag";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    303            �           2606    72098    Process PK_Process 
   CONSTRAINT     V   ALTER TABLE ONLY public."Process"
    ADD CONSTRAINT "PK_Process" PRIMARY KEY ("Id");
 @   ALTER TABLE ONLY public."Process" DROP CONSTRAINT "PK_Process";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    269            �           2606    72281 $   ProcessHierarchy PK_ProcessHierarchy 
   CONSTRAINT     h   ALTER TABLE ONLY public."ProcessHierarchy"
    ADD CONSTRAINT "PK_ProcessHierarchy" PRIMARY KEY ("Id");
 R   ALTER TABLE ONLY public."ProcessHierarchy" DROP CONSTRAINT "PK_ProcessHierarchy";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    290            �           2606    72110    ProcessLevel PK_ProcessLevel 
   CONSTRAINT     `   ALTER TABLE ONLY public."ProcessLevel"
    ADD CONSTRAINT "PK_ProcessLevel" PRIMARY KEY ("Id");
 J   ALTER TABLE ONLY public."ProcessLevel" DROP CONSTRAINT "PK_ProcessLevel";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    270            x           2606    72007    Project PK_Project 
   CONSTRAINT     V   ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "PK_Project" PRIMARY KEY ("Id");
 @   ALTER TABLE ONLY public."Project" DROP CONSTRAINT "PK_Project";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    255            �           2606    72115    ProjectUser PK_ProjectUser 
   CONSTRAINT     ^   ALTER TABLE ONLY public."ProjectUser"
    ADD CONSTRAINT "PK_ProjectUser" PRIMARY KEY ("Id");
 H   ALTER TABLE ONLY public."ProjectUser" DROP CONSTRAINT "PK_ProjectUser";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    271            �           2606    72298 &   ReferenceDocument PK_ReferenceDocument 
   CONSTRAINT     j   ALTER TABLE ONLY public."ReferenceDocument"
    ADD CONSTRAINT "PK_ReferenceDocument" PRIMARY KEY ("Id");
 T   ALTER TABLE ONLY public."ReferenceDocument" DROP CONSTRAINT "PK_ReferenceDocument";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    291            '           2606    72647 2   ReferenceDocumentDevice PK_ReferenceDocumentDevice 
   CONSTRAINT     v   ALTER TABLE ONLY public."ReferenceDocumentDevice"
    ADD CONSTRAINT "PK_ReferenceDocumentDevice" PRIMARY KEY ("Id");
 `   ALTER TABLE ONLY public."ReferenceDocumentDevice" DROP CONSTRAINT "PK_ReferenceDocumentDevice";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    307            �           2606    72130 .   ReferenceDocumentType PK_ReferenceDocumentType 
   CONSTRAINT     r   ALTER TABLE ONLY public."ReferenceDocumentType"
    ADD CONSTRAINT "PK_ReferenceDocumentType" PRIMARY KEY ("Id");
 \   ALTER TABLE ONLY public."ReferenceDocumentType" DROP CONSTRAINT "PK_ReferenceDocumentType";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    272            �           2606    72137    Report PK_Report 
   CONSTRAINT     T   ALTER TABLE ONLY public."Report"
    ADD CONSTRAINT "PK_Report" PRIMARY KEY ("Id");
 >   ALTER TABLE ONLY public."Report" DROP CONSTRAINT "PK_Report";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    273            �           2606    72181 &   SSISEquipmentList PK_SSISEquipmentList 
   CONSTRAINT     j   ALTER TABLE ONLY public."SSISEquipmentList"
    ADD CONSTRAINT "PK_SSISEquipmentList" PRIMARY KEY ("Id");
 T   ALTER TABLE ONLY public."SSISEquipmentList" DROP CONSTRAINT "PK_SSISEquipmentList";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    278            �           2606    72188    SSISFittings PK_SSISFittings 
   CONSTRAINT     `   ALTER TABLE ONLY public."SSISFittings"
    ADD CONSTRAINT "PK_SSISFittings" PRIMARY KEY ("Id");
 J   ALTER TABLE ONLY public."SSISFittings" DROP CONSTRAINT "PK_SSISFittings";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    279            �           2606    72195 "   SSISInstruments PK_SSISInstruments 
   CONSTRAINT     f   ALTER TABLE ONLY public."SSISInstruments"
    ADD CONSTRAINT "PK_SSISInstruments" PRIMARY KEY ("Id");
 P   ALTER TABLE ONLY public."SSISInstruments" DROP CONSTRAINT "PK_SSISInstruments";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    280            �           2606    72202 >   SSISInstrumentsVsStands110728 PK_SSISInstrumentsVsStands110728 
   CONSTRAINT     �   ALTER TABLE ONLY public."SSISInstrumentsVsStands110728"
    ADD CONSTRAINT "PK_SSISInstrumentsVsStands110728" PRIMARY KEY ("Id");
 l   ALTER TABLE ONLY public."SSISInstrumentsVsStands110728" DROP CONSTRAINT "PK_SSISInstrumentsVsStands110728";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    281            �           2606    72209    SSISStandList PK_SSISStandList 
   CONSTRAINT     b   ALTER TABLE ONLY public."SSISStandList"
    ADD CONSTRAINT "PK_SSISStandList" PRIMARY KEY ("Id");
 L   ALTER TABLE ONLY public."SSISStandList" DROP CONSTRAINT "PK_SSISStandList";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    282            �           2606    72216     SSISStandTypes PK_SSISStandTypes 
   CONSTRAINT     d   ALTER TABLE ONLY public."SSISStandTypes"
    ADD CONSTRAINT "PK_SSISStandTypes" PRIMARY KEY ("Id");
 N   ALTER TABLE ONLY public."SSISStandTypes" DROP CONSTRAINT "PK_SSISStandTypes";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    283            �           2606    72223    SSISValveList PK_SSISValveList 
   CONSTRAINT     b   ALTER TABLE ONLY public."SSISValveList"
    ADD CONSTRAINT "PK_SSISValveList" PRIMARY KEY ("Id");
 L   ALTER TABLE ONLY public."SSISValveList" DROP CONSTRAINT "PK_SSISValveList";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    284            �           2606    72142    ServiceBank PK_ServiceBank 
   CONSTRAINT     ^   ALTER TABLE ONLY public."ServiceBank"
    ADD CONSTRAINT "PK_ServiceBank" PRIMARY KEY ("Id");
 H   ALTER TABLE ONLY public."ServiceBank" DROP CONSTRAINT "PK_ServiceBank";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    274            �           2606    72152    ServiceTrain PK_ServiceTrain 
   CONSTRAINT     `   ALTER TABLE ONLY public."ServiceTrain"
    ADD CONSTRAINT "PK_ServiceTrain" PRIMARY KEY ("Id");
 J   ALTER TABLE ONLY public."ServiceTrain" DROP CONSTRAINT "PK_ServiceTrain";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    275            �           2606    72164    ServiceZone PK_ServiceZone 
   CONSTRAINT     ^   ALTER TABLE ONLY public."ServiceZone"
    ADD CONSTRAINT "PK_ServiceZone" PRIMARY KEY ("Id");
 H   ALTER TABLE ONLY public."ServiceZone" DROP CONSTRAINT "PK_ServiceZone";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    276            �           2606    72174 "   SignalExtension PK_SignalExtension 
   CONSTRAINT     f   ALTER TABLE ONLY public."SignalExtension"
    ADD CONSTRAINT "PK_SignalExtension" PRIMARY KEY ("Id");
 P   ALTER TABLE ONLY public."SignalExtension" DROP CONSTRAINT "PK_SignalExtension";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    277            �           2606    72454    Skid PK_Skid 
   CONSTRAINT     P   ALTER TABLE ONLY public."Skid"
    ADD CONSTRAINT "PK_Skid" PRIMARY KEY ("Id");
 :   ALTER TABLE ONLY public."Skid" DROP CONSTRAINT "PK_Skid";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    300            �           2606    72471    Stand PK_Stand 
   CONSTRAINT     R   ALTER TABLE ONLY public."Stand"
    ADD CONSTRAINT "PK_Stand" PRIMARY KEY ("Id");
 <   ALTER TABLE ONLY public."Stand" DROP CONSTRAINT "PK_Stand";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    301            �           2606    72228    Stream PK_Stream 
   CONSTRAINT     T   ALTER TABLE ONLY public."Stream"
    ADD CONSTRAINT "PK_Stream" PRIMARY KEY ("Id");
 >   ALTER TABLE ONLY public."Stream" DROP CONSTRAINT "PK_Stream";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    285            �           2606    72240    SubProcess PK_SubProcess 
   CONSTRAINT     \   ALTER TABLE ONLY public."SubProcess"
    ADD CONSTRAINT "PK_SubProcess" PRIMARY KEY ("Id");
 F   ALTER TABLE ONLY public."SubProcess" DROP CONSTRAINT "PK_SubProcess";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    286                       2606    72488    SubSystem PK_SubSystem 
   CONSTRAINT     Z   ALTER TABLE ONLY public."SubSystem"
    ADD CONSTRAINT "PK_SubSystem" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."SubSystem" DROP CONSTRAINT "PK_SubSystem";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    302            �           2606    72370    System PK_System 
   CONSTRAINT     T   ALTER TABLE ONLY public."System"
    ADD CONSTRAINT "PK_System" PRIMARY KEY ("Id");
 >   ALTER TABLE ONLY public."System" DROP CONSTRAINT "PK_System";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    295            �           2606    72343 
   Tag PK_Tag 
   CONSTRAINT     N   ALTER TABLE ONLY public."Tag"
    ADD CONSTRAINT "PK_Tag" PRIMARY KEY ("Id");
 8   ALTER TABLE ONLY public."Tag" DROP CONSTRAINT "PK_Tag";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    294            0           2606    72769    TagDescriptor PK_TagDescriptor 
   CONSTRAINT     b   ALTER TABLE ONLY public."TagDescriptor"
    ADD CONSTRAINT "PK_TagDescriptor" PRIMARY KEY ("Id");
 L   ALTER TABLE ONLY public."TagDescriptor" DROP CONSTRAINT "PK_TagDescriptor";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    310            .           2606    72758    TagField PK_TagField 
   CONSTRAINT     X   ALTER TABLE ONLY public."TagField"
    ADD CONSTRAINT "PK_TagField" PRIMARY KEY ("Id");
 B   ALTER TABLE ONLY public."TagField" DROP CONSTRAINT "PK_TagField";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    309            2           2606    72774    TagType PK_TagType 
   CONSTRAINT     V   ALTER TABLE ONLY public."TagType"
    ADD CONSTRAINT "PK_TagType" PRIMARY KEY ("Id");
 @   ALTER TABLE ONLY public."TagType" DROP CONSTRAINT "PK_TagType";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    311            �           2606    72252    UIChangeLog PK_UIChangeLog 
   CONSTRAINT     ^   ALTER TABLE ONLY public."UIChangeLog"
    ADD CONSTRAINT "PK_UIChangeLog" PRIMARY KEY ("Id");
 H   ALTER TABLE ONLY public."UIChangeLog" DROP CONSTRAINT "PK_UIChangeLog";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    287            �           2606    72259    WorkAreaPack PK_WorkAreaPack 
   CONSTRAINT     `   ALTER TABLE ONLY public."WorkAreaPack"
    ADD CONSTRAINT "PK_WorkAreaPack" PRIMARY KEY ("Id");
 J   ALTER TABLE ONLY public."WorkAreaPack" DROP CONSTRAINT "PK_WorkAreaPack";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    288            `           2606    71916 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    245            d           1259    71998 
   EmailIndex    INDEX     P   CREATE INDEX "EmailIndex" ON public."ICMDUser" USING btree ("NormalizedEmail");
     DROP INDEX public."EmailIndex";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    247            �           1259    72673 $   IX_AttributeDefinition_DeviceModelId    INDEX     s   CREATE INDEX "IX_AttributeDefinition_DeviceModelId" ON public."AttributeDefinition" USING btree ("DeviceModelId");
 :   DROP INDEX public."IX_AttributeDefinition_DeviceModelId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    296            �           1259    72674 #   IX_AttributeDefinition_DeviceTypeId    INDEX     q   CREATE INDEX "IX_AttributeDefinition_DeviceTypeId" ON public."AttributeDefinition" USING btree ("DeviceTypeId");
 9   DROP INDEX public."IX_AttributeDefinition_DeviceTypeId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    296            �           1259    72675 '   IX_AttributeDefinition_NatureOfSignalId    INDEX     y   CREATE INDEX "IX_AttributeDefinition_NatureOfSignalId" ON public."AttributeDefinition" USING btree ("NatureOfSignalId");
 =   DROP INDEX public."IX_AttributeDefinition_NatureOfSignalId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    296                       1259    72676 '   IX_AttributeValue_AttributeDefinitionId    INDEX     y   CREATE INDEX "IX_AttributeValue_AttributeDefinitionId" ON public."AttributeValue" USING btree ("AttributeDefinitionId");
 =   DROP INDEX public."IX_AttributeValue_AttributeDefinitionId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    305                       1259    72677    IX_AttributeValue_DeviceId    INDEX     _   CREATE INDEX "IX_AttributeValue_DeviceId" ON public."AttributeValue" USING btree ("DeviceId");
 0   DROP INDEX public."IX_AttributeValue_DeviceId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    305                       1259    72678    IX_AttributeValue_DeviceModelId    INDEX     i   CREATE INDEX "IX_AttributeValue_DeviceModelId" ON public."AttributeValue" USING btree ("DeviceModelId");
 5   DROP INDEX public."IX_AttributeValue_DeviceModelId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    305                       1259    72679    IX_AttributeValue_DeviceTypeId    INDEX     g   CREATE INDEX "IX_AttributeValue_DeviceTypeId" ON public."AttributeValue" USING btree ("DeviceTypeId");
 4   DROP INDEX public."IX_AttributeValue_DeviceTypeId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    305                       1259    72680 "   IX_AttributeValue_NatureOfSignalId    INDEX     o   CREATE INDEX "IX_AttributeValue_NatureOfSignalId" ON public."AttributeValue" USING btree ("NatureOfSignalId");
 8   DROP INDEX public."IX_AttributeValue_NatureOfSignalId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    305            �           1259    72681    IX_Cable_DestTagId    INDEX     O   CREATE INDEX "IX_Cable_DestTagId" ON public."Cable" USING btree ("DestTagId");
 (   DROP INDEX public."IX_Cable_DestTagId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    297            �           1259    72682    IX_Cable_OriginTagId    INDEX     S   CREATE INDEX "IX_Cable_OriginTagId" ON public."Cable" USING btree ("OriginTagId");
 *   DROP INDEX public."IX_Cable_OriginTagId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    297            �           1259    72683    IX_Cable_TagId    INDEX     G   CREATE INDEX "IX_Cable_TagId" ON public."Cable" USING btree ("TagId");
 $   DROP INDEX public."IX_Cable_TagId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    297                        1259    72684 '   IX_ControlSystemHierarchy_ChildDeviceId    INDEX     y   CREATE INDEX "IX_ControlSystemHierarchy_ChildDeviceId" ON public."ControlSystemHierarchy" USING btree ("ChildDeviceId");
 =   DROP INDEX public."IX_ControlSystemHierarchy_ChildDeviceId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    306            !           1259    72685 (   IX_ControlSystemHierarchy_ParentDeviceId    INDEX     {   CREATE INDEX "IX_ControlSystemHierarchy_ParentDeviceId" ON public."ControlSystemHierarchy" USING btree ("ParentDeviceId");
 >   DROP INDEX public."IX_ControlSystemHierarchy_ParentDeviceId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    306            (           1259    72700 (   IX_DeviceAttributeValue_AttributeValueId    INDEX     {   CREATE INDEX "IX_DeviceAttributeValue_AttributeValueId" ON public."DeviceAttributeValue" USING btree ("AttributeValueId");
 >   DROP INDEX public."IX_DeviceAttributeValue_AttributeValueId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    308            )           1259    72701     IX_DeviceAttributeValue_DeviceId    INDEX     k   CREATE INDEX "IX_DeviceAttributeValue_DeviceId" ON public."DeviceAttributeValue" USING btree ("DeviceId");
 6   DROP INDEX public."IX_DeviceAttributeValue_DeviceId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    308            �           1259    72702    IX_DeviceModel_ManufacturerId    INDEX     e   CREATE INDEX "IX_DeviceModel_ManufacturerId" ON public."DeviceModel" USING btree ("ManufacturerId");
 3   DROP INDEX public."IX_DeviceModel_ManufacturerId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    289            	           1259    72686    IX_Device_DeviceModelId    INDEX     Y   CREATE INDEX "IX_Device_DeviceModelId" ON public."Device" USING btree ("DeviceModelId");
 -   DROP INDEX public."IX_Device_DeviceModelId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304            
           1259    72687    IX_Device_DeviceTypeId    INDEX     W   CREATE INDEX "IX_Device_DeviceTypeId" ON public."Device" USING btree ("DeviceTypeId");
 ,   DROP INDEX public."IX_Device_DeviceTypeId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304                       1259    72688    IX_Device_FailStateId    INDEX     U   CREATE INDEX "IX_Device_FailStateId" ON public."Device" USING btree ("FailStateId");
 +   DROP INDEX public."IX_Device_FailStateId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304                       1259    72689    IX_Device_JunctionBoxTagId    INDEX     _   CREATE INDEX "IX_Device_JunctionBoxTagId" ON public."Device" USING btree ("JunctionBoxTagId");
 0   DROP INDEX public."IX_Device_JunctionBoxTagId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304                       1259    72690    IX_Device_NatureOfSignalId    INDEX     _   CREATE INDEX "IX_Device_NatureOfSignalId" ON public."Device" USING btree ("NatureOfSignalId");
 0   DROP INDEX public."IX_Device_NatureOfSignalId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304                       1259    72691    IX_Device_PanelTagId    INDEX     S   CREATE INDEX "IX_Device_PanelTagId" ON public."Device" USING btree ("PanelTagId");
 *   DROP INDEX public."IX_Device_PanelTagId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304                       1259    72692    IX_Device_ProcessLevelId    INDEX     [   CREATE INDEX "IX_Device_ProcessLevelId" ON public."Device" USING btree ("ProcessLevelId");
 .   DROP INDEX public."IX_Device_ProcessLevelId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304                       1259    72693    IX_Device_ServiceBankId    INDEX     Y   CREATE INDEX "IX_Device_ServiceBankId" ON public."Device" USING btree ("ServiceBankId");
 -   DROP INDEX public."IX_Device_ServiceBankId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304                       1259    72694    IX_Device_ServiceTrainId    INDEX     [   CREATE INDEX "IX_Device_ServiceTrainId" ON public."Device" USING btree ("ServiceTrainId");
 .   DROP INDEX public."IX_Device_ServiceTrainId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304                       1259    72695    IX_Device_ServiceZoneId    INDEX     Y   CREATE INDEX "IX_Device_ServiceZoneId" ON public."Device" USING btree ("ServiceZoneId");
 -   DROP INDEX public."IX_Device_ServiceZoneId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304                       1259    72696    IX_Device_SkidTagId    INDEX     Q   CREATE INDEX "IX_Device_SkidTagId" ON public."Device" USING btree ("SkidTagId");
 )   DROP INDEX public."IX_Device_SkidTagId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304                       1259    72697    IX_Device_StandTagId    INDEX     S   CREATE INDEX "IX_Device_StandTagId" ON public."Device" USING btree ("StandTagId");
 *   DROP INDEX public."IX_Device_StandTagId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304                       1259    72698    IX_Device_SubSystemId    INDEX     U   CREATE INDEX "IX_Device_SubSystemId" ON public."Device" USING btree ("SubSystemId");
 +   DROP INDEX public."IX_Device_SubSystemId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304                       1259    72699    IX_Device_TagId    INDEX     I   CREATE INDEX "IX_Device_TagId" ON public."Device" USING btree ("TagId");
 %   DROP INDEX public."IX_Device_TagId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    304            �           1259    72704    IX_GSDType_GSDTypeName    INDEX     ^   CREATE UNIQUE INDEX "IX_GSDType_GSDTypeName" ON public."GSDType" USING btree ("GSDTypeName");
 ,   DROP INDEX public."IX_GSDType_GSDTypeName";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    261            �           1259    72705 $   IX_GSDType_SignalExtension_GSDTypeId    INDEX     s   CREATE INDEX "IX_GSDType_SignalExtension_GSDTypeId" ON public."GSDType_SignalExtension" USING btree ("GSDTypeId");
 :   DROP INDEX public."IX_GSDType_SignalExtension_GSDTypeId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    292            �           1259    72706 ,   IX_GSDType_SignalExtension_SignalExtensionId    INDEX     �   CREATE INDEX "IX_GSDType_SignalExtension_SignalExtensionId" ON public."GSDType_SignalExtension" USING btree ("SignalExtensionId");
 B   DROP INDEX public."IX_GSDType_SignalExtension_SignalExtensionId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    292            i           1259    71997    IX_ICMDRoleClaim_RoleId    INDEX     Y   CREATE INDEX "IX_ICMDRoleClaim_RoleId" ON public."ICMDRoleClaim" USING btree ("RoleId");
 -   DROP INDEX public."IX_ICMDRoleClaim_RoleId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    249            l           1259    72000    IX_ICMDUserClaim_UserId    INDEX     Y   CREATE INDEX "IX_ICMDUserClaim_UserId" ON public."ICMDUserClaim" USING btree ("UserId");
 -   DROP INDEX public."IX_ICMDUserClaim_UserId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    251            o           1259    72001    IX_ICMDUserLogin_UserId    INDEX     Y   CREATE INDEX "IX_ICMDUserLogin_UserId" ON public."ICMDUserLogin" USING btree ("UserId");
 -   DROP INDEX public."IX_ICMDUserLogin_UserId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    252            r           1259    72002    IX_ICMDUserRole_RoleId    INDEX     W   CREATE INDEX "IX_ICMDUserRole_RoleId" ON public."ICMDUserRole" USING btree ("RoleId");
 ,   DROP INDEX public."IX_ICMDUserRole_RoleId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    253            e           1259    73037    IX_ICMDUser_ProjectId    INDEX     U   CREATE INDEX "IX_ICMDUser_ProjectId" ON public."ICMDUser" USING btree ("ProjectId");
 +   DROP INDEX public."IX_ICMDUser_ProjectId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    247            �           1259    72707 "   IX_JunctionBox_ReferenceDocumentId    INDEX     o   CREATE INDEX "IX_JunctionBox_ReferenceDocumentId" ON public."JunctionBox" USING btree ("ReferenceDocumentId");
 8   DROP INDEX public."IX_JunctionBox_ReferenceDocumentId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    298            �           1259    72708    IX_JunctionBox_TagId    INDEX     S   CREATE INDEX "IX_JunctionBox_TagId" ON public."JunctionBox" USING btree ("TagId");
 *   DROP INDEX public."IX_JunctionBox_TagId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    298            3           1259    73152    IX_MenuItems_ParentMenuId    INDEX     ]   CREATE INDEX "IX_MenuItems_ParentMenuId" ON public."MenuItems" USING btree ("ParentMenuId");
 /   DROP INDEX public."IX_MenuItems_ParentMenuId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    312            6           1259    73153    IX_MenuPermission_MenuId    INDEX     [   CREATE INDEX "IX_MenuPermission_MenuId" ON public."MenuPermission" USING btree ("MenuId");
 .   DROP INDEX public."IX_MenuPermission_MenuId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    313            7           1259    73154    IX_MenuPermission_RoleId    INDEX     [   CREATE INDEX "IX_MenuPermission_RoleId" ON public."MenuPermission" USING btree ("RoleId");
 .   DROP INDEX public."IX_MenuPermission_RoleId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    313            �           1259    72711 1   IX_NatureOfSignalSignalExtension_NatureOfSignalId    INDEX     �   CREATE INDEX "IX_NatureOfSignalSignalExtension_NatureOfSignalId" ON public."NatureOfSignalSignalExtension" USING btree ("NatureOfSignalId");
 G   DROP INDEX public."IX_NatureOfSignalSignalExtension_NatureOfSignalId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    293            �           1259    72712 2   IX_NatureOfSignalSignalExtension_SignalExtensionId    INDEX     �   CREATE INDEX "IX_NatureOfSignalSignalExtension_SignalExtensionId" ON public."NatureOfSignalSignalExtension" USING btree ("SignalExtensionId");
 H   DROP INDEX public."IX_NatureOfSignalSignalExtension_SignalExtensionId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    293            �           1259    72713 '   IX_OMServiceDescriptionImport_ProjectId    INDEX     y   CREATE INDEX "IX_OMServiceDescriptionImport_ProjectId" ON public."OMServiceDescriptionImport" USING btree ("ProjectId");
 =   DROP INDEX public."IX_OMServiceDescriptionImport_ProjectId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    268            �           1259    72714    IX_Panel_ReferenceDocumentId    INDEX     c   CREATE INDEX "IX_Panel_ReferenceDocumentId" ON public."Panel" USING btree ("ReferenceDocumentId");
 2   DROP INDEX public."IX_Panel_ReferenceDocumentId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    299            �           1259    72715    IX_Panel_TagId    INDEX     G   CREATE INDEX "IX_Panel_TagId" ON public."Panel" USING btree ("TagId");
 $   DROP INDEX public."IX_Panel_TagId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    299            :           1259    73165 (   IX_PermissionManagement_MenuPermissionId    INDEX     {   CREATE INDEX "IX_PermissionManagement_MenuPermissionId" ON public."PermissionManagement" USING btree ("MenuPermissionId");
 >   DROP INDEX public."IX_PermissionManagement_MenuPermissionId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    314                       1259    72716    IX_PnIdTag_DocumentReferenceId    INDEX     g   CREATE INDEX "IX_PnIdTag_DocumentReferenceId" ON public."PnIdTag" USING btree ("DocumentReferenceId");
 4   DROP INDEX public."IX_PnIdTag_DocumentReferenceId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    303                       1259    72717    IX_PnIdTag_FailStateId    INDEX     W   CREATE INDEX "IX_PnIdTag_FailStateId" ON public."PnIdTag" USING btree ("FailStateId");
 ,   DROP INDEX public."IX_PnIdTag_FailStateId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    303                       1259    72718    IX_PnIdTag_SkidId    INDEX     M   CREATE INDEX "IX_PnIdTag_SkidId" ON public."PnIdTag" USING btree ("SkidId");
 '   DROP INDEX public."IX_PnIdTag_SkidId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    303                       1259    72719    IX_PnIdTag_TagId    INDEX     K   CREATE INDEX "IX_PnIdTag_TagId" ON public."PnIdTag" USING btree ("TagId");
 &   DROP INDEX public."IX_PnIdTag_TagId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    303            �           1259    72722 '   IX_ProcessHierarchy_ChildProcessLevelId    INDEX     y   CREATE INDEX "IX_ProcessHierarchy_ChildProcessLevelId" ON public."ProcessHierarchy" USING btree ("ChildProcessLevelId");
 =   DROP INDEX public."IX_ProcessHierarchy_ChildProcessLevelId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    290            �           1259    72723 (   IX_ProcessHierarchy_ParentProcessLevelId    INDEX     {   CREATE INDEX "IX_ProcessHierarchy_ParentProcessLevelId" ON public."ProcessHierarchy" USING btree ("ParentProcessLevelId");
 >   DROP INDEX public."IX_ProcessHierarchy_ParentProcessLevelId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    290            �           1259    72724    IX_ProcessLevel_Name    INDEX     Z   CREATE UNIQUE INDEX "IX_ProcessLevel_Name" ON public."ProcessLevel" USING btree ("Name");
 *   DROP INDEX public."IX_ProcessLevel_Name";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    270            �           1259    72721    IX_Process_ProjectId    INDEX     S   CREATE INDEX "IX_Process_ProjectId" ON public."Process" USING btree ("ProjectId");
 *   DROP INDEX public."IX_Process_ProjectId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    269            �           1259    72725    IX_ProjectUser_ProjectId    INDEX     [   CREATE INDEX "IX_ProjectUser_ProjectId" ON public."ProjectUser" USING btree ("ProjectId");
 .   DROP INDEX public."IX_ProjectUser_ProjectId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    271            �           1259    72726    IX_ProjectUser_UserId    INDEX     U   CREATE INDEX "IX_ProjectUser_UserId" ON public."ProjectUser" USING btree ("UserId");
 +   DROP INDEX public."IX_ProjectUser_UserId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    271            $           1259    72729 #   IX_ReferenceDocumentDevice_DeviceId    INDEX     q   CREATE INDEX "IX_ReferenceDocumentDevice_DeviceId" ON public."ReferenceDocumentDevice" USING btree ("DeviceId");
 9   DROP INDEX public."IX_ReferenceDocumentDevice_DeviceId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    307            %           1259    72730 .   IX_ReferenceDocumentDevice_ReferenceDocumentId    INDEX     �   CREATE INDEX "IX_ReferenceDocumentDevice_ReferenceDocumentId" ON public."ReferenceDocumentDevice" USING btree ("ReferenceDocumentId");
 D   DROP INDEX public."IX_ReferenceDocumentDevice_ReferenceDocumentId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    307            �           1259    72727    IX_ReferenceDocument_ProjectId    INDEX     g   CREATE INDEX "IX_ReferenceDocument_ProjectId" ON public."ReferenceDocument" USING btree ("ProjectId");
 4   DROP INDEX public."IX_ReferenceDocument_ProjectId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    291            �           1259    72728 ,   IX_ReferenceDocument_ReferenceDocumentTypeId    INDEX     �   CREATE INDEX "IX_ReferenceDocument_ReferenceDocumentTypeId" ON public."ReferenceDocument" USING btree ("ReferenceDocumentTypeId");
 B   DROP INDEX public."IX_ReferenceDocument_ReferenceDocumentTypeId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    291            �           1259    72733    IX_ServiceBank_ProjectId    INDEX     [   CREATE INDEX "IX_ServiceBank_ProjectId" ON public."ServiceBank" USING btree ("ProjectId");
 .   DROP INDEX public."IX_ServiceBank_ProjectId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    274            �           1259    72734    IX_ServiceTrain_ProjectId    INDEX     ]   CREATE INDEX "IX_ServiceTrain_ProjectId" ON public."ServiceTrain" USING btree ("ProjectId");
 /   DROP INDEX public."IX_ServiceTrain_ProjectId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    275            �           1259    72735    IX_ServiceZone_ProjectId    INDEX     [   CREATE INDEX "IX_ServiceZone_ProjectId" ON public."ServiceZone" USING btree ("ProjectId");
 .   DROP INDEX public."IX_ServiceZone_ProjectId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    276            �           1259    72737    IX_Skid_ReferenceDocumentId    INDEX     a   CREATE INDEX "IX_Skid_ReferenceDocumentId" ON public."Skid" USING btree ("ReferenceDocumentId");
 1   DROP INDEX public."IX_Skid_ReferenceDocumentId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    300            �           1259    72738    IX_Skid_TagId    INDEX     E   CREATE INDEX "IX_Skid_TagId" ON public."Skid" USING btree ("TagId");
 #   DROP INDEX public."IX_Skid_TagId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    300            �           1259    72739    IX_Stand_ReferenceDocumentId    INDEX     c   CREATE INDEX "IX_Stand_ReferenceDocumentId" ON public."Stand" USING btree ("ReferenceDocumentId");
 2   DROP INDEX public."IX_Stand_ReferenceDocumentId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    301            �           1259    72740    IX_Stand_TagId    INDEX     G   CREATE INDEX "IX_Stand_TagId" ON public."Stand" USING btree ("TagId");
 $   DROP INDEX public."IX_Stand_TagId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    301            �           1259    72741    IX_Stream_ProjectId    INDEX     Q   CREATE INDEX "IX_Stream_ProjectId" ON public."Stream" USING btree ("ProjectId");
 )   DROP INDEX public."IX_Stream_ProjectId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    285            �           1259    72743    IX_SubProcess_ProjectId    INDEX     Y   CREATE INDEX "IX_SubProcess_ProjectId" ON public."SubProcess" USING btree ("ProjectId");
 -   DROP INDEX public."IX_SubProcess_ProjectId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    286                        1259    72744    IX_SubSystem_SystemId    INDEX     U   CREATE INDEX "IX_SubSystem_SystemId" ON public."SubSystem" USING btree ("SystemId");
 +   DROP INDEX public."IX_SubSystem_SystemId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    302            �           1259    72746    IX_System_WorkAreaPackId    INDEX     [   CREATE INDEX "IX_System_WorkAreaPackId" ON public."System" USING btree ("WorkAreaPackId");
 .   DROP INDEX public."IX_System_WorkAreaPackId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    295            ,           1259    72764    IX_TagField_ProjectId    INDEX     U   CREATE INDEX "IX_TagField_ProjectId" ON public."TagField" USING btree ("ProjectId");
 +   DROP INDEX public."IX_TagField_ProjectId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    309            �           1259    72747    IX_Tag_EquipmentCodeId    INDEX     W   CREATE INDEX "IX_Tag_EquipmentCodeId" ON public."Tag" USING btree ("EquipmentCodeId");
 ,   DROP INDEX public."IX_Tag_EquipmentCodeId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    294            �           1259    72748    IX_Tag_ProcessId    INDEX     K   CREATE INDEX "IX_Tag_ProcessId" ON public."Tag" USING btree ("ProcessId");
 &   DROP INDEX public."IX_Tag_ProcessId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    294            �           1259    72811    IX_Tag_ProjectId    INDEX     K   CREATE INDEX "IX_Tag_ProjectId" ON public."Tag" USING btree ("ProjectId");
 &   DROP INDEX public."IX_Tag_ProjectId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    294            �           1259    72749    IX_Tag_StreamId    INDEX     I   CREATE INDEX "IX_Tag_StreamId" ON public."Tag" USING btree ("StreamId");
 %   DROP INDEX public."IX_Tag_StreamId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    294            �           1259    72750    IX_Tag_SubProcessId    INDEX     Q   CREATE INDEX "IX_Tag_SubProcessId" ON public."Tag" USING btree ("SubProcessId");
 )   DROP INDEX public."IX_Tag_SubProcessId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    294            �           1259    72817    IX_Tag_TagDescriptorId    INDEX     W   CREATE INDEX "IX_Tag_TagDescriptorId" ON public."Tag" USING btree ("TagDescriptorId");
 ,   DROP INDEX public."IX_Tag_TagDescriptorId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    294            �           1259    72818    IX_Tag_TagTypeId    INDEX     K   CREATE INDEX "IX_Tag_TagTypeId" ON public."Tag" USING btree ("TagTypeId");
 &   DROP INDEX public."IX_Tag_TagTypeId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    294            �           1259    72753    IX_WorkAreaPack_ProjectId    INDEX     ]   CREATE INDEX "IX_WorkAreaPack_ProjectId" ON public."WorkAreaPack" USING btree ("ProjectId");
 /   DROP INDEX public."IX_WorkAreaPack_ProjectId";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    288            c           1259    71996    RoleNameIndex    INDEX     Y   CREATE UNIQUE INDEX "RoleNameIndex" ON public."ICMDRole" USING btree ("NormalizedName");
 #   DROP INDEX public."RoleNameIndex";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    246            h           1259    71999    UserNameIndex    INDEX     ]   CREATE UNIQUE INDEX "UserNameIndex" ON public."ICMDUser" USING btree ("NormalizedUserName");
 #   DROP INDEX public."UserNameIndex";
       public            FMxHWQ43Xh2rpTegRGYBV9    false    247            �           2620    73123 >   AttributeValue trattributevalue_maintainattributelookup_delete    TRIGGER     �   CREATE TRIGGER trattributevalue_maintainattributelookup_delete AFTER DELETE ON public."AttributeValue" REFERENCING OLD TABLE AS deleted FOR EACH STATEMENT EXECUTE FUNCTION public."fn_trAttributeValue_MaintainAttributeLookup_Delete"();
 Y   DROP TRIGGER trattributevalue_maintainattributelookup_delete ON public."AttributeValue";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    305    382            �           2620    73124 >   AttributeValue trattributevalue_maintainattributelookup_insert    TRIGGER     �   CREATE TRIGGER trattributevalue_maintainattributelookup_insert AFTER INSERT ON public."AttributeValue" REFERENCING NEW TABLE AS inserted FOR EACH STATEMENT EXECUTE FUNCTION public."fn_trAttributeValue_MaintainAttributeLookup_Delete"();
 Y   DROP TRIGGER trattributevalue_maintainattributelookup_insert ON public."AttributeValue";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    382    305            �           2620    73120 N   ControlSystemHierarchy trcontrolsystemhierarchy_maintainattributelookup_delete    TRIGGER     �   CREATE TRIGGER trcontrolsystemhierarchy_maintainattributelookup_delete AFTER DELETE ON public."ControlSystemHierarchy" REFERENCING OLD TABLE AS deleted FOR EACH STATEMENT EXECUTE FUNCTION public."fn_trAttributeValue_MaintainAttributeLookup_Delete"();
 i   DROP TRIGGER trcontrolsystemhierarchy_maintainattributelookup_delete ON public."ControlSystemHierarchy";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    306    382            �           2620    73121 N   ControlSystemHierarchy trcontrolsystemhierarchy_maintainattributelookup_insert    TRIGGER     �   CREATE TRIGGER trcontrolsystemhierarchy_maintainattributelookup_insert AFTER INSERT ON public."ControlSystemHierarchy" REFERENCING NEW TABLE AS inserted FOR EACH STATEMENT EXECUTE FUNCTION public."fn_trAttributeValue_MaintainAttributeLookup_Delete"();
 i   DROP TRIGGER trcontrolsystemhierarchy_maintainattributelookup_insert ON public."ControlSystemHierarchy";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    306    382            �           2620    73122 N   ControlSystemHierarchy trcontrolsystemhierarchy_maintainattributelookup_update    TRIGGER       CREATE TRIGGER trcontrolsystemhierarchy_maintainattributelookup_update AFTER UPDATE ON public."ControlSystemHierarchy" REFERENCING OLD TABLE AS deleted NEW TABLE AS inserted FOR EACH STATEMENT EXECUTE FUNCTION public."fn_trAttributeValue_MaintainAttributeLookup_Delete"();
 i   DROP TRIGGER trcontrolsystemhierarchy_maintainattributelookup_update ON public."ControlSystemHierarchy";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    382    306            a           2606    72775 D   AttributeDefinition FK_AttributeDefinition_DeviceModel_DeviceModelId    FK CONSTRAINT     �   ALTER TABLE ONLY public."AttributeDefinition"
    ADD CONSTRAINT "FK_AttributeDefinition_DeviceModel_DeviceModelId" FOREIGN KEY ("DeviceModelId") REFERENCES public."DeviceModel"("Id");
 r   ALTER TABLE ONLY public."AttributeDefinition" DROP CONSTRAINT "FK_AttributeDefinition_DeviceModel_DeviceModelId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    289    4297    296            b           2606    72780 B   AttributeDefinition FK_AttributeDefinition_DeviceType_DeviceTypeId    FK CONSTRAINT     �   ALTER TABLE ONLY public."AttributeDefinition"
    ADD CONSTRAINT "FK_AttributeDefinition_DeviceType_DeviceTypeId" FOREIGN KEY ("DeviceTypeId") REFERENCES public."DeviceType"("Id");
 p   ALTER TABLE ONLY public."AttributeDefinition" DROP CONSTRAINT "FK_AttributeDefinition_DeviceType_DeviceTypeId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    258    4222    296            c           2606    72785 J   AttributeDefinition FK_AttributeDefinition_NatureOfSignal_NatureOfSignalId    FK CONSTRAINT     �   ALTER TABLE ONLY public."AttributeDefinition"
    ADD CONSTRAINT "FK_AttributeDefinition_NatureOfSignal_NatureOfSignalId" FOREIGN KEY ("NatureOfSignalId") REFERENCES public."NatureOfSignal"("Id");
 x   ALTER TABLE ONLY public."AttributeDefinition" DROP CONSTRAINT "FK_AttributeDefinition_NatureOfSignal_NatureOfSignalId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4235    296    264            �           2606    72603 J   AttributeValue FK_AttributeValue_AttributeDefinition_AttributeDefinitionId    FK CONSTRAINT     �   ALTER TABLE ONLY public."AttributeValue"
    ADD CONSTRAINT "FK_AttributeValue_AttributeDefinition_AttributeDefinitionId" FOREIGN KEY ("AttributeDefinitionId") REFERENCES public."AttributeDefinition"("Id") ON DELETE CASCADE;
 x   ALTER TABLE ONLY public."AttributeValue" DROP CONSTRAINT "FK_AttributeValue_AttributeDefinition_AttributeDefinitionId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4330    296    305            �           2606    72790 :   AttributeValue FK_AttributeValue_DeviceModel_DeviceModelId    FK CONSTRAINT     �   ALTER TABLE ONLY public."AttributeValue"
    ADD CONSTRAINT "FK_AttributeValue_DeviceModel_DeviceModelId" FOREIGN KEY ("DeviceModelId") REFERENCES public."DeviceModel"("Id");
 h   ALTER TABLE ONLY public."AttributeValue" DROP CONSTRAINT "FK_AttributeValue_DeviceModel_DeviceModelId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4297    289    305            �           2606    72795 8   AttributeValue FK_AttributeValue_DeviceType_DeviceTypeId    FK CONSTRAINT     �   ALTER TABLE ONLY public."AttributeValue"
    ADD CONSTRAINT "FK_AttributeValue_DeviceType_DeviceTypeId" FOREIGN KEY ("DeviceTypeId") REFERENCES public."DeviceType"("Id");
 f   ALTER TABLE ONLY public."AttributeValue" DROP CONSTRAINT "FK_AttributeValue_DeviceType_DeviceTypeId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    305    258    4222            �           2606    72800 0   AttributeValue FK_AttributeValue_Device_DeviceId    FK CONSTRAINT     �   ALTER TABLE ONLY public."AttributeValue"
    ADD CONSTRAINT "FK_AttributeValue_Device_DeviceId" FOREIGN KEY ("DeviceId") REFERENCES public."Device"("Id");
 ^   ALTER TABLE ONLY public."AttributeValue" DROP CONSTRAINT "FK_AttributeValue_Device_DeviceId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4376    305    304            �           2606    72805 @   AttributeValue FK_AttributeValue_NatureOfSignal_NatureOfSignalId    FK CONSTRAINT     �   ALTER TABLE ONLY public."AttributeValue"
    ADD CONSTRAINT "FK_AttributeValue_NatureOfSignal_NatureOfSignalId" FOREIGN KEY ("NatureOfSignalId") REFERENCES public."NatureOfSignal"("Id");
 n   ALTER TABLE ONLY public."AttributeValue" DROP CONSTRAINT "FK_AttributeValue_NatureOfSignal_NatureOfSignalId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4235    264    305            d           2606    72405    Cable FK_Cable_Tag_DestTagId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Cable"
    ADD CONSTRAINT "FK_Cable_Tag_DestTagId" FOREIGN KEY ("DestTagId") REFERENCES public."Tag"("Id") ON DELETE CASCADE;
 J   ALTER TABLE ONLY public."Cable" DROP CONSTRAINT "FK_Cable_Tag_DestTagId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    297    294    4322            e           2606    72410    Cable FK_Cable_Tag_OriginTagId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Cable"
    ADD CONSTRAINT "FK_Cable_Tag_OriginTagId" FOREIGN KEY ("OriginTagId") REFERENCES public."Tag"("Id") ON DELETE CASCADE;
 L   ALTER TABLE ONLY public."Cable" DROP CONSTRAINT "FK_Cable_Tag_OriginTagId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    294    297    4322            f           2606    72415    Cable FK_Cable_Tag_TagId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Cable"
    ADD CONSTRAINT "FK_Cable_Tag_TagId" FOREIGN KEY ("TagId") REFERENCES public."Tag"("Id") ON DELETE CASCADE;
 F   ALTER TABLE ONLY public."Cable" DROP CONSTRAINT "FK_Cable_Tag_TagId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4322    294    297            �           2606    72633 E   ControlSystemHierarchy FK_ControlSystemHierarchy_Device_ChildDeviceId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ControlSystemHierarchy"
    ADD CONSTRAINT "FK_ControlSystemHierarchy_Device_ChildDeviceId" FOREIGN KEY ("ChildDeviceId") REFERENCES public."Device"("Id") ON DELETE CASCADE;
 s   ALTER TABLE ONLY public."ControlSystemHierarchy" DROP CONSTRAINT "FK_ControlSystemHierarchy_Device_ChildDeviceId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    306    304    4376            �           2606    72638 F   ControlSystemHierarchy FK_ControlSystemHierarchy_Device_ParentDeviceId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ControlSystemHierarchy"
    ADD CONSTRAINT "FK_ControlSystemHierarchy_Device_ParentDeviceId" FOREIGN KEY ("ParentDeviceId") REFERENCES public."Device"("Id") ON DELETE CASCADE;
 t   ALTER TABLE ONLY public."ControlSystemHierarchy" DROP CONSTRAINT "FK_ControlSystemHierarchy_Device_ParentDeviceId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4376    306    304            �           2606    72663 L   DeviceAttributeValue FK_DeviceAttributeValue_AttributeValue_AttributeValueId    FK CONSTRAINT     �   ALTER TABLE ONLY public."DeviceAttributeValue"
    ADD CONSTRAINT "FK_DeviceAttributeValue_AttributeValue_AttributeValueId" FOREIGN KEY ("AttributeValueId") REFERENCES public."AttributeValue"("Id") ON DELETE CASCADE;
 z   ALTER TABLE ONLY public."DeviceAttributeValue" DROP CONSTRAINT "FK_DeviceAttributeValue_AttributeValue_AttributeValueId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    308    305    4383            �           2606    72668 <   DeviceAttributeValue FK_DeviceAttributeValue_Device_DeviceId    FK CONSTRAINT     �   ALTER TABLE ONLY public."DeviceAttributeValue"
    ADD CONSTRAINT "FK_DeviceAttributeValue_Device_DeviceId" FOREIGN KEY ("DeviceId") REFERENCES public."Device"("Id") ON DELETE CASCADE;
 j   ALTER TABLE ONLY public."DeviceAttributeValue" DROP CONSTRAINT "FK_DeviceAttributeValue_Device_DeviceId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    308    4376    304            P           2606    72272 6   DeviceModel FK_DeviceModel_Manufacturer_ManufacturerId    FK CONSTRAINT     �   ALTER TABLE ONLY public."DeviceModel"
    ADD CONSTRAINT "FK_DeviceModel_Manufacturer_ManufacturerId" FOREIGN KEY ("ManufacturerId") REFERENCES public."Manufacturer"("Id") ON DELETE CASCADE;
 d   ALTER TABLE ONLY public."DeviceModel" DROP CONSTRAINT "FK_DeviceModel_Manufacturer_ManufacturerId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    263    289    4233            t           2606    72899 *   Device FK_Device_DeviceModel_DeviceModelId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "FK_Device_DeviceModel_DeviceModelId" FOREIGN KEY ("DeviceModelId") REFERENCES public."DeviceModel"("Id");
 X   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "FK_Device_DeviceModel_DeviceModelId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    304    289    4297            u           2606    72531 (   Device FK_Device_DeviceType_DeviceTypeId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "FK_Device_DeviceType_DeviceTypeId" FOREIGN KEY ("DeviceTypeId") REFERENCES public."DeviceType"("Id") ON DELETE CASCADE;
 V   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "FK_Device_DeviceType_DeviceTypeId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    304    4222    258            v           2606    72904 &   Device FK_Device_FailState_FailStateId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "FK_Device_FailState_FailStateId" FOREIGN KEY ("FailStateId") REFERENCES public."FailState"("Id");
 T   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "FK_Device_FailState_FailStateId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    260    304    4226            w           2606    72909 0   Device FK_Device_NatureOfSignal_NatureOfSignalId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "FK_Device_NatureOfSignal_NatureOfSignalId" FOREIGN KEY ("NatureOfSignalId") REFERENCES public."NatureOfSignal"("Id");
 ^   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "FK_Device_NatureOfSignal_NatureOfSignalId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4235    304    264            x           2606    72914 ,   Device FK_Device_ProcessLevel_ProcessLevelId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "FK_Device_ProcessLevel_ProcessLevelId" FOREIGN KEY ("ProcessLevelId") REFERENCES public."ProcessLevel"("Id");
 Z   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "FK_Device_ProcessLevel_ProcessLevelId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    304    4250    270            y           2606    72919 *   Device FK_Device_ServiceBank_ServiceBankId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "FK_Device_ServiceBank_ServiceBankId" FOREIGN KEY ("ServiceBankId") REFERENCES public."ServiceBank"("Id");
 X   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "FK_Device_ServiceBank_ServiceBankId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4261    274    304            z           2606    72924 ,   Device FK_Device_ServiceTrain_ServiceTrainId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "FK_Device_ServiceTrain_ServiceTrainId" FOREIGN KEY ("ServiceTrainId") REFERENCES public."ServiceTrain"("Id");
 Z   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "FK_Device_ServiceTrain_ServiceTrainId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    275    304    4264            {           2606    72929 *   Device FK_Device_ServiceZone_ServiceZoneId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "FK_Device_ServiceZone_ServiceZoneId" FOREIGN KEY ("ServiceZoneId") REFERENCES public."ServiceZone"("Id");
 X   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "FK_Device_ServiceZone_ServiceZoneId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4267    304    276            |           2606    72934 &   Device FK_Device_SubSystem_SubSystemId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "FK_Device_SubSystem_SubSystemId" FOREIGN KEY ("SubSystemId") REFERENCES public."SubSystem"("Id");
 T   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "FK_Device_SubSystem_SubSystemId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4354    302    304            }           2606    72994 %   Device FK_Device_Tag_JunctionBoxTagId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "FK_Device_Tag_JunctionBoxTagId" FOREIGN KEY ("JunctionBoxTagId") REFERENCES public."Tag"("Id");
 S   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "FK_Device_Tag_JunctionBoxTagId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    294    4322    304            ~           2606    72999    Device FK_Device_Tag_PanelTagId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "FK_Device_Tag_PanelTagId" FOREIGN KEY ("PanelTagId") REFERENCES public."Tag"("Id");
 M   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "FK_Device_Tag_PanelTagId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4322    304    294                       2606    73004    Device FK_Device_Tag_SkidTagId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "FK_Device_Tag_SkidTagId" FOREIGN KEY ("SkidTagId") REFERENCES public."Tag"("Id");
 L   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "FK_Device_Tag_SkidTagId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    304    4322    294            �           2606    73009    Device FK_Device_Tag_StandTagId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "FK_Device_Tag_StandTagId" FOREIGN KEY ("StandTagId") REFERENCES public."Tag"("Id");
 M   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "FK_Device_Tag_StandTagId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    294    4322    304            �           2606    72591    Device FK_Device_Tag_TagId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "FK_Device_Tag_TagId" FOREIGN KEY ("TagId") REFERENCES public."Tag"("Id") ON DELETE CASCADE;
 H   ALTER TABLE ONLY public."Device" DROP CONSTRAINT "FK_Device_Tag_TagId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    304    294    4322            U           2606    72314 D   GSDType_SignalExtension FK_GSDType_SignalExtension_GSDType_GSDTypeId    FK CONSTRAINT     �   ALTER TABLE ONLY public."GSDType_SignalExtension"
    ADD CONSTRAINT "FK_GSDType_SignalExtension_GSDType_GSDTypeId" FOREIGN KEY ("GSDTypeId") REFERENCES public."GSDType"("Id") ON DELETE CASCADE;
 r   ALTER TABLE ONLY public."GSDType_SignalExtension" DROP CONSTRAINT "FK_GSDType_SignalExtension_GSDType_GSDTypeId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    261    4229    292            V           2606    72319 T   GSDType_SignalExtension FK_GSDType_SignalExtension_SignalExtension_SignalExtensionId    FK CONSTRAINT     �   ALTER TABLE ONLY public."GSDType_SignalExtension"
    ADD CONSTRAINT "FK_GSDType_SignalExtension_SignalExtension_SignalExtensionId" FOREIGN KEY ("SignalExtensionId") REFERENCES public."SignalExtension"("Id") ON DELETE CASCADE;
 �   ALTER TABLE ONLY public."GSDType_SignalExtension" DROP CONSTRAINT "FK_GSDType_SignalExtension_SignalExtension_SignalExtensionId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    292    277    4269            @           2606    71939 .   ICMDRoleClaim FK_ICMDRoleClaim_ICMDRole_RoleId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ICMDRoleClaim"
    ADD CONSTRAINT "FK_ICMDRoleClaim_ICMDRole_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."ICMDRole"("Id") ON DELETE CASCADE;
 \   ALTER TABLE ONLY public."ICMDRoleClaim" DROP CONSTRAINT "FK_ICMDRoleClaim_ICMDRole_RoleId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4194    249    246            A           2606    71952 .   ICMDUserClaim FK_ICMDUserClaim_ICMDUser_UserId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ICMDUserClaim"
    ADD CONSTRAINT "FK_ICMDUserClaim_ICMDUser_UserId" FOREIGN KEY ("UserId") REFERENCES public."ICMDUser"("Id") ON DELETE CASCADE;
 \   ALTER TABLE ONLY public."ICMDUserClaim" DROP CONSTRAINT "FK_ICMDUserClaim_ICMDUser_UserId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    247    4199    251            B           2606    71964 .   ICMDUserLogin FK_ICMDUserLogin_ICMDUser_UserId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ICMDUserLogin"
    ADD CONSTRAINT "FK_ICMDUserLogin_ICMDUser_UserId" FOREIGN KEY ("UserId") REFERENCES public."ICMDUser"("Id") ON DELETE CASCADE;
 \   ALTER TABLE ONLY public."ICMDUserLogin" DROP CONSTRAINT "FK_ICMDUserLogin_ICMDUser_UserId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    252    4199    247            C           2606    71974 ,   ICMDUserRole FK_ICMDUserRole_ICMDRole_RoleId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ICMDUserRole"
    ADD CONSTRAINT "FK_ICMDUserRole_ICMDRole_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."ICMDRole"("Id") ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public."ICMDUserRole" DROP CONSTRAINT "FK_ICMDUserRole_ICMDRole_RoleId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4194    246    253            D           2606    71979 ,   ICMDUserRole FK_ICMDUserRole_ICMDUser_UserId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ICMDUserRole"
    ADD CONSTRAINT "FK_ICMDUserRole_ICMDUser_UserId" FOREIGN KEY ("UserId") REFERENCES public."ICMDUser"("Id") ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public."ICMDUserRole" DROP CONSTRAINT "FK_ICMDUserRole_ICMDUser_UserId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4199    247    253            E           2606    71991 .   ICMDUserToken FK_ICMDUserToken_ICMDUser_UserId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ICMDUserToken"
    ADD CONSTRAINT "FK_ICMDUserToken_ICMDUser_UserId" FOREIGN KEY ("UserId") REFERENCES public."ICMDUser"("Id") ON DELETE CASCADE;
 \   ALTER TABLE ONLY public."ICMDUserToken" DROP CONSTRAINT "FK_ICMDUserToken_ICMDUser_UserId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    247    4199    254            ?           2606    73038 &   ICMDUser FK_ICMDUser_Project_ProjectId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ICMDUser"
    ADD CONSTRAINT "FK_ICMDUser_Project_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("Id");
 T   ALTER TABLE ONLY public."ICMDUser" DROP CONSTRAINT "FK_ICMDUser_Project_ProjectId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4216    255    247            g           2606    72849 @   JunctionBox FK_JunctionBox_ReferenceDocument_ReferenceDocumentId    FK CONSTRAINT     �   ALTER TABLE ONLY public."JunctionBox"
    ADD CONSTRAINT "FK_JunctionBox_ReferenceDocument_ReferenceDocumentId" FOREIGN KEY ("ReferenceDocumentId") REFERENCES public."ReferenceDocument"("Id");
 n   ALTER TABLE ONLY public."JunctionBox" DROP CONSTRAINT "FK_JunctionBox_ReferenceDocument_ReferenceDocumentId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    298    4305    291            h           2606    72430 $   JunctionBox FK_JunctionBox_Tag_TagId    FK CONSTRAINT     �   ALTER TABLE ONLY public."JunctionBox"
    ADD CONSTRAINT "FK_JunctionBox_Tag_TagId" FOREIGN KEY ("TagId") REFERENCES public."Tag"("Id") ON DELETE CASCADE;
 R   ALTER TABLE ONLY public."JunctionBox" DROP CONSTRAINT "FK_JunctionBox_Tag_TagId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4322    294    298            �           2606    73132 -   MenuItems FK_MenuItems_MenuItems_ParentMenuId    FK CONSTRAINT     �   ALTER TABLE ONLY public."MenuItems"
    ADD CONSTRAINT "FK_MenuItems_MenuItems_ParentMenuId" FOREIGN KEY ("ParentMenuId") REFERENCES public."MenuItems"("Id");
 [   ALTER TABLE ONLY public."MenuItems" DROP CONSTRAINT "FK_MenuItems_MenuItems_ParentMenuId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4405    312    312            �           2606    73142 0   MenuPermission FK_MenuPermission_ICMDRole_RoleId    FK CONSTRAINT     �   ALTER TABLE ONLY public."MenuPermission"
    ADD CONSTRAINT "FK_MenuPermission_ICMDRole_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."ICMDRole"("Id") ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public."MenuPermission" DROP CONSTRAINT "FK_MenuPermission_ICMDRole_RoleId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4194    313    246            �           2606    73147 1   MenuPermission FK_MenuPermission_MenuItems_MenuId    FK CONSTRAINT     �   ALTER TABLE ONLY public."MenuPermission"
    ADD CONSTRAINT "FK_MenuPermission_MenuItems_MenuId" FOREIGN KEY ("MenuId") REFERENCES public."MenuItems"("Id") ON DELETE CASCADE;
 _   ALTER TABLE ONLY public."MenuPermission" DROP CONSTRAINT "FK_MenuPermission_MenuItems_MenuId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    313    312    4405            W           2606    72329 ]   NatureOfSignalSignalExtension FK_NatureOfSignalSignalExtension_NatureOfSignal_NatureOfSignal~    FK CONSTRAINT     �   ALTER TABLE ONLY public."NatureOfSignalSignalExtension"
    ADD CONSTRAINT "FK_NatureOfSignalSignalExtension_NatureOfSignal_NatureOfSignal~" FOREIGN KEY ("NatureOfSignalId") REFERENCES public."NatureOfSignal"("Id") ON DELETE CASCADE;
 �   ALTER TABLE ONLY public."NatureOfSignalSignalExtension" DROP CONSTRAINT "FK_NatureOfSignalSignalExtension_NatureOfSignal_NatureOfSignal~";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4235    264    293            X           2606    72334 ]   NatureOfSignalSignalExtension FK_NatureOfSignalSignalExtension_SignalExtension_SignalExtensi~    FK CONSTRAINT     �   ALTER TABLE ONLY public."NatureOfSignalSignalExtension"
    ADD CONSTRAINT "FK_NatureOfSignalSignalExtension_SignalExtension_SignalExtensi~" FOREIGN KEY ("SignalExtensionId") REFERENCES public."SignalExtension"("Id") ON DELETE CASCADE;
 �   ALTER TABLE ONLY public."NatureOfSignalSignalExtension" DROP CONSTRAINT "FK_NatureOfSignalSignalExtension_SignalExtension_SignalExtensi~";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4269    293    277            F           2606    74064 J   OMServiceDescriptionImport FK_OMServiceDescriptionImport_Project_ProjectId    FK CONSTRAINT     �   ALTER TABLE ONLY public."OMServiceDescriptionImport"
    ADD CONSTRAINT "FK_OMServiceDescriptionImport_Project_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("Id");
 x   ALTER TABLE ONLY public."OMServiceDescriptionImport" DROP CONSTRAINT "FK_OMServiceDescriptionImport_Project_ProjectId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4216    255    268            i           2606    72854 4   Panel FK_Panel_ReferenceDocument_ReferenceDocumentId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Panel"
    ADD CONSTRAINT "FK_Panel_ReferenceDocument_ReferenceDocumentId" FOREIGN KEY ("ReferenceDocumentId") REFERENCES public."ReferenceDocument"("Id");
 b   ALTER TABLE ONLY public."Panel" DROP CONSTRAINT "FK_Panel_ReferenceDocument_ReferenceDocumentId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4305    291    299            j           2606    72445    Panel FK_Panel_Tag_TagId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Panel"
    ADD CONSTRAINT "FK_Panel_Tag_TagId" FOREIGN KEY ("TagId") REFERENCES public."Tag"("Id") ON DELETE CASCADE;
 F   ALTER TABLE ONLY public."Panel" DROP CONSTRAINT "FK_Panel_Tag_TagId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    294    299    4322            �           2606    73160 L   PermissionManagement FK_PermissionManagement_MenuPermission_MenuPermissionId    FK CONSTRAINT     �   ALTER TABLE ONLY public."PermissionManagement"
    ADD CONSTRAINT "FK_PermissionManagement_MenuPermission_MenuPermissionId" FOREIGN KEY ("MenuPermissionId") REFERENCES public."MenuPermission"("Id") ON DELETE CASCADE;
 z   ALTER TABLE ONLY public."PermissionManagement" DROP CONSTRAINT "FK_PermissionManagement_MenuPermission_MenuPermissionId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    313    4409    314            p           2606    73017 (   PnIdTag FK_PnIdTag_FailState_FailStateId    FK CONSTRAINT     �   ALTER TABLE ONLY public."PnIdTag"
    ADD CONSTRAINT "FK_PnIdTag_FailState_FailStateId" FOREIGN KEY ("FailStateId") REFERENCES public."FailState"("Id");
 V   ALTER TABLE ONLY public."PnIdTag" DROP CONSTRAINT "FK_PnIdTag_FailState_FailStateId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    260    303    4226            q           2606    72504 8   PnIdTag FK_PnIdTag_ReferenceDocument_DocumentReferenceId    FK CONSTRAINT     �   ALTER TABLE ONLY public."PnIdTag"
    ADD CONSTRAINT "FK_PnIdTag_ReferenceDocument_DocumentReferenceId" FOREIGN KEY ("DocumentReferenceId") REFERENCES public."ReferenceDocument"("Id") ON DELETE CASCADE;
 f   ALTER TABLE ONLY public."PnIdTag" DROP CONSTRAINT "FK_PnIdTag_ReferenceDocument_DocumentReferenceId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    291    303    4305            r           2606    73023    PnIdTag FK_PnIdTag_Skid_SkidId    FK CONSTRAINT     �   ALTER TABLE ONLY public."PnIdTag"
    ADD CONSTRAINT "FK_PnIdTag_Skid_SkidId" FOREIGN KEY ("SkidId") REFERENCES public."Skid"("Id");
 L   ALTER TABLE ONLY public."PnIdTag" DROP CONSTRAINT "FK_PnIdTag_Skid_SkidId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    300    4347    303            s           2606    72514    PnIdTag FK_PnIdTag_Tag_TagId    FK CONSTRAINT     �   ALTER TABLE ONLY public."PnIdTag"
    ADD CONSTRAINT "FK_PnIdTag_Tag_TagId" FOREIGN KEY ("TagId") REFERENCES public."Tag"("Id") ON DELETE CASCADE;
 J   ALTER TABLE ONLY public."PnIdTag" DROP CONSTRAINT "FK_PnIdTag_Tag_TagId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    303    4322    294            Q           2606    72282 E   ProcessHierarchy FK_ProcessHierarchy_ProcessLevel_ChildProcessLevelId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ProcessHierarchy"
    ADD CONSTRAINT "FK_ProcessHierarchy_ProcessLevel_ChildProcessLevelId" FOREIGN KEY ("ChildProcessLevelId") REFERENCES public."ProcessLevel"("Id") ON DELETE CASCADE;
 s   ALTER TABLE ONLY public."ProcessHierarchy" DROP CONSTRAINT "FK_ProcessHierarchy_ProcessLevel_ChildProcessLevelId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    270    4250    290            R           2606    72287 F   ProcessHierarchy FK_ProcessHierarchy_ProcessLevel_ParentProcessLevelId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ProcessHierarchy"
    ADD CONSTRAINT "FK_ProcessHierarchy_ProcessLevel_ParentProcessLevelId" FOREIGN KEY ("ParentProcessLevelId") REFERENCES public."ProcessLevel"("Id") ON DELETE CASCADE;
 t   ALTER TABLE ONLY public."ProcessHierarchy" DROP CONSTRAINT "FK_ProcessHierarchy_ProcessLevel_ParentProcessLevelId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4250    270    290            G           2606    72099 $   Process FK_Process_Project_ProjectId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Process"
    ADD CONSTRAINT "FK_Process_Project_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("Id") ON DELETE CASCADE;
 R   ALTER TABLE ONLY public."Process" DROP CONSTRAINT "FK_Process_Project_ProjectId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    255    4216    269            H           2606    72116 *   ProjectUser FK_ProjectUser_ICMDUser_UserId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ProjectUser"
    ADD CONSTRAINT "FK_ProjectUser_ICMDUser_UserId" FOREIGN KEY ("UserId") REFERENCES public."ICMDUser"("Id") ON DELETE CASCADE;
 X   ALTER TABLE ONLY public."ProjectUser" DROP CONSTRAINT "FK_ProjectUser_ICMDUser_UserId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    271    4199    247            I           2606    72121 ,   ProjectUser FK_ProjectUser_Project_ProjectId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ProjectUser"
    ADD CONSTRAINT "FK_ProjectUser_Project_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("Id") ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public."ProjectUser" DROP CONSTRAINT "FK_ProjectUser_Project_ProjectId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    255    271    4216            �           2606    72648 B   ReferenceDocumentDevice FK_ReferenceDocumentDevice_Device_DeviceId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ReferenceDocumentDevice"
    ADD CONSTRAINT "FK_ReferenceDocumentDevice_Device_DeviceId" FOREIGN KEY ("DeviceId") REFERENCES public."Device"("Id") ON DELETE CASCADE;
 p   ALTER TABLE ONLY public."ReferenceDocumentDevice" DROP CONSTRAINT "FK_ReferenceDocumentDevice_Device_DeviceId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    304    307    4376            �           2606    72653 W   ReferenceDocumentDevice FK_ReferenceDocumentDevice_ReferenceDocument_ReferenceDocument~    FK CONSTRAINT     �   ALTER TABLE ONLY public."ReferenceDocumentDevice"
    ADD CONSTRAINT "FK_ReferenceDocumentDevice_ReferenceDocument_ReferenceDocument~" FOREIGN KEY ("ReferenceDocumentId") REFERENCES public."ReferenceDocument"("Id") ON DELETE CASCADE;
 �   ALTER TABLE ONLY public."ReferenceDocumentDevice" DROP CONSTRAINT "FK_ReferenceDocumentDevice_ReferenceDocument_ReferenceDocument~";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    291    4305    307            S           2606    72299 8   ReferenceDocument FK_ReferenceDocument_Project_ProjectId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ReferenceDocument"
    ADD CONSTRAINT "FK_ReferenceDocument_Project_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("Id") ON DELETE CASCADE;
 f   ALTER TABLE ONLY public."ReferenceDocument" DROP CONSTRAINT "FK_ReferenceDocument_Project_ProjectId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    291    255    4216            T           2606    72304 Q   ReferenceDocument FK_ReferenceDocument_ReferenceDocumentType_ReferenceDocumentTy~    FK CONSTRAINT     �   ALTER TABLE ONLY public."ReferenceDocument"
    ADD CONSTRAINT "FK_ReferenceDocument_ReferenceDocumentType_ReferenceDocumentTy~" FOREIGN KEY ("ReferenceDocumentTypeId") REFERENCES public."ReferenceDocumentType"("Id") ON DELETE CASCADE;
    ALTER TABLE ONLY public."ReferenceDocument" DROP CONSTRAINT "FK_ReferenceDocument_ReferenceDocumentType_ReferenceDocumentTy~";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    272    4256    291            J           2606    72143 ,   ServiceBank FK_ServiceBank_Project_ProjectId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ServiceBank"
    ADD CONSTRAINT "FK_ServiceBank_Project_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("Id") ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public."ServiceBank" DROP CONSTRAINT "FK_ServiceBank_Project_ProjectId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    274    4216    255            K           2606    72153 .   ServiceTrain FK_ServiceTrain_Project_ProjectId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ServiceTrain"
    ADD CONSTRAINT "FK_ServiceTrain_Project_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("Id") ON DELETE CASCADE;
 \   ALTER TABLE ONLY public."ServiceTrain" DROP CONSTRAINT "FK_ServiceTrain_Project_ProjectId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    275    4216    255            L           2606    72165 ,   ServiceZone FK_ServiceZone_Project_ProjectId    FK CONSTRAINT     �   ALTER TABLE ONLY public."ServiceZone"
    ADD CONSTRAINT "FK_ServiceZone_Project_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("Id") ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public."ServiceZone" DROP CONSTRAINT "FK_ServiceZone_Project_ProjectId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    276    4216    255            k           2606    72859 2   Skid FK_Skid_ReferenceDocument_ReferenceDocumentId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Skid"
    ADD CONSTRAINT "FK_Skid_ReferenceDocument_ReferenceDocumentId" FOREIGN KEY ("ReferenceDocumentId") REFERENCES public."ReferenceDocument"("Id");
 `   ALTER TABLE ONLY public."Skid" DROP CONSTRAINT "FK_Skid_ReferenceDocument_ReferenceDocumentId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    300    291    4305            l           2606    72460    Skid FK_Skid_Tag_TagId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Skid"
    ADD CONSTRAINT "FK_Skid_Tag_TagId" FOREIGN KEY ("TagId") REFERENCES public."Tag"("Id") ON DELETE CASCADE;
 D   ALTER TABLE ONLY public."Skid" DROP CONSTRAINT "FK_Skid_Tag_TagId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    300    294    4322            m           2606    72864 4   Stand FK_Stand_ReferenceDocument_ReferenceDocumentId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Stand"
    ADD CONSTRAINT "FK_Stand_ReferenceDocument_ReferenceDocumentId" FOREIGN KEY ("ReferenceDocumentId") REFERENCES public."ReferenceDocument"("Id");
 b   ALTER TABLE ONLY public."Stand" DROP CONSTRAINT "FK_Stand_ReferenceDocument_ReferenceDocumentId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4305    291    301            n           2606    72477    Stand FK_Stand_Tag_TagId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Stand"
    ADD CONSTRAINT "FK_Stand_Tag_TagId" FOREIGN KEY ("TagId") REFERENCES public."Tag"("Id") ON DELETE CASCADE;
 F   ALTER TABLE ONLY public."Stand" DROP CONSTRAINT "FK_Stand_Tag_TagId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4322    301    294            M           2606    72229 "   Stream FK_Stream_Project_ProjectId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Stream"
    ADD CONSTRAINT "FK_Stream_Project_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("Id") ON DELETE CASCADE;
 P   ALTER TABLE ONLY public."Stream" DROP CONSTRAINT "FK_Stream_Project_ProjectId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    285    4216    255            N           2606    72241 *   SubProcess FK_SubProcess_Project_ProjectId    FK CONSTRAINT     �   ALTER TABLE ONLY public."SubProcess"
    ADD CONSTRAINT "FK_SubProcess_Project_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("Id") ON DELETE CASCADE;
 X   ALTER TABLE ONLY public."SubProcess" DROP CONSTRAINT "FK_SubProcess_Project_ProjectId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    255    286    4216            o           2606    72489 &   SubSystem FK_SubSystem_System_SystemId    FK CONSTRAINT     �   ALTER TABLE ONLY public."SubSystem"
    ADD CONSTRAINT "FK_SubSystem_System_SystemId" FOREIGN KEY ("SystemId") REFERENCES public."System"("Id") ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."SubSystem" DROP CONSTRAINT "FK_SubSystem_System_SystemId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4325    295    302            `           2606    72371 ,   System FK_System_WorkAreaPack_WorkAreaPackId    FK CONSTRAINT     �   ALTER TABLE ONLY public."System"
    ADD CONSTRAINT "FK_System_WorkAreaPack_WorkAreaPackId" FOREIGN KEY ("WorkAreaPackId") REFERENCES public."WorkAreaPack"("Id") ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public."System" DROP CONSTRAINT "FK_System_WorkAreaPack_WorkAreaPackId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    288    4294    295            �           2606    72759 &   TagField FK_TagField_Project_ProjectId    FK CONSTRAINT     �   ALTER TABLE ONLY public."TagField"
    ADD CONSTRAINT "FK_TagField_Project_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("Id") ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."TagField" DROP CONSTRAINT "FK_TagField_Project_ProjectId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4216    309    255            Y           2606    72819 (   Tag FK_Tag_EquipmentCode_EquipmentCodeId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Tag"
    ADD CONSTRAINT "FK_Tag_EquipmentCode_EquipmentCodeId" FOREIGN KEY ("EquipmentCodeId") REFERENCES public."EquipmentCode"("Id");
 V   ALTER TABLE ONLY public."Tag" DROP CONSTRAINT "FK_Tag_EquipmentCode_EquipmentCodeId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4224    259    294            Z           2606    72824    Tag FK_Tag_Process_ProcessId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Tag"
    ADD CONSTRAINT "FK_Tag_Process_ProcessId" FOREIGN KEY ("ProcessId") REFERENCES public."Process"("Id");
 J   ALTER TABLE ONLY public."Tag" DROP CONSTRAINT "FK_Tag_Process_ProcessId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    294    269    4247            [           2606    72812    Tag FK_Tag_Project_ProjectId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Tag"
    ADD CONSTRAINT "FK_Tag_Project_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("Id") ON DELETE CASCADE;
 J   ALTER TABLE ONLY public."Tag" DROP CONSTRAINT "FK_Tag_Project_ProjectId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    255    4216    294            \           2606    72829    Tag FK_Tag_Stream_StreamId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Tag"
    ADD CONSTRAINT "FK_Tag_Stream_StreamId" FOREIGN KEY ("StreamId") REFERENCES public."Stream"("Id");
 H   ALTER TABLE ONLY public."Tag" DROP CONSTRAINT "FK_Tag_Stream_StreamId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4286    294    285            ]           2606    72834 "   Tag FK_Tag_SubProcess_SubProcessId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Tag"
    ADD CONSTRAINT "FK_Tag_SubProcess_SubProcessId" FOREIGN KEY ("SubProcessId") REFERENCES public."SubProcess"("Id");
 P   ALTER TABLE ONLY public."Tag" DROP CONSTRAINT "FK_Tag_SubProcess_SubProcessId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    4289    286    294            ^           2606    72839 (   Tag FK_Tag_TagDescriptor_TagDescriptorId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Tag"
    ADD CONSTRAINT "FK_Tag_TagDescriptor_TagDescriptorId" FOREIGN KEY ("TagDescriptorId") REFERENCES public."TagDescriptor"("Id");
 V   ALTER TABLE ONLY public."Tag" DROP CONSTRAINT "FK_Tag_TagDescriptor_TagDescriptorId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    294    4400    310            _           2606    72844    Tag FK_Tag_TagType_TagTypeId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Tag"
    ADD CONSTRAINT "FK_Tag_TagType_TagTypeId" FOREIGN KEY ("TagTypeId") REFERENCES public."TagType"("Id");
 J   ALTER TABLE ONLY public."Tag" DROP CONSTRAINT "FK_Tag_TagType_TagTypeId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    311    294    4402            O           2606    72260 .   WorkAreaPack FK_WorkAreaPack_Project_ProjectId    FK CONSTRAINT     �   ALTER TABLE ONLY public."WorkAreaPack"
    ADD CONSTRAINT "FK_WorkAreaPack_Project_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("Id") ON DELETE CASCADE;
 \   ALTER TABLE ONLY public."WorkAreaPack" DROP CONSTRAINT "FK_WorkAreaPack_Project_ProjectId";
       public          FMxHWQ43Xh2rpTegRGYBV9    false    255    288    4216            m   �   x����nC1Eg���^�d06&s�N��KY�*��ϯ��n�"؀{�a�ז�N�8*�id4O)�0�����6������3�����\u?���\�T�P4`M�F���2��0����`"�ܘ�/'��e�ꌁ"1`җ��XN	����_c\~ω��R3�!2�7+�p�3-��΋a����RL��A�/�hY'a[gҀ�ԢB�&#��ܤO��=�r*��_��m�/�\oH      v   �   x�E�A
�0��+z/*�,[Q��"[�����=,˰L#�n2�k�����k���}��8�W�^m19�T���*��2T[�m#kR!�* ���Š�P_"^����

�P�$]�wT��J�,@l�ug{�5��1}n��/�����7�      n      x������ � �      E      x���r\Ǳ&��)�k�8�Vݫ�p/�M-)LZ�3q"v�U�1j@�{{?�|ٍ[7�b�6(�xS ��֪�~Y��s�1/L�IX%�H��Q��ZJ�?����[ywP�jN���K�D-b	�E�z {���Z[=���������G����rz�ۻ�7'G����}\����:}��������a�������W���������/������ҫ�J����j�CIBg��56���VH+�=���ґ�e]�����x���#?�Z���D�r��.t����M(t�*���q{]z�Z7然I
�S�H-(�NʦZ��|z��#cǉ���x���տ�/~z��xE{����8μ���t�޽9eֽ|�����oJ{����"i��3B���,>�&��9<����kL�Q1�]�:[���("E(�Q�I����[y#cFƎ3��۷�������*o���͟�Ie��O��[`���s�!�D�l�Y�d���6�z�[lv�S(_һ�F18�V���&%��I�֢mɨ��7L��؏�9�kZ�?g09����8!����RL��r�6�f����S�ui�"�%��M)��E�
��m��Su���7qfd�8gΝț5�1��7��s��@���Q��$c���&-loRD���NZ��Z1W�MiVk��PUL�2t29Q��&kUu7����q�������޶z�5�s������Ֆ
L�P.xׄ�&.��@ 
�L)��n��$�镨+%�T�˥���ZFo�N�*XXg���Oc������¬��P`��}�O�m�u"[E�.��#�^����$�����C��օݕ��*�i��N*�ڀ#60��!�k��G���i��<��H�E����Y֔k6�B�c`�D����t�W�J���.'i��z8�B� $*Ux[�W����Z�?�����~ש�f���&T7� gK��PQ)+Z�=4T�v�t��hr��������:[٫�T�[h=2���j�h���g��Ȳ�l�8�"�
�^�TaM
 m�T�a�t�e�*�W<�lp��&�`\�Z�[h=2���z�h55+�#˚*h��UB�/++�*R�|�/����J�`�:uX&@��*$�!��A�[h=2�������©��GV5i��*��:k���'9���Iu�u�h-'-0(mZ��Q¨�\׵�o!���sR?�/R��3j��#˚TKNuX�E	ט7]��]1!�����ߜ���iK?�{]BTq��. /��]�������{`�6[mˍ��çwH~k�Kgw�F�	d	�Q�P`�0=�g���]��Ĥ�2�P0����*����P��Ƿ�d�'���]��.����ÑuN�pw�Gp�j���H���m>��7d�j/��h8Yag�rLA7�d���d�'���]��-���gf���:'U���KoP�)d/|w:�ϸ���4�x*6V�|�� �T�
�R�p�:V�>b��#�w`�.?��P�m魏�Yh8I5KMҁ#(�-��E@�+0fĳ�6q_�^�� �t �i͊Xs��@� �U��m��Sz�O�7�0��?��)8E����t��єss�Q�aC�����6c2�ސiFp]{SRu�V��Sr�O �]x m�M�+�\���Za�aIrG��sT�) ����_oNځ� ��Ŭ���p�TM�M�ĵ�����2Z3�<�N�����[rB�#�٥7s�Y�d�+]�0�1 UV<�{ �$�3������E$|1<��]�F���l0\�pbd�9'�'v��uΉǟ���p�X=��,z�Ze���l�`�`��oxL��xR9e�,G)��F�]�%�-�~�N�9����+�BE�jV)FV=����8����Q�=5�m��(�Cӵ�$���j�{@N&EX4��"�V�?g��S��;d��O�l���#���-%'�DO�o��-=L����U�����������B�B6� 9�̘	�tV���p��:�GFn�}��c��Ky��xc4�ۖ��Hǅ!�h��vd���FK���v��2�R$��u�x@+�霦0^�&�5�&l�*)���]O%�Pu������9��?�N�� q{��BC��,0Y��A��6ȇ)QD)a��M*J ���i�s�!%���-IhURŅ�ؽ������Y��?�N��-���o�BI�f�),zJ�E˙'��l����P�(���Y��&�
��#�&6>oG䑤�כ��o�!�b���e�Z)?>ua,S���B$���"��~ �. �;��,,�c���{�$[�q���G䡌W����|�r�Č�SM�[*7pgd�s��~v��p0�a>�g� ���G��۬S�P�<F����6^r��\��g�Y%%�/n`������M������d��r�.4���b��LNiW;��+�O�5�p�7��� 6p�/��s�#��)��l�q�PW�%֫t�֫�o���ގG�\r�g���c��m)x57��G(2�ً�Ρn�xF�H��li�w�!�%�Ur��I4S�NCᐓCJ�Tͮ�\��L�%��t�L��g7�F(2�,A!>�*ofR�e�p0�T@�x��6do�Q"hǁcn��Ij�~�Sw#�FF	&=�)���ϟT�Pd*�Q!r*��MT������R�3�w��d��<�n�8v�'fI��`���B���40�N����3�١�8q��*�B�rLA��8;8f��[�a��&�sj�kq |�5c�(�T��Dw��932�9�d�:��b��3�rL^9E)|�w貉l�^���ֶr��Ukx*�yc�p��ɀ �:�],7pf`�]s��q��31zm�,g�1Q �,�宽GX��	�/�>��|=8��?��8�8���[�M�^Ht���-`���)C7x�����S�����{�7NF3�_���=S�N��ި���uN:W�r�"4>�Uي�)ܽ��}�ά2�t�O�\�o�-��$L_J�F#�MD�A��N�ߟ�����n��f}��Z'���-TQe �a�w�����7��rAˆ�8$��§��E�AM�i�w�G��D��^�_��С�ѿ�)��B���,�Y�{9j�Z�_+���g0���h���L����F�te�"�TN��D�A�?�?)���7�5N�?���^!8̶���%#k�0iN0:��rup��{Ѭ���ʬ/���C�Kם�>%Ǌ`,�>��b���Co���'���全a9�S����g���t�S��X�� �"P'x�3\���d����y��p��� EF$N�u�;�7�}d�'�[�%��\h�Q���M�+x����XA���:#e����"R�'�bn��2CѺ��D\~�G�^;����v��m�?_�����dd6�X�S��5�N'�W�)=�e�����r�ά�Jg���"�ԅ+D���6�h?2t��?��?�������Y���vJt�����5��uN�&I���1��A����m��<���-PwL[��hy J|�z���-�\�!�?0��6�����2Y�/����FG#+�R�	򝅓]��Q�-��Ǘ�V~��%���B)>n�c))��|�֙�խ��`kҿ|�N�iNһ�]���M�r�V����A5��?�Iѷ&��z�殺�TSl!>���t�!��4|����J�	���O餽�)�B��??��I�L���CJ|%_�"��ω�F�7�\�S���yMT�#� ~Z(E!�j�v9�`{9���n�QF�
������h��|+���$��᧒b�;M��6�G+�z�+�+��1�	tb�Ϊ�H�	��k�~��'o!��׃?��Iy*�@-
���J���q��ҪI�m��1�ܬ5s����@�%@SM�v�:2����[�S�#X�Q�o
�,s�*G�;,Js�坘e؄(*���o��a"�i��#�L�
��3=��J��	>]��ovI~'�(;O��UN]{�3�}�a�����â�[    +�[��p�^!��P|�>G�t�(���ae���-~xأ������ߘXO���î��y����-�7,�N���N�O~���������=����>��٢��~�NJ;Of;?)?��<*O�Xӈq5����E)��G��ƶ7w&�J�<������ɂ�W ���)�o�Rfw���x��.��/o*K�Ez�EN��/�.�Cs�xd�����W1R�\�Aƴ��$��*to¯m*K�|`*LC�_/�-#B�Ux/C��ڌ}�`�ڇ�S�u�0��q�>������O���ɚ���ߥ��K�쬁����na����t�E���t�Rkƚ��kS�]D�|7Jc�R��z�ѭv���0��=V��4��� c�ҥ�|.�ې��C�ʿ�i�q���#�79]�k�2.$��"�--3� �h%�|���b�a��N |1Ѕ�|����a�+�cI��#�H��[@������M>{Ձ�O�sK�@ +s/�D�k�Sm|���3��HD�]A��C�&��� �_F���������E �h������hx��3x/qi���jYa%��u��1�g�n��ڠ4]C�l����aw'���˾�������?�+������DoJ���qQ,*|���x�,�<�j�%j���LD����YY��s�d����C � ���u\8�/�4 zS�O��N�:�?VP�ϩPZ7f���Zk�F�e4͛h1FK��TuB�<���������6���J��^x���ҟ#�7��Z�d9ˌ}���U�P՝Tu%�B��3�BɁ�J��j+6#�����a{,�_��V���K,�>���ٛl3�*.K��c��H��A8ė����4'�- 2��9ia��Z���2æ�� �dHH.L�G�	o9��="z! 5+ѴM p]Y�4z��	XeH�(pW%OK'��j"$CZP�SQ������U�mN��+ 6qB���ћrT9k_ (���.����M�\��\�5V��S���j�O�=NQ�q.Cdd��ɿy�����k�jNt�"#�7yn2�:7g1�pu�c_#��{k��KW��y�4V���[�M�nA)��!�� ``����׽�M `�+º������?"{�ψ�X�Z�D�XA�T�B�e��1���XYB���Z�f+I��|�+��s?0lO�� �� ��	ؗ@J-\��c�NĀ�M��5�'#�-�*�;g({+��^az)�s�42԰�*m���Ua. ����U� l��+H���X�| 0 zS��G��C����;4XFm}��V����uG��]�:��q+%��.d���, � ߛ ��Y � 24_�eD��R[(�H�m5^���ǘ� O��Z�{R�A�|T����FHhQ�UCΝ �{��{ ��:6�@��l�;"yS�.������������lLQ��U��gPW�⮅����ԛm�2!^���a{,��g��~�+�Lp��D���L��w�tv��*J�VQ\^=h9*�`	��|��+n)�e3[ag�d����<�����g�?q���v����M�tI�!��\@�x	��c1>�|�����N߳D�=�$@�D�� �$�"��
�qQ�n(]�qut`�G�����W��^7����k:s�Ƽ~\ϟ���ͯc�}<����xµ����k/�O�[����'?�4���߅P_ы���`�w�c����p0>Dv*�п�-��z�w�T��O
�[~ʋ�_ڗ/��������כ�#���F�rҟ���%-F��c��^����H�sј�;�20u[
^E�����8'�:P|(%B�0�^�Ad�؇�4S��"3>�p[�[td��R@���u�\%��ʧ](eB�^!�I>t嫀5���*J��(���!�vMԂ�Yɂu,�ևJ��g�ЂOѴ�����	����_Z>�~[���L"0���ږ!�ܶ�hN�ˬ~@5׮�jYC�FA���:��]��)*aA����|�L� �� �?�h�@>�BC<��ĀL.��-�8���|�.���J2�ت[��n[��@��ǚ]U v���H�	��xkK����-�?�w��?37����;R�����q��§@��������=��Ka����ǚ-{�������/1+��'�	��o�4�}|w8���)Wl�t�M���?|��Xe��f��gl����o����7�#�X����,u�� �Z�R�𢳢c;`bXV{|���|ٱzM!���������6WR�G�΄���TKw6#�/��J9�0%�n0@�mL~3���v���+Vl4�l\���!�]X��| �dRT|AQ��ޣ2�Ļ���$u�\l��� �mT�E9����{��e��T�x����V<�Y�g��!�_���v���ٛ�~��8�܅��R0^��x2r5`H,�6F���!�x���`�ls�08_uk�J� }���)p�Z�ȼ��s
�UK��2T���s���e���>�[�5G�����jC��}/^Ii�~���Q�s'���e�n��,i�;cu��<_8�|I�Zm�jm�v�VIw�.ׄ�<В6[#�����6��:2l7]n�o:�WҩSH����Ѐ�M٫�@Z>s朻��ҍA)2�r>�ݮ����؈��T}_��2wRLUk����9�,8�	���^*2�rO$<٨��!u�=R�ӁR
IaF���
�zS_�����X0�m�B����#�:�J�V!�\�7�K�j`D��|)w-Ek��y23J,��씥%����#C7��,o�/հ�m�^��Y5{od}����\�ЪA�k�L.ˑ��V!�ŗ�k�_��5��V�+�+A�\F����*hd�������yw�6K�fH=߾c`q�N�fXNz�OFS=��L���͊�A-󜄔a	6I�UΨ��5�@�Y�v�"��[W�]�gwD�\f�+�e��{`mS�5���Mql_�m2K�>7[�2�d���_b��i�����������Ջ pB�g���%��w�#.�ԸH��Nv��K�-;s]�S���U�]�M�]kBX�?��f���7�4����>8�OE�//e{� �uM�O5XgN�nJ��X�����P�Ta�:{='�/_�Pٯ��J/�vF���	��8f4������W�űkM�����P9�bB�g���Ƞ^�	�rlKF_ф��d3�p����|�ݔ%۩&�#��i���L�K����R��Յ2Y7�c.�]ф���3�p�*t_ӄ����n
t�Z�%�=N���7��W��j��EQ`[J�JWye;h�P�uM�O��g�p7��w�	Fq������=T��� ڱ㷆�ZeD�L|w�Z����+�0X�iF�QѦ�Y�p75�v�	�/�4�mۗmr���	 4D��2h���"�)ԝ��	����k�}*��;��zߎ5������s"�
�i>H��wu�M3��>J�r�-�+�h�M�Gu~g�p7ev�	aጴ�'�C�Z�0�9[2AD8�U~{�.R̗�=���&ܧ�&{'�Oآ�Ɏ5���e5��5��ė�-+y��㏜`�ZV���-b�K�ͱ���)�v/a�Ä-�lw�~��h�`m(�*�Y�@�:'2��RM�]	�G���h�=�s��^��m���X�Z���;�t�5�ns����]ķ��� �PVUF�]��	�����L���5�-T$g���*^b�l�Z#|�H�xՇb)K���l����ׄ���p_N��~���&� �o�ߔ��鷉+��zu� ��T���F�b�G�_ׄ�T|/���Z�(�cMp��~U�AS����W�ʆ���%���GK!_ׄ�Ty/4a����(��SMМw$���|C��z����T�h*�(��6���\]��I4�qF�Qg��:��ƈ�V����0�1Ʀ�wYxŽ�<�0k%ar�������h����    �F�^��^��[�Hޱ&(�����}ԡ*ɹ�(��C�Hl����c��hJA]q
���f��=ꖵ'
����E������LP���P��ڀs%TSsM;`E�	!t��壥|p�俽m��p�S����V����c{�5+��W�������w�xsz��iu{�q���������}d�1��/]�T*�z7�<�����(��$ �n<��C��
[G�/��0k�Fh7Yk���X*4#F���/�e�(:8ӟ�ow��E1��K� VZ��N�W�R���Vv����j���N��Y(dc��k�uM���#�X�� }��/�.�ch!����GV35�cs*	`�e=X5�$��������򣮋Ӯ�_�q7�������` ����!s���B��-��Go�G�>��Ot�s#��u(V1p���I��oA|Q���)>�~���3�,7$�p]���!�»�`n2gx%Fд�X@]����%�V}�\G�@�lW\11[�D��O���Xm���E��u��hO�Sބ���Y�!�����3r���Y.f�h)k�t��Kݖ��7>p�R �ښ ����D��r�n����O��+�pcK�w?�kF�1QȺ��u��
n0��Y_
,���na��Nq�$�$W��T�əd��7#C?�7f�x�8C�7]!��Bkd{ ���
�B�Vrً$��B���U k�E�*B�lh��hx��*�\́awGd��1C|_7W�BH�b���Yw�M�Q�(*��.��e��k۫C5!w�f�v�K5��G�o���X�O\��ix��/���N���I#��Q��v��@���P
�:Eu���Ȱ�/G�[$_�T��"H�绎�H�Ԁ��WZ�X�q�R�B�Z0��Ս��e)B���D��r���Z��8b�{�{���EB�N��.�5a��ˈ�M06�P��c�/2+���'dyV��  Nv2%h�4��J�;����2sM������;�U����N��-)9�twD�����PRr'`��0F���Jj��@=���J��Hq��
=��E��@��jWE�6�d؃���E��N�?,��7l��T}��k�n�/s@%C�Z�+{�%�����pN�%,��;���K���9�?2lo�����R�]g�a��^))N6P>V�L��j�˅ۯ?�5�K���
8�ߔ�n�E`PC�-oy�nDu���K�����G�Ѱ��go������T�)��m���[��Ꮻ.&Քh""ڃw��F!j&{��/W]��=��b�*`��r��Y4"}���Ghܡ\�W���Y@y"5�!Ϋ��ʑ��gh�����)��T
5=�:0loU`lK��:��)k�S�W�\�z�H�䃆�so��Ht$q�k�?U�Jr�ۘ��恚�=\��� b�Jq'��`d؃��'`������h�lD�&C�x�\&�.�f�($K�����/�Dӹ�hXK�>P�E��5ltɻF�5�]�g�6�w Àj�̒��ڳ��L��MA���,�服�Ŏt��lawւ�j���n��~�^�����ZYљk,�-"z���3g���d�K�T�C1QbL�2_M���a{k��� lK����8ne�yG�oj�h9��|�N�#n�k-P_�`����I�`���P�p\�\;��sA�����/8�N�-�nR�B�f#�ћ4�@I�k%X(I�\@�Ag"�� zu��UˁD���e@[��&��	���d��������������i�#�7��A�EU���QD��:e�!Us�����O޾;]��~{P��\�m
�&�3w�f�EÕȦ(]���xt���|u��uc�H�[Ә������z����o~S�O.��?�p����o���I{�*-�駓�V�z��w!�W�b�O77��R�k���K-Y�t!�g������/�˗
&Z����(Nrv۫7�'NS�',��?�ӷKR~�&⒄vgi��,dN��������IeD�%-7�5Ds�+Ҍ�:���5Q3�Vr�E���P[�%|����A*S? �#S<���'�嗗O� ڗ�]FD��uX-���QD@�H�h��Nq��D���=��tcP���a�;Q�]_�+�x��O��Տ_Z>�BE��û�z��zՅ��ʶ;	��;�>��KI�냗��_ǥ=I'�<�-���U��zk`�+ 95g q�[�.�#�����'y%s�П�J�m7�2.�%0d�#�LϺ5]�T8"I@[\D�������m�)�#���7deQs.�+o��[�12��O�7h�MT���G>Ū�$���"�աp�<�פH�h��5��e�n8L(�c�jy��	�Wb�?��n�?�Ƴ���m��"���O���Hq��TF��+�bjhS\����oN��F�'���3Ř��g�+���$1BA�z��i}��U���~�g:�`��z������[�����̦���e��������b��_S�EIO)��>���^��������o����E��m�3�n/b��-�_��Kp��� �T�Ӝj	 �~G{� SHx�M�?<z���'������J��,�1!AOղ�aApB�P��PZծ��Z�dd����w�	
����v�h�ٛ�~�^�k��b���F��e�L'L)=(�e,����9@ʾ*nR��_�.|��`��7��gļ��q�`z`�g�|��7��t���PY����+���8z�ͮ�kZgc*,/��f�}0�D���Ț��,�����A�|)�����:.��G��������jZ/��nL��a6#gd��l���>/���[�*��m������oϟ�#���^��� !_N5>8�����

�vՅbBX�q>20���j4��o�~�÷,�x�k|���/ߞ��X5����o�~s>fS�xz�,�^���Q�?>O?{��P���!���v�>泳W	i�*d�����#��Pz+R"^��|0�b� ���-qQ���Bl�t���Wv����R!���s���#���������;���ݱ�רSv<�Pp���e@�e!�V4�.����H�z��e����ٜ8�;;|;�"X�\����{C1둑3�9��qkf�$>d�o���N�S�B��kŻZ�Q�)���q�pԕ���^�;3�������|A�
�E)�J����yࣽ���!S1�U}�����]|��l�9�r�s��_�� t5 �$��`��#@re������]���\y&wC�q��3Շ���x��$�k$�.E�j`��y孱��?�q�lH>�_O�;�"x(f�H����çy�ُ�Hh{(��w'����Y�T���|R�bN�跗 Z0Mg�<R��䘣_�W��,� ��]
��^������r��E�ޝ&�'I����79�{��n3'7re#|�H=dn��Yyij��:�+w������eٌ*ֶV��w��[����woY�c=��K�@���l�1"|S��蝻q]X;���j������Р�i�+i�
N�����a��Ӏ�ap_�xo�gh�⏸�,��|k�K�U���Hu�ǄhJX�%�$�z_I���"��l�o�d���[�W��#������u_�v�;M.�～E�#�7%�c0+R&�P���!��	*�mLP��P�����6E�ѝ�§TP�7SB	3�?2lo���έ���}�~�G��,g;hIj� bD�^s�\�)rmLp�-�[�
�b]��j�6�� ��l^�?>L���^�9�?2lo���6��7��.B;Z��d�7>,yS/���+�J� ��|�VT>��W4!�@P�r�C[D�p1w)���a{+�_7���n�ڧ˭˦�z�f����M�c��J�3�2އ����<�Y _�Ss`5��Q��N&EId�.��[���wo��c�i� �H���F�o�N;8#�˓�
 �HߕW�$�{-�;m�$���E|�R�[K|j]���q30�C~���_��p�    ,��zD&���Ȝ��9�R
��kCZz�����!�D�B�z�cQ���hl�������	���������r�I��L�0�*\"�<���Geml���7u��w�H,��)uv/��QVnXx�x�L� �� �?�h�@<��S��%�FD`
f�{J �C��B�u^(��䕌y=�� ���X�I*�#*�$x�S�n����4��7�A���{3Z}���.Zs�A@*R��� Y&�ժ3��򈪬uH�,R��3dT�k�{�mRS\��������J�9�$k���
=0ǣÕ%����K�'���?�����X]N��z��]�����;LS�#iQE�f�Ț��+�q��Kl�;�m"*�6C�t˞�k�NV*������zD(�Cs�
���!���qΔ/_�X�ʋ�������+�8|���4?tXi3��nd�SiT�7'Wq�W��\Ư�fd�aU�H6�"w����!�4�E9������ۘ��>�ز.�FM�/]�֩�6ޅ�s�雒�:GDN�s!4�5�I�6M��|vQlT�[��{~0�e!�yvǆ���%ic�N׻ܳR������F$o2>����I<���s&q�#��7㧕o��b�M�&U�����
=6���{�#�z�Y�H��Ž�������@��rY��E�5�_4 SѱWIP��|9$*�k��V�k.\����mj]ս-c���GU1ڵ���9b���H�#�u��	W`y�vhD��`T�9�.�{{ �H��y��%����=ס#)3�Cӄ���{�"InR��>5�P�׎��Br��� 8pBy�-**1K��kL������ �wPykגjV���{�L�V��|���R4�8{y�3u��n�n��-*��H��{���-�d���w0��ą@\JM�a����\h�*�2~jq���7V�Y���ϻڼ7�H�����M�G*�Hk\ʹ�W�ƓdlF�jz��5s���J��9p�5�m*�o�+w�N|y�y竬4�:`������������]nՏ��%��塚��U~��6�:�_.yY� ��"e[�I����O>:��w�Ӂg�T<���4�y���?�O#=��"A��m�����Z��/L3@��f-{)���%��� |�2�*Yj Y��qZ�dJ���U���x{���4<{t�,w`���g+�\T��<�*������'A�O�HwjW�;�9@��k8�Ğv�ϫ����E(״�-��Z��|�2aY&�%t�	1!X��(��l����f,	z^5>�v��������[޾�x��7˟������������=�����h����2U#���7�o�߰�;n��������ki�w#�pZI�g���O�E����l181��^�U*B^,�k��;��U�u�� z����n��32�fI\��F�O_�%���w.��k9���ov&���ޣМ�����	w�\�¸��-r��u
�t��5��"�`J1��tZ���R�M�ođ�_Twi�Z�
"tCɲ�OѦf�$Q;{p��G��5��YNۺ������\���>k��&��Ln��q�j`��D����;9���#,��G����\���xmIt�8 �����-")iQ��V-�-u�R)��|k鼑�_T�Wd�ZDZDi�|Z��'Ǒg�\�˘���H.���g���-�,߹��s���}�d�9�Pa<���������v���>�;2GN/B�r��ߤB*.�R�⏬�G���;|KT��$���Z��TY���P//����8��72lo5�+�y�]��ջ/��g��^��{5�#�7��k�ԅ�|��M2RLMp�C�\O�]��:���~��ӡ�������p���[����J���T�b���b[�ܒ�']�2fU���38��,XL���̄*o����i'�#�<H�W!�_2��0"Ss�ڔ��K���N9sMSx�J�@ ��M˫낺�]��Anz�kA�xq�fS���^)zJJ�0�݉�%�t��j>�O����wu���.:!\����ߖӊ�:/�?��qT"z��tٔlg�����S�q0�w�[�!G
�_�ʾƫ�o4��)�j��U{�ng��/���f�,lr��;f��9#j5�l.��F����:g8	��|���;���@�g}3�GFo��U���v�8Ia���:^�f����n)˝>'wSW��D�]v�eT��|���*���"T�gDP��
z� n�s3FFߔ\���-��BQt�urG�:�VrSŋ�8X�܆;� �<TH�������嘀?`�<o�G�B����h[o&���������#H�ݎII���>#�,��:_y��|�΁66_w�˚���R�Dd��~.!|X��Vg�b�GFo������/�����-~��h,�jE���l��w/;_�ed��I�4m�".�e��PE�I)�%�F~Y�w���{��x�S�B�U�o&�������=~�.\�y��g�__�~FX3��6��ɵ�)Y�*&�̕l�w�*7Y3BY�P�Y�iP��� ��>%b-�����X�8���ح��v����B��Z��x����'.��5oK�JKm�)�uΣm�ԱN���6�8{���i?2��$w����;%~Xx/�|\?�҉8	�8	�c+_���M�R&��<�a��?��ǿ���%oy艗܃��vl�pZ�@�Scz��qz`��1W_���V���gOwGuZ��5��,m
��V!��q���㙛KGՐSdmRP#���g�{2�%�Y���
�j�L���#3lKu�?�)��"8mլ�Y�J0!� x����-|&^�s���k9Ui*_��@FV���*���^�� nd��d�e��]g����d�Ǔ|�n>�`��L9"���9�
"q�Q����r�_a/Z�79��d����_��WK����#?{�{�: �k��\�>��(8�n�[@�QƱ^p�;�
G�3���J�>��A�$q�g����"�z�; L�b����ϙ���C�U�mɫt[����/�����IkRm.w��d�B��l���'��(�g���:��sS�L�ϛ���m;=(��K�}��3C=7�J<wD�nm�f��t�����9=��t��]=>A�x:
��y��5��Ʊp�":�Q��\��̣C�R~:uoj6��~���|/	K�br.��[��H�#c�K=�E}�vSh�3>)T��DpX�����E��CQJ�K�g�o�[���p!�ZP�L�u���Y:_w��mKį����%�͑���6�Y:#�7Œ4��5��I\�V�j�־�b�:D嬢sI��*�'E�U�z����R5G�=��}���C���w(�pwc@�D��l8S�#�R�y���čDr����ElS��zF��:�J2*���:�",���օ�[�J�Q	O�O��y��P*�QW��ɔ5T�^ �.
����HKXS�:P�hd�9�*���q�|2�L���������p**��15 �2���	��D: ywX`��d���L�&�<7h���%��l�N4.��4��?"�-�&eR�Αts6F(UH��`���0]y�Y��Kv�"s�ԴTݔ�|�PG��)��.j�X<���9�"0�Z�}��㸷����A8�II 뮷�Xv;��'�	��1���',�[��2�7�sd�����,��ΚـiD�X4�f�"i�����]4ߊ�ݘV�у,b,Ü�Ki�c��A�^B�^�p3[c`��bo;O�����)D�B�=�?�����U��ܮw,j�f.�$�]�W�+)�ɠld������c��)��˧� �l ? ��&#57��\ӡ�$zt��Vm��Ma��xάHT�c�'EI�ll2�>$�#S<���n���O������L*��}��`�~f|q�oJ������>�)uL�8u��!���"�/QɎV$��sd�����J)I��    }D����Nn�|��I�ֲ*U;W�o��TR=�e�q��K����B��f�ln�cL� �wq�q���3g�?D`��E�"B�\4��!�P)h�l��� ���<�^خݪ)R�� ST�����ґ�M*�v穼~�R�M�F�6u�=��J���	�� ��cqz��M��B3�p�啄X��I��c=��v��̰-�A�����Jo�:�>��e��2^i\�[�Z������v�`J��,-��h�ãd*��Ydk�P�`賕P��ʑ��=���L֕*w����8^J�WoB�w�����̧9�g�=�+��Z��f���V���p��ԍ�]��I����"1brh���dKsiN#��6���.FT��i%'���FVgrp��F�DWs<���O�a��o��ƛ�U|v$8A�E7T�m��[D���ψ�M� o�W�=, �[I��ᵣ�N�jqq!��zu8a*F����s���9������W�ۮ�޳Z\nA|�>�#�7y��� �y_�v�<*$��j+>~�Y�hZ=g�"y��Q8��.��I�����q�f`���??^o��a!�2�G6rG'滍,k�*��z��� � ����RR�i��l���%L���
A�-��n,��p+�G&8����׏<�����߮�)��{�;�^Dc����Ȳ'�_���6�I��	����.���V��,��8�c���A��TR5�s��#\����J��Bs���ցeM�%g4^ٛ�j��:���V`�`�� ��\�"��^�z�u�� UB�M5�J�	.���W��"�(��fdYS���
'df
�2QUL���7���3�$�|�<poܼ��.u�A�n�G&8���z�_���!��!�Ⱥ&�d)0�����	h�����=�kֺ)�kA��S\�U�=� �j!��M���#\��?����@��l��¦�#"��,!��uk���uSS+�n���F���vO/�e�vp�ݧ�M���"�b�N~N�'��kR.�`NZ��]��}xPX�$��4�R�l#��;��f6�pLծ����N�	�	��~\������Y�$99�K������l�;�א[� �*�U�e5f�pٲ��Sj��^�f��~�I�Mu��b_K�x$���k���lJ>"�G���k��+���ؒ�7�֖O !��MTB�X8��A��Q-�O"��߰�J���:��ۑ�M&'�j��8�q�n d�B㊢A���р��M�8�_�^qs�"$��"h�շ\��E�/�S�]�^pw�!^)f�`FX>��`�:���\��ɞM����N\Q2|�K��Թ�c�:@\ɔ:{p02��]����+�3��F�390�V�Ɛ�7k@hR b��õ���]���˒��ճgx�8��[� T`B���!��l�ʁeM2*�z��Ʃ���)芿""N�s����2� 8����"�ȅJk�T�&p�NI* ��UG6��dO����n�:�����k3�7v���Ù�I�[B��y⬑Y��E {F�Xx;7��|5�4���7Z\��������8'�N�M��hPLs����C#+�dQ*��EҌ�5�=����ucjsy�\*�Z<S3\���R6\$/��]��O!��Ϙ�J.� 2q����ʦh$WC��-_��V5�QW2�i��>�Z.q��R�����BF-��b`2\����J^~p�X����<�t��Bo���.��b����5R��Soޟ�vavZ��.�D�=ۉ{�VS�.Լ����F	+�Y���Nq��L�Hř��4<q��e�O��b���24#ï���kK������Nk�t����yW(r�J��#�@���w�M��N�B��MFc�9Z+Ǖ�MNIA�Z
qe��C��4T� ��l��0p�K��U- fm�tzd��;�~�JJ󙏨a�4S��4rT�%E�&uRj���vD�y�<s�L���rfM�������q�6'��yq�|F�+�ʔ�cȢi�'H]�D[��l��v$��Hj�op�yo��A��R�U��-{���8�+� 4���bX�n��!�g�u,�7Oܜ]��_� �3�;2��{�y�u�%�v�lG�f"n>��|z��<I~��R�+�}��=�,�@Dk�!a1P��]�Y��Yo)�>0zc/������A�N������?;�Ih��:r�dm�Q��sd��l���iѺ�2{�n�P@�FVM��t�!g��@5�n����^�6@�3�n`�ަb}�զJP�TB`ٰ��'���Bn0'�:��(���?~~,��(9�=�k�Ii��J��D��ծ��7=W�Â��s�F�o�9���r�o�Z���jۂJZ��çƮ�Z���\��4D��%�PU)���:�ug�B6e0���3�*(Y)b葫�6�qWt��O��퉛D�}�q�Ar��V'��e崮��<Ws!���=���ڒU��7�G{|\E��c1
����̓�ܢ*>�T��9w�!�Ҫ�c���&�ȍ��Ը��3;΅S\�r��,sJ�+1�*�[� �j'�Se6�Mr:���T.��`�c2�t@���5����#������X�;[�ΧQ�j�&�M!á�^I�(~��I_7e���J�F(����H��P�V�`�2�&�H=�����N	�`>Oh`Yu�-��芈�rc��]�@ ����k���|���'˽�ąO��f��$x��6�C7`�������_���ܵ�[��♁uM@^.J��\y�Rz�	������omS��6�v�s�S�X�8�=|�|�n��o�Lp�'������7�y�Ef�Ҝ�A�����Ȋ'gB|���#�#��j+��da��/7s:�	�w|ePYqaI:���MZ�m��ۚ�	.�7Y��s���f��Ⱥ����Ư�^�x�t5!�TUh�|7}�׀|[z�|u��1@d�ؤ��=��K&�L}�_Irrag��Ⱥ���o\�1#�B?�E�2��Rܦ����t,��7���
F���U��s;�G&8'��|�=�� ����''�h�|݅��M�R&X'��e�8+o�����i�>�~�k>0�<2� �E�����Yq����!#�t��	�8�|�*X�����ſ:|�����Az;y$�"nȾX��cӲ@�U�he�rg6�c�ѵ@W��R2���M$3����2���1��H����������|ir�W����2������������Y ��S�>����TBT6���Xz��]���&���d��$}�J&�27Đ#�b��'Eו[���(�u��U=��'^������A�=���6>��)G��܌#%Ģ�[r\y|C:o��w�`�z��G�ShQ�f��3KD�͝�r ���_���1v�5DN����BLMڌ8��6Y�?R�&ZI[��u�
�s2F�V���1f.�y3�k�Dh���3#�?�3�*gbe�c�smi��&����YbU�]r��E�ܬΌb
�(;��S����p�XR�k�R;]m⣿�9�+$.��(R:<�³7rfd�'p�\�L�	p��D�[��<7[s��滗;����4�E3B�i�;�{��{�&�n�\���W��<	�qG��cGP�eiB�����p3��t���g����Z�W�� ��X�˖��p���2�T�sJ/l���Q:��D�����BtΆ���!�=�=��0yF��Ñ���0�pˍK`t(��k/�P�������N1�U31<K'ئYkN���UD,�D��	�tl�FnՎll�.�����A�b��Z�6�<X;rB���/�ܱ��+��~g�w�u�̤/��C $ˤT=	va	_�:޻� ��):GZ@K�!A5�Q�E�ݧ �����ag����P�tl��z,[�g��T
��5$Z��훽�w�S陯:�HR|A�֛��`�́C���q�L�ŗ��iQ4�0�]�q~L�|+Ʒ,����m��:�8�����C�?ӭ�+5J' �2s��i����2�[    ��3���H��A�$o�z�dt3ѳŗ$�� G�9 |*8L��#\oG��FRd��̑���8��mZv}_����|���w�����y3�[=V�����s���7����gmN�ҽ���*��)��Ȕo)z�����}��(���+���Va��&��W�ѱ��/��s�2!�*�b��כ�y�z��eJ2	8k�J�Pqp�t��|4�c��N��W|��&�UI�a��e5���{��p�}��ڻ7����xwM���響z��_/
������WO�6�%x{}m���j�3���r%��
?����?`��]&*\�re628߾J7�������t��}p���;����|�^]�z���\�G��`�ڸ]]�v�E�r�>�L��D �o���UQP��<�Lh{�o_�����_��?^c����{�������,4��\�0퍼d�0�f�%XSrH�t�V��x3�<���z1X3b'��ێC��,wB!X晣]t�R����jJj2>�e�wE�Nl=$�����=V�a٠�+ë�`%�AX'<Q�L�4�{<!v���m3"~v��'�k�W�vx�3����ZOQhm�k��M&�����.~������I�D��"\��fW���Q��V�����%���|����&Y��Wl���;.�<kF�`�}�5����B|���ū���)�:�g�N��b09�k4i�X�^%�ԮX������7�rXi���h�ɜit�Jvɛ�&gF������woNE����cڭ�>/.��(w|o�T��]]�Қ3�4S����Mz��ۆ��9��."E�^$�]�9��a'i���2�5�nM��ޤ����˷O���\�B���>�>̔g�g��z�չ�1|_����n�R����>u�r�u5Xq�=|�1����u䈋�򀟓�ӱ4Ck�1��͛�ީ��׋%�	5����+�m���U�=p�1#�E�>�׿���ն:�Շّ�0v�'&}Q�
�7���:��d�g"�D�Jr)=�L�'3v��Sv}���̫W���)
���M�h��,��\}Xc� x¹�c�q�Z��*��-�uf���/�aa2�D�����oH?bV寴l���Bԛ��9	E31���snxA!�>e�N}��pg�U�F�	9y���T��LzFv�^×|�>��<�ʿ:�y��q)�1���`-:���ޱ�y� � �	��N�"m�Z��Z��́�6�K��I��J�=���������zb3�y$��;Ɵ'7�����	���5��Y���1���+�[��␇�+K��*΀jɑLL��-�)p�d"v�RW	�O�+I�$�ư��v���m�6�����9ٌ��\�3�Ř����9�7�	�,���;g�8�d��OT|��87�-y��lK��6���[*P���ͩb9�tg����1t�iA�������3�YR��C)������{��dM֕�D�Iݲ�o���\�!!���G��f��t���tZХ���Rc3�Y\S6plM(��^�jT���\Uq�n�:��ZT�w��K'f��g0-RY��+O�=*t�<Cw]�������d�j`0���U�WN��2��N�r��{ћ�k��%��׈�cʨd��.d|mh� �3b�]}������kv��8>�A�R�Ɏ�r�jmkI�����
{�UG����*h�^u�&��\5�cu����Qg��u.����YF��Q(]�t$+"�&`Y)�/��!f��l*�2C9�o�gna���}���:<�^:lĢ��Tl[�����ͶjVk��m���r�8dҏ<�	��N��X��gN�#�>�rg�3�#��->hW������~5�����?ǅ�Jۗ�m��W�)8�6�,�,�"�xҵ�4X3b'�~�Z��x78�s�1��'?�9�E���=xW�,���2��2������Ot�ca �εoG�:�g����wjuN�߉�����ߦwo.^��k����}��f0�|��x�u�� �:�0�Ϭf���0thf�VÝ��Ԕ��<_�$�4&x�<�w���ުQMp���$9]�t��-V{K�.1���=�vN�nW�M�m?�%�y&��<���E=1J��x���S��2�yL~$c�&t쩷�M0&6,b;�7zӢhƩ�b*.<n2#~���q=L�ɪe��"Nn���7q[w�K�w���Ó�,lS�^��v6+a��lւ�+&c�|KA`�6)1Cc�Y��h����[���F�t�B��\:FB�އR��j�d�F;샹}��.H��Z3��x��Σ.lA8���&)
6R��C�N�A%kIV�5�*���v��?:����K~\��ku� �/�R���&L͠��w�3Xr�� s�Sи*r��I�:�[*"��T�_$���(���}����:eF��u�����j�^��[n�nYS�B�G�:���3.�31JK��@oLr̜@Lo�`��K���@�	�=>)�f�eWA53�,�X�t��"\�P{nۓ�'kF��'�`T&��羳����Х:b���r���h��y�Ԏ�ƥ�gFg�.�+����=�����;>���,&09^㺡���Elsdo����t�P�3��+~��(|~�a+�nm?������ �w�+XCofb��%&*�*3o�Q`��b(U��~�C#N��1�z�"�X��B@s&L�#=1#��z�cTL� ��!�+���5&3�-j2�h�v0�B�L���l�R�,�e���2��2Vl�]w��D�1d߸�0�M��7S��M�t8	��/�'��p\Eq��pFKʍs�&�{12W�"��F�����I��\�,�>f��oU�ŧ 2q��~�D�uS=�Bi���7�LM�I��ʉ�+s0aKβU�m���L��s�3>����+��Y�01��[�����R���+i��P(Rx�%+�Z��_�M��Z{x@S̈AMqH'�BISX��U����?>ߋ�U&j��Nqt�B؁L0��C봼J���A�����ȼ��H��8ux�GK�g�28�\c/��&�Sh�jL��u�N�dC0s�ɢ��E�٫\%>�7�gFv>���>�f��y�,���8͇��m���z��y �:�
�D�~j����6^SN�F]=|g�>yC��e��'O�����N��`�ə����$����E+E���5��dC���(zN��a����o_J֞B�>��{��p��H��
֓�U��͠fa6ߪa������E��`��>@�ȴř�Np̍IW.���#2�i�^�v�q�3b�Ж/�=�BP\���|W|�b����`!�x��/�nG���a^--11�h6�����4X^�Or3�K��~�<��e�ᔗ�ڪ��¾�@jaA&��������S��'
��6�TF'EU�X#3'(N�O��JQ�Ėn���9��($���S���ED g�~���AC��N)��3�[�������A�(`
�;�XKi�]��U2�������0(��{gf���]3�w��_�b�}��+~~�5�����V������P)�fH��yl'q�73NK���X�'V%����c�ց#�n_�$��s���r\"�s���&.Wj�C�9�_���G�_�_�V%i�U?g0�T�R�>�	��[@" �8v26��X�8��9�,4�J�C�9a��P&��-�����α�y���9Ev�L����&�&���;A�1Q���M=�������`sI�)�ˀH���$K�	��:eF���CV��"�AϏ��v.(g��A3X���)�f-Tn4�F<��&��e������ㅰ6���x���T��O�N���g�]�̔l?�ԅ4�qC�23J�⊷���#�jFD�$�WhI�-��w�Mט�)Vve���Yq�lJ�͹��:eF�K�}�Г/�R�;z����=i-XZNh�w��8b�oD"�?V�B7M��q��=��`S쁋��H!���dZ3D��{�@����	�=vhx��3�@Y��������    #����$�%�o��&�X�n�E5"��۪#7̱���`9�o	�%o�Wʤ�R�_�v��fn����P�θ{��|/�_(���5��gù$��h�.E�dT�Ԫ�ӅR93��zv0^�ꑢ��{tEal�X@�{���Q�ȶ���ޓo�W��6Iq烥�M���,�j��_y=9��>re/�2l)vN���O�tk3v���|�U&�E����Qh��/�r@���q(Ϗ�"w�x퇚bf��
�zft��W��Ἡ��Xƻex�����=��!U�Zl�)rQ�&Jl�6CJf{��;���LȞ����ۃ��G�����{�+���i����8�j�yoBZ�
�r������	/2N�H�@��d}lU[��l���l���{�	�7�Z�c��4��v���HC�Xl-UÔ���bk�X�J]���v�\��)tN�^��ةT�Fc%ut��ѥ����K�s��8^B}z��T<�'#��rAw[a\Sb5���
ώ�2R�p���ZP\$%@-�-^B����F� gf���E��W�,U�x�	�ǅn<Cw�xZ�>0������jY��'|q�6�u>F\�N�j�)П��.~����۫w\>z=&'�a�^��ƶ\��6��]��G �\��~�.ֿl��n<VI۰�h�.��8��Ũ֘ãׂ�7��i$;��1�:).�IӉTw�h%��a��Q�M̙�ZrMF*8l�D�Wxm��D���fS,؀Ἢ ��
��[�B���-+a��f�N6d���9dD�鈿43i���8��%F�Yl���z�`��X�d�~Y���˯�D�	��؇Ru���B6�R)��>䣛;Y������_Ɣ|�Y(�M���$eD0�S�ΐW7#����eˍ��D�:l��X,�~Gi� ��Jh�'wИ-��^�qZ��ؚ�-MQ�25Aڢ�U��,�pS�B�����a
�'fEJ5	�(-�#L�b�fĿx̖4���z��?���h/��T���ew���̀-E���r&�D�A);1�X05����S��������NUЁ�I��E�MVa�=X����_�R����_"��藢J�`��y9��E:����U+��k��xQKHʫܔɷ�,�$�JÐ`�����7�R��97��?�5#��7s6�����挍q���Gi	^w8 ��ڙ�|�-LC���]�Ї�Ʌ��-4��5�#zӳ�Ym�<T�pB��k�Cޘ~	�b��h�@��9��N��\��H���	��=	]���los4QK��O�������[a�x�Ί���2#����Z����yW�]	;;Y�Հ�m��X�N=�⎂�|��b$��`���'��L�.z�/P)`"VC�IMY�P�/�ᎉ�BB{�L
��g
���;�*�_=}��G��g-��M��ļԎIT}�[`�+?�v��6�`������{߬L�"m��e>�[��+v�#��w��ڋ�O��)�5����떑[MRe8����<�|͹�ǚ/��N��]�Ӓ�_|����+�x���+��u�\_9(��T�(��
qL�-:{9���kB�`�e|M�qT��⫎-��g��$8>�V�7_~�I���(||��J��p�;����4b��l�����녋e2aK��.f�6E򲆪��5#x��R��{d�Wւ����oגo��8_q�`��0ef���5����{O�;�G�,S�r�h�}���ͼ
vc�P������p�f6_�iG&FV Ļ�h��Q����+�x�e�τq!�aZT���`$b�:���|�9��]��FR��`�i.��Ʀ�o�՟ڻ����E�������S�����ջ��ū���z-/3�o�/|LV޿}U���74���qƎ� '�f�W�n]�l��a���S�D��(ݽ-�)���E"f%J��漎��s3#���ܸ�&17��8ff��`���Sy�#�ёMJ�`]:������9�E�5*S����(vS��3b���?��؝�����,�%G���7cҢ��^|�������#��C���om�+�xŧ��˵���XNuFU���Q�ׄ���;�y�S��3�YĎ�AH�K�Π�7�Z�O� {h!��
GvL�Nn�N)o*0�����p ��#�et�ĠН{\�3t��5�]�k�Bw5��z��Y;��|7O>Kٚ#W�?�y�WvI~I�O��S8H����g���k��v[����kM�m�O���)�m��o?9z� s�ϕ���D������e7��*� �f�w�0��vN�9zb��k&�֘�ᗗ���ދP{k&�Ja�2#��jƞ��X���R3n�C ?�'&P�(����W��&��\�#��+�5�H�ɋ?���������Ż'�L���o~����2~��U�^�R?��gL���O���W�_����-�?��׿����|�������������/8k�����_]�w�e~��eC�%9�o�9�b�u�	���k�}5���2������ԯ�o��mh_�+���}�BI��?��}�{����Y�x}��{�Η����w�q��O�J���2z�Lpcn�m����H+їг
|uj>WTò��Y����A�ԕ,���|μ��� >��q=�,Ƙ�Q��%� ��-e��fJ~��$�.}�k�ƙ��t�)�RU�Y6�H�>`F��$#�*�o����������[.�5&��3	6YJ��$}�^�~�>��[߿z�͒�4|�������~������_���xw�.�=����7b��_=e�����k���8����ū�\����.��+�=(���_ �W���/W�.����ҍ���<�7~�:]�uopl��	��_]�z���\�G��U����~�/���}�ۭ�`�*�$Z)��v���TM)��ܸ�	mϛzz�.꛷/~���x��C.*�L���^���[���'�jE�EW!����>��d��:cK��m�F� �����ƿ%1�_}���4O�qu.?~�!Tro�Ō��ŏ�?������9$� �f�l~	�<X��ɭ=
K����jo�b:��s�3�T��cј!�3���~oW������������af*��O1��l�3�wd���r3�[�m0[����w(fm�����k���E�Uf�[á�\#�q�\Ǫi��w\��?ܙ�O+�|�������Ntu�w��ύc�<*�S˩c�Z�i�2�2)��tR�D��B��g����cs1�˹x~w.�c��������{l��43�'l'�a�t|�Us�t)���>8l)fs2Ik����s�"�|N��+,0���C�WZ�:�?�/�߿����	~��#����sۚ�	l�����\�wd��9'FǇ(�����C)�çV ����2T�ܨ�>`[�:p�U���?2x3>/c����?�����.�Gci��Ͽ�j��˧��7Ͽ���͋�W\#{k���U	iy�V�y�8��K��\LjrmW_k�p:9�i�psNʧ�w6#a�zSZ�-&-�H�y�;s��N�nj�ᏺU%��Շ��\��xUWi�4_֕���ٓ��'�U�EEh�9����$��*��ٚI=�Ib��Z^a����VN`y�2i����?s�4ml�����jj�ݤ��ܹ����"�jY�_!��̈�e1�V�DґC`����L�"���{�9!��L�>�n0�3�b�E��VS{q�q����}�T�E�*�N�KsF8�LC*K��'���6���M}Mb���*
�>�áw��˧?����R�������Y�|��9�������o:'��(�30\�%�@�`�(���f��4V�c�g��j��O;1�7k��؊8g RW�gV�3�$��\Z�j��'FG���,��G^&�L��2�'�L�����\e�KJ�D�g��K��L���5��a[&�5Ey��Al�e�����^�I��Q0Ԍ    ��.�+֫�29�2y���
"�la2K'��R�1��*�׽�:0�q?�R�;����Πtq9g�+W;a'�Y��)�}�`�/�)q�̸�G!f�0Ecrq��̈���oe�����_~����f+
�Ƀ��q9�*�o{�1���+���
�;3 ]�����6�d�~p~�ˢl�,2���/��t��uǅ��2Q�@Mʒ�R*��M�=nP�;�������	 Rj�
������,�'�׬
%(������[�.)�v�v5�ϭ��ax���+����`(�H�y�Ƙ�`�MS�ڠ5�%hm��h{�8Y����H�,!�6�\�Mg�p����62�g�N	�g|2[�L;��R��[��,�e���eMl=DA�2w��9J��1\��f,,
^u\.�I �K&�`e�����8iF��9�
&	��eq4����
��&�m�A�����Ë��u$׵��Y
�.?e+�l�RYy}?�t�Ee�s�6�� y!�V����(�TN!�p�iЁ�nЋT�Z2�[�%����P�%��
�M��޵>��tןʓ��I
�O�x��z9��k}��_rr��'w.��s�G�1����]p)e!��̸� �l��F���>������o^oJ�{� �m���?)��j��=���	�:k����'{�(g�M��W��6��A�7���<~t^�[<�M���F��"��k5AB��dV��Q��0�q�ቱ[��0tdxu�z�=��UYmNϛ���.�fsL�u!k�e�*���	@�8L]d�-����G�'M�O;�Z����C�gZ�c��{ʝL�|����Kj6;aE	;67g�e�$�,�1ZK�D�A
�E,����\���a0�MWz��Ai/�������a�#�i�##���L����rQ��vѰ_&$�+{LPN�1����E�9�!�R��V'S���IϤ��m�[��w2H�#a7��9�VrL�ֆ�f�K�6�{t˴+E����Ș����ܼ$Llx�VA���n�5O0��]�[�>!}g�7k~z�_x̵��A���toI���Z���x����ؽ�Αid/�=�b*.�\�d����[eȩԍTc�pF�a�P�^9�u>r��`b��W�:A��T6JOQ���H�������B��s��w>�:^z�U.�n(2��i� �w�l3��T.1D\��� T�%���7��B��`����fzŎ�X�ԁ�@ݴ������Z ���Z�0��p��F�a����>8������]�h���V����K�,�y���e���/_|���Oo�F�����T��F�G&(!e����ҁ#.��c����K�X�q	�3E�����b��*����<Ԩ��Q�´��8I�Z��S蝂s���3b������O�|���+�p��
\��H�5�u���.�<蕿��9,�ԗ	x�n͚@�&0�*	���8c�U�6f"���+��]��l^L+�H*=�ZJ�52#��kD��ȗ]#���ȚDIj�Ff���LR7����p��,�=!�h��_޵�O,����.�������r�lh����53!���翾�w��7�3���^]��Xy$r��-�NԔs����Yb7.Mp������{��_L|��Ɇgi���:1vK�AZ��a�޼��g��^Ie�5?�����W\�g������(y��C:#�'4uojf�S3��ÄPaU&uQ���x�	�0.���`f�ۙ�Lv���l�C3�5��bV��ה�����PA9p�.�M�k���K�m���'��r��%�MY�Y�ŀAv��:ua���a�23VK�P#xN$U,O�5i��%GZzc�j�Ys�i��=�<q&U���ś;�7u3��S��ݻ�~�$ws��c���|�h<>�����q1:3\�\�E��2��p�c�kZ��b��c#.Z����4�]��E�FUM�nG�ٛ���=|��N?��]?�9�i�nf�x�%����|nB��F�j��1���1��h����`$��1%ٕ�o�fd����>�9{�f�����`<��!9��x-���cl�ci��:2''�*�IjS�y�	�&$$�Wb(�E23Vs�H���B�ZSt�o�fd�1�t�X�w�)�;���cg{b��ug[��D�U\��)�,t'��n�:ޯ8*Q���2%bp�R�s����/l��7!��<��;e!8��Jrf�LL��\��mA�`^���*�c%��U����,*E�)J|���V�s}�X�I?ToB��_�|���kj������: �������A�Bs>��^��{��6��2�܊2;>�Cʄ�/��RBi�V_�v_��7�s�%B_ފ���h�ĩ�e����Ll��Zw�Z����?d������O����p��KϡJi�`zpLG�I�#K.��a˷��f�d�M`{4[1����wEp0�2\��	��?�|s�		;�=eXfz����h�̠��k�`�c�:G�y�9�s�.�x%�ذ�a�c�U9����w\�����/��Y��X;dK��؂�^�Ъp��U�h�� [P�hn�Mex�E4��t+��s8�.�SQd�N{
n�7�tuQ�t>�d�mXL���Љ鬪#���'��_�y�:��0+�J�B�R�𗹀�7}0<��(ÉdRP2Ef���E�=�z�]�
"4�
��3z�3c�����5!�56�ah|q�:l:�Lն�����p��t�CX>c����n��L��'>{�k)\�*��Q��������&h_��Mp�����u�C������	
},�O&L�郉�:c���ZG�1�|�R
s����&ܞ�H�O]�S1��g��W�cF����`�ؘ�� 1Ϥ47������G���g:pC�X����-9A/�q�ڌ�   lڨ�k��ɱ��yx7�	6����൓�>�űyR�kN� l�uK'����I0B53�� �6�{S��NR[x�ʙ�u�JèV�1'��M�I�W~T\qF쑃r�9(����
ʡ�)?&!��'��ɪ(���\�
W��ɍ[�m��q��аU�t 	~rf�UL"�8t`D�9#��kĞ�ȗ]#���H�E�yK�3�	x.�y�)�-S��AS�+�PN�����'E����0��NMa{d�3<g���kyB�n�Ӌo����*?�����}w������g����H?�C���b$��НP�`EuX�d|!�^�B|r��}������,J�QXE\Kţ�:�mt&�;"w��&^����#~=M�yv6F5�7���{ە+��.��0�?Wn����:�o�8;���9=s&�c�������]yF��sY�?���Ù啂������Tҡ`i+K>�� �V*N��>��� ���ϙ/���TƩ��a���G�-߳��ʇ/�qv�N�Y��p��ϔ8���9euܪ\ۚ��{����$/)��Z3"(��Z,LlC�Yl�\9T�۔8�8�}����\��IUK�N�wp�!3�YJ��F,<Z��A�v�B\A^�q��B3�Z���Z���{H���=	#9�o.�\��.��Fƪ�(�DOL��cs����'cC~F��m�5��@'L��L���iƗ�][���L[o������D���ܜuf��Vaj<�Z:�WL���F�`V�Q���9r�7�����d��QA�O�f�pI�r�%���6,�^{Ɗ��z}_1��o7�ꃛ����.nB��h9��T�:ؚ����K��E�2ԮV깺z�sP;eg%�k5wy�78�tM��^>[�y����L�.*"7. ;ѵ�J�i��L�|��h��Pd����&
�iV+�9'� ��dn_� c{��A�������1Η�����7��ӗo^�O��p���Rde˱l�SΉq�?�v����mkU�&it������G"��g���k�f�!g�\hr�Z?!v":��M{Y����}�3��-;�LF�ԑ�a�XX�.*_G����R�h�7��������Ɣb��    R��qΩX44�R\�I���cN�?���͛�����|^�;����0���U1a�]1&�RR/*��hf���h�p�uפ��(6�T�I�&��Ț8v�`�r�B�k�;Y�-p'�{B������N{k���q��"��Շ���O��z3F��J�O�f8lJ���x�G�Hk��C���"k!;ؔ�=ۢ(��쑮Pq͈=�f��G�vsV�uq�+�rk_�:�9����3ewA�Hc.�	�,9[(Z�za�.N[�yQKn��n�h���N�'��O��!�p�ؘi���,v
�6��Z"]7~(	.6����QT���!6🈎/e(i.�!��.�$kkI},�f��)7���˹�;�8e�~6ѳ��#�-1�8�'�\��UAy���"�3hZ"k��`mY&����^c��C����973�w��zn:�f��ASm�>(7戛����Q"���o��堼U�r�w��t��2�`�43f)�I[O�;����>#}w����F}}���N|˩ǉ�3�[�-��|{���&W36T|��^��ec[/�ȕ	�C`劙��Ik�d���|F��(�;��Q�����ņg*��>5�6��E���%>�p�l`��H�f�8�b�>��6m9�R�u����	�̈����F'P3b���4w������3i�ߎ�sqL�7����S�G%$�-�K�M�=���r���%&��3�;��Ga�m��FW��ψ�a|$��_[��	y���Nz�\�3 Zd��E�E�ѸB"���I�C绶������]�#GGA1��d]p]uUF�g��(>&��<9Nowc�� -J:�z�y��1d��"��2+o���.R��]ȕI�����jO"#M�3bg���PL;�S�C5g �x�Ԙ>�ev/����E6���+��n����%g}���r��ajB��2�sa��8!vF�Q��I�[�(Vrg\�� � -:{���54}M�I�jj���Ɲ���H]I�ͩ3���PE*I�^���P<#vF�Q|Z�/��N[��L*3 Z��>6&z�.���/�̷�2�Ů��<GN-��0y��zթR��wb�&��(>"�_�ޞ��cƴ!3 ZB��N>3��Ev��� ����C���)2w�)"1�gNh�W�E�G(�;��H(��4�(��-ø�����%ݳh��W����"�V����� F��m/�I�e�z�-��c!�tKc�ψ�Q|$�t���9h\�a@���!h$Ze����" �(Z�f�o%�]R��AU�����l����ڳ=��?.vF�P�O'���{3�h� �R��ݧ$��*%���3��=ˮ�����~e���1v�:�@+��!��J�,'x�mB��#��_~9�غŜ���x@Kr�!���?A7)��O�b�i%������L�mm�`�̽p�'Rx#����;��H(��o~�/�;9k�S2�8����ISCR�I�����:�[g⻛1,�U��4���}TL��D��-�T�@�ˌ�eЋ�|s���R��A/A;���3òt��X�x��:�T�;���x�$m��IY���0�~/���ʡ}�toT�������9����A/���^��	ph�� h�67���T�5yB�h�����CQR�튊��r�"x���k�	�VEݰ۶Q�����G��UЋ>-띓֏]� -�hiHֵ� �f;��>Ă-4�}�D58�E)����"b�(�r�t�}�;#vF�1Q�A/'�b�ҩ1���������@=$A)y���[rHfs�9�6y�K�5cWB�x�d���hg��(>*�O�p_�]���x@�*=9��8G�W��U	4�T�{����)%�=,��چ�E��r��ϡy��J3bg�k�ˉ�b��1�q����ZRI��n�!�"�l1� �]}ۮ��o��p�����ݓ��|�&4ղ�#ψ�Q|D�8A�]$���u@��%�kv��؅�'63��<I.4�X�5=8��[��F�B�sQ<�~c��3bgŧx,w*�8�x?���Ŗ���Y<ĵ2�� �<zW<�Ē4�'pG&�O脵^��l0���Q�����G񏧙�`����8Z`@��=f����mg�/��m>v�n(*c�b�Rڅ��4��er�6�	�����3����NӠ0j��>;D��v�,S(�5S$��dt�IC�D��v}Za�4�P�`yH�ay�*|0VSۍ��g��(>���DQ�w!���p�z�DMHX�S��U��KUz���e���ab�*R�E���-J� �3bg	�W/'�a��Q:5�� Вu���<_t�hQ!a�B���'l�Q��3Tz�\����{�l�%��0|F��#��*���P�vp��=� Z\��s��^.��%|?�P�+8e��6cE��Yn5�!'�İ�J��P<#vF�!Q��7Wq[/��S<�0~g�2vhQ� hi�Pq��t�\9R��ɝ��nCq�:��Rm��ML5e��"f�kJ� �	�3���b}���Ŵ�A��	����U+L��\�ڝʋ��Y7��|Лo�{	^WS�>��D�2~����R��Έ�Q|�k��B13;o��3 ZT�:��o�|��%��Sڧh��*��ʣ�أ�$�����7mU�R��t���3���b/~����c���i�N�Ƒ�3 Zd"8��,�Q��1T���>����#40g'��+�Rd&ס��(M}t�<!vF�Q�Nņ9�<�%f�m�jS����E�)����6����1�hq�����hp.K׽�2���;���(���b������В��KS�o:���>�PIK���Q/%4Ѱ�A���G!�"Tj�e���<��3�����'vFa���Ʒ3 Z\�*�
�[3g�@��Z(RI��d�[��)F��k:�|���b�Ci7%>EQL��Q|l����;2n|�<���H*�6)=���"�n�V��f�2};4y���o��ШD�!RKҞ���nF��c��Ď(��;KC�� -h���*(��Ʀdb����򾯞�S�r6Md��d�(��Σ�&=2(f��(>6�O�"~��4��`lDfmr�r9#���1QP�HM��f'�V�LkAi�ή���J'l�Ht|���3���b{}\|Z(v�3D���L����m���g�b��������>��b��>1��\9a�:���i$5�Ff���GA��F�i�9����Ã�	 -�&*ѭ�Dɘ9�%њ�k�}�< �	-*|��Ѷ䈏>$��a-�2�����GAq�>h;�#
gwZ���K� -]*u�K3����N�����-�D�e��sq\A�YU���.)j_��E1!vF�Q|ZG���Q7��f �ԒT�Ư�Gw"Q���dɺD�o�j�Ò�������z#*���c��D��3�����:�p~��v��g �p�� ���uV�(�x�g.�=�����`�`�����֊��9âq�H��(f��(>6��i�8�H*-��� Z���c�K㟨�H�6Q")�;��H�P�JMỵ����rW0/k"R�������F1���N�jX�e@�SQȵb����$�q���l��2�ȡEV�p�EQ�,����g��(>6��	��=�r�"�آ����1i/��P�Jf�a�B�lL.��}v>�dR�YD��2�R��8WR*��6*L8#vF�!Q|͑.��KW �
ޝqz��� h	)�j�b*k�,�|VY
���P�7�&����`7���E�ɠ�E�Rl��ڑ.�;���(>52
�X�2~��,�������d{#AlJ��=t�ʞ-ݖ�ow�9ނ�W�����]ը����G��b�#e0�C��	 -������FQ����zt9���iH��-��I&J0Tb�0OH�Zt��ψ�Q|D�\�
����R��� -��������DLvl�Z6k�{�\��W�*ziKbC�z�"�h�'�Ga3bg�'����VF�q��	 -�&[$`�vp�L�AȂrmVGr�    W���#������|@	���3�˜;��((����)]�9�:o�Ta��1�šm��&��IlUi"�E��HW��qЖ*�N$\.;��LBU��*�8�h�;���(>5y�U�����	 -�Dr|�ܛ�����{"���3�NK>�FfsEWS�2�!�&}�����Ō���D�=�#��#�h��M�gQ��@�t�C-Ҋy�j�~� ]��V�"�b���E֎�*I��FzDF1#v�@��o�9�r��R;)��� h�ɇ�\_������Q!��%�	sK�2o�����j1ūj�e	g��(>�*>9�A�X�q�~h� hѮ��mE����$G����.m��*�Vw�]�*7*��\�Û��at��ŇD�u]��,t�˔r#?�%F�`��v��Ŷ�TU.���5�.��:,h>rf�!`�� �~f��@*�(Uf��(>
�O��(�p��)Uf �8>� �ϙ�QL�K�^���2�-=�o��,|E�9^K��R�5�C���3����U�.�ʎ򏧔v;�ֆlZl��SG6�3�h�SѴ�]�zS�!T����0M���n����8
/�;��H0��4���(��E��j��� h��-3]�s�Ѹ�<�Q�n�&(p�ъ+�e%B���08D�>���"a3bg�>���N��/z@K��5c2��\6�#��u���\���[��L���{���,�@�d0E{32�g��(>"�_�tr;%���f ��hp�w)Ɛ�̶3ٱʚ��$��!m`u(�iI��3G�)�Yqb����bg	ś{�O�j牂l����x����C5
J�gUN�ג�{m-Lh.�[��f�1��w��ֵ�LYbg	��y���� C;��Т��N���J�]�-d�|.����\�b�dj��1��^t2M;�J����3���b}}H�O�B�]�N��g�ق,Πq�3��T��V�������LJ^����������I�Fl�3bg	ƫ{wz�\�\�4�{� h�Mw�=�����'�7���ޅ�I����9/y^�A�K#4��M$,�a&�����D�;=�]�֎�z� hѲh��9Q	�I�WҊ����B��q�Jr
�ߢЇؤ�8��Є��<mbgŧhǝ�/�n?��%Y盈�i�|'����M,6�l�Ж����S������rP����nB��#����1W2�:��A1��ڦ,lc|�K. QbΊ�z�xJoh>0�V�yB���U[��ՠ��=�M��Q|$s��4(���1���g ����d����0x�)�C�����ښ�rjSʫ��DLP�*:/��!o�g��(>
��v-O�f-�S�f@K3��� �����	/Fz�2f��
Nݜ��E����EP��+����Ω�P<#vF�Q��@�VP�	��o��[� -�W��Y�א!�ΝēY7Mݑ�r�w���:�R�\���LV`~�jX)�,��3����j�����9)�L�T���k�G3 Z�&������s.-���W9�No�@�U�$h�,O�%J�w/z�W>H�#���3����Ӻ�pj0�n��g �t_�<��,�2-!e�E/�F�zVu�Ŷ��s>siۨ	
ֈZ(�P܆!�ʄ���Eq81��ٝ�{7<����R}�)� 443�3"�`Et��Q�7U�|+\%DD�	zAw�bC��	������	�3�����*�:&�v>�1�g�P�!�n����� ����J��I�����z����|S�4:�/O�u��(�mF��#�x���=1���.�����g1���W"y�86r�F��[�R-�^Ҟ��9�L�T.��Y/В�����(�mB��#���o�Q�O�~%~F�P� hi.4e�k�uk�H���P�&�ھ~���=+q�1������k��(sJ�\��3��cs�ݝ�]�W�L#�8}t@7��P�q�o=*�����ڪ�"�}E�!a2�brM���g+RmR��Sp�\��3���b{j(�;m�=��&�H�[�1���x�0"'�K�67����"��Q
��:�HA����f�kH]�,��3��b:5��{}O&��Y��|3"#_zdEV��D&Iջ�=參߇�"/�x+"s#[�I��Gm3bg�����y�ѻ`�����c�K!!�Ӗb�R��NExz��)�BYخ�.^b�� ���,az��zF��c�Q�۠q;�*v4���f��J�Ҕ��AYy��g#�)e7�8֦d���2y��n"���d3Q3#ψ�Q|�[{j7�z�Cb�6�%'�&`H\��*:v���վ�}x���֪Wf-�j�@[ۧ�I;5.=#vF���N����.� -=�L>s9�/�Ϯj��O.D����%�ҽ�\�T��\i��d��6D���Ǿ�8-�]��!�g ��Pc4�DJk51�ٽ+"�@Ai4�l(��j�m+�C81���"zăLL��(aiF��#��ş~9=V�E�<���3 Z��U[|��Ϸ���[��i顷�E�OT��"��,Yp�n]4�2^ڞG)�3bg��ne����`�w^�8>1�A�b�R�h\��{ץ����/k�G\m��|��Wc�$���7d�p%��͈�a|�˻S2��Z*�t�0�x@�1�����X�4C2�i��L��lW�I����1�2'�\`d���k]Kԣ��3bg����Pv�9o�(��BV�ȼ�&2ԃB_�*"�������m��W�=)Qu�svs��iX���Z����|�N}�	ɯ�n�?ȯ�	��p9�U{�cM�_�{ka�S��ʔS���w�������b���;L���^���/�C��?~�v�߇����{������\̭���p����_y>{�篞��׋��_��/�gk؏�.�K@��������o����W�H�1�%]��WR{|����r���1z�6M^��Ϳ����w�ho_�߁�yPo��u���~m�\4����Ƿ��ŭ�����~�_��U�j#F���o������jM�=�����<��l����޻5[r��ϕ��g̈���x��0��t	4�眗����k$L�s�o?_���JDQA��̤ ����"#���B�ǎ��*c���}�_�oڷ߽����
w�Y����@���7��le1�w&?br����kY�#��V�+ o�4<Rrq���M18����zٷg�|������>7���������Y�^{�����*٬J�e{�$hлd�<�p��<���_�j�svאq�Ї������vΪ6#�ݦT ��~��{��;<}Ւ6�`��H�K�����\���0-	�-K���� ���~�s���ʳf%2�K*��0YI�'U�k�`��-�By�go=���?�}��gx>7�W�����{B��%�ڧ{�+��P{�F�5���CJ~���w�j?ޚt�U����Q޲y���T*����|��>m�O[2I�y;ą܊ۅIEi8p���Y�Le����o�Bg�J��c��x}v�;��\�cu�>�}�O}�iK�6�4Rt�7�}`��@�P3��\CP� T����]�>���,eƓ�:sҦ/ݵ��n����_�#c}AR���~��.�~����-G�۷����������u0U�o�vil\mPCR��΃���G��S�1���W&f㢳T1Q:�{B��6@w��u ����[�����3*0��S��j�Q�\���XS�̘�=fw_�Z8^��}��g�>��oq7~+��������7��;���C܉(�4J��Ц�+׹U���!+�ܐ��!�D+^́m69�Ǚ�h�`]U��PRla�'��T��=��
]�|ڃ�Gޔm>�O��oJ������ �e��u�+Ko��B��]�z�R鑲���Rk�Y���3�m*���
�;�?m��~���(~S��\;}�X�45\V �H��3l鬥�x���p�\c<��L�u�!d//�"��b��2���፴b������]B�ۋ���B��,f�N    )^hs��X�çIR�W�	Ņ����4�\ؑ1��:��Z�VG��dk��@���ɂ�E�ˎ��t���d���X� �i��%aȒӇV�7�z��^a�n�8Si�V%5��$�Tp�r$S�a��[��E�AqN�����筥V �RP�A�a��Z�/��a�hw9�=|��ĩ����Qi{��
�*�Ǡ1-&�"vQ|Ȏ��A#�3���6�쬙n���;c������:�6�!Ӛ��ܣ+O��V���
x��j8�2��iW���]���3eji����S�W��>��'e��T��^1V���nC�=Z�� �����9�pA�亊0����a��ª�.����ǹB���%�6]0^!hc̔J�ڊRNF"RmMPȺk��-u��`aˡA�p�2�ʵ���-��;��wb���~�g����F�}��w mV֐���v���l�reM���Gq^����w�`<s6Y���zS�J��]H��ڂt���y��������N��Z6�$�����6�T��T�O,=O��R� ΢��`J��8m��"vQ| ��|�������a��Vz�rS���Re�V%q�uˣh�QS���A;���e�U&��c��}fQ��]H���i�V]�F�� ��5Gh`۳�b+1e�_���#w[���_�8�Ͽ�9r���{ुӣ����5������������O?�)�����G�_>���C��_˟?���˽��#�?����ǿ����}�M~�U~�'��я~�e�_�O��������+���z������v���w|��	����.=ٟ�����q$�?b�/��������t#�Þ.)� �e<�%���Or$W�a���M�?�[ԡI��ؒb��*��|�x�yVwE���m��YRvgZ��/���G��%�����Ψ#I.WU,���u��T����pz�h�}�f��L�I2s�!b"gFǊ؅�ѻ�g2:@��96i�˵�6,�K��I�7��q�����7Fr���Z%����]�{s����m���]H�w��-i�95)V ��H��VJuH���"������Wbd��uS=��R��b����t)#{;-�� vQ|�oZ���t#�,O��V ��s=u�O�r�iU��[��TZ1z�#q�\�r�r`���Ҁ\!���Y�Ŋ�E���|*���n�ޟ�8X�g�{[.����(�"�r�J����_�~/�B�Dq�D�s��i����&Q�����#-�T�1�0����ԠXh�[l�6}�<��Wᮕ�X��c�σ.�(a9[�Y�窊�<&&�i�����(~S��\�ظ[4���AV �bʥ��U���)�\�ʶ�������%E���2H�/Q[a0� vQ|d�P<_�%���� �b�Ȋ ;}[�
�̵D����[ؚ ��S�I�r���+͊k�U]�(>2^�l�Ƀ��>�y5��6��'4���J��0;(�F�*�?:�=o�JѳU�a��Ee*CQȝb�~��dA���x�x>��-�a=�O��FQV8�P�l�*�]�6@�<�,.�����K����Y��T�#/Y��Ζ�W�.���:�]l���;z/���b��X-���^1x���ޚ{�VZ�*\�H�=,�zV��P�$�2˒^� >b��|�8޼Т�,��6������Rv-T���-����C6��m�Hi����Q�p�V'�S43�nA��@��	)�[t���+ m���y���|J��pMUx����l�K����������p{a�hO�8?fE�W�.���؟��tK�N75�W ��	4n�ʘ��|���b���>Z����Rh08���]�p^�L)[；Y+b�GROg��>?o>�Ж��)Ŧ��;���n��ݹbuqzO��'����*Z�/�EN ���,�iE��@�O����cJ��� mR(���P��RZ�zx�C�(}}�H�Q�´(��9�{si�K礛�Ҕ����#)>[D(��g(ܩ.^h���>(m�rohRP�����P��}ӣ茳̘����UnYJזֵ��Ӭ�ۊ�E��MB�TU�d���b�)L�v� �i;�ޔ)�<ـn�U����#��ikC�l�����Z0MU�GKY{t�mz��]B�=gmXPn!y���� ��ԲaƔ��g�U*�[�\�Skn�Cʮ� s��h`���h��ҹ�@�`����]L����%��L	KAJ���/��H��`C92`p�ij���Ȼ3�1���rqW9�?pt�L,�����0�T}�hJ7�!����
@۰�i���_�^����q¥���#{487�5�d�G��T��Fq%[��y����]H�?߂�3�(��Ә���G)�[��Ғ��J��Ϟ�s�B�\BiY��H�I����p:�"~��~��E����0v�����;
u���F�4W��Ҧra�,�E�OWo����b�0(��h�` ��2���pK��L����#)N����f<�|�x��K��s��	|�� -�,�ݔ�R�O�AU7+��V�U�`����#�2�(V�.��x��\����6�S�>]�RY
e�4.�֦���u�17.GՌ<u@_sO��`��������O�{M�W��n�؅���iQ�~�6¨ Y�qo�؍�X�k1��}K�=u_RS�ҽ���S��Ӥs�eG�"vA|�*�⤪8�"�� ��d��RȭAi;�.��tꄝ[v��6%�-�B��u�
ST�z�=a2�,�nE�� ����Q���j��t�x��g�v�8H�1����1;��3-��T���F��D8�f�`*�g�(V�.�2(���W���b{�_��,^hk��s�0�uVe��9��i}O��	ÓYU�wki-^0wɚ�Sǣ�gK+bŇ�b�oz�o�������M���H��{�]o�xbK��n���]/�v���PltR�[Z'I���G���]�"vQ| ��|��>ޠ]��ݭ ��^��T�ҿf��Il�ꁝ����Gdf�1�a�$�OG`���c�Y�����)�<����j������[7�(cd��YPo�}>kSJp�a�q��ך��T���Xѣd�5cx�ж"vQ|�_����B�Yk���+�lR6s�T�@gX�8�e��̍�,��S�Z�,Bp���+攳�83��.������ v��h��
>�}@���Y�O2�V&f��ͥ���qp��K�*`�~#Gk�����k�"v1|��}Z�8��fӼ��
@��݋J^B7;<��<��[�%��`��6��%�I��`���Iz��$��Y���E�x��v_,��eR:����\�?[��j�R��J{R�@���,��u�NMUlF�)�af;;`a�衳eec��m�V�"vA|4�gj��vV�\�����IJow�b�$��2ޓ�|��˾f�B$�/��:u(v8=k��(V�.����g'S��IK�wTTYhc�峔]�����	H]z�q_+��pm(Â��Ib�������X�V�V�.���8��b��a�<(s�M��)�6�Y줓�Q�A�R��sg�jD�I��Ò�ܙ��-�zԳU����b(>=i$�Rr����+ mC�.e��`���].�M{�����Y�$����'<Yb��a�j���
��<V�.���8]P�77g��;ݭ ���a6K	�qP��b�Z�F����[��W��a���blI�P�,qtE�����7���\�ϞnL�Ʃa�BЦG��T�%�^\46�;j���xJ�E�Ğ�P��VJu�(����X��-ИZ�0>:��d�8�lЉ��+ m3��9W���Q�̩���F��j��GW㞇ZLR�y��P�cϽ�B�V�.��8������yu�~ q�U:J r�F����b��֬����ڍ�^�j��@\�V���h��u�F�"vA|��ݞ�t2�.�������.^h��d�[�l����%Ϊ�PZ�&�G    �F2%�d1��W�L�?�Td��ZL޴1͊�E�A��ӓF�͓qnj� �yW+�cV&yLI�i��Za�J���E�G`?c����\;��܊M5�Zff��E�a'����-�e?]/^hK6K���3F
�Iz��p�t2��\ã7�ZSz<�u�%�l�e/r~�Ҷ"vQ|���,
�9Ӽ,�
@[)��2p���n� !m��Q�?6��Ҡ)!J�P��}p�*w�3�Ɍ����)������w�@� �%��$/�'�t��0���PŶ�p�����T���{lK=���/e�ݭ�]�}.]lH6�y��
@[Qw�$5�Ca�� Ń��]Z'�j��k����^H�����ҍ��p����+b�GS|�F����8_�XhK�iö�p�#C�l����c:�������������@ӊ��Y�f�xE��h��\��8p�M��6@<t5M�R$1�6LI�^�l�)6���CҒ����&���T��KT��aJ��E���sQ�nd���+� ��Q�3���'�57TvR���2�5[6;����Ibi�WKC�ۚk�,D�fu�W�.��ؾ�؜̢���7nj� ���l����V��qQ����V�a��+��{�e��e�Ch'wui:Lu��E�ۓyw��L�NW�V �\��5X��:\�����Gbʮ�c؎{�U���gK��TTu!H) o��W�.����d�8�|�b�� ��@j�-���4��MIv�w�&<$]�-sKj$-t�3AU+�r�����,hE��X��d{w6�4�'�+�, ��L6ti]N��_�g��G�f��w�]�6CU[��e�U�À�Ta���g�xE��X��ѧ����9���] hk�t�;F�$]�b��Q<'�d8����6�M���i9��ʾ�7g��-)M�!,�]D�W/�	�H`��υ1�8�NS�b���%�]��l����vG"�,�!!4~���Q��]�n�P�=7�uT�S�xDSf�(V�.������ϔ��e#4k��R�+ m�%�k����A��))A�?���=���	*Zy�3��p{��,���O1M�箈]M�=�o�x=/���FlF�'�̐�&/��ݑ���0%N��{G%�{i!jA*k�D�R�j..�٘�����c)������.N-���R�i#6U��˞q���eX
!�����k҇4�Y4C�n�v���{ұ�[���]L���;G7�G �@۰��"F)��<��k���ar?zu�m=I�JR��V�~ʵ���n��W�.����\KmN����뾮 ��d�n����8�+�f8vM*u?:6�[����>)� �����t�4[�X�(>�b��}��;w���K+ m��QR�3�4�(CeI^2��3��G��9�LU�~�.��+��� �#N�����E�AKmo
R�s�����Y��,���e��7�5Yz�vűEA=��y0��/��8X*�z'��2v������^�0>:�\Km�ޠ9�<�b�-C'�X�NF9Ƹ���,R�4H����Qw����@��nT��1 .f��"vQ|t$Źc�o�γ�W چ�k�?��u�0�Y��¤0#��.P7�zW������g5�P=�w+b�GGR��0�����i��
?��ث�ȝ㦲�4w�8<v�m��#{(CRG��^������&IP�Ӯb�R�,L����=��V �z����ݕv�0(�p��V�p��Gns�x"Ks��^7�B�$�^�,�mE���@�{�Ɵ�c{W�.�����|Q5K�\�7'��`'�Vsn{�m�H�c�͒e<�ll�����eVM~E����-�sE�����&K mچf�lE)C+Wm����ҨF���:�)���[;$�+ΜU�z\��,zE��h��UM���k�4�ý �F���릐��&�Cj���H&=bժ7��3zqf6�:����yH�4[0^�(>:��\+m�nI��y���6J-��I�a��SK�n���D{|�/x��o
�%�lI��U�]
mfQ��]M�v=��IJ��Z+ m�a_P0�R�w���\�S�5��8=U3up��p�k��d�D{z'�5��+b�GR�k�͹[�ИS�W �*C뺘���@�ei�����gӆ}��a��ժ�4O��!���G2�g ?��X�(>(��'�ɔ�t�����
A[Ӎs��\ג���8��s�=�� �@�ܫW��^�7Q�nq��f
!�ي�؅���@�ڼs�}��i�@w�jVp�4(Cq�����~�GT[JV�����;j�$U���u	�wq�Ԭ�]M��佔��in� ��F�G'���,Y��+��7�I���b�Tz�E2���(Qz�Eٰ{����.^�(>�b{�E
O7��MӠW ں���{��ޥ��rU%&��:�Ⱦ`\�����D�s���{���Hf�~tE��h��e{�=Zh�ݦ��P�5d�ORB��*48�v�}����J�WIn���xVtn.H^ui3]�"vQ|�O{��J��|Ӝ����
A[v-bR���ee��V)�w�����YZ��"i���Pe����m(:�R�V�.�?$�O�s�o��'k�/��yc��_W�ټM���T0��>�lAK��T;����+L�؆{H(����1�;9�f�+b�B|��x�5
@,a�1�c3W �|�أ${p��ZR��:l
�KK�;���w�G���6�R�V0��狙fޭ�]H�����Y"��)K+ mF�+VG��g�0L�Ъfxv><�����Et�e1��q�p�`��Y	����C(��Aq���8���b�� �t��d���0��T�P0����w<"{E�R*��J1�c�FI��S�%{��]H�ݻ;�Ea$NއyP�
@�#J�|W�M��$H����-���f����ϙ1��HhY��)���d���LC3W�.�?$ſ��MS�O�iQ	0v�q^W�� mIw�w&:	���QboF���-)�p�h���'�� S'_�ʲ��y�DwA��CR����yRȏg�� ���R|�2^!h��Z/�z��$;|�+.Tk��ظ[
���A�̲WM������+;?B�U]�0>�/��؝NK��e���- �%Y&���)I�(�8�z��3-��26-����:=�l���H�Torma��� vQ|Żuq:�-�4�4/a�Ж
4񀡡�]��M�塡M�:���%��h�y(�9+�N%?���Xʥ;��+b�G��lڂbҼ[�@���9|o	RW%J[&��9a��.��j�B�mWʺ�F��b��+b�GR�,��ݜ����+ m!u|8����t9{�\A�9�A��ͻ*�ְCLj+Ը�Z�;r�~Xp�`�"vQ|4�����W��ih�
@[��D�^�Rav��U���.H�R��ٗ�8�Q�Զ )No�&��V�Zϰ��l�mE���p >_I
�nf��FR�$u3�G�$ 9�ޔg�%pj��G2�����3�VIMx�p�Q�<���b�GGR�˽����y���6J��S�K2š
fGe�<�¦��R��$�ZY�����E%M��SgAm+b�R��(v7�����6����'I�k��U1�J���G�;�:����E�U0��`��Q�0E�ܻ���O�{M�W��n�NKRxb���6kL�3�@�,�𽚔.��8X�Nbk��J��b$K���nf�+b�GGR��bi@j���A� ��rV+=��j�r	Q��=�qQ?�ěA�v�KN�a@gR0�s�3�g��+b�GR�NG������.^ h�:���`6�4��i`��R��A�yG՛PK� %.c� �+:&p�Xưf�݊�E��?��b)�I���G �|j,s�dvb<KO<6��>��<�\��5�U6�qpEV�Ϫ��,�6��_�(>�.��؞NK]2n��F}h��ʍ2��Fâ���4�:�'*%x�;J�h-zR_��m^���,�bE����L��y2],]t�s� m@��q���    ���`|��^�1"��=}4��%@.�祅B�M+_G����y���"vQ|P8�?�4��oQ'����
@���!kYE�.����\�1)�kw�G���(<6��֠ 9T��+��~�^�"vQ|ş��bknl���@������T�QJ]<������Ȃv�7�1��2�E��{�1�z���M����]B�}���犓��fG�F����s�*����G�sk���w{ק8�ϣ���f���=�W��)��wb�a�&N�\��� �_���?�q��V�2�Dꀮ�3*0�8����o���w߾z�������_ ��]����eJ���P�dę ��v��\��w��(y�L?y���~����ϯ�}l,i�7��$��^X�T�.�6[(���?~�'y�`� r�O_U���Y��%���J*��Zr��jL�Ɔ�,��K
 �5���GL�r���w"
��t-je��3R��RhҮ_�F�1gSt���o����o~�?��w�J�L��A*�/+\���d��#բ��Q�傸�Q�����?��cy�~���������w�Z�����?�Xџ��o�@������}������׿�������O����������~ӿ�׿~����?���~�z|K�|�ɓ~��x����� XS����~����%�#�q��ld�(�^�@��TJ�p94��Z�y����w"^���_�x7��T=�I��fV���<i��3O7� r�W�y�84���C(����󽜕��p2ݵ'5J�Ů��U�`�'��ނ"��i�,G(�0�b#銩�@���P�"�����'��V�~�p~� �o=�p�Eo�~'�?�������/�$�W}�K����=M�Q�^�` ����*�ʷ�a��F�u*�)d��{�h\0�]��=�'���U�%8ۡz�K�M`�˚q�r��0�*�bъ��5i�Ý�X�Z`~�������o��V��y�-�t�w�!Y���ùȆ:,{-��^ѥ�����1��g�=z��J�ve�Ǽژ�#8p���cd�/H���kً��y�[�r_^?|r��}���~ݗ����20X��[xs8)�Ô4�!0t5��S��v����k/oAmn.Z;O�\���[G���m�ʂ��Ձ+�ނ�y�^�T�T�'I�8!����f}H���=Z���#���M�,E[�R����4w�גJ��Ap�������[���l�R�p�T���d�:��
���Yg�⳷�[���??#/�>��;�i)�QR��0�G�<�{����p(IȾx�?^~�t���=k3��>��GQa�^� �O�ĕ+�t@e�,E$�ʊJ-p?~�Y����?�?�����f�#�	f�I�c(�s��zN6�X�)_����7'ؗ�>����&=��շ����:�NK�`�L�_��-�B�:�&��V�����9�����uu����pi��-�����T�ݾ\���=������M����n��3Y7Ղ��'���(�)�Ȕ3��:9���T��7��2�*�g$�B���hE���^�˗��K�F��J���?�;���O�������z��:�'z{*����8k�kzAF�Ρ�t��5Z�{��
��)�h�3��*�Є����=dWYE���0�x���A��Nj1������?Tp+��m�|��'/��lAy�`��(�a��>��'��;��CԆ�^׽ɃsnQ��x/���'�0��j�����cCH��U0��V9�d�S���/�{@?����o~���l��_=����J�˯���W���[�<!���^U�����4��P��h�Z�>�;�(�ľ5,e8R��������VsɁ�\�{Aс/���R�x�L���Ϥ��Mw5��"L2<D�t,8��,A�
,�M�ו�kLƻ���\/*�bzl�R}��!5&���������/��H�����|�s��"\���n�U#ژ��6������<#Ɗ]f酃�om�d����j񂳜p��`<W�y���F?��y�{���&`b�E� GҖ�AE�F�.�]��m���I7����d�U�W ڼ�V��$�������ĩp��7K)ѧ���nC�<�n��[�R����jV�.���ӓR�7)�)�+ m��-��pW0%:(�A/}&L�Cz��#���<T�Rk!�S(c8�S���@��w+b�Q�����(N��x�O�W �Qi�W*��������]3�`�J¥�Vw*-i(u���78���7�p�ôqՊ�E�/�t��~��gg�#ߑS�Ə� ������)��,q�R�F�[x$�K5�=�Z�)V���u왑:S��i�����C(�O�K��1��4�)_h�&S��B�]��,���b+��[�#���0:�cׁ�b���1���n�XfY`+bŇPLOӹ(v7�@u�F�Іe+�5��2vǊ5e�a������gk�	$_�Ĵ�I1����(��D?+
� vQ|���s��P�EM a� �6��\��N�"[�E1�2(�Jq��n�ju�<f/́,���ԃ4��^{��F��]B���LE�A1߂��O�TV �B���U풑�V�	����фځ��.��ۺ�g�w�RF�)h#譖�]�~���C(O��@?�p�Uj�[�+�l!�D��71�<@��6����~�!-���T��F�7Y��X�\�l��?.C�~��C �O���9 �7g�;B�V �dIY�n��ֲ�=��ڥ*)I����r��\E�*
��24�:d��J��Y����C(f��_���s7�a�� ЖGƵ�{�f�s�@��0n�*�]��f}�2��R]L��)ЅGm�DpE������Zhs�f����+ m]�%@k+�S�.F�4tM�66���;��[).�d�,pL���.�Vff��E��D��ߌ����~��� �*gp�\K��lO6��S�-�X�4$��5��p=���b���+bć@l� >�:��7m�yu���;���)cJ��Ui��ڲ���)?z�%=j2��˳�+MYeNi
EW���6�Y�(>�bz��\+�nx�3��Xh�11�g�򑄽%�.��VjE�	�z��e�$=1�ui���m��t�nA���Z�'���0�s�W ڜ)��[S�G��
7�#P���8�X}�-
ܴ�l� I��~W�<�z����b�����2}����v�
@Wn�bT��@9J*�^�J����u.#�j�#W�9�e|��%O��������j��s-��{�{ه���@��HcܱTP�\�d��Ŕ��jҳGbcȤ;u�)�[*l�T+���%�_��jD�?y�O~�_�7�)�t���Z5M�9<�&��+nf��W�0������_���uͯ>��w�{��~��֟��u���Wڳ�W�����x�˟<��?}s����o������o�W@��z��������j���w���|����H=������s�k������_�d0�#����߁�eR����7��x���J;��o��_��q���o���?�noƈ��������5�<��C�P9��0d%I+�@�����6#N�Wc/����Ӿ������W�K��룛�VHފ��k�THR.�B���<���oʜ��r���ؙGc�4rV����%�����uޞ�j������H�*#N�1�A\���s6���B�<9+�$����;6E�ES�U�9��zV��j�)��	������{_���s<U��ɪ�0�^���.\���O�VZv��K,T>��)e�9>��s�z��7I�"��-0ze�:���7\�yu�� �����_�����/�WPj������M�P�.��Jq0��-��K��v�LU�*�Y
�I�N�`�sO���cp£19�]1P�P��N�ť�VrA�UD���^����0�O~�/������u������H�+�s���exqPh�*Y��(�vP �<l�]�u�\5�)���V"��Kuv@��B)�%�C��"�^��d/y@N    1ɐC�J�
���PJNT�����~h����<�K�l4R�{����UN�J��1
�_3�>h<^��<�g���I]W���F�0�d{�zq�s�����R<�K�k�VGvoqQA\�h�j���߹D��@�c�@����/A7�������L�I7�{�ɚ��{�
���(e�d�5���*��&g$н(=Bs#��v�L�"�w~F����c��x�g�ݼc�SS_j�-���p�^��id�yOJ{�l�ٵ�n��>_��tO���\�z^X���͚�,��������3��zFl-�;u���0�V{��r1�m�FE�K�%�G��\���l	I�6��^R�bեg���t?~FĮ��CB/�S�ŹR���%��|�d�-2W�V�"]�P&پ�:���5���B�Tei��6E�Ud�C�Z����6�^�(>$��<�^�i��[4���?���b��9�^�*^&�����|��=*bE)����m�"bQ���_��37s{W�.���8m�L�7㵷�Ι+ m$;��5(h1(�&P\XŚz���=�w���"�C&�sl*��/֓?ϒC�.�����=�G���`�^h}�KVں5���=�J}��
������ń��)�Y/����L�(� �e@�"va|` �W��L�bY%Ĝ΋l. �XɖlU��"�M��a������R��7)�Ki"�p�9��ԍ��:�Kž_�� ��8i��Y��Q�e������Mt��L�`���^㨏-�6�N����8[�0P|��r�z^���b�Q��I)7�#��a�Жǀb&��i�Tr����*�=i/&{Ç������w*�0Ox*Ģn���+b�Q�{z�8�Ȅw4 [h�&$��| �]g���ꘓasi�.�9��VMz�8G��A鑌%`by��-�]D���ɗ�����7�:,+ m��\1���E�
�T'<!��!Ù�L��X n�F)����if��]B�}Z��'[�H�H��s�V�tԽ���ew��2X&��>Fd����0� �z�K}dX�EeU"�xIn�-gE��� ��d9�)W/I�u`@z�Զ��sT�VVv����V�DJ�Ԫ�}�����.KI�#K 㔶��9ϳ0����(��[��H�
+ mlz�UR�b��Ȯ�"K�����-:��c:�i�%55\E�Rg�E��C��ݻ���(�����v���0^h�vצ�I�bu�����J���p�jl�FJ��Ӄ�Բ7YQ0���4��K�W�.����"��(�7�wS]��Vl��\VMwR���b���
~�1����}���Z�f�g�4\�`t��uZ�eE�� ��,R���ps!x7��+ m住���%����gp��]�u�y]Ѭ�����Xj#;����H3�W�.�?|h���t��6o!F�~6 m���9��$��*��N�[�>��c�̝�Y9�$�:U��R2.%7�X�(>�b�D��tq�>��+�l:�^G�cpS4�FR��C1?��MέTg�e�ڍZ��5�<߻{���!��g��^Xssѽ���
@��l��dOj{�L�W[(�}�yl0��V��t5�Z�a�"��)f8�f�3�"vQ|���smzX�Q�v��V�9?�W^)Q?��X���[N����M��A��^pgI$�xz�d���J��]B���LKIڟ� �ئ1m m�I�s*a5K�����OW���䋴G|q���0d��V�ȑT�:�O[]Bqx��L%�Aq��`"M-��6��W��z��%\g��IO����A3�8$Y��X	~�m��4���Ζ(V�.��8>Q|��LIڟk���&ޭ �5�-�V)ocU�ަlKţrŽ^?K��<`;��d�Ȋ��
���Ά�����]B1?Q̧�XڟG)8���h�-`�%)SlV.q�ՠ�ak�h�N�����1��]{T��&�E�Uz�>�2�W�.�?|�ʁ>]|��?��4��-z�C�Iyw�(�3W)��jԃ���絮ɐ�A��X��=��ZC�`#=�/^�(>�b�D񹖋��t��]����B-�T#I������S�֦n;mL�IQ�\����}��X}֭tE��@�O�uG�&���m�V �j��'u���J�1%�gǝ���zSMZ�V�����*��jG��"�Y�����_���ywn�:��yw+ m�I�D|�&��N��fi̛����	#����sP�� 7�؁K���g���>��W�.������o�<��І?9�ժ�R8Wñˁ���+���5��������fӲsma=�5�Y�������ʪ�ӕU!�%�u�*��6�9Y�=����?iP/;�#>V�L"\�ǥ�6$���.��ݖ�RMa�"va|���٧�ן��l&��7Lg�Se��t.�KQֲ�I�#oO6�B���H�s+=d�F��R�R�����$�Wg�+b�GQ��_��b{�Γ��w+ m��NX��]����EM�S�͏=﮳�<�TdCW!�{U�Ͱ�Uς�V�.��X�G9�νst��rjQ� ��=�����
VRU��R1_;ŹI���x��ې��Β*�I�����.R,�]H����(v��As�n�-�����(�wP��+��5��xJ��4��5iȆ�58�	�H�9<���W�.��x��\�[���tz��H�Z ʐܨna<øP�<Rа���w7hԪ��nT��*3�=J+Ό�g�+b�R�o���t�Kӏ�E�І+���X�Ĥ�8�����*�X_g���r6���I�	�zt�P��5h�i����.������;��d�MK��w��|?@����U��,�K�Jf'�xQ������� ���l�X\ �AJS��fS!6�xA�� �{R�"�$n�is��_>&�������Hۦgڝ�Vt�W��,};����6�ڜՅ|������(���)���>��� ��>@1g���}����|�訸Gj3ùH��E9�D�o�'/��Nk-�]D�ԣ8�J�7Ҟ&Ѵ��
@N��S���Q1fU:���G�h�>K�4Se�:X\EYIY�`�yPۊ�E��+:���`R�[�� �Q*%���II��0%r1b��(�=+�0Fh�jP��L��+R�0i�훙���]B�}
�8Y�W�n�i��6Km5�V��`�Z��|P�I�;�l`w�]�'M���0�c,��F~�,�nE��� ��lޝ+���|�D�-���!�M {#[�pU
����N��*v�XS��b���,2�;�͒w�Yóp����)��_�Τ7\��ͻ�6���$��,3U���^��q��ct�CK�j��d��)6F�=�(��+b�R|߂>Wu o 5����@������A�k�t�ɪz�a��u���Xg'[,�׆�����kW!$-ml�o��+b�GS|2��o��ͫ� �N3ܿ����r)T�A��=��R5�]�|�#�kjZ#�|]��HE��zf��]H��B3���&%�:w+�l��45UhT��}���#pʞ8���=pȌ�1n-��+�hْNcf��+b�B��x.����{�Ҷ����T��8T��lat�����)Z��V�L�m���T�ѩ�]��N˪��]D�/N��!�[���t�x�Mn�����6tq��K�
��c2؏nw�c˩k�h�*B0�9�ˣSOՇ�g��]E�	s=�b���8�N���zΩx���T�p*�Q@q�TU�+�2L�{��U�'A�6���f{w+b�Q��	s=�bӰ~�K+ m:XŪ{���J�hqI�>(�N�1])H!�,�W�V�cf:Ӊ{�fV�uE��(����d����ͻӬ ��r؛$Yְ�9�B��oݱ����l-��R�pP��!�`+.s�u� vQ|�_~���R��xsI�y*�
A;c�wE�`����wFm��;О��]*fu*x(rQY2��*n�/0Yf��.��    ����}�k���fR�-j�f`���t��)7��Z,����N��&��W,4�A�!�q�M몬�]D�oO�Ԗn�x�S�b���BA���$&4�^��P�������)�����v�3-�(�)'�˴Rۊ�E�Q��?��܌�O+� ��^�^>9$�C��D!c�÷���q����T��7��U���&�ur�����E�A�	�?��F��6�Zh3~H��!��r��{c�5Go`o�hxg�M9|����e�?���y�\���.���&2���~nQ, �� ����jq�Ĵ���s�F�a���]q6R����6��f ?���.�?$�{O���|�t���b��/ �h�^:�.�Nz����p�4�Q�)t�	6��.���B�*%i���=��GW�.���>Q|2]n!x��5��6}��%�q�t@�ҥp�0�ͣ'��vp���=_D����'<�ؚ6݂^�(>�bz��D��B1�|0�L���6K��J���w��{﵎MȰ��1��+���P�._�I�����h,�1[i[�(��?U�����p�����)V �"�Z�2�H�̄k�F!< d$dh��{5��:%�&�뢒��G�����ʳ@����I�oS|�r�B����iH��&57G�C�.�m	f7oȜ��Jxd,��M�m]����+�u�0�s��N3��/vQ| �'j��ư�y�Ҷ�Vuj}��,
�*a6T��v�g���H8?z?:i���&�w�}`�g+m+b�Y���ĕP,����;ޭ �q5'�uYi� �_KU~d���`�{�3�^�v�R�Җ�y-�ýu�4��W�.���g+�"�i���\�g���F���!E(L(���d��(&M��+0@��u�j�,�i���ɆR������V�.�Q��ɹ;�B��Va:�i��
@��F����a��E���zt�V���\�;���~��@C��W������g�bŇ�b��ܝ�biF��m+ m�'mU�W@��{���9G����b
ԋC+kI�`dw���B����(V�.��ş�3��J�0��+ m��Ҭ��.���P���4�b	�H�=jɧW�C�2���sVQv��ћ�E�"vQ�A)�����A1I�0��y-����ʁ7A�.��f|9��0Z����1.)�QTv����W	�H��m�e�V�.������dn�6N7�W ڬn�dG�H��3�[|���+.0�G3��9'nME_pG�|v�x\st�eۦyw+b�>�->5���X"{��Ok��U�LM�&%�+e�Fhm�Vq�G��ND��{(�.�g���#N U8�{wb�a,eU,t��L
����O)V �\��,�GfXρ�ʭ�$勋�����Z��qe��@usuRâ;��֭k3�bA��@��=��u��\����lb[<�eiz^aw@}î��]0y_��|V�7{o��m����z
=��`�����o'��5�uN����n*G��������JI�"䰨�R%�C���7��4@fιW"k ��	I���(�mf�I��Z���5j��0�bF��*K�N>�I\	�A��.1��wj?*��b�B%�{@n�ҍ�+E�~�%?��$�w)���lqX���p�҄ -�%IHl�.�M��l����j ��e�j[�rD�"r�U �([�y��9��$�w(��qq\AZ3����%�H�*\iZ��;���(��py����G�bT³xC�BEk��2R��,;I�J���QI�Q��*��Vی -�<+y�k�il�"�F��/-�~�_�R�V�x� $1<ψ���Uu[�hT�̲�ߑ����p�ѫ�F��8�	Z�qF����;��*�nsdM�T�&��um��vcl��"���F&P[��̲�ߑ{��جF*��i� -�T�(st��KU�l���dL
��Ew���,meyƴ�e\hi��)R����e')�#)��߱������f$h1��!ܾ��E����d�9�3)YnG�5c�^7�=^F��#��f�������Gj���Wr�gh�?�I�E3<�����5������[��.y��b����6�"'c��f������xK�8>)�'�cghQ]-�;��܇;�hO����Z!��r3m�����\oZD�pZ���Q��(7sb�I��D���L�c�>
1�rud��	Z���4�D�TS���*�7.�К�gg��	L-j�-V,i�̩òi����̲�ߑ�^��G�cl�
��0�bF��T���PL�% 9�E��ֵ�S[(%y��Rr�c�;�-��7����Gim3�NR|�R���I1��v\>:!?Ks�	�:W>u�"q�6��蔜7qk�d��-�}�x����bt��F���M��e'!�C!��wxg��r�'?!@K+>**Ax�<��*�L�}%�Xp��۪4�uٵ��O4���.V�S��0j`<��$�w)�Gh���R�c�Z�t���V�t���*M���%o[MV@d�,��t?5<N����q���e')�C)���8�ކ��́&h�<ƼtO��Κ�-Rs��̾~4#L�-�-��-9/E�J�je�]5��ap7��$�w-��um�=9?Lj���J��4w,� I�I�RH�]�m�-�`0w�0����Є������m��6��$�w)��ȤX�]S��݌ -Q���E��7H��8B��a$)kL}�ѳ�ϟ==�����_C�����_�Vr�ى�)��8F�{v$,|+׮���9q���?�듧����'eG|�H6��S⒬�9DMQԬBҽ�h�����_�:��9=����I����;�47`3s�Y�K�� ��}�5qai�or_`K Һ�淰�:��僋z�Ur�v��9�H]���y�lj�\u��n�N�6�Kɤ�%d �����S��T�:�����YeS�R�'��ܿ���U����	
����$y����`�Jf�hQ6pWB+����J�	!a�*�I���{�L�+�'�T�/KY�!�{��,��w��*߼���R�=�L�����M-���`��t_`�rq���S�OO���H/�n��'��>)��7�~�yo����盉�u���/Ϟ���:�H���}���?�</�����n�͓��F�=}cֿK/^>o���'?��=~H����U{K�M��+���{4��GM�?�_v�=�.��3Q/��0��m�J�.���Oz���_��=;�S��oO��g��/��2o���;��p��L�.$�2���_{���.x��	Ϟ���q;�Ϟ����?��K��;گ�<�8g�fI^��)������N��A+�x�PR�V�{M�{�8�]��Җ�N��M��9�5(����+���Y�.�����y���<�|�+����L_�u�\�C0C���ax��\��DR�	K�j�6޻�4�}���D�x����mZ*.U;�7�F��d��"&�׏����7o���6h���!H�YA(>�f*�4�љy�ᄱ�[v !�Y8s����u�wۍl�7�g�C��N�dD�&
`�<�U�ty�ErϬ��$?<���5A��/��E{>A�C���!Y`v[à�������]rh��g
8x��UnC!-��L��:��S�����l��bB�S��R��i�� �̕ކ�
ߑ�7 ���gH�E��ԉ7�.��׎��1p
2)�Lq7�����,����Q]����%= �@ٕ����<C��J�*��9%7q�je��:O�@�^ǫ ��b����
�jbj��Zv�V?��+��k������*�9�nm%m@�rP6;΀Bl:<���ݢ|A����	w3	amh���y��J��~�?��C��{<[w� f�����W�n��W`��rf��~���w_����F�/>�����?��O������lI�:o;켱��w���'@������%~����ߵ��~:��;qv&I|�X�=R������onv�od�vn�����_��W4��    �o����{@ug�o��ُ������YK
?��[}y^"|D���)�Z���;Dh�P-Q���5���	a*�TA�X2���B-=����e��@�-+�x�u�ly�P�,?����]��9���?��K�;��s�^%Q��@m��Ki�ݝ��aZ[ H���}j�^��rr���B���$� v�Q^�Y奞s�3Wz�9"�n�qvN�וF$��K�����[A3~�p|�<�w�f���N�vY���`����hNI����d0rw<��ʌW� L0F�j6�x�T�w��峆dϝ�1�����o���~��w?��j��������w���÷��8�?�
À��U�L�u0C��Pq���Ṇ��	�&%�Ji[MZ������V㋪�zsU!��mT�0�lp %5SA��9m};ti�++�2�c�\sh%�[��iD��Ԧ�)@�s�J�
l̻��zlM�&ɝu�ASEj��ed�V���|�����x�o!�5�)"��O� ��'o]8ں"�.����={x_!�N�o=z(���w��;�uv?'�oEu���]����WBi��5=0~u:z;ԑ����-�G�~�)�>����%B�֒U��Z!�]Yq�͛�����2��C�Z���g�ݮ�(yґ�#̀cґ�*ܸ���x.�P֞H���x2sR<�Y6SR��n����s��CP���.I4^��:����,�eQ'��:��JG�\=��n2͈�\��[���|_]���EI� (V��O'6EZ�� �Vy����H:�E�Q���e��#��#VG�q�^�	q� 7#�K�J��q��S��mҶ�;��'���Xɀ�{��,|	���U�Q��̲[�:�ȇ�:.���Jƽ�g�s��Q1p!�s{D��%p�˦���	&]�]�:���3E�ʅ����g�D����13�oa_�b�����~7w01x�+o���U{7�˭��ۛ�����#N۹�����rpM׾�mnx�ye�쐩Iq5.=<���L�<�F�mk��/i+Z�&5]��[�bQ���ǻp��Q"�ބgg�[n���N,;�o2���ˋ+�3�joAzA���������-��'����&��aF݄�,)#�teqaN��m-t���}��Uꩬ\\�$�����?��	 �� [��ά�1MUC@]��$�^tF�n�h��ӏ.M�ϧ4շ�T�هHS���8���k΄$/���_�EU9�ޱ�z��u6�n����*��%Z���Q�����-UYcȓUWz��V`1��\�`"l"h��F����R�f�������^S1A��$SvfQ��<�a�WI��l'e-�r�Ԓ�U�x������ٙ�I�#��.�=���(6?y��otW1<Pr���e(/3�Y���s�mqCe�/���#:�	��B:��P<靐�"�� ���_߃7������3���^�>��/e�*�@S���s��\�h+T")����΅M�YmtvC�e��yԖ�r�'����Yr����B̓�}��p61�D��
�� �[������W8�
O���N�����Nk�zr�����\�齂��9�����4�'����L��>s��5�H)baK�ۍ/�S~f��ok����Ǘ&:�U{��M f^p	Z5��"dqn?,�rjD|�o�v�)�dy�ć�k��Y#����08��/6������?��/!����r[�(�UW���{3[.	��@�'����a����ko1�q�4��N���|���{F0�@�ͷ/Yˉ��m�C��)W�s�A������I�v�!�J�N[�o�ɽ�dq�a[����(�� v�|u屃�V�U6�V�^UPJC��\dJ@�p�*�)���y�rI���I+;���]e$Ƀ��L�ӹ]Rv�11ʂ�Xv˧W�tz�aO��q�^�*��V�͈��N�
$�}�(ܯ�� ��=7ܻ��	/�&�7"m.�3$D�d`�w}&��wb�-�=�ȇ�{\:���WΈ炟�����1"�Զ�/ Z�N�M�m�����lq|LH����e��Ĳ[�wґ�#�t$�FEm��l3⹴�%��
�jש�Mx�<�dj�����fN�e�^�BL�W��Ƕ�F~df�-�?�ȇ�\:�h��C�5#�K�My�/���]�>m����)���rhr������r":� r@f�P��]g3�?p�П�)���[K��wt�rw�9~��'�5���P-&�j�����16�7��A'$���1J�>�겨)�1��+�x�&ʹ�̵�.3��?uy�>�.�.���VI�,���~�@��fkҲj�b�x�S��i�4C�%t����oU�0Z�	I�z{s��N>���Nq;�ć9�X_C��1j�l�W�����5������e�i�}�W��]S�s�.�"v�EynQ
�Gҙ� *כ� X�.�э�љ��y��������JX��4�Դ����"+f�q������@h��Q�Y��f��>��Kꭻ�O���3��nQ�t��PI#�=p4PC�Np�2(��[� %ěX3s�[Ӓ��1aUګ�A��{/F�`]��n��A�(E��Q�nE;�f8�#�:g��%<G��W஭��u���������p���GH5��׏��‽̮a��A��tϼ�B��ሁ�%p�$x&�<�i�]+s]O�M2y�oQ�G�WF�9�0=[�{�X��;/pQ�g.�Vv�7��қP�U�VF����N��?��Պ.���I���c�oD� !�CT�FC��[��v�d�|K�)��)d�w}}�[���C`��.��,�s�X��q -"%D���[캄���	_�kd�~��t�_aN�
�]]�}1�Fh1��u��JL��-���C��6��D��*���D�L�E��
�k< ��"E��۳�����g�}S$Tl!����GK	�f��'��V��Ơr5Wπ�9�V�����ܾe���zk�8_t���Ѫ0F���P���&7�z	�#2ߗ�J�4��N�o<��ڔ�����]-I8�!"��⢍�zD-��`G���+%{X.o���s��SXDZ��������j�'���+"r5��7C��pP!޴ʉ�bm�']po��L��S��ʍ��2AP����Ɯm����	D#�v��{��,�(Y[��d2ב�vyb��F��|��8Cť'�F�VX�P������Uf�R��$�`[G��N���	���#�7�$PQ�@q9U��B �o��VQ^��s�<Q�<��Bƃ"g��xY�1,ޅ[o F <��\TT�[�&D�v7�:�b�9L���6��=��7��[�[gn�ʸKC��U[�N�N��<�����Pj��Kh7�#��\�X?{><P�� ��^O��CK��aRv]@�x� >��7��ɟ0O��B��t�*.�'޲�v�t��2"i�N�$k7��Z%��C�dl��X_\�
���M�+�&����p�9~�q�,�:�v7�>(Oª"��횠�]����[�*�]�SM�3�ȶ�I�U'l��3!"o���>���-�IOh�;�x�Yr3���1%O�[����(TEi�-�<w�ۓ��q;4)o%K��׆0��XRs��JD���=�6q^z��o�IwpH��Z�k�Ʀk��K�� %$���Įwg�nM6���\r�e��7i�"�L��e\�k�1���������3D\��]�V�^r���#��1���(^�.�%�\���{ߛ;�<�IUٚ�Ӊ%�$�l�d��K�.�R<�DݸȖ��|��&�I�UĒpM���X��^��O��v���[��<r�H��+�=��d��]��s���ay�Ve�c$<A�EV��i�s�YN�JRg�W���[�7^4GhBKn"]�>��"��i �	�NHx��:&;<����m���*����p���dCZf����#bLk]�:f^M"�*E�����૧�z�I\��z<�j��K�&6W��Y�    qS��%��m�\|����P>G�C��XC��c�v�'F�>�z��'��X[e�6�d
����&���O9H��̈���Ȇ�=�ֻX��kt��7A�O#b4z%5�����%ObJM(�*�G��U�T�^9�.�/dlb�f	�����o��J���
�}}�������|��/�d(�{ ��Wr�����e�!��	��S�?��@�م���t���J�&xͬ���­v��U�ov�\�� ��&�pQN�����'xwSG`����!
�
o�s���IV`��B�Ei�oJRQJ>~���$�7>Xւ�?�l�C?��=����#at,��*���0=�!ƨ[U@$�Zɳu��Q;\��íj1&Y%O7�]ꭸ���<�)���D��5$�#'6���C/�xZ������ͱ�L҉v	����e.����e�>fо(�[|*�����Wۋ遇�t���Į��59�3T\R@��2��O		۔�"���B[(e�4�*bCn���7�u����)�į���&���"��k5pc�Tv'M����K뽫��d��Qs�[nyX� ��E�N�\���$�v�����b��p�AOT�@�1	Y
uD��CU�;�D͖;\'��lA_�C�~�f����H9�����˚xS�3	L� <�О�B�-m�;�R�:Bs�I�!#*��t��ݵ�n7m�q�U��^�m��-H�ྈ�8[�5�>���(�-��S����@����"�+ �z{���xB��ҎKig���T�O�����'ϐ�9iS����
܏�I/����m�*.n���TDtr��\��jը~x�<�߾�A�b�`���<�:.��E$�4Ҽ-b�H`�h������Ն�] ����}M@x��ln�DB!�ǅ|��˭F��t�".��xK�d|c086Ͻ�Xd�e��;����)r"�JF`i4��MʧqFn�ʣl�[N3T\l��d�r��1�K9�%��9�����wJ��$\�7��ݱ:�󐑥$n<��DJ\��f�&D\BLA�T��4�D`�!4Ѷ)S���Q�X�����U� @���ZW��',����V��8�}����.��<�nI���ŗ�]����;���G���Μ&���z�\��o
�]H�e� �;|v���2��Γ��%��,ѫ�6�;��Pq�.�f�Ie52��_"A1��[��o"�i����h��W)l�X:h��)���Ĭ���'T\�U��e�maÝ�t�j1Z��[���[[<2�mj�@=\��>K�7%&~
�$��]������pѱEC���TH��DEI=���� �u�5���B��AUo�B\z�q,� �Ux5��1*^�4e*Bk�=����y�W
֩���PqQ&��(D�]��ͼ�ܔ�@�Zv��6��q	�wf���QC�Qk�ބ�}(9�N"��DP\[p	K�I���;٪WL%O��Bj��5C� 8ל�(���!}L������y���ҸȜ�M�޸�I���{>��Q�4 <���Pq�2d�>����h|J<y���zΛ͟P/*�҉�
��zXB�Z7�k*Ǜ�p4=��GRI.��{�*b��DX�"�'�<ѫG�[�3T\�#+�ЀSq_�.(�\hE5cSn[ H�f�R���Z���5`��)E�i������׌�K�NɊ�U��eR��	Oѩ�Ohu�f��PqI���ڬ�փ|׋#� C/��}�;�亄��U�2(|C��`��r��Dl�]U���C�LPq�LUqK�L��	��Վ5�N5��7���(#Oi-��d4��Ht�@�8�|=��;���sY�'T\��1�.�t\VX4��'[x����筇��{�@��[m�,y�L��D�a�R7��SH�O��$�H�PqɎ�vA
�� �$�0�Ǉ�9��н}?�{ 9!�I�5õX:�M�pOZv���WG}ݼ��>M�q���Π[J��߻��2�
��3����]2�k p�p����q�4/�t��B6����;^�]�B��K;��q�s/B��I3K�a�Tg�KLzt\L2+�̥�A�]��u�Qv�r�H����qG��/'���}�TŰ/sE�Y< �$�J���љ�W��S��?�����Ԛ�MJ��<�ią�^N"����D��#%��rFd�K�-\7����d;���,W|��z��Lv��6���[���j��`C�b*R[xf!7��yCDQ@���)����4��!�RZ�2$��<��7ߌ�(6Zxd��K��5, ix��9��R<�i���O��5�hMPq�9���8>8�zk���)#�u9�}��	o�vc���i���⧛S1>�s�XO�xg����d�mR��FS�_�"�M��I�7�'�Rl��p0�9���~�� �j�n:��4�p4�R����Pq�.�������Lܓݷ"���nid�w`
���υ��㋲�Y ��%��d�h����ƭ?g���F����E�K
�~X��r�{�u�~U��u�:[2"��R`��S�7�1{8W�;�ý�*.0P�O-�؄'��(�O4���A{�X�S-������2r��\]�/��<1j��/]�֍T\���lГN _&5�Wr5*e��j�w�x"�6���@������ѽ���M5��O>=1z���8�]3T\J�!!j��%�a�ʩ��z�q�Sx�ܵTrI.�\7���%��M��Sh:��n��q��g��HW�k҈8��V���\�U���wu�D�ͩ&����`	�Q
/�K��	?3�ny�O8M���~�M�1��g�uô'�sԅ�$S�'�C=`�BpA�;a�~o��Ey!#�TDAr1 �ώ�#�Yv�*O*�aU$�� T$'հsČx.� �f���MP�d&Z���-����=���*�x��yf%���z�jޯ��X6��'�(^vٟFC*e�[n��؂���*_�c�o):�H4��.��L��q\'��2O�=��<��#vӑ���_}'�})v�ި���'��~�0�md����S���x�&�޽z�e9#�KI�+��J��ri{��z�Pv�X��n�Ct�IG|Y���[w]J�xz4stf�IM>5��XM�e�^�\�p�r���y�����o�ĭJ�0Jf$t!>Z6&D&<�j�K��I��¾Gl ��N"y�ðcC�b�P�w��s��@Mf�ݲ�蓚|p5�ǥ&�j0�1蚑�ź�8�ua-�X���#c����y�i)t����1*� �:k���dy��e��&tR��&t\jW�)��!��*\�(ƅI�:n���R��!H��D��V*��������h�{��g%�,�&+��{g%=<��$�����˒����gN]����餳wJ���K��G�Va#׭���&��/EE�C�i6��5��"�ۓ:���}��3�\��v\v?�~K�1f/�pj�XDsB�1��2�P��^��΂1�P�K
1)�����׸ʀ��=8�}��,p�������.&�O�^�6	��g�]��
�h{i0�ʼM�yC�ؕ�$����Ԋ��*�1I|f�-L���v
l�һ�w���뾇_��������׿���>�1�ˏ��<���z#�ߞze|�!S��I�qw�N���]��u�G g15 ����u_�יC 9%�Ǩ����^��͓�����tD��\�Mf��d<����;�c3tqi+O��p;! S�i�q�2S���F��S���;�8es���kd��P��pEUD��+�ڞ��.�[��T�?#R���P��uNQT����=�S������(3��� 9f{�l"2&�`ʚ�>���M�U�9�#_:����|�啕�t>�T�6�=�v�g�e�,Ńs<�%c�LPq��+�3p�{|���$���ZE���.��xuQ㖋��lX�u��[��ڼ�	�$e�����b�]�	0V9�-'/c���j��
g[SJBL��n�CX�/z\�7 R��t�yb����c�LPqA    0[�kEؒ����X��������oi����Ғ�	-��\!PnfR7�q�4�	�0���Z3T\ w�&����1�`n���O4��X�1ߴ�q˺]�@_�a��S�ȭP[�3�ny�Ԝ�N?�֩9��S%W�cֆ!㌄.-F�|q<���'�,b4p���l[��ٟ0P5�����G�f" �y.�iv��4���ĝ�䃫�;.5!�"��K>!�K�Vbw�W|Vh�=�R�m&9�<�"�B)n�RQ�D��Q5�Yv�j�Oj������ؕb�q�ӌ�.�Z2�-���h8q����R�DܩfkYڻ�<$�Z����-��� ��律�e5�Yv�j�	�����R�Fx5T�	]l	�tIܣf7�0 ���;����e������"q5���I��ƍ��Aj��(�cf�-��'�o~�j�KM�
�v�$8#�K-V��̵��d�<^RR�)��?:AĿ5/o��OJ�/�c(;Q(e�&3�nWM�<�ɇV������t:�kf$t�3!�o�ȍ�|�"k�����=��｡�=������m�!�����{	� ��߿��5�z0��u��Z�)��w�w���HQ��|`-7-�2;�'g�XP�.�z�l��E��*�Bs^u�������;���ą��z�2�s��������s!U�܃���P !��LI�.RCf���>�V<����>k)�֚}?�=|x=��CRA��B�a�ċ.����V�RJ��#np��T�%�#/RO�
��X^�E�{���6r2ʔޏz�]O=���s�d�tM��/�tܠw���(ϩvM$�sҊ���l�a���N��5���ԥ���g�)sS��5�|Nﮓ7Ok��.�rT��0����l�F�h7����h�H�R@"�l�U7��r��`}&��\��j�d�K�����	D[��\�� ��h��F�i�����o1��R�B"W3Ҟӫ%'-]F����I��l<�5eY�M[JhW�R�,@�i`���Ր�f��c���T�ͳ�7])
ʅ�2r)){�[RA.�(��1%�� ׺k�웴���h|b�-�\�SH��C2���dJs��2C�5#�KwZI���fn��Y��	�E�Ҫ����W�KL�~GH�p�6���	��W	A�_3�X�\W���B�"�U
I��`K��_����w���l���g��;��U�8�j
�S��j(�.�Ԡl>dψ�#����9	��Kc��:��z"H�j˛���5�p�Q�O��.������jw�i�S�'�p�P� �,,�+'����4-�*;��r�
�-��᡽� �Tn��\�v��l����ef���嚒���oﰤ%p~�vR�77g8�(�[.�Y.i1��r6�9���E׺������<��*o�-ɒ�RY��~�����4����Q�-�����F�Ե	�?�<��L?|��������?#r�p-�-���̂�
YUlT��iz@��I��a���%��5���	S9-٥"\�O
�"��h� \�4��	[^���¹8��W߽�3+?ۛ����Ɛ�W��!+�z��0��7@*HPu��7���8=yz�"���g|����IIO�~�K�[~�|��_����������Ψ�������������<|�/��`�<9o�!�����n7���~��gx��{���׫�b�M��+���{4���^�����t����z�Ǉ��o۵�\��?��yzr~�{���|Oe.[~���
�7������k�m*M�-����gvᅏ�y}����?����C���RE>V����yF���lR������K�	�;�-u-_��P�+1s?�y�ٮ�7T``4�Q.�Ĳ[>o�|ͱon���ݤ��:<�5#�KaE�^qwf`��1&�#P����m/R�Y[�A��ᤸqMlMdi"�Y�V�\ؙe��&��M^M��w��U9���Č�.ʤ@f �پ��Bݹ$��Lǭ����}�I�Wj`\�1 Q(]	>&7j�9����Ի�ë�q�n�f���8�?���E�l}�*V�+��<F�d�R��oq�s��'@8�����wSH�uӔƲ���,�e59��}x59�:=�V��顚�H�R{,���Hy��$oD�djQ��}�r�t���!�w�-q#�3�7W��qTY1����t�����^�_�A׌�.<����"�ή=s���\���-�J��.:ˬ����%�d���6�&�nYMN�^M���UǕ�sv�}<#�K�o�x���h�l��X�d[�bnO�7߻ ��g�9�\��J�Ԭ�e��3����T������YI�Q�k��g$tQҹP\�� L�<:�;Ѽ��7�{��y���S��ò+�1�:����Sw��Q.�#r�_C֎��U�^�N�rOY�xZ��U�g���)�j�+�#���y��Z������v�w)T��cͬ3�@�Ut��*�`��UzMj�7C�E�փF����&��D8)xV���[��+�Ϙ�1���AJ����CeP�bp�o��Pe����gfM|�C�Ym�1�~��|�^��gew<z�b�����|�����YA�p�s������#n�ؖ^4����c ?������G�[��?��짹���_�pu�o��[/��%��3 B5+��O,�v-�Q�K��g�0�gm��������7���ŋ����������{��ky��~r��s���5�����<�����G���W?�hoy8cݸ���k���'�#2���/6���pգ$�֕V9kSx�U�r���z��ѰB�br��5�&����Km���|���񼂍x����Z���m���.��<U!��
��x
nƯ��)u��	��l��c�A �@XIKآZ}��,D�v��x����U�n��:��_��\�����@A�������v1��ʯ`������=�+�J�ҥ���}�2 ��5��I��NE�$��3���3�o!��bb�������+� ����W��4����I�zߛ�.w��:|�g�^�D�p}r�̈ܢК�M�up��{!w�26k%uQj˰@�S��0ʎ-!�A$y����n8�wb�-oϜ�(}���j�Dz5���4�	]��7.�O�%�y����{���{2 *r�nxrcjxUߪ�N{��$��hl�Ĳ[V�S��&��F��*wC�ER��Χb��Ɇ�|��)_����\��[℮����)ϝ0�x+Anx�<::�YvI�����:�>:�\-� �/=�����&wu c�S���w:DY�U����h�f�t�չ֤���Ms2��lA;�:�y��jV��0@n�6
Ks���Y�N���7����[1�g��5QODi��cUz��:�C���)~U�����"�OI+����5ޱS����#�;/��Z*xI�0㋉k��%���r%3j�?��)��|���ë:2|F�	���Y�gf��첧f�L�3�FG��O�~M��b�g�;OL/�'N1ۤ����FI�73��J��F 1w�6tw����db�i��ǥ#��t�w|ɨqC��\��Ņ��Jk���R*ZX�UB��lmg
��s��"�o���B�E���L��e�	����q�Z}���Ȅx.<�%�.��|Z�@?Y-j<�oIC��Q�>�h��8���z`��v~xd<�T�%�ج�I �BT���w�׿%蝔��
t��As�d<��	�s��K���	V6�$B%�����s�I��m?7J4CƘUR��^^S2ܧ7J���1pE_&�7v�=�}�<��u�9_�T-�G�����SO�DK�J{�k��]��9��@�Q��'�j�Aj��r�9�HR+�e1��Fy���w�9�v�F.,�����6�TrU���3�N9#����Z_>y���K�?�����������|�w�y�nyG��2qSM7��0��%{���A�řT�W�@�<h9'����M�yWȞ�æ�@v �D��n4*�Yv��?    �/�wg��m9��daNz�����ÉBt�n�Qp�@S/��3ׯ$ո���@.V���M9c��=7��:�^$�!����zi�iO���\���m���(�:��,hſ���ǯ]u@p��J8c�$���x3�J��?����cI��ƛX���춝�x����K�`z`��޼���&dp�%�Zd���EQ�	��T����>�Tr�@1"z�}�W}T/TuI�DD������[=i�; (�{���rk�L�J���.�%���"�hίC �X�p�F�%�0�	|>�7�2F;�w3�[�R� ��K��aI<U�D�{$�6�}�6�(Z`L�%��MUY�� {7��4����=2ǵ{D\��i�:!�WãX���j�r�]��ׁ��~t)� :�i��qqP�(�+�<W���қ��Z�\:b�KG��W暹�7���
ט�&,�<!��p@�2���ռ����sxvt��,��D	�|ſzE�3�NS�?.qǥ#n5.�0�Z3�����Ϣ���0ŋxM���ֳ:
�8�v�!���w?R�~G~df�i�ǥ#��t$�RE�~dF<��K�,�H\�$��(�#C��c:"Q���5|�C��[aS#>��9�⑙e�������ґ�Z��4{F<�AY��ayl�{�� ��BOT���sU� ����g����U*���f���_\:�JG�Z�6���%{#�nR$��*�ED.��P4�6��IB�X��MA�XZV�6%�d��lL,;M���t�����#zu^Y=�Z3�h��5���:���"�HI�uu���[�\�&?�v$o�e�1��`�-v7�6*9.�j����-Unfm!w�u��DjJ	�/���6����}���shR&a����9)�GjUe'��.6٘��g�=��v̱"c��X�WOv�8�?/��v����0~5>����̫/>#0����x䆣�U�Rx 0��c��.و\�
x�F��*BsRh��1]R���ܙ���/�f�ҏ����'�=����L��R}56���7E1"�ꈖ�����n��o;3��d�l�Nߓ�cIi�o{rY��(�4��[��t>qD�v�0 ܐ���AHt�@�[9`yS�Tsa,�#�`եL���쨜jf��&n����{ǐ���#JܐT\T��\|%mJ"���<C�[D>�X���e_.hJ� %�m��)q�]I �<
~�cjf�i���W]�5��*�a��x.��jh����p�w�.��'�.����cş+�M�������t�݅8�4��4���ґ�+�v�ތ+g�sq� �e��2�S��]�Ǿ�T�Z�5#���g�$VBdU�J&[�,;_��T��
�_��Ln�̈��#j	 fq߮*P��p=�g�c��#Ԋ��U!c��������9��Œ̨Tgf�i��ǥ#Ǖ<i� lり�\@m%z��m�7�3ʡ#r�����$�1�v0�� 9)���{G����
4����̲�إ�KG�)y�>�r��rܭtB<y�*�0s��e_B/��X��Tݷ��5�n')��M�ȵ�NX�X���6'3�N3�>.9��I�c�ǋ�wg�s�=7��%��t'��A�j�lk5n~$4�q�S�qO� �*2*k�䭏�g��.}\:rLɓ�Z��΍�~'�s�	w�Б�z�S���wq��X�7��g�E��X)J�%�(b�$��ZUΛ��I��N]�?.9��I�]`��Ȍt.��C6�k�IȎ�G`w�ɞ��s��،�T�t��"%_��gm��l�'�3+��D�g|�նp�"tr�H*�IE��ݟZ��5��)'
"���uV�T��]��o���3+���������k�y8D0Vv㱩B�M.�.}�J��%��@�Յ�M��b�Sk�~tc�<I�D�I_�~Q��	�]�+�v
���I���lǑ@߼�$�h�Z������ۇ�J��#�g�V�5lfDh� engh�[j��'�JM)<]��2�UO�#�V��n�"���:���I�Xy���� �gg��?񣇼^i&��Y���C)�x�ȯEh�V���O�\��fY���4wG���Q�[�ث���3�S!x� Y$c���;I.��o���|8q��:�bR��1�b���R� n�bg��l��*~����R����Ƀ�/j��ʨ�̛��RJN�f���[-7��9��*��ｙ�qA�p�����WQ�@l�LJ�\�*����"�f.�[Y�Mp�������VKd�0Gc�r��܁~`V��aQ�R���YH�l3����?��q厾o;��f�z�U����υ�p#��G�����X|���^q���z��+���]������ŭYu�~���k릮�z��-rK��Uz���Ez�'��O~y��7�~�y/no}���MB~����˳�/7�37�b���>����煗?|�/���`�<9o�!s��������tޞ�^��o�?_����W����Y��?I�ߙ�~|����ׄ�KV���?=OO�/}￞��|��'��3���~{��vW�5i>��q³移�}���绲�_�f�b�)�jOf��tF��f+F[(�e+���㺽ds)Z�}c������
���\1�h �̲ӈ��kO�U��VG��a�̌x.$`��ؚ�C Nk%�_�ۑU�=+��N�2�v܊� �� K2%���1�̲���BmW]�4���5�7*��4�^W�pj�zG�X���t�ڲ�Q�������	�\
��D�3�=�dd���(�6#�^�S�M�����G� ����q��>P��e��"�@��Q��>.�+��F/3¹�`�K�!0\k��8�|�M)S(���H%#�HzFd�!��DԹ��PCn^vr"�����}�4N�Z���u��&:��*6*��9�pJ�g2N�\��\G�v,�ʠsȚ �|D0 W7��[��
ţ.�p>�u,d6�j�nr��sb�i����!�Rz��Ȍt.�R+�ڭh�&�2N6��o��m�l𩗦��_Aa���JX�Ŗ��L�ʨg��&�}T*r\8K����Ќp.���C�=�/��mD�{���KD���>�0i�^�JX"�K��y属K|D�����_�xlԜp��H2�	Z2b���S��x�x��O�u��Vm�x��L�)����:0p� T�7���F�p�8O�<����̫���_���e����9�- ��+�M���k.��KXj�Ӆ��bK�:Qg��+8�*Z�"�e����Xy��˳f�����1��2,�������T�9��~��\����YS���ۙ@��q�kA\HcgX0-�lκ*+����C3W� �C���[��K�~�KI�������&� 6Y�U�e�^����Pm�2'	�<	`�n��zx`邒J�V�[	B\�c�"D�R�ĕ3 >u�L��_xgV���0����s;���|����L��-����8t���G�H~�e��+k6�:��!e@�q�"��*�]�F���<9�F�&#�M�3��(�,;�vR+	�@$���k�h��l��u��������w�Ѳ�$�E��.6Ä�2����o�^��u�\$⎥�y�H�ܰ�X,�2,�C��#���d�#�dh��Cq��j��<5$y�Wڙ��EQ����뵣�.K�̕na���\����V�ekkE��w.<�F�"M�Z��>��5Z"�q���-�dM��Hs�j��\uA4V���)�{���͵~���{�t��:�20�lx�;�]��|���2Gg�v�u����~����6����/���h�_<�?���w_����b����>����O~~r��>NO_��ϯ��]��������_|���WnU~�+_n�7w�7>�}o�����x�vYq��������y�1=w�7l��[?|��?�(0����)�����Əz8�P�>��*�V�x�p�T>�]KT��D���U�M�HI"��m+*    �G�Ն*���B�5���Ů�=B�pMנ�e�S��e��j�)�q.Ìt.�֐���a��Ll�t�[�VR�Pw�+x���=KǕ����2y*�Q�fSrb� �Ob��[ul�8*B�W�k�x�}B��s�9�G=lk Ln�;
 ŀ��BuJk��kA�5`4� �9@O`؜
���Mɉ�'y>�<�W��>�dX�&7��Z����VE7\tc�oYt�\�<4��Ey.M�]�3�����U<�Nڒ���W�������#�gn�'���y��xl�̓pT4N���Ż`��J�`�q�'?aaL\T�<Q���r���Ve��R��s���UQ��km��M��+\ٓ����M�{o�O*�P����Ը��$*R��d���&�O8���;�<	�U+�&H�Ԩ����L�I�X�(�U`�ے�R"uTB�+&-x����h5���̲#�?����;��ݥ	��׌X,��҈G{�ɦ��y��T�b�]M��M| sr�?M-�*o��IgV��I?�jR��4!�\[�b����;�M�.˞�&��w�5í�A^:�*��Mŗ �����kuqݦ�N6z�T "n,c�).�p�m�v�Td�Jo���)�Gp*6����q�<A��鬀w�<�I�p�L���}�x�t�2���ٕ���Qh%�$!|5P���̕n�ϯ���lֱ]@D���*��ZGa�z�5���f���e·�-�j�9&"�{������Ro�β5��l��3I 
e�O�F��W���kf�'r���t���~=���/��Ԫa��0=��g��z�8�4�gկ����C2"��7Y�O{`���s�1�3�m�ۃ��狵)r�ZdZͽI�%�w]�2��[F|���6�Zehk��!#��62�ؚ��sW�^[��+����kK�R1=l�SR��[�+w~�*�\�a ����|$-�s��8����,��U�?O���U�J�<�� zm��M��̚��n)8./m�K{c�TY씻�0�d�[�2�?��fj�P���`b)��l#d��<!G�.fDw	V�C�f`?Yj�.y�ht��i�IO̥���Q��%ʦ�\g��x̍�2y�� CrZ��1�!�̖do�X�;����K��m�@'�LS�18�F��1ߗ,�r�'�����K�����ӛ���6��6�ޗ�<���i}~C��^{���0As�[��o2Z���Q9㦣9�ws{���^�;�v$�E������a�HmD��cCf��Ӑ���5�5d�y?�+�cEvx����-ט��e�ȇ]��3&��{�-���0a)MXI���)�J>9�+�݃���;?�s�/�\9�����?~���+k�O��S><ZA�֚��xY�p=�û�r�E&qlݴ;]�H�
�Sid�д={a�����v�j?|�	�+�p�~i?�+�~:N�X��6��1 \�ׂr��lf�9�nG\����	{����oxt�Pw}�ǫ"e���$V�p�&��cqa|�������|!"�K�Z:<fY���i,~�l&E�w�IZ�G��.�_�o޵����Ӝ�� pig�¤�	��$M����o���C����\���������g����,17#Z��-�`�i3����s��2�B��v��-��a}��wK$�0�l�i]r���J���>�����Ӌ �W��Z���W`�U)M��B"D%�Tʾk����ӌ.\�cy����� �Z��Z�^ &+9x6�#����Nl�6_*�*+6�|xpn� �MmoM00��S�\L��Z ��b��{O���`�L� kYL�<���oԏc/+w~0�RjK6z|��!}�D�Ч!m!B%���{�ǈ�LX��� ة����.�������hC�Oq�^Qޓ�.� yW�0A|�FE�T+�i\�qN\����ɶX�d�%�6c?J��l�'�Yz�����_���?����po���u���B�4Ͱ��K�W`��X�̦�	�75�-�	�Õ.Q��\E�ߥXa�iO��7�iB�@�>t^;�]yғݵ��ݟ��y�x��l����܈i6L�rv�LX�;���߱?���f��g��w�V!X�<�l�}��-2�!��y������xşW�٣D;��>ޣ+�a����k�%�Zs�M%��H�]���8j6�zM����)��[�c�cgc����+r6�X<>�Aoz����x��V���R�����t��a���f4S�p\;��C#�x��bf8kʘ�׌�ޱ�H����'��N�(�RY�s�s�31ϕ��<��x^���5��ĨE��
$һ��D)����ss*�_5�b��U��g�,��u8�!��B�G%�f༟��E����!�㚺�ݰMo{j�4�
yV��+XB�T	��.o%)L��hM��-T�<T{�k���(��A���I��KNR��I
��疤@���dw��� �m�G��X��
��15�s7��l=M7V��kH {,�ɡܚ��0J���a�	�\ʲ�� 5o�C���yr�(i?5c�fy(������%8{x��25���|�aE������І�-�:��+@3�4����@I��H�9����u[y�Ѻ�_�nE| ��p֓Wrt��	Q�l�r��usϽn0�a�'�L��{!X��0�8L�QYi� ���t�3d����$�ؾkZu�[*�jy�{xwP�p�g�7�܃��'����KP����%��d���
����0r��k�2�5r9�@Y<�p�u8�� �^�U����o)
��֡�������\;��G���|~){���d�O�6����h�hl5��M�ZK#��s��4{�3���.Ѱ��:�0�}�X歇�7��*5�7O��K����f�h9!��K��h�$̨����~��X���M�1	����s��>/��)Dz��ו4ׇ?�R%m2��s�y�+��Q�I�9츁��f2E�vK� ��^����ѓ0x<%���n�@�qk��,��vR]������B�k�9?EHU^Y���=�- yS!\�Ucԝע�yi�kc�Q���G��gΑ�!k�T�5��1��#������ʓ�蹵���T��ag�����L��O��f�r��ݐH�������z��#֏��.d�vFh�|���EQ2K����|���8��E��|!����y��=;�x�s�l�������+��$�����+��9�S�4|��]��%dR��,�8�*�ALu����7�2c�W��|����on��
C���2yV0�aNb��1�i/��^C���`��D��833<poF���6��f�t�n�� z����^����O?�౼�ү>+@3�Pޝ �Ks0�Qή
���/T*͔1�(�i ���m�@���̜�kڂ7�Trx�1��lz�y�	w���������_����ۋ�������6V��=9;�p������aah�	���%�71����G�Z��Ah�=zM=�-��ƞKQ.�N��ּ���u��,.��5�?wG^�"6D�7|[m� ��k�=��#��<�K���j�����n��w�H�vV�v�=�(f�Ƌ�G�?�b­�?��N�D���~�/������҅�g�C�n)@ݠ7j�攬^�жƭD�G�4��vl�9C2��=WVv�к�c]�e�������?�����?c�ҹ������݆���,��g�'���H��jF�ٲ�@��+,=à0Ȇy�̭����;_��.��g}�]�s�Ŋ&�Nm��!���[�6�i��gm�������~������T�t �d�ax�&m��J����C����*�9��mX�1*L�ش��Xn$���
S)C�%�M�<	��g���p�)z��ଯԽ|a��d�sα�=s�p�CWfe�d��X{]h��g+kI��J�%�)o�0�R����֣�f!��ws�P����y�|E�#�v��eW{h2#��{�ݪߤl���xĻ��J6��4�$o5���Ū�z<22>�Y�!��æ�)q�a�v�q�Jf�l4'H�>F\l��'�#k;    �9��u�=[�Bna�6�����&���#X�S�kyB��s��[XtU���] �f�(�UX�/�|����x���>�<J�^�x{�y�=f�o+�aːg0��"RޣR�j�"�����y�>�l��ͤYP�9����)dc�Z��x��w���8!��}����o�g�r`[x�|��@h��;�h<42�#��j953��0��`�9i��A��Ͻ�A�x1���cOڻ��y���OG�R1?�柁gg5��3³��=�(�ІZ��f{Ɏ,̞����K0�:�
A��>����{#�	��푴����6����|4}�w����Y�߮~�z�-1󡣲�[�F}M��<6b�K��4%m�@V>�V�S��Za٫�'k+Rf*�<�X�����+������kRư�h]8�.|�&9	?uY����0<}��M`�\�'5�CR�̐c���Ԃ�̀�B�+�}&B�˭g�;!z!�;�S�<�=��\���Ch��n2'\{0C5	�z���oy�2��ΐ6�Ӕ��?$<8a�s:�z�����>�MP�b�tl�-|��5��M�]x��g��Z8�M�T���2��'=�,���ʄ/����gH�+
�����3�f5/c5�]X�{^w��4/R���W3����$o�0~(�z�$�^����	�di���C���u�z�F	)g�ʽm6��J]��<�)���N�(]:g�qgr�juG,�L���!�J�ڳ.sܣ@�G�����t��h3V�t�
#��\���y7@�櫞����GɀS5�����1	.�{"�+��U�l"����w���}o}�'��U�5�s�)nԕ=�[��+�"+?��	��Z7�b�w�i�غ�)�KW�W3u�MJF�VZ�=u���c�>.[87�˔���F�����64��V�ĦG�1����Q�^�_-���ݽ��*C˒+F����L���He�\���(^��;?�P×/��$=����Oʹ��ŋe����W���hj���p1����r2���S{�e�]c�#i:V�F�0;M�~�;�9�.^y�}��"��ӭ���bvK�����mLA�2|r�߉���"���\b��d�̒�3‰��raӲs�愭5b�+�}&�k�U�ӟ~�A�|�B�+����c��˭�c��9bF#9��K�#�L����0c�����o3e<k*hH�@�7�\J�	���ª��a��`�cW
&����KqZS�X�6mSJ=_rПD�[
+w~&�s�4O�Id������%`�H��x�h�r�?����_��������;�[��}G<g�8�+ǻe	��?]���a�B50s���Bu�4h2�����D!a�Ij'���j��i�h��>h۳r�������d��$�xqb�� ���9Wќ�O���LN9��\�$o�J䙂a�X�~(핚�~���c�!�q$��0��tBA�A������ޮ_z��������|I�T�\:�}ɐ��χ�J+�(��5͎�FQR���s�i'wK,Y���C�N�0���G씪��42�\K�=�י\y�=	������WW�z�:�!�b��[��-^%o%���dv��.�7�j��D80θ$J�|���7E�ۘ��7�r�g"B�o2��|�� ���3���3�xl�#k�GS��_i����7��ԯ�d��*�̢9�.�>;�d�4+$~�]����aJ�p��/�Uz���]��c���l��6d�4H��@�A5k.m���t��ޙ������!LX����>��8w��y��/�էg�/�� �8��0���r��L�^k��Ӆ�Cf�͐f/%9�T#a�-Fx�!�j��Pҕ	��H(~��.��h(~~��EE��Ɇ㤜�ނ�#p�5�i`lC�>��x\r�a��ҥ�sΩ5Z�����k\%{W�]l���"�4���W^U|�M��n��->a��g@��ȕ�b��z۹�pBel�ϑ�ָʾ�����#���w~&���t��%�ӯsu����ܫ�١(���@h랸wmp*�6ٰ�����<KT�-̧Y��Bi<4�w�$iz0�?X۲�_XۂY�z���{�ʑx\��m[���J�����Q�X�A2(����,�l3�܍C����a'P0��6��G�ӿ�_8������?��k[g���e�����g|�OX��4@E�������N΅=�UqU�"����9�y,U�#�v�������/�!��q����RG����xr��q]�Ȗ`'�?��Z��!��0���9�Я����L#��D%n�M��9z������?�����~�[C����w^�l�V�jd��8ke��T�ϟ��ՉR�dS�TH{H,������7iRk�U|$�5c�U����,0�Z~;o��E|'��߾�?�뿖���]	.���o���[������G�����[��e���O?=��͢�+�&9�=^��C�d�s���6�Ўs��fU���)j�F7�Y�z�"�p��o��f+�]} _���H������+��ǿ�_���!_��ш	|=��ݟ~����Ƴ���W.��ݱ���X������"B|�� �r�#j�8��iQ
��:-Oj��㯥�����A3�;?�BPG�W��Y�`�A��f���smBg
�?F
A��zT	1Uk����0E!�I!p���ĩ��I��a|&8e>�⠂�0�z�=�8��i�nm�&H�ğ�-��o�bR��H���u|�r�����ُ�����
��qbIKD�ϸ�Av�$Sw����bhM<�[k���1g3,ј����p(�����O=p��p\���)V:��+w���+���"����7�]x=�D�`��n�6���3�����S>t�W�����-8gk'^Vo�4yj.�ͱ�����`�P#r�#�"����vR�>��Ε'=�.���i>���J$a/��SҢ���dg�LAC�Y��w:�Vԯ�Ԇ��s�G�Yf����Cٹ2w[Op$�f*Նzރ�Y=/�/�ky����`���r�ڋ�̐��{�bo���[�.����U8~�B}�q�y�Jc�B���a��Sv�c�NvL��P��_
, ��Ʈ���i�#����G���M;>��{� l`U�|�jդ�*�T J�a�|Hɛa״��LJ�2���EZ�^���{�����Dv�ꛅmi��`%u5P����3�u|�3���`<��+s�9� ��=�yV�Q8�N��H����[�!c��
� ���q�w�����+Oz��^�Ű�q��){32C�2�X�
g����>�2�KQ����̼���F�p�]1��96,s���Q��Y�M��ϔ�;��p:�,й���Wo��e��XE��y�_���sFHkz�Q�r=S�0�&vM����>���jw2,���$o�x�-τ��R�6�f�Y��χ.�$���l��[��j���U"�F��5ٹ�'�s�4s��r3�&JP\�	�R���� _��tq��'����m���z�J>d�yA���T<J~��`SKh}֠^�om�V5q�	[B,����y>�"���B��B��l�G���!��dujax˸(T6��G�`8��CW���v��%�Vi&F�����8�d�!�0�/�~~[�{���5��yցbP{�h���T|�r���:���DV[]�5C��(RT�l-�1����L����gV����VSa�.xg�.|����	~�=V �[F�1�j���(��K�9��(���w*�\�ly�V�[c�Qs�RQ���d�0�4�M�5ց�A��Y'~rME�'h����zVW��6�fՄ�ɾP*�}�T���(�?�4\��-E3����!�=D��	I5l���9�%·�Z���ez:E�\��;�O�=ΛX��.ob9O�Z���O����'��7�{����ʌl��SR�y��GZ�	[��/@~��ޘ���s�Ii&�z��������}R����y� b.<�ISM�<    �ɗ�$�=����ze�p��aP{��%bh[U.-���~a�� f��Y&S�O�IF2�*S�V�@m8�zr�"�����0g�IO�)�A%kʭP<����j�A����9��)�V2$�ȇ�se�� �7��Tsj
510Uo��]ǛD4�WH�d��
/LneM0���[�>�� m��Sv~E��b��w�&Y��7`3�l��F�d�y�6���$o>�*���G�-S}�C-�i�R~H(|mi�2V��M���[�J�e�ʓ���Vi��߂#�2�T�H.5ụ��tR��9�1��c�sa�������_hJ7������M2E����L���S}��S�"z���I�ʝg2�W$;��V�-���Y�����OT㜹M�O���	6%��T�+H��`¿z��ivJ[�l&�$�ch<��ۮ��q`C*y�F�r4�G��ͯ&��<��)�+e��ň�V�C!be7�euZ������V�n����i��e���1���bh=<T�)�3��kE�wCLQ��
��:<x�@p�IO�9s��`��W��2쿪l��C�X�ڟv���=a��]��n��-v�rO�bmuMfFW����;��OJ���MK��i�(��if�@�XE��y�_�����P�7'�)"�|���%׬k���%S�]v�aPzɛv���a��Qj�n\��.�X�����=� b�����װE�S}�<5�BY��+Oz";��#t��DKʙ �)�(�1Ci�I�p��Ɏ�\V�n#H���X\K�s4��z�l9�p�����t�Y#�NY��^�M��}���fx��Sv~E����`�93���@�э�8f_�3>��v���f� yӃ;��y�`d�q�@S�J�-"�9]��M��n�6!�2�9&�Y�8_���Pz	��k˚}nJ�T,�Q���68"9X�ԕY+wQS��P��r���h�ؑ�8���i��� �	�<L�8��1+���1ް���;;&�ݱ8Y��-X�tx�Z5��*C�����c�dkH�*y�,rR5L#D�W���	g��D�|�L8�u�/?��p�R��D��&��8]��&M	)���\�����l�!Q�/c�6ۮ��!d�, ��S9)�)���J�G��n;q��8�1�հ�T�ڊ=���@dsp��Y��bjJ*�� g7@�*OY��Z�EC��F)n>�:�2:�Ӆ�N��N�����O?��zK/(N�������l3���Q�Z��)��ୣh6������>�����G	�M����$� �+��0�$0}9i���Rf���,�$��l�0��kR�`CB�o-uċ��<(��;���@�B�bL�r~�?���m'L_���k���n'J��+Ȁ�ʞ��f�&�3�)`k)�ɣѷ������[���g7��ll���fɞ��ҕ�Nx�<����;�O?��@c����̠�2��3g�F+⯽Bo������Ȣ3E١瀩�J��υ�N|�,>_P�������hl̹�f���ś�j6U����l�ھ*��-cDryd׊���.���0\ە~�>kw��/��_�qg�l:��+�� �Ή4QF+��&��5Je?���7 m4����Z[��?�1�X��ּ������C�y��^?�+݂��t�q�ۇ�w^����ŗM^�HvTB[bʅ��غ
,�|Muj)��S��)�x�����y���=�ٖʩ����x�&w�q�E�e(�s�r�c��?&F�sOa��i`dӫs)�K=��Kk�Y�#��;?��k�j�3�X�J�썭3������Ā�� �uP��r����5�F�&� #��K�T�nPV��Ce���m2�Jʎ�Ҵ(X��ZR�sև�Òc��&f\vm�#�9L�����������'IU���d�VY��X�I-�C�Nz�/��Ϳ�qW�,�έ��\kf(kQ\��T.��Ysm^s�.a��M~��љ�ę�%qՅ�ƣ:���-+��N�x-K�^���}b�{SY:�K�K���Z��Ah��o��P���~�t4�K��c5׊��]^/xgZ�6�'����C��qXX�>CR4S��5�f���ې�&Y5�vN!��z��e�:溥CV�TJ0.�_f����$�x��e���)��,<�l�c�K�}��������;6��Y����gί�X$鸟���mY8uoi}�h��p��0#���d�&T�m"T���BL	d �)@p��u�	V�R�4.��
p��m�W!�B:;����o�Uz~�I���&�^�]�o��z�u�Iס��s�%�W���X�/�B3?s��|� i-M���a�re�7�O҂���sE�}v�@�=��f+~�霻.��z�j�E;X&,�"w���.kNƗ`���[ȱ|Xn�2w�GC��*��G�r1�v<XK8����s�BT2-m���C-g��
���܃�+w���_��7���d
_�I���bc$WgY�=�'�9�;q&9��XA�6���]EY��	���P+��)=���l$��P�S��n�E��YZl�kiV�������j~pRgV�����)����_�����؅�W�n����N�eB{DL��Æ��\<�7��34I�i`C�ڒv�h��VkNn��z,;W��p�l�씝��3��U�%mY�T�q�٬�n���1�b����ˡo�����>��!��UM���*k~�)�f���^�;�� 
.P�A�<����S/<�i�����h�G�~�
��U(�IJ�)d��K����z:n��2w�H�c�x��/�#�Y\(Zr���>AI��c�t�F�_�j`�Y�6@���<iN�"�9�o68m���E�Ss��l��d˟Lv�s�)�- Y��@L栞<��(|��:9Q��Pv�d�Ҋ�O	t7�5��-���=�f�3<>���������X�x�V�%2Q:��lN�	�3��v'��1���m<f���u=YҮj��i���@�7f�������5��S�M�A������}@�p�):�&љR�-w��*��F��˥+��Z��>�^T�J������$o���f��j¦�R�ٍ���`�>��d�bvC�R�A6c�e;�=�"C�ʓ��;[���+�*?}-�TW���؇>�����/�v糷�-c�n+�Ρ����T�F�@?�x������kJ�^��IIü)~:3l�朐����b��3���N08
�5 ��a�N̞�����'�ʻ��S�V��I�d��ԫw�.��K6L�ryh:��BlNy��R�Ψ}d�r�)U	]��ٹ�Y.�Sŗ>S0���N�B�"-AG|���ݹ��Q���m]�wX�ׄ��&��-�L�z�������J�L��)o�0P�+|@I,�ʏ�9�\�s��3Y/�����!�XH�y�E������3��/�Q�;�m5V���Ҍ@-I��7m�b���Ie�������|�^�CM��X�>�?������NYq��������������չ��z/�&@3�EƤ��]���V����5ɷ^v�	��w �{P~��s�Hm�G�5k��Y A�ه��5��2�[�lgߚ7����P�ȀQ1�Y�-Kt'@O��4�I2�c� ��_:��ٴ�HɾK+�����rh.��iBׯ�]�L�53T���^N�� �hڭ6ƗV �����/~7xy�1?Vf,e�ה���5��e�oC;3�xvR8h���'@� �w&~����-�b�K2S��xi�P�Qӭ�:��M�FxX̡h�|E�� � ���'@O��Tv�8�gR[�"�H��4���;-V�<	���#t7�����wH�Q��V-��ѶS�� �(�=b|�L�ڢt\&�H�V�a�	_���b�_M�ᜃ=Z����s����JHU�������P�3���c ��n��}�
��x�\��r�7qޗ��y��v����4����TG���3�t��n����!�
��� +{��q�C�ꍴ�I�ZU΍g���(V�V�����d�ixc�L#�V���'    @� �w9񱓴 ���̾�d����'I@��0Z�7	7���j�s���L����k�J����	�;��Ks�$��ں�t!�����+@�S���K�6^y$�d���y��h�{��]�>�N�� �h�#��1��
���'S6/4�ks.@Ӹ����ĸ�ی	5�H��p�D�1��0A��j1���aa��;��?�����N����?��{ee1,�|��g�9in�l�S�!	f�"T�t �Uh��ʔ���l�@֐���멯Nqp/Ҟ� "Ǖ��Ԧ���k��r�z!eΗ�"6I/��+�.��}7�b�3���03XBȔ�f8SsN��Tv�!B�z+��d̀o� �F���A��7�s�����v�J=iU)�n:]�3�������䔠'@� ���B��V ��9���?{�+��T?<���P+pX����9<�)9S랭�n:z��Z@���U��6�9��U���y��bx�����%�a(_A���dw᥵c��<X>zPޓu>�LV �u˳�<��5?g8̊:PQ�	8��5@ES�R2��r5�y��I-�O�� ����J��c�Hm$��8����"a��Ѹ��Q��	ƞ��	v*7[��-�!K0��b��1�t��@�vV�ǔ�+��r�{o���/�_�zcK�эQ^;�=�oL�ϔ_�B0�N)�f���O��qw�q�Hm�M�I���5��X��CZ��R��rֶ�S4����H�!�3w��=@�<�tR<����ۦ�.�\�j�$��Xo�c=H�ɔʤ4�C��I����6�g��	�{��=y�N��6�r�^O�2lT�+k�e}��PG^+���we�j��}#�џ*��=@e��I��L���,��A�jm�Ϣ��bM�)G�8q�&4`�B+j+D������aR�3����h�q�� ������C�.@j�=z7`��ֳH���֗XR�W͍�G����R�
k�E�Yj�S��	�;���R�����B򓪒
�vO#�G."dj��Yݭ'�z&�֓��h���2���#��t���_������~���f����qȫ@�vӲ�9�+���(hb�h	�-ۊmX���f��lsנ_�_��][�b�b�!�8c@��PN�rʕ;��ve�r�)��"�/7���������b6��]�I:�H��`��ꕓ�!V��1}���	�;���ǅ{+�ڴ�d-xf��>HX��`���9��U�����o������4%�����(�,=��a�#�𹂨�NWS2�j��[F&^iR�T&f��B�H3Z {�@�0�x����������L;ی��Ðڲ+5k��ʜ�������̜�t�^=��%O��H�F�J�V}����4{u������ ͻv�:vmW �q	X�4��Yp�JW�]|6��)��T�t���)M�rRh3�D6$�����	�{����|�#�@j�nF�N	]IβR���t�M\�7�}tY{�u�_��p�R�v�t�O��4�=;
��P+��j����X=$-�xoo�e���VW��d]Q�e��N��%Sc�3�=N��� �����Hm�(x%���)>�18�L���V�F�[�AZcC�"鳶iT��1���'�yrG� ��۵�a�iQ[!�r�v��k�X-,ɸTkH-�oA&���F#��0XS�6Q�חf'�Q��������a��
�6j�2i�ɩ�O� `a��;�G�7I�Z߸��01(Ŝ�r�;���'@�v�8����V �5�pg�zt�xN�`pe�ַ�19{�,�k�����^�5�n�Ǔ���3L��q�);{]��j����p���f��l�	%f.��M�&�W��f4m�]�����!4"������]��T��6���ͱW �8#97\�9w�n��_EK"��:M��8n3��sr�R�>N��O�����O�}o�s%�������aR�6 ���=+Ӽ�kӑ�,Z?���\#��=%L�筵AK-�gS�D-�Y��a#��r�ʞR�^���<W�@j��e��d�_��g�fl�J\�w-���|i5���z@����Y
��~��; %m�,���HA�i�4A����AC��I�׬�+7RD��C��\Z1�nrkF��M�	��'@� J{"Ǭ�+�ڜ��~�^��4��hRMS�0�n4�ꉛ�5S��Bm�98����ӿ�� �]���C/�ڸ$���ĶY߫�0.3�L�8��o�Ӂ��ڬZ����ΰ|Y��'��	�' �;9
Ǉ+��
APF�f��X�)Nc��S�-��(["6��6��g��gxL�b;�y���awN��:uR[Ͷ2�j��\d��	(��S�`&\�S�9�K���LW�!gc���ߓb�	i���5.k@JUJ��l�zjB)�N�|�?��j���- fs�0��)A��(�d�fؙ�ms=���5��յq�#Vv&q5��<O^�S@��3�)�(�|R[�^�Ҝ��|R�Vӫ�Ҹ��P�Tg7�c	}+�H�_�����gz�	�{��]"Ew��W ��VZH^�̝hW%B�J������-3�{�y%���tMJ5���N�� }�dw���c�@j��8w-P��W��a1kc��ܢ�꾏d���`@��c��y���$�r� �(�x��(�
�6�Υ��6�Bme$fA���Bw# �%�0
����C�52�`����42˙`v����ہ�y�HmaV
d��y�L�A�T�s��
S���S3F��4"N\�H��E;m��餐:zP�'���JRی�٢�/U�SE�c.�.��%GB,�wąXlS�~h�p�j��������������L�;??��rw�SZO+�A�oe�7����Ä���E)�dM��^f�D7�\D��1�+�5QkJ�)N%Y9%�)Q�%Jح��S#V ���cj
�@� KrӐ��� ������F���+(Oc{n�'��g��	�{�Ɲ��m8�!��Y{�;H��k7���шA��f��]R
��b��*֔��׌��хT*���jO��4�^tR�t��'�A]_� �bb�9��3�n 2�V����-]���4����r����=�?�`����<�\x�<�-8�Z��*�P{-A}o��������W�<fѦΰ�	�' �=���a�Hm�QD�����~������` �� J����NI;#jM�kB�C=[l� �(Ӯ=��a��
��`���(��i���H�a&e��d�L�j��g���r����~ �l��'@� �;GG�؋_�Ԗ�U���ί~(<|\�F��|K���Nܡ[e��h�C[��i,�2w� �z�v�b8>�[@�6� R�g )�5E�9J9�ʘ���g��0Op�汖fR��u'g����'��; �V ��Z==����5��U�z����]��0i�yM4/0
(8\0f)������� {N��7+�چ�֎fM��I��h�ĵ�v���E��RI�8?Ԋ��/2��(�;͓}���=>�N���� j�>��}�*kw���u����;́>9S��M����fO�)]�����Ӊ�{|��i��� ��6�L���I�$��i��Zm˷��2k�6��R ����^��g��8��N��T�@�ҡ��mFK3r1�*w�LY��1a5��%���&����B;��eJ���/�|�ٸy�yų%��W���1���<o�m�R��KJ>��f5�b�qX�U���g66NXyCw_V�npp��p6�<�ʽXqvO��uvR��!@T/j&�`���������*-J��\ˆ�]<�`�30��t5��tV�� �(����ÿHm�lx��fEq���,c��B�%o�5@��s���� �Χ���Џ!?Li=�������â�Hm5�o]�)+Ô���괈ef�ݿ�Z)��iԩ~��3����}jp?�8�VN����֤?��� ��9�Ւm��ɩF��J���R)p    D�h�	�@�q�|PqTL��'@�v�l��U���L��K���,�3j%�D��{(�c/���MM��`�i%��/<�����=@㞒}P���JH�jѴ8 T򄡊5��:[>�Xo m�V�D��ØM>;��\*��)AO��4�V|����ڸ�J�Uc�6����5ؠ6z[�y+L-��@Qt�>?�/C��q��	��Y��	@eg�atQ[�kC��.�U�jx�H)�[Tf��r) 2"$�*�&���'yω�;|z���N�0bR�TI	��*eI�ɞ�%�׊��kt��.���tE�y��~8�;6A(=e{�AO�����Dm����L&���I��͛(�YF��oh������LUk�Nڛ�h3���t����g����+����A*�U������o�VF�A,���ԩ��Y�pf,au~���0�3A�����&NtdZ��6�>Cx������H)@�N�"O�W�X���.�/�jN��K�Xzϭ��)����=@��V@� js�Q�������&�R�I(95[¸��X�YL^v�,T�����	�U��Kz��飧�����s��p�9Y9tV�y#��X#��͚PX1��" xj��p*m��ˆ���¦�^��	Q#K9�O�r/T��s�p\��&� O qF��8]�j�l(�,�F��,܈	A4�a:N�����ؾ=�y9Ͳ�� M;�!�r�Hmq8��Ȅ1�E$m��FS�M�P��j��M���:�h/������'@� 4�F����Hm���Ą˵ya�x9�?3v�?����lf+];�%XU!%_��:{9#/'@� �N��qS�Hms�XjofF���K�D>�mfFq9{��R�X$1.��1F7�H��I:z���;vǴ�+��fu��P#V�i�/>ʄP��i\zŧ��v�F{o6����t����7'>O|����}��� �-�)0��E��^��MC3K�~0ukz>�V������Z�E٤%���pgv�	�{��=y�$������ï]*�`x�g�2۬!�[��V�厅�S.��:X�n�X��9���'@��w	D��+���f�v+LJ��	��B����8�-x]�ˬ�o���]�}��~H!�L��	��� �;E�� ����3�Y��5Ü�6Y3%
�����N���)tܮT��SZNff7�����ӟ }д�<$-@j�@}zF�&�J����q���8�@V�c�RN�^���̈́UPZ�x�v��y��B��Ð�lo�%����<	�~����_��7�.�%2鹩�&��K�k%s;%�	�{�ʎ�q�Hm���l�Q�X������J�����V+�^�6���MQ�<ًu!hr�	��o�_Y�+<�)�V ��c.���� ��y�k��C�\�M�:�Zk0�!��v�k�k���a��ۛK��7�<gnOp{ ��x��x+䜵9�[%um���[iЉݏ�Dɉ(P2)�b|�*�o�wmQ3*�q��S��K�٦ð�
��A�R��vي��\s1	s�#��M���rc�j|�������x�͓t���=<��)�x,? �M���L�B��`j��$Ҝ�Pe{Ki�n8]I �+�lfw�:�gQ�	�{��=:J��g+��z,^*^��6�S3(S�z���L�V�"�U�7V�g%���9��[��ْ£���_/@Þ��z�Hm��2ň��@e���]��L�B;h���U��Z�ɣ��J����gj�	�{�����`zQ����*�D�N.�T3�h��}�eN8eV�h�#�L䬳W�O����t�\N|��3�s���*��F(�|W�*@���=��/����	꜔0�
a��?�)HN�����*g_��� �ݧ�s�V ���އ\�m�{u=�.����n��28�5���*ˤDe��*rg���@��1���}�HmR����^��NMA'�[j��R����sC�f�K�Sqz��L
YB���9q�	@i<(r�@j��x�_2Tf�:3�gZح�T��Tn�[H��M��V�b4�R)��t���� u;Y��X�/@j+��j�L����.��ь��|h�6sbfԅ���TN v�ޏ� =zP�-J�1��
��iK�qhf��CC���ɑ��2f��&A�lB�kYm(!�m�2�:�S���q$�� 
�Z��4�L��@ĄI�Js-Ѽ� [S��0in��X>��?�l��c��Iv��ḽ�
��Y����8��3��hf6�l�l�0����(>,�Qa0��4^Z��D���?zи'm:��/@j�~Z��(�5�,Cx��ؔ\!w!i)�zsqj��0R"c*�&�@�0��yH��$�G'�y��w^�l	>��nC��W&z�&v�0�F3�2fk`��5ɇ�Q�<���@�(�"ֿ�Ϧ����Cz9)�N�r/W�.0��3�V �q�[ǜF�\��xn��j�I�-��ʥr�.�^�#���0��`��0\?�/'@�*;Q]�Hm�B�n���.єb	��}}{��V��[���7X�@��b8�����3���=@�j]�� �0��T�z4��J/U"� ���dB��y��Ҵ�j$ ��Bw`*���v�'@�J{H�s�
����i��@�v\; ���v���n*���;LX;#.�a���W����
'@O�������!}�
�6˭�'��m���əUj���$�P�
`g+��7��7��d�~t:�xO����"��@j�q��e<Eb2^����`�3	�)n����6%]�2�yl�7n~�e�qv0>��agUa�Hm��5�2�zBx��
P�0YKZo*^�]��4k��br��vخ�<_9��q�$�0IrQ�L��JH_�J����rz18j|�R
��MJ�v�'6u��ms8�؏�Nz���i���q��
�6�V�ee�+>ӧR���L��\��n�� �yJCy��N���H�=he�I/u��Y�tX�����j���6����	f@����|�@�U0f��"�.��q�8��np�!�Φ<z�@��m�� ʴ ����p�@q�­��.vVa�o M	��jfe�q�ЍM>C;�7o��	ПJ��/>n���z@5�nr�Xi�4�������H�y��h��E���b��Ö�?à'@� �w���۠��VD� �DV�xeB���ܩu͡����J���z�E�]O�(���,ݷ��?.{=3{=gr�O{Δ�8�za�7N���3#k��H���B�-� �%��t��-�L���m/b1A�L�>%ʽDq{�.3*�@j�=Ֆ1������=vG��k֧藳��y�$��g�ˈ���0�ȫ��49 )���?�8�4ɮ����<�Iِ�OWթ��UdDf\�,���U2C��K|���˲�7�]{Q��v����A1����a�M@'�@݊��nb���"athY��0}�tjP]��x��e��
~Hap�p���o����b�Xb�m&�[>ê����!ji���C��٘��8xQx�~	�i���֤V����S��j|��s��3�����z��V2�G|��$K�3>�r�!`��K���1$C�KW��c XX�0r3�aF�N@oʫ��p�H-�MͲX�HV���P�/��PR���"i솢��58\���YY��	�д�!���G�Z�θ�FZ�4��L��tM��Sv̰P}m^��I%�0]�-����A'�[@�IRH�5��?\n6h<U��Q if^�F��)��`u�"#ׇ��zg�E�K���df��	�P���`h�z��O�XԪ4 �<u�ȏK���C>4e�ԟ+,eZQ�X��ٚ�Lq��n�+����kAj�&2d�ql�*i�� ��	9���A;.c`x��U�˅�t�����q��N@o��@�v����	��>Y����(�Ky������?5�u�تR��w�S��z{�9�|ǧ_����#D-#wg
>�^Nۜ^%)H�0����E����5�1�,YA/C�Z    �D-KFO��9��[|ƕ�Nn�=���{HS����]�Jw��|�#�=Z���m���O7E�囪%<a'�y:� ʫ����"����s�a���Y���O���̊���
L6����W�@��Kz�-S��ߥA�>�=��za=���[LOxh��mJ��T�v�nj��7)H���	��Y�L�9�HU_T	e���͉���7��L����_3�g���*I��θ���#H-d%���R�b!#��A�m�!��.�-�rtp(J0Ry*x����PվZ���0� �i��~��#H->ׁ�v<Rn ����[���=o���؊n���jS
��
�ZLii��N@��j�ڍ~ߝ=����c�m�N	����G�t����Tz�c����'ܝ�56ɽ��0�'�[@�JI"�w=��b���SK�n1I�� u׭QЩ� jt�RrRC�0 n�bӴI!�g��t�[-Yv�yG�Z8VG�8��b� h�L��٪��^ �-���G��A�f=�ԠrI��M�a��-�~�:���RG�Z`��?��I�	g #� ��?g��Xr����E��>�+��6�a���a���� R��ڳ�8(I�ga�F3�	lR�!�K���<*�/b0X�g���_�"�̱	�-@�l�fߋ?�Ԃgb�jķI`��Zw�n5V�P�N�����M�"�"�×FWFH����&���iՎ�~����z�2ŧ���@�VƑ�f�l,�ҷ�D��TU���#Ɂl����S��q���ڇD���h?�� RW�C�x.y87?�<T��\Ȅ�� ��A��:���~v�����L��q��-�Rڂ�}@�E��l�QY�/���)P���$7.^�.I�KI�	�h0fuJ��c̶ͅ�	��SY��=��bJ턇W#�S����Ë�j�u*�P��iH3	�qIoF��;���0��V"rwd>@j��~H�b�e�NM�s�e��hd�=�o��	�V|�VPU�n�Xw-��}�z���S������؞����|�C
Z�O82ʋ�2cj���Ƥ�q��<���k
�k.*'n�����<DM�gI��T�JůF{��W^ ��Vm�4M��+J:����i����i�E�	��W"�F�����	�а:��]�>���MH�NV��V'���R�f$����&JI�ao������4��d�t�4���=B��,���IJ�������_+�n�p^�D9R�G�*�R�M&0�l���O^��w�{� �9W�%�e�PÞ/-�j>��O���ƽ��5",T������Յ�p��:�'&�@5��;4�O#����(x��z)�M�(iCc���Ih9�
��-m=��[FR�Ē
i�<��nի����9��b��h�U����>kS����e��>� �}.���OCu��L� fU�	�P�:v��s�����Ʃ�6�~�	P�Q�&�4�a;����`��$I��8PjTeku��5?�jא\t�y�G�Z\.��%�CUjN	�m��9���JH>[H���9u5;�T�J�A���hzP�&r�vc̏ �J��Rϭ�\�h�R8�����|)�$p8+�a��*����hW�:�:��n��}��4�#HI�Ԥ`i�e��7V�t�()�B�׀�TjNX!5~$ 8F�Z�v*�:�|:}h\������H-!�7���G:ҰA	NR�eG`����y��'iʭV�������?toQ�;5��'�[@y��%�۠�Z��#��(����P�z�h�^b֍�9*"�<��g�T9����2�id%x�4��nMk������e��Ԧ �gDMJ��"�9l�t���2��u��f�p����R�܄R���2��sç�5�;�< �2�i���B���gYqǑ���U;g���Y[kƨ4�X�]n�K��aIx	3M|��Ӭ��qПFj��hk�W��F|	U�_ٷ�����RN787�*c�m7Y�H��+�8�&��-�v�)���9G�Z,���գ��o��J���b"~��#��\������P�]�Z�^�����[��5hJw���Zl�lF�|I�@cV�����R�|�e}g��r�r#I�n��_��kF�L@o*������RK+�p�o��iq�I"��[��� yߝ��UT��w�mW%נ
lXg�pe6'���TJC���N��q�R�r�޾�I4���'��z���EjI��]V���#��Mn<f���6����	�)r��hOn؄)^�l�G���贩>\ �\��	.Wd���^;6g��))M@'�[@��[�]�?��R��d;A�J�--"|*�l���&.�I�t�"F�h��C��6v݋/s#~�����ٍ9���;E�sQmHRwZf�CU٫�yD�/�_�Վq���>p�:�	���7��Ԉ�^����'|ٟ�7��$�'ru>�����<p=���p�$�-���$�2�U��3�k��gϟ��o���y��yV��'/���I�>�ի3F���w����?�y������G�ͳ�t����.�_����_�~��G���տ~r��?��r��/�|���ɳ��֟�{!��o~|տO���E����E����O�_���;��ӝѻ_��c~����ڿz����.c�ޏ���(���L_�������7���/_\�韞�������o?��}������!?�`�aTsP$�Is�� ��4H;Y���ꇌ{�[.'��_������o���$�B�҆ǫzś�� �Q�(ُ|��I1oY$)���GX���Д����?E���Z��o���G�T�,fӵl�u( �8S�������O�^�#�r����.?��3y�~q~�>����g�!4���o�}z}�_�_���ɷO�x������_b
x�_�/o��S���THk2Mv��E�6�Θ)cr��C�~О���"���TxJAK�Qݤ,v�����6�o����h����E��I�s���\{SpG��i͈{�ZrM����a�B���F���\��/X�T�_O�x[5��x�Uz�F��
Z.)\r6p��j���X1;t�t�`u�.}!y��B�G���O�Z��mV�R�F���ف��&F�l�H��.*3�N�6gb���t��:r�|���T9[7����҃j��Ւu�sH��?�2��u��06v�뎐��/ӷ�"�t.;�6{eaK�~��@��Gb�{1]Z�g�]�ݘ��̛������+\���AG�Z<̰~�*I	E
?��h�ѵ�F
�]_��a4�0xɪ���W �ۢK�ͼÉ�O��p�]@ �4nb�Wi!&�@ifUm���h�͹�\�R�&�W);�r�v����gH�t�[-��]< ��&O=xX�J�묲�u5�۠Ɉ}��k�w������:���zw�s��s��ӯ>��ou}�E��OV�;��Y�������4�/��FRM*�`�d��aQ��V��K���&�[@��b�wlv@jј�V�$uy�S&U�i)Qe�k1���fem�I���TΒu�`��A'�[@y�`���3@j	����Q�5���0�mU���6��K��Oq�案{{6�ՏM�5T�/�gZ�thZa,��p�D-^:���DI��KQ�1��L���m�'ܓ�am�\����o#|�bf���sç��1|�}� R�a�x�2)Y|R\+��C9;ӌ��|3n��B�S�S�R�j�n"��a:� �אb�����Z�7#_R��@���"T�g���3��PQ9�k�.�9�a�n�Ϻ�-�fMZ�&���Ҋ����N�n%��)E��/4���-SS��/�PqڨaN0G�fj�	�P�jk<�&�Ajі�s�(�^J�k�(I�-��q���>�Q�b��&�ت��%�>��=����[���:�x�� RKt��_�J�;���0�W����Z>W��R{�SVIK�!ia�����޶�L뚀�4�>��Aq�%$�X��UNb��\�VI�u#�T�LC�    exoN�W��[T#���!Q�A�GN���>��4mbR�3�ح6�߯�|d��5)a�פ�ހ6b-K�量L��?j�
=R�j��5����\���꘸F�;
�Ԑm,ũ@�,� qBD�@�����Q;F���	�R�<��ʚ"���:��|n��5���w=��B}t+NI
��?K�>�1*��u����<kzM�(#vE��t�A�&9��6�cN@7�zZŻ� �p&�*�y�	�����T
#/�n�^ju�w$����[�9j�Z�n�t�^�fg��Z ��B�sĀ�77����P���hp��ޛ
s@���=�\��I1�#������n5k��g��=��Bٵ�)2FB�LV|Z�.p����b��f����2�䢍�wgq4�Cd2���N@7��OtG����h�Nd$"�K�gga�[�@ݧ�{�T���F�S�U�l+�[�9Ql����&����~%��}!j���&3z����k�La�8�8�%���,����r�E�A��׬f�ϛ|n���d�w� ���J��l��$mj��Mm4Z�{i׀jׂV�˪x����%cֈfJ��h�-�qul��F���h�p���T�:k��O�9�� wT����)�ǌ�����{�#Tns���n�5$�i7��R�w�Uk�|�s���(�+إl������$���!n���Ö���*�[u�O@'�[@Ӛ����O�i��Ԥ9%��pP�V#fAk��h8]��ރx���TCI��
�ah�h������=$�jCw�Ajq6k|�ը���j6���D"�T�
�Z�����4'A)�b�#٢��}�&�� 5����.��Z�����aƨH��RmRE��֊[���$t��x��⭓�/�x�F㍊?��BW߿�/^��ٛ7�Ձ�瀝'��s@�+۠��]y�E琋�06��J*��
��IH񫋚��Jgw���Yq8��S�6�1��VM�ջ`�+iAj������1&�D٪��F����j�WuE�1�X�[$d�$�ԣiz�CL@���5Jߵ�žH-#SMV���jLF��каE֥k>7s����$ƚkx
�&@�ã�u�B��t�_�� ��應CJNH���ʙ����?6s4�d�,�R��A3�����J�o3�&��w��UK��}O� RC�G���$p7鋩�W�0\̗Pp��E�1|u��5���@c_�t�1��n �S���� R���/���8��y�5�S��۳狓�`��b&HۗZ�;~�>w&Yϖ��[��5o�cr� �hi���P޸"� (ꡇ� �_�x��8���s8%�R��%�j��p��n մB:��9��Rz�:WRqD���ғ5��E����������g�e�1W�a�Q��õT���n5+y��?�@j)-�	*ʲ]"��
d�������8�I�e�-��0-'M���k�Ԯ&�p�~��m��B�I���R�U̺GYE�I_ �p�lR�Ȫ*D����9Z]I3�Y@jzP�:��;J@j)��vc�NBw�F�����T�����<5�r���I���������gV�t�_Cr>�k�H-�@6��U��Q u��2�W����}� ����
�L6�l���3�l�4��xG�����S�W��2�fx��H՜y�jGI�e&g�p��Y�#�4�S�1|�d�w:�ʫ6n�v��?�GMk�v]������FbE|0�8��/^�x����s���@6�U��_8_�����]����{-&u	H7w�{�hϑ+Iўg��9HN:����6eo{��dў�
'��*� rQ1��  Мs7�Z(����.�H�r>0x��Ó4����KFz��`�m���ۋ��I�5:zNJ[`mHc�%q�N��C��PZ�e��� �`L2��UI������^�K�Xw]�s��C�$R۾����2�,F&P�	����V�-�~��� ����]L���~-)��:�P��Nu'��SwEр;M��r�t�^cZ�O��ZF+���[HL�����D`��O�Pj�KU,���S,�C!�:�k%�	�t���5w�?�Ԓ�6a�F�:�� aOW*��X
���D�E3�ʽ�j��I4r�!��;��V����Ak�Z2�a\��t$V�MW��st!����U�Nu�-�#uk�pƖu�ѝ�N@7��z��+�AjڥT�l����Rً'+5��@5�R�ҧ���j�4
�7�O�h3[vM@�����q�1AG�Z�#�SBЕ�r��~��pG)�Kf���L�!���+nI��"�e���`g��th\ٓ��G�Zr��j����EQ�yJs��SN׀zj�uO�}�1�.}K,c;��	�-@�J�i?��RK7�L�v
䁛�N��)��·�s,�-�Z� Y�Z��x�n���В�S�t���$������ns��2�L��-Ҁ���l�A�M@��5J/�.�{�Ul!�J�V����\��n�+����� �ئ�$��Z�4?NC�Z%�=���3ǋ=%)i�T��*k#]�b�-�����n5ktwu=<���' [甥�J���`D�{�>^����U�T�-ײ����z��m h�9�j����� Q��T^�����٨֌6%���#�a�����W�AK-[l�B�&���-�~��tv7V�R�s��x�Ԓ8%Y���e:{H�E��g@%�'�85��A�qJд������X�	�а:2����Aj�7�%V�	>�B�h��~;KŴ��u	�KlN�O�*�#�G�f��	�и��S���(���II2VZw�*\���X�g��5��u"��GI-K�k��1��ˠ�-��rd���A ��H!"EEv:��
�j����Y�q�l���t��1�x�N��"�C�ˠ�-��VJQ�}� Rp�[�'�)�S��9�UA��M�տ�2�ul]�l�r�'�к*���H~ƊL@o�W�}��[��ZJ�}%=Q9H:�3d�ņ��.����Eܛ��Z0|%7R&�'�V��.�t�P�z��~�#H-�3<���x�d�����V_lPM�qh*j�Qk�)��W�0�!�>kN@���5J���F���F�k��R�LqL*��@a�V6���ɒ�yRÊ��YZ����#�M'i�ԭ0A�~��#H-�'/�*�������9���$���^f"�!ăq�+Ƭ��$D^j�����9�֓*ܟ� ��Q\���<dT:�3ܩȜ�K����Y�9�&KU�[�9�\`�f�iN��[����Ҽ#� RK�ҟL�� 	f�*����Z�y~�A�(�{WUD��<�EUB��ﵙ�&�[@y��}/�RK(�d��!��E��MR�Gk&��c� jq�i��w����l��F�.M@'�[@��޹��P�E���SV��*v@�ޤj��B��uP�#�'�	[ s��U�))A��vq��O@7�z�R��v� ������>��A+�XT�lB��Y�/��M>��q4������B4Ŕ<�L@oj$���n�����c�r�'���t�8A���u�V�[���6�7)v�h��4�����Jv�r���Ԯ^[ޯax�
�[6Y��24(����#�g��� �K2Rg��3\3�8��C4���e:���h��}'� R�P��x'��p6�TT��:�R�\X��(��|*�������2��p=u=�E&�[@���I�o�@j1.A�T�ݝ=U�g����+��P�!H}�*5-.��G�*-��N�th\����נ�Z�&.4 :�թ\H6Ea�zn�8]
�	_^���v
���8�U��u�;I�-��Z��n7`�R����`�j-Iqi:(�R�7\��ٟ���2��..$QϸA�,��`LL@'�@�
#�nuAj�md�S_!�ô�p����e�+���\a��{wV��i�8���1'����R���^���t
M:�WR��UN8gh���G��2���m����������f�    ���'�[@�J��hxy�%�У�燎�a�J�DEI�RI�����DI
����l�N��j�?�jW����� ��T
����k��¡�20Z���^��Y��� +�1�YT���`]�u���nu�K�m�?���%�>ڦ��B}5`3�s�,P����X��$�$H���F��|k����n���̥�`�H-�GF7�kO�X�Ң�\&��e�S��A��$�ĥ��2E�1�~�<5�thXܝ��A ��Pؕ�O�����9��@G��{	��ۓ*�V�#>>ah(uͥO@'�[@y�>:޷A ��ڒoƫRdTj�*ÃW����`�td�#�D�`�J�/�K>��h�k��E�&��w���r���A� �H-P��wi�p��,�
Ƨ�h{�pi����h�NE�(Z��Aa��2��g��	�PMk�@���y��;�z�`�&�H����}.������*�8�Y��V5-�1��ώ��-�ze��]=��R�kɹ�)� w��iң�1�n�5U�I��*y^�L��G�;I�-���Pv��#H-1�\R��l��(A��+��65��9P^w;R�8q��W��u�.1�Q?��V���z��4C�TC6�e!�K4���cp����e+�R�$����w���m�	�t�_]�z ��k��Ю�r�+*��J�X8ag@K�]H7E��|�-`
�"���2��	�-@��5��|���굫p��du6�����;�����:u�ar1M:�6'9��J��1��d�N�th\���� RKh�HN�e/>g1T�%�o��,q�R5�롆Ob���l��}sޚX���nM��Z� �Eɱ��LZj3u<�ʘ����)^�S��)xH�	\�l�s�4����t�&�@�6�1���4R�/I:y�
��*͎mʴ>z���k�����6����JE�.ivEk;��'�� իO���|Aj�#�g_(�<{�J6��ps׀��k�18І�8s�
�;��L���n5+&�w�� �hL���H"F\N�l�"C��~|�5��S��o5Tm��-���b��T˘;I�-�n%��.'駑Z��C�F��dþ��)�M�U�����v@�q�5��E��Ҋ�R"b:� �W��w ��H-�	�����72b�b�6&F��A-d�!G(\<�tM.�T�ݔ�RMaV���n��)�ݼ�#H-,Q#��$I�F�cT�$�e�n�\�qk;R����z&�x@3���>�2�t�5�N���=�����+i��\
�8T�` �1j�qi��u�`�U6�/�
w�vee͊-{��t�4�^{����R��\vECJ�H� 4����j���4I���xi��Y8��a4G�.��m�Y�i���UÇ��E� ��b�-���	��OMJ�XP������y!� ���\KT���aͱ�.�[����_f:�Ԓ�O^%")`�^%�ﺱm���9���UVp�eg�Z�I�ޤC�<k�O@��z�Z�t���<�����L�N��,˨H���}JY�3���VCT�P%�$�3��Jt&X;��&�7 I������@jan>;�I�T�X��v�b�<ſ:۠ɰKf$EY�?��J�Z+�`��>����7�Z�_������}r�V�_�l�<��[o`��a�����G�ͳ�t���.�ٟ�7�����5>yO��iFR5�U��p��&gS�v:������pD�~���l�U��ɕ1�I:cc\'�ыv�(խI��JUJ���{)h���`�����g��?��������L�Ƈί��܏�;��ku�@���p��0����8�Z�����g�c��㯸QJ&CCcp���c*\��Z+�|3c�8�BƉ�#'ru>*�??�����-�Δ��C�[��TXz?VC�Ɓ�_�gϟ��o./�o����������?������_w��]����o��|�����_�~��Gy�^��'W���*g��?�����<{� ���;���o~|տO���E����E����O�_���;��ӝѻ_��c~���<a�z����.c�ޏ���L_��9�<����_�g/n�_����?=ko�����~,O���M���wF~�<�a�$��`:O�/���4G�ZL�\��q����������ߞ����A����֋�u�v���(��w�P<�}����<�ZJN%�dvM�#,/V�nz�������l�V����cq9=��㳠��8�⪲R��A=�$�n��d{JP�ps�8r�'Wo�����/>������OO�|����z�L�|�����LT�/�G��OO}�ͫgxI�����맛߿��~��k�p��g�����+@��^���_��Oɪ�RO~xt�{�閏���:�_�|�^�o�a��~����;��wd���+?}_X�^K��D��wZ���j3������a63Vf3��Y�d�So��P��Hi�&�֜��4�)
�t�}�֮��M�V���L00}$�I��7&v$;�Z�����kH1�q��D-�W&�I&���:)pT�E�n���Zu�LUECb�颁|�����.r0��|��פM0�
� R�T�rn0l�(yc��;󅡘����4�"U��|q�;&��Ew�=��&���n���鶴q��%�"U4I]YZ��,�;�M��v�o x|=���:WkU%��Ɛ׭�'���w{)zMPz��;�Fji��� ��@�&3���C��
QɗF,���5�;�RJs�޲��t��َ�g<�t�[mdo�c� �DjpJ�[��#��?�9˙�eۨ��3�A��� ���j�XC#�������W2p�v��#H-҇�b\�fIK�Y�ܲ�L��R5�_�F�R��N�r�ҡ�c�:9���y����n�Y��� �x�K��n��'[Tvm� ���Ɵ#yw�v ܠ �`U*-��5��,@8�
'&(�FDAj�n��wP�pm�4T!��uS��8���[�>o��U�u��{{Ƕ�nl*}�
2��U����.��T;�E��{��ѼF���NcG�t�aX=��r��0��u��o�/^�x�������o���W��}�: j@��uk�aȅ�t����4��ν�t�J���y;�VN2ppb����Z�[�U�k���|j�yos�p`����\��)-Y`�Jt�$�I�o�Y�$,�P�m���֯�I5�=9��jjE�$B@Z#eU xU��2j*76�;�~��7��\$�)�<gָ��>��w���!;|�������?���nq�����#d/�ª.N�6���U%q&0��k����<e�����v���S��$@vt֣�����ޟ�\�z��4*

C�[RR�JFM/T��D^�Ǫ���v����$nE�Zbv����ߒ`��$���E��4��\�u�k:�ϟ�K�N2�b��K˴�<\LL�:ZW���ߗ�3����]���Q�w�;�3���^�_˿o����|����WDP,�Y5%w�ƎS��M<��A��1�4T���b���������o�����`�ܱIaP�m���ޜ�����1p=x�L�:�X�x��3�awԤ��1pou���� 8�jj����$����hG�d���P�=�T�\t�{hyu$u�v�� y�J%��D�:i�T�*%w�s��;�~��=� ���>d2*K��ެ˦�<�,S6WK�;�vuZB���%�b6^��8��b8����Q�����	N{Ln�r]��,,8å���t�4���-�H-��[\��&k~
(!�J��w�i��u�'ܛs&�ȑ����~ٙ��ڱ󫿳�����x� ,��^b�҆9x���tʡԚ����sO��7R���}-��Ԡ�톈[���ܵA� �x�Kq�*\Z�钬�&��vѵ,:�"u�����mR6�UxZ�=ΰ�	�6�V�,��]@ �@�!�Z�uIp&�}���6�}8l�Np֥��t@��-�E5$N"�P(�-�	�а)���s �    ��.�aQ'��{�-$;����G��Ҷ��F���'['�*����e��Ip>r�����	ι�P������|�$́���;�H:��WhnJo&8��-��xO��Sn�@�t����I%�^��1���H�Z���-JJ^g���a���xi�l�W:`�}j2�q�M����	�����v���评�/_���?�j�zlI:�I����C��Z,�B\��%G�j:@�����P�w#��-��~i�zW����?Q�ĽhɵݝE���}ͭ���UPTF���8�cΦ�;�6G�8b�e�����f6C�bLJd���[�GN�{+��q=�!�7�_��wm)o��o�!���v�ߒ�_v�M�د�����U��z�蓫��W����c�o�~����"�����!���v���h����J���\�$"$����^@��E٘�aJR���W�i
�|3�G���po��=����/�����\}���ƌ=��C�~���/������+r���c��ڝ��un	�d7KY/)�-Q��D5b��1��vé�P�pO�b���%ǹy��(�#���dL�1<'��,���V�%�R�oA~Mɚ���qd���#��"%��d�3n#��1ѱi����aN����ا�����:f��c�G���Ļ�Nx$r�]��_����-�D��btN��i�BP��_�xi3��R0Ҙ���э�㪾+�K�N��C�N�;���#���K���ߑV�犑�RW������u�R����8�TӰ��#�p��j�Ӫ��/`}����J����m�M�:�Dɓ�?�W�8�*w��<ȯ���[V)^=R_}��w�����]huS��E�I��w�mX�0y�/��W_<}���tħ/)����;2��d=IYx)������:͡��K�k*�g�ɫ�	���V0\RK���+�c��ȕnǉ�dz_�_�~��ia�a�p'���i�U~vv��sN���c��/R}`��Z��K��!eW���4~И"/Q0�y��DHn��ƽY
�$��in���m��[��S���;��`#'YJr�`荥�.]:M�K�����'::
�>U����g���s�'�&�=���~�K,���ػy�}P����O����j5RXIH>?TU�V�aLf=�p'�� ��2%���H-�FFCMе.�TxξdC�Ew	��е�mܩgL�ԃV�S�E��Қ�n�`hu�3�o�@j�É�.Buj�<�hK̆Gp�cB�>$E�K��E�6ܯo�Z1y��O@oV����� ��]6���`���8��篁ŔG��(-���w�m>�uC�Y�¬wf.�6�m�Y�,�z ��H� �5���U��,�Q8gZ�Di��X�XI�Ve#{8]�
�8�-�Y�kzP�R0 f?J맑ZZʭE|ڲ,�8Q�i�6�����r���#O��M�m(����+�c[�_�7���՟�����7�����j��o����WW���{�`�n�t)�Z�Gz	�U���T��*kC*�5YLH�,�Z&2���RԞ��Uȋ��}��������ϲ�zǲ,|n	,*i�����tL�3�)�����۪�9�M�A
Go���P���i��v�6r1���L����=���g��_�Ju2�X��]�
C�}(d�������m���n���z��5@\K)��sR���D��̢Q�kn9�zfӋA�N���u����n�c�ݵ����n�c�;��n�}~��v��=n�9^5.�_Y���.y8�p5�����Y^���?ѕ�#�h��ST�Jm�%�t�J{�DBC����9s�����w#C�����bB�E�G��WY��K�G��;Z�הv�����@m��'i�k1��qŴ�7�BC滬���%["��4�qб�5�w6��YJG�t�R
	�5(Sߤ���x:���5��U��c��%
v7����-� ���I\1K\�S�!}�1�6�Z��ȏ�xZq�;�HV����Z�C*����#gN��?Hw���y���`��~4O�$Q��;�C���>܍�=�b]��O~t��@�s�ђ�)Qi�ΘN�l0ͨ+>��;J�'�U��&�`����?G�tKuv[r�)|�0�vh��$�&���;�N/���xO�̎�ݒ�RJ��ݥ��tVf/9�����:.�?��#�	�6�$u��	�V��f���d7����
�r������H-�J ���K�4��{ma5Zm�L<��ָ��׼Kl��KA��/��#&��6��V�*����@jq#�&J��9x�N7�	f�Vv������G6V#ɂ䩧}芲Ŭ��M�����ֵ^���s���}��C&��QƧ*y�4�����_:DW�I�:�ۢA�F"�5�l�+vL:���� Ѯ=���d<�e+��I�w��Bh��k�L��Q��8N��*��WU�t�y����޹�+;Y�#��'�ZRkl�����#��"mդ�6��^fx-UI��B�î+<.��WJ���1��n ��'�wt�:��ݰ�R�z�'T�kgi\_
U���sv���N�c9����%��U>�憹��)o{4��;�I��˲�r�=�.A�V�ڥh��ZyK�/��ƞ�'�i����Q9���9V G�l�z^�I���fI=`�o���dE� b�lP���m�QW�ġ��<��U���H{�^������go� ]��U�#���w)���S���H���|������<���������hFR�4�d㚳A�K!c���S
�Bm��奋}ݴ[|�lνfx�*}�[f����z!��ю��7��<�Nd׻��c��������0�d�z'K�M"̒��H�*�0�>Y%����ڇ��'w^ª�N墤�z�+�C�!�Ze�����|S�h[<��
��F_�bi�ȘЫ/��c�!�q07��cu��) �E��6�ql�}�#���ch�Z�R��:��ۺ�*�F�.ܨCzP��lXMa����1L��o6����G����Փ���������!�$a0��ݭ���ww�<��m��x���eBh�15�u����'���ΐ�)����1�@��x*���j���+ �
��� 'ޫ ��u����<�Ҳ�ݚ��k^zKZU^�'�#ܘa{��wa�J�94l��UO���K9�-�#g��o��={u�����c����:�a�6ݑu�1�h����K`(c����ա�E��A�?��S��EvF��R�5��-�n��G���ۑ����7����G���'W�z�5����/��������W�}�@N��W�ĕ����G R1˟2Kꅄ4Bjh���?Ʈ��)ˮy�,1z�sR�13L �n�9��Ln��d�3�YQSһ{�G�x���pc���)C�+F�#{v.����εE���ti�U�QT
���(�-�#go������W���%$����|����|�"��|�2�5:}G��#����[;�L8�ۥ���A� 1ƍy6F��n�e~���a,��JO#��d�n9{+����/�}��������/�;�#�k��ox�%4G�zT�J	y_��/�xA8�?F�B�#�A�v�9q|�ZQ0�yh����~����?=a�軯��>��׏�|��?�W�-Iϵw��#O�oc�p�:��n��S�b�Fܑ��[H�iC2*j�n	R��k�j�a��/�l�go�{@�O��?�1:��{e��Ʀ]}��0��{��e���6!�wL�k�Όz�����n.'3t��J�i�T���#go�]ܯ~��/>N�ܯ�e��p��Ĳ#O�t��RS�K�qb��z
���Tr�����!��B��*�B�f`Ϧ܃���G����_���p��{n�b\<�r~��L�����r��-���t�r��3��oɰ�@�	˹�~MR<�V65ǹ�0��������=����k�枖��C�5�>����d����x��e�����b�X_9��rc����-D� 	�    t��ŐR�ɲ4�0�vs ���?����lv]=y��g�������C����>\��²�ɭ^������b1˼�Ԁm(�L���Z�Z*���^�y||��?r���-+���dzZ��f������A�[S2��,;��11��e�ٶ��o��u��I����ę��Ȕ��#gou�������G����O=}����u� T���U�<�Һm�à�L��)ۻ@a�^�2�xs���V`%�$1�9y���J|e��@Xm>r�f�x����z�����_���%��#��W�Wiؕ��;�<���T1�&��D+hk��*�ɵ�d�ddڽ, %�>�� a�>b���	GξS�Ov?��7I��=; �>"��^�G{�s�8�p/W�rI�	L��k妎����뢌7Cvm`m��N\agI;���]�#g�)�oO;�$���d��=oX����+y�E�o�N�!��,�$����`c�vù���Nq�:s�H�L��1���s�����+�����?#����Ypa�~��#O��(��)L.���o b�l��;}cU���$��Y�!����dY�K�NJ!���q��}a|����U���{�DX����zG{�<,�
~����+V̦DiPt!���N��n��������C��k�đ�������7�|w��w����g����5�S�}�<�;s2R2�T<�KK�&�ұ�5k�o���#|<�	�s����-*�^l�`��1����/}��������W����{x^[ǻ�CG�r�U��U���t�4+�-��"#�|�����V��U�f�$L aH3S��}`}��ٷ����?f࿿ׁO��%��$|�)��B7YbV��5��*C���T�|�aiB���A��H�XQ�ki��?0	9{;�_~���߸�\�z�����/gߧ��4ˮ!t����w'Y7m�f�#5$X����j7�{�A�Pd��E�����0���;} �#goe���o~w����ѓ~y���}�NW�g1D�c��?�̋g�٨,%	�HE�q�����ӹq�-��a�r���B����q�ǡ�go����W�}���7����u���`���By���Y�8FZ�R��9L��(��muvS
U]�rPp��6ᖌ�Ek���8r�v�z��2�g�?b�z|�CoVMλݡ?�Kc3��@�͐���)Qq��6����B�l\�Br�W��p<E�?`m9{;�ߊ���1��}�_��������|�����<�+��HV�M����D$S�Tz����c��f�9�ʮ9���}m�Ǳ�g��؏�F�ƕ�^��H � l�P��^%�����m���dϲ����H�ʰ6b�������'+3���(�;��52�����r?y��K�~U�c����kWG�9�K�������CcR[�k�fH޽L��t6u���v�A!`2�&<�	�S:brF��/�q�>{��3L�On��������*�e�4c6���.[��)�r�E����\fleJ���Z��;
�eǺ�(Bb�w���w��%E��}�
h`��U8'����o_��������������{w�ܽ}����sV^�`U\�)�TbW9���Y��C�����Y�^�ݝ�9T��ĥ �Z�wF5�	G�*��r�D}pM>�
:?l�%���#ӝ"�[č�8�=���Bf��9��ȚK�p�.�$�'��{)�5�R�)}a�ɷ�����/��{�~����?\fI�=g�%q�(�EK5"���)��q�+u{�a#�A:U�V1�G�&��=�"�a嫍�<�$|�L]�c���/�ɷ��7���:����g-WO�`�-ᔰ��,�>$�'%��xT�y��r���`��
JK��'�$�k- 	ǰ���krIKunتK�Tn���%��p�g��\�D��G�$i*uG���D����P��Ε9��yߓ<�#�.L��,�ږ)lT�C��dG�;q���M:%x�G����A�p�cUv�Z��rj8s����h�dpT
Ո=�����.��y��|��������|��2���3V^nu��O�IW�*�V��`�z �6I��f�c�*v���jy�b��c��
v������������5��<���e�2�g�47Ϊ�N�eO�����5��̱�/	�}+Q�W������W�$���7Rk��BW�y0:|=�s�j�%���q�KO���S�pf<t·���ɤq�FF����������+�r�2�{_�5�i6��l� �_>~Gf9%�b���k�&0��6PyR�y.���ח��G�-���I��Z_�d6�`�#�C��x����BV��f@T
��0*���W����:_��J�Y�ƚh���H���&�*ӉE&W��d��pD̶�݈N$����ir�#��Q�dM��v�ԉ���3h�o~-�<��U����g�_���,�y��'���^����T|�p18qX��&	��{'�����wra�Mܶ�+o���Aǎ%|��Ԩ���_��d���/p��t)D{{ݢqK�h��bd��JA*������4G����r8�=�C�b|�r�%�If���U�k�1�n`���9��sl���K�~�4$���ĢG70�I5�[���~f,��`��nqܻ��<��i�5�E��2=�Ŕ��$@35W������ï��o�~̡��%���9{ª+�6:R<�30ofm�:Ë�=a��hֈ�^�Ւ۽��, u�$d���C[�޳s�ԑ�`d��R����db�XU�z:�ń��9N��Ս/����	���lg��w�pwӻ�z7X+�ٚ�Lb2�RRr��e/o`��߃�y����{���^���s���r�z����Ψ��ȼ'�)s*���Kf��BG�5%N"�	������rΧ�Rͅ��p�c/��G�00zo)��+����t:*F�*{n��`��Lt��b�&�.0��:�b���*�),;04�"��I�d�3`�3�K��u��|$�02z_�!���n�<����K��r�8�z��Lr�Y���u���=���%�1:��.;W���>1f? �
�Ix�b���l=�<2z_�9��'�}}�K\�a�ʒ��rO��iN�YxWPqK|�!��\p��lp����%�U% $#~LU�,��(�s�NG�ۑ�$������'/_�̪����h�ʀ�m�4z9od���`ӽ(.r�6�[J�ԕc�����)�%
=�4?�t*��+IU��:�#02z��Z�'����W�F�~C!h�xu=2��gj�K�L�����8��	WR��;^6�/ B Qp
g{������z񏌾 u������N��~z����׍`B��+m��<'����IN�
'�j��|9�s�|�YՍ�)e�YD�X�kd�:�62zO��|w����s���1lU�Ǎ2�,�ڌ�rʲ�n�L	��"���<(ɴ��n�J�5:pEN�PR��'���%j=s�FF�	��W������'�n?��Փq�c�ʢ��{52��E��M���4'b� �w|/wD��N�*�f�yc�M�y:G�}G������<��ض����WD�G��r����N�����7rT_F/^V4���d]�;h�u�w�����
a��-��<��9��;2z_�|�������g���_.q�sg͋5��6�Y��:2�	kK����('�2%\*jJZ�w�Mv�r�
���X�&�8I̴�}LJ�E�/���ݟ^>O�/s��a+�� ���,��لs���X�|�c�+l��K����|���N혘�[-�� e�ܵ��p��l`��?��ŝ��zt��''O/U�qg��_m8'e����L'	�URp�qF�L�b��ƩvХ��33oHhb�ňi)E�� �]ጌ�>���{Y���a�;kV���]������9YXd	�3v�$r���8fs���ݛ|eBm���ș;jq��GY{<4g���#��%���ӫ�?�\���    59q%>�Q��L�&s���&�A d�3�P�ͱ��r�H'5\a��`���_$'ҥb������/��_}	���%d��
�n���#���ֺ ��x�]E�/��T�݆l��-s�ngF�%ŭJ�B�:CG~d����t�4���ONi��쯹)��L7��{�M�ie��y]��z��qD
3���Ɓ,�.�NfQU��Z�,��#�ďx[C�������\n%V%��R��1J��Cad�Ns��&x���EP��}��a���B�َsB��N �?0F�y&Kб4{����[�{�o�{$nݼw���ܠU��7a.� #S�2l�S�p2��PI����]���vRS�V��	
s�P)�I'&҄��Ii�O(K��M$o���Gd5�2u�(I���Ro�0N�V�$+���u�3v����L�q��޹�8�4���^7Ƴ$��������??~,�=�)�k��Z*�V7(nt��,��#�\2)�h�bh����hR�B2�p��7pA}㮫�*`����s�8�ʆ��imd����o�Em�����E֡/g�r�hoʆMP�G�r�N'V�4�o��LEI�Х�v���~�9!�s�����W�weՂ>��֧�����c�:�m��P��d̲�Y����k6ߖ!5'/p�� �)n�QJ��[n"H%�(���(0�b�y8�}A�F�]kԒFq�J��R�Q��06����#�܂P�^��:#�᫤VTt�m�ߚ(mpI��n&-1��%WX��S�*52�Z����~@+�8�!Z�r���՜dN�ivo������ V�L�L��Y({���9R&a��5�)��TjdصJS)��F�q�Fg�^f�Yˉ�����1���������(���Z����9߯�jg=�y���m{�i{C��@�Ie�Y���j� �T'2�*����I.��c��;14N&�ȣ��cN�x�r��nVn���@Z�E�82۩��$�e�Ǉ2V��֔��K���Q�NBj��U��Ѩ j�f�`g�������������ϯ*��-ڣ:����N�D,�R��k�	/gz̺\\�M� ̧�e% �� cˢS�&O�#W�#���~��_ܻ��훏N�ܾy�D�\U�qCQ�e���N�$Ź�s6�e��1h�6ʢ���Q�B�Ui�ә�>��=F)�Yl���?���GF_���������q��שEk?2ѩڠ47/�{I��e�f��<���nĩ6�\���a�-�B�s$%n��|>V�90z_��nsT�_'��?���o�~ ��D:���p�#G~�Fwd�S�Na3f��%�>��$]�f:���\����p ���e�FK��U,�?�}q	��Y�m��7??�	��R+�"��6�8{�����~L����09F�k!-�"��N��Zqc�^<���9��8�r��HV�����x�������T�ΚU:��&e��iN��j-��Y�@�.Eo�t�;�e7��B�W�6�1&pv}�p��1؂�A=#�/H��=ץ]:��޺臽3rx�b8o`�S��E�Hd�m3�V�e�@?�¯���&S��HL��g1�FI��̸��6�~�����}�?y���)X��b��WKz��bG�8�T�
��zL4,B�kj\k	��n�qR����>x���$�i4%s�Ω�ѧ����Ӈ�}�D�)�~�����W'�!�K$U��ʫ#�|3?0���J|L4��e\źx�%�>��u�m�J9��f�,X=K����xeMpt��>�.����G��f��φe�40�I&�g������{C�{�R��*��u�$�Y���f��,F*I�[͙j5�c%#��V�>�m�<�\V2��׬ۄ�-�&,WQ��r�Qw�]UF�'N�.xUU��EZ�d��ƒI�XCï�2v����-�*��16����k����_�:��^��[���h��y�U�1uB0�����'�:p'�f�ML��+?%'8�/.{�q��l��f%	)��Jͤ@�a±��#��W�.s�&�tR!���R�-����F�`�z��u�&5����:V�C^�*ʨZ��Z�W[�Ĺj;�s�bg�`5#;~:r&����[�6ë�zx��p����0�]Ff>u�w	���:g���oƻ�w��.>so�hرV�|ۍ˜�/��q�r`����"�<xt��׭~��a�]�C#����P1"q������ �
�%mC0����3���/��Y�0O���'��6�:�J�5���\�+w����s_Ov���H�Q���n�,?oC���9�b �,a��7��=H���8��Y>"���gg�t=�rr'�W*��9���b֟}w��Ӌڽ�?|ּ��� *���-^�%ѝ*�f���ػ����v�O7N�8���`���\�����/�z	����������+���}��ճ��Hϟ��?��?���m���o�R<����T��w_���s���p�ؙ�ȷ������%��7
����m����	(�+Co]�n"ʁR�@�i$���\p�26;<o�M��Nɱ�,|��������t>.e����p8�� ��P9Z3���@u�DC�9)Sqj'B	a.��q�\�\s�����f.�f�5�g������H�>�1�|�HJj�HP3�R��@mN��t�`��T���m�TǾg&��j��!������ �������H����_ܺy���G@֧�9�b?^T?X5�GqC�^�20��BN:+�qø����&A1�X��V�<��[�$��N0�W�	La ��#����U����_<c�UPrC^�rf�Ȕ�S��zDUrA���� ���[��r��T�9�[�w>_��I���B����:r��
n���Ń�ܻ}��7�*v��E���~`�S,���c���eH����Y�w>k
�rj,='��	�Ei�c-F[mm��Fﳭߺ��9NgCV}��E?~d���8�� �+Ť��:��ݛFf7�W�
�[����kN����-��t�ǈ�F��k�O�^��t�;-^U��+��rM��\'�c��D�y�dރL�ݱRp�z��N�#7ۥ��f�;+�=�5�I�$�12z_�w��|����9�q��Y���\-gW��t�䒪|���B�=��UŻ��C��M��Gq����!D� K�*��揰H������߿���'��t�\C���'��7=��B�_5ʡ�&z떛>��zJ&g.���ݭ�O�!h&��.q�P�!f?�<�����r�I�C:�u32��B�5�;kq�=
�Zu5��9�y��``�钭�{g�o�� |D��[|
y�5"��$�h2DReb�B)̀��e7Hu�H�x����sz���/�P������ӓs��U��6�RX��#S�2����o3�̤���D P���g�2ςf��m����v]pr�c��FF�k���_<d����/�م��ͪ4.�E���Z��	��F����#��k�e�%�u�Ei|�̹!���8fdIё9��'�G�G���˿_���Ѻtd���.]&9Q�%F��Dy7+�I�H��w���k��).��x	^�X��O:
Gܧ���r���8f���+ �e(�1zU重��̈22ש������E��"2a_K�9�p��=�����8w�52c71�P���1��w����=^���<����W���x�6/X���Ϥ͢�����1����+���$�J=���ܳ�*J���V�:z^��w�qG�bd��R|u��?J���,}��ˬ���Zn���3��ӝ���8�r摋@�����'g2Όlv<+��Y�+sI3�]Qc�EkJ���~S���_�[ ����
x�����D|W=m,)+S)G�9Y���bUZ/s�=��FN�@ɸZS�;��4m�PJ|l����.���C������=�?y����y
����'���Kh�v�`6���`d�S:YO�T�8BҸ�*����/w��d$I���W�o-Z�A	i{N��6��9<2zq����=,g�    �ox���t��#��p4gm��3��V�l��R)�����@�kj�ɣ|3x]nF�����kGb+#����C8Us~����詍q�J>l��pUm��4��#��Bu�3��(��Q�b�V<x�u�}�^���=���&=��Nt�mC��^��"����^�*�^���w�9��!�~�6��J�A�nȹO0�Ћ�i#��8k�r�>`�o2�%.�U���;����H5_�f�ة��{cp�А(T�:\��y��
|�����SV�p�1�Ȭ&.ZkJ O���\!�,tНk�tļ����g����V��^<�M��a��`V�3|Jǳ��էnL�R/���x��'_��퇗�~ᬂ�S�O�6e�_��|�x�ֶm���G@��g�4���v��wuޟ��C�c���������.\�9���?�������|���K�<�Ӄ����zj����-��,8�u�P�Qq��f.M��Ar''�
�%f��5&�i���t��4����p�������`����	��i�����IfJ\�^��ܚ���NV#�r5�י�ڪ��e��k�b�Y�.>������^�Y��j�\�I���Ց콑�Y�ޅ�X�}�|��O^�nNn~~���j��O?����'�}�d��:w�U�K���pj�79Ɗm·8|��B&���9%�r�9��6�?7\�� �(4v���D��B2�Ȱ�d�w���F ��&�"Y̩���ύ�8�2�`��\���jf�63]����^�yC�9�, ��'l��6ә<r��<gns ���G��+�9'�;x*�HSDT��f���.l��a����v����@�Z��2��Y�I�ޒ���5�-]v����d	��ס�ڴ���K��+ù�
�h9N1�q�N�cI ᝅE$�ҵ�G�࡟V�+7��C�������BXv�7�|o�[�ck=yQ�[�)��&�W+ƻ�&Fd�%��͹�q4L_b9���l��ݧ#\ #��/�����w_^����u�Zm(z�|�:2��`?���Zr�BbfX�$�U��/��N4���d�OE���4_���u9�#yY#���_� xp3�KH��VM����w\����dm��f�2	�\dKJ��1]4,�NR~�6���Y���+��)rdd��H�fd������߶���On>����q����"�����YlGf<xǚ�|e,8���7�ێ�׬tNx�"k���RB�c���n�m9��^�n�^����4�g'���ù�g�����~~�&���W�)̭_Nr����
���dg�;�M����{W��턄5�s�N3̑D�4�)�
/)N���a�����In��1f;x��sC} ���ӝ�J��4p��S6��HA)AY�dc��5������\�ꅬu���
�D��*�(��|l?}*���=0�w���8�[�A2"�Jr�&wVJ�4�T�uvW~S� �PM�|2Qg~c��ƙF�a픕����G��@�E=��.r�-u*$��qA�1���ӓ9����<Q7�������g��2|Vf��� �23��L��&�������B�3!�Y��
�}�L�4g7��;�H���#�˰3�J�~�u�
��&��<�</�z���W^U���g��N�O��γ��x�Jz~��?�j�_~�j�`�,������?o���v����?�~5_|�8���'�n�O+�??���E{
ml����ŀ���^�g�NUx�����D���f��g׸�s^=K�?�L��������z��_�X���>y��������|q*����Y={G�Ź�~Ώ��u��NE��6v����5&�{QQ��5�lIv�l{�������Oۋ����8_w{��C�))=�]�t��L��3-�I��+D�n�ؓ���?;�绕�X������g9e�M¦�M�����yPp������o���'����u���A��E�<4gL�6�k 9W9��V�ߨ�;o��+|��7�ލO8'T��.��¥HaK0�7�x�+,3��oh� �X�J�Gd7��8�l*|#��Ix/�뉨HxڧF�3����-$%���ș�+C������7�������ﴞc��z��h���;�g�Υh��2�܀Hk	���L53�kn*6@",'�h�T�Ź,Z2�������C�{�\�!��?�a0�f�?�5�W}Q)�57c�s�Il��Uڎ���9TBN0�*6Y����MW���Lӎc�P?��MA^ȑ����88�&�-g͜���o�a��8�B%L�"J�yB��(]8`;GF��v&dԩ
-?�V��|����znY_�����k$�x�e�-�����c� ��v5��r���H#�<,i���m8]G2�Z�KgR�85�!��}gkS���)x.|d�
@�� �y�E��n�W�f�͔+�p��#&��N�Y��"$8�F�uF�;�8*�Sv�o��wn���h,�[�����nR� \p�ن#_�@V��e���<�d���p�&g�&)Y�z��.���
���R�EP=�>�pX�ӱ�e��6W�s��`���H��&��]7<�Y⦉�ٚ>�\�T�i'��o�#�ٗ��ˈ�]H�����G��F��(��5�ۯ�Z�|'p+MΣY,9P�)�u�i�f̟
�<��u-���9۾�]Qq�$��������중�^~!�fd���N���F���j��o����Y�I�	&�z=gH4�sPC
�q��r��G�D���D����%b�Vq�p�`��.��"��7Y��(
�vaU7��$}��Y"�Pќw�N<p��N��)��R(�H�����UFy�����������[<�D��_���� ������k݅�c,�S��w���:X#��aq�l����I�Q��]��ڍ�����0���WuK��e��k��Hn'�[G&:9�8A߫<0�-��c���h���{�l��[DF�\2�%�F����&��)4�'{�{�U���D�<����_0'x����4OYw�P�)�-��T]���~��'M�x9װ]JW�k��ls�1^΂Z�܃�U7)$,{6AiU⮩�p�k|SL������M�s���ZB�=����'�>�v�"�|C��r��%��4Ux)�)M�d�o�� 1����ȳ��x�+V�!3�O���xz��ꀕU��i�����j�/�u�`�n�4;r6(�Ga�4.�&�s�g)�7x#����S`h�~a�c��D�L�Lr.u�ꪢ��QQ\�����u��K�f\-�%w"v�>XYrԱ��#F�g��&���(
ߝ�aJL�?v�7�7xEQ�*D�״*�A7����G��ܰj㡁aq�Gd7u]���B
�
�t���9�b{���g���uJ=�$;�\�,��av9.�Α�׶���=��k��c���q� �Z2.�zU���dD�'n}�5�3�[�"���v�?h����9�X3�ʸ�l�i�e־�Q�9���xƮ��Fś�_]q?z�USl0>���vZ. rA���Έ�&�p���"7xƴ��1����;�^��=��P�x�\g�}ҸG���T�mN��92�:r�	�NW���D� ݱ��xuV8ٱU���l�v�xCj1�}D���aD)3v���h(n����c���M�&������[9bb
G�s�1�`����.�N�I���i��ܤ�X �(�P�r�R�������n1�jDv7 �aȄ�|E���8Ԯ�!Q��Z�9:i�P�go�Q�*�.�I wl�G�ta��+�Z�"y���� q�-���[�h����8�_�h���Fd7堬��b�:�^$^X$���j��Β��-ى�33�s	{�J}pM{:�o��@10�ڽ����\�� =�ds�,� nMZ�kfNݫ8"�&; c�X�7���X%�g� �sSD�Q�r��V����B�%�vxg.�� �� t׬�W���ܪ�']0���	=����&UN�k �*����T�Qn�e��ܓ�`f���G�R\m!ʔ˚���>�u�    ����f�!0����_��'n3#M	li��	?'6�PD$f���S�5���Mn`�x*����k様K�%�s�8�j\	�#��5�Má������W�.��fmş��*V$�t^�R���:ֱ�x癩'B�[��HZ=bάQ�i��i�l�F4ij]J_�bZf3�Gͷ��7�3L2G�f-M�;| �5Ƥ�{˱�l�������#î��w���g��Qg��_��Ѥ�f�8��8���Xť���-�Kl��P9�3�K�%�eL�YG+���#î��w���s���3m��/�:h�D?颙X��r��`��I(�'ٷ\F�T*14���3i�����Z�t�/��ydص:��ԙ=��5Hm���V�(���ص��mwUi�\^ٗ�
�,��(pF&U�`a+������XG%�Sf�}��w���߳6@��7�Ec��Fi��ei"�#��#�$T��˜�#nsҁTF;C�3���E���f���ɽ�\�˄v�Ϳgm��H�l��Z.^k�(�d��Z�]o���}0�>���N�:D�M��p[W��c�pm���&:�z��,h�Ȱkm�j3_�~p��6�+��[mh�DY�{��1uQ�����t��j����C�X#b�l+H'�T�1rA�G�]���Z�? �������r�4I�nV	�%���j/E-�Ĩ��b�[�%YjaP�OӜ oSJk��K�tî��w��l��m,_k�hҔK�I++`�9�,9�&�P����V5�ӂ�(%7S����YR2��<���!��k��a���9��2��T��|i�r��Ŝ�4�g��𽎓�	袄>)k��ja�w�X5��\�������U�b����I>.�|��u&� �E6.
�j�B����ŻO ��M�¨��>.9Y�Ƚr�hjZ�X����Fs��ӊ���}�R^�X?���N��:<͍����,FTF�a��J��L���"%�9�ݒ�vה��{]Զ���~�"3������b�5X"�5ײ�	�rӻ�l��
th�-��&˴�D*�5&����@��	�z�����!�X%��J���?F������7���G��x�ӯ���+�|t��xۄ�4mM�O�8�����#қ��{����k����b�n����1��ğ�d��\�j�����q;&�)���I�?�
-��K�W��Oz��a@v�O�T�\G(/b�2��q{����g8�[,0�:%���+&��`5t]�r�ѽ\聁{'����f[�w��7��t��i��Z��܏(��>"��3�{l^hi�&E)�`�8J�z����m��ܪ�`��9�#��Qi��S���1=Ke�^S�����R:�R�O�d-q�Ė�ٺ
sЎk#�k�J��gu>�f=J��	��eu�[~K����a?4s�8��.׈zM^Y��b���`�
����m����W�В�0�&J`r	a���R�{d�������~�����<��E�1��8����z�{��p8y������,4-�j���o�,w��f�vp�o�W�\I?B_�qJZmqvf����=!+ݱ!K��=��K�r��pgT���7Q#�L��ȍ�}y�f��ӛ�/׻b�6!J��892�)�ۤ�=n�g��8�IhE�O&����	��m�¯��V�N�v�����w��S���j.�������JY��3��~S�����ُu&�F���ם�P��6�\�#��L
u��x���$|�gυ���J:K}�-�@�m��z��'���)�7�͛Vh�t��-2��K-R��� �\�˭�.���6��@�&��ݰ]�(��������q<  ��I%e0ě�N��"���F�Ӝ��$�Z-d+��r�����O�4��w=R����Ӝ�c��@yDM�rE5�sK]b֥���Mf���-l��L�P���F y y2o7'ɜ�o����X:1�)\e�s)N*5X??�����V�:��3'%Ĝ~��?T��q��ZӉg/7'���3�ޫW��|jK[�U�`�����y�e�A�L�l-�Vt�J^(l�l;GF^��O�v�мəi�8�po�����J�=��쯊b��Fv,�E��S��b�����L����|�u�k��M 3�)���m��ҪW�Q-q�t�<�����(�[�r}(��a��}P]}$3�:�˩�#��r�\U�D�e�.�p���uEi��g�31+�x05e��"I������sd�5;�'d:%��q��
ֲ���!�.�X�2fC7��a9SdD�'iH��V81Ns�^?�C�	6���n1����ؐ2FX�Z�-��|�r��%���.�N���t{�M�k�:�ϠW�R��㰝�lt8�oDv^ ����x��cr�!r@�ʙ�l�FyF���If=�I�.�����[��##�a�'d;Cv�!]
r|��#��13��|f���h����b��#�<���:�z� f�ƇHV��/��7̇�w!�P=-g�{��+%aS=�ε�}��.R�u���3w�z,l�6���0dΎ�x��&��[n��nr2%͠<��Ѷ�"��w��Y3܏�$_~	�+��+�5�6C���v|>�u22���N�c�:����R��.���ɫ������O��^������^��J�/��2��@��r��zl���l9>��ݡ�ZJS{���v5������"��*�D��7*���
92�7M�|{�=Do��Ҕ�GxG^.�M&�f���*��pn�-�S
b�5�.���2I���˽\2��%��c�#ï�H��m���JJ��<����k���(��'hzl��)��N3�v�~��R�A���[21�@�Rn�'l��Լ�aשy�L��PՈ�w(��5Gs�lq=˙`��t�ϧ���j�g�g2��/�Xԏ��	���Ӭ�=�90�Z�h�B6�z	�����H������Tҭ0+m�d9C(
x�Z��i !e_ߦ��&�3��*GS��a�Oˠ,捫E+nq�����'|~���7�1(:����/���S��������ъ���g��[�u�A�%�;���>vq3�wZǹu����|~�݋g��fI�TZ1��4ưBr��Y�Ir�yN�o�|
����hČC5���3��ݥ��]W@D8���q��j �
��βΑ��gY����dn(�̦���G�6a��u�p/�uH�u%�6?̺k�3:��Kb�v���y���ۍT���6��Y�#Ox�,���փ�d>q&+�hGG&69��˄�͂ط	aKQ�l�Ub�c��ֆ�{tY8��O]�Ӝ��gɕ�l�Ѯ�E���[����:-D�>��D6sTj1UzD���qznS��7��ԡy����ǟ�h9���b��������5|��ю���юO(ڡs�s���lL�sv�$؍RL-�]Y�����l#�<Iݩ�S�2����S'Vv0��ȃ�l�fd�c��h�FЮ�YW=�x҅`G"nM����1$�/J���Qڹ��c�O�x�ܭkDv����C�\����G����-�E+�Z�u|��64�,T5s^V킙N;��-�F^��O�tfD%��%�"߷5�%���-,����Z����$�;�}�nM�����2ߙ[H^d6@�t�)<�`�X�������H�-8�S[Qw���#O�(�J/�Ț�hDl2�˾Wi��\����(e���w�,N�eJX��	�1N��&(�9��n@t���ͱ�3s'+"�����7GޘC@�ԓw�#�퉿5Y9ɠx���CGF^�'~B��4�Ȗ"t$N����f������;_��4���z��uD��d�|��3g����~�0DM��dM�'�PY���`9���Dg����Z�'�<�"�lTjuNDo5�+q����DJ]b��}����)�l;Gd7�q���eSa�-����;')*:������䶈#�t��Ӓs�c��I�rp�w1��̝TT���4��ï� ��I;��G���4 �����    �M�(OQ�%v�. ��r!�ـ'R������5�J��5����{i�q��G�F���,���w�
��	BP(��J��7���E���oW�b��o
�6h:��q��Vd%r	�sV�ֳ�83��%������$�5�P�j`^��[Gd4��LНOC_�F�M;3Tµ��C����)�Skǜp�(��=�8C���;Ig�s��ǿIZ/T+�,Ԩ ��!�g�5��=S"�+`�� @R���b�N����`��T��$��jze�T.����E�|��Zi�'�-����gj1D�(�7��]WԜ	XlVX��	06x�Z5���믠+�vN�Z\G3�;E�p>�wj��D�kfO_����vl%����=��$S��s%��w�����I>��Gy��Bϡ`��pm�.�q1�0"����1Ɖ\��6�N�3#�K&8��.9��td*���0N_-&Q�m�@�����wП�EJSP��Ӎ2_@vN�8k��\O把��i7�x ��cn@�'���lB��
���8�Mε��mg�	,-����F�z�s[�o��'lP���F�t�v�E���m��AvC���2��n��P�d}ҹ�9�E�!��@2��;����Z�Ut��0Ap�w�* ��T9p	=0�����V��ۊ2��J�9h�T4,g3ݤ+�f�7�ڰsfɈ&OP}�g:�T����o/��V@�c���V
4��}��q΍�6�w�9�\$y��9Fg�;9s!��^\��M�w��#f!��0�#q ��T$sp���Rj�l,���tp��2������]��[����<��٨a5O��M��W�E��#��[ì�j'R��&{F��=��].�I1M�9��T��"q��.FF^����	���Ī��?UQh�������W�]ظQ������,���iL	�$$��RCis�ܴ��F������]�|�2�x�	����\�T##�]�OhS��p-�W����XA��ŧ7��+�Q��]�##�<]�w E'n��aP 
��Tw��n7�����r��y�/�Sel ����|y�<�MV�K�
����{�k�Ÿޚ����W�/�6N�r�����eO���lgO,&�	��Vm�g�35`�P, @d�.[�� xlO1SM֫�l;GF^��O�v�ݧ����� ɵn�LW�7�f>
`�e³M�\�]jmD�\L���.�.��7��A_Ns�l(Y�_`-�Æ��h�M"�fy�E:e+a*�
��g����J��K��~��č����ۛ�n��:��q��s�G�N�üBP����g�5>ӱj�g����I�F��)�2�TZ"X��'��p`�^?���ʫ�R�~��{���meb3�J����Df��Z)"��5��j���h8�;0+6'�����6�T��.��7��<#8&��排i��H^Wx�s�@�L?����"ۜ�o��������K!�R�\����#�Ȧ�	���)س�`�Φ�᜵�RZ;J�u�8��NpΔ�Ɔl��D�	"�v�Hب�Zn�30�I���8��"1��'�OT�Q��mއ�JY����ߵV�g�A���X�W�����y���D,��;��?0"�)I�{-eؚ������l�S�yF�<Rx PU^�OP��k�Z�L�C̊����$3��߯�?�u홼jPh��{�:��i����F��o��J�pT�=(� k�M�<pf�Y��@gn@�c�z�I �X��ǐ? �F����<"������_��Pr�S���QʤJ�o����O2TU��Y|v��n
ܗ�8��a�5#ɤ�I��v�g�Nμ�=$.�
Y��d���/P�`�y��DG��hi�Z�}��)6.�2���i���t�[�6"w�"�$��@D�D�=\��/��m��ݻ�x����P���X�zC&Z���݄�E%n(+3�ox;"4� ��-�|Ƈ�ˆ{�g��L0^�F�c�A9��/�Α�ב�O�v�3�H��I̝ �'��^[���A^Yp�H�p���ޭɓ�J�ڸ�����X�*���	�M8l���Ek���i���	�=��U�)��s�Ilg�ݗ����rhxk�Eq6f�8�#Iʱ~����[#��t�\��r��H\��NC��7�����]��c��׶󓱝�p�+�)ʗJ&J��>�΄��K���N�������#�<y�/M�V��E��e�	)L��צ�(��+�W��D���ՠ�x�� �P���#������GD7AY�sQ2�t�/�K ��˷혍��X ��q�A�b�T:RK��C�##��;?!�	��b�B�k�˥�W�墾��ҽ�+��O�c�#�<��o����WKee�h�E֮�a�-S���C�
楨�.+�1�`����hgF}>�i��.w���D�i�
�QUw.���!g<�K�l�3/\%�a���5��(�ڃ���$׵�ؖM���k��	�N�$|\�H�9R�D��#$�Z��9�+b;t��y(,�M�j�J��:�8�Nl*��m5ɒ����c�����aNy-"���enI�l�Α']L[��b:6�%$.Dќ�YI�������"�P�Gg>3�k���T��Zo���7ֻ�sDvSQ�a`k�'k'��gJ�KU�R3%݃�����l/���:�)si뱶x#�s9�]��?y��x��_������Ƿ�;�h,?�s!.�](7S(�j(�)�t�{��X[|s}�/�Zs�!���9u <ة�9f�|T�Pߜ'Qz�{��j�r�����[�����*��ܩ�؈�� 	�Kp�m�2�m��t�Mz�g���;a��r�������4���o~����s.Ӣ�F�59]�����]��qEq$TM��w���dq��q���R[|�z��T5w���A�/�x�����/��eZ��A
,��j���b��pw+�(Q���d���Y�L��I��$3�+0617�5|+��i"�Vn"���"4����rߌ�x�V9�����-5��o�k�p��3&*�V˴F��7 o.��f��Қ0i���V��|�nUp�jR�9\���"&Ud��T�{E,Dr�U��>À"O@+^;PG6�����iB|���L�*YՄ��R7�8#Ʉ��g��#O����S���M�<��LG�Mp�u�(���$7.Zfs��TM1�)�)���`����&g�Jro	ܨ�
U/�9���$�0'�W����ܑ���j���4.-=�����J�]���t�����(�����C��In]�W�Uvn/�E�s�{��]���_�����)'�BG��K SB�<��=�n�P������k�& T��^8�ʄ���F������e��-5يhQ�7�+΁�����j�{��)�d3c!U�} ��7i{�?�!���׶���67K*�%�U��l,_�� aEÕu�jc�7�=kG4y�ݨ.�v�2]q�cd�ٷǵ��gA%��L��HRd��i>F��ӌ���T�Ц�X�$��pC���	���%��q����&�Z��h�d=\�^��u4��)�|۩�L�d}0V���{X�S�t"n؊w�p/����ܑ']�̵5gMF��8��3�eҢK�m��$�4d�+�L<"�I��+@��|�g��"�A����Uc����HG�Y�a�_��;��%�u�J:�#10������ۥ�-��5fͧ�}��o����Ԇ�r�I(G4yR�U�q(DN/��G�X��I�l"�.������9������j�ԲHTCqA����']�/K*�^0c���	\�0�(�t~,�4j4�;d7��e��y#y�N����D�͚r�!�Z:U'�\�]<\{Ν���|i��x w���Ɲ���>Tm�^K6A:@-c��mp�l���0�\��Q/��G4yr�[r�� ��3�8�����%2Nb��_���,��ޜL�#WJ(�7��A~c�w�7�R���(��ʬ��Ȝ��10�X2���    ��7g�|20r�$���Y�����H
���M�Ro
�:�S��O�ڮhc����Fk�pa}Fh����$��V%�N!�9���g٧�C�tL��I6�O�t1���]Du��}��w���櫖n��3��#}��lZ6Ʊ��i@�-ȧ�L�q�l��Y��p������x�0"����ٌZP+g��r��*��H۱:8B��@Js'���R�3����=b�F�1S,Е�?z�\��ֶT���岏?��!<�"nG���J/�%#�;��&� 0��u�g`8kB��*55�.♙D�H������A�+� �nk԰2Z��x�Țle~�y+�g�b=�����:2�I7G]R���<�R���c	�\����4���� �H^;Q]��%�����Jud��'�����n���g%��Y{^�1D�������z�g���=���������#��Ⱦ��Y�s�k����yG;����X����~u�����-!���o����x=��De�\Ԧ���tv�2�����	��Zś+����M�.�.|bb��JIl5����=�3���M�#�]-��� ���_$���4'�r�= �ƾ�߲��C��7�I��0��ѽ��a�5R�v�T�m��e>�������ܲ�u��,�W#�
yEL��3�:�E�R��:�� w㶹�/t6�Y� ��QWLԭ��m�{��q�潻��Z�z��:�tC��2�Pz1�eD�S��5JQX#����H���9��wp0���ON�:y��6*���,YbN��&o?GF^G�>��O�٩�L	��+�V=��M�-�+ˠ��^�EgxD��`MS6��)pp�)|9v*�}����{�zv.oU����-0C���S�G�t!rd�����a�k������պ֥�F��<�Zm��r��gDvV_���s�)��B���y��$���=�-w�7Yq�I��
�ϕ��a��9P}22�:r�	��(���yOrjU܃AZQ�.*)������H��h����vt����d��	�T�Γ*�rkuJ�uv�2���#-@�6����M�	m*١������ԙ­$��)�YSR�W�[k6>�_�����%��M�3 $�1r��Z�5\�~־L�(Cp�kfΨ�]�J���;8��@����wn*�mKF�7n�������H�
px���36U�0��N���8�8Dɩ�Y�$��CG��Ҁi�'Հ&O�Ŭ�q;��H����H�J���{�%Kn#[��|<�l����7����Ij��k�y�uZ����=��Y+�*�2wDT��If�DQ�Y;��}9�}��y��Q���6❙��A����58ɘx��cK��P�m#��T��
A�C��b�%	���gb��0���i9ӝ��fZ�XYx+�lD�U��.7L-�>TZ����$V; �� gєܴ�6��l�<��0�a>Bs�{q�0w�<�"x�8�taն�p��g<�~��[L�L��yF�{�	o;�Si?��'��b��`�<&7\w�[y�sv�{?��$Ğ��1����(�Q���P����P��Hhs>5�'^I�v�l�w���=�i[��Mn��1tO�5-[t�l)������7i�t�������PD���J*��o^�;�Dʸ�ci�9�DAsǼCm����ϊ��ѧT@�x&vOivl*ut���P��>3o��B�ɲ�X��� ��$}@Y�<��i(�̗{MC��4��'�,Q��f�lޭ3k�a�9�.[;��J>��Ⱦ��yzZ����=kcO?aA&̔Ԫ�I<T�+�^BQ���O�pp��
�����w�D���e;��W�mk��e����Ҳ�-Ժ�s<�~�����6n2��IMF�TCס]�p���ϭ
�U��T��({q.&8�lݍ��k���)�lr3�W͌�^��y�U�H`=yS�g"��Paj�9�00��������~3���	y�^$d���p��)sF1,��+�4_�]�"�պg�4la@9��̽@N\mI��5kl�	y+��&�}(!�>QB^�]t��cV͕�������o3���9�)���{��?l��	Ԛ�]�4��y�n{�.����H:�c6�%~�P���aCe�E��*�XҘ�M9�r�#��gLs4ަUy�6���b;�Ms�~��ﰫo��f��yw	B�ٳ���	w��V6�D�=]�3j[N�:�O�.	Zf3�t?��:H.Q�[;\5�"�l�[7T��j��f�Y.`���\�	o�J��[���z�kv۵Ͷ�S��n��s�Xɸ'�|��N��b��~���{�~s��z3��V��=������n�'vͳO��6�.�J�{רda���ӂV;#��&a�H��22���R�I�����ҷ[0������Cİ"�xc���Q���Q9����f*�ܧ���e��U�ߑ��e:�ˎ�˹�IJ�ʓ�))_P��U�q5��C*$��I�#]��P#ϖ��.�����N�� $4 v�;�����}��s��N��M׶E�$�Y� �P k��f��~�+#]3SM��nI���nF%�3V��͟�]幩2] ��N#i+�ۚ��i�2���htW�ҵ�t�W�N����^����sIqXx6�Llw_��{#������2�L�Xq鸾`e'o�_ÅS����݃�멋sݲ�י���f�yI�if�gd���3&��;ջ�.#F�ҝ2B�;��5�*��:(�)yx�B��l���a,{Et�ｸ<ɚZ`!�KUu0Z�nD2}Ì3F����&��� �ÿv��=��a���s7��m�:�&�8�r�;�opZI�?Y���� �dEB�v������v&Н���R�U����3�t��'e�co�F�U��:�ӻ�����ǟ���q�I�#O��	ܵ���}ecm�Z���]�M� �.k���D��i¶�5$��������ɐ��� ���k4�C�y�h��Kv�����Bnp�����̻ɻ�����g����XAX�@R��؉5tr�]f�j~ʬ�t��9'1���. YÈ�<T0pdK4��G�H���_�e�L3L����̗��O����X��:{2\B�'u�+�ے-5@�NU+�j�l�Ï��n�ɋ��g�˲<��%�����w��ȕ��m�������_kd�m�H~�!~� �|�j,ߺ���[־'�����w���g�w������}1�5�o�nx����;�c�aa_o��VSdi5����4ի�c�1s���`����G����Ԇ����>��2�?�!猧�Cvǔ3+�ڬ�n�[��c�u�pޛk�Z�WowAXgb0���d���0��9��I*��[�u|����^��Ƿ�+r�r��2dgGq��X�	U�ZM���#2c6����^MC%6�n���%����Yx�5��%�N����TM��=8S%G��k�8-��왊��%�_�a���N�R9�OʇJ�Дa}:��'"ê������(hH��LU���2C.;B)�����t���.{�����v�aCL�0&�_���}q���b㕝��&9�6Ta
������N�Y���|�D�e�oR�32�̵
N�^�0�崣�#K�0�u��1�5��>y�j )rb����	C" ����qA�1����6�N*8Յx}BV�M��k#�6�k�V�	���N+�P�ĀNvV�l�#D��cݹ�����tgO����5cC���W%��|Z�8F��ȇ-���C���7�}ׁ���n8~d�올�Y*���34��5z�(,$(���f>���-�KF��cbI		��SrhS�a��*�>SW��֝.����Y��l�}��̗l�4�V��
���{�ݡ��fmB�z8�Ī���9t�O���<���}A�3�=SF��ķ��ln��Iø�<�3~�t��cZߕ�������Y����RU��;u�>m�<>�\k�W0Ų+�U�`\�|eh%�b�G񙅑�u'��[�J���7�"��z���fb ���Н�NMG�!g�.�Άa�ފ�4���    l�%�Wy��nL]`_�w����yn
��r�"H�Y;�!�q>F�
�<�h¦Ln.r-�t�̣2�G5h�Y��-U�"A� �4�/a��\�x�O�����j�%�^��p=��#y2��g����U�}z!�u%܏�e����R�����O�� ]$FL�T�:�%;z���*P-����/�guĭL�4�Y�#w|U�I�Ԁ�oY���ca��T��~o����υ	mq��MeK��~j5��Qc�jt*��>y%�~�����Gb��ƈ���6���a���[�;�^�� ��k�Uņ Œ�NE�g�.�O�%�>֬ɂ�c'�f;y�ݥ�'S6�N �(���:[f�`ꏫ��*�K���tV4:x��Mʛi,��p�ñ�>=���mc�������m�6o�L�}gD���d(�Z���]a�t^~�a*x�9y�:Eu��ҳ8��STެ����7,�4�$D}\�� ���iVU��4�U�V�h��;]����%Y�:y{�qSU;�ݱŪ���<�z��Y��0�=]?_�U��f����u�k�%�l�a��N�F,,�N�L@���]�������l����!�/S�n�L�;�؟}a��k]���Y�I-f&�ڀ�lFIM��2�u�\<<����mc`��oplő�V6BA#���D�G�p�F��o�*�H0�T���̺�;W�|՝_����&�27�eE�`ܵw�%ݟMw�t�:�P���-{�R�Y��:I"�- 	�j�!ESO� ��޼�����������ښ�\�:��H��9;��� Y-'���}~�}���;�>^��m ���Y�@�al�T�ߛǿ�񨴚6���og��5[o7����g�s��א��;��A��v�a��Z
]�Vz�����br���X+;y��ւ��z�خh�7BA��jC���[&��GΕ{i�N$��.����N��+O��/�PYݜ%NLX�QcCX��5ӽ)��gj�YUʜ�th�Vv�&s8�K���٥f��c�yrvg�±+�~�3�(@CEB���[&��tMiP���1���i$�To,7p�u�Gt����s ��s���+�ۆ����&�v��	.~�)4 m���P ��[�_ tw������8 ���\������P�+A:]�ǚ��Z񣆊�|W���4*�y`o��r2�����3�1?P����P������Y��wOZ�wOX��F�����;�|�m�Z1�-����]�>op�u����8���!�FJ�_g��u������2re�O�V���Ѫx\�֖��1�,lVK*9ƴC��L�]�*�8;D xo�U `o-��f�m�I�U-����׷�o4��N:.DX�̄��re�I�F���J��:yb�x�I�A�� k!s�A}z�zVo�l�v�f���b��ǩ�+��,����ɶ�.�	����,�)���Q�S�L��Jf08���B�Q͖٤��|웮<�zY�����j=��d��~���0�v������'|#�b�n��ae#o~�>}��H���ʶyl���~�|.�G��M�yV���R�(#�E�ҕ���J!I˻򤙽-mb~J=�Prò�¶��E'c���+��f��eo�$)
:��!+�d�6��z�]��:1`�!�b%��a| � +2�I����z_��y4�RTÈ�k5̮C�N���$�X�#[&��L?@-��-[d{ɝ�t'�EU<�3�]-���)%Y�jnO?L.P2pMj�"g�-^뭌t�;Mv��*;�w�,�ȴ��|�z��[0��7֊�68�e�[vo��;��H��{95s!`��J�:e�ܑ걏R7q�������ȼ�l0�*�e���)݉�{3����e�=Ic\��6\�_h��׋���و�"c�q"N/�k1-FrVU�s�0��Zv���c�_�^�:k`)F��ٚ�Q�[[����'��Q�C}O_TOfJ���xO�b��`�Z��]y���3���JF1����ʓ�H�KBBi���}��Uװ�JfOZ,e�=��s!!I@BY�㬁����.9��O�Y25{3U8�8J�5�~R�e$k8p�.c�K�M^�
��pRgHKe_+��}�yݴ��^��t�G�2�m�(���Ld��h���if0���ޱ[�t=q��`?���������0�lUXQ ��Xloþ����:kv6E��`�ݤ4;�l �\�O{'�>Ũá2�X����͇�x�U�y�� $j�j�ދ�>b���bp�F�P�:���$bw��#�T���@��?���oH�����X��64��VzT�
��?M7#,��ν��'c�l|j����c*���7����ۿU���o��v�����Fdt���q�}���y���2�M�2]����8(����wL3�شw{	�DE�*Q豤Y����I
�ʓ��/���bgO}�|젇�I�[��x���t�ƙK��}�c���7������i@rw}���nf'��Sf�f ��3�(s�0�PR*��ү���."�����*	�E�T �٦�+�uMS������7 ����j���p�����yK�d�U>t3�e�^�ч�[Z��g	WK����F-�:�'���\y��"�ҝlGN��'bQ�C5l���9��B2�=��C���7Sz�Q{�q*;�h�.��X���}ڇ�Ѵ�5��4�V�f cir|�V�|=T_Сrnڬ'y �#|z�^�2 9�Z��&�\3��6��L�^���6&�enزm�2\o֖t��,�2�L%��qҡm�%�G�^��X�Y�
�����J�3���j�)��Bx!�vnp��Ȋ�6Oք�Bf�;Ϯ�P�tji�B�2G�8�u�3a48�t�9ۈp���G��;��}a���î���/���;���}�����&v�0Y�����P���jt�����F]C��=��Hlq�D5g�#ư�
�DN�\1Q���~�ǿ�7����"�(Y�����-��0�.Xr���Z���Qo�W�6�+[�����ĳڷ$=X��im��}�QLn��������2���$�Y-Ͷ��WW&�a�b5����d���N�k����>{d��T��K��h�֘�t���P��n��_����>��oh�n& k���l�I����l؏)�J��y	^N3�[�B��us_����*eoX�s�6��ل:�=�|]x�5��A��̰;>{�D�>��!H��OK�qI	߸pa��1���N޼�0�`Z�T�%��Ns�7#��䪼h�wa�0��Y����.j�ZO��H��G��H�w7n�f��H�'�j۰.d.P��cT@/ ��"ƑKԾ��fK���5 1	s�*23�P�T��nš��+nK�r��\܇PhA�0�3�A���"@��)�f�JO����~e U2��Q��L�`�{b��D�n�l���_��vedoG��b	�X�b�ò��n�	3����T��^����m��gZ�S8魷T����b�6��榚;7j�6��'��*��_�b6�qo������5�+{��=[��R�-��9{��&�S`���$�Ϻ:b�{��)�<�+#]�˞�-�� VC�Y:�fX�:�ӺY^�ES�ƻ��dW;�<\��fƀ���d�āޘsx�)������Ů�)�ε
��;�/Fw�)�ɱ}Vd	� �1���2݄u��������_����i�Qǣ�Mz)�ɘ���+�cN_K]g^�s����*6yw���1�=��<p@o��g;T񒽑��ꕝ��X����SL������ܰ�>B�ҩ��P���y=T_̡��j�:�L`�����J��mΐ�sDV,�`3L���-���Q%U�{Cff5G��e6�<MQ��Խh�O���/k�-=w����F�B���l\��Pu�t5�:�蚆	(?~#�"��t�[��fCӭ�Lz��=ƛ��3Wf-������/��XSKS>����
'*��ͬpe>zd%���?A)@u`a:�Y �}�    �%E��?< 3�2>4c��픒B�6p�j������dfCv��a���ƈ^fi1��c$�����7�[�X��m%C�LLI�Oh���Ǡ�*vTR|$�\���U{%c������.a���	r����&|�����?�n8��֗ ͡�V&�E���vR�M�F�l!l�+�)�|���a�H6�Q1�����76�(�=ޣK����²mL<6_+�ڼ�5�<�xWR_�w�}��:�\?�k:X8[�)1;�-��QLH�yI�|��v(qSa�ER���+�ڲo��0���i��d���pKGv��^���L�{::Jc3(rkL���؜ze�k[�����ܿ��/��m�7�H���m�t�����h ��z&���@��MN�3Sa�`ʽB��8U�8paN'�>������f]�	J������}N��cw���M�d?;��[1>��]{��Sr�����7�8�L���a6Se�	���\U��`#���Lf�Œ�ȕ�Z(��X�E�pN����Sqۦ�pZ��㒬�ym���wk�i��$R+ S��L����9Y��A��0P�R�G���x���?���ե��f�yK�&������Ut.Ǥ؜��sl�6E�^�m�8=�U���� |1p���Y�dM]�X�VO.��|��AwvQ�5�Rλa����0G�]��=�ݎ���c�䕝����^�]��='&�,\Oׇξ7wʍ��8 ��c�dU Hf��x>ԧ��%�+#]����8U}���.�$S��$&H���������v�92Oժ=	�>���~d>\��3Wd�y��K�'ug&��uq��ʨ��}V���IV�)�k��ѝ.�n]$c�]p*�� �hoLy�n���r�Q8�jZ��>�\Ü���2h��f�#�$rZם���l5��� _0�H��dgYBWF�.�s���Y���	��j�YZ}Z] T_F���K�\��Wd�1���n�x�RJ�R(�<l���Mt�u���}4�E(Y��>��j�L��u��6�'��)���է������¤� ]c�x!�*��Y��#%چgϜ|��]�Ll�k�'o{�����aݸ0i�kd'Z_�/Ljs��NR��N�g �ΖX������� ��\c+�b���m�p-���)����~���1~�!�����@Fgw�WW�����z����^���%���|�G�7�h�xņ�0B���NCMLF[�O�[k�5���P1rL�2�m7ے���(����_7[-�UǨ�F�7ؙ>��&鬺�F�5�[�u�R` ⦲b
k8��+S�\�p��P�1`J�=��Y���?���7��������+_f��7L���w6�AI°$g��ģ����a���_wfxGF@D�����+�t�������VC���v�x��{��FH<�9��J�]ɡD5uN��,W�
�ۚ��$(5�j�G���5]O��C˱��M����o ��y��`{%v�9�B���X3����,@�߫h��N��{�"X������&�ٱ�@#"B]u=�$]y��ndmQǻ�FhA����)i�yu#nd*�lF����2��8&�5�s�|�JZ�6���k��&Vv�딘&=0�hZ��+3��y�k�Ч� � ����H��iD 3��v��7���+#]��k'��J�[g��Y��W���15{ͪR�^<�B�(��� �%Q��Zy����:,�`wk�����O�ፅ�>�:2��
��-��%{��C̲ ��UN���>��hT(+���R�հWۃF-85iYa���%�2�$�?���y����/;c�[���2|y��~�ʘx�>���c��	�4ޮܓ$i��[4��1���Q� <���)�c�~��4ck^7�8��,�u���G���n�?u~��O��7j<~����h�S���sH�E�)pƝ��k�FY�S��'<����\�*��ą��]	��6{d�F�r��\��r\h�"�-6�<���^�]!�d�Iщ̫�bX���dt\W9�!�f�$�h��G��F��W�� �]0�T��ljjHx&W8Hj����+|��eخ��<�#	V0�	M"��%��W���0T�F�Wo�a����p2���7����M��k��L�b�r7N�x�`�4�#���G�~\�<3�5�����Z�"���׻���ݏ���hD���h�FU�N8'*Y�u����"le'o���FOؤ�]cS��`�����ص�`�f�#�Qƌڠ`�Jk�˰m��ԭG�(#]�,�~	)Z.:���܊�6�glegФ�{%û�F��v�~��l|�`��5��ѝ���������j'3ܡ�F2��+7�Н���Wv�f�����(�c����&�E3��O�`O�>�qs��k����%L��;WF�n��D�%�N�lp�q����
8��o�e�Qy3c�K�e�����,�>�bG(�@�/M�X�.�!���o����e������q�0�qa�[���`c�͗���T����ާ�P��p&kU6.�x߅���q̇�c�����ۿ?��oX�}���Ƈ���̷`F캋j.d�
@Yj���>L2�g8�D��~�*8��X��i��`�o ���re�g�+=���~��wx�"�غsG5Ip�\�
���1��ʲ�a�:p6I�d&���ê��V��f jC�@\i���W�lq���.}���00i��ǥ�+k����(�:lA����T��Q��C��`�������"��.Ȍ-?>��V���Y���ȱ����;��]Y��v�kIU��湆*3J-�F�Z�ww���X��T
�;Z��=a�q� �d��>"w_x������_�Cǿx��K�o�0����~���t��>�Y�������w����������e������=��?��_�.݃�d����R����RY�����w��ﮜ���7��Ȯ�Co���D��\i�g2��j�$���w1 �z��=7iF�)eC���_�<��7g��Wܐ(� h�����y��Y��n ֯����X{ٗ~�Te�R��R��G��Z�PbPY%Y�����i�Ji���z����
�TmU�Wfڕ���;Ɍ�k�3�?��Z�ɛ���d�SO�f�ڂ�Ԭ������lE�"�D��Vf�j��R[�(\�ʕ�}X������Hcl��N��m�:��q��=��c:,kX��2d�J�^`hh&���N5�{ϡ���W�)Ot���k8��ѝ��`=�ə�c�w���^G�i��?O8@�gO�%Wv�Z5@pN�Lݚ��w( )1�FN���1ո��TY}�!�@m��.��c������7���O��p��C���l������6��7�X�c"2��#Yi��K>����{�]]о����_`W����ҽw3w/t}\��[����}��n6<��lź��>�&���7��,��b����I�M�qR)S��V�'��5�0����(y''�9��ѣ�&7�b?p������;�o�c+Y5��Zm#��]sjf������鄵���
�v�>�f$�EeK~�\pfk��<��Q�ca�+T\k�#����0NF��,�=�ˣ$�ON�}�ʙ�Oŧh���W��M���z*W+�	p4��ZE�h�3 g��F�u#6+_����:�0�s/i��!�х�_l�=�Ձ}��37V��荆}(ӧR�{?�h���]��[o�96��^���XTӺ�db2����MQK�Z�+*�ϭ����I�	���߾^Բ0ؕ�%띰�i���h���q�	zײ��U��U-kQ�V�d�U�x<�s�"�-�[G�k�J�]*�m�jC��K�&�^���:S�F&̀M����P����?T��o�@�!ڿ=%F����d�1�_Y��D['ە��Z P�~x5��y�����z�W����`3`$S���k8�'�+O~�J˦j��@FB~{?X�eDInư��J��q�y�n��3@/    �L�pB��lJ�ә�,�F�xlY p�Wv��َ)逝�CeFP5[��`�z ��wt5�~moF��7��w�xzO�;w\˼z��:ۨl'[�T�w5�Y�d�3%�7�w�w�Q�՞�Cl%pfe�9�t��v�����K�ݿޮ���7������ʊ�7Ӭ���=zV�b�����l)e��kf�,2�ZX��{T!m0;�2]�
Y�^(u��
jVF�Z$[*k�}s�_�� �&UL<v�Vd��N�{C�H�>��J;�F����yϝ�B�zR/�D� �bД�ߕ]�tn0�<ȩ�b�}�܊k�V/D�-�8+;yK&����jβR���rͱU �zz<�0E ��t��Re���,���1�cMw��t�\�ìi��n���5'�b.�g�]ֿ�)ᒄ��ۚ��`qp�"�
t ��2�����S4�|�pݝ'=��&�-N���S����)��b꣺�� |5G�qj�P&O�� u�)���I��3��៦��2nX_�SXf�I1��,L��jn�Ň���l���^		��`�+/�c���4|��-�jLIX�-����<���a_�M9.�_��[.��1�=��?)�on��#�9ꧼK����g�i�"N����y/+�A�]]�D�P��o}�����gm4�.��̊<,Sm�P*+�� ��t�ځ��rg�D"V�a߇�ۇ}���"��I2͓Fj���d䤎tego�j!�����w  LͿ8�x�3ՈB5|�6R����vա�%'<�O3qc�����ju	��6���T�q���6��8��t�a3L|��*��s��+�v�w���߿�ݩ9��7�h.��M���s|Ln�2��Go۠���N�q������U�w�ۺ�X�n��;"�]�T1�8��MӋ����w�7����(mot��7��2ܳa{
� ��y3��U�j=8=��l��ѱ�n�o
��\��X��Ra5XV#�X-����n+O�ޒ~A^W-��t$�HBӐUvx5�Vm���\��0V㸮se'o��������C3��Trn/wa�5����/37�u�d���.6�[�!h�#�Z�QZja
P�e�![;�)A���C�ǺsEv�������ZE����T�xll3[����3i�5�eQ��[˰X�O�Gn���~�w��_w��=���D^Fw�X����6� ߕt�����%o��K�#�_��ԓ�%�����q�!0����U�aN�a����O����gbl4t��ҫ֝��f�|v�M(j�k,S?��w���a��N�lk�X���X��J���ԣI��{�K&	4�Ñ�$��8��*�G�;Tl�tr��|�7��U0b�0^E6#v�3�#YI�^G�a>m��>k��-���~ga#o�g�N`�<��hp5���m��d�Sҟ��d_Y7�XYE�Z�'%Yӥ���ߣ������w��g��Y2ѷ\f�$�u8�Zޖ�ɭ��P]�	���7x�Urxp�:t����� a3�K6�Qf�-��Zy��_����K}0p�b��n�y���9����|�����9�3�̉��9��]��b����c�<�\"�
nc�����C���������'U�[�>Ru�Jny����T�M�1�b���e+{{���\I�{g̠�a��n��.[���W+�K���H����d�o�e��8iez[���\�*����VUG�Jg���$fsw�o��ZP��(v�a��.�{�)��F2��wߩ��#C��c��fQ��.��������"uĚ��7WH��U���&xS�M�T��C�=wq��]F��H�.��e1�e�+��l�z������)�l�Q�,6%l�/��˜����L+�c��h$e�e�+�؎�'�\y�~����c*�p\�^U��Α�י�K˼2��2;���u�mLltQT�����X���e6�"&�|�}�"�mt/1E(彐>&B[��"��4���-�JV���Z>�kL�ъY���V-EXiY���Zl[;4�i����_r�r�9{a'oږX;S?�68y��[@?XP�f^az"���ֻ����qN� �J�i��Y.�G�\���~��?�?�p�(�Ӵ2btN���3�4`^hx��H����r��1{fj��x8�n��.@�L�R����1�f�tz��H�_�#�����<���c{���L�;��-��+��H<R�f�*�;���a���棺Sbqk�5\
�-�ajl��j}�%��@Q ;�x��&�I�A�E6��Ob"���i��?�,F������2Y�.^������`S�jI�
�|�����?ܰE��..f���N?�em����	���R7��-�#�� ��l�
�+��M�p��_m!�2������繓_����B.�Y}L�"�����l�`ј���ɬB -3���3}���M��T���9��Y�L��c�he~�-~J����$b��h3����5\fh��Q��5�CfV��Ns��Ԃ���������-/,D_��p�u� �-��u
MY�c�A��*��C��>�R*�0����i�V��P�ӭ�@E׎=��'_=�/���҆@&#�[kI��s��=�����<a֥;��^�ɛ�Ϩ'N[�8^|����'Z��6f��_����#��QwfU�ՔisN��J��H����sp�=i^�s�xs14�&we��+Pi  �����p�d�@gʴJ�}�B��+А :>t��}��䞧l��%�����,��J-��-�'͈e���;z�@pVoX������b̃*�g�<��.<��k#]"F�>�C�'痭u��_����	\z�Zr���c/uE0���K`�$$��R����z�I�������	߷���̻�p��tq6�Vk��ǫE1�OY-�N�נ��$�{��@����5�>Z�[��ޭ��${�,mE0��W��d���*$���A�2��@�f�>L4L)B��X���}�V�Vk��ՒOY������M���W�_BN>���lFk�ϓ���E�	P��/��}~�\�Z)��c�����	�&vD25��\��?lC��Ru��R�=�͒�o��Q�\���x�̄�(x���}y��9i��Um|O3pL�?��|����RznKx1�5r�_��6��C�OI��Ǯ� |P	��s�Ư�����E4)����D'U����sF��?�(��0�Z;����΋�Z��������%CQ��.LmK��)��a�]�X��M<;�@��}$��Đ#5��3���4�舡T��2§J�o����:c�	xef�- ^����=���*颛w��oh(W����0�dL�73�A��IqO���A�!e���'�ouUd��)v�%�ߚ�'g#��2+;y �C���3;�<`������#�],/�a�b�}�b�v)p���|�:s���0�mtۼ�YEKFa;l�#dou/z�r2i��L�՜/s�3W�g��+b.���4����HW�QM�Q�*�tU�ITeG2X`��?S��q���<o�[���;��9��nG�+04��}��VD��`���ɠ�@[KW��U�7It��V
h.t���>d��8t:��՘���B�����pI�b���-_3��)���Pv���U��"!�cշ"�m�K��EHG�k@�0��C/ݵ�?��&�0���5�ðgP1�H=�h�"_��HW˜&��Aa��&*+o�8��,qz�^�2�o4=�h��KVd�����~ggݓ��yނ��39����FZ�|�l��JU	�����*�̼��F�Z�8�_�� ��~,t��a��{˜..�x��d�AU���e�{�p�#��%W��qj�m��G�;�q¿2Y�4�K}oS/����t�̦��g����(w��`]�Y�C�y��9��Z���"ZUg��S;#X1�[.���w���+��L��=+z��Is��j��=μ���3�,���g�A�C����X=L�Z��&�_�U��C�XpJ���    �s��������g�z7t���|�����4�N��H׹@�D���䚌�(ZC�eM���}�Κ;�謈n����6n��+)�[�Rj��S�⛳������+�^��"5T�itVF�F-��֢W��
�{��U�6&�R����/a���b��a^���Ô�j��)k]�֝�i��m�U�X�0SdG�&]W��4�H�׳ =�qFA���G/��$�"�)� ��&v��ն�(3��e��㲫�G̼*N���Z8�V�"ŧe�y�P�K��'����n]HZ�c�Y�4�;��u;6��ӌW9�3��1 +Z�m$�X]ݚ�\���.	*��2�|߄V�Y>SE�s�N�/Ic��yEv[�m�,N�ɐ#t��N��1��m��ݳ������f�d3�L�YY't�&�wd���£�"�?��������~h����㟾������������_�)������_A7��~�܅�X�=��~��k��=5��U����y�T`M^Ȭ�j�5��8�������+_Js��2���]��$s�N9��ۙ�TJo��>���x����?8������8��%h{�sma��d��l�B��tO��O|������}q����&3�\��Ufl@���¡�2��T���Y�i���D	�bZ��6���	���e�M�YiWS��z����[:�Ĥ/��F��c�� ����R�o�����s�R� ���1�ʌ7�`m;Tkh���~� �`j[���U�A�Uz��>a8�*4��ƍ��X��3�؟F���[�z��+��+���}VæN'���3+^�d��5<��g�{��Cg{�T`O�k�^�+<��F�Qr�u�A��7�X��6B�64
WI�%w�J�\=cN�A!�����\��L�bz:Δt_�F^�:�����Y*��3�k����*�Čv��i��8a��r8��_�VZkù ��8p̻.-j����Y�����yK��w��U��?e/9;1�;�θn��2��z�����|��~�v��<���r��(j�>}+��ݲU��o��k�iR��4���X���Rl^�r;�\����M��x�Ɩ4;~ۡb�}�˜�1�����g�(���!v�k�1 (C��gy!�^�o�I-'����Ƣ��3��g��h
�Cغ�B_���C��Y�W�Y�J�d�A�)��0��+#]-s-�x
���L�&-4�Z��L�ռ�?��������+��t'��{��',ł��U��wo ���ʂ|l������ª)�Ƙ�툽��b�Gfza��0 X{a��j�0m 8"��8{2վ�eNL�N�Z��m.{��ؤ�5O�#�{	6���$��H�z�z��b�_����2�����p�	�F,�t�j�~�9�È�{wʺ�t�z���Z�>�2�K �C'sEvr�12f����< F�,�)>܇{W��
�f8$0�0qa*[ԑ9��t��V�B�m��f�S������zH Fmt��#�1֗�>�����HWG��>+�*�s*o�^��۾$x	ͽ�# �E��9 ��L�� ���v�.�&v�.N�N�i�)1	&3fc��9�Ҹ�����t��f��HI2�_| 䪘��:�8�,�e,�3��rLY�"��dX;���,�	��$�u,�F8϶�{z���t4d}���+S�^���ਓߩjNy�%8qI����������Ό�Y@�b!��]��QǱ�'_c�_P,\R�Y�up�fժ0��T�J3�i�9���ű��q��N�l�&����*���6�xy�s�4��� x���T�[��F1�l���|ɕ�����aW�œ!��:sEv[2K���(���^������]��:��H25��Օ(
��P���g(C��Е'_u��;�D=ȰR���]�@�Q��3���\��[R��q�����%��7Ū>�<�B	*�i�3?�	<݁fuS�wc#������Y�XΫB#]�N���ER.Ô�N��}V���R�h�E\'r7��Q=��mY�W�å�{��¦x���E��EĮ�!���d[q��Zi�OSP����<ԝ+O���/Hwf����{�m�Q�����3�ȭ�gӝ�c�u:+;y�u���2X��>T	hZ՚c�ъ��������c۷�W�Ef��d:�Odw�g	��=���e�,���rw�,��1�n�5�����w�}�1����5�w���K�-�h~o����y��RFK��cT2kpp����〭��c��?���}���t�W��λ���;s�%���7���lŇac��wvD��Cϑ�3N_�@����������0����o)��g(Y�	Z�-�V�-�~�/��k(�^Vo�_�u/����$����[����JbZL�8�O������MO�1@m�2�IWeآ�h8r@�V�^%'?�Г��m���<*LY�R�?-Yzt]�0�S�Ü@^`������,-�=E0��B9�x�d丄pEt�fc�P��y���.��Z�HN��d�m)^-����T��T�ֹ����ו�?�z�_�OToyJx���[*��z�9�����F;?V��heɶ�J���IK����# �:�<Z5�)����P� ��A����̋�6+#]�����;�5�b�T�-0ݔ�NҌ�<_���B���>��]�����'� oȃ%�z��F*̊}Z5��q�����^�����z`��b��H�D)a$hJ2	L,s�d��!�t|�N�=��E,��dk�y�VD��������.�v�[�����dX��u�������%���Լ��ta�����2��*���>@N��S ��W� m��E6ͤRq��%�$�Pg��n�>h):��e�ڒ���<��tn9�N/&��3���-��|�#���^fQg��t]����1��])����{��jz��.��6�,�n��7``�Tf�8 ��ZBg��p��Q�+F�P� �� �ׁ��.Pv7f��ae��̹�f�C�������
�ߘY��^��B�IL���t���"�-��<^Giˮ� �����̯��t��4�����q�wfO؞"���/�救���G-�ت�ؼj�/AA�rq.�r+��>��b��m�v]��6[�;�hhU+�e�$����>(+r��Y���me*[ɖ��Zͽ:"Mvh��vb\����B2�h�$��e�=$\L�J�dM���_�t#]7F�ݶ��N?�kZev�i5�a�h�/�ċh�����6�v�/*23؅�G�(6pƉ��2�V��:�Áh�am��T6�Eot�+���_tL�Wr�V�?��h0H��n`k��vU�Io �k���v+#]m�Q�fǬ-�"LA�P|�Iz|����,6�;\��ms2E*Y["3Ն7*�i|�����G`A�?�# �d�=�+S�,K�2�>;*��؉ '"�f�2�y������*i,�fכ�Q�E8��gp�/ka��# ��8�u�,P@{�pjs�u���&r�b�I:�충aEftp���">fS>��5�>'zE�?�# �����T�8��zŖ�$=��G�zV�>��0���4%�1��rhl�3�SJ,��5��H�%���4���>�V.~�:��Đ�EV�z���^.�n�>G�3�`	�0!E�����C�A��#�P��+�����+}9�J^�
����sEش����1���X泥ɳ�.Nձ��������uk,8y� K�89<�>6��ӻ�Z�5 �%���:�0��j]ǐn��WF��GY*hy	�Ӆ�Mrr��"��O�m�F���p�cő����Q�AzY�z�� o�=� �������:�|��;��=�����pV̓���N7c���>/w�7�����_*}�΃w�\���p�OҹVD��TF����ĆN�%� ��я��>1��R����e�=~�W��t������{~{��;]���=�K�t��z�5�Z�0?�Vɴ�lj�{���}y<I(����wt�2;�3{�t)大�ʓ�����T�lm;    ��F��'㍛����b(n� �MP�]74�$�F��yz*v�>�pL����9tp�#���6��^fϮ&9���6�P6t:t��YH��G�3������Hטa�~���m�\g{I֥�ޞ+���R�ˣ�j�K��D\d��o�8��zd�b�<+^Kz�R
+�>�-����OF���g#���#(����ȻP�*90'IG���,l�mB��^a��<Y�f%��l�rI�4�QB	:M�O.m�'eޛ~��ӵ|Z����da��4�9F�Ʃ޲c�������J��6�L��gbc|�H��i�b���+��
��c�ӪٯM��M��'&�i������^�ySFhk+�zZ�U�T���?���V1\'$����7�^0pJǥ�K�ES�`6��Tu�@������ӓ݆N+v���X�j	���Ɏ<�Ęp��9S£޲#]�8߆Dl��d�!NL�ru��	��TJ�n���ꋇ�a��a{��M�u�kY��T��k��j�o���JK��;�f�w�_�?��]'�jr`�R����Ύ.TK-X��������,|�}V6�&�u�5��	�+A^�	��{�\+��i�>=���ʹ*��k�B�-^�/�t��xI^������1����LHhv�A����&+������qAM$��T�|���׈dX�R}'L1O���/Hu�d�$�����l��۞�� \�aA����Nެ�1�&��1�Y0;Z;ʰ��g��o晬�c8,`�3U�4���P����������xI^��<,�aނ�1#��Q�L�;%~��?{���qd�~f�
|Z��&J���kkF���%)���Y���X<5��Y��v��=��@7�L D��ꚑ5�����x�W4�||�a�^���l�f�Ź��������9��S��ȳ���dg�0jpDT0�B'��'X*=�b�m1�=���q7[ھT3'y���n�#�5��o�@	�Z:^���>S��s �Y��`�{˥�2���n�I*���n�N���q7୼��XN��k�H�Nyi,9 !F���3k�	�Ш��U���q�P��%��tV�������x,^�����q���l[vΌ<��Iv�D}��XhL��qF�ڧ��j�����?����S~gN�"����Xk��J�����{*\�0��TK�MV:�ې�qLʄXq���k��in����n�t*]�T�2֮ݡ��a����
,.�j,U�;�(� #�����mu�ו]&��
{����=�>ˮ�l��?y]��N��k�m;if� �1%V�nɤ�+�G'vq�P0C瞥�׋.q8ۅ�\��Ѳ+��K����51�^%���ϫ,W<j�Bd�z3A�hr�5��xJ@�t�z@ 	%'�;k�m��Q�I�yc����&��9ɋv�wNFA E�G)k:K����X��;#��!G[&�����x}mMrd?x:3�5秬9�j��~�����hs��2��ok �m2�q)E��6��4&����Y��$�ԕ�DT]�P��2��V\s1�{W3��b�VB���a���>K
гS\_��m�eYra�U�.!�Tl\[d�Z2u�%}T�u�w,,���X9s��Ӷs4�-�A�K7V�,�y���uB�Bn�'T_�?�J����*�Y[�����Ċ��)����o��=�����/������0|�#eW��Q�����z�/�8YZ���Ҵ�T�Eh����[����NN]�`U�8kVy$��(�«��L'�mm:����`���8��x����*U�6��[F�H���w�De��K5q��d�	Y[��S�軴��%`�w4�(��4��R��1cebTq%�h:��r���n��Le���8
�9J�#m�>άݢ3kH |�ж��$���r-x��LW1衻�F�u�ΓY�r���]�x���%of�Yv~H�����.��5g�]�N��1\^{�?Q���i�Sc�$/Vs����duT)6R��tX��K��xj�6b�����U��p�x������nYOe��|ىm��)���-dJ�d�Ipg�4�\��B�m�����쩥l�QT�?Z�E:̷�8tM#��-;gF�e�$;qUbN�+�$�d��g�{nO���K�$�x�}��I^J�b:�hn~��)<̾R.$���w� ��$��n��k�֔�{�m������L�yç�E^��4P��h�~f���$E�*�I>`J�$�l��Á���>�X��.;����kjm@����ȉ�7�v}��۟����������/Ɵ���ٗ�������ؼ��_�m�����x�fҁ��PA���UǹN�=�^h���TPj��lo�Ċ,��N8�*0	���g�{՝�9�5�?n{�ѩ��5�w�翾�
����Nt�� I�	BQ��Ԟ��%$�Y�\!�H��dX�#s�n���[������]h�}�+I0����rW4vf��S�RY_@[O��o����Q�#]�?\|��z��_����,�:��<�?QB������58iZR8x��#�۸T��� �2X�NsNeS)M������&U-`c�B�i�Ǥ�X$��g�ػ�����s�.�����}ģe�h�t0�[aS���2�8����=��8z�x���]��$vxbX�y�֥�EtOI��X��n4���/3�&�J�z��� �`���"�z(����a<i"�=s�N�Y�%�Z�N�FN�����l�L͏��<��(��'m�q��k���������p���v|E�L䶑�Ԏ���p���B��kQɄk�1���9SXǡb���T��?7�M�����f�?@��y~���O�]�w>>��|�T�O��f������Z�瑻e�qaH��Q�>��M�]C�u]L�	�[�m*	c�ȩ��w�m�11�k�X#��礁ys���� sf�lL�;�8����Y�́Wq�����r��4Xb�KͲ�
��kIQݧн�71ӭm��X�_���)�M>֙�[8�ڇ��Р2|��`�MXj�\��\���Ըm�����~���l��}V�w)��)U���$�8ř'��
�n'5͜䅜�0)�ܐK�{sU�:-"��إ�Ӏ����j�R�B��r�'��$�~�d��L�d�\��U��t`��	�g�n	%�p�5	�zI�8yt� �2�P�~G=�u��*UiJ�$ሸ�R����Xv�/fF�+;;��c�����7DiM��h8HZ�Yv��)~`�j'�k�Ҷ�h�A~d���'�c�N�楚9�~P3��d|�� �̬U��Ȯ�z�
H����@�f%�E@*��e������v�K3C�.�柿�V��H���.���x��6-��-�p9�^E�[q�@R�i�&3�n�z��amR�rzIP���Pp�UB�^Ko�9���1�&`�7�
^;�6�-�%+פR=��_�BMy4��f��J@%��L�ޘ:i~����Nؠ{5øf+���+��L��Ҟ�>�7E0_��1�[�՚u�Jw`��Lt���q��G�t�G-z �9'o+������7�-�������}C�]ꑋ����v���ؠ��::�����ӭʙ@X}����.X~�$e�k���R���wm�]�)+&ཤ���)�A������w짫���gf�M�Ur3N�G�dJ�2�OXO�^�7��6GA���V�3k�ت��T�B��$�%>�(�����5G��]S1u f�d�#�������|�ͅѸ�ӅW?����h��O��O.%{+����JwﱂqM����&
��J��58��,�K�r�*x�Z�״���	��v,���P�\7��2�$)P�Q�x����k���%��S���f�q�z'�K�����V�B�҅�	�Y� ���3ßG(���}-Z^��Jo�?8��7'��`��ڻҁ�bRµǣ�^���x�}g5u��a�8ɻ��6 �P��j�u��nf���S���g�|���HO*Z�ق������nk��q[�^�)�����    ��g�R
$$q�������R��9��`ӹt=�%��ٓ���WRc��*Vo]�w�B���~/���_�δ��3q���Τ'��]ZL�!=K��4;\���-1G����o�����0d��=Ţ���)�l���6�}�>3��.���Yw���5a�Umދ�$���Ҳ�8�Cߥ;OcK�M��7.B���f˂���଎�{��,4aO�K�OmXzū¶r�.�nBr��J�68�����N����Sq&��>��O=Z�je�V�K���1�˸W�j�������p�L������T��K�v�Nq�G`�$/qx; Sa.uɵ�RI"v`K);��?G�Rg uh@�r(����>�Z�~�>�3ݮ������U�RT҂(J^J��4��R���=�>�N[��W9�xˀ`�12��S�+X�j�)�t�Q��J�2��k��
k�*En�c6�Μ�������X��3�>�	���>���7��ӟ�����g ���?f��Z>i��9w���&%���^\�����"��H��	����{���y��98!��:�\�����71�-�:����+��>��晵[��b�������4U�0K��&({!�umf*5��EU*�׵]=�4��:3�\�z���=n�+�q�@^��d8���c�!`"4;$�϶+�����qL}\f�|4�۶x�"zg/�c�q�Lc5��.U��Ն�0�C0�i�D�xR
q�}�$/�,:y����LG���v��}�b�4o���o�#�%��,/���>W��=3��RQ��a8,�/��FxZ�$ժs���ߏ��A'���pf��0�<�Y�R�R��ǹ�q�^类͍#��4���s�EZ0���1g�n�F�x��L���M�Eİ�jYsʠZ�'���hf�:lȥ���K�{
��p�]ՎF p�S�j���4r�^OA�#�	��K$S�_3�g۷���d���/.��`��Vv�Ǣ��7.E���{fݖ8
v9ZU�`�V�J)V�3�k���HR(�ьSn��z�)_�g��/���\�_�5�Տ>o�C������o�������b����ƿݍ�w����#�X�2H��4L� }o��,�:v���G��u����/f�Z���{(��{��
!����XC��r+U��J:�J�Z�u=��(�O�_!�c��ms�X���H�̚ʲ�uֺ�k�b��ǀ	���g[%E^��}r���ȥd{1Н6E����o
��q�[���|�b�ց���u0"ufH��cǌ�x8�4�������V}���%��Zo���am7��jR.�
ፆ���4 �����IOe�{���G9nj���]��<��RW���)XN^e���^:u��j+��%��ʉ!��a���L��G�����?���_��V]���|�.����O�s���Y��㇟�_\�Y���~��2.��q�7�I��v��N �K�L�*3�'q���
r�E���ۥVQ��hBμT\��T����R�1�F�bb�Űn!(�/�?Y q���Q��������~ե�OŜ�ͧ��9�����4���ȣ�Rx4Պh���f)��u�P[���3r?�����.��_����~��?���/�����l?���C�S�#��޿�_�;�����������(b[~�v�9k�Ju�jov6����Uݡ��2)h��(�)J%�`���3�"�BF[Wyϰh`䒂�:=�m�9�cf��+_��!�s�tQo����[L6����=K��aT���L�eOύUv��PژU�k�YX�%0 ޤ[f�0,_��@�J>��ܶ�hf�I���G%��}w>�C� ,jX�]��0:gRl��6��'Bi9����o�^pb���Q�����Ɂ�,���W����ҩ���4����$�B.��6����-ܝ�F
Ld�ؒ�9EQ`�w>����G���VEn��KqG��p��K��܉�Q3��f�)\�6�4�kҎ�
#A/ZPq��8P�v��T7��x35sf���Fv
�W�7hh��G�Z_Ͻv�}��K��0�W�9iUM�H�rKw�?Lu8��O�F�?ً蟪	ݝ	�Fp�¯�Uu���wG����6���)Y���=������8��6z@g��*���k��K2�P��Y�~[[#��N����F�P��æK�$	P��X��ܐ�C �'I{$#=�D�os�Ϝ�Y������PnVJ�7�l����a�� �l�c���5�f�\��ݕ73�57r}���W�|���ڞ{���^�[��H:��tO�.�M�?s����-*��X�*��4�J2qh2WN_�l���|��S@H��F#�DI�\�y��Л�]���e�����o��^|�]�����.>�?��p!z��g�~���?������/��9��>�!>�xڱ�gbI�j����W ��VlJ
���l���c��w��#�Z �h�y�ӕXJ
{�z�e;���e���@�X��ohY�v?�fW�*\
��L�ֱ~c��v6's�c��A{o���f�wq�u6�B��'�pn���Z�1eã~�b�q���p��!���"���Kމ��H��&���K^�Hr�_.qP���b�]����b��1vU��g�S�bj	�o	�q'rf�9�2�\�L�=��������rlߛp����O��$�FG�I�3'y�0�bŋ%'-<�T	�T�/I����]*:�������
cKN���[-9sTt3ݮ���/?�u����I]4�xK�	Y��.��a�ց�hX*@	� iE��uՇ�ʕ�,TV�\#d�d db����2�bԤ7u���I#i�
*yI�.��{�PD6�ލt{���(-0{(�ɟ��Ejw|M�� Nw1T����oi-��4ά$/���=+	.���~;�v�.-��9N?`�`%_!{�u=lM��KזM��� ��]��s�������3#_�O�&XSa�4�Cq8��}�U(A{�K���4 �$;G߇Mp4s��u%Ĩ����	K��'aV\;���ה`��M�e�Y�X�x��f���wœg�?�x��+��X5���|����9%Ku9�n��$i/�3%��ѥ�V�Rӻ��M�i�='���)kh�y�L�1�8�g��v~_|��� �.����[��/������w;�1��p�o�?$KX��Z��Wc	��K�Ҥ�B��?b�5��׭��S�x6�9���u(N�J1����g<�ok>y`��i��܋�W�s(�m����]��ڜk�;�U���%g�L�{6X��7rʭ��H:�(��Ʃ���~TIߛ�>3ɕ�������_���wo=�[�oٺח��C������}�s��x} "�m��̖.��@�[U���s,�c�����'_u؋����w;����ˌ�l�S�S<IIu0��a���^=�N*6�ٶ7��@ r����z~]��a�t�é�1�6�6їQ&[�N�t�#8g�>L������RJ?Ӑ�*R��n8k�#�S7V`+�6����-
>I�u2"eZ׊;`�u)�'�x7n�����vH$Ob�Wg���[�x'i���_�K��DC<Z'g+��yǠ8ή��L�׃y��	���m�cyIx�ƍ�tf�\�%�fS�&�aL]I	�w7Bﶴ�r�c�uP"X%���fI���d����n���J[~��r��W�&^���԰��~�ꨋ.�I�����3k���AC|5����uΟஒ�=>���U�Y&���l���C�1caw�gF��? G�s�
���4�%�ė�G��nbl���iɝd��w�3fN��+�`%�׎N,�Ud}*�'��r�~��]j�n��Y��q�J$��a$�{������O.�Y;���_EB��m}��r'u����)&n��`[�!���3t,ToV�M9h�*�km��)JRV98��*QJ�j��BO��i9�g�3q��γn��x���v�cf)guN�H�(����PP���3�Z[�� �Ew�0\k�ޭV�I�:�ab�F��M��    �8��T�z��F n�����֥4/w�����������������M�8?�Cg�L ߤH��Uq藢kR�c`�I嘋bk|�%�m��g>GrY���򌡊oA�0Rw���ʽ��I��2/�[&��Q,����jef�|��>iE�ē�CE�\`��k#�vyC`{�0����.��<!����n&�e&fz ������6G���K.�PŘͣj��'�Ť7Ƅa��`f�*1z�R�%	*�ń���H@&�i��#��J8(�	'^�ELJ�&L:bffz G����������_�e�Z},,u���Xb�`6���vY��ac�_�l�p����u�{$ms�B�=GM;1�m��)����f'�2I�l��f�n!=���8< �ʇ���?�35��ܚ;�Q�6
Ֆ��H�(�dġU0x��6��6�Lg�m���qKn�j�Ȕ����%�u�.\!
�3�>c ��ª�<e�����b�8&��NN�ڽ��4D�MZT�pr�N��F�!/3R�u��E�. �*�U��������dVZh>hO6/�̹\FW����\X�p� Y���4�3�#�;ۦ\�O�N�`��b�H�q��cf��^cϗ�i.���3�k#Q �M�0s.|�rL�$�#�i�P��
}Gv�Zr���؉ڱAH�P`d�V�Doi����7�^?����%tX�����0{��p�=oEo���\����7'?�;a����n��,��pUH��z0�=�kg#�Lv�܏ɜ�F[�W�o�������;Sjnfس�2?1O����X뭿�����zļ$�p06l��N��B1Ð�B�,�<��J���t�1����'?n�+��R[Μ$�U�su%�P�M���#j���-�"SJ����I�U�aD�\ڳѵ��d�V��8rD��Ao��-W_�Ӕ����E�];s����}cMw1���ܭ\�sp����kӡ��1�I��^G�)�sT`!��43�m'��M}Y�+������L,�b����j(FX �:�Tʾ[�!����6 ���@
�]$���1zե2��:3������b���2鰝�1�v�4�㒂4��unfM�g�����י��h���PM,�ЧiD�Y]��o4ߑ�13�u'�^�g�e`>`2�9�����W��X������ں�I"7s���]j0�U��l"Y�S;�[T��p����'��au��Z�ڏ�z���,OX��`"��	nf^h��A[Ĥ(b�|�kc_/��q�mJ��@Szl%ULۡuL�VM�z�w]%�T�����Lzx���kZ"Ω�� �,��:��5�k�pAy��N�2�~czWkce�:~#I�ҿ����3�46�3�ؽj���'r��g�^5���q�O��%���(p9H������CYZ�Ww)�\��-��lk�1X���4��2�cf����r<Q`.<��a�!Dh��T��s��+�T��l�� �@ZOZ7��������؁3H:�z/�u��j�<Qt����oİ'F��!��lO͐l�8-TN�B�N�Y����V$M,
�iJx�,]q�p�
LG�%�RL5/� ��v���<��?v�1t#�8Y\�r�ƅ���nE3��5-2��B�]�p���*7a��U>%{s���ݮ�A��^`x�D%��"��b��A��A3gmp�bw0�*Uђ���Ԡm�0��+|�2�O�1�7�¶��Rt�$NL��č|�KK߈e�bң����F�!�U�.	?��8b�\V���5�{�h��\�����i H�a�o�X�y��[Ƚh/�Q�#M�ɍ�U�1⊰�/���m�Q	;2���B �6l�m${g�>9.�'�W�ӭ��"�K:n�̼Ӣ��a�{�b��^������[�F�^W��b�pʠS}�W�K[@Ҕa�������(+;	��
��X�ũl����OƷ �4��~5�#��	�fN�2J'x�;���r��*_e����j�6.'tkV���Y),i�A��u��隘閯r_��.$q�����-���a��j߬Q%�Ži�j �٫�#W9أ�_^l����ң�$�����e��c����H��yf�
��z���*M���AbŞ��5(�����ݤu���x��4n�nX�*�'���4ϕ�R���>V�<ā?��Ja2�ܼ�x˦sTB/��T*㓥�в	x�����ISSC�(��^%���$���>�^剙nI��|gI��إ}�ĘmM�G��C �˗��Ɔt�����'�n��U?Z����e��)i���T�u.9�Ё�s�8Q�X��fǔ>�nÝ�6'�R�_>}�}=K�W!�o�cI{��t����~��-���$�BGy�;P`�@�3�Q���4tE���F�5��"/��F�uf�G\��Oq}f��`��m��͜��8���#I�����jO>o��r��7SKTзQ�M�X�Z92Ս(�i+ab�_:_�'���.𣕶D�	�3�r)P6�j���Q+����M!�L<�GS��IrV2Շ*����0F��������e00v�r�Ŗ6W��Z*��������ͱONY
ys򓅼�So'\�,���%]�:6wrk6�6���(��7:��{�����WE}�.�����61ƐH�����U�0�H�W�TZ�_�wyt�Y��2o���'�D��u�7qf�[����"I��9<+V�G<��a6���8A�J���INF�X��X�g��ZroU�U�_q������?;W�m�ꗻl�
�1�N4|bAa��H>�:�����Qb�Uo�'��
&,VE���;�_=�����%A������t59&��Dυ��7�Ù-]j��T�'�z��$#W#ͼ�ի����@�P�P��]9w+�O�VcӒ�/IE:]��X��)30�?8���1�N�3��C�I(��#�a�R�`��9V�X�� \Q	k&��*ٛI\�5�.����
I��We-'�ja�ă���	*3/�t,aj\�)@3N�N�w'��.sV?�q�n�_̹}��L�&n'`S18��c1UB�GY��4�k"��z�6���I^��qH�o�YJ%�֪�1y_>v��B�U���|0� L ^���`�0[�%3��-qfhz*���bh2��Qڄ,3�r	��TQ�i�iSvVz�Z�zɦr���1Hx<*&�l�Zt�@cP�tm����3�_���,���0@ƒ;��Twv+d�z��g&2��R<�H[�n�j�,q��0s�K�VR��µO����!����^��g�޾t��=�9��G!ܵ�����(�S3��\+���s��V��j��9}k���f=`�����-��ض;����������2�ݑtӛ�3�:��w���6J]Xa%�V[6�qi7+W:�Q^}+�y�H	����!�t?��33����Ь\�����>�,�Ra[G��r��d���ǡ��V�Q��Zfm����M:��� _p�������?��������z��s�@E�:Ȩ�8��3@pBE�!x��54E��P���lG �f���8=B!�m��>����ڭ�f5��y	�10���Ք
�|"����x�I�	71��Y^�[�=Gh$�5���͐���ћ�tTs-rXB
�QQ$/�5� "Q�XO�%M��P���gjܤ]>��+��ސ�.��r���\��ԅ@�A���p�IK�ԤM�#午�����E`	�\Z`5z��A�y�4�Lr4>�@�O����5��� �VO*X�($-�ČeH���1�(��S�]9-̑!�T��C{�8���
��jxwۺ{xdse��7���-o��M�Ԣ�^EE�h��P5Nn��3�Zo����?�MQ�u���v`ॉX�㮐{���$@��d��wZ��- 6U\�ZH���hV��3��t���eʒ޷���̀�n���[L.�nO�<? �ǖ��7BK=�Z)W8�j��I��V�J^�M��&N��`z[!�$§
��^�x�h-�p1�<Clp/    �EZ�0D;����J����G��*��t��yꦾt���>���Wif�{���v�ʨ��ң��u��]�a_�ڮHK��oB��2G����#�'k�'fz�}~�U�m6���7��f�n	��0~�.	�Yj��o�f��l؎|�ꏻ-�|VO��7�ؤ$}�T���À��aT�}�_�w�������O?� $�¿WQ���yoG���(܁��am���;��P� g���T̉&y�YC��e�jEW����� �[���	Ԥ=�faf�G�9��DQ�����bԛY�3�r1�ʵ*Cғ��0KC�*M��u2�\�y�Cu�w�*�S�=�<l��+^�Ż����g��ܬ�zl/�M���]���y!��Q�kIeh����U߭�S\�jxihR�@���T�����[庹z�'[z���m����z�U��U�-�N�F��L�i{��F��+W��t�oW�TpqT ��������F*��v��̛,�F�i`��]Z�AL�*�%3,H׽,��#�w|Vn�sԴ���A���MJ�9G�.#�
@T��p� 7��
G*��tLl
���aV�g\�D�V��()#-e{''�e���^�S��Z��.$����;�J���N���,��|����-�Kۻn����xf/�;��0�)Ru�����vό<;�? '0��=�l��@�����4) Pv�O�kfa��]�5q�;��%b�H�ܶ�ʗ�j:�����q��[E)�*�pkb�d7���2ّof�[�����
��k�.2l�!���-ҭvT�b�QJ����`�=�����$_|�V�|���h
JX�R#t7I�:3����tQ���m~ά�|�aV�$�D���X�X���w�z����KAJaW�a�ȝ�u�`f�a���0��_}��'g������\�k���fn�R�(�m�A�#��T�Tu�\����J-�eռ����U.Zc,�P|6ù�P��L�[��V�'9�d�Xl���&6;ȽW���φ�v!���I����ėA����)V;��]gW]�9B�꤭��cHM��R�o���̌|�}lR�U�f��HL\ڳPU����('�uc\!M5�B�A+���JR{않�خ���W��o�o��˛|�qf��oL:8�r����8���ʬ��iY��r����9���A	wP[�c	U������Z��tSm*;ub���>�A��yP�9��ݴg��҇���
��%�e���Ҧ��3 ��z�8��Rq��pxP/r�Q���K�9g�[U23�^�R��I�$H�K�*��ԛ6p`�8W����Lz�cW�\]/��A$��=:s����T����6�a0��*Lq��o�!h�54�64��jxFf2��x��𧍷^	�_}�����ꮶӿq� 1z�X�X���!EkE\�'39���6_ L�&���4�hpg@5�����$j���Ԓ�a��Z�SK��ŵ~^�%��]L۹%3�r	@L)�RX])����ؘ���ˈ�2`�y�1a)�c�{�܄�դb^G�](13�\���@�\[� ��$20U���������d1�o^�����GlUx$R*3�[����p���,��ǎ��``9��h�-�6���)�9���of�۾.�Ɵ:ag����҂���i�������H�[��kN8�p�IjU#0�6E���	G�ce gW30�l�����2F�v~��9u�l�Vt��.ͩm��NTb��v�+����58��>��\��o�������|#t`�S�]�U��7�,����3o�$�������S�P�] ��(�|[�x�G�;yq�q����Mכ�$r*��R�Z�~C0y��Y���s7c����w�u<.X����9�ڬw���Оy��u��V�)>��d����a �S�|׏f"�9;s1�s���z�-}�&���>J@�c87r�b}<E�N�J G~��o�$/�d�ʅ�,�;�<�YѤP0��mo-�(]r�2��Ș2H�@K.�*���V��İ.�pg+��
<������w�f��Ge<�Pu0nPX��%K.�����;Q>�s���-r�gn�ߝS$ir�l����V����2f���L��=��������r���["��=�J�-�T��C�<��kjzܯ �BJ��
�ι
��$�긗 q{�g&���Ԋ�ڪ���(��3D;ka���M�7|���v�>�hx��Ϭޒ��K�R�奇Ո�t �
��e�kv�M8&ft\��.��0&]=j� ��oΌ�i~�K@����C�������?����Ng:�8vn���[/[#Xva���T����J�>6�����@�W)���N�1T, 4��7p�̰gܿ�0N��[���ۍ�����F���l�	~fvqi��JY����p�M��T+ �st�i���da�A�I�{�F�P��,��Bh̰D�?�	�_��=c-�ME7�Vsd�%*"���|�G!wH������#ӇO:6EUҿ+,���U/H4��>��73�$����(t-Z6m����[�(h��&�p5�;I:��K]�����.b]9Hsg��3PR:���w��g�)ܟ�S�_K
�g�������N������ ܝF��q�F�b�)���r��u��CNHQi��#@[��a�N����?�L��s`e?y�|��m7u�Y��p�^��aE�@��_L:՜5G����fa�|��;�a��!3���0=3쁝t��{"']|VN:kD^��Z��s��.5�>��5�o�x�b�[�#rl0wᨏ07mr�V&8�p�-]	ܒ!��9(;3�c8�v����26Na�p�����rC�t���rb>m\ڶXf�n�U��&�&�Q|/��RU8�Pyb����y����pT�Â	`�h�k�юɾ%3=�K�n3��e���̡�X�%�Ѳ$���Z,k�Qr�m"9����m&�l�!7��v�!�U��o��?.��۷?��;�3���t�/�V�l����U@�D?e�G��*��n�9g`W�w��ʷ����O�H�JX�M�Ҕ��G�颸JcM�	����Z����|�8���������棸i�n:�:���tȾ*+>߀]���0
�9�丆��UmB([�r��(���6�|��n���݉�B�X\��C�3o���q�����k�\�O�i��B�H-BYZe\���>T��(r��� s�Kwf��m���!4Z	�ei3�G�.�0u�����I�8N��鍅� �a�ά�"�o�++[r�Y��a�J	R��f�f[[��HܚI܎����YX6Y���������d��%O�����	�S���+ ��|r�v�J;<�����:w�&�m��ñ$;X��s�?� (�na��ą�!G�k� ��ޱ�
0�r�ͮ�a3�F��⃙��. Ru�$�7)���XD"�{{.>x�vs|OS�(޼(�ٸM�7s��u�^+�zi�"��T���P��WME�^/策f7:Oy�[O���0��5��&���t��X��zy>$g�v���Y^��)�#I.y��
�Z�g���֕�i��e I��B��Wc�!l
E��ݎ�_� ׶���Z}��ǿ���ٗ���~�/>��M�\N��$��5��Q'� kmBм��3�2��vN5B�v�HH�(=��1��1�B�B�[����Y���0��z�s{���ڗz�:���	�嫅�o�?�M���x�%[�!�5���"���6����Z��qP�����%c(��PLi��뎚������{D��ѽu�O���0��?yfquk�p���v��J7���s�C��k}C��\7��{<s���.6jН�m=�{b��(�{��d�0f��3k��Bs�o!U�oy���1y���1��c���ڊ�?b#��P0� v�-.��?�V�tb�9�p3P���>^^!�2>Dc��<J3���\hH0��^)��7�g����(_Ϫ��(�zy��=d���b�8׻�=��d�ߝ,�j={��˟��    W_?N��1�������t�ޭS�ٸ�\�]��l:�g��d�T�p�~E��k�"�MH@��mkW�Z���JᎸ�ذW����ud{O���_��2_��?�n�S��;H�r[�̼�"������5|�z -$�f����O	�ު�*>ee�$4|r�n��9H�:��1&�H��JI%�����bO�6V�R:�3X��Jj�ZM���$���g��vzape>��Y�)f�n�_#!��R��Cƃ�MIK�H<&�fz���6��'%+Eg0J��x��&����fʬ|x��Y)aX�~�N`�՗�z3�YQ@�B����b׽�!�s��ڭ����0�	IFjTS*�w8^gFn�`�SlIUq4x/1��z�u��^�}\��'������e,j��sLl�ы�'�����;���Z�7,*�%HZT<9I/��p��)k�T�`�ͨ���\*�TG���b�
�s��4j��-Ef��&�j�g!����KX�Kqf��Rܵ��Y��1�m���M\Fs6tM�<Q�d$�Z`�O~rtv��iE�N��Zط�!�[�:�@n��01�|��N�o?����Gt:�u��lG3f�q�\
l� ����M�y÷�`s�	gi��vŋi#��D0^��ǣ[o�Г��gf��,��)خK1�U%i �"�,y����������E-x�S���[�Zt諚c���6�t��Y;������[\���\Df�=T�eM�:����5؉6∨��Dv(z����5o� W<a�����t"ΰK�כ����4f^ci<
V�U/r$�����ЕJ����ſ{O~m�t/��˥�oAc����n�����3�0���~J^ms`��6�g��RZpND&,1y8�p���v)�B�^=<,�����NØgm��&G�EK��c�_������J]|�����
!^~���/��,Oe�{-i��pJ��W&h���Q5H�ܹ��Iˀi��:�d�\�o���HvN�X��LX�K^�o��͌�W���+r���.14L�2�����3d�;K�i��A��b-�E-�7qh�Ae�p��fwu��\*��ɲE�8ɋ�6��1�5p`��fܫ�����2�� �%����fR#�z��dJ��L����M}���j�H�:y)���\�H�g/~p�Q���m�Q��sa�3���-D1�Ҋ�+����x�zn�_E`�Ky�jv�� Ԝ��G��BJϨ8�̶�y����4�5�O�I6�H��C�����e}�R����i�3'y���9#XQ.Uj*�o�@$@��v9�?��Zڂ�VQ!w,kM��V&�ff�%;�n꫐��I;yo3k�T�:�gt�7�{H���[�')ύW����\�4n�Gogź�bs�)��0ڶ�y���윣y����z�/����������U�M��g1@%��8����ϳ!������4�8�:Pv���l��n�rN��� ;}:M���L�ݒ-�� �����N�`tay��v�[�d��VN\RP��%̈́#!!�;�t��n�Ι���N�*+{�H*�Y���ʣ�<���7�;��Y�9��؍S��Tu/\Ր�����<��N�`�i;�1q��<lM�w�D�4�$o��Q�P	W��F�l�9��a%k/Z��
�=��_�M�91�-�9wS_��x0�`�M�9�vK�Κ"�����9���6V	y]�C��T����+o�e�0^٪<���y�윩9�Η!;g��Fv�7��-�o�Ϝ�%9c[�h-��ޣ�o�";C�:S-�ʘ���os#�TS=�Η�%\�92�Gm��6CK�,NTJ���'y�#��a 䐽T(t��l�5lU�#]Kw$y�*;���5�"T��9�:2ߑM>3�����Y�pu>_��X��Jp��G����̜�%�¹tV���1�2�Vc�6�tʈ�YD�T��S+r顐���%lr�4~Ǡ�y����q�/A�%�>���k�fta[̜�2�B�-�0f��eS�v޹�'�%��Ѹ<�aAI��J�z��q
#�I�ҙ�n�3�xj���=h��IVL!g��Ơ��6G.�ص�9VY�\g�T�j�@�dY�ƽ���d��	i'�n)�tL�v��@��!X�-X<n	�s���Jbj�f�C�	��X��8LxL��L�ΎP��Lr��!�v�uR3˶�bc�S����.�S�2��l�ܥ_�0]ނS!H���P8 ���c9��ә���Ù������55iH�����;A<e@`����d�~�j��6���Q^r� ��`k ݜx) &<yń����Kh�$oq�X]��FH�-�6��ceΌ<��?�k��q�6Vf�e\�u�q�����H��u�Ai��l�$/�GLe�#���t8��������[�pspk]&iݘ����m�k��o�M&f��2�n�k� �8+��6�&k�D(�,n`WDvJ�g�U&ỳ"��<�xH�P$n�a��R�$Өy�w�&3#ϲ�C���]%	��L�^��R��	�r.��R���4��!r�$/#�N~C��$�o&:U��Z�ՙ۞�ÂD�x��$�$mc������+
�]���A71�-�9wS_�����<mS��,�2Rϰ�jAz���5i#�\!^�/�`�އ�Jו!@����g`�Uq�o�Ι�g����{�lN@��v�#��GXK	��<np��;��\�l�d̜��{"�z�uH�V�v�yU�6��x��zt�Bą�VJޤei
\06 ��a�I�̉�n�fN��� :I�Yr=�v���N��O A9jMu���\�����kZ��T֘�Ҁ��O)n�Ι��L�Hv�5�V�+�L�y��ֆzgk����'�T�@R��y�fN��\�hY����/v�F־��쓿��f�3v��S�/���|�f/���SD[׼R��=�������l+Q������!]��+�{wS�U�:z���cX��H��#�o��^:����j�u��'�<]��_?-�,�O���~�xy�;��6���I^r�Z��*P�����)�+�
 ���kuB4R8j)�
*N���.� ��+nb�3�^6�P�S����,�A��}|�y�#�˴�1��ͫ2s6���(g��7]�kR#r��<�u.`K�&�^�A�~SI1��2�f }�������甖q�Nt��2�X�;���8�nԹ����ċ=����H�m�g��b!�
tm��4��[-9<qd�w'�11��������!U�3wikdT^y�t�r=�'��C4��f:��I^LpO���+�-VXY7 G���q7?�H[��+Ma�$��C�\�t���t;�1uS_���%�7c\3K�0'nM7EIJ��+7��(\�iX�w)�h���ah�Mr�Q����d�o4쎳af�Yt~@�3�[�Z"Iq�M�,�l��Kz���=D��n⑙���pQW�Ko/5�ō�Vْ����[o�O�:�k�F6���I����ĶR��U���蜻��Atz��w��'�n�<
k��K׆��,%�z��K!��B�ѴZ���K�d�����\n8���D;��3#Ϣ��&W*QHd�|E��$5hE�Ǌ�q3�,�a`����W�9�K\{�����0�"�����Pa���N�!ZqW�^C|x�B�?	`xǓ�sb�ۨsꦾ�I����F�3k��F1J�H� ����'�	�G��Ky���mR���Y%�R�Q���`��-;gF�����C����rE} �^E���Rr`�(�fm��Nә��4�-�TOA��+'Q�:�/��ݜ�0|'�U��1�� �6�Fj!S彦D��L�D��E}���l��6���-�������0d�W�rm��������l$}�xNK���LP�z[�F띜���������|��n�l�+A�	�t���!��)���|H��x3_q�$/ҽ�I�..���X�|���!"rړ	�$=� $^���T7�mT&��33��3E�� �s���N�6�1��>�,���ux!l�+F/�CP����E��^S
    �)�l�
&��\��+G��������4#�-2��k����ů���������FCu���$z҅6R������f^u��سw�4�HW/UL������zпE!J�*'I�f8�R��"g�6��Aי��)��X�W�պI��f��̺-��Pt X�V�Ť3�8����'j�z1|N:��(��x%����"hC��~1���{���}<ÿ 8mH�� ��P����1G;��;�vO\o�H�r�LP�9ˋ��͓Y	D���-+��u�P�U�f�h�h�P;P�
e��l�&�TtΌ<{�?�{B��D��P������a8�1̓��;:p�q��{�$��*g!�	k�̑D�U�u���ֻP=�>��>��
3�t�꣫*[3�q�D��'f���n��w�`��Ah��;�ά��5$ckT9J��)��
�Z�x�"a��gcS��G#%R3K�-����-;gF�e�$;5�b�+��1(A؃�V�VͰq�$�9i��8i��v����Ȓ.iP��͐����H�R=�t�ԇ����pOV��x髭y�dR��L�d��M}���!Q��l&FO��Ҫ�������A�JB-�K5ɳm��A��rXP7;xH0��	�ծ����i�63�,;? �i��ޭI�9|��|�5� ��p���nuk�J%��$=��*��55SS�2����#��$O$���KE����8�;��;�]�Ѩ���֔a���5?#��>�����$�~��'olI�fMc�NQi	�HvSs����6��P���j�Z�QѢ�Q�8�f�Xհ��d��M�d'Ȝ@�}������ ��HBmp/g5a����=H���AF'�#��[M`	�!�F7��S��[?�/����q���46+Nr� ;�C����ۼ��>�Y��9oz���{�~Z*�|�Ԝ?XO>�5�p�6c����2.U��$:*
g�$7�V��2��}5�k�'�r��4�)�Vɝ�v�ҭ<�}�}�~���H�%�]ٹrv[v���!,{���y��2cj�Ey�?�`�bY��.RM���T�m0��e���ۉ�����7��/��J��!@�����'R(C��}��s#v˹������g1�i���i����?�t#4���w����7���S7��)�I�c�I����*�6�y::t������.X��SG�>ޒ~?�4�Qe�TlV��y�.#x�p��Q�0ߎ���$���U�+j�f����:e��l��QĽ��?��Z�i[쳧����5{F��~e$��~��ڒd��G߽ʪ�}�4Db�����8�Ӂ9Y|�K$����3"E���� ���5���I�S�a���`����9�����s>2��urҁ`u��؎�ڹ殝+���d����sd8�ZTR���uXǝ�;0K.[��
��Ɔ���$H��oʸ�Y���۞!��e�A7��K��	�o��Ƿ鬜�%�yhʵr4��k�����ʄ+0(�aϸY�}
�`��e���`��w��W���G����W|��q�+�������{,����lI����+|���4y�4��A��M`LQO�KO0���� xajh���R��������aΝ��[��I�s��^�<�]o.O�[�A��������b�CGġ�Fk�*�~��Y���,��<��`ELtǤZ��o�R�JuH�GƯ��,:��8�coN�Ky��q�MO!y#���.Z"
������/o](���m��Q~���K8V�]�-�>�PȾ�P�3�����hj�����O�x����4o������u�+G�������W-��:�HM�6:~�m�厘���������fI�wsƜs���rL��Oz�v�:��cڢ���ڽ�N��#��@���4���������2ɕ����<��ej���ږ���X\��S��na�p�$�*�c�$|�H�#�԰�.๕��p��b��k���W����~����K[���Ǳ�_�����qQ��|���!�d��{�4:.=�3Wn��m2��aM��,�"�Li�C.D>��xGKC-�X�k��$��39W�%����zv��&L�D�����1ߗ ��3�����W�rv[e�֣NP l���ѷ̮uo���?�m.CA#Z6)�p�1��� w�.,�uH�����9N������o��XR�?b �7�Vn�6����ߜx/��X�8/6xig1�zn
J6�s�d�u��ll�Sr_�ٵ�9-<���A���a�הM
�������њ/��'�̅aWv��^9�m��zf��d�Oلة��l��Mrg�5U#�
4�T�D1�N�[j���+�R����^P�k�������������x�Hi?��r�a}ɚ�kD�S��_�w�&�e��g#7�Yf� EQ5C�ZBj����b��ʓޓ�k�T>���,�ז�]�rv���������WDUY���0��Xy�E29�aD1e�+�aS����L�[��	�.��`#.Ya3����'�'��J�0FM�j��#�a{!H0��N��&��� ���X���/t��^�N޸Q�k&t���Ǉ>��k���.� T\�!��i�&��b��xV��l�;�9����\������Ӂ	,�Y9�-��4��u�2���l&�� �ΑjPmCW���Z2I3�b���|/�8:s�I�R��I�����޻�+�����Qӈ"mW+�b��MJ���]	Q5�b4�E�S��fz��<��b�<����w�T~�����?���˿��_����?����O���������^�*�/W�^ų��-�X��6F-�l`�jU`��OLL1V0,����z�VF8��Z
�M�.	Z��CeG牱��]b��Z���tc�<�?~����,^�^�������Q�q1��UI-��K���FJ"P�k�>4��4�5�;\�)�[7d��-H;l:��W�2v�$�� ���w��������)������[�= ����o/w��Ѝ���
���n#F���֨t��C��蔮q������/��=�7'�ޥ8�q0�%��X��I�;+G�-�\HL,]�q���/�'�P���W*�������I�A�V�C�"<w+�y��u(}p�������~��~�tM����)�5,�bv������������vn7ƴ��[=�j�u]q���I��%y�4r��ف��8`��E'�f��؞��2�iр^x���-�/d��Z(�T��"�b�uq^4�]�����mp(N�^��Ť^��z����y����j݄nK�.�
3�?MІ�Q�f�Ex�I�A�<�v<�Į?�rvn���w$.,?��<9X�u�b��� ��#�-i�d�b�c_PVӇB�����E]���o ��zE���i��?΅m&h�����E �68�|��_8�-fn�w2Z=��"Z�+d7df��?�iF{B��-�h�| c�H0��{E�u����_ۙ7�o/��|��/�����7����������q��>�ʆ�:��L%O��b��L��a��z�N����#TI�М*�'u��#R��/aP�>��1Ҙ�췣�lh#/�\�v��j ��r��6B��V�87�`�
�`hB�n��!������ZY�	S}�)�?��o��K��������{�V���\Y׫?�>��Y�4T�ɂ1���:��H�LVz�l�f��Ţ�'���m&�.x��x��O���,�s�@�D(�{E�oQ1��U��H+��R��pю5>
L���+���;�O1%u-Id�Ax�R���"�V���n�Y�UK��:�X��e�⛟�*-�~'��͙��j`���=� �$�o�X���Մ�e�f8�6�SQ8	�e�p����>�vr���N�S;�@OQǇ����Xy�4p|������W�Ç�� {ǯ74����$i��!�F�Y�}��[k^�5����o5#��x1��)�5���r�J'��M29��+��EQ�%�b*�Ek���/4    ��^�ï��J�a�N�E(�w�Ws�$���Y��tu5I+��:�P���N���Ƙ�!��h7���ɛ��-����ĥ��b�=�s���zͩE;����Uh#�eq�*�O-��ʓ�3H��M}	A&g�bܟ��rv����[�3l��Y=+�.��Jy�K�C�u��u�G�9���tQ���?�:rrZ�v,�Xw�'o>r��<�� 0������mo~8��d+lSN#�8{Ы�ާ�=Y�L�@�/��P@��h�UT4���Ѐk8�N�a�FK��Zܹ���x�p���p|R����ۜ�ǝ(�J�#ֲ�]�x��7��W�DE+$;�~���%��-�1�6�5������6���O��;��VV������鋯�>/?�<~�/�i����	K��_n��3����.V���@�OX��55X=�[��f�����]ל0���0R�h@�1&^c�|ƶ^Xy��E��o:V�M�ٳ:�\������ُc[�.�ܖ�~�N޲�qv4�Ʈ^m��������X{>�>}�iT�]��M�J6W8�Eڅ'���_����O��xFޟj�rx�΅�I�`[	:����eaW����Qb�i�ТmDg��emyH��\D�Yy��������@>�}P镳�`��ll���3:�R�����g�Υ�`Z
r�z���֑vQ�&hVj���Jwv��,�ut���ś��k7���{����ɫs��/]^�q[�[4���c�:�o�@��n��&BBʝ��T�Z���*����������-,��Qo���V�D�&��F�=H�����E��_1�GE��g����x�%���=�9Yy�/�6�
�������ܔ���zO޷���L�ЎVgL��mwy@)y�rƨ�1'6Ю����yk�JS`;�(S
��l��ro���{��L��:��i!6�K�J%�>��ʝ��c�d��XD�p,�B�P��γX������2���cZ=�X���&D���\�v|��߿w#,W&l%rZB*&�	�@���)�2���K4�~�[�XaÍ�X���ɫk���pܠp�8��Gg$k�&�ft���ˎ;v%������4��F��>ܕ�����}��w�f�Z�b!����a����+g�I�
�]Lo��oЪZ�[T���O�>M¬��Br�l23�ۅ�-��Lky�s#)��g���`�B��U+g�E�ee�#2�5��V�iy�qf�=j�'��h�� �e���iZ��[�,�P�q�\[Y����蚿V�����-�l�%*�,i��a�B�=�9\%;� ms|�7
����j�<w<�C�O��o��w��1P�ސ�0�h����3�eCa��R80��oz��/��������n�v�q61W�5娙登)�B*�U_�"�Vk)TL�U�
�	��
c��������#+�����O�����O�q����~��?_.9T�P�D���v���ǀ ���E�dNֱ�T��H��u�*,_J��TѬe�d��-�B��ύ�L����kr�W��vV8�N�4\��UД^
���c�%9�^Mc!�i�R�p�֜s�id]��N�?�
�ޭ!�t~4t���p���sMG]E�Qy��紉�W�����rS?����8�}@����j<kc�eŻ/�)fpWg�F�g���w�5|�-`�sL��Hi�e)a־�{�� �g�Q*����kX9;���"��]:��{�IУe$j.��t����.����=hه�`W��.�d[������_Gn��V���_�?}�⹅GxM�|�o��[}��
9��R��ܹͲ�>Q��O�(&�I����72�t.G/:�V4XS�+d���%(:�D�G��y��^Yv͎|�ّ_�`v�#�c�}l������gR��߃>���d�OQ�V�l&�vҹ܅NU*�o��쀢�㈿0�q.6��/���!�z�_8������w�P�׾�����]#g��7?@h�a�N����_�89����I<������`�2q�m�ڏ;���XY��8 ��ȁ�p944:��Y��w�6��'���V�D�?B�w��
��N�8@��t��^Tf�O����<�y�)G)�����qO�&5?��%f�	�v�`XY�x��{����U�w��/��~��]]|�P-�g�*F��u+���0;�.jw��ո����!٪�Şjn���u�/5���1#��q�Q��p�ʲ+7��M�h���r��@k+��"�\�Zɢp��=�XuW&W�yD>�z���n�Ӂ�5W�wv��0ւ�u��kaٕ��s���N!2��K�(�9��Əv�N�ƚ���N9	�b��z�Q�1hϒ`iC��Xt�D��W�]��,;}����)k�6������
%�/��� EuŬ���>��;��gy�bH�3�*�!5��&�v�2[�;Zz>ӎ�����#�к�O s�pL���1K�p��^~����R�����W8y�p�c�h�$�;�E&��Y�ӊ�Φ%;��
%c�N����*�6��Q�V��-<�|��M�Ғ
�x�^�>����m:d���?�{' ��:�&���2�a=��V���;*�i�(��.��hn�y�I@��3/��� p���6�1���5X�Mz�@&�R�=��Iꉤ��1�P;b�'�`N=��Ôr�$��忎��o~���5�E$#O�|�,$�}:$>��r�6Jp�g�:���4II�X�g_ �{�]�u�S��L�N��&�gG��E�~/������4Hե-Z8���Kb(�<=�;6v�'#���Eɠ$���	��һ)#x��`��eK�E~u�E~e����F��-�0���Rw�K���Ԏߤ>��})V'�8XXg��xr�ġ��ؚ��.E���s�8�)�mL'�Yze�������2�d�GHG����t$4},JlD��,v�]g��KM���?��HYw�D}��.��d9$ϼ_��r�[����Ԯ���4��i�e����κ*��B~h����
k�>��rq֤�EWe�Ik9�qU���.�!�Cp.�����m�Z]*.sh:_��a��5H��t_�q�� �.HU�R�����	�Kr��({��eװ������q��'������WH��*�"X��y����yP*�F�8ߚ.7��4Y�M2V'�����)�������������/����������ǟ��џ~��ۿ�w�`������� Z"^|�-meǛ���
�x��ǭU\+�4��°����$[>k�T��d����J�8�gE���`�9Ĩ��i�L��`��t�]`���	o��$;�۵j�ǭ%9]*�ɲ����p��pRa�ͪ:��^�@�S!���Y�
ޤ2�ӊ<i��ukjM0`��hD�wD{V��hϿ\.��<��1|�#�x^����X}z���2�W����l.<2��M#���al�
So�;$�>��H�ͤV�e�8����`��^RWc?�EMk�l{(xxp��ke�5��+R_�Z���|L@���mH���i�5G}��cx��!H����N��sf)Pj�����Py�DŦ5Ww�)O�E�����`�p+�vh�٪B���r+O��b_��_@�t�{�쮙�rx�LR��sX8kɫ7��0qN��aR�g�"��}� ߓ{+�L�i���E(;)��������{��2�]o�趒K�����`�>e:�i�
c�o�D�z��I�x�b�I�\�sa������בz��z�RR��=j��>���Wn��K�����FXơES���i�d�mm�+�D�:�?�lU6��(֥�������&�_�e�������|��t[�v?����[�5ũ�cM�	ko��>M��V�-�x[3����������	�^܄E{�|�*]Y���u��,��Nŷ<�N�=yN�?�Z� �%��[Wѹ��jw#?+l�uIn���:ٲƩ���BNg�9ɩAY��Q#y��Q >�H4dN<%��<�P'3N��L�4��y�n4�jhԑ�N
���w@0���k����vi�r��^*�ĪY�    3�����2[�����J'��բ8¡I	�Mj�F��wUE�,�b����E���&:u��E#�F���l|�y�Z�!�9�WW�p�j�To"�	(��#��G78ވH'��VX	�7>-�JJ�9�=�ѕeׂ�3�i\�Y���!��y��k��[��w�cEÅ��٫�EFH�H�+ǧќ��8���,
H�-c��Z�je�'�P	�Z�6y���#�w9���7�$8�~�3��5ؠm�"�(�M�_�I6�*Q����v��mqD}P���W���S$�3ˇ��1kWe��OPUE=w�}�1磅=�]j�s�ڟ��h�fO�3^4['�ؔd�m�̜敕���(�&�>Bn0UB޹]���[�Zʝ�S�J92%V0.�J�?�����d8r����R4%`�^B�gG�gg<�ӯ���rFk������:&�{׈��cSS5��:����t�<�3@�+����J ��(L``n�� �\
�O�$6
6ӓ+k	xC��%�|�w����^����k��
�xe>����V�}�!��礓�w7u�*|�,��O��v�хa�W/� w�%��)�{��{ޅ�������/�B��9��w��/�?��蟑;$��[sȴ���}2�jG��IC�:�;xR�L��z����g�
.�oF&���b�co^�²O����Σ�*xL���!$�u���<��*t|Ѽ��|���R=��ig�{��	H��Ԧ��x��Ɯ�I��kM���ݰf��5E��8y{�vl��6J}�	5V}Վ*?L!b����F9���u�:��>gLf��[��C�g�"���^��b'&� !��w��W��qW��2�tz��S\`�uĜ�Ӂ�.|�B���R�1!�v�b�������tSA�h�u�ZoT���>�v,��GQ�>97����qS� �?F��82����Z��9�8 ������d�r�Þ)���Pf�J�LG
��q(3%3-6�,x�E7u�I者�������@xڏH����h�A��U7�fJ�
L8�,��p�a�+I)똱�&N�
b24��l[���qe��A�'��iE|˯�"�5���Td�.��_���Ya���6K�n|R����4q��~Ƴ͇
�Eu�;X�G��{�!��+�#�WU�'����|ɩv�?�ȇ�#n&���X�*?���s
��1��T��n�?x��6#g�a1T��)�ȓ�,����q��%�M�y!����jz�~'0����nMp^x��<յϞ~�Ws���Ã��e�7���;��W;.l}��g� 	|wѩ_߃	޵Ė��������d��&`Sd�¬ii8�`�M��'��ˋώ.�֋�%��η	ӕ�CC�����舫	�=1dٓ�6��x{�)եj�C�����Y�-Bt,~w��$YY�x��������J'�o�8�A���q C$�&�)��|Iri�D<�u�b�X��l�qj�+��UH+��t�
�bm�=���Ϻ��q��w�?�� Y+w�ke�yz}uz}�6�@�R����3e�u�$0-48D5�Ӌ�!S�UG+ǲ�<F��)M��+��t���9��A����¥O�Qj��oS�D%o�A&��?��ӿ���Ҏц�`����[��M���cs��G��"��ߢ��'�㧮�F�z�5��VN���&�=�6��>y{�'��}g�۔[;�[��>�'>�G>՚�e
�_2����s�g���ǰp:[������&��I��:/�2� a��P׍�$WZxhiq���I��y�Y�|�-�o�	s$n�;4�'>��D��ݛf�G=xQ�A�9xti�x+糵���.¥j��f�H4� ��U�P��g��:5-xm!�X���NSsv���r=Q���~*m��k����2���&���C�΂-ཅ�]�� �x�_�kq,C�+��y��5Sa�p�lP�~�;I��/��˨.�߾x�$־���(�{�0����n+<��*���3�$��-c�d��.���[.IJ�[&P^,����=̞��p��/��2����`k:2�鯏��|`�gJ<VxjS�-����ěl�7�?IA'[�S��J�E2n*��M���G�Qf�������Z�q����xEA�n�l���V,�r��J�CXJW�k��x�J�s�B���	<['&�~�^��a&�˩ɹ,"�.<��<>K@��bdH�]Ÿrv�+>0�����S�*F�Q2D���6h/�ה�N��S�y��4��YvW���_��^G�_��9�j�h#*�9��5%Vn�m�$�{��9VtÁ���u7�ϥ��]��1��o��0BIG�\���*�z���[e_���x���q+��W�i0�5��L�Y�V�z���O��<Z���y�/�]9�rRq�-��ke������9��_�4z�o��jR�c=w��n\\Xip &�6ژ��BE��p&�~��Cn�z	�%H>�8Tu����(��S��
�o�ެ1!2M���n��q�ݶ7�te��
w��y+��Ë|�k��T�j�ժ���B�vP��,	=|Y���"����WX�8��7IfTU$9+�;��q�f�8)�ċ&M����((o����[�nod�ʲ������1��o��}c^|������́�6j���䉿�)3�d-^䢗#R<e��h�/7;��]3L�H���㔚QG�4AܺS
�;?�U��{G�̌G��\J��*OxU���S���{Z@ ��ve��η�RK�D�H��|���
D;Ұm�y��뀴�� ����{cӥkT�ZXw�e�	�����#K:8Jg aW��)��OІ�k\3E]�����\ؽW��|�o,õcNdt���#��D+����Ty���/>���:�}�r,�˾X��
�YL�T�@��l��=�8-�G�� -R��u�g��k�Ի赲�<�Vn�+z=�E��4��� ϙ��VÇ�y��8����~?1�r,�2�f~�K�F�dH�Z\����s:�i��ا�]SR���Z'V,���#�;�ަ��#.!���s�q%M�g氫�V���Y�઀?�v��d��-^{��&I;�p��0p<N'�b�B�B�#��tWV>vJ���_N��X������5��<��PF�%}�9]m�3�2���%��3E�_���J�ͭE`�h�m����<s#{��4;���~p4�0W-��Փ#7��L����k�§�֧R���W����_�19��!	���T��3�вq^Onj�A��p6�]��g>?�B����H���aXo�`���a�Ϊ���K-��{��Β-�h�eI���:��,8�BYGH_r��=XŞ�5vWo�W!(f�<�?j2�XdkS0����3�>�Lt���hT�pq:$���m�ԋ��y�I�ζ��4�!�~À�SH��J�Hʘ%^"����A����+��q��2��44z)��i��T��t�V�‼�'�5�>������6-���<��R�g��Q���jh���m!v$54x������'�PsNکo�s�������t���������ڤ��K';*�7�WӜ����(6>�%ek�NZ���װ/�#rN�+K|81��.<�珀pb���������d*xʜz},N4iR�[E��{�9oP{=�ႉ��S�.$�a'TM��,�-��~*���S�QHm
1������1 �4�c�L�$��5��j
��+*C�A����ʄ�������$G�=p�0^�#'9�'�	%G�=0��w/�
_np,��5�^��^�x�ל�S�1	��Ix���33�O��K`���e�d��_��0��n�l�:�I@��t>�ZCh�ӭ>Õh���ĵP�^c"ݧ1�vz(��a�v �f �VJogʉ.���E�$%W�fC��8X�kJ	
O�w����L,I,ȁ�����?��,��|x�5$�d�v��Kgm4������qc����e?"�a�ڲhn�F��T����ŗ�py�(����7MEj6�    <�<@nI��-e�g|a��?M'k����}Ԑ#$xb>���S������d_)��&�igt)���bpJ#63KKG�C�~�GwAb���+��i28[�x/��?�V�+���=H�6���x
~3�%������n���i}�-�K��:��������O%�~�ٿ �~!����ju�߯�Z
����fMv�f�oV���MxҎ��(Q�3Q����e�t�gqE�s�	��	�F�>�y���<�f;֖���;��ǝ!�3�����:�M����/�o}�0'o��63kCT�t��a��k�^��3�)�.��rwX�ŗ�vE�y��+��nȕ�_,�������_���oy��Ǘ�� ;?R���	^tr"��2�W����v�	�/v<XG���Wh�IIz��k Nn���e吜��ѓ�d%~��������-1�ݏ?��oO��pޟo��=�,�G��M���F���A:�䙵ǰ���څ��8Q?��a�
K���cf���<�2�8�P�mwpA�낧����6V~xٵ��s�+�� �ȍ���"��k��ٺ^��r��:;h���)A��R9�g���o�V���0\aW����,{�k���1��7�ya�P	�n��Yr59CɻS�{J�p(mv�\���t|��3�c,0��\�.�n�vtҕLu�#�����N��/���p�X�̍��	i�u�,{��J�ތǼ߿��nz+o� 3����FF��'��Y����1�;lb�E/��鹔w����j*�	;S;���5T��%$��|3�9%��Tȁ�%�����t��k�r�,{`�q��r�O�r�CV���
_nSZ��T(�x�N��Gf�*���ϯ[��ċ%�� -���ۿ���/w�V�u�Xo?�2�4�ﵥ҉���ۯ�fS�{T�Y1�YN�3W�NQn��,4��/�Y�B�+�q�)�q;�4m&�<̚6��T\"�*�i���K7T���2v�ko�h6�Wŝ�UŲ̈̀�Al6b}�mhM���^)#� ��Z%ҝ�t�o������R��w�Ε��ح�a͈]1!�)�5�z��V<�V��M��M�0U)v@�9M���tGx|e�'0��u���Ps�Ⰿ0��������-+��B3��Rۦº���QK��m��c�N���Z:�&�njIx]W �"�1�L ve�]�ؗ?��	ľ���>v������چ��&�|����<�xchC�ҏ��O�N����1�W%U4�^ͨeR�0��f�ʲk �sv��������X
0���f�t	��N`?�%Z�D@t<��x�k�!�]sf�%7[�4���յ���xjЉ�N,�ؽ+>�m�8��v`Ŏn&�ڰ]!��"�+��^������IEb�Yrv��{�)��%̡�Z��#jx��t�Nɲ֓�����������	0�O�&�=����1>����|Wa�����6�MT�� 3��$�_�Z�FЙ��
Gn�l�>T�ܞYSw0�Mv2\�炓�r;·��ЈZbh�ԍFr[�x�؛Ӱ���k���;�ny|�/��c��Z����]�x���7�i��85�<����#�T�(�"ZFH��cj;�ce�Ug|Η��W�5������*q���c�&i~���$w�D�E�F8`ô���0q|W_)��[a�u^Ė����)Ł]�� S�[v��l]Z���M�;5ˮ���x�i�O�ӈ�n�n�)��[O�X3�����C^k�K���hS������ÌG�q�s4#O��{>�ʲ����o�[i�O̤J�3+|�Uq&�����`M.��&̬V�C��,�ǜnQ���+�C^��c4�$)iϤZX����
6��.}R��ۃΛ���e+|��Л�������$l�����s�5��x�m�lj+�T���ss/����/G�^��aS�Oʦ���l��Sn�������T�Nx���9U��I6� Xǖ�[�5sE�B��Xab��Y���^y�q��_�:���S�V���ig�����ɒ�Ng#�q�$)���w\��e�X�Y.)���f���<g�ʬ<ₔ��uP&8+P�nq���7�[� Rt̢�
אּ���O�Ԉv��V�>P۴Vvgm�
�^�6�����69-L������r:���0tC��S��Zf0i�X�XR�����3b��
�Ө@�݇���(����[�g��7GBA��CC}�N�T*�Ԧݛf�����4L!������l".;o�iQ�H�o&�ʦI�>6���d����0���l���7-�$W���&��^����."7OĻ� �Q	��]���$�.�����?���.Z[T����-o�K��5��2�qSp�Mj��B��3�<+��<�6�o^<?�O��#�*���EWcw���>��Sی�׃']����\0����7��o��G�m*�(�����i�kS9x��V^�Sc��D����`��`p�x�QQ1������Z�q/���U�Suh��FO)�hρ�ga7cKF��̩�.�4{H
���@��'=  �+�7����EA4�`�i_Q��ݖg�6�<�d���++�s�󔂜�*��d���t�M~���P�A3�F�2��iW�V���r�	iJQV�{������0j�!���3C%X��ɽ�V�!]����aC��[9�7e�J����'�ˑ3�B/A��N��uŧ�o�)�$�
lj��aQcW�ݗ~t�A�������c(���i:�>��af=�$�Yf�U1�����	y\�B^�V��`���/��v탐����B��E:���B�b���I1�8e�1A��L�.i�	/��r�N絎���/�� ����ϯ��F��9M��w5����2m�7Y ��l��թl�G+�� �-�������~7��rޛ�P���3��<Y�H���a��N�T��@�3�>Ҟ;�i�e���Ի7���x�~��ʉo�s�"g��I�Yg)f�-޸�IN}pK��p/��$�spɽ�!�Z/��_:�����p�w�a�9쀓��P�p�+�̎���턆LC�b#���8W6̉���J���/,����'���՜.N��^��r���Zc=y=���SY�^�1M�_���Ɯ�U~ޗ~��{!�����p��������#;N��U2�G�����@�^�w_�����ܥ��~s*G �N�`��c������oOZj�Y���8PR`�**Tk6{3�ѯ��/�� ��LC�osFSqjJ��N�&�X3|���O�7�˂����\��i��ev���6f�t��}�����ʉo!y�*|v��դ�:없�&�4B�I�#�GK|�m6E��9���z��}��������ʉo�^d;GK��\uo�k|'�Ә#��V.t?X�l8��:�3j@�+t��v.ͼ���Բp�0ǹ�?�|�!h�G�3���?��[`���&���gL�
�blO�y|���j�Gr4�x�ZbR������V<5���#AVV~p$HqԜ�u�8�,8�5�fz���h��u$��0$���{Մ�	���û�BB}��G	BϜ=bm�2�]�w����=��x㪢�锿J�xR���%P>;�ܵ*E�V�Ն=UE�"(� ��:,���Oz/��vSf���Kn����.��u���A�@���GG�䨘��47�9d�UW3lDI	l�j����״0���̊�Mѕ�_����'�|���_�?��5���c� ��Z<X�9�*+l�鈵_��E�S
�+�Q�.�9$�2>F#xǱk��T��'+6��N=�}Cee��	�1b�k��bm�+4�j�1�ω����a�H��v����v��7�͂if������*N����a׽]a�͗ن��������pm���o�#�6�V�Y���U5|�?`ĉ;����_+˿d���߿�������E��þ��J��i>�s�$��i�d\��͆8�Zͭ�S�a��hf���    �{�}�ճ�a���	a���S��CO	�ta_������=s���I3>Z�����rW5���1_(H-�[��<��2����(��1:"{�_���[�Z���tYcӱj��w:��c��GO�\�)%�P4��k��A��1��Ij/~��^y�{cOCz�Sl��#�s���M��vӖQ����|UVl(o#e_S����df��w.$�uVo�����6�+�`�j�	��P)�W�{�9x/�6�آ)�-ʬ!�Zd_v�����L�t���9 ���q��B������+u�Gv�& ��w��
'oD�S��8�'krsބH4��I�Y����d�Vn���T5/B^S�/k�s�I�	ϵ�� �S,���[� �ˀKO��0̡���^��r�}�����j��e*��x�����FD���(�rݴ�iV����d�\=֏!i���[Y�%�z�����(��?���y��������A>���Z������
WojO��I�jd��*@kX��ɹ�T}8��8�H�@�H3Uk$��n{H��V}ܷ�#��3E���9�� r��j�ƹ�vZ��TK\�8�f	�9�ۅ����e-�J���O�缏C�r�'_)�h��<:N����Ւ���U�S9*��u+��-�K�.N�\�3E;+�E;�Z�ΩuL������l�w�\�}����BkVZ�k��.�7�V�I����O�+�v.Io8!?`�+
N�̵K��}���WV~����Ѝ�zD�-~������1���^��f���:fL�#oX¨P���dgBi@i�T��&T�YH���2�`�������r�M���Brkn�ʓ�s��r��/I��f<srn�6_9����Ip���
�&�8"�]�u���jC��|��4Ȑ��cg��bS�p�w�W��n����������Gs�?�Ƚ�/|:��r��4���}���ެ����g�E��b�4;�����IG�\��0���o��>69�́\�s�5ɺ��$�Z�!�~V �.Gf�y�t��SZW�n�"�����o�4�12>	�V�OX}���_��yD쑎�[��f�w.��}�j!W�s~�Y�������,���	L+pי�+���0���29i��&7،ԓ��ˎO�)[��QhQÃN2��Z�Y�>�zE��w�'�;��N�r�[���z�G�aʄ���17�m'��Y������`��Vm�|��X���J�{�/b�,��*+'�y��B����29�iȕ�&��j-���p�CUnPt�2��:�8N
���{�/��»�s��7���h�.����B��>�����Z��Os���k������A��\���G?~f�!��g\9�m�0��!������_*w��}r�o�:���5��O����Yǜw\q%�}��I��7_VN|�Њ���WE�<Lu�#�:9�:��r��ǯqO	��K�d�8(�boƝ]�w��!��٧�ʉo%��^.M}�&��Rpн���B%�Ȓ	�MWG+7�va��϶��pMӕ~���?d���<�r�L���Ȍ��������ٸ%x� N����0iG.hq*'P;(>Y�grU����"/��+'��>��ʾH���#�DG	H��7^AJ4��b(�3���q�3����V��{�/r��۽+'��W����#�V�P�N��M'��Ӱ�w��U�O�M�i�޿{�/���ܿ'���eC^}�괹.z�����4����F=���AE�ڭ6���T�Y�~��_:X�>��ʉo)B�:.8��B��\�Y�-v���:�B���tڅ�YMڢ�:`��J����p��_>Xh��~Y9�M2��R���$�G�"���iFz�T�I� �+�5�bX#�m�ƙJ����J�O�R*j��W����_�1K����>��Km�f���t����F�%ѓ��a0�3���{Tp����/\�-�&
�}���L��'��z\��z���%X����Cb�t��6��v>�&�X��~��:����a�	E`��!�&f���X�*�~�#����/긣��!k:^<&��2L��xT ��.��w�V�z��[	kFRL�` %�,�:��iN0�Js9_�W�@5(,�h�f����O��U-<��9~�P]���dS�(���ݽrx�&P���CA#��[Ms����7h+m��U�k��2�s�D<�<j���~��t�\ڡK�Ȁ�I��8q �=ΰ�������P*	jޑ�֏�mk� 	���mW8ysm:�ְDC}kx�5��"�7�8�ao#�x��ab5���4�o�5wX*+˿dK�9���; ��V9}ѣY+߽�'c�#+���z1uΤ��1����4g�BO]�����
����֜Ob}�V��KդkJ�z:<�L]���v�u���c��GN|�[���U�m5�%V��Y\�y�pC?)�0^�XD�7z5�N���2�5�o��Yp>��]���V�<S1��K3�r4��4�BB�x�%��{*
���8V��3���������o �ʉo��@�ɴPpJ���b���9FH^:�H&�W�D����ɸ��R�Z�3�5�v����+춲���J�#�5]��qH�$�d�[ˡwm=�o��J����.���Y9��I�0atjg�_wlTKf��&M��
�`#Y��44ʄ2�+�V3F�w*���7�ȝAY9�m�2�hHG/����� rs}!�n�gI��RS�"���+��`.}J�]����O�T���o��sY�035ǚ�V�{'���l�Nu?,��5�c�k�r�n����Frr5_�M�x ��z+'�I�&wAm7�k	�Z��o��B��J���/�e����[8�-I.V��&@���I^��f�u�3��<��gD����_5����e����{�/���vݿ��$�R���I��[o����uړ�z��(����3���3&�\Z��Z�u_��=xqy?��r�[s��@���a��ې�J���J:�+�|���/����e�~'�	b��+T��r�����v3c3�V�V��VѓK�i�Nq$;��I�P|>����Z���x������?���c�w�p���P��S[���F�+�,�X��\i,l^f(rꀺa�X�$m�:3����H	ۜ��nE�_Xye�O�����w��N�J����
f�(%�g����e�RQ��i�ڨw|Eo⚺7���7�ڲ�"ǆ���'�;k�����ҕ����ǧ��8��XK�GQH�&Yۖ�)f�P��;�q��W}��������"��L��J�c	d����&0ŬNLq.��e�bo�Q6���tDgs�O�u=c����
�O��O���h�|�ꯏ�����H�>4�
Om�Y�䂓�傃+x��&Cdg7���O�ԛ<�vHɭ�N����WGW��6���;����j��o~�ϧ?���˿��_��������vS
���;~z��?��s�����S5�7?|��ˋ���bR��_Ӹr�ȴ��bG���͹&��ekl���|!�o4���߃z>{xO�S�4�՟��?K����X9��'j̍��A|A�N�@�&e�yj
/S�z]Ƿx����S�?��5qo��
�����T<r)صbsT�
Nɐ�[,��X^�/��×Om�h��uXo�<8"d�+�����N��n<w�ķF��I#�9���4�B��xj��3T�4 �6q�3�P	�m8�#_���_8���W|�	�B)ږ��N��ֈ�������η�:NwX'��t"��.)C���J���O����uWN|�5R�֚y��"��|lҁ��k���I*2,Wv�͜	Ǔ��v06�`k�!��5vo��C���n9�ʉo���~uе�'�M �4��x8��[N�+����/����~�~+'���;��8Q�4�A��r��e�!���O�9\YS�iq��Ѻ�XmC�r-'�/���jV�wVN|c���������4�����9���d�~��<�9ڑ�X~h�R�x?����jV    �w�WN|�>�3�h:��6����B�4$�q� o}�[	m
?2�7��;���˽�G�S�ǋY9�M�8�g��{�&ɴF[=����-���:��'�Z7���	j�9zo~���g�]��J�u�ϳ~EzÎp��^Y�cG67#�����Qױb3�C������n��f5T�4o�=g,�:W����Ke���Yj����7��IU�zI�'����E6<.��[
��ƻ3���Z����x�Q#�#�m*��ޔc��g�ڑ����ǧ�4\QWE�\���/�lEQ�ʘ�?i?�^r ���C�8�8�)��H/�`��sK�h �v3�p|Ҳ��BDT�Ȕ�s�S�%yg�e9�N���R����!=UD�'�?O������~i�Ur6~��d]5ѮTkR�S#Er�� ���7�:,x[�)V����\;�T��v�H��M_��͕c}��&�yݒ��j-�����z,k�ћ� yD��Zc��+P�kޭ%)�T��&Ⱥ���䛓�A�Z�
�9�B�he���Nz�P$������u��x�7�����?8�B��'����s�P:q�=�yp�L6���f�C���Z�(�p��i�Qv�7y�,�h���9���27ggW��Ss�f���PdO���Ӡ,~n�;������m��m�lʣ;wnnW7F����`���M8��A�+|��a�v�p�\�D��]g��uM��?�^]l���ڥ�+�u6��M������'�t�gP��|[U���D�Hl�TN��-��4��1�˩��\Wx*\�������lu]�����HǨ^�!1����uX�Lؒ�k�&5��o��"Κݿ�OڔP����
��� 9p�+���V'��8�AeӔ����xBtQK@xa�27���-�'3�7��h�x�J+.W�|��ML��K��263&�������
�Y�Hw<�b�����{���D]7��A���
����Y�/�9�hbq��U�
W�" ��y�$��F�|��1MnFQ��V.9�=_(?��)�;\X�a�rDo�;����̮Sn`��X���q�WJt�K+��K������j	��y���OD�����,�VP`�r*���������m0�`�C(��#5�X��o���?��Ri���p|*��͎�Yũ#4��|��t��w��$*<��;�,���d�㼎�癀f�l&���ei�6��`���.:�{T-gP�#���=c��YC��L�����&'bV|�����Ɉ�����C���?''x�×����;'�?w����G��F���A+�[�����h�7������C	��pHǉ3'���ň\N/u��i�í �Xׁ8j�k�0"�h��O$҆��&�mV������!�̇C��/y8�������i�Rf-KF��t�*��2���Ϗ2�y2�RzR�%�#B9YM��&dΞ���PA1a5��쯁����2�` ��W<�x*1y����!�9���8z~�},�C\m��X�ՕM3`(ʄ��5:��A��_z���h1 �S��+�-�� �����3Kp�*��S�Ko
�Q��ֻ���J#*_8�B�9#d7��[>��}x,d�������9�{�^�.h�ek��ւx�����l#9c�)�d\�Tzၜ�,�M��tm-�Rp��|ge��"���x,tC�;#d��X�c�E�����V/qH)�&~��[G]�kc�8�=q��j��dD$'�]����y�@�������a�.�������VxZ
?e���\q~�\�}�s��͹��������:�f�oYu�{(U�F���'�}'GR�Ey8�Z��B�g |Z.'�N�(Ѥ��Mv�2^�7㢌��l6��Zm-By�K��rQ X1=Q�5�������nUW� X����X*����`케����uuZ"N�U}@�l�z�8v���7�T��zF%�e%��5��຦�n���R����&��@��V��`A.,�s��c���Td���a�(�,27�b �-�������	u�e�-�:��<�m�����OG�n��vK=��/W+E<xn���<��S��3�`���%R�й��w�GG8m�>���i��F�v�Ӌ�\]���(���a��n��;�d-<Q!�7���%�Le�w�je�w�m�w%R�\�+��)"4
��`�؍��y�E��x�oLxk����n�/F��`�f��lBV�|�;����ZL����z�f2���`ׇ����
�����#
b0ɊU���Krs�d��*�nBޯ�o�k�o�zɥ0��P#r9i�	с��X+��%#x�b{��輮q�T�ﮋU׆�
��$4�0��>w8F�n�I���qu�uY�������G�r��j�U�KH�D�G%V�e�b@ז���Ȁ�b����H[8-�4E�U*��}��ao�W:�z��QJ=�2"���\F�%�s��r�{�]kZ\[�F�%��Q��r�ܕ̰��Cvi.�0@��G�9_�R��;��]�d��E9[�:"�S���0k�_�!�a�x���6�y�x�J���euE��˷T{+��K�k�j��$�[>O��پ�H�vg	ew�H�_�5%=��X�<豈KH�c�H�dC�5��q8 N��IA�aJ��^F�8���HN[�fA��6�^�D�̱!�̩�c�5��^��N.=93o0F�r��x�H����3]3�v�I2._�uJ]ZIE��j]��`n���l>�n�#d��`��麛��R�z���NY5����Po��2Nu�,U�}ϩҗw�-�Ƃ�ģD��"u�_M9�wQn�0~ �c���q�ވ#�������/81��w�����`��p�~r�c�.�BRv���������-I�%"�l���'���
�J������0HUFt�s 7Ji��6�^�oi��`�nI��r]�?SJ3@ySip�*֣ZV�4�_e��l㬝��#251�/��.\����1F)��˪ (T}���ߘG+�h1rϸ��*Ph	�kG)� 區_7_�%Z͓��������	8б�����Rr�É�q�U/F@����\%���K]j�c��^QXe�ݒ�Bk[�j�3h��{�����4���>H�t�A��!}?����%k�w�H+����f���i�r߭Y��ȡ}��w�{Pa�?���\^s�軝xb���Zl}�����6X�C�!ef��&�HI��f�����yg#_6��%�" **$a���]��8,��Ƙ��3�t��3ߩ������60�Qm�3Kȶ���r9�`:�*�w�_�KF�ʾ������9�!��E��<WJ]|�!����چo�p<�{�AX�UZ��xZ�7�i�5�+m��t���+���-M0���WH�����f�T��+ i��CnUV�R��_qoMU����]9�_�)!���,���Mz�[>U�ZU5����v�Í��伲̈́ʵ�/���T%'p�����n����li
Z��x��q�MW�����0�P��}f���f|�$��^W�Ѻ��,#B9�`�/" �Vì$m��f���r�G�=(2�KJ�[��������!����O�F�!�Q��oI���=;�aD.'��������(��+]�^�e�!jo�FQ4�<J�`���ܫQ�;#d7�Ʒ|8�fp�����PK/��Y�1"��iƛ��b�u"А5
C�~��C���E���J</�����jQ� �1xϝCF���
<n��q~�C���b����1N�ϋ_����^<8��?�oҫW�,�A[4p��=X�V��������#����jŰ�x.��+���8��t8�Nnr�+S-�����`	����o=Tz�m�n�Pz����сvO>�v�ep���`�����9�e��c���z�ȔM��t�Vl29�$��*�'��g5N���TZ�X1By���nI�wc��xyrB�Iȣ/����T\��}��xE����d'�[lY��]$�c-L51&���H�W����v�Ls"wl����ہX1By#��M��    iv�a��Ծ��e!YV�R���9���,E"���P�a<h1S\�*(�QF����h��d��&x�&7��e$�7�}=�۳���>���ʷ���2r��l�zD�&l؆�E1���]��^T)=d���juu�$�l�e�S�`	�2�*D؁:w�:@vSF������E�PpyI�y�`d+'�ȸڻ�q�:�D��I<�ؙZ�]�H|?TFr����;�(#��A�!f�]���[�-����0�Vcyz�Њ/����+JQ�q)#�Ӻ��f��O"��E<)���pj�iލ2wHG�nR��������N%5rp؉��n�W�n��຃�]��b��d��DN2"ֶ&|7p�y�ESʴ첕��N��P[��C27�৘[1����k2�!���⦺�k!�\��*��9X�݈\N55xⱱ��
2;��.�Ħ[�/e������� ��QÃ*�\(��\�̕����،o�p����n���25���w5�����):g�=���Kc���8"��26���T+�mo�OU�s�[�x�Fa�O��;!��C�MnxOR!	G���C !������Ɔ���p�e�.�٤ň\N�N��o4c v�y9���z�w��1��D�z�W��B@�)X��u�+$ �)���8[UV_�p�%�}��!ǈ\N^&�� Dp����E֑޻�v8ۼU��^V�*OA!X<7`d���i��d��ƫ���&.������;�Ȧy����QWYy,�ZJ��M��H�I�)��C�q���R�P�DҖ�-r)��j�|"��$��	�d�����35�d7Ň��x[��~��׮�Rz��~�x@('��j:2�<��IP)Ntr�]I��fN�x�b9_�s��׃�Rd�I�wW�P�b�W�>������2g��Ӵ8������������B>��Y{����w�5�ߑ8���~�SS���xI�_�Awэ�����,ّ���Aň�J��㓍K��P�d�m�W�5`����_{K����f�AFDj
-6�a&)�f���>����α��7�1�����P`�4b�7
#�N��?[=@v��ݙ�}t���/"`$��{(���{9u�t�2�3���'������N?��݋w���~l��){��`��B�""�FDE�]��\x�`�/ ��bM����.���1;�kmF���/�����]�>�?_�������������oX"����ݓ��O�ҫ�����ۭ���������^=x�+���>yc���w\��~��{ƾ��c�o�4]��ª�7�f���vs�~�vC����;o&����j��i%+eͬ�7F�X7q~�ҀdO{�E��f�t1���K�,���Y����r�J��5�\�\E Dx�!�����!���%���Wk]v%m�+q�|�%� �+�5�6CP�����d%�R��W'���K3p��g��Ӓ^���x��?���.�j��ٿ>k?��z��uG�d��Z��7�߿9[����BV�/���K(���J�?N��\�'���G���Ig��;�K�����-���G?�^M^��N]�A�8M߁ߙ�?�Ng�{i^���=���}~�N������]r��O�w��6~{�O~��u��y��z����!��e;��'o���W�҆�'Rˀ����x@�'
��ڸ䓇+��E!��"�Ŗ��g�;�j�D���y�+�a��n*����>�F(?y��.�T�\��S^=�U���1��͡�՘��5���%�)��j�I�*֣��'H�
6��p�x�����R?�R(d�(ZE��\9��HT
k)0 ��n���~�C�O��G��^je�]0ӳ�L���:����GE# <x9��5�a�u��(;�4>�*;r�I!H�L�6BvL�-_�n@���M�u�B�-e�:��O��I�^Ro<@�sV����$NK�	�ؒ!S�QX85�36C��˙�[ �d��pě��G�^��-�u~�{D.'���Ih)�1.��6�{)��Y,Nڎת��Z��P7]P1^�O��"�����o�p<z~��v�lHp`�$��X!W��Bxw�(�ׇMׅ���r֣�)�կ�JƦV'qB( ���r-Ⱥ20�NXB�Hph�N"��Ec�7���[Μ����[>���Z?)Z��j�sD.'cK�$�M����
��tC�/mAN���FH�`�<�#k�*εbBNu.�!�̇�����Q�k�Qi��H�<4ˈ\N][S΍i{�I�wB6"M]�k��=�z6�2�/�Ȃ�e#F�j�����a����x1e�U	�V����(8B9qhn�[QpN���w4x|���RB���$�c�R����"�Ȩ����Δ�QE3@ySEs=�h�լ�Eg��[�/�|U͗���Dƨ�Ei0�v	%B���sK5zpaC��QV��A���a�]aj��(I;|��F������ľ���H`�d�|@�&��)�1Ӆ�^	�M��@�h(��e�:���A��j�&��h"gYoB��:���:�Oԉ�s�:1��ѳ�����B�[���+8˹Ap�E���� [�}w�������u��>�6]������j�]x�G�p����������.ڭj�'q��髺λ�����Z��?��J�MtD��,�i7���r���U���W��Z�ʊZ�XY����X���IC�,P2qi\4f�/d�yS��Tu����BM�Ú�s��Nj�^UR�Ӽ܎X�v<�4��e��敊c�<��y�����lޗĘ��s���ɀS��պ;i]����7kf��y24�6����Z|԰�{F��P|�[�k>�f�U&�@�-y`�/�u�5��S��!�Ϯ�\C������>�=x�{M���|���E�>q�ܒ�q�%j#�=�h�Ra�cdg[`��
��A�"��u�j�ucV墬�{�6W�C�����Zy�jU�s�*�xn��|�Ra>����X���U�^��,�� ��uN�2������q��p�
%�xvs|OKB@j5�M�����[)�*G��#ju��?[��]�/�W�����%3��fu��6H7[1"�S#�M�"�]�Z	J�
�G��$#�)�5k�AS���6�=�XE�ԡ�{ͥ�i֑'}�Y{�������J���4�w�j��uU�$�c�t�y�C�c���ߞ5P���[P5e��m�i�����XW��6Z)ju����d���V�1@�Վ�aU�����=� �/t=  ����2j�q,Gx4E<_I8<�pqt炿D<L&1��<{#Ki��Pʹ��	�O+��b��\rm��3���n|�̳�N3�<7�:��B���ԉ��	��n�� �$���b.F�TklI�1�΂�eh�͚/��4��p�o�p<���U��$��=gv-���ؽ�]������A�R��j����G�d4�8k=	"�b�,Y�\�3��e����Yn�H滿(���ٲd7%���بV2��f����/�G�r���2	�}e3�N�Ut+="k�e�+� p�*�V��jF�`A���xk:y��3�9_�p��:��x���nr9�Q*x"Q4)9�QEv����8�Y�Dp�BqB���i'r	I��ޯ�f�9(o�9�[=�zl��Ҋ��{�?�/\�DK�8�3:FDjR����,����=C��$���S�c�jJ��x��JG��g{ۤ�{z��^i��F���|���+}�*�3_� ��%)�G�
��LM9ac�ӢG��^�q|{�l�2�
C�!��z�^�6i,H�# [�y=�hF�(o��	���ŵ�w�lA��K���/��)Ķ��Z;�n�l�^��N��Ћ�@����\�$ui\��D����u�wI?�Q2B�i�͜�E
���@�ziI�OݫD7%�F����)pK}Y��$bsN���P��:%ꖶK/x��F$y�
�.&��f�VhZN��Ԥ}?yJ�&X/	����Ǌ�K�Z���Ǌ�F�����O���$��=_������_*ÎS�K�g    ����>�"�N�,�E6��r�G֘]Yr��&f6��~ge3"U-9!h�ˈ�˰�<��5VK'W�3�� 1�%LA�Ȇ':�O�,v.���=�*r�Pgh��-zUd�Y�p�}�|m��4��a���Z�����Q�%O*���w��߽�7r��E��W4t}Ȅ��k�����ň�p�4���t\���l�3����HI)�9»%������dq{��_�+�rpa!6P���Z��9XF�Q��<�-��<���/�u}�n�R;���>��Ix�J2�%!&�)�^	��\��ʼ�Ĝ�,�j_��8B�G0���BPi{����x��|�V��Gu6ۖ4����ᇨ���U���$d�I�u���m�Cy&c�Ѕr`���j�6E��X=�8���Vʗ�G'�J�JXy��^-��:�ޓ�,s�
V�E\i�ٶ.\��xVRe��A�c��X���h��[�Ӗ��(�G�!�ݚ��K�ab�W5�J,s��%K0��aD�49��z�����0#nk��-�f�+.;nYD�U�]�޲-;�����qS��u���n�<���2'�w�t9`��s�Z-�%ӳ�Mn1�;� Q���Zn��&�x?�Fn�+�.)��>�[��zɿ�$��1��ӫ��u�9������Js;v.IY��x�Jk�ᝬm���5!��S{�6�m��թ:����q�J�_3ѷK㕙ǏY����.��{觨+���f��m��,^��a�5�t����ƹ�;� ���%m��x���Z����[J��l]��
����v��>r-�B<�J�<�ժm&�(�U30/s��¶�n�X{�>�}R�g��޲����tqr���R]3�w� �8):��)+��4��n�"
�E���\�m=M����f��qCA�L��t�PfQˏ;<#�c��z��J5[�4��)�ҡ�h�Ad2����NOm��k<���9|��'DkAHD�Z�L���y�[�?>�ƹ^��2:����69��������ׄ��A����64�����pB�=�w��2����F���ב�!�_��,m�S�#����R̂�Ϣu�|NشT5��'as��^6�E28)�s^v��'|ʁ�'��K���z>�Yٔ�
% �
Zx=���\�[�z�Ҫ��_��-�N\s�X����?E����e�������T6����#K���^}	��o�E��s��O����zAj��Z.���Ù;�"�;�k�;*4(o*4�g�����0�eK��Zj�ן�������I�(��K+�=����m�,1�(6���s�Ⱥ#檔��~{��|��F����[��;9�g_��_tt�
)۩������d���D��<�!��.Eyχag� ����լx��"�"��s.�y܁'}���k���*n���;��0o"e}�ŉ��c����	�HJC�}��LU���w3T"urX^3�+j�u�}9�=����J*^�����J���kdyS�T�x�TЈ�QS�n�PN<�ǒ��{�p^3���<`��ĭI(�����6��|�n��bsj�����Mؔ�8��ͷ��D��z�U�(��*A%�ǧX�T���U��y]c���?򀹬��vYE��*�@�(�˜��Vk�b���kw�r�N�R�� d�b�R~�v�HNg�K�P��
6���g�G0�UT�.��EgC��eN
n�s|C��Э��O$B(�[�
|�����-����[)!�+�ʂH����M��沊J�k�W\�u��ɕ��N*yZ4�h�EY�s���]f�ܶ:	�:�S>3>���N$���Z�yݑ��/w�z��Ԟ��gu��B�"�US,��+��"���ݶ�U:x!#5�4��#�HM��-���R������h#b�Y�;�ĉ�+d���܃�/��I���]US�v����p1���*Kce[�pj>��x�VjQ]�Ԣ�Ko��o6�;��)����nđm����VΏq�%��B�(���B���������n�@�t�g"��)޻���Hzyrw����<�bX��/�0�4���BHm�Ґ�4{a4��	�gL������B�}��m���[F~WC�aVQ���=�Jk�VD�A9�������e� ��O�p����GO�p��{�|$��������ܒa�4r��`�e㣳P5��Dc@��xR��R�;6§�Ƶ�Wo�Ѫ�����dL��e	v�GH�x��ӓ��/g��g����ŝW���y�;�pP���C#�[ّOQ�!o�h�Kj=8����[�~��8�L���Z�<�3$D��%z�Ӻ��4g�?B���OO~8����~������\4�?�z|���r?.!�n�d�T��0�����b�f� ;{�j�1�UI�i�GV��x]t�Yz=Ic{�n�GH����x������O���g��C�<F�w���˜rt�{D��X�k3.%��$ot����s69��y�4�B��	j��n����O�n���	�~��ѣ����ރgǋ�O�9�C�^ɥ'��ϳ�ӫ�tv���BcU��3���B�LE�^t�P6�GX���N .��"Ø�R6�[�?:��oyVO��q��9(�����oGY�d��iQe�(%A1j�v!J�>��&$_��5>b��!� y�@9Hz�GH�8~������?��=~�����ˣ�/���4����z)�
���#k�,�j������,Z��al᮶p�Rv��`��ˠ����#%z��۪}�}���n���������U݁yL�Q�3��I���QTb��j��$�㡴W�f�╛�lLM�x�Ug�4d*��Tk��ٝ.��Ϗ���/����Mo~^Q{0���fi��a��f`ѓ��C	��e�t�#�Ӫ�͔+����j0��D�^$v�R.'���v���6�?�����gG��/^B���e�]�+?m<��	��CÍ�R3r6_G�E	%���;NR�k�G�r	EjPd�����y�GH���sv柷���i�֡�� ~�Y9Y�ē�\�$j��ʆ�`k����R��\�P��M�u��<�E��km�,eۥiH�����p����X!^,�j?2N�����r�--_�Ί�Ȃ'o����k��.�l�;̄�I�ze[W��H���-��W짮ݧ$C~�GH����~�α��'����2 =(��R!f�o�Y���ZY8�Ŏ �u�{
�jcJi>�	�g�+�A�}ȫ �)6�����.w�PޔU]ϲ*�eU�u�G_xԢ_ ��.��IUx/9UvW�m�H�C�V��=�w�Nx;����,n���� ;y�b�:����	�@�_�j�h�_�I�M��6̧�F$yJD��-(�$������h#DtpeS��=���j���x}<��u�:���ݦ�W�d����N����Dv�_
�Is@�͞���$�/Y�]�2�ű�*�z(�}�r# ��l�ū)vO����-	��@���yWs�t;i|��'k�.�^`Gƽ�'�c���Jf9?���;R�H�G?�*E��%x�6(��N2k��=s�i�J��^�`|�9vp~�t�����ѓ�O��/Yǹ���7a���UZ���Ռ��&S�,��I�a�W3^�a�WNRU2޾��F���+Eg{����c�t���ͼ����C�Z󚸝F�7���o
��أ��8F&��A	�x᷒�!0�bv�*{��i<1|�H�N�sq�H�������?��߃������2ܑENPݾ(�`�����$b�Ri���9_%d�ɽ��!�W[`%)�̘A�kG�cvp|�t;U����{��i���{$(���q�]�r6?9�ĩ�L>U���q�-7CV.j�'9��U��J8Qx�w���u��dZؕ!����䇳���}��z�������I���$�n�P���J"Y.y��u�J��JO�\���ךģ���wӔ�NPU�R�#��J��i����],z*��W� >(��J������Z'    ���Ү�I�����h�;%���PI��S,���-5�y�N$գh�tS$u�<���\������~8;�󃣇�{G����~��@������}���x7x=?(k��t���8�i�@�S���xS�F��E5�pM�%��k��ȚnP��ӏ�n'��-�G�?<���zi��4�6��)��S�A-��j0�>���c�̕�X��Q޹y��(��բ[t4ͧ�˙!��=�;P{���r���P�l���*'�bL<�����`�ZD�l�[(�^��|6`���έ
WNQf����m����-������g�?~~�mN��k���x����Cā�TlBF��ď�{Jx��sꫮ�Y�4+� صﵤ��_e��ǒ����ї�'1��0G��ם#�����#��=}�ػ�����l�K�"�>S8�҉Tq�:+Ld������ ��:Z��lW�o#t�KR8_�1Oq��t��9�M�eg�r���D���e��h?�����iMge�+~�Aw�-��1]�����z�Ĉ�ۖ�J9"o��j�R�����~�!�.i�d�:�]�#�[����](��GO��q�ě�3l��v���3��1�Y/gd��֘��c�UؤV��K�N`W��PLW��ӱꎃ����4�8PQd]5����;�~Pw�����[�����$<(�=wT5��FV;�
� �Y��`B��V���C��8�X�l�g��{0�1�sZ��%ohW�鶿���<z�x�����=��^N��R)5�c�,sjDν>�Wd�fխ�Zǔ3~�WN}U�L֑}UǙi�wH�# c������GH�[[^<��lUa~�у=��^<80ˡ�m�1��ӫ�4�{	}�?u�(���vQ�=���U��w�j����q�?�4VI�O\Ⓔ��֏�n�7<�����_��?N_���s�/'��^i�V��f#E0���+3����r�q�J�s��e�ꆠ{��0e���Ed	׍U�;���&��-�?;?�i����Fƥv!��b��mj�scoE1x��F��?52�9��t���w/	�V��pɤ
7tg9��I�}{�!|����`��-Y�aO�v��l*��$��1���e���U=�# �"	sq��CxKPe�GH�o���S����@����

�C2�ȥ7�g��uN�*4Io"s��-��$k'��iC6}���=�
��v*2^g�+����s����7��׭�p=տ����޳/���X�M���[#25!F͡1X��ZX�H�Lt�s�Z�Hؒ��(�D�/�<�F��(�%iOu�����n���UR���Yu$���
d������ؒ��"���Ě�BG<������j�FMfF )���I�3����|���'+g;��$N ,�:+H� 
��(�rS9�mT�Z��*kD露9�K�,�922�؋���f�M����#��W7�'�Z�5w"1bC�V�I���^I���H��;�"��"�H�ǚH���O��[�.�0�3�~��5��e�g��C�m��u�
�I�oQ��K!�CQڥ�t��-g���p�F�#�� ���
�#A��sf��>{�H\U��1	���EM\�?ND����SY�t�ȓ>��U�F�:U��Z�Y���s���	:q��%9A��IxR~�B%�uw|���gǳL����{�0o���h7o������땪Aj�uXݹb�������G�#^�/x�G�F����ݹs����}�ƃg��� _�߄:��@�d�jAX� �b����$[��r���H#X�	�F��[�7[zN^�ݱ�c��������U��VF(o���Cފ�pE�Pm���W�h�U]�5����x������1�#�<�R��x����
�r����f�h}u�M��ái\�i5�b�M	Cݨ\��;QdFH�M����?;f�_]֎�	i��	��VK��~~��Ⱥ�F=R�V��}����Ym�m�}u�o�T��(|q\�[�Hܣ�=�k]��v���~ ������?�wtg�����z)w���"'����4!=��d�\��'ߊץ��զ[*��;��@���z�o�(��"B�]!ݮ�:��������Ƕ8z�������\�u�o�}��G�� �V�h������'��.XU�Dx�4;�ɗh#��Q�霱���5��*���j�sE�Bi��NFH�S�|������u��#.ܣv��M��4$�<���Z�D��&�H��!��cM�d�d��)p���+a%�:�U�0J�j��=�j�!� ���Hw�X쓎|zP�ۥ��7��gd��J�U�8�:��t�ܹ�6"�46���r�>0�!^2ib��c���Eo��] V#�;jI�_ �zoe���%�}p����,w�<�Kie��Mo�_!1U�R��4�kX�����P��� .Q��`\݅d5B����k�8k��f��y��D%gk�F�9eS�y��3�z�N��PF-�Z�U���슰	���r6�."�����ڮCo��iGH�ѯ�pOį�����V����0�����K�7?Zwd�S�K�ȑp�!2x�J�X�E]�`٤<N\�⼄%�]hYW����vUP��n�8�O�;������9G�a-o`�S�\���҂�����{�>4�$��QW�Ȕ�f�x� ���!U�첧�L����v�����x��綸szQޜ�^ܾh��ql���;�6��Y��B��#�ʳ1<P�e��)K����tN88�c��ø� F�Ĵ���.-?B��ϟ�����'B�<9}�x���r����T$����O�zr6��Z��"l��e���qBM�9>��e_��BMY8��9ݯ)f�a#쎚�ʛ���V����rok��?~њ+�t>��;���(�L�A�������z���"cQ��s���B
�]���T[ġ�1T���$�F��/$��M��%�̗J ��҆��k6��)���e�UX�&5N��n��u���f�:��p��V�3�;�Ш��h�t��}_j���� =���[s���_FV;uY���P�ŚaqS��ҩ�د�,d"���2��Y�	�K�U��0f�tۥ��ߧ���M�e|\:ghzd���ݥl�ޔ3b�lL�kd2��l�u�HV���j6�w��NV��5��a�t����ǿ.���N_�|����/�6�O�8O��7g��j���g��
+��L��^��~*�wDt$(y�xe8��h�=%��r�+s-I��AB����_�$���#����Mf���_�t���[�Xn�8�.L6��������Ԛ��TW��+%�UҮun�e��E�]�Xe�~W�������@�u*x5	f�����`��+�¬UX�ԕ���PT�0�ڶ*}Cl`�W2e�Xz�jqw�;��'�Į�mfWg����p&BM���𰗪V/u�n�.�,tj���sc���LfD���U
t�4�ו���;��!A\I�'�l�Q7�v5썐n�VOӆ	���y9�#����AS8�>^=��C��x��g��d���J�R^gea�7R8M�C*�V<�z�WC�Mi�H6�� gH�S�O/���x�ό��r�,y�t����"���
Z)����X�!�P�j�ƈ�lz�%�l��Q`<�c�Z,6�]��#����}������������������y���n�]���FV>!��6� ��)���$��<٠c���Q��x%���Y׊���\v2����#�����.���fʃr�-%��f]ϑ�N���d�,����R��;��U�W����ऐ�C���W���pN{�we�GH�A6q��ɓ��B ���Lƨy���s��R�Q1�q�7g݂(�ilv�_���&��I�a1xq�D.��b�a�c3B�y��^/��y�^�G��h�G��t�D��v ��sҙa%=lnd,`BP�$�ɀ�EaNF6*!Da�j�x��F�%�F�~��&GH��~Y���,��?�3{���=,�    �� ���R�蚯ғ��A�7�ܪ��Xap��U귅�
w<��4g0"�d��݉ɦ��m�t[��������^W�����¡?�q�q�xƁ��G7kWG�<��M��T�qp$+�5�L�`w��_U���-��aBּ�֩��p�v������/w�,n�ׯ��/�b��q���>�_C<�+�ٜ�Ȓ'���O�S>
��%�u�T����)���ⳍg�n��]�Xo�w��#������8(�#�������%O!X��X�0�-ׇr-b�Ǩmْ5�`O��V���H�!x��s���6���W��������G���S�%9C�d�����dvQ�|���8 �T�d@tuP�&��7	�7���H����i�0��ml�{|��K�������5�!9���Yi�lu��b�l�dK�9=����׫Z�tNr={�q�\���g�4as]��!��%-ѹ]w7#�۶��m�r/�}m���eq�����>(��Rk�m�0ed��ת��<j��FE� t�� ����FJy�MI���,b`>/d��SXFͻZ^FH�5�Kh������Oռ<��ˣrp�gU��*��&U�U��x����/�DL*�V�f%Ý��ė��7�>Q��
�|˒�2u�m��v�/~u��O����/{�����8��Ґ����+�f��r�$b/A�	����n�r�g�K\:b�έ �AoB��lĮ����l93��'�'z�W��s�,5E�{*:�\r�Eg�6.5}%���P���KX���%�cψ[�Z`U(�s�}g���v�-`���r��A�X�q�����Y�ݤ�<!�n�;�W�j���^6��j��$����5ҋ�ØSIZ��w�;��F(o
�g��⩱�BC�����zZG;��djr�]BMW��mފ�R��R��>��Sc/�g�*<?˫�Pa,7��=��U5�d������4�vI�:$=>{}��b�n�p���u����C�2���l����z��G���j'ݡ~h�#J����_^��3�'����7��4�_%�:�m��UiW���v����/w�ϠZ~ޫ�	���v	/�����B'�`%{��W���}q���(v�sE�z��Q�� qC
'�F�|�����-���}����N^�>y~������K}P����a�v`d�S�cq4� ���w)�Ҍ���o[������%�!H��j�GI
����®��m?���ǋ��O�������u��v�������a�9���93��V>U����[h%�;�Y؋��w��r�{=B�1Z�2ck�"L�K�o��uI3B�]\s��g<>>z��|�^0(�������Y褋O��,\��\��J�Ĭ}���۸��� ���x��pFz*������W�ۗ��N6j�/�������9�>��*�2{o0���7�� �J�1�\U4������{w����51�yJG��s�
̘��i��(!ݾ({�}�OW������Ӄv�:Z*����`G�9�<萠�eb���6�`O�i��+�o58-#c7�_���E�����$~ٕ	 �b���?���O	,���3pAy`�"=��,tJ*�.���J�9/�8�)a2�6���t	\v#��`���#�jJ���!�w���~�	�\?z~�lUR��O�=_��y�|�QZ��q	�����݁UOQg]����Gn���O]i����əh�3P�̐�3�g'S�]���.[;B�����&��=t�!'?���W��G#��TH\��D0��p� ����� �ӻ+.R0���p�"(m�D�H85*��c�Hg�t!�w���_��=0�	���G@�j�]Ng���iK9�~�f�,B�W�HAA�B�S�$�)T�m�ε��^�g9@�}=�N_���ȥM{���	���3��<�S,q212�U���$�wlJuAei��D9*�ż��0�_�v��&!���Yj�� �p,�3q�H?z<%��K��Ud���+��1�]d�n��y6k��D���sw��r�ؔU�	q�!oD��Z���ҏ�~��Kes��M�sBd�sd��&�:Y�[b�5�E����Y�+R�j	9+ǯ�<�L��,�ᘘ���R�L���n����]����OӼ��aU�Y�Hj�}d�SYň��0���<���_���k��cd���s�\�5��H�`Y��͏�n1��p�:>|���\ط=�?�5���%����y�O��z�	1XF
T�M&�a3�o�����H:�t�^�YI���٦�}�v��n��<�=8z���j��"��h�2��Go��s��u��<6���iы�}�/�U��m@��`T�Q�f 0U�HX���t�F�����n�7��1Wr~uY���AY��mg���j'#s���WSZ�'�r����M��N�*v�^'��F��.�cB*7�L��1�����#��)�?C�ߕ/O���~s��g����1��a��/�5�f7a`�S��'D{.>cl��*����ؘ��S�h+$���b�f��45�K錐~pm��r+���sOyXE�P%.ΆQ#�d��Rf�Z��nP�/�����=l�4�#�"%4.��+���2"xP�ӹ!ݾ�?�+N��ǵ���fwPaǸ�N�a��`��Z����x��9Y�QI��#i�R��B1^�� ��'d��v��~��z�nQ�SY������Y�?y��:��~� O���v4�y����O��svɈWR<4�jvrj�I�8XW�Fqw`��@���6�W�.Z���eLΝ�,H���~�⇳�ώ���������8�AyP�ǥ�ژ�kʑ�N�iIJf���!e�.��x0}��%W�����'|�}�]���)8h0޻��#��y�'+�	obM|`��v�dd�S)Y���m�2(r������z��6o\D�eЁ�^.��8C��*M[lS.^��� �V?w����G�����LWri3m>��uNJ�^u�4�2�3�XJ�Љ:�M��Fc�U,B;�;���z��5�#���K͌�~�[���}|��A���y�欑X#�W���O͎A{y w�V�u{�ۊʐ:ONώ3����I%9��!쬨�4�ME�5��<�:�v���zV�����.��i�$K|w���
��p6��c)q�}d0Y<��O0� �bk;|��F������Z���x����&n�O��	�T�2_���&&ǹ�ȟ�I��Y�I+~U�MgP�Hp�-����2L��qw����׋�.>P/�e�0�Rn���X���m��0�߼Sq��\�!�ꦘ�J�3�%�n\
e���5|G��yj1���jP�{��5��Z}�u�"y����'�R![�p�'H+]!���ݱ�0��Un/�@�1����󼢑�`���;L�۩Փ�Ύ={�8y���=��Az`7�,\��4��J'gmN|#�C��%g92p�%*���:6�+��P��x�'gMLt������4B�Auw��=�}�*�۫>�f`�^:M4����NA)ck Q�p7��"��Hd*�\!��>�Ý��>i�X5!�u����;�SH������gO^<x�G50��p���??L``�P/�V�]���T�+V
��q�����GΖ�Ѕ����UYc�wW��z9�X<<��v���A��w�ګy��%N��|(�h�R�*bث.�8K��Q^e��.�����Lf/3��7�U�f
���%�#��n��;�g���׍�$=���,��'�]���ko]G�-�Y�W���y���lu�]=.[��Ru�۸n�`W�;���Z�I���)�IJQ��<���+"#V��M��4\xխdx�X85權��T�<Cj2c����g���N��ũ2[�YOǓ*�㩴����(��~���ˋW�����|׾O���T�tq�[]���~�q��7���mF!�B!�ĉ(~��r����%��Ϭ�-�|���m��3ʩeXz�X�\o_��������I�v�sHs��
���t&[_wM    ���Z�ڜ�&� �˥c%�?�^���L*���h�r�����ЫsN�������9l��e�K�gQ]y�M�4�:���Ų�R�T6j?=��.x�z�-�`T�B��34Si
-�}������k�M�uuӭ�j�x�6��ܤ��r�c�Ӭ4�����<�a��#�6zp�)���ު�F[\�Ņ�q�S��W��W���1A�>�?}�?|���ל���OO~�5��o�W��=a�`;�1�6����s1���YPP?F|�p�#�)���H�T���ЫIJ����~��??����?~���C���G�@��NW�6���
�y��=n��ÒMWS��u5t׮�ț}$��L3�j�Q��i�IvÕ�W��ȅr��z7��?�&
�<� eߦ���V�ē1��iSg`�_N�EL�Z�KL�@��i�&���-1�<U�%5|��t�te��ȯ0�_|��_ޙ#os�E4�l�tu�E7ܻ�W��v�3��4�O�����]��Q�g�}��Ε#3 � &�QN����l����Ñ$��o�!#�ny�cdLf�,��6 �u	ZEG�^�gE�)vC(�7}����0��9�ڸ3^c�ʨ��ꕡW�	ׯ~������d\z�i��k1fl�_]x�͙֝�#�b#?�;����*pd��R\Ƨ G6�X�=���JWӻ*�5j攨��jI����ϟ�c�����v9/q��`�-7�HSY�1�}r�;r�8B��g0��:f>s�+��|��;��@9�����lǅ�W��W�?�����ѫ�lcz��d�ާ*\y�M�H�'f^P�H��� 0
 T�N�Ϻ���V�0Z�<�d5F�ګO��l��2�*R��b.�����~�(���[�z{���~����nC�!
W�}=��;t���X;'�υ�#TRU1�څ��hA�V���o��m\z���e�VI���"���B��� Fd��c��7�GZ'�I��ö�� 0�"x��;�WN��NB�4<�<�1�TZ�Ki���m����/�I��$Z��W4�c�4�xثء&k�>D{"���������1ZM���h�߷:>	�=Oc��>���7.'nD��~�e�_X���	��y�ʦ�o'n{;Z-�*fi�L��+�L3����/'n|���/�˗��W��~�^���su�W���p,%���;���O�}��3�h���"����XmQ��8̗ĲꨀI;�F��k�d�!ϯ��j� T�[���M>ȓ?��)���C���������M�6/�Oe<S�h)\��.E2�)�.�1��DW�o�q�(#O���=25k	~?�}aJ��<������P �nY�.e�KM���U��y�p� �SY,sƒ�i��D�����b�[���Y�j�^������w�(�����[���#�ω���y}�E=lr��n��ls�dW#1�3�FT�5����ӝNXZ�s�Mz����z�ҭ0[�NY��i��p����Kn��mx �`CaקB�0a%���$��[�b��VgT5:{X�4�2�@�&a���/$���>�Y��~�<��X�[��>S��n�5��mt80[Sɤ�&YƠ��|��=I��6JP^"2Pv�_��1��0SOO����~[������NgS�5sŬ1'��W�sc���0,ɴl<fe�+o0�����'X0�;�3Gי�=1��-V�5�܎�0�W����o��o���^��̕�]�o����̺C�I�n�`e�6�1���9�+�Ĳm�������ǉ�	*(��(cڇ��� �V���Y�� �°��q��]:N��a�3	�,�ݢ�d������4+r��0t'�A�ǖ\;H&�[]�C������x��_���O\K��!1��g�ɸ�d�������ր�gT7���g�~���ן~�)��wg&��O�?|������o��ϯ?���>�B���}����~��w�����W�����}��/�~���>�z���?�����7�~rq�+w��?����s��(?�������.K�g��Wϕ���'�_��73����z~�� �W�3����bGC���M�T����G|7�����"�C"�(�H���KNi�gd�C��Xh����nP=�.�|tJ�7���</�ix�����p<ö���
���6�T���`������,�������9����xN����to�?�����Œ{��HFRUБI��	���/���]�t�sM��Zw��HV�r�Z�������0��VF��[�tה�o׮n�_ޚ/����Ǫ}y-};��̟0�d�2��+����[)���u�l6��A��|S"���(:p����3��	 fkh}�7Q����#�ᵕ�6ߟ���qg�3��v�c��ʖ�
�Yr0�=�(�}OJ�����w?cžk�{��-Z�~��Og��_��������~�6V �~��QϞ��?<���pd������q�`_}��x��_H���o�i|3�hU^�������|�k��j��7s�'����G�?�CN��OߕK��Ϝ�K?/?���R������o���|��[�����,������g���p駿ח�������#r�����Y*��^;BA�Pu-c#�*xv |5~�?�������X�[�C���!���tW$y� a6�I���p������=���5_���|	�Y~j�`'�Jt�M>酱9O1\����tj�W�w����l��B�������x��)L%,�M��_��7��F�~�(.�4D��9�'���b�L�ڤ��V��Ąq��ne궨m�ue)�.�o��N�7��Dw�{Zv����"`��E�Z?��C�}չ2�F�i��3�t%9���*e���tTU燠:������ ����?�]l���vR��:Ñ:�c�ZmE�7)1ʀG�����HFD��'x	pt?�:�&�l!���'�+e���8� 3��Ε+]S�q�d��q�tl�ɫ�'�C4�CP��\�"F�~���ۘ��34Pt,j���T�D�=������2����	��X5��aȅ���se䍺3O	=d�,��7��~S�U�ck�G��!�Έ5��P�A����񎌰�{L��t'O���w#����x��
��H��Q%��bzsc���)��\r3]Eaˎʚ����X��%4��;W�tMw&?��_e��M�`a�-�M��0t�q�L��6fs��m>z�5�T�=��]�fR��և# ���6����5rg�,�uH���se�#���tg�%�9;�^t	�Lǩt��{�O����N�C���"ț�Cf���)�c�u�:+xxP���{J�U=Z��ő)�p����v����Lnv�\���,�s@Y�6"��`Cv�.�g�@`��C�Z��.�L�VC�����I��U��f���z_�hCo%�#�r�X��ç u���5���5gH</
����w�a���\�L�ll��Qs~�s�;i�^��}�سŰ/��^�$߸C�GsZ{�ع��S+���]�V�0B&�����%���vRufSr;0sf�&�j\Et�p�Q����:�e�F�5#�ÑY1Me�����3��=�i���������|
�5�'(�6E���b���	�s�t��h5�2&D"3I�O�r����\/��Ǿ0�F��*+=<Y�O���k!]cr(�a�ӣ��0t���N[�{`^�tU"K5F!�~�G2��ѝ��d9�/H��'�1XVȹ��`�]\g�v���%��/�9��� ײKFQF��Քy"�ga�c��������/�_�W�ػ���g:�I�w��=#[����V�ǜ�����Y�����j��_�䮵6�����	dO��£Z�r�-�\̾���|��M��(�!�r���^��]
�Շ������dj����ݠ)+a $�{�p,�Q��xk������Հ�]Vi��\���_��de]ϴ�ߴ�����u5!���i	�D{q���r��c2�=9 W��t��،:��#�̓�WЃ�9��\�M�hZ�B���W�2�Q�����W�=W��    ��χ���񮅕�F�.W�����iNR�ʦ�%��?cYh#�hq�R��Q��cj�Վי���{���t��)��Y'����l�Ul�j�a\�*��ګL|��j�X����2�C�1��s��K�&�By���ߠ����/��VW�%~�+����;�T#t�F���-����g�]q��O����&A�	���g�K�.���,:�h�!U��g�[��-�&� ��;��h	�Y�0�Do�??{�i
�:fl�0 @gVH"b;[NdǬ��1ֶ֬�1��!��$�j!aj2�޹٠��	�%y[��w{�{���3�I�vi7��"ɛ�n`႒�Y> ǮbW�������]� ��U�u���Y�_��.x��P����]�?�Ci�o_��v=�]���q�9�ȖR��D���jcG�a��ˮ�y$M�E�"?��L&H!���I����2M#�a�V�pz����+휦��|��i���C$��n\te�:���1i��ӝ��ȣL����NVy�ԋi��a,Nx�Zt��8�k7Z\�+][�����!����9+s�U���ف�����	���\�2pQ"R�N�T��\b9�Ĕ�'t�<U"r���T���A�&���!���3p]�f����U��xH6����+���4畴��"��e����Y�)�׍���MxxV��JR�t���mMw�\��\+���u�(Go���V�n3^����(fn(�mW��7�Yܸp�{��c������pd��jB��}W���G>�ΏHw�A�U��X��� �+�̖�>������0v�+W$y�3%�������@-�0�4�!u[H'q'QjiY�x,���U�m�qgw5�G�k�s�J�t�Z1�CНFbO��X��MR5E��3e�q0�c� (*a��i/�aP���T��ũ�K58#Nf)�É�����i�[�����:���k~�wFp{�Wd9�}���ڊD�YD�jɕ%��g���L�����'F�� X��Sw:�����Yѫ)��ޓ�{v���/���]��[s�^�t[Y�M�q^���	���d ���&2�=��Y����Z`�Q�N��?��.���C��>++	����	�8U�/9�$�� �l�'�p��-�}��G*\�
�f5������+]Ykg��Aֹg�(��ҍ-O�r>aӥlT�)O�^�n�D�.�&o��E�,�'c����͍�����n�������ȴ<�������׏��D������N��]�(y9dض�r���|p[��PA<��CPI��Bq���Ez��i?���uS�6<?6����e�N�fee�]�G�0�(68�'Lǘod3��Hn�ɴ�'�M�e��z7�"�[�9B�t���K�Ux)$T�&�t�uL�.&l�ڠ��_.6�sQ$������ʕ�Ӧ���T���V4i���g3 7�A�Q<�\hv)kW�n�+�w�;6��``V6a;���IF�n"���4�Y��Tg����
,��v����+][���ö���-N���3��wՒ�{�챛c��ڲ2u[h�Qzu<���c�~*0�|��IRVH��-�=�2FlѮɺ���y��%5L����m>�Q} r��u��04!�!2j��"����v� ��'��H�V�)`T3���k�|�&_N�4�i�T��1��R$�p�f٦1��r�J׉����=˳
G�����s�2gh��J���0��|�s���9gY�GZ�J�? �[�.�u'o��
�׾�\��ɻ(��a<���~ޅ�:'8J@o��ݣ��t�4I)�ҡ]<>e�=1[�����{#�`�$v��+��Y��s0�f������n`�S�� � �
�܊��R��p��u!����+=t�t]w�h}"�_u�,[o�3&{��'S���4���OH_����,�������-X�J3�O	�����
�׾�\�{T���5�c�%���h�W�m��4�)�����*�Ă���̊$o�%hO �2y��×��&��@4��I���Ӄ�V���(ص	Y�T���`,k�s�J�Tg�[`~�ض���)+�)/y��
g�a�NI-���V�nKX�[�x6!�xU;C4ޓmθ�Y��=�Z&'To�&i(ɍŃã���d�3�%ͬoh�ĳ��U���f���o5yސ,�_��A�V�dZlP�cz]�D�&Y�fl�5k�$"_�ұ'e���-�pZ��}���S+#��>�$�p�ID��3D|?�hA���c�f�X�
TƶG�bv�&x�Hv��V���R��@i�{���Η�tL��oF>
�iw��� }���wױQ�ip�f[d����k�Ъ�T��s���X[�Re��Wط�m�?����.M�	@`��~˽�ڊ���,��*#u�
)�Lv�3u��?����(G5�)f>Cbw��P�E{��ش2�=�Lx��^���oի��0�)>� y���.,�6S���C����A咜j��)����^�M���a@ �r��F��[L�\�zf�����}+���@ox'B�f�y�v���Wg6=�W)�ʰ�(S����^��:�g.����Lޖ*.n�Ss����}5���� _��[�-�g�����b�tU�
��کki=�������r��x�T/Ͽ�3��W/��^�J�}����|�Lq�?pA��a\=vhTn��Yഩ�g�)bx��*��������z�ܜu�Y��>]��X�!��.p��B���q:��[�ƦM��O�%�T���OI�jsnY�/:�%v)3�q�G��)�P����'��RR֤�m��f�)C�AV2rB�/H���K,�J�>$O�vx����#�8�8!�:�h���5�aU<	c2;��^�K`z�J��u-�� ra*�;h�lsM^�}X�|���~ㄕ��2��^�N	�SV���Z���q~^I��םk�~��?�	�qNQ���Ӥ�E�T��cj�0�'{�F���H�ֳ̜+���a''Ǆ�"���؈:��Mg���ݓ����r��l���
�P^��Z��u���q0{.g�X-�2os��q̇e�5`��i���m$��~te�)�-�ө��k��7�i+Y{'2s���S$>�يև(O���YҀe$����A{�N
�,�[�>��U��٠�X�m*K�%v+z�ĎEc���h�-vf+XD�<�O7�I�{%�l�J�tgK������N}`��m��qwb�#)�~����m6"̦b��i	�3kܷ�RF�U���^��;�;�����>�9��QAR~R܃����f,����;�?��~��I����DU�Fϊ[�6&�	Μ>Ow��K�5D@��9J��j�$S5�yGW�W�!]��m�%��b����L��4yVj�NvÄ�'���x3\|$����3P+Ӱ�p%}��5����r*/�摏i�[^�YO)ÞR�<�^}��iZ<$�C�unWdj�9b_¼#��k��&Z7�n��˩t��'v�Ma�A`�ܰߓt#9Di���KZ�(��[^ҙ���i�@��P�i>���O#Y��͘Q��p9�pg2ӕ����{���3}I��CW�r�*-�����:"�|e䣀�o~�x����ǻp����djc���Y�����#!'��T��l�٤!�	��o�څ{��.p�tI��?ſ�2�Q��O�(���?�˶�p��х�
���&���G���Țd/.d�;P�c�u�װ��*zb'T�?v�9�W��'�*�mb��Yb�M�OAޕ�dL���������6�1�7�w_J|��\œ�l�$��%�#ށ8F��r�9�b������px�ey�	��=����j	z'	��1��;mE�7;C��*��:i���LA��F���g=A���c�a�� $�I����-ᇳ��籫���&��w���/�yWR�w��Y~����ݾ�������^=�L1��{N�%�c��4g�F�7̊�}�&��z{)zᙍ�S�O�_Y��%    ,0�ʃ��x�LX��OM(u�\H�9Aı����ф�5����J������ߟ�-�wo)z��cܼ߿iA��aR��''y�#�/Ӆ�{�AB:�ߴ��q��RF�c��G��$U�S��/�Jn�dW6�����m��34����g��}ʨIޢ-���� �`qQ�/�ju�QL1ڜ,"����+�3��h*�a93،=T���V��ӿi��ڇ��eN���w��,�n�!W+Z�8��XW�ۙ���Q�J^Ǿ�\��Aw�<�!��� �ɐ�/K31f�Kxԝ��#�	WG�j(��è43��&S���*�C"5�>ȿY���G�3_y�廒Ç;Ԑ�w�M<� nAI�Eeb���^*��T��G֋��W��,��h��W��.]l}w}����f��$<w��9����A%[t�ֶ��3GD;]x��n�mLp��`�ɀ�J��Ε���[��}v1E��i�[0��T��Ρ�\ҽ�n��19�3��H�6:���j���F�J��J�0^J2SO6 ��5�.-v���Ցr�ڦSiC7�|<�{�҆��,������'Z:dv�ڏ .��Fz�����i' z�� ��a ����s���J���2����k&˨�ǉC畑���	�١�ys�썿�Cg�Y� ��݄��ڼ�է�B��8�����a�����cJ7p�0U��"�b�lS.]nѥ�O4�Yy#*r���wQ�0RYO�.L���U?��yk��^+&� ���f�γU9{���'i�����Z�����1��Je$�K�J�ip6�C�}�>��T��`��USm��C��������Es��>x�m���[]Fo����U+B��OZ�"�[�V"���c��(W�*�@1)�pa�\��uY5�9��� 3�����8a�F�m�%qv�4�٫���1V�/C�M�h�>V�!�(��h� �[x��T�Mm�`���,:rw��I�JN�7rәc�$5����l��8����<���\2v_��22�ĦOS|�-�Tg�2�Jv��`�0��Sŭ��?{����U ��Y�o/�$��)s5��KW�o���DZ�Y]6�U�h�Ji�v(�_�Ht*o�,q����zk�����}л�KY:�������x��CPeV��)91�ד�P�dGejfo^�z�S�t7?ε �ʕ�����!�oҁ�Xf?�0w[tz4)��� ���:�({H�t����+����~�a�M�ށ4��.O�L�u,p�c����k���C���8Ŋ�*:R�(�$��K-����j�%L0��#�"�lM�lKn����YbQ�|���O꿁퇛��4�l����+��lt�x��p�k�3�(�KU��-�M��dW��[�}��;�&g����ne�6V4� |#�wb��������>�sΟ�ʚdT��mxK�M�ij��f���6 WYF>&�~D�SRg�T�\8Ι�2e>�i�$�����;m:81���n��-�5��*�z->f����}X�?��Q�����2nLSp0G� ��Ye.v�\���F��`ghe�1��3�_=��Q��ә��i�.me�6���*�v��P5��!%�*9��V�����Ѫg��Lf���:WF>�+D��ii����Xh�ZU� s�\�<�iﭣ�ˇ(���r�H�_�A�k;�2�^K�)Q*��[=�����z�#��P���	��W��s�V�tMu�n[�V+�k��Óz������Cuz9$�A��;W�n3E��O�uǺ8���"p:0�����^J#��M�5������XXoŎ�Mҧ҃F>fO�o���A�Mz��m�3��$o�i�Vdj�3Hі3ul���`�S���W1��qI\�<Ԋ�ck)�:zo���\쮟ԁW���+]�ck9�wObG���/�]���6Z�MƑ<��� ɀ�4���Z�c���������";��ޟ��m.V�:�ӏ]Y%y:��=�y������a�~��Ȁ������;�\��e/#1�G�����x:�6��Um��[��>f �yo�_M��`v�W$y�ֶѡ�Y I(>�w��Z	6�r2�[t(���!	��r"Ȓ����}��\��Ab�^+{4�a8�ͩ<�h[�g|\����._��-�6F��jV9&<g_�j��C�q>/̬�J%) >�Dg�IN�>&z�-�z_w���Ywږu��h=f�e��n����ן���ѝ�ξcO��X�'RV��$D�b�-�k!긯;W$yk�#&��d�K+ �.Mef�eIl2� �NIA�5VN�R��N�&�6HhMw�\�:�@�F��-�dx�4����S�:m} ��1��OU�2w[:���Ύ��Qu&��=P�}�|��k��p���h ?�2�l}�m�VF>�ΏIw&�beط��,۪*���16��د��)���I�LӐ�>��ܱ$��4��g>}l�!�e��P�3�<%22=q�[��\��t%Fkz�h��j��A�hsn�h���t�Ყ�v�s��H#bᕁ}?��Rt3�Y�Ee�l�x����3�5|��/���R��ם+#[�}D�S:�%8��k؝&8�j�r������ ��n
� o��Vg6�̘h��<��6vZӬ�t2�
@ 
���=uWO,D�A�ߚ!�]�k�s�J;�f���f��Ո�7�s��2��Z�a�N��I��Z+s��lo�t�L��Ě��30��T.=+�|d�d��o6j��w1�x"[ke���ZScZX��%9bJ�~����b�{�i�@Tg��`��D�vl< KG(i���Q������t]��M|3�V�`�,/!�sJ<�a}n��q��Q����:��~��q_�o����m+W��;����qԘ:	i~��a4����?��H� ˼Oٺ2w[0XP6�+R"�j3�UOy�*Mt8/R���(�=�
䦄�����q������I��4��۱SS����@�C�\��m5����s ^ �ݐ���l-SEӣ��~�k�t"��E"Gm�Ij�-e.acX�_&y���i+#�>޷��3�!+�Y+�SҌ�2�,:��.�2��b5��Uz�� �n��������������=^�J�԰�^��4-��.�\I�7�%��ԙ�~]e��K2�y�#@�0 ���s�V�>,�]�5��9�C+���a��� �8ѻܦ+�����G�P8�n��.�n�L8��c{ ~PG��c.307�;٢�=	l�^-EZ���3�%z�=�ꬸ<��S�0y[t���A�Յ���Fұ�}�t�,!% >v5�c�z�&[?aVm�.���7�R���	W:��ʬ���r����8�_&�yXC��%����S�[���o�����wA�3qc�����uK��lb}ߑ�fH��	J/���#��i��,�0$���&��ͬ������+]尿�D���jᙘ����+s����1�i{x�v)Ԩ
DCjt���t��j�}�V'z��ŕ\L��I,M�`��.~��aԇ� :�:T�E�T�P�]{#V���H>8c�~�$oQ�3ؠ�Np1�$�+o���A8��r��)؁�%̌k�w�!a=�*��	`�J�t�Z�CНV��_Z�2wl����V�@�57� V'��7ͼч+՞��s�N�����ѝ�]G�ԪMxjlJ�j�����X46j���}���\�H�B�0œ����do4�� �'�H��=@'+<C9�Ե�C3Mo���\���V KIdAw:{`���{F�2w���P�ΣJ��h�@sJsHM����r�%�K���� >��m�c����ً^��V?�{j��ys ��i��{A�7[F���ùc�b���7d:���N:��G��9�2�Ȧh�� (BeC��Y�jZ���ε$���;�?1v?4�2w[5ղ���U�1hq�OIǖF������Zˎ���@x�M-��j�G,'|����)������#�L� KK�ɪ1�g"�X�	w�g���r�e_�M[_dЗ��sΤc�̨�    q�Z�蹟$���d�a7�
�l4��J0*���Ԕ�+]'�\J"��Ug$�.���/Z��-�}��I~�k$��%��ƽǅ��t��S)A�6�Ġ�ܒ��J)�#LM	���nj�ʔm��T�Z�l`�)�t�؞n6p�0o�Rj
\�,pR'�#<E�XҀ��{1���JMY����~��X���\�>�ijJ:H�q?�jE��`k�N��`x��UO��:���7����@��Qu�|�L��{�U>�!te��L��nU��u���}�s���h�=��~ �������}��M��l`3`v����m���:����I�B�����D�mMN����Kdw^oO���\�o�`�R�l&ɠWZ�5!�u�������� RS���;�V�nK�pI��m�2��ؠ�Q#io�[mx�s˞Z����ar�|.�Z	z��}{V�?ؾ=_�����;����W�k��4�Iמ�������Po��M~\�Х�ĠJJ�	�������� �"�p!�ilM���Yk���N[�`wګ���z��w��p�;�k�^����.�ڥ���͆��I1��W�z�)T7�F���j -XR)Տ!�ַ���Zw�ne�	�<+�P��.���^[��5yp{����^���k�/%c�+CV�z���}S�&0l5z|
N����d���k��v6���%8Mx����O_�7���Wr�^4�::~_����[�Kksv߳��z� ��%��yfgu�.��������8�'�{V��:�h\t��@�f6ؠ����#�S����}?J�2�1�#��L:�.�2V���ʳ���e�Lx��F�p���=^���k=���d<�^���%9�Y�'���qإn]oג�#cll.x#5�EBɕ+]���u���������R6�}�V�nK�Ò�TY�TRQE�Md/�o3�w�=eJl�rV:
�����2�Qf��/'�xWF>f |D��X�*�M�KU�A�e��C?wl���e�ƃ�:����H��F#�-��TvVˊb�[`��ۦ͓�N��p)&e�6%�ۛx[���Y�<]��uv���5Awz}��Jڍ{���V��ΰ	_��d�Gw9f{�Z��?{�de!�缎�Bm}�mhOdO-�|ԝ��LnIQ���<n4�)�(�B���2O�!����}V$y�v��FEǦ�1N�J�Q����C�j>Y-��,��g�YDѭR�8�2�f�Zt�J�3OE$	��֖,��iX��pU ��tg|��!k�������m!kmF�*�3uPM��!���w��x�U&K�db���gV���������#Sw޷ԝ��uSw�����0w������/y�U�f��0ޅ�N����ix �:�Y�EI�_=�7�t� �?�ݸ:��扒���7��d�i����R�(�f��F���ydL�@���������*$�<C��Ŝa���[pp��+X�f�E�+��e���`��ItN�� !�������h��/��ʌ�����裡�VF>n��hSY�v�X�lrXK=igP,��X���}P5��r������LW$y���<���Ѓ*����Ɇi*�������R1����*�*����uc���+�za���.\�]ϻ�	�?��3��<�r��n�ve���I��rê��&E*@qf@�l;B��AKB�Й=����ʘ�.�,Y��N�X���%�g.�%��nt~a�k���$P0�M�����1����Rm�͜ܧj�Wؼy!>{�|�H]�H�����Sю�y��ͽ�����u�~?]qA���u�=i����A~?�T�����L}2:_ �U��E�,����we�c�f!!�b���+]ӝk����;}>	V��[���4o���G��,U���1Y���΅�\��>�;�ؼ�B>�9I�5��V�l�e���rlZ�4`��):�t����{W$y���?@�Lq	�YB�z��^��u)���(�<r�w5O�	�.� �艰���ǰ���=���Z˱�����;0�]yvö2��[Ԝ��9�EG���:��.D�4#���=1�p�������hF�8쾀��|��]���
x���)�wsX�m��M�eҞ�Ǎ��9�F���l�r���K���)�CS��_w�v�хz���� ���ߵ��ߤ�1����M{���tM�buu���ȉ���� ��?^]��-�g�L��8�t$$�`���ƞ��t�g�O>5�ɡs��Y*\��Nr?]�@Z���S����o�̂M`c2�L��a	��<C�#�ᚿ�ح=@�}~ؕ�ی��yfe�d���5��y���DO�ܓ3��d
RU���.*�P�G�.��-w�|�ʁ����1�?����N������ͬ�
�`~�	]��m��ba�6�Z�����M�jS����s����VK�'�N�G��:#$� P-��˱v�N`���g�`��ua?ElE���z�R�I�z�q�S��[��͓ƭ��t���Z�/�@F���v�+�@W��[����xXfw0��{Ƶ2w�-�$3�'
��4��0uUw[E�??� <s�|�]] ��c45|�SR���	򛅑7�ΑKs�5޳=2\�j;Ti�!.��Pƣ��0t���2H��N��p�'��zbK�Q��Ï��h����M�"���I*�H'qR��yv��n'�����w�c���M8����u�
e�Ev+]'�YکAwb�s�&�Į��fC��!�&u`��L�U�6a����X��Ǎ���9�H7�� 2��\I^�hƲ2�w~D���9Ņ�N��y>+�v�!t��R�7�l�^�Kb$yK)X?��2`��`�;�����(����~d�� ێ��*��X��SL_ld�r�k�sm�>�i@�Q�Y��$��S71Q���>GeDOe�F�f�0�d�=$�1��xBw.�|ԝ���>��{P���X��]r5�v��c�{ӝ�"��>���$o�������a���1���uiÜ*WO�HŬy&�Y6Xo�}��.��W�^��'�b,Kb�%�2���`ִߪ	 �#y�u#3���]w%Vk'Xbͷ����)F敹���J&�� �;k\�I� ��+�z�¾�������c������Gq'kWFެ;m˺{��,�eIl7E�7��9�	k?���nB�{d��u�.� �0H�{ӝ�)�w��I���M���x�n"�x�5d���5��t����=��u��:��2����'�nF>�$��9	�9	�}����N�n��XdW�W�j��F��`��=%t5c4��^�?Ezq&������Ӽ 沆�⫠�:��TM��}�r�k(�;%��@�c�fӈ�`J�d��˾��kѾzj=��~�-0p�H|�Y������Ҋ�E?3�t�� ���m�+��:��*|���2भ�{��ȏ�!��X��]aIcr�9]�ii�`�颣��W�_Q�},8z�����Wڡ;�>z��孝k�p��R�'|�����H��E<�az�na�Bھvy9l0Y��W�݆��[��]�!�͡O/���+��@���@����������5�˷�����w��Wfl3��0��˳{;��������{f��E�s4�n�*K��*���J��6�~aF_Yė�ww��^��EV��}I��Le*{�i�����ӑ�<#-om�V��Gi#����E�S��Ǚ`�O����+�����v��˿�����Bw�p�ѭ�\:h����\X��m�⵱@{f��%���Qk��L��WB�����e������ũ'6��ڛ�+�2����w�r��W,�}�ąi�j4�7��+]q���T�!�u-�y��J��2Uwl�!�����FO�Dy{��r��<����w�r��"y�r�`3��}�ba���$d�#�`\5b���`y{�Όbe^^	����{��CX �����1N����V.�����\9�:&kw�'W�i���������GW]�bK
�;���Ce�&b�j��Ӗ��Ӫ�&p�5Q�/����7    �\�������o�\�OJW�i+��e��6�:JP��jC��io���Mwq�\���f,֩�4��������VN����FӤ��3��];�2M��ca��>��b���0v!A}&�������NM,����(�\X��ʶ�2��u��Wne�M+'w�r�����#���[ٳ2M[b�G�ߎ�,�\[h������_^����#ke[����^	��[�x�ŝ^���7�����s��r����]��iژ�Ն�&�|8�E+53� ++�����m�M��nV��J���bo��=��ʭ��i��]���u���ك�"�բ+Ӵ��a)+8��W)�XD@�l�pʕ�����=�x���&IJ�FW�R5�a���7�\���K��r�`R0v�pje���i{ӳ�z�����Q��l�ɜ����X�|x�A�r��Jh=鐈V��V�t=�k)s�A�r��K��.�Y��m�!��
e{�RM�
�t?ඏs��<�$ K"7�#���!�hZe��SI*pv��j �P'��F>�Θ�;)����LNG��bm��[��	��p�n�I�B+������p$j�]���?6���|S�YL�޴m@ώa��и6�T�#�����G���hS�ֆMp{�2�e88	
=��\.4������.�{��"�@�wI�0��RE6vL�/p�FlGO�2ƙ��Y&� �H&����̚6T9��~�n�J�$�v� $������d+s���0�kŉ�}3���T!ǁ��L�����{�|Uz��azS�M�����t.��#s�޷\�?>g.�0���_^���s��t��j��X����ZM�Ԥ �d!��!=m������r�����{�O���9K��k�3+W�������Rƚi��W~���v��t�U��8�����x�� �0y�oj�
����xV�QTq��a����	���-M���+���dOU�I7���Guӟ�j�����&z�����Km�~5���>ׯm��d�Yc��ru`����5���v���~zW�q��_��>���^=�La��+TR���Sx�<Iv�����).}��d�ϴ?��f��aaQ�$�����:�J�� ō�:D伭�RM���f �c!�;��x�OX��^��	:��6���&��%}�GBN��˽�7?A����݉���%y�%�U��
;"��
�����jf�����%`s���2�:�
����Mb���}]��u?ai�>?A� �K�]敹�B�"�e����t+|�a=;�tS�d|:0U�D�����Gf��y��M]$�^�ҵe^��z��D�����n�p���3��H7��6r,O���D���4��Y�_�̭Ƨj��p�N�ȕ��&�#2����*.������I#�$�ߗ����+���8���;�:r祆��:��X�d���)�\�%ij02wc�0�
�\�$?Ε΅+]ӝk;�!�N�I|����s��^]�RR�;�!��j�A���.[Ώ!�%w��#@�)��K�>��d�,�s�le�OC����ؠ�&���œ�6p��x�����2+l~j*xv؃W�=�J��� �����Gw:{�1�����$o��:c�P;,���)�m*c���b\�$OC�&�d�"n@F�ɳyJ��%�Z^���ε��t�s8����Ε��b)������-P�9w������m���`!C�Ze��硅(�I3㲶޻8��1����c�����#ꟿ����wIs��!����JVdj���e�,x��L'�m�`��Ԩ$�
����6�e�*��:�Ե`����𕑏~Z��&TZ�#s.A�w\��ͼ*�F/�Z%p��0�K�e�G���Y����3���V��.�8�L�A[#�I8+2�y<�����f�a�W�a�C�'�-Lle'�?�Ӏ��CM��f�E'g�J��9ۯ5�+T	�z�&��Iq7-de���($Tj���,��9����*�z<=+�:�al����F7���ٺ������>f�=<��Ց����O��_=j?��/}/z�V�e���Y�m{�|�<G5���׺��*'<�N)��y���l��~�]ط�ADYA��o7R0	:�ct�u���p \M<#UU��|'Z���|�}D%l�M�Q��!>��,�)ٌ��v^e�@ڵS+��uX�2a�\"m|4�#)53hBq�S���Z4K�̑�Z��А؋�f�g�'sI�/\�:Y��N}%�y	�n���mJ�%��PHZ�,T{%���ds�'���f�.yb� �!9�qq	W��V��>c��B���0�/炾�������O�Aw6�~r���׫�;�֧�����OތYZѯ�_�l�+	��p����?�cNn�����������}r��Y��,�j��Sؕ|R?��9o�m��x^Q�b
vK��D^^��a����&�ŕ�����Yn!��G�t�� �to�B�Z]���Q�!d+nk.H�6[vU�:2�?{:��pU&����/�w;Yx�,�	��<K5�^m�\�+W��-�ԇ`�=�PF�[\��~\����c{L��*���FQK���>�Vf;���4�W>^�9K�:�ם+#]��Hw�1Z��+�[�9���7��%O3]��vFe�:���I��0�fn���d�s+V����mHM'�]����T�?�܀��$i|�ڤ�X*�r�k�sm�>����S��˼2w��{զ�\O�qDI�c�<U|�o�Qy,��'�T�g����}I�©3��G>��߷3�3�c�����;=�J���߭�Y��D3��|I��ļ%aͰ�#�杍�����2���C�0C�s�v��2�Q�߷#��R0������,D� 6��>�+2����Ӱ����gCr�q�`�cB�7���W]�����}����g\�оY�儀/�|��M���`!�F�����.k!�l̐�3��݊Lm)�t��.Ԥ����(�o�|L=��VS�ǔm^I�,��Xt:�����y:�2|5艵����o��ϯ?���>������q���@姟��7?}�|��|�w��ɕ������˗�k��|�O?��ɕ�]��_}�z��su�v�\~��fP�:��[�^>C5v�nN߂DlO7ɋ�-�2T)p��t�C�����0R��Zef�c%�< ��PK�2J�r����3��.�!�c��k�g�x�l��rI.彩�������*�	�J�M��H+B�������%x����2�hr�͞���Sox��-�1�#�����Lw�Yy���I�����{n^���q��x�F��Ƒ�6��Z��h��x�|���(q)��t�Y޴vQG\��������d+2zs#59/)�K�;��i2LT�{��#�m��~��+��0��5l�uyW�u�v��� ^g��J���������0�(�*+�JXhWW'��K��	2≡���yj��#}mWF^z3���*��dɄ���+�2�*R�N� �������i+���,i͊��TB��B�*���ka:�X"�E4�r�Z�"v0I�N�z�TM]L�X��~I�~�6����N�ye���o��%�C�I��ZI������C�6��!Ӥ�Q�X�BBojan;WF>j;C�9����D;���,�Ps��w�;��ο�	h�R�V�Q lC\���\�vN�r_����Os۹"�A����C����I�����1�g��䀴�B����_c�&���\���\�ԏ�v:�i6��!���mV�9�� /�UI�e-1kv5vw��$A�'DQ�hI�:^�jm4�FGz������_��hAq���U�-Uj��@U��x�:}Or?`��]V$yK#��`1�WH*��e��� ��0�hjp��8e����t��	[�ښE*������5M�l��;���h^,��ւ1������6)�H{�rx�A����1ri]i� �_U�0��d�5c���|���<������r'��7�yNɵ"S�`Ț�")�	�x���j�Z��ܸ�/>�"d+yT���R���~� ɞ    �Nׅ�?7�p���5%��)�9��T��|�s�.��&'�=�t��������J�ocnS@T�^r^#;,8歚�I��u��za�E���"��k��pO+��uH;&��X+2�	�-,�P�
o��y�\r�����`�x�s��v�a�1��
�HR�D;t�V��ϯLv?�ԛ�����"k�[鏙�a��������� ~�ɥ˷u�:ŔU4�$_Kc.�l�vp������_00�	��|k��3<&J1�v���N��0�Iv�,i��ϴ3�3�1o�t`Y"����X��#�&�F�x�i�m4� �⯌�����n�?���.��	���&�w�9M�ye��
�2�� �2�<��*$�BҜ]��X:`\i�(w+�]���XXsx ke�%��X��*���926L��V$b�2�tO9H�w^�Q��AjlK�ğ�>��$�����(I�_� c�n8g��;掰.̰�	��� ��R����y�Uw�֯���w����]y���Y��g��O�.#f�`�\gD�W�SM���[+/b�V�"�RO��Q���Kޯ��d�ҩ�7UNn�T,Ԟk]�@s{��O�󆎘�I�b"�S�"#�R��LY�=d��<�p$<��V��|hm�Z�����KF\�Z���Z�ԏ��ޙ�����~e�6�)"j4r*��*^(%��ܸ����$\�;�,�|R�%�5�#�+#/��Wd;�F�X�!\��e!(/]i[BJ�Q�z^�v��'�xdE���<(%9!_=���BA6Z:j�l��5(�8�{U�FWǾ��/�=��t��aIQ?���]04�YX��3�(�+�܊J�i�L�{ɽכ��%4x��Q,�~�z]7����||����ܮ���A����᤭��pSJ���hmA�6���I���RG����K+�Tl:� ��ܫ�
0�ȍ�p�Y�I	l=��΋T�+3�oQ�t���z�c���)�WoP�#/��%�yz&|�7����M�t�I�p��z��	�^B��TL6?p��2���l��k�:�j���wj�h�l]��^����F�i���==�5^�蓘MpbBB�sz�窺�=�IX������o!�/�|��z���������_a��?�����5��?���Ã䟟�˾��:I�Gx2��ZX��U� �(�!��P�ˀNH3w������l,�l�9�t��m%)*��u�i��҇������/��Uqz�*��M���;l�`Rص1 z�v�~@�2;SR��j�J������_�z�^�����RP�%�Ki�n1��j<j�V|��Y����%�.�^�&����7؆7��	��MP�F5}�Y�sm�U�4��������(L��aP�g�p�"��YMi�p�"�pzj7V�r�i�d�F�����,�K���FW�����ak.~O�+Q����1����q��ce�%B9���@�0��_�w_z�x���<�C�����Jӽ��`�������V�0�����{3���a5�R�Pq��Hֶ��67+#/~�~�bɟ6�؆�G��"S��=����0p���`�!{�#���
����J_�r�_9��;�df.����ef^�֛��'�̴���gf.�ԖDZ89��!��%��g v�豃�1l���M������.��x͸2ӽC�C�O��B㇃�E�����Ĩ=I���E6�ixj�'��L�{D:�uV����w��ۼ�v�v\�+��"��L�^�*��j�:(e]\��׎��3,?I�a#�{�㑳�o�|������8���?�W�������������fe���4I��q�=V�h˱��V֑�GI`S
��!��ɚ'4bs���T�f%Ȱ�#U�Y?��m�Y*��7W����E)�ۿ����Z��~�����dBǝ��lŕW�8� 0�h+Hsw>��W��A3�q��A��U�ZœV��.��/��P�6�sr�0�=��r-�D'��R�Q��Y�����sQ#�2 ���s������8g+ZY����Ԅ��bI�I��(d2��5��{)IHf�4�8�nh�YK3�c���#/��<��M�_�I�k��Ϗ�djzyF ��70d҉0IAw�bm�5gn��8c�
~����"���c+b��������Op5�y���~��=��л/���z��K�]Oq9$�/��0�k��I[�aj� ��	��q�C�K�� �lC��Y�����/�"|�>~D�������!G�՛��u��vz?������������Lk�WVgK�X#�n�xi�BU�N�0�F�}���{�n��	b6HxbW�5 $=X �2�.q?���ԧ'�����~���ul���r:%�]ػ��0t@�KW0΂a�)�|i�7,�֍.��mMN���5¹C�=b��4X^y�6�m�E��G��؆w�0�yzӂLm��������}[���WK�榀w�/7�����*7�v{��'o�1ڒ�����,��Ixձ \�7���Jr�Ր�KS,܌��$|�w��iN+�V�9��Y����1}X��0P iB�*ͥ��>��߸�ʍ���U�i/�
���zȮ�h�#y�+#/�����pg`?��-��*��&��xmE�6�����ʢd5vU�kr)V��.�z� �Ӑ�O������Yљ�8�\Z�܎%������]�����K��!1�7����\@�9�ڊPm�D��s�h]�) `t!��L&}�8��j�k�&�]��%��K'��6�[W��L�o�W��Xr��P�ȵ1�牊��
�ؖ�ؓ��� \�A{���wH�v?����/��VK�h�4xI(�.� rU��K���mV�dj�Bv��D���ES|G�O��C����x�/�&���w�|�٧j�Nr�v�tgK<=�Y٥��")�MMf��*�^�0��x�ے`,�N�[Y���Q+a��MC��@tV���y����c'�O/�����)�7{]�������'!.���[��M�j�1-rV�M"m��N�dJ���c\��I+L��S��,�JC��2�!Xp4I��M��L�\Z�J�	�wi.;	Q��9v�4O�� l���_��X.���jv�x�IN�l�����vɅ0�E��v�|P%�W�kN�|��q�pw�閙�1�B�Mq_�0/]�5^�G�������pi�#w��S���W2v��V�h3�4Ղ���}b�$�� �[]C�Ə_V�rǑ-%�ߺ#�R�W����K�!#�YOU���<c��#���o)���e��Q�H�3��(��K��A�~�?���a�s�Nt�l���A>t2����=�°Ig�5e�gXFbV��y�p�uA�/Q<�^�^�z�=q��H�~�꛷��2FK��_]_s}���u���dE<*i�}�t�fRw�8�~��0�v���SY��-���x���\�椤cYI�<�pB�I�Ew�ZH�IJf��S7��DEV�]T�cQ�CM�-�h�����W)W@(��9�J�l*��]���^���Z3�4�$��T�4�>�
�5���-�>�%�WE�`���2� ��L����:�6f�n�g.���R�������R����a��Y��i6+�l��LTi +�`�J�C#���>�_��r ����Y%y�n"���$�=��+s\/�;��wa瓋z*�+/�Umj�A�B�Іd�MflS������Y�F�O� �uv:��LM��-����%�y޲�e{�՗W?���#ӎ%c{^{� T�K�R�@|��ut&��`��q��vLǨ�I:Eħ1���r�n�$H���H�y^��2�>?m�w;��ϛ���Ԗ��V���-�p����P�t,��}����Z���c��,��Zx;^̄�Si6�_;�\���-�-NK�lQ���!����H�K��9�D�ӳ/]�����vkը��1&Jf�3^�޹�l�n���m�tDp�I�;#-&!~�#��-�,�:a�U�    ?�#�ON 7ųS86�62`�G�+���H�wr�u�k���}���$KXC�`Ο��I�j]�Y��JRu�Rw)WA{ç�n	����`?���l�WY�ؙ��)���?��G��8�����ỷ'<��G�MrӶ�+���Χ�M �^-�]�ȡ���5����{�M_^36����"j����
�t�lx鰙I������a�!�:��6bh���fQg�S�Ҟ=i������vxhc~,Z]��:Z�3�Va��y�ے?�H�$59����b���!F3[��`b8���D���W.�@��Cl�W�x����	�kͻ`���Z���|��/�\dW���Q���έ!��I�G� :1(<��d�F�]H��e�6'�^�(�v.f�k-h�/P�,�� OM���B���A��v�����6�e`�Ԛ��I�$Ņ���Uer��F�:�ی�C{
�"�	q�@��C�G��?�7�2�)p������k	O��_^B����|�8?�9����W<m���S�>|kt��AQѸ�N�YQ��\`���þ���1��S)՛�y>|M��XA��bT%Vٴbbm�'>v>�����ṝ�_'鿯toN�=hya�<Mh\��M�AO��2�I��rZ^��1��G;�&�L��rd2I���q��jB��L�I^�9-�&�a�G�a��.c|�-<Q���s��;�W�i��Xce�6M=׌9C�4�V<�~,*zD�.!�����m�TrP�(��W��WN:��� _?�h�0�<΀��NE�������	�!;vg9;�y^ئM_[BD�4wI���Ts��s
�n�2Ӓ\�4)��W��Q�$�l�/�= ;+��Cv�O#:ߞ2W�I��јiC����ћ�[��X�&-8Z��4���[���,�(
��%a�	0l�a�8���Yl��0���k9�"9���I�R�b.�g��Ҧ�ا�,/Z���0�<�ye�67�v%gls�Hi� 5�&�f�-���6��r�(�"��X��F��>l�kۼ2ӽm.�/eU��	/Q��Nѧ����'�'f;�JC��`]U���\G��"�| »�&I����,ݦ+Ք��54B�*�+��g�����\�B5@�Pe�Qm��4�o�*�X~>�w����q�y*'Dn\D<?�Zأͦ>2�(�9?IS�I�lI��:B4���*������V�R&i��;��}�0����!8'+�0���
�q�O4�e[٣����Qu������0Rs�д��/���S��-��C��������Jǘq
��n(���6]NC����TO�E���}W�kq�4"�,ļ]���I�����+s\ߓ�s�'�Rea-���.��F�"n�oL��T �.P1�F57���ׄ��O V��2�e�U1;/||������Oy^���&�v�Z� S[�X�!T�A0�hZ0 g�$)[��?�l�)�I ��xݻ�K�t���R�eZy�sK�����߽=y+'l�q����ڜT�v��K�𒕮�ҹ�lSv0�D6tIJ�[�K.�n �@�r��ڒR���ȋ����_[p{�����Ixx��.�ۘJ��Pm%f�1I��!�N�'4X $eW�&�G )��B�Â���v��I�h������_�p�E-10�t0�i�fl����̍�+0�jU�����\Th��f[?k��E�p��d����L�c��Y{�1�Eޝ�$����s1qP5h)��kW@5��ɋ��"Xz�� ��+���o?�b���j��E^�J�������{n6$�ܴ� g"���#�!M���H�"(v�t@+ղ\���G�{	2��f6ު@Z��:���y�3>�y}�ʋmF#�
 ��a!C����?�>�J���+o��1����)eH�|W�������1���Y�g�ļ�t��+/��������i��X��Z����f�k-<�*1��V�0�jh��;s4�]yAL��z!�<��Z�����N7�_+2��WJ�&=�$��I�g[��0\�h������>�Ig8B�Lx���M:|:��Vf���m.8V��h��0Z�%Q}�O��7�i��D�WK9�U#ڑ�ZC�������w~⼲v[h!�$�%J��.�h�f
&S3��`��8�@A��ṑN0�=�ϛ�,!g��AZu����bP0)Lٚ�p�Z�`j#pQ�F{Ch	l�wucD2�<�ӷ����g�t���2��8?�Xx��"��z���1��r����K�;�T+3t��+r	-I�"�ΐ�#�va��ߞ���fF7W���i�ؖ��eE���e�U0(rA��¼}Fl�c�]�Jx��0�HɁgL5ux�F-4guz0�la����x_���SV�J��]L���&m����D��)/���m��P��%@����θ��x8ϩbV��zp�C��C������wO��x�Fo�I������D-��֛aWB ��-�bI��h�P�}���{7U�aa��z������;������w�ʾ��7 ���d��?v��v>ezH��[�!T�q?0�er��mRR��$��V{���d�g���3r�{�;��b.�� _	�!*A �1���q���1w�(g�#C�mr�<���H����&\��g�����	s�Y�V^l���"�$�`�jP.,J�p8v��n�J�$�5�w�H�Q�.k?D�����+s\�|:��w~G����ʋm���I̱�"�؇ʱ	�jM){�V�d��-��x�,�'�H!K�wk\K�f��c��#/�yF8�C��N�� x��'�2��>�+�C7��J�>DǶ�/���6����(���,�����SK!�h�ޝ63�;Q\a�z�E�YgC�tNF��:�4����0
D;�gM~�;c��)�\Y;9Qt�6(f�P̰�D�B\�gݡ0tl�lqrY��G��,��䡔�X�om��xe�{�v64�ʐGp��&�t�� ��D���%0A��4��޴���F�cQ�K5��[-5������.ѩ�0z�e�m���*�^j�`�G����w��o~���x��/ۯ�='8�&�@ iI���fi�H��{i�݊��{��V�\��˾k�R/��&DB����xD��j��1��2�5D3��l����y��ʋm�GN��U,��pm@te�G��V#e�4��YRY��$a�k��J箇��Oɳn���׉g��vd��l�W^l��"~n�b:?�ù��4�o��^��I2G��/P�Ҕ�����s*����R1Y�a4POrPJz��kԣ�^:]���>���Z���P1�9���$o	!̉�I�a@��MP{a�Bh�V�jk\�r#(�KE\ֈ��%�Hf"ZDj+3�'�]"M�)��B��Yt}�LQ��FO�$�:G@��џ����sM����mF'�l�J
�ᵤp�ീA��:Z67�|2�i8�惔:J�ɝz����������¹,R���tU�cޜ�zA��!�\��l�2�e;��+E�6o!��Q!��K�CwCdi I[1si�UvP�_�6���C�GN�VF^�<� ��*O~<]��z�[3�'_����������)c�DX��7�_�)�6*��"m��$w���!��ҏԟ-����	������S��>u���E��0=^��-��
P���Hʵ�� ~)��uM����*;&(]0�0��ڼ�G�+3�C�+53Otf���;By׹��mQNG��m
���9x;&ViN���v|+�@I�p H��@+��m�����l�<���M�_�2�[^�6>��ae�y$��B�(����t��w���3���fy�9|Q�d�Gak��]�`0���Au�1g'�}QW.��[�J�x�6��s������/>p�0�9O���b����o !���N ?��������(��e�6WJ�e����
�jP�:���&�G�=�>��gv�ivQ��+��b[mO�QՖ��'?i��N��ܺ�I��B�?A���G�ֆ+�4��2�    ��-t? ?z�~�ͧ'~����;��0k,��6�zv:(�!U$Ɋssd�\!�7B���J"���%�bt�k�Ī���#/~��͵�3��
��
]2B$;�dj����!I�X�� ��	A�- �-��.޶��(�sց�P��8Jn�/���t?�Y�Q�x�k�wVgPW�np�p����O��互�h��5�
TL`��B;y���>��Cl)�������3�lN�n캇�I�$��Q�y˕�l�Z�x�}R��v�$��	� <����N���Ƈ_<g�I]���Y���:2{�o�5IF,W|HG�dW	�G�n�![��N/y&o`Sr�UՂ((8l�4�be��D�p^q��J��yi�m��4#(o҃�ؤ���b�-ȁs�7��sO#��Jr���&�>�{���j�a�#q���,;���`��������Nw@�	�d�dA�6'�\U�:�}�w$�)��#�p��룔N��4�|AB`S$Q�rH���h/8��t�Fl��SG@qK]eI��-bzr�=,�%7� !IW�`�xO�săj��l�U�I�.�͜�ka�6g�����B��n$����-��z�l�IW�"�;���*���$���v�}|�y��woO� dO��ٗ��e"8���6'�_أ-%��q�bX%!?w ��/�w���]�l�ü�i<IqC��9�Ztdc	.���+��Cp����؀��+���N;���4/~a������B��c^%ފ&�cb��P%4x+�B���'�J�^��S�=��]�t�A�(������f~�57.��R4c�z��j���#��
�r���V�U�w�#z��m����!��L���Z��G���^۰��dwK��,�����÷
�U:��#�E{#(0�Kݑ\�����ݖ�׍G4�	JF^��sJ�Ij�����G"(1z�-�<(Y���"���V�^�9ª���DE
L��T�`���+6U�"���J �@�!�ŮB+3�JPU��j�c�KB��U���0���`^�rNW�.$�i�촲v۰¬��¾Kڽ�	Ӊ$� ؍;t-��ܽ��*�AQL����w#�ù���������$����s d*Ǟ��
��m�,75"O��5>ޭiYX�R�-��Ћ���E�L�&��A��cS�����?�y���d�㤁�1х�=��&m�cѺe���jT: ��g�V�v���W��iW�Hm�,�Aj �q���m�-��L�<���˨�h��c�BM�|�F�3*=�g��Ş]R����oJ�0E�\�2�sƞ����i칲v�&;�m�b�UJ�$P0�nSȕ1:��W�I^�1GM��+����be��pa�~��g'�^.�C2d�^+����-��� ��T������A����b�w�����0HC%b�&mW�f�g!LnPS�B��J��$�𒮅���rz���/�=�����m^X���@�9���9 XΨEj��-��`��LhB0�\NK,^>u�����J6y�3�����%���3ijy��M�{#���ބ��s"��Z�LbF��0�����F;�����,]��+vM
;�f�@��4S).����$�,��s����r8�|��/�uv2�(dx�1�t�W�r�&yiX�,���y(�E��m����)i�<gTlR.��RQU�Ի����ή
��A?�s���G���W@�~��������۷�BI_��.�w��y��+8u��_=h(�<����ρoY�
�����ᗙ�/���S��J]]�g6�7O�yT��%+����� �LN���B3�璝�nd&m�4v����qy'y�4,����M����M����!�9J�̾B3�:a�x�	~,��f�Z(,���%e��*rڎl$��Zd��gə���%`�H]!N�6#�`?��2�"�g������{�UC@�����ڢ��ژU�[��bQ��D��Xl:�NYk��Z�~�	��N���H��2ӽ ط*䄀�Y� #F" �*���m,����^6 ��}�1k3'�\X��JŜ�+*'
���M�3��]I1��X�Ru)�>�'<1�����٥�j��0���~�������c����T�����6t16�����BX�AȌ�\��)S�
�Y�T�NN���a�H-֣��w�Sf�o��:�,)4�0��~^JU2K��B{"V�&|�*Z�D���@8K��<ͳfoŝ�>��E���mQ�I�b�\;S��kv4����{l�UR� |HŔ��fj��2��g���;3a�~9��Zآ�D�Īj��
�±�����Z���D�Q ����9�5�I�9)`������[z�X��e]�k������HL�b$��ɉ�4�b���(ˡ����Y�RTY�8&�Sq�ȱ!�ЉUkr�m:�Kᢚq�|�ѱ˕�wV��_�������b����Wo��������,���O��J��{ 7��ɛ��ɱt�|��PQ��j����,�֛���+����y��Uvi�M�p�q��nC�����Ps,��Vܑ֨+#/��y��x����}wh�zڳ���ɛi��"R[�T�tU�$���pR�ޏ��%�s�����(B(+oX ���QFC4��J~e��P0EӤ����*K��8��x��P�?(��	{��W�n3�m)�2Xz���}U�)E�ဪ�ވ�`UU���E���Ǫ#|�m�_�_���6��p�Pe�������;B����6!A֚ü���a���ъp�b~�C��ה����ѹ޾o�5W�I��K�����R>T��Lq�-?�ʤ��w�;�R�`)�y���m�1���<$R�
����Kwu���(�H���Ҁ;5�Ƒ�3��nbo�h:ޝ�ޅ��'�,$�}�$��`�ͼ+���m&	1I���b�����H*��"�@��'�G!94�Y���^�/�[{��9���2�<>l�~��go_��[A��Y��2쵰�Ыa����;j��ac�f�'��+��$�T�
�O����z�T��}~�޹�>,���$Q����]��l�i��S$�"~[���Qi�y}E���0�f�Sh��yŀ9&s��Я�Qw�����c����{�?�����z����o�g��������w��W_�o���W�������6fR_%��!�6�� ��/�2=wZY�+�Ն���I#ͬ\hI_L,�C�i�\�o�2J�˞����8.�j�X����;[���ųo�T�ü�)g��bl9TJۗ����6���͗N��8�(���VQFK�sa�J�*��a?�K�9Yy99�S�?�)T��vx�s�ښ��i�+2���t*��.Ꞛ��B[�Zah��7i�M�g��C�ꇔ&�&���%�c)O#/~n~�����N��ޑ�fn�Wdj+T|(آ�a�Ŝ�at�+�x�o�R��ؒ$����z:ʙBuަ#$X+#/~n)O,�ނ�`O��dwN��L|E�6?r�%'�M0%�hu�i_Z���(�6� �s����Sa�U��F���>z:z�6ca�Y͏�Vl�Ȣ��o�$�'���%��p��D<hϜFqa�6��V�KR7]���o�:�&A�v�S�Z�7*�$�V��$���0��G�C\F+����9�����<E)	�ڹ9���m�1h�<X�[A<�R5Ҕ0 8*��)e4X�;���"a�,����3�V��]�D�3�7>:�x�j�����1�a����恥�0 ������m	_c`��Cu`O�e�>�og0�^bO���G8���<�H�Tt��XV����Þ#��)K�!8v��;���ie�6N�>_��rJD#}�PіT���h�o�� $�y���S�8��:���{����P�f>P�ΰ�&�慬�2Qj���`�k�;����;���Fet`����YX�V#j��w�hNx�[���$C. ��`�X�7\M�m� ه84W����Í��Y�����H���]�Z���    �H����4%�o�/1#��߉�!K�R6J�&��5VլE���;M.�V��GΗk��_�}��o^�混���F���+B��K�J?�ri^h���,�iX��9��m�*	!)�w���J��� M���yw��l�����+��T��<�������KӀ[,�%F�3�Icp\��>������'u �T8�|�.C&k�i����؝�����RC��r(vR6�4$��q�6���۬��.��t��Wݹ�Y��~��ɠ�����0��V$sâ�堯H�"�B6'UOa�: �
�3�?!�!M��c�o����<@&GCh5O�ce�����ǋ��=+�p�;�<#tE2����(�obF���`Ě��Ki_�������?[�'S��"f���xB�z�i��ʰ'VwQ�Sw^�awI2_��>����1[A���۫$�M��;Nq���.'jq�Ф�F�3$/�Q�;M6E[ݱ���G^nE���?h��/������y-n��8/�Y���Z��`����&y-��;L��*5ǎ&�5&U)xc���d��zDX�Ħ���$Vf���Yg�U��;���M�]���0�\���9�Եe�!���W�Y�Y&la9��<��P6?��^Y�-�a�$��  A����a!�sl[m��#��#���5i������w����]y��o�u8%��v��9웟��G�������O]x��O��$�J�nzFP '��}o�>̙=Vv`�h�)�MJ�|�U�n���uq�M�M����Twؑ��CzM��d�`{���������,1�s��T��+_��� �6���4z1��~~z��O�h?�^�Mz����iH򲬑�@�H*��R!o��.�1�8�ְyo���F����ի3�;�Þ��1��������������p�pB��$��l��U8a�
'8�4�%��4R ���[��)�z�{b��x1����������ܺ������LF��2���Kt��ph�$Kb�����ْT����H��N8�=�z����E=~�z�y�G�x��"�[��5�߻@^����FX�q9�$�Iv��]*��C�&�V��8W�Ԗ�D=V�=�zċz��z��R����U�H�f���:X	����גL
��{���CH���%Ô�T��TІ &�`�����{b���z��z�Y���;�s���|.1�Ҕ+��FW	[���ܥz
��6��E[\��7j��m�Q�Q<�L9�=�r��r��r��R+4�q��"�[0��v�F�~�r��--����屉=�Za�l�*4E1�,g�<�<^���!e��x��S2����vQ#��+��xˤ��r[䤗a�^�sB�{�Y#��'�Ď$H����6.{B���<>��㒙�r�q^�y>��)�۳-H�V��#+-Ǿ^n��d"�f��tH����oǑ�΀_jhד6����$�/{b��d潜z�Wf��]dg�40_��-v��K�[v�e�:�K�}�.b�uo7)GBΌ�Bb�]�J�/%�%���t$�ha�%���r��������N�{�;k�G(G����nj
�{�9!67*�q@s�6��4Pr�E�lhғ�+���7w�4���m.�+#/~n�#�m�̾�X��m#f^[�阌�f����KN�k�z��^&�nIim���������#�U3j�|�J�8U���b���QL���nמ��)���kM� 5]S˸�G[u�Y�C���1eR�l�����r��3��Ը�XG�l�U�#��-EM�@4�7�w=�����zg��d3%S\�;�.,��KĹi,�'�ɺ�����}���[2p{n���*�`U��GI����-{�0�Ra�ra�yUXx�AV��z~E27ll(F�� ��R��H����A�Fd���T+T^�$�Ƞl�!ҙ�bY��� �{b���>��z�W�l̴|uE27�k����Q��8����f:�CrW�����EIsiE��0lAt@%�ΐ�=�z\r_N=�+�1��7��d+���
q̪Q�;\	#i�2�p���1�+i�(���#i ;�v��af�2�����r�q^����R�8?b[���Y��>m%Wҷ%cMM�y��!%Y���]�b�㫵*�����B�.y;�bY���q�}|9�8����wr��s�X��m��#�pUXz�K	JnZn�]u9:K������>N[ �t�A��i+��qk�i�޵2�����r�q^���v�o�'W+��9<t��*�"��Rw���#;��\���F���{O9���H�関���
KV�]������)��R���ԏ��b�+��{(QG�^Е�-�.�;�8�x�[��\	K����R�
+�3Э���°��ǣ���#�3즬+���V���Um�-%]���7�>�aGmD7�� �O]x�K�2�F�_�����[��H������e�\�ƶW,��=E���k����ڄ7�|o*V#� 7����i
%�n�8�5��G1Ce�ƢGgT�F��C�(���vu��t�=�W[-����gy�=�Ȩd��M �m��+����s�/a����yEJ����3d����sh8�@S3��t�Kf�*bGIfb���zw��l�?���H^�FXI����2+�pnd�F߾����ٛO�ЇWo��g���ox3��^yí����ʪ=���A!ZȪ{�Ш
�t8�ս�&v'�ȠΒ���1嘸5�gg�+�.��,rg��k�w2O��VDs-t7�U:J�	
����Ѯ���,��R��fʰ�E��NCK���1I�w3я�a���G?�y��!6�v�?VDs��aa+�*V-t���1}�aq�㊱٘�Zb��]���6�PH�2BV�]�~>��n�ܼ(}E4�ѠU�)͕^ؙ�u�Y[�.���L(�y�JP.
�]��^�O�ce؅����:/�;����Ǌhn�|�1�b�	NOat
[^;���S����K #<����c����R��]>����c�0|^w� �q���(��+'-R�Vхh�l0�U��աz�{�S�T�QI�fL�f�je؅����>/���c6<o� �[�iv墜W
{:�XT#kc�W�x�����!E`-�d��l�W��7r{|؅���яt^��vɲ��Ǌhn�P��@jx+$����rU�9_�`��_�u�&�`���^��2�ͩUgumu�V�2�������ڟ��cv>�8O�Z��Pq�Ǩ���eߛAZ�z_�5��lJD%�RU !@	�
�{P�#YiHݦ�X+�.�?�~�Sڔ�f�$M��cE47ks�
�Y��95�Wk��j���M8Q��K҂5��`7�z�&{s��aa�%-��xM���N��/��ߘ������#�<dj3L9G�!)E*�)�W��e���W�r�Kx�ߊe�e�0<@v��Z���ȋ����{�Y�������=�C��h��yE���8d�^��CZ��$+&k����-����I��UཊNM����0�� ������5���w�+mN�k��߽����v*j�����������̭l�fBi�[�p�9:�����%Bd���c��[T�W�P/'	:Y�&:_g��+��m�a�Cڻ��a����[���y���/Ϙ|f#�/�4'ek7*��Gճ�3)�]E.Bvt�"�Ù:U������Ku�#�d|�:\��ۨs$[o����3OE�s�{�L'�w�4�j#L��<��.�S�6~����&�Ȅ�֮l��1j�F!���A��f ,�bG4���n���w�^J���#OƄ��Y'�a�Џ'�>�r#�5�Ni��uA4���(Z�$�R��䑋���<��i��.x���uZ��T0@m���m��{��a���G?�+����h���bA47_�5.N1	��hJ�٪�ي7�w{�7r%&|9��Q�$6��R2��z�.LS�~�Wޭ�;��44[�-3$΅ͯU!h+����̷`��ză�[���֥�)������Ҷ�    uvo�2�B5����y��"�0� �r��܆eH U���#KUv��u>�у9�9`E]�1�*�����P��т4-�楯�pM}<�q^y�V6�;	.��F]�o9*��j��uh�
 �k%S#]5�oY*9�D�g�F�B�����ى~���M}<�q^y���,�����"�w5U���K�Njɺhr�檿�����
��������<g/ń3|�0��6����y��Z�cc�<ojE47�Sf�O�$�l2\��#�	���N�W����i�!��[c���u�>�#��#/���vm��=G}hxC��6�;kH��ԊLm~�f�+*8#]q��*NQ/�z3��%�AjC6�/E�Ŝ��r�K; OBm�[n������3�2���~qmU��,G�%{
8I��S�Pb��v�������_�_����������?}���ە����?$�?��������׿|���8����IU��z�_��C�џ�� "������;d��C�m��_�o�����|���u%�_���~�~�%�����\��
��}������?�?�����/ދ���^���?��������������]?#���k90�\��~+ɲN�9�TUR,<��%�l����^��xv�"����~���_��?���ϥ^v=�a�A��jE�7=�s�����;�I��D���� �ne��1%T8$MvO��!�BL��.����v;+�W�R����i��������I"߾���s*=oz����#CnN���\[�*�I���ߟ�7E�w�)��,^j:YX(e�H�M�
B(K�%*)7�+�5��Ԩ�˵��J%]m ���Are��ȿ�M�� �2�4g2!(ݲ�u�����t���i����"��"�`x��E���e
��͈wLd��i�A`b�b���ٹX�u�ȕ�/k"�����9A
��&z��tl��ze�6Jx�:��_u����S�@��z�:>%�
QVU|�׼'�.*����p����&��W&�%�~u/��zt.��Nu��N��'��������l�~����h"���]�s>��߲c���S�~4 �{UY�F�R|H��	�;H�]� 4�t��*��NK�{��aO|t�/}�s��/�a�qiZ>�"���(�:��4>��2�V�校4�`��koG��S�C�)�6x��J�5�[���a/��/����K-���NO��VDs��X��R����A������+B�L>�����3axoD\o��߱	.*���V�=�~\�K_P?Ϋ����;x���X͍� �*�>.�W�P�D.�|�9\�q�k�聶"w?ؒꔮ��3E7�cZ���q�A�8�<q�v)B�]�����k�M��!F��N���X�������6F<�}��d�E���*����°'V�K����y��;�/9�'Xͭ���h,��SP��G���8�j��6UnJ�~���ZDţ�Drc��4��aO��4�ԏ�Jwn��'7g7X�mx��0+ᨕ��A7����g7�<�4�ca�"�>^+3b-�|��mv��G^�4�-M����H���{��I�4�t�G� dj��J��͢�V$�PTK�,R����4���Z!K�]�]��J;*�.���������	�{��>�w��ܾ�~�	��0-���\J��bp2{j��u�\��t.���ň�I�R���e�E��)f�}�[���/{�����.�����dɕ�ڸW�ߛ}Ʊ�hu�C@� ����<O�C�7�WS>�_`����b��]51Di��ʫb�5��@8�t�犖k�$�� ��5e
1F�r���ʰ'�!.�t/C�W)�;g��3����V��MW��"k�����
�	���#>�T�#g&�U��K/�E�>ĭ VH��:��[6�M�h����޽Џ M�-�^J���5t^��Ϫ������w��m��H�Dp��L����H�'��d���@�#@]6��}�"  ZuR���P6_�� �Y�^�kfv�2���Wpu����J=�ߑ�l�	T+��oZ�U�Ĳ��ca�Mo9A6s88�A1�
��.ʆ����6#6L��4S��aO���BӳU�x^�vN'k��ǂdn4�DYU�tu����e}��զá�Ƃ)���6ID�/ң�-lĎ�b��-�°�U�_?����z��V��v)��jǊ`nx0�/^E�|�8�^v�KȂ�Hmz��
H�5cqt)�T�-a�Epe�kǯ���l�Ý�v��4�9��dn)j)�
x�(}�+>��(f_M��!��w툠G����`����2֠K�6�L=V�=�z�
Hn�V=���J�UKָ��X�̭�P]����[U��������u���X-��+�DV#�hBw��,�ve�����_=���\���.�#�9��"�[�'�o{�6��ԣ
�R��I)7�C�c��hữڨ�qt���%~��z�,��ܝ�������j���y~:mr�������iE���L����f��lD�رb18]��Uo^jȦ)yj�@����E<({���G�W_
�=�)u ˻�G�I�\���@�K�M/���N���+���Pi�m3���f��s������[�2F)y/�h�X���J�%�����*U������bjϤ��V�&I�>�Q̐���z�]�����x�KZ6���7�i�q�^�$/�u�s�h�IӋ�Y޸ ���<� |iEeD4x8��0�go%ru�шrb.��b�Ok�{r����_+�_6�������^�{�:a·�;(�i5���! �K��ª�D��B���N�6���Q�\1K�~�:B�A�q��0�q<�Y'����a�~*�X������M�E���>�B?��$��2l�$c�����~Z��"[�hM����}<���.'�B�]��J�ꮌ�q"��x����!:�u�p5�?	��2��]1n�g�����}��t�f0���h)��Z������o�^c�%�a\lAZ�N��Ästc�^���S�P�2
M���=}�`�����o����Kc�S�ˤx��9W�n�6��$m�����Mj��6o�4����1�S�ɋI�(&ś"�2�Σ�]��˕�W��z�en�g�j{MbH�Ff�"\�M���x�^!2%��ع"�[
 ��5�jRL���`���ٺ!w�V6r&��nV�Q�m���5q��z�~T��T�UZ�n����.h�j�@]��^?	��h��d9��=9�>�9ubrY����+�C`���Ȋ,o>W�v�!V����)Q;^;z��k�wЅ�-`@��"/K���"�[�T!�8�2�B��7_��	�i? �.�ߕ���Fj���L ������(>�Np�V�nf�Oo ����
��������}`3W�_�f����z���o��?w�)���++��*��>��A�5|3ܡ�i�Zg�����W~ٽ��Cv��h9a�'i��tv��ge�G��y��[�sY�8ɾz�H�6m�> &Cԝf%SCE$m������ݾƶtl��G��4��Jb�%���lw���כ�K�>UU��������7��|`�f�7Ï���e�����i��H��/ea����QQFH��Հ��#
��h֗�?̭�2��矬��ȏ�]��-�V�kkc�*��m;V�+���ѭ��1����@��0-M9.@@�ƚk���O�?��IZ���u���eC���{��];t�4�ך2b�2YMM���΁����e�T�<c���ArvvW�Vdy�<�g����{�����,��T�;׏n8Q�����J��v���i��Ƈ��_N��_� �邞�A��^?.,��f��p�8�H��6#R
����nC�j��$RÑ�����\�]J�ȇz������?|���顡��E�+K�`7v��NM�� �����iTa��U��iJw��XN�q����+���sa������'�Q�]1y�/�XY�-��a�I���&    ���ט���yܽ��6�����2�?XQ��*C��Ϝ�4+��4]�; �RP��b�
�@3ZDD����Ӏ4͑/-&��&5S˱�G�'��|UtLX�i����6�NcL<8N�`OR�Ξ��y=Q5W�8���b�wd��t���U�°�|��
j�/��ﲚ>h�}�X��ǂ/V[|��6�L��?}ڙ�<�S��s(Z4°�Q��`\ �y��}e�G.����>W�e���p�r�kE07�dM6�UɲD[E�N�*�_s=�v*�m�5�uD������Uڜ���^9�°������b�㒪m����`C���̭��g�^���G԰e�6W�3)�S�kf+��9=�#ʍ��p��� t�vJ[����tJ�X���R���f�ox�"�[����թj'�dXɰl�9�:��'��|�X$��	#��	Bj��y�����°����
�\�z8Y�Zo�Os�"�[��ټq N:�Ѕ1�)�r���p%@:�)%�n͔��qK��?q�O�°������b�#]�z�ϭ;d+X��6i��KM�xM�S{�m�p!z�n�H<�#�M�i%���D�rP�i�����R+��>ǹ����ׄ�KK�9Q5��x����S5�pH.�3}<djKj	y7PN]��ډ|v�0_�y�K� q��f�^��`���g�&���S5,~���su��a(���YO(�	�F�-���z���ݦ�`�U֍h�5�	 ���(�g�j���t ���v�X���y4'���m(, B�G������s�˥JW�2��4��,��-�8?�̱2�y���������%�E�u�r8���^�%�s�=D��
^����Z�j&[鷺�d�l0	�
r|��7t�M�m�l�+#�A�?��?���?���,�Ҭ�Mq�B��2��zکD����?��=�{)�Ծ��'5Fx��_�":���6����S�~Alr��&���y�L'�D�H�hi����dgb�a�V�-�+�չ�r3o��ٗ�wڐ/�����EZV�}�}ŕ���Z?�T��c���0��u��E|��g;���2t�'�%u�r#��z���#�:�V?
�f�2rն���� K��iVi�����<۟4�^}q�7��E���`���4{��>c���ze�ϐ�,��&%�02P��z��z<���D�i�PG�w��ytL�4�=��Xmσ���l�?TY�2�B��~���⫧��Lt�O��ϕ��\��+M�-��6{+0E���Sw�*Eb����G%i� �M�(����׌*�]~!���o���|��I��sk�K��`��v�ϥV�3����X2���1C�K*{���U�� �rSޅ^���tY_��+�XH
l���*kS��L� ,�)�+M�O���G͙��p�eͯ�x�Dd�N�:����֙P>�?kA��b�pz��k�zՈ�S��E��z�y���o��	�-��[�u$f�z����+�^�����ϗ7pY���s�풚�H�6
����So~bC(C9j�ƒ�˥����$���'�#������)��H{�2�#���b����.F�t�����dn�%�P]^eR��˂�Kk!��Z�S[,�4&��@.iG�Y�͌/�R�eB|w�ce�GV��ǳ�_�z${����W+��ULbt��P�CVO��ҧM|i�69���x;Ĳ��kT�/]G�V�˵�y��a9������j.�woJ�dc޿�X�̭��T2%|h2�䉟��#���j��V�J&&Y��M��-(|>�Aƹ���G^�j.-���(�M�(���/�������a�Lm<\�f	�/We{rzb�/�'W���w��҈#ؚ�;���,�
kgK(���(�O�Y|M�yEgWK�ϖV�4i9�F���$�'^pf��
o]B�$ç�C����K�$'���^Kmؽ�����dqY7�I�ebA�7<[X��b)��1L�g)l$��)vr"htw�O�tٌ�ܟSSn8�I9T���ke������n�W��]��M����w�ZX���T6�&m�2 �\�(�"��Z�4�|r~����=���6�����o������]r�Xy�[±�4[c��qV��&�;�|N��g��.����\��f����ADC[�WG��le���`�@E�1\�T�~ �Zi7�]�?��ݓ��)9�׊,o!��{���#��j�7Tj������*�Z�S��RIK�4�eD�d#VF����k��W�z=�\h�u1��zeS26����B�S�����3�����p�J�FR����T���h�V�w���%�a ;Y	��%��f���A�Gg�ke�㭹�o��c�0��x�M��Hx�v�D��^��?rUۚH���d��"���lڕ?��"����Y���6x�4��kh�.m�Uz���3��˱�٦6�b=���pWR"Sgƻ���v+�W�)�[�ӰpY��'"b��":ʳ�k�OC�B�*<@�J'�,��dI��x��#�c����l��c<.�s����S��.��/&�z�wS�<�$�y��rՈt�COz�]}�@cɕ����h@�yv�H�
H�F\��ǰÆyMQ�i�W�^ء���M�&�S3�Z�YC��<C����tȞx��hE�7����.�'�����1Ft����O�^z�[�oP�C��j�P˜���/�ʰ�|�����v�/��k��K>�n��dn%ј����,ǂr)�����kv�c]T��Ȇ��L��UBڣU]����Ъ^�z��R�x`�h�cE2�$�G_HĤ��Y��1M�t'.�jo'�Lm�YῬ����"2D(�mb�) �K2y|�5��ҒLN͔��p|��/"yM2��I�L���	�G�B���J�<�b|��0�fr�le���^fW�6�%|��㩈	~�Xd�}_�	pOK����a��za#���PH�D�6dM�G#Fd�s̰�w{t�81|T`�́%����|?أ���RHy��dE��y�6{����붅@2�+&8���5��9�>��nB���%L*�	�k&<�{��y��l����L�&���I�Z>X����e�P�+-g=É��L� %V�.���-����9�>d�msZ��I��+�=q�1�i3�ʱGR��5<�.���;����'p�ԭ�ub�es`�AdF��L��9O��(8nW�Vdyc=�e���	DWgʘd8Y�d���T���������QU|a\m�V3ȍ=:ԕa9���5=_H}IeM���1�ܢ��bQ��1�G���%C�JA�2��G��a��*�G�!��u�ڔ�[2���ʰk����z�r�S��6�ј� ���'�+���Z;�%�0fX�*MC��b���Ԫ���AU���b��g�Tg[!7{�я�a�V%/G?.���?ҡ����=�Z�-���h�B��V��8YG�ڼ���Q�'���3����_�Mj���=��0�ګ���\�~x{.�����hn���Ao��N�(vo�1�˾���z�3g6A��c���	)�!�{�l��a�f%/F?�u+yv���)��կ��Fӓ�A�WIy���`M�59���	_�P9'l	��w�V;�w�N���u챎,�v+y9��.K?�@>��-�\�JԢ�J���%l�8��m�U��lJH�j3WblI�A3�0��EX�Zt{�<+î�W/G?���#ă��ٺ+��%HZ���J��2�o6P�8�<��p��r�y������Z��UJ��4�YyM�����v�9��|����#^�)��K:�"Rbe}��T�k�x��%s⚗�s�������ݮ3y�&,]���M�z����԰z���;���W��Ǚ~�E��)d7~K��ŧL�HVk	,���3�-,�6�Ε`��#�}v��� 8�:ϰ]6bE�?�{kzsv��\l����~˧�=9ppg�5�,�Zi��[y������|�\3�X��M��2k*��)	���T�"!�qȳX~!yǤ�tI3)(S��cʕu�,+S2�D��N=� l���R��-)�|(�V��g����    �CB����Y�n�W�]��_���uc)B	v�݂hn%;\�Zn��	�
�Q'`$΃O�6���
��)��l�
Y[�]�{-�W�]��_�~\�1�����1̊hnZw�zgcc�\�����fL�m�r�
��J�fL������^}qV���aWr䗣�u�� x�w����ZdU��zFf����(.7�W;��u5��ó֏����@d~��Z��Ų��]ɑ_�z�cG~n���}��I�+��X�v���I/��ʅ�S�򔾉��p�G�CV)�6@�4�"��X��{��+îe�/G?�e�k���ֲ"��+gƔ�(w@'%��dlepL�t�6�.��k5*�9IS�Qj(ֶ��;��,�Ǉ]�_�~�ҏ�x���y+��U�f�M���4��f1\�\Z��܇�de»8�uT��J2��eZ|Oe^������U=�M=t�/I=�m�hzE27B��393zǢ�ܴ��5��K���N��ek�T���1�w<-�.�`>졫�aY=�5Ϩ�U�����nt�"�7D��A����iFڠu�s�	�Q�5��s@�.EF�`�Dg��ԭ�����aY?�5Ϩ�U��@,»���hnx�`PR2��8�MS�Bf�%b��,���6�F�%.K^��q%S�#���L���k��,"��c��]l&d��k��'��׈�\��ie�u�|����o~�*�O�ED�� S[��O�ڀ�`i;�8c#uvP�(����z����\LlM��F�>�3�2�X⃉(�@"�W��;��D��O����!����+K�%��6X~a�"��+K.���<��3C�պxO�
ȹ%F<����w�Z�8AD
�5�%�p�CQU)�xH�D�4"|v5_s%��0�,�[����3j��Io$���,o^�g%%GbU��` �z�T+�*�`x�~��iBؘ��.bh�D8����w��ʰ�|�{=�ƫ��:�w��(�~���ܦ�c�n;�W�V�5(�`i!v�sJ}�x�
? ��M�[Z8�(�p>x
�m�W�}d����?�~\�ټ��`�w+WDss1;&�uܔ��b�d�^t�}[؞x&=���mbw�0�z��Ii��{w�2�#�]]�����;0��׏�ܺ�u������T��rp<,)���N�c)��z��*��I��S�.َ��K�^����z:���qY����>����P
q�񖵆��A�?�󭏁Ɇ���r��EKc��9�]���V3�1�����q=�F������.'r���Dsc���2[B:>^U�0C΄IQ>�ݓ3��Ȅ��Ҍ�ʈ�h����׶����qezF��,����N��w3]ͭ���X���]k�+@V�MKH3'N*� [x�ѡh�S*��wœB��C�ʰ�|�{-m{����*m��9P��-]�n����c�S�sm�k�u��$���-Q.d-�=�r ��T-��Ry��te�G֏ki�3��e���tpч���ܸ���e�xmL5�Y���aC�5���e?H�55ӏ��##ڍ:YW
?�;�����k�åe?�8T��J��W���J|��9���������������m�(�S�(* �x�ho��cL��*�D��O*�69�z��{������������O��_�w�����?���ݏ0Ч}���G�ݧ�{8"��~?�[X�m�p������*^�{�L�:��%�p��]%�h�1@-%�aUoZHٜ�ٷ��ڷ�}۱k���?ƭ�۵�]֮i2�^��g�,�f3��CЛ�L6�m_Q[mR��X�ÂZ@?�p�N=�U���P�@�c�hSV�_m��_k������/���P�<��e���+�y.��s�WM �TMq0�\qhrT[��G�B:dj��mEf7��9� ���6ue��7��Fw��?{����_�/~�����![|v��`e77��P�r�1ڜk0����C~��ysx�J�/ڣ�O�%�h_[`�9}hWW�_���6��'�P��ˉwo�V�n��G��� �ɤ�b@U�&Ls�L� VRB�-�XT�6=��\s��O읔��ȑ�
�#�˪�|��\�D�@�30nVD�SKt&�*�F�k8�}��]e34��J�X�����%4�j��}a�G֏k��3��ee��%qyW=V$s�4KK}�41i�/�`�hI��Y��_@Ds<֛�=zo�T����P|G8��+�>�z\��Q=.+�/��G��Պhn�N�:�W�VQ�g8[��%�2|Ϸ����u�0,+,#n6�<�I��t_y=(����S�����_��J]8���g�^��-�a����Ŏ	�����CG�m��V��@���;�a��i��8Ɯ��d_�WF^�2�ԏ��_|��ǧ�����fA�6��>}�1�s��@5�l{�b��Ļ���_�-^$S0���x�W�L��*��,���S6ʢ����IJWdj����|�uVS-~�	�������/Ly|[7$�6�p�a'�d�,�܅���]����_t}}IW&A�es�p��W&K����XM#�����E�U�B5ݩ�tlۭ�C�������=��RF���+�-��s
��Y2�ت�@G;�:8w_Uׯ�?�_r�c���^�y���X�bB�ޜ�H��:��|��V���Ղ,o>�1��rZ��1�2!�1�v2E���A���?��>s�Sq2��Ě�������;�ǅ���/`!��_9��G�������^��E�q^W�y� R��b�h�eM�ift��'!��.
g��pb�-���mu��B�&E�Jxᰑ¦���D��s��� ��y:�!�Q��\����G>5�;>%�8Ǳk+�lưU���)�ɤ�C(��'�q����eȇ`ܿ}i��˯���-.8\�fM��6Z���S�/bf�H���f��V���̎��ޗ�z� [/]�8�/�+#��ɥ�&7gK���Rz:�$��P�i�E`E�6�-�D{<��l{�����s�E:���m������px(�I��`J̭�!>a��>/)ha�C�!�K���4��N�>���_[��"���������%�Z��uP�� Q�ʁ�q5M��x'�ؿz����QC��}�R�s��"+�/&C��~����8>��:���ۆDЫ���A*;���u�/� w�mdD�r�
� ���aZv�����υ�1�N4��)Lm��Lĳ3G�͜3P�'E��@�Iv7seݶ�
L��J�a�V��P*��XO�?o���k��BMk���t	[@��4�^y��v%�P��H�����WR|�֓�
��Lm�x��+�)�3����M��AHP���m�r�}6�݋����`����!��Ðw4W�h��X-��A�G��쁒��ܱ�o�5�Q��D@�IO�R�<Z�ާ�������Zx�]�rע�u�w���m��=�?�
%I�ŘƑ���Iw�����#^��EmhS[#ӣh� �e�P�����{_��-OY{� ��n���m�D��^le�WF�����V~��&�R�f&��4�V�ID���}�^��0���Ė3z��b��41��Ì���K����	oE�z���uL;PF�[�~��?J�|)��%������	�o��m�<�HJ�)`+���Tٻ��Q���Ӯ����>����������6��-?�?�ϛ8�ͬ<XY��[*�:�Ct-d�k:7�^H��$5��~�Oz�������<j7����or�b�R2#E�M��6�m�#�8%���'��|H�ݙ���
��6S`�c���l5'�S
���z��0s73��"0��7� ��TS���se��t�"�H��k|�N���y@��i���?�REw�|ڽ�]��iK=��P2%��F-�ɩ�8��#�s�/Cc�t�xm� M��;F��-m�v�<��\�ԗ`;��S��m^Y�Mf+��;���45Kz���j7����:���w&�)�U���k�1�}�    �2�j;_��t3H�B&%�Ld�u���}��K��f;�&��կH�V��:���ha;��8�ڍ�6�N����N�6QX
=Gd�Fls���0X$Ǽf;W���v�iꋰ�tH�i?`e��๷6��D��N���
��m���1���ƙFxG۔[�R0ʦ[&��P]�}۹2�j;_��,!�x�e��Lz����piѐ�粝�{�/�Z��ͷj9L`��w/V��w��C����ٿ������S��Ú���2�8�אq�v�<��\�ԗ`;�;�}��敵��V���5��kr�4�AcȘ��rc;=�{h��o*�2��f�P`c]�t�v.����Wd;-�ȹe���٩�s �����2�|6ܙ�r����V$yc�*�L�C�*�|�4�g:{fi]wd��r����;�fF�қvUʼf;W���v.iꋰ��B����0���ma葽�0����ԝ7M��.�9�N#	R�h�hT.�ҥ�,��HmV9G�0�Frii$���֙�����{x��8�W����VDjK�7��Y�c��@�OVf�7�}���V7!��4�nJ��R�����������~O�÷��?�m����g������������t����??Q�A��Z؛�	/�{����[�Pc��S4G	1qE$��R9%3�o~W��Y���Nv��G0�Y3�\ �Oe�Y�d�q;�n���G��|��O���ai䎼��Gm��̏�翌o���T�F�5�� q���
�w��*��9�j��h�a�-�H������\�g�p���KMA�4o��SpK6�-D\�(���$�Q��U�	Y�]��{f�2Z�O�i�:_+t���1mRY�Y ��
W�%�S;e>[%b��v�5Vdy�c���Z	D�`k2����x��+�}C�V������~�L��H�%�Xs9���2���"�":m���e81R ��#~�J��g���$�w�Ċ$o9��;j��nvB���paP�c>{5R�O���Zp�@�x�
`n��k�'=Q�4�%���&4��6����<�̰E�k�Z�e���Qlx���b�R�=����	��xq3����h���o;WF^m�+��2'��iK2eǮ�RH�4-�L
q4��|�k�p�D�����噲�5J�N;�N�� K���{��	^�v���9��d��E(��e�v�<��\�ԗ`;c<��e�����mc�:K@�׵W+�5�����<���w��#rϩPt�zl�)?��E�վ�\y����v�>2y��
�w�*&G�	3��g�����,��3�I��t����p
]j;�FG@kj=y�������d�Dl9�}�AkK"gR��=��Og��Kg\x�۹��/�v�]ʼ����v[$WX\C���|	1;b��{�8!����)\�����}s�p�P,Bc��+��se��v�"�i'�a= 'e�1Q�l*u�K>�A�v��3�'�[��9̮y�U	(b�@-V�+%�'�g�j��-L)s��מ�@��WnI�e��h���v�i�K��)�҇��Ε�ۼ�wf��$�U�+�q�sd[Jxw����O"���ZY5���h��&-z���Ε�W���lgpydeo��eG�h�$bGF��)�l�S���ݔ�I�r)����+�qKSs����! tn�s�6��(c�]��J����s����-���t+Oz`;�4�E��|ș��U���m�)]�g�{�V�����l��g����͏�;ћ����V�9gc�?�����kJΥ����{B����p�Dv�uWDjc�ޝ]�?_)[��%�W�A���k��;I{�ۜ��+�0�%"�ϐ�/��������I��~�o������=�Kv�l*+2��ؙk�fTm)S�6G5��\��l������0�*�WҮd4L!Qb%(� I�馴2l]���O�Z���'龐��}HH��u�O��]��ty^�s!�w/SW�b�Xf;`|)�����H���DУU�9��\�d��9F�uR��5b�&�<4^�4�GR�V�	R����O�|`�rL��~孷 $�f�Q��w.P�&4j��{=v�M6bۤ�qƦT\� Ј�{��H걻0�b藞��n������㏅�۠�ŗ�l�>�Ұ6��.�0���7�^Q8*b��X)F�bfZ�
p T�8S��0�z��?jl���7�f�	Q�P;�'�r�>��\�L�՜��%`� �h����������g�s�����L�ᵀ��L�6f��)�1�Ե9����ʓV$-i�O���>��`{ڧ_X�-�xz����C⊩1+z� ��O���^�Ҕ�)��.wx��Oߧ�e�v�����Wd;[�I��� �d6�7I9��T�g������w~�DzA�7g���3�N�7��a�(̾�
�t��y�j}1���!�6��N������\y�۹��/�v�Cr!��Ε�ۺm���&o=|�k7X%!=����7�^0�LJ�1E�le�m�%�h�At&�ke��v�"�Yyf�kZf���	�*��L��}�>�R���!�xdE���z,b	�ՀO���$'��l��ޜ�����f�S���(�vB$(�����d��?��ے�����Q��c+k���#!�7�w�5���'��2lH�F�G{k�gD���k� ������?�0��L���ȫ�|E�bG�yy��-�{D�]�2�C�D/�e:�?���<�+��q�I��d+!� ���Z��0L��?g�8��릶����YJ�O�ɋ��+Oz`:��%�N��ۧ�^Y�M�z�
w�n��7��6�\H3�nN;cn6����n�t-��I���j8sڹ0�Q�I��R�gJ�S_f�(o�����	_M�O�t���g-��҂H%A즘�`�Kv���Td@ں�Yk��/H��Յ	Q5D�TS�BΌ�];�jp������اq�>���ds&�
�"�؞iY�2�%qiY�, e�1�����_���Y@�	���+2�Y|�n��-�8��/��gO��[�k���QBM����c��)��u�]y��po�N��S60zXw�8WDj�9�ds�?�Nu4Ã�I�nA�;�J\�pfA�SmІ����*��kڠ�v�3�0�*ߗ&�'f5�inʬ��}�}�s��c��q2�9�v�ք�n�%T5���1��|�t�:0n%������UqXefDt�i\�0�*��&�<N���GY�O���W��]�"S[�3�rd��DeMZ䞃!�z ���G��Gu����do�ڰ�.4�d;<A���\v�y��8G���_�'ʿ����������B�7�&x���hQ�ͦ�6$��|wVr<�x�t�^�Ĵ�����L��|�Ck��_����{)�_}���{X����t&���	��ﷄ��Wd�v6��d�R��Hê;k	�*7&y���0��w��[�-��)7=�������ג��h��4"t�fG�3E��I�a�C �v,I}`�t���{(I���S����ǳiOg<˹�_������g_~����1�.�/��g��t����Hxa������@�<�Y�r�xLӔNGh�	&�Bg��{�
�Z�+6Z��������o���R�4�5JJ	�w� XM;����2�'KfMQM��X�]��7�2�E�I~��]t��s�z��)�+�f0#���ˀ�:J&�Q���������+:ޅ�)�3��]�)�)<��6����g��� ���q��$oc̠�>Z���+u�R����~�C���4�2h{�#wW	���)��*���uZ�ԗp5f��'�y?F^X�k5Sjb���D��%q6���k}���'�Қ�4�&���raYr��S��3ɬ#����N/��Q��ai�+���:�<`/y>S;QRy�9�W$yk#[�S�Q�B - Ѵ\H�D�ɬ�gL�8�J9#� �&��_�b_lż�ɬK��"l'r"q�Y+k�U�R��$D��hX��]_a`�Z��}���``�(M�>�d��/EOW�Q-����Wd;%C`7U�]�R;Q��`ĶO'ϖ�����}@�    "�L爔�!��Ϙ����`{�Uζf��&^�i�OL�}�j6S �1�y���ʓQ-i�K���|t9�]/��F���a�l�cٱ�Ơ����|�[��:ߢ]q<�FE�\���v��-��3��#�w3�y7sl��ů�������0d�`pvO�V�j��\���`����ةx�mJ!��Ru�$��b�������zE�z�$�&�8'�#�~i~Jq���#�H�����t`H�+�"�Iϡh��#�'5#��Ջ�!��^b�0��<xQ�lo�����X&uڗW��L��曯����}������޿
]����E�`���-��B����X�1��W�	�cl�.�%� 8�r�1U��|&���W	�4	?%H�w�'O?>���|������Ԇ��W�b`�7i��>�eN	KZ`�o	8侶"���m]2%�h:Q��h�;#�#�~i�0�[�2�H��cf�O�^��-�Tr�lZ�I;+o�D#"!R�<��ƜoV�@ǖ��Dr��p/�a�,�9_�����Sf�t��e�Z~�-��Gņ4�����Iƭ&��1gⱓD�D���]��6��b*a��4��Zl��ܓ�G�ڄwI&����o����w�}j27wH��Jva���w���FO�lK�G���%͜k�tר9�p���>7�v�ӈ4�;�#�&��`V>���'-BiG4���J�d '&wq�֞(��O���)�1y�_^��6[SH6�w�8�iw��1�mZW�)?s䊷�}S���LbB�i9�͌�W�V���tÇ?���(�Ӓީ��S:�E��R���<·����RL���HJ��3������:��KZG������Zo�F����^�N.ioxO[:ks�n�v����	�O��|\,gƳ��1�2�L;��G^�v^��N������v�v�+���p�&Y�]��k��>[��m�#s45tc��M&y�<����&6�1�/$5��L�y��#��v��R����uES_��N:doCد+[X�m4�q�hR�ZvS�.�&t5eScϛ�~)a���G�{3�B�����k�?���k��+���[��'m|�I�����4�(�>S[*(�Btq��bE�7 �Λ�ʅ �< V�.�R�Y�i9��b;Ď��KmbF(��Q��\y�Î~K��L�������le��4�Gp�uq�6n6��bL��Gl)�t�"?�Lw����V)�];��3]�VF^M�+2���7~�թ���L���.g h�L�h�]ع"���B�a�A���H����x�s�0g��Gv�U�� �f	p߄�;X�,�;W�����������E��+k�5qX$����|4�XE��	`�sg�n���4}�S��|Q[��ȝCG��ޝ�(z|��2��.3NEY/3~w���Oܵ�3�w��~B��2���Z�NI�3
�D��F!?g�|;	N+zm�:����@��\p	f%�3|4+#�~im�N�T�������4߂�Q��}�dj���P���+q�8� .]����Z���Ѭ��xM�Hq�a-�J�ދ�t��ca�U�/͂�����
>�ut�b;�9���X�����A���ys�z�]��	�5��:;�].c��g�������d޸r��軗��o�VU�9w��n1��N��}��Ko�XRhܱ���C
S��wi3��ޭ�7_�X?���K��o��R�>��͏U����O���>��i�}q����-���G�=^�A�3`�3��U�+Ay���y��Bw>�$����8^�Z%�-3�VB���xb��uKD�/!�r� ��>����m�Y_�l&X�⮍�!Z/��ǡ����?�Q;�I`�h6����Lǩڀ(}��je�����X�1rW�\X��-j���K{���j��0�󻅥+�����r�&s-�v�*̖)k��s��W�BD�rq����;��w��bi���ʓ��5M}	���C���+(V�n!t���aT���΀�6�\Ü���[c���h�/��nvxe�v�t����ȫ�|E��ȹor�P%�
���a�O)U��ƽ��g��a�� o�f�=4�xn�#�v�X���g�y�8��;X%�Ҫ�}�6���ŎOz�gIQ_����ؿ�v[��t�U�hأ25�{2��G�.��1a�T��w���M� �֍
�m>�c�0�j:_��.yh�l�N�Q�B������?<�Ei��DQx�xjE�7��ņo�N�B�Y�wk�m��Z����N���rɢfL�P�<C��l�ʓ&�,i�K���������n�nV}�i�_�v�[��k��"&$��QH���XOF\����τ�+#�����z��N3��^��N�/-v�b|�������9؊$o�}�@�&=�2M%���Tz��5X*��KW�X�f6���S�z�ǝ+Oz�IlIS_��LA��wk�V�n��3�:�eu��W�&S}U�[�.9w�Y;Ȍ0NY��M��.�J�r�$|e����Ү(oZ
���5#���LX	P����Hm�Ff*͔�=�;iWk����;.��:�<{2�(�+	��D���LP�\����ȫ|_�|ߐz��=��ָC
!�d���69Z5ج ���D8#�W7��vˀS��K��{4e(%�hCz�� ����ȫ�_���xxg�SzZ�T���NvʊLm�8��������0�_@Do���Y�(�R��Y/�~�Cu	�\������j��� �e��A�vlv��0��;D� m��6n#Fە�T�t	��D�i����O�JHJ�%Jؿ�]��M �c���o���Y�|��	��Û���i� do��b��UE���h�\�Q�t���{�����g7B��?���U���e?���/?����ㇿ~��~�������&��m���ώ�����[�H������ן������O?����������}���>�n%��=��я���v??�tm���o���=�ٻ�\����{K���ߝJf��g��'�2w�|�?�^�M�#��+�m�1w�!Ɵ�70`Jw�&�N.�i��@d*P���B-a��Z�2�#h�'�O'8���H(�=����=�J��;r�<|h�-XcK����w~�/J�ή	��x��M텍Ms�0G�X��\,;顿��/�|���Rl4�Rdjg&D�4���j�]��?��r?����KuR��ei|^.����ع|&���b*��zHwb:�o"���RG�8�;�����5=�(a�����n9�Di����w�"�;!��R5!*��H�1�P+B<�v!z�4>��]�Z��m��i�� �k�cIvo\u~�����!�H"<q��"��4��:�бd�e1�{�I�;�4�%�wx98�in��݆=��x1�bJqB�u�O�y��I����k����:r2���}���*�y6#����Μ���M3����e�M�#��V���R�?�~[�1��8_�ėN��J�X�S�s$9������V7�vt�F�M�?�{6A�^��&�,��K0�!�(��i���m�͌H���9�ZV�!r��D����7G�R��^����b�f�����'Om���Ε�W����E��g���ҵ�Z��;@���|6Ù�}��+�����X� ��n�AS��"���"4?c�\��\PB:-ZT�Yi��N9ok��dK�s�Il皦���i�?pe�6v]C�h�靣�fd8�/´����n�S]N�дL{H	�)b;���-�a�_y����+ڽ�9��9�O�/]_�������Ǿ�Us�8��Å(Tn��%�ӥ�]�4()q�ݤ�]�j�3�2�*��&�%�x�T��<���{8� S[�dY[�Б��aۄ�%Xξ�|s⚭��Vc�j�D��m��nT[4h�y��ua����_�r���T7�x�b�� ���C=��'� i;���+��Mˤ~CO,�!'�!;L!�+đF�G���랦���J�Χ\�ć,���)cVVPd�ځU�(��(    .�EMB92��g���po"by����5�CK�Re�v�a'����׽y�ڊ�C�{����+f��x{��.kt��R��|^k+DP)k��c��@<<�ӎO��xm�X��q@�M��Z$��p�C/	���ݫ�Xx��z�KZo���d�B�����V�/�$�]e�Њ?$�B6K���BLO��d,���GP[&B�L�'Z���vF^Ϝ^����|m&A�����	����G8/�lgNrH>A*w�Ƃ$o#��(�*�����u��E\:{�)v�&m��/���$�X�~Z8�A�gNOzxѹ��/��)�C�hw�'W�n�%'��4�ʑT`)#�Q��:}����r`�q��ϊ�������g���M��ȫ�|E��Ǟ�T��\��ELS��w�5`'I�e:c<�i���$o�u�oʽ��{Fl88|�=@}<{]����a�ӄq���Z��M��Y� \y�ӹ��/�tƃXi?�}a�6LR��@�<�n������%f��A<��*�fR"���J�Ν-�iZ�0�j;_���n��'����.{��>�r{6�Yag���W+��� ��j:^$�P.�Ҏ��2|�)��  �H%ێ��EF+}��\��Sp-g!����'=lZ���/�v�!p������|��B�(z�7
���Z�nS⡍�o����5��x^�ڪ�1vݚ�ֵp�x�Zoe��v�"�ɽL��a��# �l���I�<�f#<��L�g���� o%�kZP5��_0U;P[�������f����Ѿ,��EF����r���'=�bYRԗ`:�˜\��J[X�s��h�����xáZ��#j��S��&2B����Ms����8޻�B.�*F^o�/���[Dx�-�I�*b�4aw��xA���}��*�zb���:��cJ��t�N�bt��r�R��n�T���H��Xgu(u\�J
��,�}�jͤ��@�v�折mI �g� ݏ�vS��"4�����{���Z�_+Gm1���ƺj1O�q|��p�7W�����A�g�ݣ��ׂ���wI�E�)i%�����\�N�O˲�6'Ֆ8Z��%��ZpS�ܿݽ��+�Y�|9����5x�eiYx�-��Ďi&Ǡ���fc�u��.\c_	�����&��-�̎C����>��+x���^�z�pp�ܕ��ڼ�D�7�h��AB2nfۜ�y�]rm<dKʠ�`@�GV���Y��앑�8���U�tEm�rF���Ȁ�S�K%��˳�Q*���	/H�֜E,-Ro�aJ؁iZ��LJ���6%�'q�b��
?8� ���9M��.�+Ozh�i�K��?P�����_X�-;R*K`"m��T�b-�����9J�t��ߨy%3�(4m����Ε�W���lg	~���2��Tܓ���I������3p�. \���ʈ�U7��)jÕ4����"�p����`}ck �J�fA���	 S��b�ʓ��5M}�3|�n7����J��Z�Z6� ��d`�!�@�7]�`���i�/�e&Uf�C��ع0�j:_��,�LJ�����6M�ʏKC��:<%ؙ\ڭ]���n)�a�ͤ�>��	x䘲��~���I��D �!�^`o����c��a�zf�Ia璦�ә܁��;W�n�1\�s(˦~�LÔ��J�4ft�&%�|v#6my�\6\��Z�l�h�Z/gR2F^m�+���M�C�&�*�6�A�cG��h�����t�ɺ�{��"�[�@n1X}'m`w�K�gӾٖ�mg��񔆀Z;5aE�:5��:���)I�N"��0%sIS_����s��Ϭ���]䖕�0zm�b z��W�VD�7�23�1	O�E�j�Gӱ� ���\Z��ȫ�|E�ӆ���1��O(p ��Yf�}<��Cd�[G�H�V��w��5�>ুiH�98�|����֤Ƈ�@��կ�1����ռ��'=ٗ4��o;�����w.�ݖ3l(V��g�M�$��,�߼O�h��9�^&k3��Zj#)�J������Ш6J������YYY�7� UY�E/Ref q/�~�8��i�j{d����HaΖ��7�f�Xk`˘]�͢�3��n���3qE#/qE�3�(hu�S���l��qE����J���6R��2�t�߀ҝ��a:�Q�<5��d��»��o,�����7.�ȇ)I�Rڦ�hV*LORo�w�����ck{��U[�a�G��=�v��}�d��,^X����2~���	`�ޛѢ���\�u������j���mZ׆s��M|�����Lpcϝ~��!H��z���6D��rM?�Z7NK1C	R��!|7�7u�,�U���Oc\q�X/��ZVO+#w�|�2�.���0��~4x!��~8-���`uU�s�����_~r%�w§${k����e�yH��/ל-}��~l�U��_�6��?9��҄�14�2dj�2�I�U���}�����ʹSf���+��ř@�}����!|//>4�4Aخ��l䰞x&���!�YcP���3�|�����9�XlI��r�:�����uv��p��%��/ � �[ụ�#�ҤMz�2���-��Y����ѤҏlT�K�Y�j���+3���[�ԧ�&-!��i;W�nS���`^+qe�ғ>��I��^׉�C�*�5��{`��/�{k)S���se�;_v����M���f�gߐq�߁	�Y�<P�^~e�A���݃�I�h8L�ڊz�^�ӎb,�л�)�s�7[o`�Z�ER:<^8�&��ZM��|v��셙�`皦>}��6{�N+��DV�nӈ��J5.kV��nx:X�4��໯\z�x���^K�d��Z�ht_�3��VF^��ag���!O�#�p���ܳ׾�~���t�<�E�:s������$�!ө~��6�����d9[b�hI3'����%-A��'cŠ�,�΅��Y��g���p������v[��~c�i��L�r���ϊ���;��hc]��v���}\e�:�g�sa�;_v6H{�Vw�vN��Z� [!���Ca�&=�3}&VY˓�ɚ~jz�m�й�aس������D��)%f"Tb�4sZ�Ε��B璢>���N/��<���V&�FԌ���{靘��Sx��o:1eo����6���5�i� ^%�A�ubZy���Cs$�� I�pك3�k�V3	\��P���Tt�Dq;W$y�=}���Ӏ���:h��Q�����R"��0�zRյF$3|�䠪���X�le�����4�Y`g:�6�����`O\M(�i��/�Y�ۀ��	�^�
d[&&�^�L8�%`�go%aX��_��������9����gT�B�ڈ���I��S���N50Z��۱S���cv��ᐃ���ű��&������7�|1��L�v�n8��aSC�J�����S�a���VL+#/���n�d��e�Z���+2���[~�Lin٩I���#uߊl�x0��8֘���U�Z3���%X�z�J��ȋ�?�h��{�����1����4\����Vdjc0�T��o5�!3�:'`|N_�P���}�=h�^�'Z$mΌ���`<�Lta��ـC/�&��z�x��=�,���o]]�_?��fG)�R��JP�Z5�r��:N�K�"�=�X0)��Rх��H�k�\���*ZNW��V��xг�5^U���%��veL=�.5��Soy��X������8��~��6� I~��fe�6Hi�m.A#;,wi��~G��%�SÐ��k�4.��%M� k�d�K�s��=\��B����Ӗ�s�	�Zy·�!��\M�Z���/���G�Ux�Xvw?�xE:�I���-Ҵ�^8Ϧ�(f�5�x�H�v�A[}����q����ʹ�)P(���޸�	�����u��Z���J��֖C��ՙ@��{a3�ִ@���M�>�rH��[����F�.�?3������6Y��X��h��'X��4=V�n��]X3���ʍ�a��}=�c�#%̉K�i�Y뙈ĕ��    �t����0zi
���P�т�m���%��@�W�+ޟ�ʱ"�� [)X`��)�P����_R����������F:��q�G;�:��x���k�̴w3�����v�iş!+k��.|#l�F|�X�MJ�z�vf7����3������VS*Z�'0ir�Mغ3�WF^��%A�`������� �Sn�ꕌ��TaJut�����"ț��5�I��̝��۵\L��y���\�V�������ÔcMr��n���z���s-�t��ʒ�>�q���-ε�v��`�1�qS�nM�
��䋟��n�rg�F��zB;|7¥�9V\?���r/��@��Ni���դ�	��s��@�$��}�x�p�Vb�w�$yKɖ�'i��]�F���K�z ���8}��7�.�������k�x��2�]ڹ���;]<���ZY�-�*��	����rS��6��:�^�K��#}���[ǘ���BK�G:s%�2�r%�خds��qz%���~̘�h6����ڴ���1�U,\�lF���|0{�o�t�k��X��YI��tӄ��HHٕ���Z~����W8�~�+������~8�tlB#�>#�Z��A��ة�?���l�\�UdX�LV�v-�D�vS v�`�F?����-Lv�St��PL1���~b��째T�󷼗&���[�k��ZrR�^tt�h�FE5�m�z�t��������r����Z+aD �N/�m�K(���MZ�=���= g3[-Z!-�j�6�-u�^��L`��f8A�P^���>����F�,'���v���H���Vؐ��<�&���x�t,R�]�ۼ2�����3M
��V�xu�`&ĚZ)�E��
�(��H��Yҙ@����&�h�O�{��C;0f�	]Ia��{u�ߊ�RB3�y��0��#���[��|e���?�֏��"3����ۤ�Hڶک�\��#ZA��R�o��ߍ����Z�����c�*g8Sh%CJ}�\~��c�ۑd~,�I��=$gӮĮ�&���V����^Q.f8,��P��\W���������)���-:����&�ߒㅙ��,Ƈ +x�|�\�?�YY��D��a����JZ��c�4\%Qu������lo���kE)��r0e�P���/��M��Y�x���z��S��GA��;�)�7<^٢�X<�9��F	�^H��C2�ɽ��A���D��$XC<!$�W����� 	��ӣ
"�Y�v�bV�Js�"�0@c�(Q�K��+]*��Z�^;H�tp%��1�	�Ov89�-���Cn9{\/7?�����)�����km0}��.h(�t��&A�!��&�PކZ`�Ʊd�P2x'�H�.
��UEQvgB-F��}�$��å,�h�&�T���X� mP��>���8K���~L�FOH��5{G��R�W.2�(��Z,H��Bl��b�ꩥ����̒-~T	g�;q���a���3U�����Q�bJ��Lwc-�4�CP��}*)�z��$<^�+�^
��q���u��@I`u��|�6u��{�xwR_�Y��r% �k<OM���f`]����D����@T��)`�2�/;��ႊ�'S�І�*������"|�?8�r�	Ƃ$oZ�Jz��֠!�xB ��2��C9��Ǖ5[M��iʩ�����gJ�],��2��\��瀝>,q�o泲v[��iCpՆ�l�V'<������z�q�a=�i,:k����r��#�t&;be�;_v�b�jK5)���(�E깥���`qj>3�]B�"�[v)���Y���e*k�)Y��7�𔵒!�2{y�S�wW����TZy	`zlL��)��tU4ŉ�����Q����2�%ga[�,���F�JH�U;��4�t�oVb
�|0�+?�z�	{��6}�)L9Sha�E�[U�SєcU -{E��Mql��wE��ZصH�$�MSE�a� ��G3�sV|�&��)39��d[���)�f]>9s�f��L%��Q�E��Ԡ�'�,�-�B 㴫�6Nֻtl�8+�:�B?����V��
�qf���&��Fk�0�<��s)9w�ne�����q�am�S���4+���Z��	��9(�6Yp.���u������j���������9��	e��΀�^����w��ۿ����|�����G�>������ۿ��=�vo���Y��ۿ�]x���~l�mU�Z����@#l;K����۬ը��UuL����*�lOgʭ����6�<�m�r�>j�"�g�&�y�L���R�%ꉸ�]8:���]�Gܘ���P��T�H������W�!H�og�"�[`���"�V�4S���PHjQn_��9Z: VF�]T|�d��q
��8�{/�2����<�{Y9�Ȁ�]{��Z[G�@�]us��ky�`�ϕ���qh�L/Q�c�лVp����u�]�	ެ�{D=iY���C��q�+�������pd��h������=t���<2�`��1��)9'h�h��s�3y�+#/�/�hT�;՞�-U��A Ki�� 7.oV ��e<Vy#xbE�aج}�ℇഠ�Q܃��V �s�cr�v�Mi'��5�}$ƷY�0�ݫ�%E}W9�e]t����n1ǘ��l;U�bm�>]�{�_�p�m�f4T$��!� e�P	=׶xa�:_t�@��L���16o�P�4R����Z�����G��H�V���!*��{�J2���S'�q�ZU# Ȅlg���cs(1�K�����,t+3�m[����;�,�]�\Y����~0Ҩw�m��a�(�D<�����/Ab}�����p��"x��m���\����v� �l���C�<���������8g��a'$�3��+�B��P%�k?}/Tnh�(xT���H�r�΂�xRB^��@r#䃌�x�bF��Lw�/�4�Y`���G�+k���忰��LU���C!x�\&���#^c������Ѣ�J�d�x+�"��v.��`��Ξ&����H[jg��*�/���,$��!b`
�5bV$y=�X�Ƣ-�Q�����
�RS��F�����){�Z�YM%�=��Q�V�τ-��DX<����Sc1��a_��"�t7�hA���d�!ۮTx'xL��kp������ǖ�T���h�����3-i?��j-���>F!�GY_�^�Ǌvo�VVn�6�>G2�4N�@]�X)�w��%D����Nֹ��x�
���ʰ�b����ae�����nO�;�d7�i孶>̠6�:���Z!. n�����w���r҆��Agѐ��w��N��,sY��N�E�?D���3���ۚ�E�p�o���!W3D#�4�M�z��ӱ�Û����i2b˙��3e�WF^�"�3e8�]��r�:C߰���Y�7��c��W$yK���i���/�C������,��3�����3���#�6jdr��kع2���%M}��+����ms�,�-�	�p9������|{ ,��^�`5��(c�%�5��c���v� ��f��5�^��ĩ;����ұ��a'���D�"ɛ�ZO�%�p���I��pL�:�ك���0�����vB���V2~T*���A��Lw�sMS�v�E��vk�,���K��5wH�I�VW��NZ��ƘױY3�-k�R��r�1�p6.j搭��%���v� ����$��I�k.N G���D�k}�جh.�.t������4��\%¦�4������y6��´��0���ȋj���t��:s��4����@皢>��O�#^Y�-s�Ÿ�k,3�`kZ�&��[7\z<�3Yt�P��I�Bs�..�q�WF^��A�/�h�a�Vv�M��T�&W���jm)����=[��-��F�X�X���Cu�$X�z���Y윽�+ΚF < ���u@{�����Lw�sMS�vҁ��~.���mC"���֞B\S�Ƶh���]�vٝ�ܳ��}�ڛ˕i�Gj    �Ԫ��k]y����%�h��6iak�M3!5�<�G+?v�wZ�x\��-��	�]{�˱���Ⱦ�4�l������k	_- *NcJ�3�zL\[is�w��t7�uIS�v��������n�5T�:����$�V��n�c�l�o��<�4�3��R���̚@	�O��0����0��Fr�Ds#9U�	�~�0r����"StPcGHIiRl9�j�*��2ڛ�r}�OV2�o~~?��s����G���/��~��������W	��~���-��j9M�I�+m����%��/8��g'mU�5 kj���}+C��1tx�C��%��ķ�϶��Cn��	��6��
��RH��x嵶n�rfx�~���8gg�`�{?��'j6�k�����x$0��dPiP�������I/�>S�FBa[v���n���V��p�-s�/����8��mu޵7�	�Zw��5ԌM<^����-p���ݘ��7��1>W�uuZѳk9����*t�ú��N;<��c>HШ��r����F��N��U[ݒ�4���Pj>�b�9�<^���H
F<��K��c�gk|�J1Y��v�i��N>dI�wY���m!�6�'��ݓALL)��l��mr�Q��
³�I+<)�il����\kt�`ӭm\y����͇�!*Y֛G�"�Y�j��V,��X�ScJ�y��K�fS�.6=�&Ј�B��9VI������`�pRz�J3"���뮑�/Fm,�t;�4�9`g��ܙ�+k�Er�� ��ѽ����T(������笛n]2���5N������������`��ΐ����`�+u3[���=Xw�����P�Iެ��?I���8{AYK)���w_�bg�vR��H�%ܺg�mF�`23ے}������%M}ؙl�w�ZY�M�&��	W��s��-,������k.YC"L����cɦW���n4-�3��#/����3R�ш��i&��bf��b ���#���~��Iޢ��=�*Ua�/V4�yt���;�ViX�l�k��h����%j���8�v���0����%M}�I�Y��n����m6�X�ͦU��V�i��Sv�Ю�0�����a��@�=��	1{/����2��/:�&F-���»�djZ�pڞKJn<X��A|�Ӿ�/H�%;�hh8U"$�8��Z"���I��g�Z��K�3k�W)s��4�����'�:�\��˾���:�!sa�dfe���d|�ֵ+gs�h��ڸ�{�Ǽ.l+b[ML�d�赠}�+x�ã�I�X��ؙ���Zo&A�b>J�� 5���K��'��6�l�!��v� ��ݏ�]�偰�_Y{�.��޽f_��H��)�|D�n��T�v�=ě�P�fu��k�ڤ�:�є>�����P�y	�z��P��p
��G�
�I�S�Wdj='����J��%0�15��vJ�J��ϵ6�1��h���q���|��Y���q�fo`to����U#T@|���Wq�1J���T���?�� +���d���C��@���SNE�i.eR�Z�X������b�'+�,���tz��*
����D�ު3��
pƔ�:b9�5��L�i�U�i칉:���h��O�?�Ѽ��ϻ(q�m{4��S
�3+��iGZ`���T�7�����[qzbY�T,��<HA�&P�d��3��{��ס}�1��)$��N]y���Y��nrv]˻���?�&���u��I���`�Y;*��`k,bӳs��3Wo+#/g /�ǃ�N���Y����0vԐ���֫��@�T$�7&_��M�M�z2��>��9�T�3����φ˦��텴��hg̩��}�J;�,^���t7czIS��H< = q�5E�n�E��}�6UA�jw0o���Rk2߰�O �eR.�-(߅�'Ϙ�]��5��xe���ag�� OZ���¦)ff((�Px~���L��I�G�xE�E�n5GNx8�R�����H4�^���i!�K��O�3�����x~�2��\��g��r��[�_�ga���S�x0m�25�o�:���L��@��}�� ]�6������U���tZy����iX�1E�G��C/���!��Z�?�@����C"=`۽�Y�䭺�{5ę� ��@�nF8�W��l�kb>�i�i�X�N��"��O�MX[X�i�`���>}��6��xw�W�n� CS5������@4�����yh(L��q��%��͌�u=�p��me�;_vMWR�9�v�I]+�jB���<��*	��G��t�\��ͷ<sll��x;�ٔ�ic���ǚ�,v�/&�f�N�Ù�ٕ��iχ���΅��v�\��g��|�s솧����Z�:���T�>���1ɎC֌��]�&�bc"�:5��&����"r���Ͼ2�/;k�VT��^��%�ի7�>x����W�Rty?gE�7WbZ嬈S��P�[7c�.�.ѝ�?�k� 0����1�SM-�����z�<��Lw�;�4�9`��z!Ln�����mV�s	���^s�	@⪑��y�~V�n����]rF�к>�:@�+^"��R{;���#?vx�q����S�͵d!=�86���8a@-��z;�2��S$r�EϬ�ӛ�ޱ�.�F�͓m�o�&S��U�B�A��@6~����	�]��o�����O�y�����9��D��֏U�r2V�x��0Ȁ錉��c��ɟ21��� ���e-�q�f�L��1K�����΀[1)���,گ������������~������߿�?_�����W��z�(���_��?|�^���|����[?5���_��o���_����W`����D%�}���S��F��O�.]۟�b9����G�|��K������ݘ<�_�q��+�#�
���>�^筧J�3����bHC����qI�ZHg�Xt.���afz5����3�F���i����L;�K~��ه!`!�{cÓ�x���梇?��U��mN�*p���V�n�z9Sar�����+��8*X�H�y]3Wx�njaꡕ_
��N�0�����ҕ�J�7��e�z&�2�_CZ����I�6]�y��l�E	�����h�a5���2��J���3�{g�[�Z�K����wbW��PK�v�mTS�l6ұ)�/V�sk~�͏#.q�˴/8�p��PQ� � 3=����K�9lӧ$9@@�-�L�h�b��9[�����ͯ����*��|��/>5�����<]��)p�@��6e(�½��7I��� ������*�yG�)�+���?�����I�.i��iB�fjۓ�[�t|�U��]�*�l$&�C&r�ц�amx����V���*��A��UI�5K2��¬��U!��f�����YܨvWr��G6�A6�odV=7*
z�s-� �5�*�T���Z��?���I_vQ�'�_�����P��hr1补�O��ga�tg�U�!�����Wqej��4��u�z����N�1A�҆�8'x@����
HC�K��LڑBv�ae�E��6���;d)M�gZL�c���(G��g�Wm�����%Ċ n��+v��b�(�d�>���p�t����>�Hu�iJ2�f���^��#K+�v��ݰ#CIke��S�����j���mxpm��K����~�A�rrQx63�'|oOOU��j'�a��3�M��������*�N^�o��+�v�������ve�Uo�uu,X腂��6<�6�G��0G��Y�-��`��h1�D�L�)�b�E��*��X�������x��1�C�[�mXvaJOP������G:���3p�5�H�� ؊kz�1�U!�A�紛��"��eؗ�	wQ]�'���	��q���: �Ӵ�3x�����J0ݺP:��7��+�.d�	+�\
�1�l��ܮ��f���''���x8n�d_"a�5��Fl�H�ԍ?�Oв�U�7���9J��Ll���K��Yz%�-�>Ֆ+̅^Y ><�}�`E���    G+�X[�[�$,G�z�8���q��OX:�L?4фǑ�"��VM��t���ga���͎R����!j�ba����j���I�L}Zw�� g"�w�]Y���R�b�8����}N@�Y�Z�ϳ�F*,:0d�?`��P/M&y���>�����I�Z�>�]�-��v �w6p���^�ǁ�Ֆ�`�nFN��5��Q� .*| 0-�S�[~_����j�b�T��`��{���Y����N۹�c�2��|p5�>y�9E��`:���1�T��۬�Y���;/]v9!z�.@x\. ,��ϐVdq�>Ǭhj�|(BSL��c������~���aT��ðS��a�8N�ۻN[����}n���%/U!|%Eq�S��.�x
�B�C
Ih?�cA�z���J���&<���ՙ��t�5j�j�U�Ո�e�g �,YʎB��Q[}�΃�+�F�j�iz�A���E!�B��R>8�P�]ҽ ��V�)֐���>�������.�~��8B��	�5Gg6�P�Ǐ�����°��]|�Mc	;���aĄRC�xd���A!��R�z�Ļ^�,nO:!~��yZ��ؓ�}iH<��q�S��R 1������R��Z��{��a;
���QI���qj�9mؙ"�f,���A!�Rr� f��	dq��Y�̈p4��Dpw�\�r�卜�|z3:�>Ք��N��chhߎB��Q�^{�^/>����L�dJ���KE6��B<��ǥ���nPފ(nŵd��r�����E����B�"�)�H�'��̈٬�EWL�[�b[/9��C��a;�4�h�މ����ŕ��QL��2� ]��1�<.}��h�ۿg^�ō��2(����n�	���,]����S<��$��<5x�h�\/9e���ǘV��(���В8�{�ԴsZ��O-�Ӵr�E!�B8���B���!ӊ,n%knM�5�'&|y��Pxl�iī�;"	�lzԎ!�n���,��� ����"h����V(s�o�4��a��W\��B<��<�r���@�Yܜ����Rw/c������x�v3���U��e1��)�H�g"�F^"�[$��h$�S��o����5�V�~Ǒ���M����U�CK����X	�;I{'�@s�`��c��YX膗qz������\X�">���ߏcջK��{C��;8�3}V6kK��̥iz������cf�S���^9[2�g�O�g�C�2t��y����Eh��j23}�j2O3�- +������>�,��VA���-+�XՒ�%�n�$G�ލq�S��`�ڱ�����Pn���1�x_�������$��C`X�ݼ���ڄ����M��'m�Ul4�(�9˻Qr9:.��L	�ș�Q���/}�݋�K���/A-J����K��l���&��j �Y�ׂDhcO2N�i�͕ң�a6�p�^��#V�O�K�Y���%N��W��^d�֒���>�϶�K�ܣpOW��6nQ��=�Y��=���d��~h�W��}�9^�@ {�/��u�Zm�S-�Z*S*���o�;�_vI�|�
��������/~;�R����h��Gm���:(����%+��Ǻ���]��"�[�^��W����a�&�<DҒ�>�Q�t�Ba�Z��hs��)�Q�%��[ߕa�lʧ��q�?��e?iE�.R{ �;��pD]2�������T�?�C�V%��b���b��G��]�0�^�u"<.��|����8n�-��Vʹ^�	���^%����Z�|�nZ�'��X�x,j18YM�b��ua8۽蠅a�����q� �»�+⸱�V�x&h�b�Yc5��vW�mS\
'Q�թ��hE#x��~v1��-y��j�.�$<m��ǥ���R���^�_J9��K�Q��0i���K���'�p!��ʀl&,j��"���ylM 8,{�h�.yO['���	֣���i�"�[ pߛv��k���Vke�s�|
$P��ihZf^[{��pĭ��{fbe�%��i�D~\*!���]�XǭJ�֦�i�5'-}�x�"*~�D�*Rh��m�nk����pȧ����L����K�У�r�H�o���l�E*�����+2����n݅���@=�ؙ쌀�q�mPn��8�7\�C;�C�"Ӓ�ٱ�.ufz�5����l�] [Y�����fj��K���Z͔.��Xؾ�7Z�<F7^Ӱ���Od��6����k���/����zDE
�(�7�X٬���	Ha�J2�Mf��S����;W������S�x�����~:��{�aa�l0�b�H`��!�����h:Gl��>�{��H��w<XY�̆��^���6�#P�:,�0]t���Q{b{����*Z�׊'�zI���ո0�� �.���o>��|�M5�30E>���޲"�z�G�u->�<m��C.���|W ��]��Y�d���y(n�9�/ma���g A�������X�,`^����ta�� ��a�
�o���@#��Sk����\���cM5��핥ZvI)�'��N>�d��]�pE7�����D�K#!н�������i��r�9=[���gc'ékM����!����ʰKZ���	y\:6sH���q��0�
����V��T��o���Q�)�,���v34#7�|��`�4��s���	�°Kf��։[���񐼜is�"���5��b`*�������si�mL';Q|��$g�iF��T{��g� �{7�.��O['W��K�N��ʊ8n�j��5ӫh�� ;� �c��������8��8x��X�*La�ܨa���ʰKF��։����!b�=>^ǭ�nT+��@�r�fJ���r�&h��ahq��8��R5���(}ϟX��ɭ�8a�F׼M_ԛ�@�����t�'�N<�`e'/t����8n9uM3=$�๵b4�4���q�N�iL��^	�Mǝ�m�}�{Ah+���ZBs�5��I�D2�%���Ioح���#щ����#��s�q�l빎��QZ��ZU-MZ=PV�q�˹�6�Q��U���z �����"n~|�%��E���X�'��ߟ��?|��\��ك�!�W8_�����b�iU���5Z�P��~t�jm1��܁��l��km�\[��*O唵��_��a���R�^�k��5@���>�5��������
R$�L�3hn�ޞօJ����e��Sk��<U�)��_������Ő֑�Z�ދ���ueu�����<�\{�h���Ɯ
W_�U�uYK_h���8#�a�;^gΫ�뽺^��5��w�����m��`1�w��V�l�#�	+6I�bS+0�e�j�#�x�칏�
]��
Z��!�,��{�?S���g(�W�~?���q��_��]�YY�-�R	r@En�SI#�di����8�6h- ��fb�`�{���u�v{tsaإ�����~������`@75��w�p� i��}��l�h�C�V쇍���j�I
�����)�K.vM:�;�,)�wm��1D�ī��mˁ��V�]��)jß^����RP9Ӣ�t�N�:.��م|����7�!�R�/��"�[Ϡ�ձ�U�Ł����}��'��?Y�H��Ŵ��˪��LX��R�b�{G��.����w��цɭ�7]x�ih�6��#�jY4��^���ʶ��� �[�����P���G������r�W�p3�=�S�Ђ�-i�x�g[w3�~|�E��2���ߚ/�9�쾣�8-{2u@Y�4��x�"D1�{Ո���v��Ί4np�#hK��k&tzP��&-�TN'����	��W�><A��w���ͅ��Z{�ae�E%��J|��׻*���E��!F�.{-dZ�쓷c��u ��\�ߥLҸe�9�����ib�zd��!UhJ�x�[�B��PԷ��әᣝ����^���a��dOZ%��R�`�
��D���2��x��'�Q�rk��K    L6[|$Ɠ!�U<�hAjX>��b��]��Ԉ�gx�NOc��2D���������%鶥t��Dph�K��Ċ4�J��m����E�
���"[�کF�d/y�`�����0<�7Ժ��b���2�OP%������F�%)���1!Hñ.3�(��Hܯ�Z�,�+��q�ޗ��,#���P�\�^jt>R?Q!���0�isD��B������^�ʰgz����:�x�7r+��I�a��c��y�^TT����:��yj�y
_I��G6�5�xh> G�5D!����`����`���r*/C���1�>v���e �n�Lm���R������w��MY��9�t�?[�G�Dn�rp�P��M?FՌ�������� ��P��?�XYٍ�e���Q�h�h��5$��-�=�eT�+��٬ŝ��WZ�ev*E~�>}��������m���(��ߧ����RE/%���H|/���p������o�tCC�	�K�E��g����W�]J~?Y�J��)�7:\��m$�ͷ~*Q]W���%!���P��j�m�靴T~R��Y���)�T��ae�Ż~������N�O��
K0]�R!첃�$(I�R��^�!$b�w�V$q��A�A�����5/1C� )�8w� +�������w�yԚ���_�wsqW�]��	����;-�|�7kdB�b��H� ��d����j��$��WnE�.`D��x��d8֢!+'�/O;�\�9�Ϡ�����}�!�d'�4X��Z�������-�&&dM��.n�.,(��ʹS�nx�J��`�5�So:A����u�톿�mv�m��ʺ���j�n���mqB{�$�	��8��z,nCu�Ҩ�d?��B%�b���~KZ������.�Lן�u��0�_��]��ߝ����kk�P�I�5�#�k��͘s
�տ�m����/�����ߠ�߶������B�;���'���ݿ�q�����Ck��A���vS���_~�����X������������7@���[\����?�?�������j�.ߏ�G]�����Y�?b��v|4�����i��?|[n|~�E���_���ϕy��ܻz��������|�����U~����ψ����O��'��У������	Ȏc�����^&�]k�|S������~3�����?�뿾�.ݫRŃV��OX��M;��4�u��X�.�-�I`)b�cg�&��5�M���'�����ع0�]�\��g��tȀ�3E��ncxT�Au��b�ɀ��2|���<�Z��Z_��)���Y�â*�u�+ٹ��+#/�����28�h�'��4�.P9���V���;�;�s��dE��p��,�R'�dM�w��=���Fgˢ�X�+�L#m^���
�olG��5�\��n��%M}���A+��ZY�־I��?���(�r���̡� ��y'τu-p؜&Q΢磚��[�Z9���\y����U�R g�)�Լe?�GU��㬉�Ca�b�U�I�� E�Ƶ�m�����Y��8%Еs�9S�X�f�3� 2��=�h)����se���sIS�v�@�r��������~�6�*e�Z�c�`.Gy����
��g��6���U�y?����Ε��|A�IF}X�%i�Ww�0�@pa��f���N>@7�~�I�Rj�2�=6�p��ڵE��U����ʍ`"��=�����t,m�ky�SO�`����`��L��gL��������3�`"��$�a�j����C����mj���f�%���zkz��L�G��1�"�M^���5��?3H��x����
R���{�%�tpN��n,���n��7&k�<-�`�x�X 艮~�$M0Qk�[ Y���(f����)�`�t���X�Ǻ��9��]�ʺn�������#���1L�ػ9j�>yK�>R�^���yr���� �l/�AS��Ͽ-ttl���Z��Ə��qo7��k��P�Zy�-;�w�0�]�Y�Ԣ�@Ֆ㥕���W�s��8mP�sm��gl@k{��_y��/��|3&YT� ;�k�Re7���`45��Iކ�3a���t��)�I�s�"�b�Y?��/gC���T �nz[A����3�q��4�Y���E��� ���V��0RY�zN�*ѐ�lˇ���N����f�-
N�� 宎N�}��se�;_vZ3>�<�\+m�)����V�ƚ5�z����B
���W$ykS��lG����-ګ�4���g�s���Ӑ��q��,�,^VTf���+3���5M}��O����I���m�����ڬް=^���b�8������C=Dx�Q9jĿ��k�N�R!(��c���v� ��X
|Ci�B@��w��4��:���;��S�nq�Iި�2�ԧ0Q��%E')q?{�T��R�!ha�^��	��)b�}�Z~e�;ع���;x�uv�g_Y�M��*��$j㧤kI��J�o�0�
.[���(Z�� ��u��9��\y����=T�4�����.|���ٺ��x0��NʲKHV$y���U���lj'<k���/���沰�ym��6��(398��l��Ҵ0��\��瀝�*�t��1��v�-��x<���&JN�yj��;���\��l�NY����hN���`Y����Ͼ0�/;�r��V�C���6��!ڰіZz�w-��N�/y�"�[	>�ʦ)�Z�
J%�x����(�������V�%��W�S����6�xM9;�V(��Lw}�%M}�I�;y�f���m���	�o=�iiz��4�U�9!�o�<�kQ�h�4-�=M(�Rn��0��se�;_vN�!�� ��3�f�z�ks��|��N��_��͏�g=6�	���M�}�hh唛!M}�BC��mOðvhm�R���#-���4=���?����ǭ��^Y-��y�PjE�6���L0(0p�(h�+�!�õ֫�f���֮����؎AmN�p&foe亀�kV����	���C��_���ʌ���
�I�S������>n�4��~�I)�Ym�;�!��Ej��v-��P��1ڗE���~��R���G�6V��V
 �#ےMf���������r&�=��E��+5������3#־��3�>}����o��]�:��<��]ZX�M�;�9դa1=��ڧf��Ũy��hTb��Q��W���j��=�Q�=kZ��F�ڛ����܁9��{��:[m!צ������a
�d�~4��YO�.��W��
����7�
�U㻒�cn��M���$T�}�k������ŧ���ݙ�LГnlUR�̫���;��Qr?�fʹb'g��I�6��~`i�T����f�8[���|��)Ɏ��W�kUu�/7�i��-ep5P8�����p����6x���R1�$�r��,���f�sҰ���N�k8%��je��E�����5���h��V�0L\�\��Ҁ{�`�j��@�[LJֺP9v��LT����I�:i���1g�7���!� �B&PCbME�p�3y�o8$yˋVJ=58��[�p���/����"p��������d�(�:l����Lw���4�9`���K�����m��6[VV\�3hjǾۦ��Y<��\�a�6�w�X뭁p�4��l�x�va�;_vR�}��M�z�Z��{ת'yNT�����;��/H��}�N���XQ*�g�M	�`{�ܬsg�s�'MC�N;�gMt$<��'M?_,�v.�t;�4�Y`'�wz�w#�W�n����
)���Z�!�j��5�	�y]�Z��7����&:�z|yr�r���3��VF^��a'��T�˱� �	��9�U�w��,*8���y���$�g'iaNCx=����g��ɶ$	$��9�R�������1�+��B��=d�w��t;�4�9`g�����o���ma�Ѻe��2����s�&�b{%��Q�z��]��Z=H�U�6�O"A���E���`��Nʥ    maڒ^l�B����������S���ؽ"�[��{�Nc��?�u�Q�v�y9j*�9��,� f��5\gj���iF��b&��Lw�R�4�Y`g�<C;W�n#����t�E{,>.c(�Vo�����U4&S�kp�3U[UO��v���3�se�:_t6N����9�h3ީ7����i�K$��3��=[��-|_'k��*S�d��e�Ln�.���H�nF�D���Xb=�l�w@`м��V���V=���S��`m���G��y�VTΔvSVdjsB�>0{nh/m��C�5����W��T����K�d�/�Q� <��m'�^����ןk���W�ǀ���}�Z֕�ڤu�Ch9�WE�s�Ƴ����)��g��{�^>F��}6q�|H�Ÿ�K��}����1�P�=���x.��G�7S2���@+��A`@��p�����|���-�pa��w,�S�ST��Q����ո}��w�"V�l+�Y7�F���yN��&F���Ri3%��=�xf�'��=p��Y��m��Lw���������~$�)���v[�"-�dJ,p��T�@�r�iVE�q#R<���M8��H�AG��p�Be��_y!4�������~���G��(��F�"S�'
ø�}�(h�����d�(>�C+^�U�d�^J�Z��Z�"`�]m?'F���كvh�~����O��?$��~����b�S
ުF�?H�Y���j�M��9��c�V�phZ5|L�#�[��n8�WZ(4>�N]}���R��7B1���]Y���1�,�Jѭ� bm\��=�dU!4��&P�����b2���:�<[��Y�6w�O���g��߽�Zx�dl̩�B�� �d��
�F������7>I��uR��+avs����t������s`a�2Y��ҿk��8;m��M+�.j���H�3����듡Rդ��ז��!%����[yaa���}�0��z����#y��X����G]��>:8��E����
�V��L0y�7]kז솪�==.������?c���]}�=�cְP�ݥ�uݪw\f"�]�W��ڣɋv����g�Mw$;�t��:O���n���DJluI�E�}{0���q��+ݞ~��,"++��D���K�2 B�~w[>��=�����R�o������P9��W0���x�������G��QdBEG3�Nd��3��	��h�H��qI-mY��ǿ�$�g��×?<�E:H����vɯd[�����G�5\9e:)�����5��\��4R�(�]e�H�3�H�Ò++�a���$V�[P���@�K5�Z�<?[���.��v��
%ocr�y��?�_�C�:���b���{;/�T�{u�����C���\yt��b6��	k��I�	�`)�v���n�Y4�Ռ �T�[,qJ�03,�m�FX�}�yM5�8r�Q>�-u:�Ǚ��++����N;�FX��N--�
wc��j��@�O�lU!R���:޸�,����X ���K�
�����$;�Ky<�Y��:#@�&�g+,E�r[��+W�'9������|�Z�{�+{�un%�>`�����8�	�gL��֤����m�����Z��`{�&�ə��++���IN/:Rʩ��5՟ s:���=��b9?��)��2�
%o"<f���Y���6%46�1��3�t�~mJ��5y#���1aPy�B�`�����+ݓ�k��)�����w������v�Vr�mF���Mv�%��Vi��P�<��C��@M�PL.V��H��xFv.����$;C�9�q�l�M�9�a/N_���l��1�ƙv�������~L�gr42`,�,I�0��?	%�	���Q)�1̸@Y��W�t_v.q�'!;�!��nK���� }��&�6W`��T|}�p*��;�=��S�&�~ly\�P]0e�T�H�$:�[Xy�]x`�ǏO�����hj#�q���m�e2�v"
&~C�`	��	k�ɆuW�5�\��g���6�<׈�)��6�@��U�+��� <[t�u��QC�a�2��E�Z-6U=��������u0���SXY�A�99�hS2z5b�O6��;��b�8��椙��K�,h�h���x�������)�D��rR��w�}��7���8LS3t<7��̱�8��Mr>�}8�(Cs�h����8��mf�J��~�8�.}��O��9h'щ������ț�0��G|�s>����se�6 C*Dr���W�]�*&i���3B��"N!iy��cY1W�xlj�s���[ީ�XX�z������T	������?�%������������_��ǻ���p��/�� 	˟�/�~��w~�f���ӿc��Ͽ��7~��?���tH����$���F��ԛ�.k� C�8�2�D��۽��z���p�����A/q�W_�Q8�{�gO;�:o���<6${�ѝiP�B���,0�9⾢2+X`Γ��U�m7�$M�P�)�!�����*�v|��~e�1�K3���.�]�PE�X�!b7�����<0LsE��;��ˡ=�#5�}ކ���D�ʦ�eK�?�a��7���tZ&*9�R�NX�'l�7�ѣ�bK0`=M,���l0�{�Ɯ*�I[Y�A�j��O�\����A�aB3L_�t��L��`*�+!�%�D�:�٭��K�<9��N�e���G�+����=Y犇~�3��P��1�RIܱ:uB��
�mhŀ�t�p_4�t�����=�x��9���V6o�\�,���ƴ����H52���3��3�i4-��[��o=��ý�2XY�R,�o���	,���Y��}"�@�0��3mWH~k!q��M&�}��έ�qE:�a�~�1[�
U��#��Ţ�(ۤ����!XXy�^�	�fNQ��PR7��r�f8�P���x�~�7LE��%9��V(yc{��S�8�����.ժ�u�v�B�a3y-�"p-�n��.6(��<Ε+ݟC�ĩ� �!mka���Q�����
oN+	�ժ�~��ĩZWfx�[	(˱Dg$ԡEm�d�@B��$(%Kx�YY�R@������� wyq 洳ObH�sSV�����@��C�kMh-�  o��6|�;�*�3�P�!�RS���F��ܯ�KlYXyMl��Ė`A:�9�O_�.d���,���{�<�4RԵ�E�%��S�i�i" ��bũz��j�q���k��\`���%�_}��/�{Ƣ���?Z��Ӷ�1D�;�mek����5�֊.iTT1�^��B嵉T��r�۷�^��Ng"�<�fǳ��oN����9坎��d�8v�wx��&�Ƕ1K��d���9e#��!:\՜�삶�g(��Hz���ɜ���?Qޯ�Z��͓�MƂ�4�/y�[wPS�m�%�����4��K�0*�b�����ל��T=A�u�f���NY�: +���P�U�ƃ����ۭP��:����]`�'�65�3H����*�8'G�i%� (���$�چDd����g`-q꧐�L#݊�̏����t�f2�5翎d�{4^l�<���9��c7Y�g�:(i"e�`"�3�ݕ�W���dg�S[0�:���B�q��+K�䞯J_bc�]��Bɛ�ZZ�4+��bx@@����zVv�0���U�S3lnX~΂�{�mqV�ʕ���%N�dg�cv_E���&0H!��$���f�}��"?�K8��������V��pE���N�~6�e9�5���*;_����^ǨCW�A��kB�D��n-���m�W��d�. Y����h_?Med�=g�P(E��g���%U*�� D�vq�b���,`����;����5N�$dg<Pb�]ٻM`�4��*E�(
������晹�$w\�}bg�R6�
�A�:*Ƶx�%���꒿L��S�����}�<^��[�/��fS�V���MMT�8� ��:�P)pJ��ܠa�IQ�"�b�� �)���P�u    ����}�\���?�;�ҁ�?3Aje_��V���ڤN�����P�6MwV�XΠ��5p��CL�2�C`M����i��+��6kN�O �jز��=�W6oK�)���[�jI�|Չ6�����};;�7�n�U3 qu %J�es����eb�,)�Z��{�Z3����c���S�d��X߳��ߴ�lbآ�꤁f�T���%[��=:>�"�<&;�b	�G�y�̡&��"�.��+�oe�T��	�c����7+��ʜ�#3JK���u۪q��������<~�Ԟ�=2����+i�;�r)��}y��_��=&j=��}�)pO��o��rL���~��t� ���v��CX ��k���cX���g,>���e�}�,��0`��p��[����M��{����\�^��G�~���B����s��I��	PUe�eܙ��֝�H��X�Z[���T���3�WV^]�� �V]��%��mT�BR[�=�9ќ��ۤ��P��d(s����!7�f=Եnp�D�8���8�R���7���|��/�1I��#<�c"@^'v�\Wvw�1��
$��:�~����	����\r��|K�S�H*��8���z��O�$������[��o�8���?G���\�!�����P
�oi�y;�%X��d�O��Q���O�
H��f�++�j/(7{�e�����@K��P\�$�?OF�W�-y����V(Y�(G��g�1�� h� �*��L��U�)Q�wmݥ����ΨV*�&�W$��~k�J���5N��s�s>a+���6o+i$�`��]�0�0$Rω2��z~�-�U�^��S��'*�dFă��.��Y�+�_�u���#Y����s��y�f?���
�o�H��t��P�}
s��z>����dfi�n�ȸ��B����� #I�������\���\��}H�,h׭�嗌��h�-~�6j�X ��]X��y�/�F��Ԧ��(���f�������3A��;�6��ޘ7iet�hK���ve�K�����O��]^��=��S�ۨ�`2��O�]!�mHoB�(\�ҏ+���B��l辗�c�A�W���[�4`�;�b��ʕ��[���1	
�j]'�;H����k��'!o�� ԝ��Ʉ��U��4SGt~�P��4�q�I�Ƿ�-<rV��.���욙�P�cH�+�_����SD�p��'o��ѧ�UF�2�����,Q��6���\5~6 g�ls��I;���L�B�tu��Ӷ*c�魯g�t+?�)?-�e��-�ԟ���Usq1�������-D�XL�J��p��L���\�v8z']~E�@$��z�W(y�B���4�3�l72&ָ�(�I�����<^<7���`3�E?:�{��P	�߱uIL-0���^J�K�M��D�C��<�˸�)}К-����Q��sWV^��㹂-ʡ:R`��Q�6�mmSW���Xg$%'�2�mߚ�?��f���(�ύ�S�O�.�����@g�u��Ԗg�0���F�PO@� ��B��N�J�4DaE�.�0$E�ѲN\4.}d�����w�ν���(qP��&�~!�¾nd�i��
1$ff�bbk0�`Z�\N��^��Su&jA	yk qfN�w ��<����/������<������ �m؏�,��64IJ�3'�e�^�3�/��HA�Vi��yV��MIg���2ag��k|�������)��⋱^�G�_�QU5�5���S8UlU"��P~!� ��H�����Sw�nDwΦ���@�[�<8�]�N��^�`v�_�l���2�sc��r�:qM%U;�;ۭ�<�,e��VV.��bm�$�LE��c�ʀl���+S�,�*����*���jG6�L��B�}�
�����M+������͘ڝ�����h�[&*5�[�Z	��3�Zp�L5���l���@�N��1��)�Fr?�*���@}�}bA�6�l���b�#��<L��A��B�J��l�$���(Sek�O޸(\�x���QV�0�L���S��G׃ϧv �?R#\m&��+S�<��gI~���e���<��϶e�ibOz��bL���
%CS��aB�-���h�`N�R��瑊б��kzzh#��3�Xue�aٝ�����L����Ew�S=��}�����k�_V�������~m��%�%Y�Ӯ�x�}��=M�_cuTl�~~�iS��C���ƫi�������V01S-$R9��>Е�W�eִh,-"���d>P���v39Vhj���x��d֜zk'D\ݨ9;;Ć�>k`���`d( ���3m��m=7�}e��/����B��[h����HO2^���C �qW�����H����얪~Kg�C��_�!��Lv�p��Oz�ԛaltD�@�]9#�WV^	���7�CWd�������(h;&wf��
Mma4+������H=GpA�ōd�����S���M�
3�-F3BVg�~���}D|������\����?b�����w�Z��m� #s7N�l�0i�Vv#��S�\��9Z��F' h�*�m�����
(}-ar�J�&ע-�@¤��('�w�qe�6;&<�)�)X�U���o�Gq����X�FUT'O�5��M�;s:ߙT����$L~��_�O��F/.m�v��2<X_��g+���l�v��	]S�ڥ�8r��<Ϗ
�N�l�9� � 5B��XzOq�5��r�{�w-"�	ޠ�Ar����6o@�~�jFz�]���b�� �\��ۙ�U���b�W=,CK7m4��h�Z���u+�_����׿�������秘z��^/N���姒��X+�v9s�	�mJJ�6���![���c�U �m�|V�N���y��#
V�AG^}.	�iHg������J�k��?	�_Q<X��XټM�t���s&q�����-,�Y�۝�F.cvUm���[�Q�����g���+�_���t�������v���d�[����g�ٙ����V2D Hj&�d�V��������Q��r�ܾ+f����c�>�>�::gh_k�̰Z�1J-��ƫ4z	�T*�u��n֔.��ʨ�6^�v��Gpmxmﻶ�vFS!>�Um�[�}>�,V����K���Q7Ze뽘I��)������Q� �� N⿷�v�dN.M{��"^}X�5gK���=��08ƻ���s�f�����_|�y�e��Ey	WmN�%�����i'�z�O��x$�r��D.�|^ �MZnNO̪֔FV�X�.���Tg哫ؗL�8#mh��j#��i�ρC�ᑕe�#w0��#�������_=�B�v[�Q�h�.���*�m�q���F�k�kA+SW'��͞ai��R���P������e�15m|�v�9��ܙY�+4�Q�! W�}�!Q��.5Υз�C��ă�d00�azSB>VӶ�/@�g|a��/��O�O.7��o��_��&p>xi��Hj��Ԝb�E�T�C�{�Q�5KKA�	��T,sӸ��)Li��]����N���5��:r�����#��C֡3v���ʖn.�*Fl-��� @�.j6��੏�Ѹ=��ә���q�����|<�H��})�^ܬ^烔��-d��u��M���VZ�=���77�� ��w��	?��(�d�����	�Қӊ�k���6:G�K2{=W��Ƃ'�Ni,j_��9a������7A;�9�w�+���i���_b(�b����-�4����ʄ���j��>ݬ���
L�:��Be@�B��)��n����5q/�hL5�S)������ �</ho�Ad�~g�U6"�Q�#[��@�G�zN�2q�`u_T����9����δ�5[Yv��}*�;��w�gK��t�i��}زB���]��v�
5�@S�	��L��p�����V�P�S����b�X2s�a��e�*��*��<��<�C`geWծ�������ԢI�^��t� B@1e�S,4]�l���    ��j���+��(�;<���yD�<�<"�#�(P�����Dj����/�F}ю�r^z���J��+t����-�C��UO`��������ʲ��w�#��#��L}ks��c��s�R�����?,#��*)�k�7�����k_U9�0ɀݛl�62W\���ᑕe;<�s�ck<iǔ�ԙ�]*7_�kO����y$G`y����e�������*�>*�|~�G�G>��#��x$�C�!�~����2;�
M��;u��>&,�;���iZ)��	��ՁLm9��+�,R�^�=0��G��G��x$�C�@M�	/乹��s09jnљ۰ױs^�J�ݝH?��b�4T��,!�j��9+!W\o�f_X��<�z�yy�]����;��ߵ��s+��fa��!��]4�?u(L�d�#����@i�Ĩ�R�OS���N>������^Yy���|�����������;���vc+4��O�-���ўh�����4c?rh�{�"���#hu���i���Z�1T.hP5t�x�Ko��Z��o�?�m���{�kt󯪭���1���A�%�LnC������H{!�%	,����q9[vM9����ʫl~ڎ��Zp�E��&���y��(�Xu�iw�0 �D˔bO�-1��tA{���nj�U�H���5v�W���YS�2j��'<+6J*�U�0�Q�5t�(Q�c�.,��k?��n}�Fk��>f�6Hw=�+D��z�l4�-b_N
�l�I� S�<%��C��V�K�.�v�2<�y��=0��+�<o$*^��wl1e}�!+Թl�����s�\C
����J�#���/���@�����o��:�7�d��vXde���E�7e/�E�;da��Gs�<�aJ
�����*B��q�,1�n�֓���O�W����"3�ؖ�@�ʲv�� �u��Ώ�r�0���įP��rƳ~��Hr����Z���'-1e��S�}���`g���qo��{�ke����k�TV������T��6)X �-��"��	s��6�)��޳��&���v�ѐn�$!�9&�&�<B�Qj������G^@~�e��e���xp6fڍٮ��S���b���ӷ�hr�a+5�V�'���5¶�wd&��"�%< �����g��,{���U�<s����H|e��9ڼ_Ҵ@��ȝ�\S
�Ta�	u�Hr�p��n̶��@~ 2��S�L9�^󾞋�~x�5f{i1�S�z���詛D:D��~���4��J���,]�`{U��浕M�b�M��S.���ªLeH>�*���$���t?��?b%7���ŷ?va_7�!ܚ,�gq�T�U��o���9�*�<Aoj�[�J`�+�񜳂+C�KA\Y�#~�� -u�E��Ep`y$p��)�����+�����>��w���M���D�z��p4-Zu�F<�m��W�PI�hAZ�_�tpY$��=��6#�w�AA/c�����@�œ�b�i��:b���Bc!{g�4����ez�+_<o�.��M䠉W�<�B�[�5um��T}����69 �6����Q�Z\-�hHo\7����L)R�{�ce��H�����H�(�|P�}�u����&T�H0X:�.bL�MK����I?�7l*-[m�ql�bV��<O�fܻ���e���g��^��� �j�/�Z ϭ�
�=Xw[����ڶ�K�t�#6g����2�S�����`�(�M��ᑅe���'�,�����)��v��
ynaB�h�ևq�J8[�X"�nY�MЉ �'���ᙵŸ�&9��$��
���y�t��l�����Z���i>Թu¿�h'Iu7FM������t��+�zsrU]�Q�/&@�X��Sv��^��ʲ�9]��3ǜ.K�D>�#�?2}�:�3r�[��@�t�q�:`
�u�/v�;��d��6��a�0�Y���m�V^CN�r:M�/D��o��I��t��9�C�8����4��r���	�yP�F��s�Gv�+���pUx8�4R�j+�a��T�H��~d����sŜ�<�#Ɲ�;���n���n�)j�1M-�m{���B������"n����C�j�hJ���7͆�D���܌�I�?������I��)s�[��M8񨞛BĩBMi ���ß��k����������?}������t�_��$�{���������jZ��w�a������g�����>���B9=�W?�8���?�Q�ߔ���/�w����r�ߖǟnW��W���ޣ�c������nGz���[�w�Y7����ˏ�놝N�x-�n^���K��Ƿ����Ǜ]����o���㝟�VOc�n9t=�}��C]���Ǐ����o�����G,-t�8��y[��m���g���-��%7�&A�u۹�<;ʺ�1A��A�b0�͉�,�b?���<��+ݛ�Ʃ?�y~�sv'��ހ���T�R!l�:|�I��y-CMu�����Ap�����`Oa~$,�c���t�n��緲����{;���s�n���f��K.x�'�� � �n�6�Z&�Z�9jciϊPM���1g����@r��j$�ׂ@��赻 �R��{Qхe}�.:�sam��� q��P�4�lF�l�(`m��g[��&;<%�x3�qL����k�=�0o"C�d�/,{`y]�.�E.���!�8��_ ύ㌞{6^Z:M9NS��;��
�s��r����ūf}d�x;�µ������8q�F�9q�ԈO�)��.���V�hmŀQwv�:���{�9D�=�b�X`C��yP.�cՇ���B]Y��A��\s��K��@���0���rN��_��R��V�� ��M��&�Sr3$:�+
�LSm��ܢۛ氲�y�$i^6�\V�ft�Lg��.��V��!5�ٵS5-T»��w����Wf����4x���� 7X�i����l+�8s�G�9s��H�CN��.�,P�V���iR�E+Z�A� f�4 ���4A�ä��6 b�5� e��s�V^3.3s Y?3 ���f��p��]{{��6���&�f�h���ֹ^�E:�mcN�u��M8!� �<8atj)x��#3������\�o��R�?��ݳZ��-O��T��:�̃�!�"��ʴ��r���9M���B ĜF�&TF؛���lO_�k�W&��;Gӆs��&T�Z�����_��w����Z� �j��!u*q���XZ`�x'H.��8�]��B�@P��������s�m�\�B�RNNr(�ʅ��"�K�s/'���Ԩ�q�S���=�/ ��"�ᬧ��^�?���~n�
yn��ǉGr���B���$���� �)1J�8�l5hہ��v]���K�����)\Yv-1�T,������EN;��}�H7�k]���C�%�X��H�;�`o�J���f+�2�u��yPPκМ�݉d��S^@��K�K�����w'�-���8�3y4�l�Mn%�^�7]R>{���Ί)�X�=V^8c��쏅e�/|M�/�G.��vL��,��T�����F5X8�ӌF�N�99�P��X�8�(s�Ж�Mh�4�-�_�/g�+���t�nw[jDO�0��@�K�BSS�a��ufط�!m+c�\���;�t�SD��]��;k��	��'��b�����|j?^%�4
o6ג%�B&X��Bu��ŎU�S�S��?�ҎuFRz�b�:�	F��� ��8����3F��)�6Bx�!	8r��Whi+i�D<E�q��elZ��,���K��e�������<��|�����W^%��I��,��z�dNOۗ��}��~s��ڸ��
�v�.�8�Sԡ!l+�ۧ�(���Dl%ӛ'e1�4�f�����TA��\'�G�������n�������I��6&Etd���Y�q+ER�RMLIE���1���	:#8F:S>w#HA�$��5��f�aA���    �r����^�-ٺp�{%x���`�S���b�����tǟV�wCX�Tൖ2�ZM�C�2L�j�ig���>��;c�g���X�{�w�OW�où�و}�(�qIlW���u?��bK�9D�`� s�p� _��m̝x��r�JOr�g�-C��jC�92��8��F�K�5��Qϙd���Z˅�ۢ�0z0�{�@c�V[��H�P�X�۵���i�g��ꧪ^n����{k-�?@���
~�ߛo�6��Ѐ{�"A����6��!��~m�±m�5��n�f�]��`M�ՙ�ۓ������q5�2T�8�ՅJ�>���8\YvC}*��o^����ۙ@J:ӛ�#Q=��u:``N�xȜ}��H)�]��
un^�+:9:�1U&�h=p��}�i�B�~�8�ĳ,��'^FrfF�!�#����+���Y��~���o��Խb�c�hjk|P� � ��&K�����lS?���|���n�c�:6���'�UKIɍ�L4���_?c����?�9Tᗻ��+����=�q��L��!�G�&(�XX�0���U��ܝ��WM{>O�D���9�����+��BM4w�w<�[�d�gv!$�q����{e�:;�wv����mj�nd�<J���MH5X�L�������"�:5�5��i��q�P�x�_Y~E�Gt���$��HL�.G����rn��F�!*�?�ls��f�ˎC�S�YJ003K׶��f���Bu3��%�,���O�����.���	(adBP�d����v'�a>��W�n?��B�[!�ՓV�i��|d".&;�s�͹�F���^�3� �=��YՆ	�fL���ڹ�҇W^��eb{gm6���7�Q�6��ջ�v��
ImS:�
��ԕxt�0�fzK!���S	u��7l��U;J��B�Y��
~L>}l���%<��5D�x � ��?�hew7��3,��{�KP����ȉ�{�-��`�&��aϪ}q�e�xu��ܕX+��c��t l�!'ͨhף��BO�·�א���"$��qRXvEӊ'����+^�^���V���se��l��M{?4m-k���y	���uY���Vۦר�کUA@r^ߢ� R�;ή��`�Y���a����`PM^���L�m!v�k�ٟG��5���gOx�D�\8�ݟ��aJ޸Y�-C�I���BJ6��5�V� "=���;c�V�xQ�Y�J�YkI��'Y��=�Ʃ�'I^2$h	���+W�Dt׶��1L��s�`��~c���ۊ��ۑL���� amQ��Kg5z�}���`���Zmb������i�n���IV��������,��ԍg�������5���~\������k~,���%bFG��zm0{����e�����JZ�%�`��󣚚$�8'F�8++?pJm٦ D�Y6Ag��اq�rv�G�t8?���t� �[੏�w�
%o}LX��:�`w��aa�#a	O��r��^�Z�� w�	�0�m6�K�%q+�Z��=��Ʃ?���,X�q�lކ�,Ե�h�K0q�L�x3��-C��+Z����W����9�Z���`~�YY���)����r�7O�>wˣ��I�Ż g�6����õ�5��j�>&3R������SL3�芆�`�
T3G	Y��u��^y�\Z��T��2�_"=ue��˸�~J�Mm��r�&��2q�`��`��U�x���� ���A��Pt��7���<".]>2����|����n���D��@�E>����#QFPID�:R\��T���7gQa�b9�{F�?"s<��UfL}.\�I���t�pp�����y[��欍Pұ7f���x,7@�����s+����l���tR��d�i����_�7�SkͶ�w�<��P�ۏ�����M�G0�<f�	A�%�Y1v8�k~<�A��/��{�%'.�E�i�J�8�	���k�d�(_$z�S^3�Oe�<ӌ��q�$�����glZZF�ѠY<�SC���ٱ�u:��M�u�K�~��2SK��^��/��!�)�����t��0vZ�x97����ۮ�w|ĭq�`!B�n�d�U`Yr�aD��q��v���mLI��8�t�p�2 �Ʊ�����Ԛ��aR��j]XyE���Zo3�����'l���5�L����@S���ɦfb֌��5��ࡱ�/��Y��CN��N�(�ҧ�ɝ#{�sp����J{���=#n���#�����������������4��ٴ��T��j�k�o';��t��8� ��m��1B�������q�, �<���B�����y�A�n�gM���iӪB�C�IHvw(d�3�<1���Š�z������^��v9�{����ެ�ʖ��3lm:y�n�ѦI�ǰ�j��RK�h/в��۪��G5��Hx��XXy�.n]b�|���o>>)��-=����4��(�v��Sڗ��hV�����s���+��A%�i�[6pB��>�C�}�ӗ�m����~mN�{���O���Y��<����ʛm�vb��`ǎ��!X�h�0�p|*-g�Q�ĉ8����Qc�F ̑�����t��}� v0뱷mt�3�7u��v�����@�4��ۅa=5\���*ԅ+�b��h�N$:�4��͎��G�{D�s���Nt�6X�Ї`�HNT(�����Ӆ�e(��%�Գ�+��t��̳+�\,A\��=�Ɋ]��xN4�)���W�n+�a�5b��DoP�q���C������=hLf�j���CH�qy�)��+��258�n��⓷[�ď�]��
Mm�@�WFpl l	P���n8�EY��4�{�O�xLD��Y�P�ш�X�=i7�i�}N@}2�§	¥��]ĪVk��3� upa
:i�>�������~�׮�cu�Om�yn���tP9�ou�'��BY9��"� EC�*�����R��Sy_�4MVQH�gZ��((��C�;}��!
��fd�r���a��;EJ�|�tA��%6����+����1�� bvF6��ach��Y��t�;����X�PQ� ^j%C���ŕ+= \��4�hN���m��j�������J����}E鐜��缲y��l��s��t&@�xh'J�0#4ۼ�=���1zG^K6(P���e��|/.�����ċ�5^��˧��xw�@gf5���&S�B��AItڷe�D�mN��xC�4b3��Ng�]�x"�R-�A���J��I�$=D�>�� X��C��j���r�i5x`�P�	=�� pc��C�tҜt7D���'v��(�#㥿}��|�x�oݩ*]!Ļ�T]���F\��D��7���Z7�B� �0�N'� Bw;?�P3�M�C���`td��S�������uR�������V�v��ע�7F����j������b+P'4t��W�氍���r�B��6z>�g�S�9���=�*��-��{�+'��`3~�I�D�
�h@г�X��6���hr�Z��J3� "#��u`�Vζ y�1��<�g�$��±̀@>�7�\ٻ�'�a/�%����3.��ux�5zJ����A=���ڼ�(�Z��l�9�V^1�a½�Q�I�:d-\޷y>LR��6b�nz���������V� �"�&Ǝ�c�R0u���hnt\�����6z���)$��w=�+��͒��d�4�(~h=0�� ���v��q�h�ѿaH:/5I�=�xh����K��W�,[I�f��Im�����&ym/%�j$^L��L�H���
Ϛ�v��:-�:�M@[����&�3F%Cl%G�Q>�2r:0�f��<�cww?M�`#�X���Qu�[���/M3��uv����ۏO���!FwF1��6)�l�ʾ֎�����X�i̛y�>���Y��;545���L�͏�?�W��o�����W_>���#<�~�@b�]������b��j�iY����Dpa���    a��̩EҚ�.=uʅY�+1>z{�npkaَ����>���3��/����}Ԃǒ�#BP딀B�n�3H���3ɣ��@�|8�L��r�
!n	B�һ��4�	������H2@�'�B~���m�94�'��.�QtnE�ᆕeWn��"�8n���A�i??z���GoM�s��z���	���KN���/26�10?4� �� ���i�������捕�����\&�S�ί��Q�R�?�m�u�h��Zy�-�)��K~r�QN�@�C�g ?X���F�Vt���av�e� ��)N�����"�;�x�W|f>���~����5�����ſ�޾�_xw�g���?~�k��gw��|���_����G�����k7�}�_ةm�$^�\%��a6�,��G	s&����<0 6�"�H��Q66Y������&i-��Zf�f���L�M��S'�:$��ڷ��2 ���i��N1��`
�Ƭ�����:��5�8�۩���3i�p�j�H��7Ge��4���#�fI��3=TV6v�jI�����h�ֈ�SM��ی��Xe�W�@�YajhgqL�#u�6e����c��o���|Dr����ң��;�E������deP�T����u�뒲���7��R{�8�R�Ă����'�8�������H�����?3ҧB����c
�~��!nq6J _�!V����>{�^���.���8@7��v�O��.@�1pr~v&� ��/,�N�����_���GC�Q[�y�������$߫bѢ0���Q�����L��;���	.�����(B8+�
8��|�rn����+�L��7�z�#|R��-�f�
M��=y ��k�j��f�%� 9[�o�̔]��Nm�9LsA��-GH1�?*'�����ŗϚ�y���<a �D�ެl�օ5vSM;�J���l5�'�ɟ���e�Mު�"is۫�Z��V�x�@�6�Z��t��ã�Q��Lk�\v���[m!vS]f��I��EK8#�C��?�#�����(��@�N�t��(ej�����+ˮ���3��H���.^ӈw]�+��iOהqz9�fz@1W�p��#�ы��Vl��%��}���n�-�c+X��������Ms���Z��fw	�^��'U��zq#4���и?Bcx�p��L��th5���]�@VNGv?�������|���
%oCE�O�ؽ�-&#
 �Dؿi��6UR�蠲���b���#�3���2�Z����:�fo�N�m�͂��]G��TA{�:ʝ)<�\���BS�vw l����@�L��:�EWի���ڦ<Hm)�X�l�w.v�Z����d���؆��fOg�&މs.\�~�%N}�>%�A��#hv'U��-���:x�c�l�����m6�aB�k�Kв�(�w9���-�R�t�)j�gح�3+2�_G��se�'z�{�W�Nl��S��05v�p��?�Y��@M[?��4�x�(D1Z��$'��8��nX�����q4�HNrZ~;�&�m/�����F RtLM�N�̸ �z��p�-JΕ+��H�ĩ���$������؇�n�>�J����C�S�'^ȷ�mT�t�$]�܆����(;SJH�{^Z��M��se�Uv� �b�i�n@�}�Ŕ���(�w�N�=��Ԝ�|���@�[��ِ����h��97즎�='�t�J��%��ج��-�3J���|�5ٹr�{�s�S?	���w�^ٻ��Gg�1����&��,CF��:$���ق�&���-��J%��c�ƅ����\Yy��/Hvz�0h<L��ބ��&��o�k4J)T�Mv����ڍF-P�FRg��5p�!�c��',��<��Y�ga�[�IvjQj�'��Ԯ��K�s�J�d��~�3\̒w��V�n�f�&0��w�6���ڻv-�ڽ�Zn@�c@���E����mLck�ef���\Yy��/Hvf����Զ���ӧ&�T���t��z>�ɇH1�]ٹB�[lS:�6=�p祘�az-�Nq���X<��4W,L�:���$- �8�U���UtiYE��p�8��_����o-=m.{>h��]�j��6�&����O�9
u�azg�.����7�-�Ǯ}⩻Sς���C��P�Y����+��}�䭓�ͩ�>?i�F|�}q��O�4�Q����fڜ�i&X��c��~C�%viL"ӫ���&�x�{t-��ٞ�
]Yy%���1�E��HJN>�c3�	�Ai�qj�rz?���[%�����S���Co�c+4�5�aƙ���JoJ�R���]��l��^�t���LI�7w�B�ǔvm���4
��d��8J�$p؄ij������H�L���aع(�E��fK%F>;[U�hЬk403 �\�=�|��\Ie�I]ˀ�6�)i��ZMO��"E�2CDe&;��<j��׿���>b��/b���A�q�Aa�"B#��x�lA�x۽�n��.��x8�C�j�k�&�T� � ˜����m/��� 04�q�&N�X���<�+��⭥�>�N��C��MJ �¬�W8���ԉ����x�a����m��L1Cک^��q�9��@6�ޚ|�H
�-�N�l�
))3� �&����ֽgT����{ב���׮����X�;"c�Fo|�?�~����}w��ڭߜ�������q�ߊ��4|b�|HΦ3n�����y��i#)�Mj���������재�6)Xc��ԜB�n����B���r*�t��R<������+x�U�+{��X���v����P���c�^�o3�z%;՚sjV(�/ .�i-0]��L>���k��Eh� ���l-E��kagvV�*��+B�������R}�����w�	g�]�' `���:�|N�I?���)V4�/�	�<z�`��Z�d�ʕ�g-q� ;�;$�\�����6'y�)�+�۳:Ȍ&���R�{z����g3L�j����Į͓��\Yy��/Hvz��� ���R�D�; X�ρCҌ�g��t����'v.P�js�RS�{�'�n�O\��}�!���R����U2�Jљ�`W�Z�HCb���s�J�d��~���{��*reﴗt�h3��8C1���R`�Ɏz[0a}��큜���kq��4�6j=@�3u�+���%��>G��G<�ZB"�tgJ����&;�l��B�:�-i�nO5���0G���M�nL� S˯�d�c1�zN�N�dN,���/3s�8,�X�'?� ������R���;Ͼ��b�=[�`S}�wS��mp2������V�鮖B����/����������Q쓦%%p��Nv�{��6��G��K�	��Uar��*$<�\�;��VHɟI�әv	�Ļ�)�:��3�~V^������_��/Nt �S�w>5����
���2��}�l�ڥ��i�b|+Վ�3�S�	u+E���'�R�L<���;�Z��A����9����-Å��}�y������fC�!�f�,�<�8a&\S\k%������,9�i>b3m��WT̬����������+=@`��z��VxM܋��0��H���5�*fX�6Z�������_+���3|0�V�=�Wo/���0}�x��I{0�����Z4�H;і�(� y5�c�J��,�����%V�v^ٻR��dΧ�����Я��Ŏ�^;P ѧ��m]k^OmVjm��:'�Ζ��Wg�r�Ԥd��S� �,h�� �����ä�lΖ�i��Vy˾�`=$�m�"T$0���D3���s�����ꨀ:Li aݤ�Ջ�X��r�{�s�Q?	����n����m%Eg5΂���)�����}�Z�/r�͏�����bU��E��D���������ʫ�|A��#@y�J� 4L�*0�
Lƞ��g�rH@�aF�%o�M���:��0�Ԝu�ό]���)���Ք�	�=^��;��(��Eٹr���K��)��`�E�?tqe�6�%&/A�i㾎X�/^�ƨ��t�k4�wPB�}FC�.+��_l��𒳞    i ���*;_��,8w��5�p�]0�A����"l�璝��C
��d����D��MIT,8o�6�\����Οŝ5eJ5�-6q�f��M�r�ɒ_tͬ\��\��OBv�!&��"�nӂ2,��L|6qlj�xl��[3���&��iu8���i����{��tp̮�\Yy��/HvF 2.�ó)h�O��i��
�G��"��dg8�0�y�0y����4��S��Z|�HK�x�Ñm��g�#�)��}6I�����j�8��rL��V�tOv�q�'!;�Ar�i׫��w[ei��]���S1�ވ�2���H�n$���ߴj�{[�m)w�l��� ���0ꥅQo��)M ?m�@x� /~� }��6[A�9Xͤ,�'�r�N-���꼓'`�H	�N�1��%k��Z��i��N����+�_����y0����`b:pNi\�
Mm���J�nZXn5`�P~@$�%�ZN���X�eZ�hocm52��:匰����+;,v禕=b�޿�t�.���+��5׬� �>D۬$P�6��ݪ�:�O�.������YG���ᅍ {�^�L�����5O7��9v�	Pن�f�q�]t��3]M���ir5]��g�͚$;�3�g�_���փG_�����1@B��� Y�~����c�#ӿ��DV�Ru#�AVF��%��2������w��'N�i���2X�=�s�+jE�Wp.b0����\���(��܉��U�R�Ѻ�U�g�('۞�NUS���ЍL��mg��ɖ�ʗ�;}^Y�Կ�ʗw�,.���0+��'�i�V9~A�>cǚ�G�M�I��Ӱ"AJ���&���ڗ�TS+w���w]rs��$ٴ�
����ᴖ���y�B���0>���X\|��
H�7jy��H���3HoӦ�(t���_�����n(���)W��g�/�w�g1�a9@�0�Wo,p�FLi���ih:B�Yoj���5���=��9�I�,4�RyLcE��������C�y������!�%����~�ԫ������*����!�v7��w�^'ឭW2aB�yH����K �{dj3z��(7C��$�����l�)�����_�R�	Q��R�	�lR��3Ky��ϖ���JW8m�4���DI1��d�ă[��[#�PG�0-�jZ'ų�x�
�v�zVV^s��Q �bi��n�=I����:���gf?��\�I<��0uv'C.P�6���ø7���܃�4rsR���1�,�N�b��ㅫ�zF�Q���@�ʝ>��ĩ�D�4yN�F{����Ƌ��;�9D�K��t��f�CRe��Iq�k�m�2�K1{8��W�/;WV^e��$;m*:A��q�P0� l�+�%�2��ՙ�'��k�,P�֥v<,����&���w�#��l�z���w곎jU��[*��|Ժo.�O&ߋE-��ٹƩ���d�����mZI��S7��L�,M�(pU�1��~��o���(��C�a��A�����$�:��W^�𗙆�Zg�o~��o�]g"IB�i��ڢ�Ef��
��i��/��Y���*G���
�w-�w�< -`YD������D����+�_�ߢ�R�3R�W����ٯ3Y��MJ��e��':�#��
������8V��ke�S��R��Ͼ�b�8]��$�?��J��Fව+���;/��w�h��[Y �m8x����1���4����yx�ӆ��G?鋕:����UU��ZO��G��٪��+��9�.�|Ŗk�V�#��D�{M��1c/<�7���91�{)�s���l�Ǩ:c>�:���d�cq��ύ�p����[ �͗��~[�:�&�SqC�b��\?���̿;�C�{1�Ao��_�v}����=��r�Li?ұ Ĝ|I@8G�>2.J�TQ���Dpr��b�k��`�b���w�ٸ.�k���b7�ʝ^(j�����A[������y[e��!4�QcW����-&��N!k�0��0��Cξ��_���R5�̌�m@�ϩ����2�fNM�#�I SX���}�u��(����Np�6��E8T��zR���d��{!̅;��h�%��9�����!�W�n���?�A���	�\ё�M|�K���f�6�y�ǡ_k�d.blw0m�4�ʙ���r�#������\�����g��P1×�7�[�B0[w�!̲����ӄ`^�桾�%���?��^�X��\U��h|/	/+q�@#++�I��ȗ�t�3�>���ܰ�t8r����Jb2��]�+���)I��9j���'�1C��ݍGjgݴ
39|�4{ UK3��R�����٧���Ʃ�B��!r�qWv����?vۛ�hD��r�)�f��[t��ᠪQX66&H׬��)M%��
��xne哲3Mۚ�8mP�0��	�_��m�]e�߇�챲uZ-W}�kJ�B�;Z�T���^��~�t�����-�
R�E�O���Y��9�����!V�t�w
Tv��g^&�n��-�*���ٹƩCv��N���p1��X�c���pr��3s�tb����m�ڄ�5?��� SC��Yȱ�3� �O�뺎Z�����]���2���'W^Ӈ��>�W �8��w?�5?�Ϸ��!Vhj�����Tu0���y�`֒����F�S��ɤc�Az��s0�ǡ�����J��F�7�qV��oÛoÙ	�i�Ji7�BS��*]�4#W��ȴ���dl���a��MggpĀ��s���ن�� �������������y"_z�Χׯo�k���]���!��ЮѱB[��(,��U]N�����<,�l�'���SeH;:޹karUp�cIc��+w�=�u��e������i�����ۄeu3�|��kJ�bb#͙J����j�"���Ya�ڥ4K�k:�ڱ�����s�:m�5m��hf#�Wg�jOX8εz!ǜ):O��N+���m���V��N��V�T�ɠfksul(jEi��'��U�1�Q�iq��>�k��I8���dލ]���F�Byr7)���/��S�o� :��vjG,e�ٌ,j��B�2#�b����qbj��ʫ���d'��H���3dg�0:�S��A"/&;�A`v�~0`���6�����,OxNZ72G���E�k<]ҫo�ƶc.�OSu�o��&�X/c1!�r��v,q�'!;�!k+��1/��&��肇�M!:�ћZ6(ë�K�z�t0��
�c��v*=eֺ0K'��++���3����l���8]gDS"\�F�U���B�n��1�fYW(y+��|�^m�:�������N
ٓ���*���+�9�E�G�*�K�������>,�[�Կىc��n��nlfe�<C����Ь�� ��E��a����I./Q��)4��-��i<\�u�1O؝++���3��S�@����� ;xG�Z�<�ڽ��t:���"�P�:����9�Μ�t��x9
4��q��;K��Ӏ��i���<���s�\�ɵ�n�N��%N�$d�?xȍ�[3��wזzs�б����>�0g�[���G����3ĜL�R�mJކ����+���3��%B~����X��q��ܡ�mhVZy1�1���@ț���Ԩ��`���ݵ�&�|���7a�N���J��z)����&���X��r�E��~��/��f�W�n�
�{1n���D+h�z����c��~��Ae���U��)���p-�=��Czz�L���4nꐜ�|��o���\�uoÉ�GO��Z-^��j3j��P��v��F+7c\nh�C��$��NFq���8`��A����J�F�@�P�W���H����G�Y������z�fhj�p���!$7�/-�\B�R���N�gߦ�#��ޯ�XX�N�+I/��;
��5%jb��r3�1%�H~֏@��	�}"�<ĤA�:9$�E&�����my�m�y>Gő{�A"ٯ8Z ���iQ���6�%oz�޸��,�Qa�    �v3�|ib`aӋ�C�t�>@�y�ua�:d�<��F������c/�~�S��V�����|���@6��r��/�HB��nԆl2�;<��L������@#���MK� Qj�M�>1�V*���,�|�=�E%�/���*��H���+yL����'�1��8i4���i���0��/]|p�ܡE����$
p�[����+��ep�����t�Ĵ�#_�2%�X[��q�<񎐐���i��h͉5��^gI�]�g���W����Jr̱����6`��'ӈ�En��0��c��M��j��7k��	S>'�2(pC
�n<;�Ps��]�*޸�S�������oΧ�3��x�pua啩>#�����G`�|^������=w��S��s���\�J�(VWh>G#��ul.h�rO%��S�͎��mo������UR{��Q��������T�S��I�I��?E��D�R+�$�Ύ�1�?�,�V�P�6z�-H	ߤ!��r�-`ֆ�p��Tv���wQ�$휌DЄB)�XBr'pcV^��3b�0|��CV�I���,�P�a5��bL�M�~2j������A�Yù�Қ�Q�q��t�T��sxc)7��TX���~T�c���T+�L�1�Z����I�gsnPR	�	�����t��1r֎�]�Z����nFT8�Y����Vrp)[o�4��gu��$
>2
>�[�YĽJ��DC���+S}FL_�H�f��g	>�8��S���r�*�w'�&V(y�F".���*��Q�TK����&���svnj�0����9�E."'�&�\yM*_~R��U|д�=1��i����%R�j`��SQt��7�9�襁�rG�!MX�M���)U�9���*ʻ}_Yy%�K#��=V�t~[&-?�{�>_�I�͢��\w�J
�t��� ui��\��q������P��kD ͛����J?�����'͢���řE�_͢���R1�͢w��X3�BH'�I(yK���뵑�t��Pf��&;Oc$�1roJvW�I�}o�Iv�8:1.�tX�Ӈ 3K��Q fb
�8��h�p�:~�O)�R�p��U��ϙ����	���([���5���TE�ϕq��j�I !]����_o�:��LJ3��j���;�����-�6%��dx<CQ�ɔ��t+�F����#t���#��~?���mo�aSXA*���$[l'�VG� �oՋ�k$B���>1l[Ķ���������쾚���k�f��5��M���s����8<e�>ԟ��g���es9�����
Gm6��%��Ţ�Z�u)�-�Zz��`mr�����ʽ�x�߬���++�����~#7��*�(�~B��t�w�|�!��� ^��-OG0������4�hTϭ�ѫ���J�F҉�Z��l�;���z���D{��ia啩>#�r׫	�ȏ��RLN]cA2Ylz�\�8�ݨ�
%o
J������0�f�)*�u�d��d�ٺ����j��D�q��O��Sl-�����W������+3���xнt�B��$Ici%�L%;���!e���/P���Q,C���K3UZ?6��])�J�\@��j*VM��ծ��R���W������fK���e���W����Â_��܁@bv��x���RM�).�Z�YC`?;�b�['r;�6(/o�I�-ꪚ���6��8�S���B�|FL�NS��tWUS�;��2;�w��_�)��`�����FJ�u�
v)�1���4�Ob���-H�x�S�@�4�A�Oh�EL��;}v^��O�$R
��6���Vg»�4�g�Ɉ�)V'�?(��Ջ�f��U8��F�fhm6<Y\���k�����b�XsS���=)�x���'ij+��62��ttr�2�4�:���=��ӻ���*;��;a�����F�v��V^	�2	���?+��WN�'���������8GV���c����`��$fw�6O�X=;s4�0
�:g/�8�nq�ʝ> ;�h��7���x�j��\b-����� �ʊ�-s_��,�A�̓��E�kT!���q��<G��?��B��g70�_��SS~���4�x$A����f`=��}����gJ����;$O�w�O+ǵ���C��h�Bc*Bό��]?Ǳ��N^�(�S/~B������X�š#Sg�I)co�}�r�� cT׍��_���	g�����N�EX�w��V>q~4��h�[�W�S=+�\w��Z
�}؜�mr��� }7��j$�'�+�ъ�(ZA�M��2��Q�J���:n����="wn�,�h7V�@ǛP�s�i!:�e[`v�V�q��xC����
F�B�7)��/��6kn���@+w�0V�ħ�B��ҁ���>�����~������W̥dӤ�4[���w�PXR�@~:A,�k������3��p"Ϳ��*9?#�	u�O�3�Y�Lm�M��������
wLe>��ۅ�_���SU��!z�b'P�t�I�3�6<Y
�=����Y��^�H�x�d���"n�&;W���\��OBv*0��]ѹ�u��P����6� ÿ��c{ZȾ���u��l�+*	Ns/#cSS`{*Ｐ�*:?#�	�NX&�ҐA�)��i��[s񅦔����E���VyS�,���`�x�kk�e�ǓoɗhlNѩd�N��nm��u����;} 9�����A�����6+{��q�^��A��s�ثZK�![��w��P�f�4RL=?,,�صZՎl�SOVV^E�g$:-,��S�h�*h7AeRJge�I��ťwLŇ�`V�w/P�F�,S̀ ;�7S!��� ��<���I��A�1O��JI�1����B;Y��^S�>��k��I��x��������mԝ�v���h?�@Fu�B���M��r�(A�i<7���h���R=Gg�+����W���Ngk�<aE�~Y'�y�����y�Ѐ砉@b�h� Y��mR�S��yEq����!�D��}X�3��S2�B�\繕b��u@��_�^�Γ+��V�����!jE����%;�����Mm!7��Ӟ}�Y�����c&�Y���x8c�4}���I;���5��9�F��!�9Y++�~i~�t�I�|r���+�L»��+$��V�v'6�$L�^�PѢ�]��{s���Z�klQ0w7MQ�(7|b�G.�����+}_,}ߛg���)bsd������چ4�rӲ֙x}��*�)��/�,���g��?���m�������i>f��|�V�-!��J���{����h��Ъ��GE�
Dg .x{��:��������$���oI�t$��\�R����x�;1T3e�՚R#�D����i�f)+�
��ʫ�:-��5�j��Q ��;\�L�9��1��B��d���#N4x�#P�l96H.���hoG�+��$�����i��l�������9-���i���f���%?A91.��A����Kjld��b���Y+�Oˬ���"���vW�x���cR�,�e����ʖm�A�6OZ�菨o~F��C������ݟ�����!����_�������㳕����w���KS'�ˁ7��6z��t(�C
���O����RM����_���#7X����;}X>N�����ւ~�Jk)��w���Cx����~����m%�*G�^��E�ל�1¡ne����m����>X��w�h�ɺ\��s�賆�FR���Q;p5^2$��׈��Tq����c���Q����Qg���R{Ϊnh'���~>k���ښ�J0�q����`A�H!�ڛ��as��!&�,RV�҆��]tj�❃�k}�9ca��:<�������h�w������Q�m�6�)1�<�̰	ՖHVے�K�?4��-�R�Ia��T�Fؗ)O-��#����B�_��fȇ���;�+�U��Gt�Lڔ!,�Y
P ��<�c�8v���Ԓlh��a;AF    �q��N*��ş@.��ߜ��>�Եf���L�`P�Ԭ��hܳ*���Qq��t���b9��uV�251�g2��N�I$y�Ey�H!)BK�[Q�U��6C���	�d?&��r=&��F�~^ ��/��՛��1_������I]�A����/+g��B36rl��=��Jd<�6j.�{��ث+6�4��X9ijPT��g���I�O`++/��F���3��X;��&A�Lk�e6~f"tɓ������tVO��Y*}��L��x}f:ewH!��5hc�H�!��P�q���z
P�Uj`38�u`��]�q�]!��b�#���I#ce�FF�ź
k��jl�����wmϸK(/��gd\]����hMUl4(ko�8Tƈ#Ԓ^����ZN���
-o��2�r�Rq��Bm51��6���_�Ԝj3Y�_:��Í��7���qYXyM>]Z�����ށ��s�<�l]N�<=MSh�u���0�G�&�m�<%_'���*S�c���Ϥz(���X�|e���{�K����,��{a~���>l�ʙm>�����U�}`V�b��� ,����(�yDp�;�\-�v"���&�<BH+˯�t��"$>����y4g�q��w��(0��N� �R���Op�N�J�P���o��J���G��}O�+w��C��n}!M�+"�˚ŚS<Ua�-~y�����Up���+��Q���{�5����ԇ��F�2��/����	�/�|l�H��L���[�H����1�n��^���M�JU؛�A�x��i��g��[���uѩ�8j<I1��e5����:���oO<k��ᄊxz�6�)9�iM�ܫj�Vx��@x-�_�,���5ky(����;e�-=$����"̛׿8�����Iڅ�\9�m���1c��o�p�1�8�6~�� ���>Ƹ̻ �}�R���%�(2m;�XY�d�#fx�-CH��OE��5�CCۗ��fV�d]')�i�H��b@dPK�������"ܾ�^��-?g6�̄��&���=�6M;�5��$���k)�k����߿yc��曯��&��g9�iV�c+�J�06��N�<`�O.��Ա=r�ڻS��QA�:#Eg��#��!M5�}J]Yy��3�i^c�0�����3�c����ߏ�W $����Hb�i�7��&��_Z�`�#�h�fxZ0��7����]�J^�Ӈ��K=��"%S�.���m����v&����b
�jy�`��[��9�դ�7�M���	���!X���++?�J�+���AJЕ��!�Xۖ�u#:�hƑaֵ�u�ꀣ�����kW(y����$���ض*`�uI2w��OC�w���\L���]�%۝���ibǨ'{��X���s�S?����[r+[�rI:�n��f���!:S��ҷ܊�i����iС!��#����M}���	ѹ��i��F�$MǨ�N}�{�t���S.��3�Nn
5h1L�bA��9(�ڡ�_���Wd�݇X]���_c���},�yXh8Ӄ�b]�CN¤
Q�}���4��@S�{�yX	3�j[�V����\�ԏ!:C��P
�H�ְ��Y�'yN���!`��;�V�n+�YX��P����:@�=�sUҳS{4�2�H�y�;�-���Ч��!C��J����.������L}�дޒv2G�zK=����O�����o�)_'�q�"Zټ�N�fة��`kEs�)�o3{�wq�1JN���%C����8$�a���++�EI�V�t;:-��3%��8L�SVHj��ĨP���n�"�`�|�6+���뇘�t��P,�br�^���m9��aZXy��ˤ���aɊs� �4��}I]kl��d*��[[x�ȕN���{l�3u��1�XCk�g�n��r���
����^+D�J\���9���+��Y��Np�k�gD�	.q����X��~�yewO�׎�)�6���6�&TlH�>����-y4�t\�����v+��Z�Fk�i�n�9�쏉�� $:P��@�4-oaFH���'��p�2��GxP�-�z2�5�Rq��$348���V�_H��mBם�c:+���$n7M��w�,��\`��h-��H�\JϹ�|؃��`m��!�q��@�Ć���n�� ���k��s���);t�"�0CPNi�� �.�j���r���B��i�ab7�s�E�+��O0�h���}�3L{�#Ģa���p6L����u�� �ʝ>06�8��ȟ��� ������!�d��OV��	�Y��fN�s��f-��BYɢ�Y�3}�V.3��g�X��TP��W��2�f��Dg����3b�S�Vhj�+�=�CCS5B�T�i�J��f��yB��rnx-��
-ꂀgR�:
�<ђ���J��F�78���3���>�����禤SFy?r���ԉY'c�`�)yl>{�f��{�ܡG�Z�[��ܬ�����I.E�'�WV^	�2	��|��oA�|ְ�}�(�h�_��-��=v�=�b'Hp۰��F���q�
�m��t\���D���p�3i\���S��v��nv����:���N�x]پ���al:�*d�3^m+��a�o��,9���F`՚�GƎP��c_X~�����:[wy��L���ʙmRh�=��w�6�\da"B�B��[imlλdl�ھ�)	^����(�y�)x�N:��çgo:�8�Z��Τ��'�1I�<l�S-���9��U�h�(iRE���Ҭ�C�<g)�W���b��2 �	y<����D`�,����Y:���S�dwù+���4��q���l6�(Ѥ���>�Y�����.�)0����H�������O �{M-Fua�tgH#��� Qx��������/��(�Y��m0܎hE_(�BY�s��lñp�A�k&_�7	:�a��Zp2h.��Ǡ�W�_��|���9#^p��sl�������m�����m�B1��M�I�%xP0��w-���g��I_�d/��`!���ٯ������f�V�d��J��t���X���g{(���ۣ~Ϛ�C�)�Br��7	�u���Ы���5�����:m'�QN�Z�fs��4�u��Y%��xtS ��)#+w��qX��O"����]ٹ�w[��a�hD��(�fjg��2\M<ߋ�ܱ�Q����O�.YM~�Yb��D�ka�c�ǻ��<m�jI�sv�.*�[i^����:��
��L	S�x7P�|I/����@J���]�E�ė�e�MK���f���yn��H�,c�FJ�Zk���i9d�r���?.4d��.:�n7H��}[����ȬX	6+�=h#�Ob/B�!HV�x�"�sѻ�H�ڒ5�48�R�c���א�M���������Mv	i�̶*1J�T�:W3X�QRC�x�3���ɐik�g�f`���(Ôt�/�|lr�q��΂�w�!�#���~h|a�p�5t���#^n�"<%g��NdW��Q6;t�j����W(�f�'-�<�<e{r���a���r��U�v��[�t���]x��}�Ġ��-@�KXe�8(���E��-�o��|����|O%h3�������7ԬŨV8�+$*���(Ȋt�鈘U��ט�g���
1u���~�Sk�9���[��J`�06�R866Nԃ�(c�:{6�ﮆD�^��Jg�>����\�����6x&*=���a�;�w�0��Ր��uo��~���/i��ý�[��D� /KXW����FIB)7�Y�tJ�9L�U�A�2���e�,ii�y��[�d�c�����:Y��	�Mk39�S~�_��w!�	�c�cJ�v�臃��s�E���"#�j$�p�M$?�k�Ɛ�қ�LMZOFW�3}��A-�?B\����1��y" ��# ~���?��u�7o���Lo�����_ZƯ�W�y��;���]{�;�s_��a_���u��]����?��>�cF�~�Q<{���    �4Kޭ�]�͕l[n���)�\������Zn#�s��R���T�8��M�&���`C��HZ-���_Z��M��;k��f���Z"���Z�)��#A���q���]*؀T���Q�ѣ-x-j�%���L-v��=A�+�~i~���������GO�.�aם]������fFҖ[���1�1m�S��w���T�"�����<��J��2�	����J�K��y�s���S>'ڟ��BS�#�/0I�"њ���I��p���UՄ��N�΁�E�U�$iS|��r��A����+�_,����^g��S�����ݕ�+4�i���~je�Lb�f�DA�cxWF����T\��w�`���na<������_���j�C������������+?������O�	j(���ᗿ�/���?W���W��l�lN
��]^�0�+_��� ���c�b����r���Tj�a1��&h���J12����b�E������R��`FϹ�ڡBB���\ٻ<e��=�䠆�6)@�@Lz�X��r�PC`�2�ё���;�`��~�	=6ve���7_}m��k��Wg:���$'���敽� Ncj��u�D5���#,c�7'����8��;$oѤ����껱u�c�%��ȁ�,���=���14u΃�.�Mf�.\�í�T�����C[C*�-�hsr�6�x(z+��p�aG�a��`"W{��=r�+�?� �W���oI�k��E�OŹ���!�u�[��=[���2�ZsM?�+GM������[��L��"I[�F�f�ԫ�,�\,]���gNpp�'�L�F��FM��3�?�8 w����+{����uu$�8�����idogyh2��%q��/E��L�v�:g'�>���^Y�1$�ǔ1������2�����Z9���a�q�H
��d�i��Ai��N�a�f���c�[��(ٞ �_Yy�]f��k��_}{���w I>�����N�'�k-q�&KL�:.R��i�Ga3��S�s��]�JӨ|� x�QЅ�W
�4
�M�:����|��W�b��BSې��4>\�b4�<B|�0��c�w�t\��'P�	�7R��`�бn�}���eR4�N��QH.Cێ�)0HM��Õv3ln�>s����o'#���oP���zE��]�v?ֻr�5Pb�����G���*0u��]�^v�ѕ_��;6��z�@��ɉ�핕B~�x��m��:+�!8�I�T�B��<['�ց>E˕q T&�v?�2���CNm�!�{�!/#f�	v������O֮w[�;��4D�q\q��h{�p�] ������K�ŉ�?u�l�)Z<�)T|�a��_��.8p��zwv��7���0�V3�CU'C\jh�e[�o��=�6��g�s�f4��Z���Ni�h�������r�+����w�<�(��9�u�\���c����x���m�QGݴAǾ[R��h`v�K������Y����`�뫿���/?�ذ���g�?��?~����/���8�Ɵ��K����Ϸ�Q3�ι}�yi/��V;�S�V�����KZ
k3�}��Q:T
�8|
8EC�g��`�hr>����z����w�n~<g�Ce����whj�≉�^��N�R~�2�D����i��Z�2�v��	�����}��c�بn���EƯ�|�ß���_�R��.߁��|[������G��k���D��G��'�v�ލ�+C����Д��2��؈O4�=,'�Y��	�tE�<�g�4q:q���kMћ?���Ɨ��������k�������/q���|�p�#�5����=	�V3�l̆��00��jA0��.�O�܋=��W�*OZ �i��B���9BW��/�WV^��s���yc���9���r�tp̙w	u�66�"��n�^R���  x��Td�Y^�)q���<�B�+��T�)%�T��P��M���=������oE���|��z^�Zm3��n���n6����L���9G���$ٍ�H�wv]-"�Km9F��y��Z	����TS��ʫ]wiv��w7��s��Cj�u*�i���,cv?�4�MY��˹��O�Кe�{mVv�)=CK�zl�V�v����C6����+�_��8.Ǯu\��Y����g���hj��<�T'+x��Zc���;
��}+9���Ծ[-�	R4	��B+0,�4b��V�M��O���������G.ƥ�fJG�V��6��Z+�b��Ⱦi���$q�ʄ�X�g�7�\ONC)Y)�c6��ae�C��E++���YR7���w��Wߞ٘�:�ĥ�&���j�Ѓ��C��1�����[f��,�T]t!%�/����b��쉩z++��z��_�󹩔!��_E�B[�qta���M���(C�X�EXu�����:T��/��CPscQ�ok5�CsYX�C���;Q��,���8�[�H��< %�O�zg-�x"�k���vB����-�-&�ZL�շ���x���[�BòS�6�n�0Η?��f�39�0���������Wt�V;M��r#MFS�֧�갥�MJ�n�h{��ba��z���	9���Pe��%+�>2��+�����;.y8``c&I���x�U��\+(m�׫�2L���x���얬�P�&e���!H5x�z��j�'�:5�y�䱵��m�Vb1Y'�"E�$[�d��ʫ���1�����xN��!��qW,��Ff{��4p�r#.��e��	��J��Ǯ3�R�^s�>-CJD�)�-%���Χ=|����O�+�˔=�g��=����_�l޽�W�
�˻ۻ���yP*Zz=��)^f�>��t���k�H.�� f^3�Ŭ�5qh�i�����++�.�9\�_�1��9�ӤӥAq~��il,SB��4����R�:[�:���{���1^^�E�}��(�tB�6�U��ب���Ԋ~���\-�:1�`ݩ)�+{��0� ����@�@C�ᥴ�����(
���a���XP)dc}Sė)-����+�����O�-����Ъ��(		L�z)��I������w��m�����:h�ۇ�Z�O�Tx��DF����,�p����:�Y��F�a.���8Wl�{m>+ˮ1�O�{���=����d7}�B����y7��S��p�)eBHs�4�}{���9��Mǵ���c0T�2[�	���W��2��ca��|����ʹcx�햗���V+w�O�ƈ@��i(6뜟Aܽt�OL�8z�sTg΢u�	�t:���}_Yy%�K#�ێ�w��^(����@�b�	|���	'1O�Y��8�9ц�bk�#O�;��@�S��l�{zh��m2�[�3�����?�駛!�o��/�믾����_�~���p���?���\����,���L�ߟ���e�O�K�8,�r4a㑇U"vp����9̌[R�&Y��d&����;���By�o����5����i������o�Vo��w���7�o��"]�l;ϯ�?Xk�n���m)�0��&��p:��	��\ʑ�i��A`$Ba#)V�sRP?�/j8��Ol����� ���o�;�4��� 7{8���B�*���TbM��^�op/�6�	#~46aBqզ(ӾX��{����d��<����C/�R�w�ǣ��O/��0�o��_����ȞP��ڛ]��3	W�p�!��V`8ͨ�i�3\���B��E	�x�#
�V�V��pY��/N�WӲ��#��5����wY�p)q޵VW(t��4f���2���X�:���Z��!��(��a���̡0=���� &g����6YY���$\����$\��G�z�۽�@���;7���i�zk�@���w�+�TH�Z��P�$�{��O�o}��BocO��,��l�W6yq6��b9X򴏷�B���ѽjl7u�������݌7FW�9�X��y��b/�e�V��c#T��&+�>2���A�+���l/�M,"'�_:�B���1    ��l$*�aW�{��,rc�r�Ƕ�/2^�J1iN81Ya^�V���z��ѵ��#�I��ɋ�I�,6qx�����(t�p�x��h(@	6��]Kj!��l.7J���Y����`e��%_gYý�ז���#�I��ɋ�I�,6���îP��+EWu��w�&
ޠM�<�$[��h�Z{���O
h(�i�Z����6YX���D�l��l"��&|p��}��
�B���ȴY;,38(u�7��Ǒ'����Z��<"7��#�Gˁg,' �VV^.���^e�w/ ���72��WHjK�	Ńg�F�=0�U`q=��{�5�u&N���]���q��ٖ8�(�YXy��K��!��q׿Ǐ���*I�]g�<��Ԯ�Ԗ,��hCc����-a��P���q��g��L��Z#R��;3��u��p
'|a��/���	�Y/����{��_�n��m����`nr.f������Y�z�X�D� U�H������^�锇J ������o^��YzƢ"���"�W�|�6��<Z4]���X�B��s�a�1�K�J�"k�n<iZGtvY�xY�6:���s}��?�-+���K��tH��[,,;.z��tpY���+���f�1?��4gJ'3k!�j�Z�:��j�箮
,#���rl�c�y�7je�7��鍊)��A�b���T��m4SBq4A�M��C����2�)oA'~Ae*.+�W��d]ӳ����|�����ѹ 
�[��pؘL�����YX�q#8�������\R'��I��&+�ʰ��	�(p|0Yǀg&�]Ƶ7��s��e���Q�Fר�/=�6YY�����B��lrY-�6<�¾6Y�ЭU�9�c��j\U&UC����I�o���z_�P�P��:;?M*��f���f�>2�\+__�M.����!�iץY�P]�''p�*��0�4�;h!�L�[8��Z--D��`L����l�qá��ʲ��&W8��g�˂ss�|���%+�Y"��+̪��3��ZF\�7ڤ�X9��3�������y������,��lr-y6��q��,<��A���h�#v���:N�G�
�\S/v�`~�R���N7�jq2���iG	����~�7YX����Z ��lrY�.����M(t��㈇����4�h�x[���n�������ɛ���\4�E��e�'�0V^sx��û�4q��0�
��@џh~_�����H��lR��f=ʉ�#A�TG��#�Ri������� >��o=A�+�~i~���o����IjPx��|hݥ���r�vj�KMw�W��xzv����mf� ��c[��w,צ97��ý�����	��i��t7�t�?�f&u�H<R����KVf�>#(�6�����[ْ�6�qSh���"�N�@��n
�9E�Y�:D>U�U���ݵ��7%�w���9��6�w�f����6L^�x�6����+��%��^M�YK�Z�O��O����71����3[ʤ�n�+=s�������AQ�����oϵ]���d�	���҈��3:�t�Gp�������Av���|�ZK^���ed%(�8������t�g��g*	��̒4'&�	�㺅��ʏ�%����#�>{����(M*Z#cEG��23�V*0h��R�n	Z�p�FEpz(L�7W�y�ҧz��V_���a/�8����8�Z��D;�!�m��g{I$a90��}0�Z�J���4�N\d+1p�M�ph�SF����uA���T,��uΦA1�I�ZY|e�χ�Z��F��%�oS�4٥`�(�B������-���Zި[�O���)�c���M�L�#�ZIKA� C�Ԃ[��j|��W?���#��� /ʾ,�$���V(t�0�O8�ᎍ� J8Zp�F�-ß���+�����8���41g�����.��²��&W��g��qp��b�j�
ݺ/%7eIѩ�	/�=�v;��}��6 )�:�J#��M|
Ȣ����|9і��������~�CȑϜ�	�`�ã��}��6,�%3�U2r��3r��h9�x�Q�4��E�sD�J=W��V����G dW�_��wl�wl�!�h�n�|�0�8#����Ϊy �Μ��Rʙ�T{�����HҠ{�Hppr ���Ԙ����7�:�0�V��lɆ;K�$�Tm�)��^�����5�]M=9��IjoF1��<���DXY~A�ҁ�Y?|�g�'0����vV�q�R�9_L:ŧ�Z�1g��
B��҃�"�hu�gU8����dpm�p�����[Y~A���7���s=ߡz�	\��o]ٿ?s�9�]����%��軵p��6J��7�\����s��V]�Yz ����xz��H�4#�v(�{-��g<����-߼_��4Qm^f	ň0b
&{Ʒҹ���gǪa��g�Q�+!z��{u9EH�)|e��/��-A�݌]���\���0k}L��4�U�gn���U	\�K��fs�g���Y�7��3���}���)���T��K�Ï?����n^ �wp:��4ޚ����ix������[�x8&L��&����s�k{�q���	w�˵y��A�q�|/]N��V_St�O��{�t���qh�����l��sKcҡ/V`�t�ͼ�{X����w]���èůT"��۠���O!����Rf��!F8�Q�X���N������������:Y�&��<��"·�˻�C+;�����&�V�)Ec�k�Cw4�kN�Ws+Ō�Z/��`�I�K�Q�����,���?��n&���`��zW�p�3��a�1�4źV�k�W\`��{f��A`n��bdSw�l�^��rb���ʫ~�F���}��y!H�Bp%Ȥ}(�ijs���RR�0k��l�DOٻD������D�d�X��.٦I��f��2���u�����v�χ��[�����|��N/g���k�>L��^�f��y����\��-@o(��s����\�ް������o�X��"����=+��8"����ш��1�q�`�{�Q��q�u�_C�ʉ�K�FV��i�{�_�b��/��9��*0D𿻖���m-d/�a��p���}��1>��w��Rn1[F��0>�Q��O�cy�@W�_ȁ~�������o�����x�����z�����}}8�p�a��F���,%�������8E�r0�IS�S���i,7,�H�S6��+�6�e�8�(�4~u�z�J�v��|���&��1p[ס�(��bM��C�q}P��}��iM��X:~�aɀD�����W�4�)h���4e�#`%ٕ�+4����b&c�71KЉf17J)��n`��+NU��L�lMvA�1s�6�bW?m�~���^ʷ{��S�Y�>*��n��c�M*C�맨ӏ�Hz辶���P7��FА�k������l�g�u/,~2ԍs/.Z6�k)���v���;��|u�]����s6����o$X�M�:��I/	�u�$��!p+���"�����$�br�͔<���
>����hٻ$eZ��)�2�s4���O����k&��a/ic�jA��Cw��z.��6{�|�o��O+����
�9�UJ:�]ˣHcK���(����LDM�1[����9ìs��ν{:U����j�^�5{g���ۚ��&���n1�
Mi����	�\�
^�������1��K�q��^K�a4��n�r��Z�	|e��/������x<'�{�ʻC���FPWHj����`-����s�e�x��CO7��o�{4���
��>�h�<�Mo}���'W^�����F�H�o�u�����م�������xZI�{��cǑ\�Y�+�ɰ�E�"3����ȜYi�e��i��,�5v���j>����\��xe]�h���nUfd�Ȉ����dU�,+�4�Fe)�Q�K)�����Sp�J�n�py{2G|B��צ���H۷��d�T�w:\|�Ps    F����N�I�bO*�
��ޅ��q�8t����/��L1�����Ew��1[Ќ�.ň�i\�,T���,Lu-�z��y���w��^���|á2Y)�6���&�������,]4��>�ʋvuLN(����J�k����k�dQ�&�9+�3�cQ��v�w(�2Z?8����m������� +��B�r���G(ڨ�j׳�d6��O�>��n���Zt�9��Is���q����u�7���*	G�7gx����l=�G3�g+�j�o
����s����]л�F���\���$'� 4����.�ߵ�m�އ�s�5H���|�5���Q��XଦݾB�H�,��)�=�����|�i~bĆ�F6��f�:�X�G,Qn�e, N}��
w*���0�M��F�/ջ�6X��q�c��U�}4�����㤷D>sΛ|�ZM��������1J:����,�C�k��aI��N�4X]��������7>z`Q�^T(E�*@)y��=[����jF��_��ڼ[�~Vt��u®��G�7Y����������
�0�����DxC^%vE5�	�[����=�R������̈-��l �	y��Ҩ7�#����]%>����`{�X���Qo���>G�K�/Z������Έ~>i�џ=g:�aoE5�}���f�J%�GY�2��l��g�2�.��A��-�,�|p.`ʂ�F�*��7m;=$K�r�	����tz�SdS�L�il�v��+��?��/^���<���+��o�����h���9�.��~�����-#p!aY�#J
<n=*1�C�5ݷb$�Z���H�*]���c#u�����D�}e�Ać?>cΙ�Kaw�f^q�B�*��4IZB�c�nJ���Zz{X� Chˬ���tJpi ��Z�#V��c$4�_8m����~�^������O���[ ��������-����3���39�{�73�luM�Z��:�J��<en�y���I@�#K*���t#kM��N��8���H͈_Imă"ߏ$�畂wI�Z̌�b��G��T�M��B�T�E���i�wS��g3����\$Xɜ�-3ܼ�����N�z�����H�\U�$T����c����7VF��2�Z6��mV��Z��>�"-%��F�j�_\�a/���X���Fp�&UxU����U2c������Є�-tsmJ�)��>���`��ŋ������3:��9�4� �\�u1c�������0��f�٪��ʒ�@
�ޅs+�?H���=��x��g�ו�!�ۅ03/��RuV T9���4��B���g�>�T�A2٫O@��ʊ��mf�]·G�3�O�F�b��B�"���Ѷ�
�1z�ԗr;��em;����7!O7*��Қ�����/Y.���N�������,d��P�mV^�h����"_#�m`'!q .p)���:�ج�>^^·ڈ_��"�R�}�*��K�E�ڋO��a���/ǲ��4]��O�9�ʋɭq̸Ґ�D��l�j���$�����V�NX����$�x$�",w;0��E{Z�f�̺��D�T0�~��9�N-��TB�i�.�U���6}�NS��MSGmm�j�D~�� ��������X�S`����a˾~����lP��ل�V�
v�z&^o���6SU�u��wH���<�ʁR���;o+�B�%{yʾ�v��y��vF���q�H��=����8}��g�������Z���&���;�P`��:6����	/ފcI��-Y'��Ms�E� �dF�f���o��$���&5kCq+y���~B�!5�=C���]I+غ�wl�uA<<� \dF� z=D�d��ge�3�7�6��<h���\˼:=2��~���Zl�؆T��4��\�#gK�����ϐ�.��2p7�R��=Չ��AX�i0���2��ۯ��FϬ�k��[�ͼ�⵵�^5���b��48pK,#]�R�A�b��6I�C�Y��1cɄ�-l��	�DVX7������{,ӆ���r�ѮM���K&ty�Ԝ(�Q��Im�����+Y��۶�L��	M(��p�x�J�\�U��f�� LNH���k�k���}��͇o���\L0a�Y�Q�����崗2��	����`֛H��(���$#�ݗm)
6{��su������M��S�������������,��b:�TU,��*A����*��{������,�]���j���5�<圞ƒo�9���淿��YccV:�ۈY���f�p)�KR�?�Vٮ���,���i���Fnf$�-³6���������X�,f����#2�����?�u�:_������96몆��j�`��}=�c����멄���OQ�5,}��_ؓ�����,���d"�賂�����T�����=�Ԗ�Y'K�t�)�T�LU2yL=�%&$oX�ڰ֦1�=��[�+��K���6���ѧujqlZ�ޫP*V�T:0kq�-��)�Ue���[��Z��5�,<n ����/��
� ��_?3���,��MH�y��ל��R(:pQI0�� x����Lݐ�WN!��༥��3@����ł�.8�b��������AG���V�`۱i�xeFA�r6��L�[��$-���p����5�I��LH޴�$����z*ʲ�w7�)�5�j��jO�C�h*��1<4R�������������cX/ݒN�h=�#L�n��n,��+xMժ�M&HcH�`~aTq��J
��H�(�k*�u�pm�$�a�Nn4י�����lB���(��D�.�8�����ZR3�F���HPp�=�nUM����9[ v��OV=����H�a�ץ!�;���7�N_����7^�����wZ���p3:�� �9k���R����O�1�f�t�xݥ�#�5?#H���'�0
fޔz��'$oP�T��k���A��i(��11��-���yI���M��̎�/��m�b���j �53F(�f����S���ƌ��_�)��]�b}΢�91X���0�SKt#5a
����t�v.u���&�!s�D�*����R���*۞�AN��M��M�?��'}c�>�3�v�.����ѩ%�6
��Z*!��B#f,x�X�xր����e�k�r�R-Q�f �H����H������6�z��˜��1[�b�ѩ%'S��^I$O�&,w�ҘC��g���O42U��f9'��\�k0���HM֌����ڴCx������g.�zH�=<�}:��[:��i�J��0T*�UxFl��qy�����޽�0
oZ���I��2� ;#�K F�:�IIր����u5|A����n�bO4V,%XP����Ԅ.I)�j���ڨ��9��:*lLj_=з{�m9��W�j}߄�P�j�fF6������>s.�޽x����m�wƑOw�/	n?�'μ���QR:	�.j^�ģ�VL}o{��:��8@Z�F���r�&Fv�оN������Ñ-�ңo�E{���&=�rK�#'+������Uq\T%"G>@�yo]&�ud/m��'���2���kxj�g��a�����ަK�&ϼ�B��Pr0$�t�����-p�6���5S�όr���SdAa^3K�3�P�ֶ��̃��	�M�ֽQ�_��c�?ߘ{�Zy�=퓆L���1�Y�E�s�v�Qi\e�����I����tL��C�Xa�B\�Ե㍴���v�g�����#xb�ߓ>z�	1+�f��u{2�0gK;���Ear�^`ecb�h�Mb�8����TY�-�~���.9�y�^z�V��(�bB�a ����� �'x���Z���&�י�Ml ��J�۞Kul��j�xpL4#y�\[�fSC�����������'tj��Ə%��z����iZ��ǰ�oO�\�65��r�^ g(��a?Hl���)��)���v�!����j-���.��N��b�`�N,E��{�l�*ݭ�E�q[jd�M�/�.�֘�\$���    ���MH�`�Y�㻿x���7������Bm.,���⌎,�Sc���R [���!TۉI�n�Z`��&��� QG�9�5�j�L.���H���Ĕ��=51%�]�31�j�r,�4�_����i���[ԹS����F7Fl_Xr��g��'��ۘ(�GH�'����)!�h����',��]W�G��X�o�ҿ���<� M���+�����ΧX\���k�h9i��_�7��KK�#*���a��Pn�bFv�o�=Y�c�f�OYqu���f�C�t�\f$o��j��ǒS#�['�����#�����N-�79w�����4���U6�R������G�69������{,m?�50#�e�>���%��\�h��՝�%Xa����
uq�?)5�V7�w��Ⱦr�!-�ҫ3)F�x9�_GMW:� 3�Ob �ыs���+�`�����RC��c�a�_`c��~(���f1��x�ېN_N���� �$#�g���s3��T`�,���a5'`O�[���ݝ�}07�7p]`�d����S���9s�>$��ftj1:�����s��Z�������H�f2n	�P���Խ�bhT�f?����C0#�Hn�g�r�'|ހ�z�N��bHȩw'qb���V�d��T��9��T�P1G�j�f�|��@2���21T��sb�Cj���W��&߷�?̠zZ�����N~��8h���,xY�
MM�5��ˇ){�������v!���ef�K�`�b-=�	a�t����R��w>��y��tC͑��ͱuE�\�#koF��8\�g5p&s	)���gFo�]��^�!��	^��W���&��ڞ�1��a��)�o	c=K"MM1W�I��bOKޒv�9i���9r���1�KK1VG��*j#��M�j/ɤ�=���Y����Y����e�3�x�Ҿb�H�NENe9�n��t���f;�K.X 4�pa���q
VU<V���l3�����X0�^(RFks����Q��iɛ�v�.[���}]�|{bFE���� n��R-z8���ލ^
�[P�;�cg	��9s�!�� ��B�,�!tŖSŃ��l��MïM�w�0�>�v\_�N�_�;�S�)�68I��$}r����uN��)m�1�j�=��Ta��n8 ��������Ƨ�yt�Q|.����7�3��$][��U_���x�쪸��۔��~��Iε*r�H�J�%��4�;~.$�H޴�������_�����z�h�헋O(���UK�0��*R�Z�����Ͳt%�UE/Ys@.��e�w_�oMX� ��@\��Ϥ7�V��>��KaW�gtjI�ud\��d��K�g�&��Sߘ�`�ሧ�^���!�BN ݜ�[5�$��H�L�I����w�Υ#!Ğv#k3�$N6Kng�k'u�6�p��at$u��0�������i�[hzᢵ?�H����_�1�g�	�*�©N�1C��>�SKN�捲=�������sq����ƛ��V�$��caT��TmX�oo�����)��)�����U����bZ�t�Q�%cL�$a�7��ݡ6�X?L��l`�NUȫ�I�X�o�u����'S���Z�T)ӡc&`Iߡv�h� �������< a�HR�>�g���GW����Ƶ|�<w��Ez��n�Č./\z����r��0թ,�X-�QQ
a��?^9u�U�
Az��T�#��������ǻ�}��<��y�=1�y�v�\(v�hF�߹P�բ�y�o�D��hs5a�k�ႇH*U##�B�l..Sp6uؘ�����C���|{b�X���h����(��r�nx�b"���]��w&����Zw������`
p���r{�}L�mM[|d׼��䟐��/1�w���׻�ى�s�X�sI�?�Y��8a
�-*���v꠪j!��Ds5���5��v˥V�^2\�Sz9�h���3�+l���������:����>�^�)�j�r,B,�C�ȴ_韱
m&,�$�5��'Q'�D��=�y!<�^s����d<-y�N�m;��
�>�B��tf���Em��$�i�Z��1J\-� �Ej8�P��3_�����{��t�"�"	e�����
>#y3ŧ*?5��P�]t�f��xF9u��'A�`Pۨ���5��DV���<T�X0>��"AaI$Ʋ(�ځ)�����k3�����Ru�1şz���(\"��~��J-5�4hƄi�4�a��� %�c�:��ߌlG�� V \k�Y�Zc��#�:3�Wñ��?���΢�w
��.z���';HC�K)M��gef�r�fo��&�H���@�}� �q�i�kF�7Y3�7�um��#�>)#��6��bftj��\9s���'���𤪋���۶�����`��`�(+�sg��U.����(3#�챘�fg�b��)�ޝ[(��l��/A|a_�Ю��t-c��CΕ��	�Ut�F��	��fK1�6�ȶ3#~���glϻ��Y����g.���k�kfȖ(m���
����>R�L�:WK���x�=L!C(��HJT�P ��N:��\�\��ßǅ��"��6�(�X�>���k���	����M�e+NJK�r�{���w�R��i��j��9����0Ga��Ό�B���`�c�"U�U�6bw�3ᵚ)�L���C�T��ز�b�"�Z���BlF�潟὿}�~��w''!�pI��~s��X���.K�_�Q� aʢ��;44{����\J��S�ϩ頨%h���7$|��{$,��9����yOk|�}��	�Z\�\�^����*	�ҁ�%��ϙ�!�����,^H�����	�G�����G�3�7�N������U�N��]�f�_��R-�g�Jh��Sf�Q	���Q��􀮔��dv�b1΄!�BY��r�3f$oX�����7'�c���]�(ƒ`A����KN��.E!K+����n���Ѣ #�b��*9N@):� x��3�7;|�vxM��[����;M,P�w�53:��ac�6[��3�u���&O��Ɖ�R:d�Sc ��$��H5&�����H���I����ٖ�.^��v3ftcI!�;�����@�9�
sms�X�YoT���-]1C��R:�TG���t���7K|��xu����o����F�s-q���l�-�N-!�U��*(�2'���t��}l���զڅ����1�yQ�ƺ<|K�T��H����c����r?��WKB:ȴ�ѩ�v�)����鬰J$E�h��Ʉ'=�3`��#ׂ)���0��޳T�Y���Ќ����?��3h��	�Ւ,�L)+�i�+���LSH=��A`�Nw��N�ڋ���Z1���>���=3�7��_O��\R����y�<���Rz5'a��� gu�Z�mϸδ�.)�<$���%�V:Y�1o�i�G���#��2e��m��}�c����g̀�o�يf�l�Z)㲸jQ�$*w�$�+��n�%�o�z�d*t�iI�*^�I�����f��|k"gD?O[���쬕Q�Y[�&��0�B-�U$�L��-�3�{�p�!F��X73FKa�SY��JI��'z�6X��&�PgG��Q�W���U���Y���\��kb6wg3��t	5��M��Ru)𧒊aMr)K�w�5�cHx��(#I]`�*Ti1ՒS�C�w�����_��×�_����	a�Pވc�8c�)�(fxOfoƟyK�������ό��Z�ɇ��	�QlR������99�ƈZ�-��"d��K�*c���W�1����39���	P?H��P��	X#�2S�n�gf>�|��"���~z�/���?�ŝ��?��ۿ��e��S���"����9�ˠ��b�����v�ˀ��MhX��0�q���&��p�e��>ԣ���QpgB�ܹ���}�r�@^S�� �TR!�������Z4��:�H 9�0�\��R�����)#+[
%k�l���օa܉    ��.�֬�k5���Α`�����g�#��U�N��B�G0�1����pGR1�L&w�iS��8��\�V�zM/�z� �����ZG�&$o�z��~�Û�~���~�����<Ug���]�0�KJƸ4<�AN��D���@����ߖ��	�<%����t��F�`�y�H�@õ���!��D���3A��V8��5�O��Ҵ�-�K=	զeUrn�C�n���ƺ�4$#`�m��n��I&���\Z�5�3�7���Ət�S��p���;+u
ƻ����Z�ȥ[��±f���4�����K�f6z5!���� 1�:T,:����A���l��L��� �H�~����3��6l.0���iUYFw�F�!|�8�U���m����� H��j���q}���!:H{�����i��'R�I��Λ}���Xb4�:_�Y��#ۈg>��
붱���PYf"��ګ�@i�f���6#y�׉�?����L|���}J��F�i�Z�%�I�/K=nY雭@Wm6QcrC�E��r�"�DX9[�J��FfB��צ�s^�z�����?��v���;a�c�
>�SK��d��(��0b�Z�{�e�i�~� N5c����2�3��?{��~K�]Z���rP�|.�.���Rs���/�jf���0�YR��b��Ex�1�Tu;j�7!y�'1)�~��~��ߜ[����.��,3� Ko���#�s Ʀ�����	%����u�>Y�,�"E8>T��
a���F6G�w3�7�qm8� �|��dN4�;�/)��ұ	�Z�7�%�6X/���g�ZQ���^{�۳i�[10P|�=d�A�<zkص�QG�ɛ1>%�����޽���V�����g�c	�kS�`Zk���4IjԪ�ٷ�6��<��b	 [ȁv#	4[����Q�0E��NH�,�Y�{��?�4�}�Ni�;c/�|л1��Z�j��f��&�b�3 �x5O�-o�G:j�+�ҋ���I���껉�I�ā-������{���^駞��� #���3���ҝ��n��g�qYXC���g��Z_#yi4c��B�l�H����ѶC�	ɛY�N���@}.�.̲�H~���N-����R�&�M�9oR�c�R�%<���|8�[0jP���*�p#Gk����@�'$o
~m
��B�w��R��8��O�,x ��A�#)>�*��Xilh�5o)n�R�$-c�S�I����W�c�5[��H�p�������N^[�����tF3��S�$9�5	N�Ze-��H"�s��$A�;KG����P�8<�&�M�.ǃ�ɛ�N;?P�G:�Ĭ��I�}��Zq��:	��ZeJ�R�L�\�&G���r�̓t܍x��rN��И���������͋�߼�^�3[��[��.�Q����:�<`X�J��
N��ujc˔ �8��Q4�ь���WK?�}�j�Ef$o��,��g?�~+���Ƌ�.�{~*�D߻�f}�U�%�����m0B�cT7ZbUE��ܢbz��EB�:h���g$o��������S����`�ny�b,)����)�l��"-���m�Xz	�̈́3�&ݲ\]�M�jr���\*�g$oV�ڬ�&n�O������<7���uj�N�4Rݏ2]%��֎�7���ZC���0Sqd�Z�L)W�!���j3�O���� �\m*���u�IEwc�����2���e�@
f�>ؤ����6��L�0:�K��q�Hw�]~��>��K�p,~+}ʰiJ#L(�]+��f��\}l7X�)��v,�(m�co�����T`B�\�����|�4LgV����Ʒ�֩%KZi��B�O�lÇ����@��䪉�3��A�jzf��kE��fW��1��	�/�������x���_�/�˿zf�ՇK�(�す�[∢�N�<�]*G)el��
�l�VݛWA�1�Ik�9y���������7�um��?7X/u:3C�����nR�N-k����1pA���[;����a��ڴ�}d]0��˦dR6�V�}@���5#~��{���L��.��d��tf������[!\�@X0���M/���0䜅���ڄ����-�43�惖|3�7�umksr��7�<K��SKz�������<�SQ�E*Ԋ�7��6�>�R�r�pk_aŜVC��wE؂+�
�sc����C�~�C��(>��&[�aTv�ah�K�Fʨ��C�Ǜ��s(����CZ&݁�^횃�ԇ4 �:�����/엂����|�5��hľ�&յ�ٵ����C6sb�4n��V���#snF�I?��<!�e�������[��݋��9��wo_I�͚?��� S����4aڅ3��h�`XkPp\�4ѫr�?Tqp�mw6ׇ�3z2d$[�0t�u8��:#���.F�-�𓖳�6ڂ��(��A��p �]��A��Y�[ls�r��&cU�pI|3��ƕ��W��^���w�/��A_�]^p��2 �2�<\��V66�B˺x���ҍG���`�ޖ���F���ψ_�����7�S���6��N��z��3��Խ�����Ü�mrzӆ} WC����WC�#�ב7��(��O������k�Mxȯ�}���_�]�ΚV�D����gFpi�s l5悍��*�!�.�2\��ߺǭ� 7d`�ĎɄ[�Q69�����y�7��:��}�7�{����S;�=�%i��
>�S��V��)i��8c� ��Ձm�<<O�� �)�B+�RQe88~���ݚ��v���5;������utn7AwfȖ�.��Y���?��h�kx(�y��b]�2�k�u���+��Bo�a��X����Q qz2��R�#G�K��zؕ�j&�������D�]^Z�Cj;l>�: ��ڤ�Bt�pnW� �z���'q
k�*-iJ��9���5#|[^����c���~G�F��I#B�Pù���K��|IN[�߆dB��h٘ ��Y"��&[�V�����7����PM����F8d�ˑ�ԁc�>8���܁�:�����kㄿ��W�Ė~# �_k�s$���Nu��I�@��$��Ii�",���Yя9���7ӥg�j:`�@���(�K�D~��Ϻ6� �`��?��QG t<�`�>�!邘3t�+U��?�Ij2c��S[k����E�֒�0����N?��`�Gjp%܀��_&���z�dܯm�`�!���:0�YOҺ���T�#��b?}��6Ǧ9>�5�ˋ�$�?A�	�@#�*�r��ԣ<��x$��&���.K�H�����2R�:=v�5!�H�^��3���'�sw~l*�z�N��� {��Q��x-�c��6��;U���M�_7�x]j@� D���'���#m7�q%4�}��MN@��[�W�8$"8 �A{�XNl�k��h�n^��-���&W��ڤǆ���~N��2�	��զ�OB(��4��ɮ�K�KO�]�\m���M�'d?���N��I:�R��0.u B6l��Kj�K���a���N�s�H�����QZ���$�*Z��S� 3��H׉@fS��S����ސWIZa5¸hM��A]�����"����ߕ�b󝎗��n uF���M��1^N2u\�R���*mM�[R����}Ş��΂���[vr�֤��a�M%��l9�D.���=��R>�%�K (m]U� ��Y�VG��<k�D�E[k�ٞgtb��a9���ۧʚ�Wx�𳩦��uֵ�Z|IlUɰN��('2N?�b���ew���q�0~�v8/��ʭ���v�*&��ƅ�@�Z�Ub4�r�FZ>}�d����>�Q�E
դ�,6��>+Δ�ia�lm�-��9�8�@N������`i�v����>bl�x��(W�E��#��ͫ��R�0�/:X��J?����7�ô���F�T���X<F{Jz=�_˜c�vC|���0KWc%�Ȍ�-�ڪq�aV:՗��}��?�	�	$"���Q�%P� ?Vzi .  	�Ǽҙ�}�Q,��g��&�Y�Jk[�,]e�
��fƨ6>�3#~\���F7�|̃@ųF)�V��A<��!�*E��e( n�c���KF��
Pk�_=0 ��:cG�ܙ���Q�w�����=rm��=���=0��Śy�����ӟ0�+P|�������\�O�_&�3��$��)���y�%�r���K)G�4�v��	(�_}���}�F|v�K��<bo�_���^�ٺ���,�7�>���
��G['l2��I+� ߧ�y����B�Ď��u��ص����W����_�ý%��]����` �:�`��.�@�'�7������^������g��_}Q5��N�0��	�f�o	5
��pq|�ǔ���"���Z��iɿ?���ט" a\_*�"c��x
{r�n'��������>����g�sg�%0ޥ��y��Vg�9V�J��"��1�a�0�	]*�*ueR��99�����l��aNc9���ߒ�~E��X�q0��'?��J*Xٹ�9��r���.���~��M����/˲�??�Ѝ      w      x�Ľ]�%��4�,����FI�"��W���q��J��D��nYw߾�Re���;8F\^k37��.�֝-S�.a���h��>��x���Kҳ�W�/�C�q�V��kG��/.5ٮ��ܘa��W4��>�3�Y�rɧ�z���K�4�J��cr�\����G�?B��7���������g��?�ͨ5�ՋK���%'s�Q��+~8e�ާ����%+�5�妴�����Q���|)x:�k��adԜ�I2����O����/�y�a��&^���\*s��j�c�u�5��:�&~��.H�:��Ϛ\�j�{$K��:h��˕C4��l����E\���%���skƠ5��Om��\��"&���Ծ���)�n~�Kb�,�i����/T7L[){�JH���U��V����3�].x�Ja�:��^k�sY���1,l�Zuʗ�L��S�k��i��%�W&T.C���G�V�[�`C�8�⣛	�S<~X[�9	6H�����f����z�[��?�7Wh�ha�Za�,x���~��q��̴A̸���=n��i�ී��J����&k;i⇏�[�ak���2dx ����Z��sL�4��p0�hC��8�["�^|��AϪ�&�F?|�M��̛��~����Z�6����?B��Ex��\��U"6b��u��WH5�lQN�?���3�R�A������5����ՉX��z�-��:=L6�ň��]� ?�s�F�Y�en�W6�!�K�Ʉ�;^���OĄ��g����� ^f�4���t�%�#��EZ
���w�	_�UoLP�#��Z���� ����e<�Q�a8�q������\o�@ ��~�ܪ-�C���X��m�j�9�̓��鼁U��0p����C�y��ÏX/� *�ߜ���Q������")`�taM|�4����+ %�hΕ!�����+W��؋�Y�^�Y�:����G�[�GoNEv-��*���� ��P���g�3�%�!7<�� N��h�ؚt�S���^�G�l���Շ� ����2���p���l �惗O �_6�� �+����z�~!��[�/�ҽ��x��+V>lEl�7s�XH�t�>5��s�N��nn��^��7�G�(0����Gra	�=$���J��1W�m7�e�S��<~���f>%����Qӂ�5<�j,{4M���ĵQH������h�$��?{n�f�k�j�������ܧ�������s�>�Ǔ8f6uf�5�@�=J12��K!�)8x1f��k0�uu츢�,�^`��v$��ĩF�p�*xU�;�G6`#��R~$�j
AQ�����6#�asu%Q+ (���T���p
7����p�:𿕁���������`�Z���P<���Y##�ɪ���>5�n<^��N?��5���p�[Ɂ_�p;�(�q#�������ZF���֜`�sN=K�x��\���njj��p�-�91��xe��Þ8�pas%�8&h�6@��3x�>a@�m�;�6%�\��:x�M:(�Ga�o�E��M���-	�UjL7��s�#������*�J�e;x�w���nòp���6���^(E�S���*9�݆����>c\��0M��/��b�T�E��Kk��i����|~�+>T�E�U��a����?�4l�N�U�!�f�O8�6��^��J@�1��E���纉۟�l������'�k0����( ���XM@䶘�@���`=����	��`��?J Pi6�A��	����BCL�!�ż\� ����<-"Ba\m�Ӝ�W�����NX�RN7b�V�����I��=�%"lBO��˯6�p�֒Ò�{����D ������Y;h�\�>=�<FQG�L�`���>���#���	/���T.��T���a�P��[	�%�ݏ������rV#a�_Y'��%�EV�f���ہ�jzĩ;��Mr|�{��%d@�W�q�"�o�!���x�#a�yi����G0���c���� �5N�a�����I�&l&�v���هlH���@�=�8|'T�f>= 3�ݲ��j����u��6��7��u(:"{tp\ dĹu� B6ORHe�[O��������#�A��吅J�	o��_Kv�{�%o<��:���- kW)�&O6��d&U�@4��z��&�ƶ��:z<��o�<�A�2H6\��>��A�GwU��ҷ2� ������?L�B��_��g�G�J�8K��>�8�}{��{:�@}'��	g	��H�0
��G �آ�ʒ�,�R�^�d�h����YZL%���L_�D��Q���tQ
��T0r7oM<�J���d��k7�G���>�~��zu�1��*�%J�̠�`����!��G�X6T��AA�߭k�4��sʕ�w~��int&�Y27`;�౓L�|��6oA����G���,���ҫO�_6�.��m <��PW�%@zc�f�ڏS C�,�.F��*48mf�W�|kbK��q���fa�����9��u\u�Q��c�ȤA�L�%��d��: 	��u�om�^��$�����k@x\��Jx)Ē��p<����Rl#`���M���\��@h*S�;�k?B�<��s6)�:!�`5x�#\I鮖-=��q|�@��g	�ࠂzH������^,Cd@�4��=������tG�� �ޠzy8�ߥ��4��ऴ��-NB� �XR��oom��8�����xG�㐰L��R�
?�|��@l��\�R!�ݤ ��9L����6�p�A|C���;WwbX
����hcΔ�9�σ-I0%�y��d#��Z
��[���?G8Ĥ�h�r�G��<zX���f6�	��������f��C�dx���ل� �P+ �gձk݊W�{q��ݭ�rcי��Z��^dZ�x�����]=+H�į�Hk}ِxe���:� $+	�q	b�~���o`��:đDtUo���V�.���=�Gמ��`W��G">�U:#)����M7�ߣǐ�=�Q@��ͣ3!�Ϫ�/3�=Il��L���e	�[I��a@��05|�wt�x��S?�p�� ��N�%`A��@�
~�eXY/�җD<�s�k�W;k�x��E��U�����I����(�/qN~��`�{���y�t=ؖ{��A]��8�{�G@���Hk���>c�k+xmX�FV�#�����܎n��4�Q"j/q8̀ЇZl��djɓG
������DN`�� ?����~��ʄ�.k��m�����m7!�aE
�ש5xP�D��sC��M�U#��K��}�����L�F��y���S�[k����tKP�®3S�)��9�
6�}�o4_�e�|����A�H����g������c�j@��І�ŀW
bq�7d6d�%�L��R�X����#O�k^��p06��@������gV����0��,���R��910k����YBZ�٩�>��d��qם7�~F�~.�����G��_���S�l'�%|���~�w��'	@�w=AX����[���
ċa���`��L�|f�� ���v������<r����Z����#e� �o~`NK,�z_\m0�5�]F��O��Aq�����I�����ys.�R�g������] u�I�9�X؂�'|��i-g��YL~���.)5�@���ܠu�!t[���Q��?r��N 0��
��髢&(�73x30}T���Ȩ
����m`5J/SX��Q@}OQg�W;  �D �S'���,2�x�;����`0�}��y|�ƽ(7#s�#���d�#IYHL���f�����	���q��)��H��P��!������/�+{�v@�#b�;�y�%��X��G�8�1F.1����K�8�̢ 5ԡ���o��33HQ�M%a��w��v�8A�����;o    �y�X6�7��f���I0Ύ���,%���ݴ�*��u��9>J���%���5��<�$ �1�nދ؍%�,(I> �"���f�r`�"pW^�"���b��m��Kv.S^>��"�ն~U����@�eCaUmQ��G0���2^�[P�J(3���]�i'`�Մ�ẍ́������D��u��B�������~�� =p��X`���rZ(���K&���8�izJ|}��x�1S,�`D(���0;�& U�-����f)|y�D���߻ӿ_HH?|��J���,��"li�Rɠ�@� �p�]{�}\��b�j�Ȉ�)=N&�R�!��)��&���6W��G��fܹ�h!�߼�ɼ��
��'�G���N����0Yc�GvR�����p���Fݮ���\�pG!{Ƭ����v-��'�]�������mP�J}.I�IqJ !U��$�*�V�U��%�:5����>���;Z�t���6A��$�쐼'��iX��F�G�:y�t+���vl�w����ks|�7W}>eob�-��#������I���Zn��t��Iޅۤ��[ǧcd)@쿩w��r�W�����ٰ�z�B	@xqڂā��8.I���ʻ���ky!�o�j���� ���`�|����R�#Y�aW9�����&��s�������R��x8J5e�Km��S�:�#&�u#T/�V�����lnh�eΕ��&6Sɕc�Ɔ��J§�0����`�|��x��O��
���4�f���X�T�eD-����RV<�o*ϱ5f#[(w�� @���v5p[�ɩ,�5��[�'֊2��ƋxKR$��rݫ����e��1��8L��C@�}O<)��Q/@h�*>ީ����\:�f�>�º�ll_}N������Չ��('P{3V��c$��x��3P��T]�5~��:?�+��!1��6n���/�\��s�dD� ����-�IB2�H;�W����X	�C@����6$�܂� q
�3�i����2a��LWx������MoYa��>7Lw�'�J��x���[k�ӏ<��Vh8>�3�G���5��2����}V��s2�
�k��E��H�I�tW��"�$�ٰT�&p4rx��T��K-�QR�{eBa�B�=�#�P80T`�t�i�j�Ϻ��}�����:1-F&�´aBP�R�cyG�Z }�_��t��1A�[�ͪn*�K�@C��9���=���$���Ǟow�z���<%�@��� ��ķ�%�t|ŪN �0X[��<�qQ3�y�W܃���dD���5��V@2�7ua���|� [HaV٧��w��z�� B<��6�J��+�7+���.ꚈK�'�������*��^�_���\v��V��5i��C�?O��̼me>�$��;m����1����7�����MY���`lˡ��ǿ���-�ſɒ��D̊�y-0K�L��@b��� -ɶ��7����>�����3�����Q�p�nW�U4�<0��?�9�,�������=��>�^H��D���+ &�Ppq���ķ.��w."�&����r���R 9l^n<��xYKF	�8�l#�����6>bͅ�r�F��̀!�
0�i�{u|�)o����WpU�6���������|�Ub��a-}�5�f�E���v��U	�t#��E,Wv|<"$�������: G��!.OF�`���#����O�_��;A{�|�����ܶ�A� <[�7�X�4�����>�bPñgߦ�0�>�G�rPx��2�^�г�[U�a:�i�	�%ge�3�u�cЛ�Ey�A�K��Pn�=^������D����>
 ����'F�>k�? p]������<O��#J���È��*�%a=���
��*��{�:R\��%�+�Lu�h5ΜCL9����>�f��/�z��#1��� D;�Z~�>H��JX�q@j=�Ҥ{ބ�XǩEI^���f>騍�wڐY��z��b~#>���c�`3mG�A��;�c�F�_�nz���b��N�z���*�R��pJv.m�	S��u�]wcR)��u������]����I$n%���$��^�_5�X.���	�R��уS����W���� _��x��x����h��a�餺��n��ROm�ϗ��Zі�\��yDa{��f ��+vy������
�_��,��K�aA���*�ܲ1��4D� ^�k�S��Ej�ԕ��R�3���._�-3����[�x��6�r������\�p �;�S��
m�g1��I���|��%kveo�0�kͱ���(*�{��6��¹��rѯ�//��>�d��.C�ȡb�����z:��<j���k�����0��.d�ݝ�#���rm憐Ǫ��ǋ]<���]",+�=�x����i2�ˆL�+��g�����~� �=�Xlƈ�_���6Tx��ؼ�ʍy*�`������Y�O�W
`�o����+X2���G+��5Om8*N}S*zksĪmh����0����:�
I�"^���6��kg�)w���&Ϻ��Z�G��w��liPnd�e��ӎ�^Ø��|������U����74�ƋB9���-A@%$��^y�٨�B�Aж5��������N'ȭ�����W�����x!�1嫌�`�(W�@:�Z�s��l�{����Pv���P.o����x��>����g��''�����S-5n �OS��y�޿J�W��lx�7/��#�N��w�v����fV�]�C��]m� t�i��ox?��x�1�������fk�m��i�8�;=*�}c����>}C�J�V�,���G���s�ٙ�9W7amx���-W
���h8���?K!�*��ZX��s����ٴ[G�Fv#��m���<�k��[����;E�n��s�h�����p<�Ԃ��p(o
�
����S �`v,�ַ(�gx�\�7��ү��ߥ6+��B��#ejRz��fa�2S3 H��XkM5��-��?���r}.�R�rD�s��=�uYtx�|��v*#wT?���2*�i��<�h�"+`��q���%	��= ʰ%�����v�wڐ/�n���r�{�z
0,q��v���� LF�ɏ��wj��KK,ϵ�aa/��YM��W�Q#����yZf�;%��e���! ���Jt% 
�=c+m��u۱ � dQlKW����	�]k�UF��}-��=f�s��I��x���H��9r�5#��s˫
�zfF���X�`��wҝ���8҈��� ��1�ʠjwI���-�\��
`P����}��I�[,��:�X�)F�o�R=���w�o���E&~��z���,ö	����?�6��
���%�(�� .eD7-�V��� *N�q/�� ���4��'�ﮯ=��B��pñ��	`}���I�{�[���B篷�
Z�s���@�������r�U-0��x��0-�
Z��Lv���z�ʰ�Ry���r,�YF�X��B��.`��bΏC��?=^��сצ��h�Q�ǩ'�nsy��W���W��c�Tk��7���;��tDe�����q��^ڠ"U $-�a�^F�j5R��U���}Ȥ�&�L��|�������ߕ����_�k 9�h'cm��3k�8u�o��:@���l<I)~���GK�y�(RBnUs#aG�q�>��_$����ܾ)%�%K0k}�󩻼��Rvⱼe�3�!�׈Ƽ[e��P��@����[ŋ���Y����-j�EW�=X/���^��#�7�M�Lo�U(�Sz_o���l��ߝ��A~��M�F���8��i���
����_�n��vllηC�]bWz8���ICV���lߔUt Yli쥊��v�q�pkE��Z��4D�BR�נ,=�(���;c����:��)ȑ���z�J��m���2��P9Zn?�����g���uhT���6��    m�"��N��Y�v�ں[Q'+���x40�2C?�J�\b��%�i�Z�E�eU���� �ve���xޑС�`��	��������j��bn0$ ����~B�%����=yG���5r��N�B	�X��� ���LW�O0�\�vN�ڐj��Y��pMo�R�b���l3�&�6n��v�`�[`Vo��ǹ�lc'�q�(��Q��*|����!��u�-J�A�7}�`�q[��(ۡ�����d�X΅n�Kʑ=��E�u�q�$�����JMW�y�����]��<ټB��ئ�c���~��h&�6[#*i8��uv6�Y�Ƿ6�n)<�-ᗨ[��Bz��?T�3�R��|���N@��m���qJ�
fK��?+��U+U. �*�{I[�x��
u
�Qp���{����K�Ƭ����o�tYc�.SV�~�R�֬-T܉�qp�el��A�]�P:N����|P�!����y^��nT�N}�Ϯ����ϸ5�ȖH����41�Z��
�_�a�x/�a�z�,��t1�.	KYj�|��`�ِ/��|kf՝����=|I��[f.����Sֱͦ��]*�P�{
�KmY�kx����FÕ��ô��n~J,kN�(��he�����:bۋo�춗Bb-?���'��xP՚�%�g�:J�!Hʫvȇ��p� j6�����'O���Ձ��k��ج�tw#���0�=+�S���s�^�	�f�a��O��X߲�}�w�!���K)��N���\�M}�Ug4�ڐ��&׎����qIeg{ AI_�޺�g6Tpi@yw���^����(������цJ�:^���78�3�W9�a�,wΝr'L)�Z�n�3���/��t�o5kw�tO�пi�8H=o��� ���[������=ZY�ۈ�ԣ�x�l���������������8�>vvv��ҥ�slX��R� �Aw��)g�y���{�`
����{*Lojv�8������h���y(^��c��R0BoQ8�v�<^������|R��P82�V���4�-��̟�@����~DMJ�o�3g��������/��5�8C�e���3{�Rˬ���3��	�9�ž�ͬ馂s�ߤ0��J��J��=k�[i��;5q8�e����9��Jg"Ժ&X�t�W�V�q��r�y
#�5!]�����ߦߖ'�nd�yλ�8+)ײ��R�EtN�".�"�DWh�]X/m����'�5
��08D�P��ܬ}����NmhsNn���ۣ3R�X)�����\U%�ǔ���!��ee�T0`4�Ӕ^a�x/Q7T (v&&�\ ��C}�Y4����m�B�o�ʓ�r}��S||�QA�"�����9�btu�k-a��XʼN����--���ݩjY�ߨ-��#�`<>�<1R��Sz"rVĂ��詵�қ{<�PH
��sZf�~&�ٖ�?��=�e �T[^�ԧ6D�|㠴X8�!��j>����%}��:����x'�*�I���3��®��o���-Ǿ5�e��:�D ���禨�he�ϤG~=�
x��=�"ߕ��A��²��i�����lC��m��`K�5J��]�s���KR��@�y� ����-vC}wly�����c�$�JԀHp��:1L�	g�4L�xͦ��Y��qg��sF'kg���1�f�x��Z �J�A�=��*�B<>��^i�x��X/�|�?����L�Lj��a����m΂t�mo�y
Aj�,P��E(����߻-`[m1�\\����b9�I�m	�
��9���Al3a�d_���]�'���݁.��{}n��4%V&S�Kϡ�3��Lꅫp4��85�[欋��T�5D�ޅ���t�������823��7�9����1�.i��]��
��5̡3�� �(��N�p���u�cg�74�X���ѳ����&<�U=�{�����ޢ�L�3G6�j�d�xtaer��?�b��� η�Iy��[ ��G�W��r���y��@��C�J�n��%k�{)St�S��:{��M2	Ko�P��B�~�c�d��R���QݢZ�*OF0��ɋݯ/�1=�.x��Ly�L��T=��w��6�,H�1�����������(Y�i��=��l(�!Z�,Y�=���ʅt���?� < �R<����
ʮ9�j�j���x7[^oa��X��ѷ"��]�t;XI��pgiN�<�q�$ٱ�w��N��ɛ�@��T5��������'y�J��s�g[��WY�?K8��Є�#��=���]�%�Ķ��8��푖K��g5<]��ƨ�=^���+�w�І l�TW���5
�z����}����:������5&B��:���C�T8(��X�v| U
X3��/�e�<�o3 ��6+��2��������^	~����68e`h�h�[A'�}5m�s��$�S�֛b��#].���<L��m!8��Zg1;�8W���8z:iY��]�����S�W3�ɯ<ۛ�Я#]/���4R���:;�g��*�ҢD��M��L�!�?%��!,�#�`u=~�p�:p��MwG�K���_h��Ʈu>\�Ħ�ࢷV���q��; �Y�}��q{.4�֠T_{Q��u���P���D��plk�Y��i�*q�!�~��)WF�6Zs
)>0��c!0�[��* ���:�����D���EC�x�[#5�x<v1�pՍU*�Kzf�Vw�e������Lە�S��ai��P	�iM��1�Y�.��-X ��Q�Ԡ�r�_1�]B�77�_H/�~�e[�4\f�G���q(6�g���O�ݘ2�TL��N8�v��w}뗂]5p���fi2%ߚ<a�ʆJx����qJ:/<�ۼ~���V#@�y��7��ob�|��h���<�qc��J��L��s��ϣq>�w5s�S�����=G�Yg~w�P�m 1�����*_�g��ɶW�Џ�t��H��x��Y�4|��W-����B�Bjg�G��K/`���[=�����F0 a�|�2<j�0���hv��>?u�̴���U��~	@�Xl���^8���R�C����t3�1�lhn�Z+'���~�ܠ���ta������f� -��63G�
���KY�Ǩ�[���[�Bt���.�iV��=ќ7�x�,S�R���ِ�f.D��F������:F&�Cf�C(����3��>��|7l(����53��V��2g�]ܮ�8ģ"}�a�8:hM�%���+������f�x�m�8�T��=g(�iLc��ݒ��b�u�����X�"NJ�v&�c��Ƨ����9xE�#���</�]Xl�X��\���3�>��g�s2;tg?3�4�Ǐ��=���i�|�FzNy��߈(�QU�<ۘ�tg��1��#E�����6��Z�*��X Op�q x/�X�=r��ȉ�Qg]�.��p�������Q�p�l�[�Fm��AcM�	!&��FN�n���q+�c��c�(���@�;g%���l�6x�_���.��J�	K�:��nY�)�W���Y���|s��P�^G=>+u�Y�~��v+���[���2� N�0 �k�uj��}�*x`�8���$��]H��g��)\��V1�ě}�t�C=�|ao�������0T����	z��
�R��1,k40ѷ�C6�W��7�:,���?�oL�{���(�r\��( ە�8��^�� g}�4/��J^����]&�����u�
jKU�\Ǖ�e1#�(m�!�R����uӑr��3-�_m�@KI���-�ZX��9�6�_�N��&:�#]ө��KX��3��iD�����r-^ڠ��z�+K���H	���pD|eK�s^u����{@<��[�N��AC� D��r���v�8    ���ɓ�3m��p�`�S�t"��q ���f*�1�-|"ېGϯ��r!Ϸ'��d�����e�w���=��
θ�jb��\��r�j�4��[ʕ	����V	v�7�iX��w�|����<�JL�w��f6�qW����=���&��l��-=��<�x����/��E��� q얘���j%�Kpx�d(��/�����_6d��#P��L�8F��t���J<"��J9X��ԧ6,�C
�;*p,��z��i%���C���2?_= ��� 4��U���>5�v`�c����Kᶎ[���`qV+��[�U��^����=p���ʜ�PD$�>�����B���[�����8lV�z�[�ݷ6ԫF��G�A��l(��s2����t|�K����g1�=ٗh5��[��Z��ӆ�����h.���_
��^Nқ��iMz0���3ݙ?b�T�vق���P3-מ<�;��Y�$��<�)�;���X���s��bL9�c�TxO�-�H<���$p,?�]?�����*{��[ٺOr��:V괍=ܽI���>��tu)�,x��&�T�z��Z���\�D?yÕ�����k��W������ĩ:�=�Ԕ�8ܧ��R�d�i}Z\�����o���hͼ֥&��������_3�c�"��L
��bM	�y�G(��ѽ���XR���&�.ش>��V=����nų���!c��@(;\)�g�����{��2��2�����"�M�w��X�D`kPo�؆[�dJ�j�<��6t������_����K>���G�lvWfb��N�Je� ��6 >�JE�Ii���^m�tO_˭��6�E�|����݇܈��B��7��S=�f���,]Lߕ�x+=+	�uJ�^���A�U�7{I����M q֫����b}-ި��x�����]_���׍�9�}������|�^T��.<9��~i�N`W)�ط�Yু�d�Z~����^g.�^�;�
�r���i���<ӋU�����5�x��dx��ܨU��=(a@�"����d�?6�� ��G��Bt]<�<�z*�U^%�K�o�+۠;�����������I�x�BF�/�K�չ1��"i���[3N��t�*�Ծ�]������
7�|fՇ���%�������R��
6�3����i�5\ٲ���@����.-<_Zu:�����q@Z�9� �ֆ�1����w�q��P�<��>�6����ᬎ�h��f↧q�����y{��~���p�g�j9�� S6�J��
�rW��>��hHqUV�PPn���w
KN֧����`Wd�3���x�IZl�a��]��=�r�sY)���,�N�W���X���b�)V�ؠ�JZ��ݴ�����w��e���>n���~�;mT��6}�0 \N�X�V���H�*l$znZl�j�^�pH6����|�O���1�`�1PY}�X +`�kU�XB;�[��ѽX�oc�T��69mr:=O7�q�Y�X�S:�1�箙�D,�P\+K�{��zk�B��<~w�V�/�E�6��.K��X �󽴵������>���H�vq��r/� $�|�K{�A�6v$��.vf��w��Q���.ػ�V\球Į]�StkP�~�c����d��У_���AH���F����U�b-> �9�nXWZ�`� 0��B�@�H�?���������Kmd�4(�X�E���6<;�5��WCV-�p	���(��j�l(W��y����9�������7�drԊh�%�u�����n�=!B���(8^(��v~:���B�Iϐ�:��i.�qߠPd��I[�|�$�R���{�$'���J}��z5���i��OB���>#o�~&�t��~"���}V��*�����t�*J9�x0�<�^+Tz�~k�\:���~2�)|+Lf*���J�+ɡ�1��p	�ݏ�X���	�	�s�|ީ4�3�c@�KF�\~�O���I	6��d�Ճ������'G�0s+�谡Lm�����La�=hyv�~/pf��ny���5���'5�~���2�B����D��배[c�O��K�_��z�
�G��G��/ȏ� FT/�7��qM`�#g%��������fĢk)��(,]
��<1�g�"3ص�64�Z��[���:�c���2����,��4_��fȲ���0bC<�l�g�5#��`K��ޏm�;��/'�pp�`��6Wꦔ�5�Q�{p)��>�Tb�ʢ�j�&&!���p�uF�F8.meO#C>�����Z�v���ڥ�OK[���^���y���
��(���8�pP�X
@��T����TH�q�U��,lɻ�åP��I��|�'�=c)��/�g��]|��{�r��� ǷR��?TU`5b����;��mR�藴�򬋮����:GϤ�"sB[��S^�f��Zq�)P	��5tyG�
%5B�\��Ro�Xz# �V@x��z4ء��}+�c�����""R�{�"�}*1Zo��+y��@I�z�;�]PTc���)iz�>Ҿ>t!��K��K;D�S��εV*���g���@�4*�@8���:=θ ��Jo)<,��'�I6;B(Ti	�qI�om`b	ߨ��C�z�,la^N3���/>>҈$#D�d�8��-���ЋwP�R���w��	>��0��3���*g�LV1ZH��Pw���p7f������F "�A�J%8ŗ<K;��� l���e7�.��mO�|jC���0M���P{�� ����ԑ_m��Zi�(��9��J��=,@h6��� �>}�����5�p	+��KV���o�!�E���w\8�{�o�^8@
U"j�t��M����¡~����j0s�i�;��ђ��6Tʵ�o�ٶ���b!����f�(Ρ�����: �8n9R	L/ܿ�!������_��u���Z�ꁧ��Y-V�YU�&.��*���.�)+���9����͖�8��,H����� &�p��Ttq��k�k� >tLgur<t��r��(��8�	t��u�4�B��,~�R�Dhwg\������6	·?�*+�:ˬq,���C��Q�)��M	�xq^��:(�d_�|q�Ch<�c��|�[�{	�v��8��/�p ����/��i7�?6�K�w��x�TJ���`�	�`w�L�ٮ8�ط�$'ѤD����?l%�V��M�I�:|�v�fױdQ�������
�q�I=?�a.sP�p�l���{�P��yW$P�� ��}��=e%��r�嵰���/�����s>�G�÷zZS�$��y�6%p�ſ|�}�+\����$� ����5�Ba�~.�ks���G����9��A�.��K�Z�!�5��x���2+!��q�y��M^	Ρ>N/�x�5��3�1.����P,�诩�a�>���Ju�1ez�S���?�~�S'��LoNZ.T太�X�_=\��,!Hkom�t	�?ׅ�M���i�ֿ2�9D����rt��{8�s�n���ʮ��8��ә�����u��l:Wx�G���I=��z�g:"Z$9W���.آ� �y/���O ��-l�r���\p�W�#G�RƋ�*��6�|2���X���$]�BM�H!a�ۇ�ì2Ӗ�t��#?�C`c$G�ʢ4�����ѯ%�4`���Pc�)��r�H�T n �ϊ���{�R�x	��H O�ƭ�1��8�a����C����[��CdbZo)���2�}"��6��3��T)[�!���1X�H�
�Q۹$�nS?|�.y�7�TA�d
������Ͻ-�5|������oe�#���k�y�Z��L�}"}`}&ow�N�&����?6�Uc�Ϸq�G]��	�רLo�X�4�f�4�̎�ټ˞�]�7{��)F�&>v��A�%�#M���y������鷲$�[Ĳ�>V�==j&.XN�˛{"�(D|�*o    8��Y~C�+K�8 ������Zf��A��1l� p�l�	�1i �g���.U6K��
^�ryqqM�Z���0Zp��+s>�7�om�Ĕ��*d�:Q`�<�����U^>P�??� 8�<P�,|
�����w�5�d�P���g��[ɦ�k@�)�͜旼�_��	��� [�>��``�5���u`� V3�Q禞�$�M���2q�Y*��ֆzI2y�KZ�G��-([9����<KEG�G�� ��%l��f����"cK�t�O�_j�Lϙވ�p��m��ǟ�Mmx�-�P�hz�6��BY�w�rPS�|:;�"�R�g�+�m˼P�>�-(�!�b[��,�ǐ��f���.�v}R�˨�6��zy�czq���E�f����臓P�a��%ཙ�N����>�=E$hg:���.v+[��C+������Y�_ME�؊펯��:3^ڎl�R�ܗʹ���h��&s�~Dcx ��oZ�@R9������
>ѹi�v�_��6nE�,5���\p�[f��-��7�'���.i�[_df��T���w�#Y�G���)pdޫ[�YN�r����Ւ5�͏��O��+����=[����,hǲCϕ��7&*m�g�r����ţe���=!��Sq�&޳iF,�_���u^�Y�4���;ޭ4� <�#���Z�Ԉ8yg�����8o �5u�k�#��>�G��G�U̾�XC^2�l�؍	t� u�<V���m���6AB�QL�s\l���q�5���w��R�7����+ܐ�C�dq4�_p�Ȇ�z��Y�"������ͿI�ِ���=�����x��o��Ɣ5��`: 5�=;�Ȇ�=�"νr�C�3Q,';�:l ��O5���!_V9���<�z�aqk�8+Φ˲'�WԐ©}�E���=�.(��m�:����_6����yw�(Ul<J�܅�ͭ	OR��!;�K�G�Q�t����aq���~������?m�p%Qy.�X�Ŝ퀝˺�����w�������؆�f�,����Vl��v���s}:������{��Q��R�;�:�Fj}Ē�n	�3ߚbj8�nWQ0�0����!x5�lЫV��5d!*��0�O�(L?@�Îk6)��LS��s���"�-��d�I�#��/�BU}Viɳ%�'@~��2�kO��V�3� �;v��(�x,
n8���_j�N^�iC���s���sLKwm�lg�N�-ʀ�w��ȆB"^|]<���r�Q��OvE�7j_6�E�d��B�+�^�C�)A�0y�A�1���8�	�㦔����`g��R�~z���z�U���<�?��*[#�Q�|g��]&��N���z��B��-��E�2 B{�i��1�󁩄��^J�؀" ��-@�H�'E4��ԆY+0>~�g^�.��� �xLjʾ��1N�g�g�Ȟ`5��|�/�RB�ز��qjCֺ���P�(�NU����Y8���9e?m`�e�Y{�,��oU{��P;�)n�'N�����>c�Q��%d�dT��R�c�;c�a�۽t�Y�7�}l��=*ި__�F��yM�%vGG�cޠ^�W"��T�ܛ�/H�jykޥ�����*�ͱ< �p�:�!���؜�J�����r+� "A	���������q�xȇǪ�W
�̦੧&x۠k��3$�ے���4S��U��ei^칍�5��q�[Q��@���̕����:�!VP��1(���?��[������!�b7�R������2�|�rWȳ��+����#�'���C7�+ _g)K�@� �&%�e�^R�?C��1��Q�1�h�S�A���z9��H��%�9���7���l�gU����/(��{WBh�̋���F�J��z]W���g64N��ad�������⺛����6؅��s�W4)Caw�C"��oD5K8���K�$R��ثa�䧳Hs0�� �_�����|�x��(�8Z*��&�)������y&`oG����u����+,(I?U��ǆtŚ�)8��G���pm �0|����5��4�ɯ�r1*k��L�~��4 =�۽>Ӝ��w��^*�·��>U啦�v+.�=<��Mِm���p��i
�-��ܺh�y�7�q_6ԋW	Ϸ@ӼMjyύS�:�H��K�C���bj�І��" tlD���4O����AB����ч�6K+R�m�u��ir��D���͛L`� w��j�6PN�&K�2 l�@p����	���r��?k �����y�u�1�@l|e��ۀ�� \�/���8eu ���w�'_6�U���}T8CJ�{��8�2�'&@N� �;��k8_̉k:�sxr���xj�m��!�kX�������gE�F~���co0�
�x�W)L��V-X.Ȯ�MG�C���HE� Ş��G�ů%��S/�#L	#��1�� ��ӄ�h1,���r�p�+�?N������8���G��44�0+�-[���ONU8R��6��}a�P��Y��?�y���4E�eC���!�ц�Ӓًٝ'N��Tg|@�-�s�lh۽F�Y�P�� W#�Uͷ��_����y="�s:�е[l�ɼ��T}t��g�V(�x����b";��~`!�)�������ۆt_��U��f;�l���d~Ii��x�9��U ��u�y�5��x&Ԫ�����ᴟ� 8��|�`�[Z�r�ѽ�Ⱦ�ni�w���˟ڀ���Pϱ�)�����������ˆ�L�*�Y-^�@���	�Á��sw��_Z�S"'����C�g3���gZN袕���n��8CD�/R]~T�/�t�=r��n��fݥllCs��@:!��܋����v�R>�)?m��[~�ꍣ���섋���
/E��,l@�{8Ց	�p�����	:��l4IR��^m%���%�����ǔ��`����pK���$��c$��i�S��# ��������-�O�"G}��y�I$N	�*uk'{6f�}7�6�E`���-ب�<��*��E���4��zUM�>+�����1�R~�*ʳ֤��|=�axG��|FQ� ��+�� >�dF��>����8<Oz��`��<��n�"��\�s"`P�\OMȆ_�F�$�$l �k������ڊ���|�K���ٕ;a��)�NpZ�(�Rb:�<<�R�F-�H��~�9�f2^�[x	f�9�ծ�	�5�{��a3!�k�@9 ���0)F��|���ְ�6�]����֏�6��ڇ��T�^�#��F�V2"6���ZSi�q�)��;�:��uF�w>{¢ �[���-�c�WۘQ�(�|��G?�V��xl�H�A`$�9�� �t�w(q��_�%�`��}<g� ����tgz��	.]ܘ8Al��d�3�װ��?�aC�[
�L]:y������9:L�+�,O�L&D���ꀾ9����"�wi����:��Ex7���N}�wG��W��i�K�X�P��Ca,�b�"ZZ��R�y�u��(��.��X�X�U>%�?mȗ���,�kd���k&�j���)�Z�8�AA�+�0[��D-fs�.�kUNP��
�h �+"�P�?q�I����m����vn9��8���x@��^�G��/���VeO<��W.2"�.�4R�Y3� ��}S����Y�n\�sW�����z����6���������t�j�n	���K�]� �3jQ�mII�5h�c�u�U�0)�gn��'Ҋ�(/���r9Re��*��y����peB,�(���`���g%|]���!~��垔C)o�W�s����F���
�q��O}�]�sl7U �O2��u�ď�$����i�����I���N����.O��pg=�|�����pI 1�ӻ`��ܿ_���~���\l�ak�]�+{����kfד��������X©�>� �B��"h\��zb��   ����}���V�[;�i<��7D�sת���Sz@�PUd ar��U���&�wP#R�q��{��C($�"WĻʉ:�it���zj��v�9��$V&L��v�;z�zf�j��m(� �z?�"�-r#&�1��r�W�Q'�UByj�_}�
���?�Fp��yە�`��P��o>ٻ_��Y'��Ê�B(\��B;��UX!=���*A]Ԇ
������LeG(ʼ(����}jF�����	Kn�ˤ­���T�@�<�Sb�pMN�a)����wd蕈�Z�W����*����݄m��Y��g�r��F����a�g&���ŕ6ia��m����4���-�����'�P�8Z��#��V�=]_MN;��k5ڍ;�:�oR*k�
8.�(�eE�$g�C��jdo [�Ж��>����=]Xr��=vK~ږ�a�p�4Ț	���tr���Jr6��-�͍����/C�Q�s9&ᨺ��C>�����D�v��ö��ais���dgs��2�;�	C�q{�I���0���]��.rGG�nO.���[o\*ٴ�e�� �ֆ���=�+��P�
�_�R�X���(��Ԇ�S��;b2ؐ=T岽�I�sM��R�dS�}���Tf�hׇ}�����NY�����$H8��%GAo�9��+���)��{iC4�K�sIr�_�S���u���c� ��Q�x��B��kxۡ�F�q #����D��8׏�ͣa��D6�D����ti$ebk�#<�|^��Z0[��:�mh§��r��߆�?��pO	�����c����U��fC���L+��>0Gճ��]�F��;�tؾ=%=�}�����s�s� �âw����)��Գ�_	�������Ju�:�ʄ����oο�ӵ˛+}p�����GX�*/�Px��8N��b��୍�H��:T�r�;���!��p������6�<ӆ��Z"����i��*>mk�x���TDUc�h��8���	��#�����#��H�}/cF� �0I[���3�vO��R����Ob���l�=���Z�*<�^��I��ދy�bt~�s�� F��3�jތ�uxԆ�C��XOτ��e�1\��c甚,~kC�T���o��B��!��9Elu���v��Ԇ6���[����(T�0K(E]�O�+/�d���o�y.�K'B�{�CN�$N���C�Ȇ� �wA.�~m�@�FD����]g�Z%���*R���ǆA���8[���M}F�ptKi�xjC��w��w;B��%���to,��o������&�װ�e�ei�[�(A����xj�S��gx��ϡ)�(lZ�����?6dŇ$Wr�S����
��ؠ9���!���%g�><�s��n�,�PL�۴�6�w���2��x���ʁ�Z}p�6��K�5~�G6d������xS��h_��GH{�8��������.��Yވu�>���1������ �߱j�H;q��̱V��uo��#�P�K�9;d���6�5"Ы� �,�c�wx��}�*�0�T.I�10�wy�J�V���
�Τ$�:��GT׌+�)Ĝ��G����8� cH��4�o����BjJ�����~l���,W�F�srD'oI�^wq�b��y���ZĹ�_I��Ϊ���jW+�|M�������p��қ`M.
W���H����_��D�r@�V1������x{�v�1Nǰ0,+��@�`���UA@�6R~�q�S�ߥ	��M#��F�����o���u�:����2b�֖ux��Ob6�N�2�ǘ�l��b�i����[]�#ׯ%T~l(�x������a��D#=#��me��Z�+�1�Z�wr�H�,q��v�ݪ��߯C0��e�q� @�ۏ�~T
4��~�h���=>ڎ個d���Cg:B�+֬e�oN�!�{�d�YlZ��/�H�t�0��B@y<��%�(L�sp��f�=D�6!��zmC�T��}�I��U�얞��[kaP33�<b�[�AY���������%ĚC�[�_���ؐ�/�|�5�=ܵ��:V A��!5�r�۷�XcF#x����z���ӁU:�N�	}{���P���p^�C�_^�(��,�h�)�Gy��8�e=��פ�g�[�s��Y�8��o�t<2��^�T �'G�P��:�S�0�(�*��*�f���������6���9DBۅ�ַFd$�u�W���Q��������(mx_ùCyd���WN�n��yhM�s;�#��Go!�T�}�oZ�ѽo���~P��r2�P���K�F�����^����� ��B�Oد�R�&��l޷]z={��N��/��U�f�Ϭ�gL�O�O��q?ZD���q��m��[��"����:�wE�#����2��C Mh1t"�ը䐴4,�x�}η�CbD�CA������jy���C�i��i�"�qR˸ \�¨ڍ�h�P���=v�ңf�Ok��Gg\&f�ج��]a��]'�[� ���ó��2�#�j�7�g�<5�Ĵ�N&\���</�xjZ�u�|����I~��_�'��ڠ5G���롃��/7vʏ���~�k=&�I[����b��Z��bw�q���p�w�d�a�\�є�\p-��gG��|-�G��R�� 7��A���#��-��U���+KI��&��h�lו?	���{i.��/y�BAo�܃����y�S)X+��%���K	�ף�	��ʊ�=[��6��Ec��s�\W䵗���R��?��8���UԾ����?��W���*qTB��c����=��J����{0% }��zW_;��:��~V6YH#־|��qԵ��j���ֶ���(�d5"w������
`��^��d�$l���C�\��!7�7�@�ٓ�7&�ȡ8G8D�6�f�U����?��-/�G��[�Vn)�Wu|���Q*s�H�!Z{�6�5�}��
S���+/�鵭��6�m+��Y^�F�q�Ow�(�Es&q�|eQ�m��:Eik[l�=��S,��#Ca�\�	!��^fOG�[P)܏7*�#�y��=�Ե��C򏉊���0�8X���	�#smLz6���u�t��_��<jT:
���Ǆ*�z奠�g����V��׊gp��~%n���Lo�������	~�T�vn��?�
W�`����X몸�&�ǚ
�����%�N��Q�A��~�Co�t-�Q��'�~���灩�]��JwE運[�&�Ц��2u����}�D�;�f����Q�����/3p��|�T�$���=b�
2���M�J�%z����Rv�,H���C��1w'�,��� ��+�ULD)�J�����D�Џ��7���\�?Zo�ؐ?��l
=&��"�-O�S���⃇��({?���hI��_��zf}�-�������=�� `g�BZn?5�S��S<�k��EUwo���, z+Ԯt�R^��H����$"Dg
� �P)�A5�\j�z_o���k��?I�_WS�'r�v��OP�ʨ=f����I�Mc=��G���y�9|<����?�����_4�      u      x�ĽM�$��4��:E�GhBH�!���6�=��_F�<3�r�,�˳B��_�ˬp#T	@��(!�w{��ts}��B���g�����������<����|�V��y��Ϻ��r]ww��Is�>Rɶ{�n��]Z;�&�\1-��Ђ������3��f��%���y4��M�,+���cr����+ʏh8�E��������_��_� ?B=b)I�Ip>���A�0��D�'��Z�e/q!{�J���.��|V��}|�����s�v��,Kq�����{��U?�5�%�y�����������v��˿��?W�~���a5����_����)?�Ecz���z���L�A�P��j��L����\��Unv����oەJ�-��\V�0�"q􏘒�����G+�,��ӊ:f�{}���ik�G
G�*���^_�O7��D~�1�Pmn԰=ά��p\+l��!��<gMn �lܮ؜����E����Z�Ͷs����l��\����\ǆ��J襷n�|�������?>���%�/�J�??��u�CLk~�z�8��;������J��Mi;���
�r����_���1���X]ùu~��/�h�i���`��x)��ڇ�QZn��v�~�|x�⟛+�F9b���!�/���}�N�����H5��}�ؚ�rq��a�}���d��eU�8���:��ط���ռ�!�b�Z�lWvk�k3F�Z�������k�Si�����x͠��g.ڏ	��S�<��,��S�MOG)>���Ғ$�VƬ�}�����9������7�uZ�E���S��!8�Z�o��*�÷�dp�nQ]�Ü��5�e�{��%va��ß%8�(�F,�����Ʀ�]�� �b Bk�1$�o7*��XRdP��h,�EaN �Pg�=) �oN6v&]�1��2�A�߳q�5�Zc\��qᇏG	j�cޭ�&	�'V���h)��Շ�odA��sL�s�P\�s�2"��h @pP��: �:��D<7��mg�����Z���#�CSē�� a�/?R:r?������b��Q�uml�����C2����*�˄qb��7�{���ه._b�p�uul�Zj�=@\�s�s��w��tL���?��h��O�0�Zir�M����[侉+U�]���Tּ��`>EAk\���B���-��5!��2�ȶ����o��OOF�^|�߰o�'���
N��
���=)����/�E��{|Ŧ	� R��En����?�|�-�}��y��1�.+�}�	N{8��	��#*Vf�H�Ts~�����K�^۲�j�������Z����P��t�SD �ɗ�U$���@A�}���S2� V��JQ��W���f�=�� ����(B�9��_���������H�#��]�g��
/�wl�/ߪ��`�o]��;��ߒ���w�z��C�j|�Ts�����7 ���A�XΎ��͖ː� �}X�n��pLV�h���=ܕ/8G�D�V�g�����ʧw�@;Ǒ�o\�`�"= &�#!��w7=µ����q�]�c2������?����ly��ݥ@öM����"�_��h�|�9�x�GH?�#�Tk��Xxn\ =�G͹�3�]�mE؂T���Fl܀�:Z�_���C4�u¥��qkI���\�e���s��W���ME�]��_���ۼL���ٸD�
�T�� �X��R��E�h����+z]�]taGޯ���鰪^W]�����ņp9�%3����3�d���c��ꂯ� ⇅��ė0�L�Wx�[�q!���x�㏔yo�x��G5�?��Ʈ��@K9�R�h�-35�Ņuݲɘ�eaqӁtd�I&((ɆsM�� "�p� �%~�;d���m�se8B����o��?��/f�`ӕ-�O��׎]<оC|���ۮW�!Y�=�l��zW�� �|��{�¤��F��
�!g��>��o�$dg���v����� �eG��N�\��B^]�(��W�����ś�0/'����<��Tl��՚���e�[fO�}]�Ņ��
�bh�1(y����82c�����3c)�/����x슠dΰI �����>|k-�l��K���U��;W?��~�dA�Z�Q4����}��1��qM��~/�	%�����I6��*�t�p�y�9/��
����}��Ɯ�FpZy�ȭ�p�x`{3����(p����j�*M]O\L�)!*<L�67��y����6^A����Λ��%
�D*E΋����!�$t�hHt%��t���t��4��\;"���<�x�m�]�ק���=�ň�'�.��߁�û���
�{6�Z�F���(�+"�3��.��]O?D8�3����(�S���[��Ͼ�ߺ���������ll{[�������K�@���|��KKH����yT�0��* zL֧�eYڭ� jC�/p�{�q��_�Ǧ�B��{�f��U�b�Ω�W�G�LSO�c��`6%
r��z�k�g2R��!-�XF}�p��-����el�p���)���R۩`�(��6���aMa��z��z�¢��Xދ��U�#9�?�
��ܖ��S�=@$BK��p8!�2��!�;�(-��:p�����2x�X	�;��G������_a�}>��zq��_aï��Υ�o�i3i�]c�l�
��u��x������x�����6o���c�S:����k�kIp7�#�ⵘ���s�!�t�C��z�����r?���t�$<��� ^7x�\,�6fr5�LD�;�vY�.0b^�^SQ�5���x��'^AhN�]����J��c����
8S�y�:�jX;"`�������a5��/���W�H���a0�r9���_8�@53Y��d'́�p7sz�~p��ë���A�"����,�(� �3=v�Ln�Vc�cb=��U����9V���zPK����vH�z�����qZ^� ��(�K��/��-K�I������?����zT_MO�"6}߃j�u�Ӿ@���Cmm�;�b�B���-U���U@gp�L8��?2�Ma���I}8 
��������,=�P����/�V
�ko�
�7�D,����匦]cu����^'Y�M�
|��%U�ގ7���S���ll�	ޥ $kz�[��� S���-BC�y�I}bu )�8ᯌ�̝F&ʷf���D<0H�v��9I�<�33�h���EA,uu8��4����Q��.p}2� �4�)QNP,�}��yy�B	���i�5|wg�|�5v`EL��L� j��Ҁ��;�h�3]�+����{zA���h x�G�z�*���Ά�Ls+Ӷ� ��a���6a�@b5X�����c o��R����n�����$���-y���t�UK���B~u �*� j
{z,�&����9nxl]�Kf��.�4�s���,A��L��
64���z�^�T�Y޸��L��%��X>3"�ׇ��yǰ�&�Ѻ ň�*	Q��m�	��Vx�Yys_��;�{߰קΪ�,��|зɟ[~�!>�A^�@ �&Ⴒ�/����Es4A��]H`������yH���\�q�?<�q凗#�a��G�0_l���čua�:;�%a6H>��/�4�6nz�A#�+�$�?!*�0�	���0��Xz�a�Z� ����L[���ݷm�-Ap�T^��8L
�y����V���A[���Caid���3ޥ��f�8�XP�=�m�֭Ċ4r�ǽR����V����ųb/X�����U����"�2��hB��xfl}�h��K���O�Z��8m`��#)n�~^Q���Tӻ���G��Y��[�- 1�V�G c�0�i��|�t���ƙ%�,��@�8�-�����Y�m,#�)ey�-��=�g=������^�n��tЕ���.�,ރ    -����Ń��wݡf��'�%qe�_��/�M��ޕe�K9��/��D$������ ���`��`��X�My��(~ڝ��Jp�Bg�iX��O 1	���>p,��� �8��A��gio��_l�bGM,���YV���P5k�_d��p��7��R+�o�'5����Ս�t	8�uN sE����b]���K	c�v%c�����(�k|��&�tØʴ��m����Z~y6Q|�a�h�zWJ}�>��0��l���'�7�6^�+�q֊���p��N�jXEUE�ݥ�X�_�zQ��!����ω��e~�
���kvϤ9�m�����. ��-�7�v=��a��O&�f�*8���A���_% ��"�؇cu����3�%Ű+�c#�owm�RZ�uR����uU�@���|�|T`���H��j�X��A0[Uv���]�Q�Ę��ƽ_�>��~�����,��A$M��1���>D����]g��'COa�}�{�Q�6ffo��ʃ����*��QI>��6ӟ���i9�6_~ç��� ����xU,�K����.�4[��#�!����i	�VS3z���fP��">��\�$)ze`ȉ�L-�}�i�ٯ<T睋6"~��t;�ij �Vy��#���dp���B�cE�}�K~�x�z��m�EW����&�W7��ꆳ�R�����$��]��f�8��.���7>6��z`�hgJq�س�I	@&}[H�RJ����瀒��<�e4�#:�Ya�,�<�e��Qz��=&�f�z� mvx<8���� ���˲=�?+�����a�B�`n�:f��N��jX�B������`_�c����u���5��K����A[�.R�z#50&�K��6ߩ�?f�Ƴ^+���� �#�Xx�^+��_ ��-��3�|6:�����z^RGx�XZ�,��:�+�1���#@ X���t��2d6�,LuX,�xsW�fE���\�)�k��W.#�خ���oi����
C%�l�B8
�l� ��~�z�QR�(�y/�@��zזk{<$,v�?�BP,@R��'~�\��& X�`�S��Þ}��5�۝��2�GY�gÇ����3�ѽ=�s�( ��V+����FD�����6�O�rZK����^����v�ǯ�H��1��a������KZ�>�u�	d�ou�|��Q:.�^�ݣ�p>W��H q,�g��,��;	�De,Ģ��٪�Sz�����h�?fh!��
�0�	�_��^K��������x&�S�T%�Ǜ�O?�l��o	w���쬒Tf��z��p����Ae[\�~��!T�k���9�B�[ O� ���1��7�>��*�&o���]Վ��ߨ���gTWVT��;썀��|�%��\�7D�)5]Wv`�A�r �������ʜ83�1�~���$����`��7z�����5�zfR�_1� �,��|�},��1S�U뼻��I;	�W<+����e� Q���6?����G�'m�~�s�ﶻ�[�;.��N����������ުY~��s�+;�E�K��1,G������C�ƕ����:l���e��8�<���c5��-DpO�z8kB�Hy#�i�Ɗ`���?���x��ˉ��b����v��$�*�,W��g-m���H�T]�	~=�W f�R�ѫ�=̉Z�f%zw��Y��L9�O�$�j:x]c/��P�@xƿ�gM�D�v
��m��թ��Ha�6)!�yeޒ�SV������^?��-ZP@�>���L�&p�m0��+~��#y�'�ˑ��G��º��=�/��"����)�*a|�v��J��~+�d��r�:J���6�k���
�y�Oc����4T�w _���a���,9��_�SN�U��3Ñ��jg�Kt�j(�2~M0Njc�\0$����0��Ǡ���k���(u/��ؾ�ar��E�@�w���<3h���0��5� �L��� ��3�����&������DG1��]M�����KT(��oQb!���E�׃&ï[y�;��VmTuΧ����l����kh��.�V8���������%�A�<�h� �OFS�:��,���O��m�G}7������^FXF7��#�F�-�� i~��W�����1l �]x�󠃩�}�����u�g+z5y���\���� a2�U/�^ζ3��r��mR&�.��[�ت�$*�:<I�y9��2"��ZĮ�K.[ֳ�~2�7�w}�?S��ȅE>t���K�pQc��hN�|�n�ۧ�mב�8���Z��	/l����Z�gcc�s����ȩܙ�����Y7@�?q/>��"^m�د ������đ��:��[ug�":���qv��\����V�y.��<j� �+շ'kxFA��b��h��!���J�id��9�@�6�Ϲ���������	��6%"N���*~��/���$1�?��w=���ݰ����ky6�v=�ݾ*���q:mʚw���ל���.���}�d 1��-읤�]UӲ��6)���t�\��|`3�4�bo��ު��m��d]^�����~9�c�d���f^�=�M���`x �0��Q��568����IUo,�N 뼺��N ���=?V]p 1��G��̄������j���ޯ��8�S$N՗?˿�z�^��3��u��p�A���x@	����]�e �D}g<\f�*n_EG�����-�d����=�@#^�1b����9�N��>��=�Gx�h��@J�\L��4XlH��j�U�'�j�uk���JagZ%;U�y&Vv�O	��+�e*���_5�>3������Cl�B�6�Ujܹ�
>p�F�*���,j�5���R֌���?��5�z6BHQ��̘�k��'�f��4jp] :������i���9̅>X�|��R�#Y�u�^�}H@�����b�.�S6~!���6m���e�<+T$~�� ���������qeRװĢ��8{蠚#��b�غ��	{��dZ?6����_�(���<#�R�@oi4�%|����� +�m�!���H�ϊ&JK��{�u��ğ=خ2��"�\�!.��[�L���8c��M!.��Z����H�䯭K'^0*���<6X������ wI#�m��.�`3ђ�)�8y��n�nP��3>O)ŵ&�M���\�*|�N�R��t����@*��vH��p۩��P��7�*��uD0�~ߺ��Jt�b��ݨ�*�i��r�ݺ��6��N���3�N�ć�H�y �.�)T�k�b<�����4cA-v�']��S�Q�򣶔�}�W���� ��(]�zǶ��Y���g���,������>��V5�^<����f����E0��!�,�i�e ����g���J-L�u�Q��:aWb���������us23��"�F\63���!�Up�Nɣ��C�Y�M<�.��� 7)�$ylj篭�pD����x��3��S֮\N�lB(�3�=OO_wހ]�O��7B�p!���7q�#�>���I �
�_u��ɩ
c�O�Zu�\�۶.�5)��y�k�R8��~��l4uq��C��k)ƭ�ļ���?��yH}�Ti�K�����j�9���|_
;²����?�i�E��AE pP��(��A�R���cl E���2��j��]�����`�8���8�Չ���G��*3*ۡ9H����+c��ƿQj��aW騅���M�D�YRN�w��#n�aL����7jR����ʦ��)��6X
it�7�G���h3�8G! ��AV:���?J'��S«�M�b��p�����=z���pW��slV�R~*!:9�tq�����&v�A��������ʰ�ap�/+}?]梅/gJ�/� �ӓf{� XgP��� � �w��C}��'"�?���0���Ҝ �fv�y9�����ձ�!ƷK�_�z9B	�|8@�9^p�`UP�>��: �]fgeK ؕE
t    ��y�[d7�?�`2�!S���_���Ȣ�7?�J�%�g0-���Н���7oWF��`���ƍ��:�eN#�ՙ���ܪ�Mk]ʌP��2�x��xB�h��f@!��^��_�\��{z0�y�v��L;�+��@�\�,	;�l���]�95)��^�=PX
d�-M����c`KW��aY���'3��خ�ɵX2�S`bF%�X�������o�YV���k��W`?
����[^���p�����B(�z֨p.g���A���g��~��W]25����g�6���`���W6sl"�W�O�]�<2���}&��}Kd��Q�	����gS��F;��Oߊ�#d�?i�ˤ�	;&���6[E���m3����(�g�;y���BQ���D,X�6]K��d�ԃ���xz�B8��?��U#k)��������Q�."q9�]�l����b����G�!y���ڝ6�c�]�
�S�P�3gL�y편aHK;ȿ^��[lJ�㗾Wi�;�C���o��Ewu*���t�Z�B1�9�YӸϝ�D� ��y�ګ,���_o�Kx�V���C��?��s���Rw��X8�Aٜ1=���"����Y��畣@+jd~x�q4��^G�1ǇQ�,R��ﺛ�u��b�5��Z[�V�ɽ�t���CD��\(T���p�'��8N���m#<�����R��&�)�����f�\Y@~Vq��Ο%��G�N��jpN����GV��JUW�ΘcN����Ybx���V���&lh�o�sNLn�����KT����4�����:�Ů�R�
N�%��}rt{��ĕ�96�3rx�8���`�^�h�p�^��������g��LY�+��Έ� ϳ�K N�����u�]��vQÖ�#��el�|�(΢�����J}1�A�7��J2���Ғ���j�2�T���V���q>�zނ��/�����$w��i a��Zn���ma5�����Z�w?�k)��	ǀ8����W�`c$������Tx=�#��3��A���򾐨�����Ř�`��ؙ���g��?��tĜ-\z=��.:��@LuA#j��R<+�l�ע@��lvy�k� q��W���r}	�F^R#/�B)B�B�k,��i����Ң��f��+6�����eU ���j����i�%��l����,�΂��w�����E�[�S����9����wf��[��]}e=��x�e�g�����k��7 }T�y޿����:�4���+Q5	,$||�r�	����IiC���$o d��g�m�|q�Rj@ɋ�^�w��|�L?������Мo��*��ഃן���|&��ם�#�F�,�@<�%l��2��*k���gK\��/W_�/řw=6^?jr��2��ǡ`0���P��d�lc݀������R��p��dH�]�%ԣL�b[& �=#���D";9���pW=�Ϟ��X@�9O�a����U9 �ir(E2*��1�l�C����Gr��:�ׁ��͛<�����6��4�����͔K�J:��q���	�9��N���ek7c*�k	����lP+��oY}<��U@=��x?7�,�y-�W��Ck�K� {���s�w�A/A%3�G�8����Y����[��u[�?)�|�5vq�����(a?<>�ڸ�z������B��K`|~�UZ�2�㫗C��%�[������g�5�^��'��W�+R���m��Ƀ�,�$�{"t��6�q���W�:��p_F���^�)���ŴG=�,؅{��e±gzN!�� �S���w88�/�<��j�� $�&�/�`\��6�Ģ�����ev?X�2��N�8��yrLgk�?�xV�����d#�eN���Th�)���ӂ3k���e�l����Y�<����%� ��������/}�oN͌S&���`����k@�z�}_�T���@_[p�F�l���k�}|�	��rZ��\{����5�m��s"��)�f���H� �.{N3٠�m�H�?���>��W�A�rJ��6Qڜ��I$����/p:�.�6�W��j,��D�{�n�ᡰ�����A- �|�9���IP�ɠ:c�!:i���zu �Nn�P��P��z�*M�=�z���/���W/)�0��o�VdY�� ��ᾈw��=;�sf����{�D��wNc��-_�(I�_�~�Z���H� S��*�g��]��.��ąJr��ν"D�C.]>���	������̀Tn����E������%ŉ#�{J�5*������ �&8m��ݮ��1���Fb��{���gl������!)�닝6�6�����gmQ:�T�K���{xB���)Ո�< �e$��Y���}HϮ>Rļ�p	v��Y��Lv^R�yB��{�?�m�ٛ77
����2������G�{�������l�^���������k��(�L��zu�7V��m9'�R�a�� �/�}�a�-pe
g��Z��P)+ء��*��бo�c���l�. ��\�!��Kr�Y 2ƉFy\%f��}�y�_�x�Z���|�X��8�m�v��[_}>����~jC@·	y�]����a1���h�U%ps*�m��Ŀ����x'K���� � :�iNJm������ֵ�o��z�Xɗ��;Go�#Uj=[B� N?�7�6��/�6�(��ثݘ��6���~ڨ��E=g�(ۿ���׉�yVvIWo������@���L��+MK�RxX�=d�z%[�Ú�V
�<��_���
�*������� ��U|~��� �+z�j�;>t�r}px��"��c��=��^��#z����+�	l��~�AТ��NAѣ�}��A���bc;��k�<�+q�;��=�r^�/G�h�W�ԙU��u�i����۶p���2Ӫ�y6
>��[`�{4������>�����t�?�uV�p��b_�p\�g��R��E�-?*��o��o�H��y�IA�Z
m=U���z�?�/!���zk��?�0���q�܎C	���������N�˔����r�hP�/���k��0��Po6~�;�sBl<�p�\����ʾ��ܽ�m�ƹ'������y�q�Y���z-�XO?,�Y,��g����k�VS ��|�= ��}�x~����7�Mr%!r𕏚���d��k����f�ɷ��&VF�˔c����<�bC��x�v�c�����Z��<�z�蒧_������8*@�%����$k[��zK2H0���G�Ρ(O�Л���2ʯ�G���z��3��E���m�s��X�<w��� DdB0=�&������!�?GR<Hr^��G�K�ו�y�C<��c�.k�W� ��N�}��+�	j�[�<+}�W��r#�_{�b�\=G�T �k��1k-� �[�L�]�/!s����A���֮���ll�P�=��c��PϘ�R��+]���+���ج�T�}������C�UpZ�\����8@g]�"V���qx���G�>�K�#SFQN��T_��0��2�*߯~�Gb"�&�I��*��z��{���Z�Y���~�]���XX$������JO�l�jp���lh�#��X۝��9b�5�.���s
���W;�\��^	tg������$V ߮^�(k��FdʛBvu!��T#.e�g-�5!"H�>��& uBɬZ1����zs��Jhs���#@�MX��̂aOV�]c>���z�`8�\�GT�,�y��GYR��=u����n1�� \X;�O���f�su�<Nr��F��TN�qE���xT7/7��7N�A��E�F��f�0'�a�`ԧ�b��f.��K���z^�u���-yX>�՝p���ٕ�̶b�����,�V~8��y{
�+6 ���Ϗ����DV����q��7��'��K��~U�����h��bt�%�����]t�	�֓#'��2⥖s��88��o�O�7�Lm�4����}�Sb4N�2���a?�t��v��/I����V    ��&�N!Fa�UO �U��HCGEؚ`�������ea��!އ'�v^�������ʥ���5{v�iNa�/�3�_k�	t���Y�I������@@�<���q-�.�6���;��1rT�g�n���l>�zo��f��㤬�z�nȁ�V��Ǻw?=�	.�#�ӧ��Be�َY��%Θ'�=E	֞'Ε��L�@�8��|� 2����td���w��h���D�Ja�Qh���sͫ�[˧�!�P*�:ݙ!N6��T�rܣ���N����:��E�!V�9'4EΣS�����ߚ��{�&�VN����4j�Q��'_���>�#����[=��	,�Y�l�eKB�;� �> �����D,9�59$!`ὲ�z��`zz�Z-�ʥ�#Tz6�iҐ�+{��9q]`����c���;o�79�`7V��Y�rfY��e+���xP�(�����.8H� �����^b*f�/�����݊Ҙ��6���h�X��$p���Ǆ-L�[Y�O��N�٩�-A�e�8���k��Қ�`�� ������i#6��������zi�p����z��u��9��
K�(���i5��n����6K�#B ��US�ʨ�4���|FK;�Ss��(��NJ��5cex�F���
��t��qp��Zx���|�R7��a�[�F�R
�k���J`3�#��{tu�� �.a�/
~���hí�+aTn}q��@�U�<��(�x�K��1��h�jY����VZ�*���}�P�#K\�2y�wo���o2�<yw�/�a.��#�z�Hص�65����w�(��G�u"C�r�	�G�~[������9����/Q�lRg�=+'�QЁC��O���� ��wL��6kԗ��hXY�TyR��\=U���x��
�z��ً� �Z��+Z�]7���QK+�p��9����"z�0�R�k?��Χxb�t�����Sؑ^ψP?�=|>���*�m)�짛x2�K�P̳��܇���,����!~����ӝ0��V�^|>;:K�����cQ��N��f�g�;��xL��s��*����@��i��+N-`|����ջ�0�[+�?�5 d���Dc�J��xX�]��� �#�F����4�b��y�:�P���Ia�}R��̍���:*y}����P'^g�}F���!;7|*����YN����S�,*Q�ae��|�f,��=d��6�\�D�-S��S.+F��ɩQ�k����%'���ɉH|�̈́ v̤��G⡞�� ���p]�c<eY�snuV��C�"v�v:f�S�OT�6�z�@��Ugݵ�����^��V�bhT����6��r ��x����?3޸Xt�3ykr���'��b�v{LA�s������,P�yS��ρO� �~K��QjW}Q�*1�Lz��#�F>X�C�*�N��f�k���h���}� uD��!������mSXv�/�`ٳ.8J��Ӹ�<m/��Ňkݰ�|x�x��?��,�K:����Np��`]p_�w����
[�^�0�/�#��@ur~R���z�H~���Z~� �D�V��p�sz�6Xw�x���;���pY��y�N�IՂs����uq�RQ�`l��+b�C��o���ý�oV�������:)�=� ����~.^��I�ך��
@����l���VN��@��)�G8lpb�9;z�xFoqt+�IY��ꍳ�=��mr��!�cf��gk٘�����X�j7�Ûd��x��-���g�p,B�8ϱP<�oj��s�f��G��]3Ez<����vET���]e�p�q~��G�AAE�s{izZf�� s|p���{��bv��*n~��)�*8��>�IJ_t=�]<�C]��J�m�@U�f�A(ظj
Q<�=*/�5��:�A������é�ϑd���ĩM6�!t�@P���d��PFjx�=���"nx�R� 
V<\�_gՉ8���)�>g�����{Qg;+�ܘ�a��֍7�]��[�Ul@�Z�Kap0��:j��sz��8��L*����C�����}�מ�Fk���k��]1����cl7r��f ��W/G���� ��16�e�EK��k���ۧO_i�l���̩rF@QN��T�^%�cm���+��.�!�jY��s�!G�~��^u$�s��wo1��A���i������
g";Y��W��H_�ف
/a��T��&ZdǾ������M4�C. L�dc�"�&�{�Y�ӫW��%]Z����=k��F�s�]��]x���w�\��c�mZ�������sИe���h뜯���SU�����D�/^�j��(���w
x�I+���lV�*.N�������@-uP��k�ŗ�1D��zr�@��@��1	y�nXǩ��(����${ë���ہ��r���z7�ry���, 續>{f9�w�X��v�5��I�)sD|�� �	𘏯�LŮe���F�v+QЭ�����o�=P���HMu��+��['�� ��곫7���^�~���Q��(=�Ey�osǹ������'��Y�Aajb�������R~��. ��t�b��=^�C��L�2^�/5�Z
�}�K#PƭF��S���c�A+�a�k$���F����Ϝ-suiv64C4��&�llNͮ(���HI��;� �����G�4�ˬw��2��������bn���Z���z������0��x��~����W��c�r;�'>�x`&�;뚇[�Z�KG�g��sk
@}� �)G@<ֱ�U�bKk��;=ʕ'��h�ۂ�N4r*K�F���'� y��*�ktcpax֒��+�����P�X�aE��K������H-���z��Z{M ���Y g������T��s֌_�ü������<�x1v��D��߹z;*[�/W?U)�]��gk�po��:L���(rC�s�3c���K ���-�Y0��W_����v/���q���Ȝ:��w(�A������	V`���p�0��7�J���c8��w�Hc��w8���{��Yt4�v�{��Z�����hLn�RP�f��W/��܈��غ�
d��i�x��ͮ,ZX^������L���am<(oT&	||�zp�µ��r	��T�e��}8�{���	v6���$֊L�B�3�>�|p��W_���^.~"�	�.�=k�L=8g��鿨o�ُ��9����	}� I9ђ<n���X��ˏ�
�����Ԣ���<J_��{�����G�al���Y�r���5pfx��_⁷r���89�V�R���t+�h��il�����<�b73�@	5�s#��� �z|��(9��b��E"fu�����YMx�3j��w���[ë/��J���85����c?��|��]�) ����+IV�����Xx�D��ɯf]#_�9�&����%� ?��z�y/�}�}��n�񺘀���v^7�mIe|����Y���y'V������{lO�����u�v�;��Rُ�X݌�-"�[;}��7��k��Q�>�[��-�>F.���6s��w�7�R�↧�*lX΅
,����w����6� ��Y��[��x�-��6���Kv��u[ �,弝 Ik�`�aX6�u����Vw]n.6�e���V��e.ι���Tp�c��bPn��#��&G����j�
ܼzh�6(}}���H���������q�zΨ0����׍B=�Lx>ϐ�ݚ�w�ʬ��n�̶�~�8V{�6�LM�V���ӫ�Gׂf��e9>[+;֩Y�V{�`���ݏ�����L����] ;�5Si�4�����3b����k���?�� ���;����L͆h����8�&�pph�n[�\���j�_�/NmlVW�8U��OS�3��m+�޿����6��m��70$xI���U�<��2����u]���x�eW7�.�g5�?)
�2����uvY�"�X.��Y��^:�<l��ⵚJ    �N�Μ�^)G�կ89�q����;`�Hg�O|�����o3[`6>���7S���//v��9����C�2�L8G�'��_��h�b�w�����:����9^q��sx�ʽ
�u�e�='1�Fk�R�G<{��}h#Q����#��IA��Y�I���F�s��zf>�rݯ�6�N8+��0�������ژ����Y[�`��pF�������3۹ǥ�����^��p�����ވu��=�v�.V_(h�ӣ��Rwa�Z]8���Bp�9��c~:�������u+%���]�g
�M�0�5@�~Q��X����2Y�BE$f��
�����u���W�E����)c�8o:�)�ٝI��0�(�͉�x�����J/8����5���㖟�A�k=7f��ဃN-����Yp�t�<k��f'�m^m�@�,�A����s�#"���ə#(���L������Yz�u١m�pwC��G�"����25�<�������1������K�3u:`�7����Z����B��1���M�S� ���;�n��&���
�n�ի���ə�Iԇk���k/z#����I��ƼK��o���ݱ��ĆX�J��/e�.)�淙�9X�xS�#�+��r� '}C]���%�g0f3gӺ��
`�������}>��BI/����Z �ޢ%��䒫�(?���D���2�(��x����ɘ�`_���a?|�S8������P�:���)��Oph
Dq��c�)�S`ꍣ�7�����}8�#bis�B�b�]�k�fk⸻UqF��p,b���/,_$v{@B=������Ӻ����7���d�(V���`)�v(�,$�(.��j����q��C���*2��9°�.������\F�x�d⯯���L�D5����J��Ԅ2�%�/��J�$*����n���(i�A��)��B�ҊG�����S��w�	�Jz*�����fy�_��^2�L�Y�]:Vמӱ���+�͂W˥�/ހh��~���񀀾����l�2b͇G�[�x� ��f�e<�z���r��^� 5�#�Po T�
�ex��0�i�2?͋�r�"j�mP#���k/G�J�Sx��KAF�������k��g.�U]^���U��ZM"��>��ɇĠ׭HQG��	6�SdDـ��F�Q������f&�5�cu�2��p��4n@��a��dD���O0�$x��|�Ӕ�X��f�t�_hr�Ŝ�����MI z �*�_�vv�N3�����2y��
f\�vR/ (|1�m�q��yNdX�a3�� �"m�����,�k�Ws��������^���{����g��Nie�ڤV��`���6.��z���F����L���Lbe������/��z�m��э�h� �������.��o�B=���(/���!<��8�#�w�� ��/@�Z*�5���2ӈ��InFc$���ҋVn�Q�58N��[�9����-�rm_�h�օS�8��b�ȶ����E�=���m	�%��M���qG���S4s��ks��T��p\�=�5�e@'Ɩ��3Уe�zK�����d"�h���K�h@� �<��l�<�(��Yd���8��R�>���q S�@�?�z|�ReP�릌V���z3>`=U�z��)�r_�;� _p�
��B�4�@�n��ӝh�S������4�F1b�}j�
q�@�9��ﯵ�hN>2�m,��:˚GX`��x3�=��幗Q�-x�9�� ���q�����Kv�����a�^�^�O�)�,���x&C��u�y�����(��d~Ua_]n���@�1�B�a�ɨ-T������y�#���Gk�C@h��Z�r�ғ�:^\�Z���E%8�Dq�)\��o�6����4���������T�X&��L&)�w�s\S�ˇ����[�y
��]�l;�6��է#�������G�D���@<���,X����ݫ5�"^�P F*�4D��,��pyr��z�&�>��m��t� \<y�U���=V���D��tkS�r��}��H���F���Pyׇ�x�� Ե�r��;����Jb#�U&���fe��˳����])�pi��j����B9b0�����<�^a�lA�Q �3�˜��>sv��
.'�9V*�fY5uk�����z���p}�?��Zeq�49�nxu���5��r����\�'�b�񖃇?/�m˧�W����������"��YA?e��I�k�>� �	�m��O����ʁr��I,	x��^7�gٽL�l��h <[Z��*ű`_L��mJ�(evf$���+��-o���Wo8��f���u���SQjlvQ��6B����p��P�>���$P��;���RX��^�G�9]_�yض̻�Abi��u�[U�6���E��j��>�ʩ��%+Sv8���7���Zn�s̳m��z�#P8�˱�ѫ_�ⴢ�H�)t,N�dq3ū�m2+A��W��X��-�(s��|V~��UrN�ށz�(�8��|�U���&W?�u��?�#p��WO!�
o:ù�`�p� z��,�����i�+���	�y��P_,<��z�˿���w˼m�>�	��J����41vU��{p�*�C��u8�g
+h^��j%P��)/���%�X�r2�H��.y�O�#"d�z���@�N͙���:���Rrb��Ý&R�o���Le' ��j����`a��a��B3��<�'��Ty� �liq��x�S;RN���{;�����\��6�vb8��S��������� �}�r���7J�885,�C��\{��k��E�V�l+֔��k7e@9L�R�%���/�.C�n{ʴ���
Ĕm�X��=�Vf��e��61���Ɯ`^����f���j�%��v0��W0$�pJ��5���؇������=;8�a5�$��#� �FNd�3Q��m�)4�?��(�]Hl�[.�����-í�o���9�J�]�3�-Xe�vW��!��ceG�%���	�MK�y�o�FW���<5,U_WO-_�MfU�VM�h�,����CY>W�a ~ח"�����k˵�Ƒ��^t@��$�Z�G��/a"�\5cL��=���F�Q�&3%2B"#��J���-::�¢!˜]��1e�Ƕ�&1�F�rb�Z��J{��~\�y���h;��K�PCz��	j���R*`�����2+�36K F=��c/0�|oB6�lvp������ �>���S���L�f��Qfy�Qk}.�W�Ns4T����>��-N�k$9�4�@�FC�� �+�'u��s^�xw�\�7�����B���[��ѫ|���^j�x�Kq*f�"`dJ��\g��|����<>L����<�]�)w��w=����������lNݑT��8}.��С|�Ξ	��Q��51.��_��>�����ߨd�5�S@�D���0w��L� #�u,z���?K�W>i�}��B#��mO���X�2��`}aX���b��Y�����k�A"G }��f��Ϟ����'���Lϴy�W�.D����D�X�l}<�D(+��t	q.��v)<SI��J�HoG�y���Z꽯p�\G��y�,���J��oo� <�5��+MI�6@��z,���u���.���k<��ա8X�cG'<e>��H��f�Օ�p���2��N3�}����|�����x*��v���*�[��u|���c�p��
��j�ҐF�������0�Z��Eu�5g�A)Nd��+e�ʉ_:]VGn8-��şPB�)���x շ�����u����Xh)6�Yy,�׊���W �\藿D�|�%���l,"y��R���:�0�����
[��d����[ִ9��i$�I�`��{�����=�o�z�N��> ���?�tl�3��z��L�d	�D�k==}���Ζ��S���D��Em�*~��8��EGj�=�3%I�[�����6ӓ    o�6�E��\hi� T*t�62E����3��$����;$í^؊>)5���w�;�h�ϗ)&�b�R��:Q�eP������/sdI��6z��L7L[�g�M5�Z5r������2�8��ϯ�]�x��g��2���򲨹��vN�Dj�DM�#4;',jb] ����8�рum����> >�g�=p�GO_����;�Zt0r��7��ޱ�Ӿ$���襤s@�Brޝ����\
�F/uZ|��dJrQ��6x�b�(��Z��&�i6+��K~Fzxq`8�rV�w&�v��U��T��~��$���zض��/e����ؾbǚ�ϧ��&n
Bĳ_vD�4rc���3����u�S{��ɲUx���A��Nف�F�5��~Iz�F[�A;�^��.�$X�r�����S,?�{�=3o�M�jQDs�Jj%������0R]�q�˺�4[�Rj<���e��)�֚��������>*��B�����Bo���ɽ��[&�3�7r�'�>~=���~;�$���[����lj͇�*�P&���4�g�Gs� 7�%T8 J{�C��@�{=x� �I��8u<;�^gO��\N�N����)�<�5j�Y<������#��Xk�}��i0�*{o~��n�)���2����&B��/�,�zY�(�]�+Q�P鹹fƷO�P�
���r6�n��$Xc�5��o0�}������O���ޛi��#�Z��\�kj�:�}��N�(�!�L�� 
���v�`O�c0��a9�h��UO�\��H�'�$Fl��ao,�	1�fB�X/tZ�@���EW���)�J��N(��da%�绱W6�EH��B�?�Py0c3v���^����ƙ^,��M�0�hV0�ٲ��J/d��.�R�l̩ԏ��i�%��~O��/���&��0�m-f	��8�W�P���	B��� V�QJ�:����� ��(�g������5Uڜ-0�T=Zi�U�w�>I�d�݁f��}]b�����2�����,�6�Hs^*h��?Vs�-�Qގ>�'�Z�~�[��\<Pj�Ǚ(vm�cF�n���T66�_ݑ�/�s/kXz=���&��@���H�+�(�ӄlu	--�Pʟ��eǉH!@�!�5���b�Zf~=�L	?�����l��dC����e犧��P`��L�4ƕ/�S�$��[��ud4m��������QO�|`QzT)Y�*���ihN�bM1"�;%����t<���c,;��z�}o~_�g�KS�Y��g�����V�\�<�R[��`(e�/w�l�Fv���W���7���x.F@b�G¼�)`�E?KK��|#UK�D6IP��!t����Cd�&�GO-�R���'f|d�1��{xgI����q1��d6�H)�����ȸ��eP�*��o_.���W<�'B�<נ�p��kʉ5��Ǘ�7���@y�2�\�㲛G��496��ףo����ށ��T63R��-~ص��ܹ)���W���l�e��b�o��i
��V�Fo�5l�S�U�6#3^\Tv�4�i����E���M2�69<�(�}�V�"_�>}�7����Ǧ_�-
P" ��k#{npdg��p�M��yj�c�v�Go�X�Vn���,��-�4��?, 0ބgs�,/��󷟣+�u����	�~̉��k2d�ף����{oĵ��i��X�b�fΗ�|]���S~ ��?W���m��5H�������SJJr�M1g���I�c9U|]v�s�3�+�b ܍#ǫ���HKdԴ�x}���qI�^��NAFE����<G�C��d��r4^2��h�����	���e�����d<f�wւ/��n<=(ك���ٖ�_�4z�����ݕ��{�U�꣞�^F;F�q:����|4j�����P�[{)���5��?��.)���X�3��"�j�㕕�|�c������Ȧ�1yw����P|h�Vwm�|Q�/{�F�ξ�v����3��LQ:X�?�,:���J�:7���H]���:G����|����h s���46���(��)ZJ{��� 4���m�M�C��Y���~Eo���m��#�� S'�7�#�l�_nӨe�=������J����s��k���x�+�S��������M�8�)ڛ�>��H��L�č]ٿ�<�D�I���f��^�X��/�ő2������W��������c��d�U��FI_��u����r�w�;g�%�&�ܝ6���k�Ĩ�>�[3ݕW�׏�B=����T�ݻ>�gO�ܶP,E���jp��K�m�����5���E�9N�u�H��:Q�	٥�2Z����U�$+/B�B�j��A��Rc���W��S$�=����(4-��n�9z�����/g�g�MW�N�����F�QvIzo��W���۲���������S-�˒>+[}�˷��z4j:]+txn����>�;�ZW���s� ?��DkaN��2k�K��İSѳ����f���y�g	 ��ژ�,T�8�k=~��WZ-�{��\�e�po�su�4j��>�%�s�מ�g��u�;r�a�ޕs��}�gv�s`��2raG>��r������Z*��������q:� �����=R{���W������~ǹ���)/�0;@��":m�Poo�HC�o���Ü{@���H{��-����#������@ y �ث��t��-n �E�ll�	$G�hg�1l�:�F��ףO�����۫��yE�d�H�g�K��6�/M~����� <ܚ(t��������~E�?�K�7akz��t�x�� z�`n#�����ףּߣ���?Cb��lqT�y���_ko�}�`_>(���U�:x6��/�X:.,��J�[{���Y�\�/��D����L��'�S<�����2%��3��zG�K뵞c勂#pn�l�(� ��&��A�� ��/W���H	t7��9uFء��G`�(�]����O�(�7e)q��"���9�<��H��\��{��aѧ�2��,��8�PT�]����.�����X��ѳvf��:�����=ns>й�_Y�$��n�L��U���/����S��jx����څ�Y���w��
�Y�J��]�X�(ϛ��<���+,� j[�+�4�C##ܛ���x�}���[_��-^�'�F��{G���:%5e�R��p�B���?���'s��C����Q.Q�8¡:_^�>}(2o9^�5��NgW��g+`+G��jԞW>R\^�׎�Jp��x�LT랔�~��g���е2�i������=Ǡش��]�~9���*�0�n���;h�܆�ގ�6_��*g�������豾��SWٟ
m�l���vƬ
���عQ&6�j� &K�g���=V���=\fT:|A��$�g�Pc����\���e�Ӑ׵�jX �7@�UГr��^��.�d3����+�t����O��Vb��~��Q���Gꊂ)C��3�����r�N�0��{��]|dlվUh�:���}�u6�=�S�Ѳ�Y۾���݀e������G�!� �$���j*U�i���?6��W��?���6^��U��o��_s�h��GGj��%$��������S�(�����%��~<W*�g#=��E�ڮ��?A��н9���Ǘ��LI�,k���/�KmSs��!v0p[l��y�~��������K�@v;��)(�$3��T%ڽ�Du��:[J c�l@�Ύ�G���OJ�p�N�0����-m��_ ]
�����N�/���K�[����1
�T
�M�O����������_
���M ���(�Lq��%��e�a����������u��t��`gjNÑ���\�>��߷֢|�l�Q(3P�����$uצ|�HN���a�&:@���;?���詠����&R(���]���Z#���Xu����*�@�������e\��a�!���Gi
��+���0���:FO��aK=`�L���u���o߇�����|   I�:V�@Qt�蘼�Q(��G�W��*�?(]�d�Z<`�ѓ����:n�9��p�a�>�ucw��"��}�PJ�^N+���99�#;�G\ݾ}�:62[��A&J%�S�Qz6�F|����˃�@GF$-B+�4�ÏDL��H��/�D~�]"�}-�S�9 ���ˢ����SB����d��T����=���#�c�>�q�s���^�'�-���Ób6����׃� ��w���5���3x��y�+�;V�F���5�5a�s�f��̶��N���ܰ��T�G_P�s�WN��Ǯ�C�9�qzM������l�4��VG��B�t��s�&����D@����a�r���х^�3X��(��/7��UN�s2O��Z����Z�R��oGo�ro�ߢ�x��y�f2
܃ E�D�O����8}� t���+�chX�����nkm��P2�6�ԁv��������� ��h�b�|��h[8j�{m��9�<�/��̗�_�b壐�KJ�5M"�5?8�垆 �� ����NF(#Os��B�|���	�ڱ-5�{�Z��w�|��[	ٸn ����"@q�튇�;�-��IXӭ�.���j�`�,	_�{�����s�r�,���<���'l�!�,H�,����E��n7
��Q��|	�%ڎ���ʣ��3�{Y![���I��I�ԖO���e��y,@�<Bj�;�Łv�,y��>���J}CR�o�� '�P(0�+{��A��4β̉�G~�.�j@e��5���ڀzx�s�ˍF�׮��^$?:ՓP��`�֙�.��b�}�%�G�K(D!�x�����׿}���1��gf����N�L��	�������b���B��Kj����Է��3���>�'����='�`J������&7�U�I_�K��2U���]����+��b1���-*U����e ��^"Ρi�\��대<��i���X�דh�=X,��Y?���������?:Nj���:���M�sy��Br,�@�>%'G �y3��`����}���=���`7l�F�#�a��-V�	[��k�×��3d��ϴy��9���=%����g�c�R�_���Y�ȓ�2�����Z���a%��ӏ2_�<:g\{��5�_�g�{����#�zi�EK�XmP�(��N��W���o��LT���H�����:�}T�{;��}�v{�3���xC�H ���*I!�/�z+�NG�L����a�8��ض���w
hڽP<!R��#�F�c����!�j����؁���QXi�{��}����Ƴ���׈}_���|)���23��`�+�`m��>_��N$K��}���#����fx�}^�x����5�wV�� o�02*�	2T�������ܰ��ixSyf5�r�+��S\����q���)�c=�N|f������ś�>�����c=�?�F�FC��N�K�D�孽'��+����ŽO�rF���y���ܿŭ�9���ek�>mh`{W~�}��r7p���~��/V�S�1g�y��o��W��:(����_1�A\j��<���*����d[n�Qu���c�g>4���S�@eu:���8�t0�K����n��%;[.9���&�8��ª����
�H a�	'����'��ֆ��|�V㐸����Y
�˗�9����u�_�c�]�O�A/���%�ާ�x~�n-4�I���?XkF-<:�������P��Ag.�>��"/Q�o	�������ZPvP�U�rO��/#��u&����}uƦB������O��f�<4mo`�S��`�;ȑ? ����j��-XVDi�u�V�����#��yH��#�E%�8f,Y�o������K.Q+I���6���������!u��p�.[�"j8jơ0�s� �hM�n�W����a)��9��ｹ�/��[)J���9PR��������cH���F#	H�Y�����F��ױ���r��s6����g;'*^��˗!7�������=ydtU���}������ �      y      x������ � �      F      x������ � �      f     x�Ŗ[�G��G�b�CM�n}�[�n �,!�����X�^��$�ߧ��B�b�I`�aМ���j����!Ơ dQ�cv�s*�9�O�{7������R��S.�w�CJ!i�����4JB��8!(�f��BVi�N�H�	���b�qn:�:@�oE�����0;�
m�.���*�)�4xpkķ
�g�W�\�0��T�0���w��-�����;�0��t!���M�p��^�M�*�i��jQ,P"�DOrZC��U�i��7H�~:�c�� %_A���x�upuJv9ȵ���H���>���u&�g��:M��@�H�e�M�EJJ���Yk�t����>�?�������D���M�%(%�J��y���N3�����C�< ��Rb:�|��.��JQ+�w�K�j���D!T��#�x�*�kxm�'���aP���d�Pr��<�K4+q�ȯKN6����/hF.)8_���N]��8�U��t1ņ�G��`��Xs�@Rg�蒊בم����v���|̧/�:����y�/����'u=� �Z��Z��l����4{�6
�x�|�}�Yn���I��l���S27w�>7�B\��Z)�]���h:��v�S�0��9?�u:������4?�y8�w�4�VY�SH�vF֍!Y�<����d����.QD���"B��Q���"��Í�v�b��v��������M4�'$���%A���`�H|	�%2��?I�]6��߼5b�      G      x��|kSǲ�����v�S����7����af��D8�)Ml48�������#.=����1�ɪ�ʵVeVyɕ
�0��cZY΂���DP"e����g���}v�^=�t��_�Zʭ�"Xq�2͵d���d�.]|բ�\j&8�����1���i������<�������t�Ef��L�fY�>0/�.�K���.V��"�lb����ZK?��|�/3H���Wھ�j�]0R�4�W��
3�=:Fy��Ydg+��j�S,��GYQ��J�Ļ�b٭?o���_loo���������v��\���q�$8�vꎚ9c��ޤ[H����;��Ʀ��j��bt�;}3�N����n�7�S?��5�^߼����=45�̴���	}��jx��&M/�U�R|f�������By�
�@TeX��1�Z-�$�������M����M��7q������N=��ow�tf��P3��j	�tɢ����r���2+!e[��.�n������>0i�w
�Jb��4���.f�k�v꺝y�#C~�9X�d�c��(��J���3o��z�����/���y�3�7a���YN����ZΔ	^�%?H G������JDh�Yi�R�����hǾ����ǾK�ٝ\^�G����im�^5��՚%�Ջ�SL��n]?��}��u8<V*�;u�τ����wcfNi	M~h�s��3빧i�Y�^�B�Iv���ӮfJ�`w�;3��;�wE�]i,�a��$����,�I���-3YH�q��n�������vR�'M��C9}���Z	^8��6�G�j
��O�Iǳv6(�Kw�x���U�X��ׁ�9��;�~a�p��n�+�g��,8�Ȓ���+��L� %^�������/$`�z���0��o,N��:��F���3��Zǘ@��V��Z6�;������?�������e�|OI�+)��q����;(tA��3�'�6&�*��d�C4��b+��)2t�G���r�?��oktڟ\���K� 1A)�V����YP��+-�X�VZ� �Xղ�B.>K���ޜ���?�K����n������ٿ����2;F��D��u~z��+�gNqq�]��bJ�c�4���"TV9M�bt{�o�AT�mn����TaIb�nLX��VS��He���̂�T�W�^??Z���I�l���/_6��?��W�:�/��z��)+���#JL#��#g���ܧc����4�%<��$頠˸��x�����w�/�۽_������	��'�ƛ��榖f�`���Lz8֪�Ch�H�����I�V�H����8�*73�Y�Ƭ�9V�o2�=��ڂ�x�]�u���������_�;Z�N�!b���in��1 LBD3�a`�����B�vo�V�h��pʏ5��~z��mHM: l�(��m;3R��p<�N�ƴ���A,��׃RH1bxW���z�������m��B�����D֝W;aD���?�f�KAO�����71�����hm���@�׷�S��b*v�=`>^<�WId�����߳T��
�%'Rw�w�]�����6�? ����G"_�[x���R=ێ�A�kb�$t���Bi���e�f�[���U�ן�ԛI}Ё�QY.v�G@��r|�^B��s���A~��YY��4A5�R��Ϻ�Z6��|ޖ��_{¨�|}�Bk�؇-O���i�P��5�~���Z��f�s-�Q��Q�Kx����c������Y��9^mn���0�F�~�'��/�$� <�����u����Zt���2�F9V,z�]�I�N~�zx�����H��k|�~b�4-P��,��0��(���j��8D�l!�в>H�\
��ʡ��ɺ{BV6D�&.hP���w[=zƅ�Y<�Ҳ1 $U��	����t���Xu��?�������{�o�?��M��6)�&�=p*�ow"�I{5O;��P��Gp�
b�)��N��%�׌Ⱦ��[���_^��]n���-SV������^������ q�a���$������w�[���%)�-1,fUS���Ă���"px����������������xn��TύrNH�ƒ"ݣ0`!�Fa-X�ǒB��ˊ�����{ˣ�oS��7�X�7D��O���@Y�+��q+�yb�ѥno��Fc�w~ܯ�ޜ 6'[TУ�Ru�D3���m����2Ko ]��_���ٮ�ǳ�9FJ�(��(�oD���QòB�rW)����-(ZJ������Q��s5jI2�� ��:�%�?8r	ab����5t���ZC�B�	��51G��5�
ď�,p[	I���2�׿yK�r��|��s�f��ZM�E�,���s��`�)�p�CT,��\G�(My�D¤m50R;s�Tvu`H(��z��()X)JREލ�ak0���|�F_�}������'x�I�����?��^!r{3&%�\�-�%A��EP��ͅ���O�yL���1�tĢF���I̼4a�W,Z�}��㏨�1g,�?�8z�l��qhQ3�Db���|�$2Jb)V�X`��K��∳}�ĸ�����������jK{-��<��J?�_�v���&����oj�(��-,1D��S2O�@�~�y�Q�S��x� t&�˙J{�����rh��ۯ����=�҉��pDe�v~&,��3y�k�ѕ̬H�� jq�pEH+�9���v�X�}���t ��o\����y�*��~����"e��d+�ԾY"�Zf"Xo��P�f�8�D=�̔ �	dĔn>ͤ�xxŲ��K_r?=y턙� ��5"����	�:��V�+�� ͂�ysA��w/��Q��[^,z|c�]��9S�t�'N��3+�Ys��8�:��v�=�;:�V�S��3����A��-�M�X$��G���5�����-Yq72�m	J��8��A����[���is�B�Tw����;��*���j�]Л$��P:�0S��wK���h��Z�~,c��Af�̉�k��;Y��A(o��_��4�j�wz�K�v���Æ����K��&� <�MPa��˒��L�X��ď�
���{����ۛ�+�o�����E*�{?���鶩���|��O.��X�6Qf�j�l� %un�j�[}N��6٣�.M�ZM2�C"�<W���D��%']1IQQ����7�����Z����/�Z*�ҽT���ލjR���Tnx�1M����di����`?%M���xa�n�oO��ol��q�Z��Kk �N=!�}^Z)[�<>� �5VO��2�,o��NE���VԀ��Mk�Pb1aP��g�3�5�1�C� ½)c���m�VÒ55��dH��k�-�SBX1Jq=o��f�/�H�9�)2^bnNB���]P>on�2��_��ȿڼ!G|jx���zJ�))0)��C��P��%E��$O&A���������O�[��տ����G��TI����R���j��J�-]����9!��ܪ��Yg��w�&�d ��У�C%��k*ڑ�,��XιV�9��{+�'��.����Ӫ���3n����U	�XK��D����B� ���<6A|~=�Yo���O���ڙS��2"Y	�a6"����e ƕ��6�Uw����D�܌"@]��(x�L��RSul*�Un�Z��l��ܧ�&�!� �FN�!���FCT6�u8D�,J�9Ŭy���׳����m_�ME)��7�Û�B>7��P0UHv%�Zx�Ȃ��l2�w��>��M~����b2�3�1V��Xc0Eb�!��� Ԥ�,'_��<�n���F�RCu�i���7\�Qc|L<_;�c��H�[��(�-�+j�������/:k���|�5��HJ�� �;��>���J�'��P����xs�X����8��
5y��LJn��W ��08���=�C^���be���%Iه��vP"~�r�r�B{�T��Y�A � �  ����7�߿��	{���
$9���_�����>�6��8�%2�,���@wUC����?����`��v�=X��ۭ��h*����!eP��t"��w�W��M�;8�_�rt�����M7$X���V� Q~�0L�
nũ<�ĒK(�;XQ��?Y/�iS#�13PZ?^�$�Сi&�@�)���*�:�}X���A9�;�o�apVo'�t�R�蚳��7ϜTd�n ��Y��b�첇Ak��w��_S�p��6�~�����H�#Z�m=~n� �Æ%50�������b1H)�ͅ�l2��Ζ�X��W�*JA$� ����{3���~�&��?��)J:�����N��� -�>ۢHP����M�m�3pu���PmP�{������;<>�jA�q���-�V>�P��I�|�0@�A�����9��훽U?_����8�ǋccS�7�!,x��(e9������0����~[�?���U0��t�s<A��:1ii��E�g�2Ǥ9̠��!��p>�@~��)�ۯ���P�����d�! ��z��#)>�B�2w�G+j������ˎ;~g�ڍT��&4�Յ,Q,r��A��l}��.������N�����XX#g1ƍW@���}-(��#�ʤ�	D��sH{���E>u!�jtĎ�Ծ�P�	ZCG�(_�e�����0v��5��xs�aZ��k<��誆ODi���8oh�P���]4'9�Au��/qs�f�[����c�ߔ�>�4/����Fb����'G�&gJ��H��i.���x�<�pwx��z��X�z�o�C�bTg�fBM`
�����
�IY�	�j��պ�����ߋ�}������-�ح�����`���<Ukx�U:.��J���D� ��)1�H�x���Щ��m׍��`M��s��HT�-Xu�PuC�&w�Ŝ-��-����lO0Ʃ��9d�g3�� ��"!k�� Ӧpyo��A��,r`�R�o����*2�,\>�i#�J����`�����D+@Ud�~��-[��,{�6-Tf<�I[ *A�ny�O���d�w�.��1���$��QcL�إc�V%�A0��4���(0dN�2�q-��������`^����=�J���E�j�\.���ߝ�\|�7�����d���MWU�kS0.VW<��}�@��"3�e2����Yw�o>o(����ڣq��1�������a�����X�O`��&<(	��2x0�Y�q\}��'=Hk��KY!R���x�⢕�B��{w�mA���+%3�x��F�����(�]E����뇁�����N�o�$N�p
+�S�m�pn.螎�7)@��Q�O������F���ͥ��j�i7��I��=�:��Za�K��5�]�Q����W� �OD�"�g��4��#e�֢j�l��ќ^��{ˎ�ooz���<~��N���@.�x�FQ٥&� 0JJ4��Ð%�RXa0�&�t}z�C�����o�[\K�!D18/EiY�j���u��Ω]n�{�g�s*��K��ɟ�c�g�a|�l�Մx͕�YAyW��Z� �\�����9��,�g 41���Z =�(I��(�f5��PI�w�{��.��o���T8�Ί���M�)�I�1lI��D����Rcw6_����ɶ8A;�cr�^QX[�w�����2,���P�;;اF9��$O��,~)gN[n�Q�D`*`��@}[�B��\�R+��������=t�#(�l��i%lϐ+8�@X�*Щ<����ti�:ޝ�Q�ܾ�[/·]\"���~��;_O�҈k?^d�O�������/Ѧ�lU>f������w��x ��5@������AXA�(�5������g������';�:�����iьb�rx8�}�D�h/!+4��|��v����g��p �4�q�i/����یGZ���Ar�ݝ�P��|��mjJi��@j`�xa���T�0�!�}�qo# ��n�VO_�$ ������T����u<(����jHGg%-|: ݨBRg�F��ܭ�gԀo��ʎO�
�tnQύO��\"V���sFZ�ZI�*�\t�
$mE$m���.MI��+�'��t�)[L�ӆ%�h�T��1E����sj�������‡�>�sUFA�H�Q�gW����}u�w��_?���J����ۯ��.�g�hG9}�\p:��
�#dN_�ĸi���)p�{S~?=Z>y�N7W�Z�|Ə �&m�!%հ��#�lEt��.z���w����>�!����W_{:�99�<�CE�n� u.eӜb��?����!�L��	
J�'�19i*�eE펙_�6 nv��vH���2�Cj8s��ٵ�]X^�N�e�gA���B��bt�hoT����c6q\^�����m�zzoN��� �[�7��U�b��R����yvfɫXl����l���&5��������p�U���8�L��ew�e�y.��=V���vDo��"gF��QiUr����w��oo�*��{�ӓ��x%���>+������Thh��σ�av�mD��^��-i�fR �Gc��<5*��.��O� �eVK�7 @���1����Q���i%lC���\5c�<�)R
�˧��WƢ�>;�]�zF�Nb�/�_���S�A�SZ���0#t��"��Z\LA�Ri�� iݻ�5��H�z}S��J`>SX�sS���+X�b0�w�3�o2���adh`�wX��ػ$՟Oޡ҂j�U"�
��We���E�3]�$�M)�:�c�t���u����}&4�{%�Ǩ��u�c�A�� �D'���[<�(����}��?��T��g�Z1)(��f:Ň%k�zVծT���*���������K2��o��z~�_���r���� O�?�1�/��z��D=�ε,
oP2t=[=�xV���\n�{wtp�����ni߻�9�L�
�.<�=��<t�Hl�̳�}�K<������T�!Lc%�b�;sW]7lɜ\o�~�����T�rx�K���|�~c+�*��Ufv"�F�zd� ��1_�d���2��k9;f���K[��N���O���M4���VM��UbB�\T�4I�h�m�e"�L����j���w�۝����t~���p��k%p@���N��p��� ��ΕB�A�JV#�.��:�8wE)�,��|�����s�駇�:&X����d�܍bEv�.�2,zI��ҹ��*���1�$ڽ������í͖�W�KGD�C���jK��,�2L��ē�;v|:�v�ݟ�IP��$?�?���O�Ѷl�l��x����"6��r�]�	�%�?�*�ݬ�)�@2%Q���\TM�r)�)"�o������9,}������V�pt���e��K���_g7׍n_xa�z�O�d����*�;�J��0"0/r���V�aӉzC�G������l8���v����?��@xA�      H   B
  x��ZI�^�]����&��;��;FFj���DljK`$����s�������d���;���8$v:Rs֔\�X��TK�iؾ���w���1~���]�����~������_߾?~�fm�sg�c����؊�J�x�ioBb�̉��Y�c�C���w���g��oI��w!��oI�4ߩ�M)y�!7ZG��k!�*���F�=n�<�/^~*��_Ư������
��`��UAv�`1��B�s�(|��7"�م1�Y4u57�����%m�~}�M;�ނ�L[w�>9���=s���P���(.z�θNWj�rN��ZdCگ���%�J����IO%�vA��%gu�:�Ԝ�	��q���}2Q�-m_o�ОE�x?&�w�ʙ���!�|9��4D�;*�;+�]�#8�=Ocx���/_�~�9��>�+h�5�A�]��}=��;�;y�K�s��;���0*�0W�ՙM��E�G�݇���_��z-����\��x?x!����<01Mȥh��Y(Q�m߽������~ٞ��kA+�+� *�+���za�����q7���wɤ:\@H���^\Ǆ�@3p����_��S��4KIQ��@�%N�����+�9�������ב9<u��E��:!������89��'��՛�/�|�y	�'g�u�Zy��,�����1��TJ�X1{q�F@���
"rI��p����$�״ޅ�s�ћ�o_��e&ƽ�b��@��ba�!$�N)���=�0dr�G~���r�.�G�Hxr@���1BCa@)�]Fa��ZgM�Po��P�_��۟T�o�?����%�C<�l(���ğ!�3_i�f���:(�$<Xv@��pr1�.:��ׯ^m��?����}�~�}����_G��v�Dv(����;�*�Sڒ4�)�jt���H� �_vs�:�³�fۛ�z%���!7؟��U:/�T�$�b��1�o���Y�� �S˥^���������㰗�=J2;Ԫ�f͒�����Ð���~K�	��x`�-5�%�8�6�iD��ۗ?�w?��"����ۡ�4ݳY8�2!�C�E7�Q��OG�\1���s0�)��6@� ���K{�	�t�b��pȧ|�����0ވ� ��x�8�e�PaXq��������'#���2��9�!8���_�	A���k�Jp5���f�迿���E�w�r�z>G�x�];��ę/oA���fq3��`��(4�u�������?þ��)�s�Zv���Sx��cJ���9�֒\\�ݨ�~Pi}tX�bl�/g�w���=�S��?��U�8M义y��5[1�\�+��Pc��q��=
�q:�l޽�t�ת(��t!:�.g3�` �K[w����֩A�Lm��`��K���K��c�Ju�2��噒���R���qK�;A7�'�Ic�pf�QN.V-�*;I�C��%o���K:Q��=<?����T<�h82zU�$��P��^���!������8��%Cǵf��ƑS|�-M�a����o�_����8�?2��;�kӗ�#Rr��fM��%�3�lu�)�#/'�<���(�D<�yP��]��q�n���nq^l�����Ԕs1p撀GǷ!�ǐ�����ƒ�E��~Da��%)�� ���a�Gz�A�S�ݼ�C"�a"^:�v����'�ۀ£j��h�SE30h��G�9�~ ����C��0��Օ~Z�6�qJ��R4A���2� �Y�A\NA8I�ǘ�S"y���֏[J`��@�f+[H׵:ud�����r
����_!q��Q4<�÷1|���qy�-�+��>��Q��!�Cm�Lv6�, ��0���YL�p��b�;M
�ʬXGαr j�|d��WrG���Ez�U�k��ŕ����V����l�Hٿ}����bg6�~�>��x�F�Ji�Eet�u�䵹ܥ�:�p�a_d�ζ!�w�Q�B�������'d���AgtcC�s';��b�8
����P0|V8�_�@wS��/S�A&A��)�7�BpMgR���F�h�+��"�8N��7m��7hi�
��׉�c�^�b�6�c�ǵ��h9>O�h��˽�6�i�.Yk�R\��<�@�Fj���h�-�Y��?G�>t��˾(i��Zs��_�C��<`�����h�ВQ�rz����ߛH�Ou��A#��jM0]Ч����~^�����ǵ��A����cƯ��p7�)0pkĥB;f��e�=����Q��3�ק�lL�%��fS]�s�8@�V�z]��f�c�o3��x~��Ӯ%\�!��Y^��	��BV.Xb���C���(��k���8�Qǯ#n�Tq�% kP�
M�Sk23���<8*�w&��s�-��QzC����=�gi,U^��\�d3�2�67ʇ���[x��C�y搯@�2���Ii��&PGۤ��oLG���g{��Y�벹ׯ��Q�+T�;af�����ʠ�6�mビ�.wz��x�3�\�PR�B,����g��J͵*�-T�m�K��Qd�,�/�I����~�onn�D��h      I   �   x���=KA@��_��"2If���`K���fv>@8T���s*������Z��*�[��`��!s5��2m��n������^�^}�PU�
��%��9H�&~"$ Z׀+��`F��8}���_�W�֠.����@tAZe������\���B��AD$JҲr�Dy�N?N���v� �@d��U�'<�-�.$oķ�iM���w�
ٰ�c)�D�N_�?�ގkG���}y��a�䒐���/n��Op=��      J   F  x��XMo7=o~���$����Q[�[#�z��Q�Je'���[;r蕂!�ռ%��6Om5h�X�P�S�1wK3�fq.�7�l�ˋ�����"9&��w����[���;|������7��?볔��cf���4���{-���R����@t�e3��~����D�7�1�߲�y����)�N�� @o�rM�,Z�]Y� �T��l�=�J>����D�s��W�=6���Rݚ�o�j	�S�s�?���׀�{�0�������b8�˳�H%eW��+i�*�>�^�Y���+�aҼD2�5p���rϣ����
�k�6<��4�Դ0��u����<�}����%g���dʮAX��+�i�����8-pގCx�Ẇ���ä�@�2���fHqr���b>�3�py�8�X;yǱ������K���.Ш���4�%7�{O
����u��S�*F�J	@��@�>+.�;H����?��+ ��8ds��,@U��R��*�����h~p#�ϼ��t P���f��v�ۇ'8�x{��D���j�Z\�b��IK�ܥ���[W��,4�H�o؎�퐙�*<9�E�K}�qus{z ��EZ^��`pG��)�����U��<5?!��ɏ�e�Q�j�-0�.JQj�G��PöHa��O�wc���� Jm��$On-�c�i��d��?,�n�i����\�0"�B8t�Ǒ&9���>����� H�W(w�U��l�����D@�����o>����%��4s�ũ��ӝ�Abo�����_c�����q��s�J3 BU�	h�%!ؕ�\{đ.q�Kr|iq،F:}�zr䄥�.���]�K{�?�	�1x��&��	�ԭ�*<Ŷ�=��tbI�%[�Ew�F�����kW��]�O���Cr��Ւ,��d.��R��ƚ	�2"M9�A�q�b�l�.�Q��*+r�B+-LZh��
b�q4����@O�{��L2�*$�� _�%��R"S��:�0D۴s�~8�������P�p�����u-�q�I5W�5QM�r�ooN��_+�#�b�����!=�;��Tv��k}wg7��+H�)Ş E�8
�LK�iN���������IO(� �1>k��; �.%���(SR�q��%��`��XRo�G��."� �$t������P�����ͱ�%���.��'��~
Q�j�,2,�����[����C^B��4���;qW�6�'��E�����o}^DC���KТ�|߹��#����*z�[���������|+�=�$8���������Y���W�����g��RT��      i      x������ � �      ;   �   x�}�1O�0�����;��;w�D��4[ۉ����O��"�n��ޗ��J �)��6Aƌ u�<s�b��|z;]�K��/��Ƣu���6���{q�="~n���==�����w����n*_'-0W��(H>z�*$���/�_�m�y��q���c��(-N)C�(BH$\U�zg�Ϗy�׈^(��X�����c�4�m*T}      >      x������ � �      <   �  x���ێ�:��������K�R�@ BN�c�TvU�v�~�y�y�1�3��G��$������"A�j(����Y#�gS,k�P�����g��]��kj����pn���kP���K|AD���DO�>�~��PR��cv��,�Q%�`3

�s?f��� X�m;�Ƹ��*Z/�!�/���e�1�<�);��3��O���ř�az���=�}t_�J�)�����7��p9�d�썧��<��ZU#4-"����Z�6�X�J��X �5��mw�x�2�z�i�}L�������gj���q!���ijkPS� ��4��Fs�I��ꢎ���5�0{����bAZ!;�CVe��q���M^�r-��Ľ�l���L=
E�K�_�x{;��8��v�Q�u[�Ý�F�m�7�c�ƃ�4OgqY��~�ϣ�V�Xz�JÜ� עv�T�
ІPN�dH�_���
�qw�>Ѻ�`wjv����S��A�������Q��r�>�u�q��OS������l��x���H�m��jn�U�7�|�Z��)�]�MS�[��hPv��uv[,'��m�m�)�E���,�W�|3H��E�qp��y� �#�f�XP��A�V�&�=կ�Sæ�P�^�
m�@�}�rO����mk�T�./�_�~H��@����~��a�~>?��������`�yff���&�����Wt�Xi��	��8�ܖ���-���s���<�!��zEW�p���hJ&������wTh@��@f��k爜��Z��=��W�|d�?HA�ƭ����P���+o�����;��G
�'�:��}Z奍xk�UU������9��D�ս�g}uI�t{����s��������\�3N��&��t�́K�iZ��ѐG���YdEڏ�5Žu�Yz�w2Ċd9sҲԈ��c"���?��\j͍p2k]��(�Nk����䡁>�M�J���z R�3!����r�^�����|ɧ�vF�:��|��	�yU'�EIeŴ�:y�y�U���vw������������i��,���4:A��L�Ӓ����-�!-�+�_�i�M>�,��.�6��c3��"gG#�љ��i����2Y�q>���pm�Y0��8Ix�Q�Z�@�Jִv+����c����B�~��JI�t��u5]�6@�ڸ�� ���[����_�;�      @      x������ � �      A      x������ � �      B   �   x����q 1Dѳ'\B��\|a���	a�]��dMc#��^�!�v.�����أЎ ��+�ܤK�$���$����5�.��.�"��$M;� w7��[_�Z�jy���ǫ��=1L�F��4f8��,�!G��9kG�:f��im���E�]���.�m��H��[�)�sf ����t5e�RU��&��>��T}sm      C      x������ � �      K      x������ � �      o   �  x�����G��OqsSCU����	��/8�	�������"�'�̞�����lg/��s�`G�rv��Tr��o�>ϯ|����?o���6Z	�b ]$� �z�E[;����3�Y���.ii0|vh����B��M ��#މ�h�)�/������?�o�.����H�ZڻC2r��<B�hW�N����ؘ�np>L��ڼ�#�>�E���(G�
�c��y�i�>��G�@��g�%S���i���h�!�Ž��2
�BoɠKel7�lO�a����k��A�@х���X/�ʥ���d<��p--�c��G����8�Ұ�_�r{�Wȋ/�|��/"���hc�]*��X!�F�+Vq��r?�r��=&0Sy���YpN�n_Yy�6/Ǌ�G�����1�N�� ���㘍*�~�`q�r�Ɣ ����]�-N���m�j��q�@c�h�b�\A�T �-h�Г��y�>l�dߕ��6�+eY���5o���q��=k��
<�q1��FD�Hw�������ݏ��à���WͲ\��vg��\dUX\"o|�iu�UkI>��	�Ɲ'������B�U1`�Eй.�CU�}#�ۘ����:~�>z��Z�J�>7��㮶:�w���X�W�.�f�^r5� ��M=Y'˦��Y
��ʚU��V�z�8�S�ԅ�����I5D�,�+ª�����gj{��L�饨��4��S�`�|��}�����q�5�      L   �  x���Ao�0��ɯ�;�53��sc�. ��^lǡ+�mYX�����±Y�Rr��_�yof*� ��฀�� N
'�� 4쾝�m�������//K�ˌ3�Y�9&W�fG4��b��7�&N�b
� ?V��D����FD7@���)�@]c\�$w����pqI��dm�TF�������0��:�y�7vϨJϞo?����sbA*ő�>�LrsK.I!�P�]�;����������aD��q������8;S2㖪�̱�ͥ��˅�9dI��a�O���>��������p�7w����6 ���3&��K���h����M����4`6�XR��gM��.��
�%CV>?֯?������uE��ʺ"�"_�B����Z.��r�E%sVJvf�T�$�0��n�j���r�hWq`ϔ,��ۅC��&d�1���Tg��c�,bu Պ1u�<������vq]"`�UiU^\����,�g���q�Ԝ{      }   �  x��Ymo#����+��E���/������_P�`�e�Sϖ\������pweI��j�5�%gH��Cg����Xl�L[����Xp\�P�(<*O<woc�9m������u���CW;>��Wӟ�$���kB�����oM�Fq�e��ݾ�ix�о):I
Ʋ�a:�̒L�Y3�D��ܽ��xG��{��]{^j�ᑶ�������5���s0�2�*V7[����ae�$�k���i{O�����w�is��3�2{8�m���p�g�%�YFΔp�i�Iq�,�8s����G�=��~�ݜzR�uϑ<>i_��W�3�hG�'8��(��J��t`R�"�嶔pt�����(��n��O>�x��y�~�7��j_�3!8U5�o�k�D�g���:���M�z����c�Bݕ�3k�>�nb�2�Yk=�BW����EXgJ�d����K?<�iL��}�Ϩ��GS��/;��v���e�dL�{_�����}Y�yGq�1�/�ؤ'�llB�+��qg9psc��1�X
��d���,��XP>iW�,v�vq����(L(��h9s�+�"Ռ��#�Xʆ3��do�����P?<��d��M�����jn��EP6�2m`��f^F����C���|Ł}���L�QB�Y����J���TQm2�C��*��D.�t7��:"8�So��!!��jn��䬃e��t����Twr�3O���S�[}������k���c7u^;�aJ�870��e��,�f��a�)�3!����༘r�����/����`��8h�&�K��@����Bd�.��f��� �C����8��s���B��`f��$��#�V����'���M���m>4�՟tGի�&���;�v1�rn�$�/	�
U 5,�cLb09e]N7x��;�MЎC�l,�6��@
��'y�m��aKM�0�W����9!h�/�&�\z��4�K���!�x�����k.���~��ƑW�m{�����|��9���p�.[��,��RUG&y0�qC��	�(tbA�!�r�`���2�6��}-�Ea�P�N����.g����߉��K�2J��a2y���bF��&r6�h��\<� �
9�PT�㬼Æ�ZI����+�%����<Ԙ���xe�?�	օd���H�,X$PH$w�Sh�������\2�� k��!��rp?�^&�\����+�e���#�LB��g�'��|.����e9fR�X�"�8��{�#3�d��_�}X? ��-t/�qpBx9E�b��L+��F�W��i=B`�H^kԎ�r꾏��Nڞ��7)'X�1^�A��i���]+�Q��(3����䢩j�AQh6����N�S�e`��Qs��Ц���8A@SKE"<z��.dGv�v����x)��Н�}�Ȗ۱���Jis*�%��t�5�O��Ry������qd�'�?L��Ǘ�|�%���jT#J�B�U�9��Z�p^����7�g݋�x6��k��8�,�@�RXmKy;F:��JL]�)ub�_���f}���������+&����8�rp.T��pa#s
e�n�7xh��&����mP,���u�?�_��dv���᯽VVs�V�){��Dt���Rr��s�e2�a���N��P�6c�K4����w��صkA�=U(:�q���x1݊���e�s��Jx��5��.��jo��O��[~��^���4
G��Բ8o�����u�E�-*���͹j�����a��W���z��_�k��I���8����!Ԓk���q��?k&3ף46��� ���S����kՀF�d�U�q���j�A���>�O�!�8��>���ٗ��ĵ����>ϴ]O��zs�ߎ���%~-����	H�-~��͛7��5      ~      x���Y�,7΄�˫��*�5y�
�E�
z����@Hؐq=��S�
�F�R�:Y��n���3]�ӻ�G+��}�||�}�֝f�N�l׊���!��X���ѽ�>����'t7��=⎣�T>�y�c�u�@⿼�*�__�5�������:����2r�Kى�i����ť<c��{��Y:�n)��5�Cc�xogn?v/�>��)�G5���T�sbx9��<�T5�1�N�#�ϖ�PhgWk>�5�a�zz�������=�1VWK�!/�z�NB������_g��E)˩���ލ�L�c�pCn�Cx� ���'ݖ>�Y�N]��=��Ѳ�����p��E�*KB�y�vC�Ջ<a�Ës<�G�\�XI��'N͟���Cn�bi�:���m����e��p�s,u�d����ќnɮ�P�	Jr��|�]�UL�圫S�/��.�%��w��!�iO��üwG�&uW7&�;N��4�{�OO然Y�R��R��>�R��z�휖ol�<�C^^�<�x�wB����Ǥ9��ɳ���r$	I34�^�L�u�X��R�����d�ES��?9��}o������*�ޮm��X��]n^]��Q�c(�>򒏹�PՕZ���,3���2����\�g��Ş-i��zu��.)kkr?�xG͏��u:O�x�l%`6��Oq����jmy�W�u�Ȍ6�I���\m]���R �u�>Zv!�m&h����Bi�X֜�%��Z��B�����1�'���7H��S푦����笪�w��gh�%b�6�����u��HL�9��I5�l��/ʛ��Mg�*=�u5@�N�`Љ�7�N�$�D����%�<׸v�RS��<�\�"�D���OJ�5#��UMdΘ�d�ҤT�_�P�U�gݚ6�X�HDȘ}9_�.k�!c|6���0a���n,�B)�4���9ݲ���g�Z��bP�`X�������Q~j`��t�����I&��?^j��!~E�?~̇}��#�u���['��
9\�g��u�,P��6~�w9�+j�hbD�m��X��	�@�K�D���tE�S�frz��i�,)DY��WY�L�[���4�/�!���c:4d�9��EiO(!�GN��ȧ�Y���u=˻.yo�t#u�c�my��P��Ǘ�D ����0�R��� ~|&�;��.D	��㹇	C�[��C�F��c,�]�`&�c�c�gYR�Ԯ�~VbD֩��1�_(E[,|]c��H�^l��0��Ĺݢ*0��܁T����X������E�|��o���<�즷cI����K�˳�6L.m5d)���|����?�O��š<�ߍ���V�;33Joaގ%�ƌ	z�@��4�A2"	^���F@&z��X�г_�S�Ҡ��h*�mި)l��s\ǐ���-�z	���q[�\f']�N��?B���1�ż'^N{���Z�4�n���]��K�CᏱ��:�n��,Bڑ!�ȟ����}D
����;�o� /U�$];ߖ|����g�����-Z,���&�4%!a���9x�9�Xe�N�R;]���T� .cH_�!�ǜִ�F8&v�e��m��X���يce���6fɌBf���԰D|C��~�q��-V(�%P�s��1Ύ�H���?�3d�D��x���2��Ӷ�1��cz�ij�3��d���ѕ�5�-2y��&E/���t!j{-�&eF������M��Xc�`":4ȏ"-Ȉl�Z���V�|���~fKl=�"��J�X���ׇ�-�?ׇ�\���<a�F�UK�Yڳ��Z	:�4���d�����~΀ �m�ҷEb�>hC�Jok�l�����g�$���4$	�m���¯%=RS$JK�����m�B��7���Q�
�T�-��*ygI�8������~����T�F�����m͗����%��!���s�Gv��%��籆�V?��=
���=�EN��K����|�_���6_��A��N>d�p̱��%2`}(�5�-��E⯵-��(T�s{{))q-=�R���MP�4UA�����hȜ����-z�L$�t�ĭXs25:��@ʭ���1$�S�#�V$�4>I�%�(�.Ԇ�Mi��޵�nch�6�[���^:t0��K�:ր(9�*��@w1������yZRjn�ö��t}-��Sd!�헿k��j���i"ڶ$'u�y�.��
��w���A�B�[�H'W�[�����Z��e =7���@�1 5b|���˂𽵲�Q��N�H��X�����������oHj��Mg�����ߵ�nch�������&�:k|�r'X�'��}y���!|%Ey�_
YPK�X���h���TW�݄޵�nc���X�|��;��@,�0����2|,3�<޵�ncH�2}�K3��[�#o����uR��Q�l���wm��2ν=��*ċ� u�l2��f3n?G<P+�]�6���>�	��36�:�C4��	���,�8�D޵��b�_��#��
avl�!I�YT����"�5z���AY��ӈ�Q����F��A��tD�{�����t�6���n׉r�n�����Isg���^Y����tC�! �*c�Y;�[E�U�a�v�@��@�!�9��
��-?�9 F��a�s7�����݆P�y���
B	:]怲q����?�Ğ�@w1��#����m��v�,C/����Ba�,��4�nC𔏡T���c6ìE�S���cCX#�k�Ơ�)b��Ky#g����ax�)�nf9ʊQyx���!����9��d����jSl&.Q�Ibߊ�H�����#����jC�W�@��6��?f{�������q�>JE�Vo�m�/�*[�����w�_ax�'���T,0~�p�Ly�[���ڀf�z�bqQ���A�����_�|��ɴ����V��v#�Bq�B��7�vw�Wė�d
��!�DV���X�7�ne��I�w]���_m���G�U�2ña�q�bJ#Bxe�wM��45���ls�m�Q����\�'��hkWI���=��(,���(��SD�맶AL�l�S�T�&�z`�1�ɼ�u��u���3�~��چs�0s�d���m���������r0�t i\��yˑ�y���Ő�X��|��^!�"��^�A�fuE�98�6��?��!����H�L���T>SQIK�����������Tc;mN;�0M�`�)=pt��*'��� �zT{��C�vtq1]j���h���}X�A;��Ɛ }�[8�۝�� y)�A�m��!�]��6���j��1�ݶ����8�"x�BT��z8��w�������D<sf�ŎF��@�nsO�`ӌ*���w������|#m�K���"����N�&@*�O�k݆�<g���ń+�v�N���Q�0I���8}]�G�!@��YS�Mx��p�@��W�C�5�"ٿ��Ɛó��6:e�S+��B=�+���S^����ma,�����dӟ���o;kqb�9�>����ƀ^�Ͻ#��YG'��֎8v���&WU�j�Ȼ��]h%�|&�3�);�k�o��=��/9�;Ù�wtC�Ԟ�m�Dǝѝ���I���gO��KX����Ơ8�gV�EX��Iv՗�Ug���Ђ9����`�>�Έ��`_f�9�HT�5PEv�����;���ƪ��I��v7n�K­�0����Ԋ�sz�;���|��R�y	�߭k1���4I׾O�ͅλ��mRsy>/bڇJ̫�j���VgQ��}�]��6��~>k�ͬ���i=U���\�kf�ƚ�G�1�T��:���vz1�7�P��}��ra1ɇ�5Zz�=����Q��Fa�B᥏�(i�T�?������'�w����{y��'����9�I(�R����c�_���b�_���M߈EK� ��eǅ
ֶ��Ǜ���u�nCX��.��cbw�F�c['E|��iMP R�>�wݣ��g}�6ٛ�YJGۦ4Zj��$_����{tC�><S��{�=��s�)! �  �?�m"���#��y�<���$��s7U�*��;)����J��-�\s���yrC%?���5Q�w���\"]��*J=�
|�uO�bh_���YVcK^\l#����&7A�P�O~�=��w!}�o6"�vݰ��b�2oD5d�H+�]��6*�<���aϦ`H�gۈ7��4j�g���uOnc�Ϸ�sohZj������h�8��3g�G�'�1�V��me+?� ���;ja���,b��#��uOnchE�����{Z2�!�i' �[���"�W��႟�X����/���3�.�ļ�9�o�Q����`�F�f�^M�����C���	(��ߎ���̑�l���_ٷ.E�eֈ���.��(�c�W��z���>��L�HL:وq�e���Ui�M}gliKk�;_s;�X� _c���3����_~���K�G      �   "  x��T�n�0=;_����8�p0l�����z�%:"K�,��~tS�2�0�(&EQ�ރ��O�9�әd<O+E�3�$SLy�QN���1��!�UY�.� �%48�[�%p����e�8n�t5��y�D�욪N��4���k�5�Ǳ�&x�W`ބk��\kX+��,V:�J�9}N j����8b��Ty��V�ӧ���%{#�Ƕ�+�*��5h�
<�؎�G��7aEY)�S�)��]�
��e��LÈ&Ʉ�$ci'�:�]'�U��,Ͽ�n���W��P�3D62�`��l>�\�4�`o�>�j���y+����������.���;~i�0��S���K�qB��� �*O5�`�x�̥~���zz��F�9�P7�J��O�9;k��n��Q�4�o��
^(�zh������'����=T�L�`����ڻ.����K��R�ok��
��D�8>�WPi��e>B�s�R,x�d́q>��*�3�.'���O.d�Z�?E��#�OS�;��A�u�+N����F����      M     x��W��G�g���<�ݛ	R`>`���	(�������dXo�l��"�,��*U�)���1C�U����Jh9o?~��?���4��Eeh�+pC��#O���#��U=���w�����O������	��rEݳ�.��
�P}��$j`Zу|�������e'��E��X��{Ϧ)�
	A��gB`�^f
	V߈�=�y�8T`~B
�W�����/�O �H^����8�h|raƞy5��*�R�2AN���ķ�3�;�w�-�&z0o�h(y(o�5�k:��lH��S4+vh<R�u�����ǧ��vͻ)�K�+�.*E�޿�2l��&�b���`a������k�ՕE�M��A<"�N��6��)J�v-3�x̩Δ}�:��l�i���H/"��^Ԏ2^&�>z��v=\�Z�V[�j�B���y��1&��h�'��Ш��S�J7o�VV)�顙�2����.�=I��yH\���{�����)��S�)i��&IA���CpjPRgp3�\���B�����%��#�Y�m2��K��8bBd���1���Ug��R�
��j�3�-��n��l�o9���%�7WжR����13��m�2O@߾��?�#�R��Hy�"X8��K��F�b���ո;z�PL#b)4����<�V�(홐Ӌ��݄���ǖҊi���G��:p�i->�V�z�9Wo;�m,1�f���^2M�H��LVְ�B�$��7[� ��,x�c2K�{�5��ýe�0��Rj+��ԋ.�#�� u:�P,�=p��)�3�ᢔ"dx+���͞)�)�=^v�٦��+�9�
�oџ�c�jHYYr����l���L�|U��Bxe/�}<�s�q���|�x���>j.�qn������e /l��~:�2��t���UI	����AkT낞���S�t��u%�Lw��W*;�`��P��a�Y��j;�Og.;���{��ƅn�>��HP8.�N���Q���{������*�.��}	��_.��$��(      j      x������ � �      N      x������ � �      O      x������ � �      P      x������ � �      Q      x������ � �      p   =  x���In$GE�U���Dpu��cZ^��aV�j[�6���D����A��s �uH�6��$��yr��ȿ�����g���d |U�,�4�k޾�~;c��a�m�&�f�f�e�6ި�@���[k����[k�O�����>�e�R^%)>`�4@9����\6B�\����AW�Fur*ۦ/`�Ս�=La��4��)�8
���87�IM�W�I��+�=v�m�Cʩ�3{����1�]h�8���u��Y]����&��R����WLw��
2vOKcP�:1r�]��t�����5=Yf�9M!Ω�[Bv0��zŔ�\Ve!�0&�3�6�տ�t�[���0W�Hv����5�DU3�����3����p���f�!��Jx��i��+>7�[����Jo���짘=(.�K���=[>�Q�3�}k<p��p�1��F�Q��2�@Et�DvB���F�.�(���(�Ճ��iԃw���Ѭq��ȡ!��yM���(6�0V�1��.�u3֦�����|p��5��ۋ�O���R�gD~��/�.�s�_���oQ��T            x��}K�&+����U���0Ŀ�^AOx���o�5嘅%��U�ff��K�G�ٖ���LrskD�1,��~a��nn���=����j��R��Z~���~�y�md�5�[��{W��q�^b*?��G����?��O(��>��o����������O�a��j����ռ�Ѻg����rc����}��JKÕ0���iiT�$�e����7��}�f��d��{��)��Tktݚ�޽��v�oꍁ�x��d��4��������r]h`�4{��Ϗ��&��[��u+�m�cu׆W7C���zm�WzN0T�J�I[��M-��Gl�Z+-�a�
��
�������ӵ�fA��2K�f�F��UM�z�;	��%�[�N�����M�7/@b��*vI�c��͵j ���ښ�i ����x{T5�q��2�-��H��԰aJ�+B�x�G/@bO���O�޵��d?���ؾ��𐶳��L$g�2���Ӝ�b�M8��{+�H�)5��������M�p���r!��
��7��0RsI�h���k�p~V�3�R�\��#B݊y3�#�	�9�Lѭ��T�n����.�/��[���_@�>1d��d`5�R�U����3����5�u������G���h`�@0<��c "�&�݋Kc�U7��ou�$FsV_�<��� �g��^A�>��s:�C��&�-�ݕk�6�t�uq�F�f�F�c��vĈO>����린,�-W��ȴ�7�#�b�G7�"X�D�7��Yu �y��G����Zρn`������eZ����/���y�o�;H`���x��eT��a�D�i��x�"�SE�t�3��n�6���W��S�MF� 	L�Nr$�>�5�`�� ��<�y$@x+���	,Y`��@�ޚǇ㺁�D�l�L�[�%o���W ����N�.��hm���cC��J����$�	!�?��TV),:��e�0@1É7m�R?x�����~0����� �C���x�_)����H*8�T�޺���R ���7�������`��+{�Gщ퇕k.�	�ړ���� Ix2��l<u��BV�gˈŠ\)�=�k�?�7/@@8�U�n��J�-vҭ���G�{�U�����B](z$z<��	���+�{ҔV�]�7/@"O0��c��������mP��!z(�R!�Ҳ`�����^�Y�P�`��ԦOW �'fϑ$����b��!��D$I�ۚ�'�(������ȓ"���ǚb���px<{k�V47ay��@��7/@"O�F9��	�nI��򄛙�s�/2��_�4@X?x���QOrY���)��߶�-׽�IJ��������e{�V%��
}�6_|�6�͜��:~��6��p��e�)�v}������$����wͺ��Ń
��	a6&�Ǫ]���o^�$>ꓞ�Ϡ%�{�a<|+2��NW{4�f�H�/\�8���=����� �Hi�1�7/@��@�n��ְG�<�	޵�X�-+p5��o^����3YX`t�@��ju�5ug��Ά0=�/d��;޻����_��-?����Q�H�	���+ �
�5� ����o^�D)��#H����=(��@_a8L'|�1���� �>�Ù��)��@h�R�{}]`�rƓ%Eșo^�D�,r��t�v @�w����̂X'1�;�� H��)<�3�#+�P�J�}�]e�tq��0��	�w��ou������S8�V�S���Ń�P@4&�^��f�D�J���z���n���؆RӉL3ȩV�x���$��7������U��\����l����5}�f�Dғ�����ht�A���߮I(.���V�я+x����Z��1��K��&ϛw�J�1�.s�|�����~4U�B�0�{� 6Q� b%��@|΂��]j<�����p{c���c����ɏ�\���h�)P��U����#Shn���6N擁ɏ�q<9��'�'���$u�B�|̋�f�F�����pd�%3����!�աX�A�bJ�x����ҝO��ol2�#����N�`�4Z*$@����|PH��(��J�R�)�ei^Q��쯳&.a��	$_S*��A���G����0RC��8]Yf��l'�[
� x��򠸳{��O^`�<!H8GbH���땇�s��6[�͗<�,���Hy�̰�� .eU��}���?���͠R>q��/0R�\�*����.O�䜅"L�G���z�p�Ƭ�E�ɰQ�B��qހ�<���e������nXM�]4@�`:�#�o^��<����l��V���0�!.�����Wk�~3�$���#(�nP+?B`*G��k���T�l�� ����rv�[A�58�f�A�
v\�J�!�8�o^��HW�9���g�s�W0Uk;:��������-_sNnl�{��ZA��e�0�T�H�}���шP$	�)m	�_<�*뽷o^��@W��x.�<Y�n|8�~�pB�EW�y����W �">�`��g��T�{�q�i��U��i��� ��)��'�kh�;
p��G��*x ����x��H���|�㙸
��;��$��l)��ܔ�%/��"�$�O+�yXT8��T�U��N&���9�7sZ�{*�u�l�t�7/@R�Ws�G�@3JcBE��O\Wpx03��*\��
^��>`
vv�X��Kp.�]y0S�[-��R��䛁W ��+��[j}(B]`�-������i��4��A��-G=���X%�k�H�&Q_IF+�Ru�ڐe��[�C�7�k^ߒo/����@�G�N�9g�+��VY��K�e�o�;H`�2+�L��۫���F|G�k9Ѓ6+(F�����}	�\eP�Ȃ1�L�H�8\jy�
4��O�� ��ż�������3�@2ֲeІ�&~)����
$�2�s-��xS��V 1�?�P�ؒi�L�� n ��� �u��x��!=����8��6
�	�jTIv�z�x�\����	O�^�9;�7cN
l����sm�U[Ad�	�S䛁	��W�	�i���@�tV�|^F���SC0����	O���(�Ce�N�<���C=t-Z@�����^`$<&���/-�󮎙=���`nus@#Ե$��3�YavVpm�0p�K�����������4t��[.�4�W�L�he��n|n����}�:�|��a�P����ʆ*I/�m�=��wy@�ɵ� ł�(�1%�뼅�Ԓʞ/�f�B�I���	B+8�p\i��� �{�q3�!�)A�+�3�HHo�Љ�u��#�$��_^;�0�Y�ߩ������Db11��d��@|�rt����Xfp�+V�+�eF�s%߼�o�] $>>�x����,������8�pRdCn���f�D"����p�f[��ݓ�
5���H�P#;���+x���DK�|	;l��
��r�%.�&iYq�7/0�����+:(���q�(�|23`�+"��P��d�)҈�43�{q�ע����H��;��0�� �2n���=��b�QnI�㛁W A�g��Yak3���&���"����^�D&��ύ������N�y�v�������� Q(N��JӶ7�L"va�2�"l���`_W�$�(��g�;�5��KXF�!a ��C����lN�N(y�u�$��/<؎� VހD�8��*��e2�h_h$�	�@��Q��w�}JA|?r��ϙ��Cv����f�������o^atJ�'���$ɪ�xor$���5îi3�#顲>�AD��kَIq�� �.P�[�n1H��}3�#鑚����v;30��x�m��mO��	>=Xax�$��	��h �$��;W�==����G��G�e�U��h�Avn)}3�$	���|t� փ�����:��e    ˕�xk!2拁 IP�Q��Y+~��ɻ�?����2�_8�o^��֜�e.s(��`62Qܡɻ�7-MWͻ3S⋁ ��w8W�Ȇ��x7�Z�3L�F3����;��^�5I����a?�I	tRV��7 �М��G:8k�Q7�0���@Wg�h{�o^�$Ct�s.�Ɩ
AQ��������v�k)t��f�F24�Ov4���Wb>�޷C��n�ٱ���^`$Cs�z�G��M&x��x�f|f��;/�������N��#WHuf[PC���j	DЪw�<Q"e�lU�j��p�O�n�ɔ�0G�����+�^ :CG?I�ȶ�o�WGu_vJ>���x��Bљ�~z��7q��|db	�6�ꭇQ�o^��Pt�9����q;�Ja	DdJ���@�S�y�o^����3�3/{3.u��ڙ���VY'$bP�x����V͹Y(Łu�T���K�t,�\!UH*`��v^,n�4 b �}�]g�:��~��o�a�Fs����,Ռ�5��A&�o^`Ġ9��3����v.p2�u�<+�U����"ə˹֯�	*n�M=֞�W�A��Y+��7/ bO�>'� `}-��r5�0���\.p�E�o^@Ġ9��Y��Mce�7*�'��jK�ej�a8y%�sgV�N���*��6Kݳ�ʕ 1h�\�� Y�羆�*D14g�g�U���h�,��b�F*4����e���BN�rꤕ���^:��4�o^��Bs���H���e��:jc!��޵-:����
^��Bs���SWvz���[b0x��wl5��雁 �МRέR�m1%�xX� �+17j/���bXD^��ɧ�O,3<�����٪���<%�(�u' ����Ps 	�iT���I�ZΡ8����p|��T!�EX��>ԯ������П�H�6�c�w<��L@g��2���o�;H``�����W���k��+�`$$�l�w(��w���|M�&=`s��r���%�5��O��vCB��i�n���k��&�<�AR]����R+�3� ��*�0�8�Dul?�x@0��G��h�k::�<�'m1��
�����f$��
U/�� I�������Wv�>�lV6�o7_W�?~���
R��p�LD�X�����	lpd��}�f�HD'��$�ԋ��T�� ��AM���r��(�fY_d�}y2��Mn2�a`J�O�njRgb{l?�ţ��ōlzie��o^�$<��\5�Oԇ ԥ�{:ߪ3l=J��>�ҏ+x��&;�O\����b�X�oh<���N��� �N<�h�������Ƽ^v�)��4|�ڛ�ݟ� �<����e�.��F���$˘���*�4-�ђ�Q+%�(Ǫ+�.�0&�u���,�xrQB�.��N�n\P������d���m�Թ�±�A>�I����i����7/@"T{<'�쎍F�T�6�s����CH����+�T�?"I���� Y+�oco�<n|̏+x������`���yJ���L�*�j�5�Ξ1�R�4j��:�,��GkK�.��7 ��Xg�Z�/P���.B�����fӂ�`雁 ���Rϔ��m� ������+;B���}3�$�ɠMg׾s�	����`� *�c��f��T�x����� X$l���,��>���U"��A*��Ѿ+� �i0-���W6_4����M���a�4����Y��;�G�
b��e�t�U}X�~N:26��-���cUm�P�,�(����^`D�:�u8I�mž6���΂y'����[��7/0�O����F,l^�r_�O\���N�qW~3�#��b���K�M�������R��43��}݂��R��u�5Ĳ�Vc��ZY�[RoH�#�{��|I�W���w�VP�]m�LZ��xI����2���gS�Nr�K�0���i|3�#�	 >�+}-�vsFđ���vâb}�~3�#�ˍ��U���^&��z�ȗ���t������Hz�9s=_$n�INp��� f'[_|f���-�� Iz
<�9����@��;����z`�ok�}�A����P:aG8!����
77�0\Kϒ��?�~��6\-�jgNܸ~3�$�����=B;6+SXI�+����!��|䬖/^�$?�]:�+�KIx�Ċ����ܚ	�_����x�� ���(�2r�c6ķ�:(Ϫ+�$�f<�b�H��O���w�[xw�8q&`��V��=��>�&�m/'��*PP{_�\y_������-EO��i|wM+���Ȁ�><3�
$5f9߷�ψ�d�,fbcb�QĊO�� Iy��!%���Z� t�R���6O�{mp��b��� )�1�ԥ��
�U� Oϫ�����|y~܃ )����I�́С|���(�,�P�A�����$/VE2S��8 :�:���,y�n@R :��u�Q���VeQ�-l���֑u�!��o�]`�<�s�s�`̡�,��^,����A�d�P+���W�q�|2��Ov�mpml��ݒ	�&�o^`� :C��.�i�����c�*��O�����;͏��#�D|�ssb���&/hXR�x�vM�-��յ-w����E�`�p��;��ԛj+W��iG�˪v.�� �r&<���q,�K�o^�� :%���3� T,֓ƞ� <��l`~3�$�����Hw�;kq��rA��+h��g"�,�Mp>x���PU�Y�Rd��/�ߒ+<
��d��x�
�ϧ�:w����[���D���(\6# ��H0��Zj�9yH���%��)�~E��s��R��R-�zN�,���F���GW����������e|�VĐ��m�<@ﭰ�*Ԝt�:�x�������@���N��s���7��ѯ��^a�ô�H,k�n�X��9iA��9Х�����7�#�Ct�h�����Z� �\���G�Z�A�R���h�҃oL�׼H���V��1vI7�.e���ǄD+�*�����7��b�{Gx�u?#W�p�oᧀZT{Kq|?�M&�����J�/^ ?]515U�U_"D@�?U��Fx�U��p�f�������9�<^x{d[��tU]���(���!��w�~S�
����౅��9A��3�i�&�Br�s��1=��A+S�6'�N�l��Q�/��+\hveڔ
�����&��/9{�9ۂ�1�p�Lc�l֧���V<+X�R;��b�g�K}p�]|��?IS��u_��L���=l��q$�-v������|Ky�~���yp7���@��p�l]���W�)ꄁE ��33�ۍ�l2>6��#4/hwC���7{ڙ�Ʊ~Lb`t��BV�#��=hU�)�p��|U0x�\�v0�����c�������X��$�U�ر�+��}�Ν�bYl�V8fO�4�a>a�©L>��'�]��qxz/����B���d�u40�_bl��8(��|vҢ2�`�6�`<�-�B#ed�?��ے�H�,_�<�>�'�i����ت�n�X�����a��@�Ûș`���n�	���-����/h~,��'�,�f�L��#n��N�c�Z���ž��?G,�&�;�"��;_��o�9B�!�s6�-xoi]�7�X-cv�����*dr1�U^�W��#i�`!�,��A�h��-J��������X#lJ�&1�i�Pr��j��Z,�H�LeF������{E�`*���w|�	�V`��Hy�=���Ke�@(� �2+��Z��1���FL=N��E�tݎ���z;#����* �NT~l,zk�\��{2��W$��ȮOm�(��Ǥ������c�~p�݄#ì�.����G��tc�;�f=�=C�����nω�$�Y��BWm�ƻ2�ܭ�[ �����U[n�F'�A�|t{�r�b���9R�C���������_�i�   L����_~]l� f]d����~}j�rN^}�E�)���X�V��}Mc�!���a�p�<���E�䀕[�1���=�?��gD��B�z��ȹ`���A�!j�!���`VpE��x'�*�Gz�,�A�+�ε^#����j���^x��vR�F\k�����6�"��p�
����KU+��.>�k`
����[ ]I��T��rr�������'.���@?X��֢�="�`��/?q���R���>�]g_bP;|��8�ݧ�'5/0k�m��e��Z�j�a����+�Z��<
�,_1cq:�,(J兩����=���"���E�EF:�x8�9z��b0d�Ź�O뒆����qP�C�Lh -�)��9m Y`͘�����R������5P<��Y�$-�u~��{�r
���HV�X�x�;�u{��4���[�f~���I^!;�� !��Ų��[�]�p��¼� ��К���9������b�� ��E���@@��h�`.N�%����|lNCh��M8��/�S��(L�L=Ae�>^},�3� ��N
 �3�l�cz|�W������=^}��q��lI�A��������D������=^�����a=�ޱ�Z�x�Ԉw�73=b��훁{P�V��,6ζ�Ù@��(t�qMh&�]ׄHR&�O��p2��%�������<��^V�b��%�Phs���
�]�x��3q�8AW�g5�!��3}2+
��Cn$^2�����=hPh��UX q	���rF��� ΐav������{0r&N<�]~��֚e�#�(;�]m�ڦ��*��Uy�y�	!��6B����\f��Ľe�
��X �Vo�G�L����2B'ck��2"	�X[�\t�ҫP���Lfx�l@���Ө9)���]��OL �?ϾV��v;�D�����6����*�Ň���^e{P�#L���M���qD��L����{��6���,�OY�/�#'����k��X&�Q�:���LIb����s�@ݺ~9�a@���֥<}hl��hn�$	o��+藕�7�8��;�)p���ad�~"��	<FBu�n�J�5@������#>g �mrp#ەu{ u��,�fP���] k�+8�&T�"��C�{g`~�؎d��y*�q}ǜV� �$�އ�Z��me&��y����腥a\h �Gg�6��]�<g`��$��%����.pǍ��5���E�SD��=eˍ"	P$A���[Mb\���(� 5�u�}
H��6V]�-Ӆc�y�e�B��A�'����(�_a�R|��s�Y�f��)��r��=Ff��^9�G���U��5�>�n7�2���)
P��7ÛW�!c+O4���`���t��h#���]x���~Re�T�|�H�x���`oP0����PO�*$ 6�1�zL9r*�`'&���Lp�v�``��<B�w;�g��_j�=p�m^�!BX�?��s��� �ok�<�/��o�4`�?�"���Rby��X9�ϑƬ����a���$��1)o�@���j-ep�O����#���`�~�wۍI�� :O��&��HV�sȌ�N,v�aw��!F��#0Pؚ�L���ƹ`�+�ڍi��"�ȋW��_�q���c��hbG��������o� ���;b0a�'N
`^oX� �ֳ�c��[?��JR���H3�y��g؊X8¸40���L���p�Z&~��IJb&@_�����{s>D�D�Wyx7�����ugS�� 
����V�ls/��f��ρ��!a����㡜���d,|���d4,��-X�9�G�i��#�[9�-�p-�������`{� Rd���3�x��
(����i�}y�i��o�e��E�"�p�n`Z}��!�L���P�8��W��ԉ�+�8�����m�)2xv���0���њu�f`�!// � ��ϊh=8�n�a"���k ع�
rbG�jA�1٣6���0�դ�$��+\n���[�{�Tg�rfp������,E����}�<��=[+�8��3��4/���v�A1�b \��=��M���(��+�x�?��w�
�����0��o�nc�>@迢������-��x�)�̩o���+��
�v��N��6Q6uH���m�r��N�A6j�������{!N}�-�~��	L�RV0�]��o�F�4>qʀod�d�?�r�J��Ӂ�l��{b��}Z�7)[��QR��t��ڠ�٬,�؈3�F"Hd,,�/"����HCŹ��Q�jx� 7*��+7�L���OK�̡LO��C�@�s^�u0C�N<;��R�̗ټ)�,m�O����]eUv�����6�����o4�,۞1�w�؂ {��>�T��Ѧŕ�@�&ɴܮ�i.g9ϥXf�dޱ*�D%�Jj�`��~k�Z��4�h-��Dʋؙ��g�1�e٠u4q�p2eS�.ޱ�{����A����z���f@�sͣ����!�50���xt�|6�v>��X�s���\�f:֜�F���o�S�#��w~DF�pB��00RW���	�v&�P����fP��:oľ����e�r8�⒱�vs1_���
��1��"���;?=����]�!��:�k�#���+kl�m~��W[� ���Gh��+@!�� _��H�_z�
t�-�Va�6(�� �i�s�z��>��*[Ϛ�f�uv)K���zV�%�3�������؁oQv<�*�!�{���-��C�\�!Ћ�|3�b�E�r�V7S/
���T�Vko/(���D?x�ߢ�p�'���s���zJ؂�:��A^�'��CT<'
�������P˕�cQ�/���Sf��o�v�*�\� U�<Q�����%kTxp!
�\(X�]�w���J�(;�3����l�1,gy��qj�W &�P�[��Y7q#�k�.������*ν5��<΅�k�9�����j�!X�w�Y��~Yc|[ʬ�uM�5�a<�[����5�R�Io�������C[[�      t      x������ � �      R   �  x���OkI��=�b��T%�����Þr��?���a������s�:�`}���^=i�&c�Ɯ!*Pd�@1�Ci��D�͗c�_�󞦪V��)p�H�C� WM=sjqK�AS�1X�jI�yy������!���b�?���I��G<$=��%����k���ƪ�	�%
Ĝ,6��5��1� �)���mZi�gBL��D�3#b��҈�����żv�`�JѪӆ3ڰ)-ϑ��m���L�OhS��[�R���{[29-�<���i���7��H���D�g16�_i)��	� n\�r�뛵�xY[�NY7��7Ki&��M�6s���).��*
������0(ho9���c�N=�IO_HifI�-��3f&9}�K���V�8�R��A�a�8,}��4MRK������gj��fKCK�x��	#�#?	��}�㓰�Q�������A��a�>:-nI���K+�M*52q���4)X[
��h^�W^!��I���މ9e�$�
}M;�X��:�C��^sOx�]���������8ސP�۠�C�dz�B�~SJ�9�f~;��i���}5�.��������	��J�JnӇ��R�#�-��4��_�J�ʈ�>����N�0X�� y4��ܟ�����<�?�����1���=�!�!�l���q�{� ��C��wds
9[~rB��}��G�Y؃$U�0��ԕ�2�~���n���������=h��Ǎ�/���Yk
�a$��R"a�E�{�����IXZ�`ԋԺ�ص<�������ʣ�^��/*w��Ģgxc�쫂{�4��tW~{���c�[�E_��Q�����B�p����>�K�$��m�4]��y6���[����3,(�%�$R�ZH{��1���8,C��]������Y;8�Aɷ���� ���/�/1��}Z_�}n�.|u���������K麭I �R?ϻ��_2�&      g      x������ � �      S      x������ � �      D   >  x����j1��ڧ�=��?�QK����`��s0��	6��C?J���5�����>z����
u�FS\!��a҂��=��g����v9�r�_.�cq��u��ө��C��:�7e+Ky������X����֥��A�������Z��EC��1r�чУd�,<%�����>h�:	
"�5Y��Ø]������A�ڡ�1X��Mt�)�����|���5�(x�Rf�,��|@=j��'�@4��sB�Є�U��-�&q��B���o=+��|���P������U<	��tbc�t-����2�l��y^��n���      T   O  x����n\G��ݧ����w�./��M7sT��?2�H#h�0�$��'ى�� �&Hv��a�L7��C/�k͉
�fA��m`jEL��e<;(�
��@�Yv8�2��F^V�k��5�����5��2bJ����V��|b�̇*��'��˃IT���?����ϯ�������/����km�J� �"&�xZ��Ѱ�caQ]�A�n��	�V R4[D<��B��㧎�z��:n>?��k	e�wkg7:�����n��ٻ�ئ� )}B�����).F���d9Ɏ�N.�8�7Գ�$�`7�򶳼�����M[ˠ�l��r�>���[�a���AcB�X�G�m��:�LJy�Y	6�l �
2sAÎ��m��s]ܺpa��e���c/����#e�}��	$7��)z$��_�-e�ҩq�H�Lo;;�'�`�o��#V�٢/��G�ðCL8�/N┷a �v��W	"�'X�a���Ƽ�Ʈ�.�D�F�A�:�ˍY9��:\Ђ�s��� ��:6�}�Y���(��}bv�0[{M��>��a_�=#.�^i�Q1~#Y�#��q�^�]O�V      h   Q  x��Ko1��s��#�vb�1;�v���@b��H����E�e$k�͜9�r���F���X{��U �>a������9 ���x|�a=;�wڏ7o{}�~r�Z��Toly��ǳ�z��nt���_��Wz8.���<�ǣg 
{�+��ą����9P�8I�2Z�8B�)!.s���05�\��zQ�Y�e�>���)!{h�W�SY�n��iŰ�蘼 o��?(�{�e�(��j(��\^=�ڵ�|��A-�WmP$f%��5��i�x|b��0�w�{�P(��{��ا f1A�-�5͘�^%8a�|$i��%�7HD�Ԁ�d3-�n!��=1ZO��ˋ痿%|�?%�o���89��c�B��g��XX	])�7��G�5c�	��P�ac�0
��Y��H�9�G#�a=����'O^�O;q���q�WFǞK�{#dY}q��m?v5I��Df���	�G�3k���h�IX�K1'��]�_O6E��ul�쿩���b�eT���y���
��x��}����"D��-���4���To��6��v��� BY9;��/A(����I�!|�v��gQ�@�      x      x������ � �      U   .  x����JAE㙯��Dj�WwUO����l�O�@�����@0��N
�=�\"Uj	A�p�;ā��8v��c�/����e�:5��젨�j.h9h�0�!Pv{��R$�E\N���<����w�Q�y�֊��S>N�!�f=IpY��z=}\���)	
�����1)���QJZ��9A*ޡ����]�o�~��H;�ζ�����_�'�7A�gȸ\��$t���
�&0!2Jԑ���W~�%:�[q�j�9i^�e@�x�(є�b�+�{V�MTM~28n�~��˪      V   l  x��X[o��~f~�>%-���~�k� >Hl�n�T ث-T&�J��YR�%�1
�$p9�;;����,u��{#1�2c������Ŝ�Q���ޖ?���ue0<���H�}ȑF���	"�:8�<�N�h��#L`�1刈�)���ZZj�����/�����m��\	�$�h�$�1��:U���c�ht��Uj����Cr5o.gOĪ��l�~�~HM�ޢ���W�}Xt=��]�bۼ�{|LnU���	�g�w�u�>�r�4�����W�aC��"G���kG�^Zk��,��a4�&�JMH/�@t���,}Y����{p}�Oq��j��Ӫ�h�*��t�E�]���]��.��"�9;,�D�ݷ_a�=l6.�>���+z,��&�r����� �逩��b�]�2e����I{
����SZu�����	�{�Q��8kWh�T]��=@�P�NjK��a��0��G�qf�YH��<pل��z�����@?,@�u\4w���.����y�f�F��uŏwFJ1�<bf��Xؘ�	"� [qƓ�YW�h�>�w��a ��~�K�f�K�}���½k�RwBRU�dT+=���*��!b��ƆR����3���q]׆��S�{K�.e l����xg�+C�jǳ�!BƸ�ޣ�\V�.�c�����.1��u������DT���O��I��:#�E���J�U�;b�t�T��H#� ���̺K�$o���O&y���cB��l��XQ��%�k-_3i�̾M#�Ш�:a�щS�0S��ęY��2����X$*�M�a.���*�~Ū�`��mY#����u��htͨr҅�9gJY�Xf��9c�x`Q�Hz���4��6��F�U�x��%Z�)��S6���>Br�'��Ԟ���U�>�j�������?�UPA��,�xB�еT�Nz�� ŽǁS��D��Q�T8�0���Wm���*����Eߒ��5�a�ҝ�t����5eE|��ܟ��ã��FD��z\B��[.��W�_C �.��D/x�y��0>l��1g��\J��_�V�G_!&�ژ��q��b�=�q�Oh>n��Ѓ@q�`=�˖%&�������:,�rРA��1� �t������ ��y�f�Q��QqH O�ټp��p� �R"C��rT�D�����A�2Bvﾤ�չ��@UE-0W���ٝ�#��LM�T|�"9��ɔ�m��i�8;��,9�����X���1V �5�6y�gY'<S3E���Z<$�8\�2�묰 �xFp0���16Mb5�������
뉳�v��FI?�\^�}��ˏ��R��b0�P����ut�65�X��)�2z�V&��+p��4c-g�
�6�_���.K7|�J�?�kٴ,�˥'�͒!��O�t�k�)"9���:���Y7l���U�_AY.7E?8�j�M��8s�^��|~�!��E���c&�����؅R8�sgpJAHL�X�n����<��oۗ�Ã[}C�SN��J��d�H��\�D�b[�v)G�<���j<�p1��.Ϯ�?��>K=�"h��������:Y|���Q�^P[Z���k�	Ќgh{&mXm���� S��u;���Īi���߼y�7�IT      [      x������ � �      \      x������ � �      ]   b  x�͘˪#G���Sd��Z*�]BHf�ŁYͦ�O0�Od��`o�i�1v����V�WY���a!uP,
�b�.��D�|���]��	��O�~?��?^�
��Sh��9���/^C����cO��=���}4���Lg]JFV� ��ߘޘ!4�������������XN���:'W�is��;Do��k��!��~�Y�,O$X*�K������VØ�}���!���Fhb��0��@e�/B�ZPn�joc	�lY��W��y`��E�3z2�P�"/!�[�r'�Z���6�\�@�	-�E�F��1�w͙_D����V���k�����P�J۳����O������vp�>v�7�#Su����:,�L_^Z��l����Q�_��"�r���Mh4�L���d+Xc��x�~���\�@"��XbI{5�f�<t͝_7ى V���Da��S�?A��O=������Q9��N��j!����z���xP˜=�3K<��/�?DY��'z�`'�=�Ι�uϮ�d��ݛ=j��φ����MF����7Δa[ˮ.cB�N�VN�[Ʋ�ό���.U�CJ�=R�*ƭ��vЖ!��J�J��x������֌͏Tt4�,����Ȟ��7Ǭ^҅���!ƬT�f�#�x��ph���}�Z&���j룈Rs}XP��pnvZ�[H��r���օNß�8���M0g~���T���� -2d��=[ԄQ)7r�"�~���a��6�����}��� &Tb��J�#����tŇ�kޤnHz�E:D����B�m<�ϴ̻�(%�yXQ>lPz��Ωy� r&�9�i���d|���V��^�����      ^      x������ � �      _      x������ � �      `      x������ � �      a      x������ � �      W   �  x���=n1���S�8�(m�� ]N�F���7nRlc� `
�{|�\;��j0�'�C��F���*���6�Gc	P��T�:�V����c� ���0|v���M�.���P���tG;���7���x�����{ug[�:	��Pt�B�P��/�+'�����2a�AG�,��Cq�`��蠋�K����h�"`�4��ug_��]�F;�R<?�U#z�g�e�v������ ۬N�:�_���S�x�gx�ct�
-��bеu�f�c�Z�������|��^�X�\�
}�1ƤBE�����2s��=����C�ѡ�x*oR>���&|A��^)M���O����t��I�b7]{�-������s�ݢ��I5G�z�6�$:є��D��Tj{hiZ�N�"����S!�n_&���2VW���wW���l������G��-7:�t�Y�}��8�n��K|3:kQ��2�v�n���ڸ�      X   i  x���;�A��Sln4H��d�s�`�~����3l�`/�A��A�WRY�i
F ��Lն�v�1� ��9�� �<Ah,hb��`ݞRv{�$���B�Ѡv��2c	��U H�/��!*���.￞���-1:9��%�o��2G�I4
��%>�3����e!i:!y1�Z�G�*�K���t��ocϛaN��w��
o�V��ab��t;��]���&�y�L��#���b��O��7?� "�b=��+��t)^Z���>��3�fw�� =ܧ<��U~�l/O$;+���}�/g�Ӄ,��������45�M1wbI*?_�-���d��@���x?�����}      Y   �  x�����1Ek�W�8)�w��S�
�ѳ���?"g WnbÀ Usqp�D�:�)3�6d@���x��,�������-Ph�i7Ȕ:0�%�5��R��fm��
��82A�V�jԒ��`�!2`>�x&:g���:�1|����3�w����ܓA�)����ˁy	�RL�SB3��Y��*�`��T��/�\�D��c��:����=�I�{���z��������8��U�H֢��C�{H/�Ԙ���0�!�XB�\���<���e����{�SZ�*����D���Z@zRQ�� �\��b>�������Dd<'�9Iv{$DO�!(�K&�j�Xb�BuME\�t��S��6�sK�b���V�^��v�'E�j��<r�et���:%M37�d���r	��$����m��p퓗���28jt}RT�5��x"�Y�蟧�}۶��Fx�      Z   5  x���]o����_~E�9���]HB$MvI+	���iUiC�����Ro�-�A�v��̬y��XNZS��k2
��X��T�U|�換������׷˳��������u8v�ؓ�_q�����P���_}:~z��̯��jM��¬�ꐎo��΢�����ݛw���N�������*�u8��F�Ga�=[O�����L�E����b�S��P7��Nq	y�C�9�,�P�	�yR)���n�wR�q��N���G�����%�w����9� a�e&
2�9&9+͕�E������q}{�IGə[*���m�ɤf�(E��4.����[Oo�DH�N
�;iUG]�ܘ��q~v�v����
5O!�҇����������R_��S+�)8�(�0j-[ͩ1l�8��`ޭD�|��	�(̌j5r#�K���������3�}���!�2&Hz�Í6����x�.�Z��9&xl�1��G�nr�vnz��������֖���"��F���Z��	8�6�,�ݧ>�;�������-gkp��2M6'IG)���?���9��OI��S�5�yﳊJ�X��8�+�ݞ�}��an�y,W]�4�F�����y�����=RZ0i�&��M8�2u�.Ŗ��W��b:ch����m%R_0��n\J�v�j�.L�5Q�H��
5��9��4���7�eL_S28���+@7/��hu��R�W�������ѳ���`#ش��J��������Is���Qo��V�x̐�³Wg��qw�[�s�OD�~��1P�a�6Mbm!�q��o�5PZO���`���mZ$Y��Zpxg��q�Kjp�J���q�L0�p�)�g�
��AU�:��e̓�fÎq�O�x���]	T��i*�\c�c�`��ѕ�����$��XcW�[�` .{D-p��e%0�"�K��-c��a�fX�#�XQ;y/l�C�&��k,��'"���H^&��ɔ���U�J���A��wL��1��3%��p,c&P���?4���<��p"���Ic��eP@�9����[٭�{�/���\{]����M��n�>�id��q.	��3�%vs��v��n����@�zD�����|��V�N^�)��/��o7B�قJcI�)��8�����M;�?||����p*�
VE��j�����=����Yİ���O��t�tkB,�;�p����"a���s�vg���j����ь9
�%����Ҫ=�[A$H]\{W�h�X�R�E��.���,!���0F��)Ey��a�"�g���R�'F�C���n,!D0ב
}.���O���v1p�P H�$L�h�A�▬������;!��-%��*X)�����02˂ȋ��b��K���u�Z�jZ�l��EF2)�m�1���_5�M)7@~0��G�0..[�I��������n)#E��a�Z�X�1���z��q����]IĢ�X;q
Zvx(O]O���wO���ϻ��������6O,T��J�#ƚ=�iM�fZ1_md�d_�C/VG��N<�}�p�َ7g����CBk�J:֏���u����C�PL�q�4�\��9�(���(�U �:�~���qfO��vW��.Q@�b�)�EI����YԐ�XG����n)����XS�-�El��}�ER>n_�f��y���,I����l�TiJK�dl�,K�s<}�0ǽ!h@A�nJ§%k���Pn��>\�:���k� ���P�͔[+�M�s��AN �V A&��GHB?;NK��ɻ/̻����A.8��k	�����A"t���F�eZ"� f���_7�`����5�ݥ�YJ�� rN�2F!����^�qu�zǖ��'!���gD{�B���`�)ݾ\Bn���a�J��0w~kS��kۼxr�V�#��5 �Sm=8��[(Ɂ�����W_�.O[�`�}������'���s�^����&R��5B-v#	ڑ~|T��v"A&w��u� �'�_F"�ga�R"�~;D�i�N��Eh� ��Tz,j3�~\����$?���ŋ`r8{      q   9  x���=n1���S�8 %�?{�4i�H�i}�k��ƻi4����{�#�2Z	�\G��@Gwꮱ�:���;N�]�ƒ�̀��k1�V��\\������AA����١��8l1�
l�����������vչJ}<�e���ԭ�Р#:�'S���F)S�n�>���u,�$Ƶ�?C�G%�~�r��YoI>`����e�f���BXg�);o��6X����CY�Wy�RG�{���G�-;�3�m���Z�QVe�*���!jih#�7YE�	J?؝�ݣd�8�+�JvabsXf$D��%��r�ӁK̴W�ɼ��R�ˁ���n-�6��Z���W��A��ʔڭ��Ǟ��d�)j��ee�6m-{A3+�GJD/X�R�^T�!}�����R��Qԛ��yIYimg]�ȗ+gk$<?�N[�KT#�L���&��=r����ݥ�~�e=�,g����E�b��Q)�8� ���M�3�I���$ÿ،��)���`�A�nG ��x�f���Ԓ6��?l>V+ң�����|�(c�d�cu~=���_����      r   =  x��T��1�����Wv��:^���&�OI�x� ]q+�H�E�̌g<{P-����3C���b����_���8�o_�>V�;pH��N�t��1w�T�cO����y3��PkW�����E����{:�|B<~^��ٿ���d�B���@�-��c͎{�W��j�eA� }*�i\J}�2���8����;�3*���,ީ�.\�����]Y_q��^5�h��U�Mg��=�@����S��;��u���\�9
�����g��'�b,;� ^�ީ�\f7�ⶶ���gc%y;�B��l{K�3] �,�4���b��+N\E�[��/?7� ��b��|�]�L'K}�g���QKvL}V�j�O ��_=?�X��oֆ����fa�T C�L�ή��	����'�S���&�T��{�Ӥ~`y�=���^�p6y��lj�+M,9,�Ps���g��JŘ�fe�:{��)o�k%dy�}��e�g���hOL�s�x���.�sX� ���U)���f���-�N����;��E�#���UT�Y� �g3�/l��A_�}|;��/�H�x      b     x���;k1F뽿b�0�<%�v�n\	�r���	$\���h�8�čcn@�����4ӶԪ��� �	�B�X��Jp�������-�GU��[ci�T7ȒR��%�]�^jo�Z��h�%�\0fӖ6���P�lF^�V�e\����[�`��V��BJN{�>�݌shE�9 ���Rt��ERF���ų��kI1�;-��F�S����(���E�eH��X��aH�ty��9�3j�/��fZLB�i���
QͭA�L��M��a�i���/��ӏ����!�o���i$;���+hB�#Zܟ~��$��\��7�ь�������[�G�y�*�f˘?/��&x��/h�c^9�4���VHw�����3�x����)����dcP텱R�5i���SEۀ��ipW���t�g|�����	�I���ߣ����zx��8x��K��3��X�ʹ�X�$���W�ϑ�/Z]I�h:���iSw��
p�:��A�\�"jO��d�`�9=��	SǶٓ1�d���r8~��      c   �  x����NIE��W�~��Wfd���B²g�M�ʲd��������{ô�BMA�ތW�X��R���@Xj�KlK�ҧ���[��Ǉ6��v�SK���������F`-�0�%e����cG�)� 5�TC**݆�D�� �.Оe�4[������Qip�,D��Y�o��JR�R!�
Ȣ
%��
��g��͑қM��̈��EJqF����b�ދ4�]ijJ����m��N�GJo7U�s$��/Tjh�uQZ�pL���B��=��,6����{=�؄��AH� �Z vN1Y���� q爪�@3+i|����ؚ���ՙ�Aȃ�^�>��I��
5)f�u� "+��Q*�1t�y��7��b�Ř^d��h)]dS��Z��`z�� 7+ �)���Ӓ8�J�n_T���6�Y#҅6�_�O^�,������V��@<��(�4k�F����}�թ��sy�����x�~��i�#��yd�n�W��k��s��W��̲~��!eUK�jiK�f�~���u9Kn�9n�N1:�%���p͂��8���a�����n!�@Iv��N�I�N�A���$W�R��Uk+�BM+���,,oy�k_�D��������hX�6l�/<U|��1 �xc�ioK��ӻ���������w�w߾������;q�	�G>��s��c�{Z�q��Z]��AU���o�}y�����<q���ſ��8�I&9˟��:2�J>Vz�`f���$�l�w�����fy�1��Cnuph�&XV�|T7�W8Pn�x]X[h��q�}|�)xW���Ǳ;<��| ����X��2�|,�����ほ����O�7���6+g�g��K���Bބ�_�1�_VF�^պB�)�n
�g�Bq���cwRm]�sFwz�(����Qc���:m�C"���h��4�������lQ!�D�V�|
����0���1��^2vI����H�(}>��˖6vh
'��hKh�)E�����Qjߘj��22�P��t�}��S�M��_�sHgs:�"i��ϭ����x�����>p���r
-�B��>��A���ݭ�/i�[^l	ʠ��.߼��t����qSh��1�ٖ��K��'/D�VA] +�*b=w��N�mSh�j�g�ˇ����
P��      s   :  x�����1Ek�+�(�Ew���l�F�.U6E�>� vi�t�sy�Yuw+��[�P�V�����2�R��ُ�~|��GLAk�MW\���v?$����j5�>�L3�T]��^CG�Mx��)
`:R>��Ȣ�i�/���!;�F��r���W��L{M@�L~�6ws��[�]ꆔB��߳ �ᤫ0X*u�n�v�4$���"�i��2b�&����c0��6u�@���m ��4{�5�5�b^�Z���h��v�GIS2���E�f�פS��,<�.�L�T*��1e����5�[�kHk��[��$n�sQ�L8I��lw�1�?G,�S�H�������')��W�Qϓ�)i̵P=��P�Ț���Z׆ʹBG��Ԕ9�_���!V0K	x���`�ЕQ��(��dn�_�.�|�R��hzՍ×G���y/u��}��]���n=�^���6�(#�*K���d��-��<�L�3�dRI��=<7.ID�"�8�en$>�m�K����@�%�\���� '����?������mܸT����2=|����7�ٽ>      l   �  x��T�rA�{_q<�-�f$��CBC�ɂb�����LrW�����Z-�So�p)�v��h��Z���������t<�K�f���舓]h5�c��'M�i�@Q����Z��K�`dT�rE����OJ�o������[���T�6)�u$�U�j�e���&�����1��a`#ԨA��{E^R�׻yƉ�^�+���i���H��70*4�Z8�<_���sBl`�o�H�W,07�۾�g��W<[N��r-��A�I�̲��>jB~P�l��mB���p	�!T����(J�q�r+�t
3�3��odg�D���+ҭ�M�%k%A.�iN"�@w6�5eآ�ܣ��Qfc�	��{����j�Xl� ��X�j�3�t�qyP#D�xD"œH)�I�k���C�a6L�6�j��yJ���!�e�E���<85�gU������d9��F|R�"�I���syH#=�ƛ/?����7N�      k      x�ܽێ%ɍ-��z��hW��J%U�{TReu�� ��>�i`~}Ǿdf<(ܶ2��(�T�{�Fr�F.����t�	)��l����/�Kx���k��_��_�O+�|¯H�lBl�{k��)�����\S�r1�0c4%�nr��ڎ�����)�ՙ`�"xR��q��'}�mv���9�\p��V��6�:�@/κ`l0�~g���y��X�/k_�������g��}p[L�.��Z��rg��&P�xv�[��}�Y����ǿ�(6�1!T���r7R�5�'�5d�^f�!��R,dB��C�9�X):׉��qO>����#�*r6�J����xUV�9Ǟ̬!�7�5�7����!��P����D�����QL9��k�=Q[e�ܲk�� �:���43r�2����/�e�ʹ�l%s|�����y��~m�˘䨖f����j�W�^�Ь���/sԚ���P���r��G�)����2�����[���lj/��B��:j������۪��g
;`��G�Ǻn�ŗ��F�K�A��ɐ�x��z�xpl�U��l;�-s�"�)�0�M��.��s&qd�ZQ���J���,-�"/OUW`�EX8��b����s�]��ow�4o!1��9g1fI��˫'L'�-� �5Ԭi+~o���?`[O��0�2��@�1��7|����e�a[���o�=4��nbh�HPڲ���0��-���:��x����1�#��y�%�BûLoI�
�)���-gC͵{u:m�\��9,i˓�L1�u㖤im�!�6Ch�Ȩ�G�IFg�k+�p��Н����Ei���៨,k��֧I�ǗYWh��������AB�b��=C[�o�Rʇ����u�P�8��M���R��R��EX��Ϧ-D BZ𪭼�(��r��J�jR#����	�F�:`�P/ ���	[߀�\��m3?%l_z��2�i[��6">�S8@�=xȾ'I��Q��N	#��3�c�V��0��ό[��R�t��V�g�I��w��>�K�E��u�ʓ��C[�)�
��:2>�	��
�ɬ�c��Xe����!�	Ϧ-3�������rr_��rHf��	O��Sm#��j��
φ�m� ��Iڒ�'��u������5e�2C#t�x\mi��-;��@�7�-�-Xz�b�TY�k�n"������O��lR��RM3v���.�I�D~][0T��K��uAa�g�d�w�V��0�,S��}�P�k�e�l�Ї͆�s�� �)>3�*+��O.8>|��M�5�n`�P(g��n�Qz	�E~<2����sd��r�����醡�gq��Ÿ��d 9�🧨��&
��w�>T�4�E�Z��]��r��tK/��?��7���	uhȂ�&���Ɨu��1��7��Y`x�/f�>�6�W'�.��X�G��B:����2rk$MFyi42S3�yD��,6���qJ�+<��91v�IQhgQ�F㺦M�@�4�v[���{���Xrv��P����g/�X��8����IU���W�H7�#�gh�?A���)6�RB��!�P�J��O��v@|ܑb�hS�G���a�:8�љs�H��&��DSx���r!���L
�u���I�s��z���+�]��J�(Q��m9��!�4���s�� ;���l�Q^>�w����"w�[�!����)���*B�;8	S
)r��=Dω^F�b�xR�K�x����m��'��1�"��mF������ȋdٷ�'�R�k���ҳ����<A�G.0=b ��`�����:��^,NnD�6�2w�l��}�	e�G�ب2ЋW����ۉs� x}�Nx?�X2���)$6=�_�7�Vm�ް�oʭ�1G��ơv*�	\Hp<��15Qo�3~K��.�g�o��(���;��Q%���pp.PFVǉ�)5���p7��͕���6K�7%r�J	IO�)��H�^,�����N�V҆4(��B��8����-��и�d��Zc�r��ϖ ��E�qğ���P<��'��C`��^�4�<��||1zy�a��y?��/���
t�R�Uڻ��U�"m��=�?��D�7|<�1" �g|{[CͰ���խ��G�<_��m�(�+ʬ��\�l�.ϔ{�����Q��Q<|Z�3v&`aQ�
tB�cZ�R��}��w@���I��f��)ת��8�����'�:����J/dݿ��o?����gd��$=C�v�����Q/w�s�#� �^�K�ي���]�#1�I�|�9ɰ���4��L<DT�ڴ&Y��x��4��-�����ȓԖ��%;��@�փ�G�
�����s�A�{k�����y �2�,�H�	*���E,x��o�����߿��������������j�q����dx�d��P�'T{�-W � q���$D��s�ޏR�#�*�qH�i��xD�M��:� ��|��J�`E��o.j��Bz�;K�G��܂�������������Y�؋��	��p��Q�|c @�F�t? ?������ߍ�]h8�@o�H�~�iہc�����?��&
���_����#B��o�S����`R���l��uܽH j.V!����#��`���5>���-���	��A����%I|P�x����+ ^�`��$=ֶ� #��#�sC�V �b�/�ϩ�+�����o@�{���%�f�+Ԟqo5��t�dj���/�3�\[���ŋf��?A�����5HVC�^Ԫ���x�5��9"1�TЏkpN��i�����%�S���W������C^�wi���c�8/�n������8$ ��|Xu�(
�v���������L�u���-E�K�	��K�\��V�S,�Y��� =l�߹R'�d��$��h5�ӊJi������|�`��>�������^�t������}��M"�=)���TP'�KC~��3Mm(��Ȗ`�n}���𽗽�eY�A'��:��>��	�D:O-	���]�|� �=�	V�}�ů�7��=��X�u"�D����N�fm��:�V�`�[���C.N0�� �b�ǝ`+3"�y
;/ci9�}��p�{t����o?���a̺��-��oV�y�� i��Ny�4��0�<��E�2�Ԗ�2<Ԑ�{�@�T2��S��'wR�YV �N�ʒ�$!�\�`ސ����+��N�?�Dp��W�>�2��;�G��O?����ٜ��H�B�q�����`�fs�a
i�Y�iP��V k�Y�#��4 � ���oDA��
̗ f�ގ+�)(���#ۻES���.T��:"��>d�����䙐mV��
*t-��g�`�{��}<�I_Mv���(���x�!��kd����H��%�[xQ��:�^�m�����׽��NZ����xZ@2;/�x�q���QBZL�9{�2NF�^����w�윇-1!͈/7������'ՠ���=��ǝ�1����\5LeCH�einŗV��8���D6Xdc+��>!Ӌ�H5�ʌO�AxQK�s1� �S,�"I�o�+�!Űh��]�I���1���E�����Xi~��E�zы2�Y�Ҭ<eD���GHv��.(p�ʋ�Ĵ����YL�.�����K5 ��Hj���^!]M������D���ci��*���XzӠlqpՉ�RS'�/Cb�����Xf/�7mA���~�Lk��Z�rG����h!s��p�v��ZZ�<�]�����MhlA�]>Z���vzݨT��j_��"-.�R��r6H" ���p�hҔY({��|�F�P��C�^�"G������,�X!�¤y����T�hw$��vʅ�Ӏ��� M��ܓxM��X)��k0�H�w���kڹ-��^hx3R5�XG#>j�Ou�a�� X�UQ�s���~!{��I�'B_HZ���[=(���c�j(��hy}��K�3�.	    �SK1E9i|��6��a�ޘt��i�ѓ��L0�fq���Z�����[��z�)p�&�R�u�M\놛>[��a�p�?�95�u�,J�ǰ�E�A'#"ء��W��d��\/��@��$�>���%/Ʀ"m��k��m�?���¿���=�e�����&
�oq�6���n�#Ƥ���*�"b�����q�������/ᷟ�I+�ZAF��/��A�y��r��Ae��P�}����ֳ�@2)���5͚���綾�Z��*�W� k2`?+�AWi.�4��_W�LHГK���d~����"�.�Pc�^�_O]�V/*H�+�Q3��_��眲_MC�-LI��Zv�*�lM�Isx��lw�e���F$�y��R��c+�i��Վ�hލ&��~��̱�<���>^�
<����{C'�P�+��H��6��D=lL$��A�u�̔�4�,L�!S��Y9����������8ɂ	��Q���⏇'��5X�rL�LAր��oO��!S$F�t�mYGL��.,��}w�w��#�ۀ�$�E�8�SFX��6���~p��!V�1��9&��N��B~
��բ#'��M�VÏK�@!xJ�:����jwo%;�=B���$ť���Mgk���sy�9+pz����u��ը�q�9��;�<�m�Q��}���y
���t�b����j�b�nm�+����"�CW��E{�s2����%)���q����n�svA���]��T�o>э�X3�������.E�.��+�gViUS2�1�{�*�_��=iC�.7+6�R#�e<$��p��w3���L*D���W`|����"�F�\�+�ߑ����-�I���,�	Xg%���[���q�F��`���b���t��B\M��d�E�LR����7�(�������4��A��1 �v�e��'� �~ы"?�{ x����OEy�����S��24����A��XG�XZ�w�+��Ao�0���h¹/E�1!S]Xˈx9!M��)��ŋ������>�?����(�'�I��:s���Q�1�w5�~��M8Ov΍�hibco�*wM�Yۂ4���a�{���/���c�B��wG��X:}�d�QB8�1�>�II9U����_߁'Y_�f/�S%�2�C`�w�����N�u��c�[W_�i�Y�
�ܛ����I_�X�2�֋&}�(Q J��摨�� 4]� �������i���G��B1+�<vp��y����u�t�F�l�V%�Bz���˧x%�7g`=�@�jgQo�u}.G�.h8���������!��V-A��'?n:Ri=�Z�>�~�C	�՟v%g��z��	�qA��?G��'��`kfh�C�N�L�l��)Zѵ �8ʮ�G��ziNv�O>�Z^5h��\	�W4h�z��{<c�3M�q�"Qbi����޽�[�������:�����Q�w��vU�����w�Z�v��v��j���)�&����mx�S���}|��nOrQ�w��C���dK�k��.��t�U�:=�����*�\!��H:󁑯���|��1�u��s����$��!���%w� �G)@����N��D;ĥ�i�6�(9���oI(�E�
�Ĕ����(e��f$��O6���r���o'tD�~Bj�S��bZ(���τ���\4���p ��	��
Q���:��܏\3���l�,�� �S*0낳��z6u�erl�U�����l6W�����Ѯw�)HQ�Ր�ʝ��؝��}v!���id����g��D�@)��鯧�2����'�0�B/ŗ�'����Yx�p�琎�\��H>F�tm٤�,2��վ�h�s�����'J�L6ʥ��:ZzL ?�����s��i5h�C��h�7���WF~��D*�b
�'�!��H46R�|:���@��^��N�v�$k��<r���'�)-̞(/����k�F#$2�1���&G�`���]I�쓎{�-�L�K�JV���JϠv�
�>ʁ�羞�zO���5�I�Nפ�sH���k��܇ݕtJ��^R�j�Bs�U�+9;��L'��D�d{���O��A{�R1��p����u[�����i?!�~�p=p�z'�N;qNr(sv�_����9�tȂ^	�w���0�����kb8�	�u�ZV��F��Ÿ�I����|�a���:�o�|�1����AƆ�����~������A��Q��5�����8B�׻:���?���޽MҬH���_T� �~TI�B�o?�JwSI�@\Ԓ�U;�L�pږ̐m��E��_���ę?����_n.�|�R�� ��ڥH�|2�P�p!����xr�������o�~�N�X�H���/	�u��nRv��닮Y�8l����n���s��9�0x!�J��3 u¤�Ȉ��M��]{�� �E��ly�^��������kot3���ܡmFbD:�8�����o����'��J����ݮ��G��+��b������ZZ��:R��9�.;�'����,Ż��if�<�$r�gl~|�R<V�?�m�&����3���a�:�~���V�B�8���������Y�;�є��L�z��!/7��Yx��g;�i����y���S�r��D�^��"�P����-����!o{��͛R|ا,||�P)bX�&�0//�U" b��MN$�>ěO7ī��ʾ����&���c*h��*���"Q�ؚ]ߗ�˹����(%�tOY"����D�W���C�x��X�DG	!;�/����N��,iSݷ����
��bb��r|a��Y��~�s��x>D��9b/�ؾ��3^��My�}�׀���*A_�Rk�H��팻��q-����3����8���.Q� �����-��?�S�A��.�Fk���̅O*_��t.��a���N9o�m��Zy�6p-e$�e�+$�L����`D�]R.��t���ۺ�o�O�3�����Y�N��9	NRx����~��m�%t:��]���8y���:�^���r�A l$MFyilc���<����~nF��a��^t�v��ء#%͵2�-t�� ��Jy�)��Bg�Qs-^�� s|1�8uS)eߐ@�\R�+<��"�p�#2|�Oq�σ��	y83�P8>�9�Y3f���8˥���g<m1G��c� ���~��˴���ɱ���^�#{g<�.U�������v~�Nߥ�"���|�'�v
� <P��[��'?@t�)�S
Y�s�Z��Ɯ�Alp֔�0L�cu
N�˟�t��ʮJ�����^�Q.��/���0�������5u_��Bv履�=��{4"��|�*��J��ki�?،c��>"�[��so�x�ƀ,8����MН�e8��X�8�e����.W3��X+�M��h5��~����I�O
�L1M�K�?�.MI7��M��;�:���z|�v1�s_�����F	j~j��X�	��ЄK�1'ؙJ��Ծ�y�a���po��;���C?���l�/�cx{���.�4����j�2�
���l�B���
�H�B�>����?O�9&��;�=*J�h (�czYo��j�%'L��� ��P��Y�KO�a����:<�U����� �ر�͚��~���K�ю/�RZ�<~�HE#�<�?���U��N+��7R!;$k�S�F��ݗ��l����r?v� ���{�����{��K�'M����N�K�M2����nD����v�d�jH�<㈬��E\G��hdTm�Vl$�&�9�Ͼ�8���K�Z9�݁5b��ZDk\G��.l�m�Y]Q�,�5d)a�i#D��l�ǝ��1���/q��`Z��8�M�ѻ�_o.�i�W�eg��^J�',3����B����i��/�Ѹ^�^��}���ݽߛ�U5���؈߻�ȫ����(�QZABJW��C��Fi��\���������p�`��4����fB�I~�RnGu�$w7���ԍ���]�_7��ԡ�:��H�q�    ���`�^J׭�Z����^�h9g����{��qs>�n;?˟^"��S�2�?S?s
�읣\��%��&�X́�1=N8��?ڡƙr3�he}���dhR�.X��~aG����?�۫�$WC��S�9 H �A���j酚���%�gܲ$ե�)��׵G���.l�M<�I{Gr`�!~�V]�<��W�/)��[��/H�D��s8��}��	�y�F5��M\�?�9��)�T�/��/)lD9��kY��tS���������o�CAX���W.���ap������/)lق��eU	�������{�M[i�:��"« <u�C�+:��1~q�G��;�5��yt��G�����ø3�jLd>�CO�r/߹u��%vF�\ы����F	?���;�Y8c)C�N���W}7��\2�hI�zMB�3:^GI���"�8�?���&q���kO�[�=����bw^P�2yp���H�jU�WY���=ki%~3�"����]�<3��"�N���_O�ɺo�X�+�J^�-x-��J���F�>^��X�!06>hg�OD�%Ȼ�ĻNs|��}��)�A��/�`�K+��/��D��"����4v?�݉�×�@eN�~��pVV,�Qy�h���ӉY��V�B��8ɋܐCG���M���V�� t�`,�9@� �k8.��GW�~u�����.�[����]��à�‎?�E^]mm�"ʹє�$[^�4 ��
"F��{��+7$�u�i�l�N6/0#﫸-�?ʌ��+�iڳʌ�:���0G�c� ��d#��Q��^�����6��xD��R?�ph�{�]�1l��]�`�)>��f��+��Fₛ���ްA9i.�u�HŎm��ќ��+#���E~c��[Ģ�xPJ]�5��T��.[��v��fx������������aH'�4�mX�=S���l�Z�6AޮLg�B�T#�'m	E.1���
�lX����:ѨE(cǽ)�7H����]�&���tPt�|�lr����
���v]�>*�h�t�ў�s���S콏;���� c�-��վ]/�r�Sp��^�Gݫ�܌���XsJ���G^v��]߂
i����jT������ZF]����|͋n�87u���#��~Ǣ�r���oUQ^�Ź�VE}҆���j2J���׊��o9�Z�)����p�o��h7���D32
�f>x�@���)��EG�����	Ƹ���8�%©�H��<�x��u�hf�=����]K2G��7PT#�����+q��	��!����Y,��su�T{B_t5x�#����t�q���o���Ԓ]I�����x�;Q�[�Sė�Ur�����>E�D�K\�L��mYէ�4��8��ꦁ�M�pB#�)�_,�^D,�3�2�4Ǳs�@'x�K*Knx3��&�_^a���5tey�4'xVǩcbG�컪�F"�~�:io�N��H%��]Ui��\�����u+��Z����e������*�~���&xx^H�&�Ni�<��P��Κ�e�2Y�iu�\s@�Ӑ�5�����A�|�ȜU��	�m�@�%����hо�)`v"q8� m�V�W:U3��h<��&��^�Y�K�f�Ļ�2��J�����GLe�n1��'h-;8�	��A�Ӑ�&L��ޝh�ײ��*|D�txg�^�l��]R R�u�wU��%H;���u(���f�כ
<粸���<v{S`�`���k����l��b�ZL%�|ю��lj�(0���1��*��hc�7�A���m:&�۾w��f�c{;��3Ĳ�D	_�'��kA7#�%�ӞMխ��ڛ6xV�E��ne�fԮ$�Dǯ�.���-o|��bBI�|�o��o	���+t�`��m�ĭM��o�@Ѹ_q:�n
̛H�t`3�G
�.P.l�JS�zw�TI<�@�O����o@�N6kSX���ZM�;�]���&�וZ�hg�0|@�J)�����b�8�(ݳ��*p�mi��0��p��G�P`P�'�j�����(����0�A}!z�k{�������ޡ������pɊD�+p�%}~�H[P��%���ʝ,�12��� ��վy�t�r����\������!{��nJJ)��D�꽆h��J�=�긕7�fJ�y�[@��%�}S���Y��fI�6��!+-믦	�7��$ zFt6Ͷ��pT�mM'��;]��0���xX�
��n~'�X�	���}����Zr6æ�3(_a}�,��s�H\��|�+S.�:�),\J����c��W5(�ì��Й	�U���#�S7Z�Ƹ;�9g�Jzpe�m�����B�#�[���_����#�զ�ސJ�;g��ݐ�Y.�{�sjp�������4od�Y��_Ҡ߈�b-ǐ$��ī����R�vd�i|O[�*5���Ř���je����o�F��+x��a' �k���R��=Ι���B��a�`���Uw`0��!	O��Z���O�qS�������}s)���y�i��Iv�lOz��1�C���3O�1�&���ϋ��t�F���,B���t�C\~`?��t`�ڙ���Ζ	�-�t� ֦����le�������ᇓ��Ҧ��n�uZe����C�òz�z�[��9nl���V��꼉CwG��܌w���#���&��*SN��D�'[2��;���8قc�CZ��{U^K��n��mfJF�3��d��ÿ�>�|�٤ti���¿jP����pY��G �U��;��ړo:�,�K	��FLH��>w�ौ��pZ �wk=�B�4H�����bg!붙�+��&W!M�����2�mDw�2�@��S�0�c~�@n�F���4�0*k��x%�mꑸ�T�xO͔��#�X0���c8'}u�}̚S�R�W���K�#���"5��`4��cA��LM��g�-6%�}�۠�zQ�2L��u4i�:�+��"�ӉKsh�	f/�͡(1{4����-є�85t����r� �5x�뤨��>��0�4�Vh�7� �"���JIx��<kڟ�7�p:R6D���K!4��:	�=�c�շ�P�L����a�`̫�IL1�)�����#A�u�,өX�gz���	�WWa��MSNKc�^� !Y��a����"�I��ޝ32u=�nۃ�u�s�	q��c2qs���a0�Q�-t��]z�/�)*��bIV��i+�h�b*,�L=S�i���E�珿�O�E�>}_�ԟ���e�?�w�qX���:�I�긐n��F[ҤZ]��kjݙ/��>bI��i�͡ԓf��J\H��<z]P�O
�.�Dy2���j�u����3�![�%�:���[��aLd'HH��R�m���=I��GK���uZ�p(m\�%��}zf���h*0�q\{B��c���3;@��߰�W��WlJ�Z��*T����*ce�m3�)�l�y%ӭ�y����^.׏^*| �9,Q����h�30�`�!��D�Dh�g��6X��h���C�mu�G�_Ξ���;NXpQ����B.���]6�:�g�JLbl��AydS|��,�{۫CB�X��ݨ?�~������w�e�e��Cw>ɪ����m�U�2?a�3����,�Y;�Fڢ�?KCF��cl�j���~tu�a�)���e%&0�����0���|�	�۠��Z1��4�h��u�AG~u2o5�A � $:�o���e*��bkB�J��K{g`\"+ع_��w��ZThC,β�������8���cK��*36�
��*���,+�-�����0��w����P��g7��FH%t��#�(dK*)�B�S���A�ޥ	#��j��Bo��ovE�K-*����FM��M�Uf��P�_)�Z�n�I��/K��;��ߺ��FQ�Zw<�)�j�`0������N�!
´Mo\S�-��F݇���`��d	�ě��J[}<���Oz�iU�1@[�P���OM������#��n�<j��T�4Nb�K��qaX    ��Kq�e����qv3J�@2c])`��`k�%��o�B�t�QY�R���%�ʰ�߷k*��*eH)�5���<WGH�����J���O�̹;�< �c��u�f�~��ާK�T�6H\�l1�He�����/Q�r>*k�ܨ?kA�;-�/a������=�ב���m�9�G�r"�F��16�j����?��_��>���\���Q䏯T����"r��|t�7�a|��5F^��7��Z/����z��ȋ��_O��OV�'Pvk��t\��`F��Rɺ�o�|J�bq�+%֭�bXs��%Ƅcro�����/0g�߀������s�� ��Ϗ� xȥ)/л�^����,'Ww�j���ഺ�4zQ��N�:���ͯ5�/����*q"�� qS��;���:���B�z��{���`�v"�Km�)�v��_��D����Y^z 2I��΀�`��_sxW�ߗ�*��qKӉfޔR!~]KC�l���Wz���(o��rw���)�%�c���?��{���e9��9��/�t�����M�s���07�k
��BV��w*�3�%��������S:�6}ݏi	0U8/^��Щ���**���ʌь�;P�p��ԟ�W���$�k-c�G呰	��@M�#P�̦���~�	�%$S�Pd|.N��9)�:iu��������_:Ud��^�����{���5�)������@B{lu�t��4���1]ӂ��sهg�L9������[pM��mۘfv&Jq���H\s/̟2'V��%�t�j�/m���B5�����ղnOv��h�r�y7�f��G�٦�Nɟ���RyS�^Z�R5g��Л�f��3�/h�h��������B�aSFj���v�Q�k0鸧�l�dhPG��j���d�������sF1�V;�$�Х�n:+6J��/,�'<MZY���J��ۛ�]�/��!��˱��'���!���#SХm�<$\��g<���P�{��Ovex�)��6��)�>v[���zA-�;[�Ebh࿔EqL�F���˧<7����vr��vA��������%�6�0�]k4Ф�Lkj��@���X/y�Q܇w=��6ؤ=K
$]Μ���U�8.ư8��&�|�!@FV��a�@�W��tn�8��
��$�A愫����ve�a����������T�X�j\K��	�,7/�c����J�pV�"��V��הRnD�+��A�]� ��c�@��i�2�'����ƠonDȧ�`ة�4�X��a�x��^ �[I�}w@�k���U�Q����Af5��gI�W�O[[β�"r����	�V��@>�y�B�o�G/���쪫e|6.��ϜC��<.-Qx�G#ʲ�\VFS������p,����d^��͕*A
E;��6�x�fϪA�h�x�~&hρ�N#Sy2"L��Sܯ��ި+%!�Z�5@�:K-G��v��A�t=�J�֎��*�ATʖ�]��+�4���:�h�/��~ PKM��;���h��� �n�d%�lF:����5;�Aю<���F�}8PR�P�!��Ws�>�Hq��vJe����V��I�iE�}7�C\�gF�Ɗ���'CO���L�������,x���y]�+��������d��\�m\6���jJ�3���L�^�@�!�1jP�����Y{ŭlHL=��D �wn�O��Q"���)u輤�:�d� ��|�>���^��ދ�c5ae`m����c��.:�9 ��~5`(_�x�ozZ���XK.R�/�����g-�F6�6���)p��r"]�cO8�3�E���V E�!�(��V1��=�+����5���H;�G¯B�����|"^T$�2���(��6$FD��	�t�Gp�@���%��j
f�W�%@x��ZC��u�׉��x�o�'����;���}O�v�Q�K����6��S�/���:�Й7�?��j�I78A��8l���ym��Wot�K��Y�k��^�%���2!J0/f�H�u��J�
~DS'4C|9H������߀I6rX������0�ͥW]�\�^��(qJ"��@�Hk��d�T]�ͺk�;]�h����N��K��u��/� o1s:Ɖsky���+/�B����)v��Җ]_4/�;3&O���]M�_�=�f�_[�V�j�]��@�@����׎]r���)��5�ѹ�G5:�dB�r�e�[ב{��A�}��݂:���[Ѡ�;Z|�K�\���x�>��G)�w*t�pKSvL���Ua��������p+�_$Z�v��@�ʂ�γ<���-��7]T��1T%U��	G���1?"��?�pu/4�QB�%ڴ1�[g��}�W�/B�T������R*��W�w.!f�I-~��xZ'�)X������un6�u-P|��*%dދ&hIW�(��J�@3���)�|��k�|R�>$cr++��'�B��{ׯE*d|�c�X	�,�g(.C�����ax��U?��7Ի�^��}q��֯iP鈐,,J�{ǆ��j���|gj0�Ś�F1}�T�Y�����w^/����G�B���n
�d�Q;6"��"%N��2D���r��M��RG>_�!�R+�}Q��i�x��W�Ĝ�?�g�p;�l��pEE� T�..���6d;B��9e�6]vW&��G�Ji�'�W��9gX+(�i��?/��)IZ���������M��h� \+~�eX[���QU>���QH����n�	�����.��kj����^�k��r2.*P<l1�N����i�Z�5�WG�&)�+�d���*�_]���}�k0�-��)�� �ң�l�l���"����@��D�i�#��Y�G�?�~ވ�O[�L�Χ��w�_FXG�Z��h0�4�[$�)��d�K1���˽;�>nt����=�C^Ҡ.�����oO��BZ��ȕʃ!�����d#��=2���u����ל�1�Lؽqa��^У��M��ڙށk�+�_���{�A�g���	�ۢM��>�S|*9�o��@��p�O��le���	)���ԈW�CY�!u�t/�\W��N�J���$�mr��n=nac��ݎ}�#=1u�O���5�j�k84 ��u/q����/�t��v,q� uˍ�;mV�
�����I�������n�*D&0��"��
tc�n�x][���t������BG���:�m�D�f����X����ߏ��ev�<q)�)�"$�p�ܤԞ\�{�p��d-(�����BhWT�.|��s���ֳ�-��8؅��H!dJC'�!X_4ͯ��^���_~1?��o旟͇ �V6G�_"f�A�Z!��Κ*:�=��A�Ei���yC,��m���ApL��0����ǜ�U�Ͱ=Bd��}�4�6�r#K{���_̇ ����㏿7�]2s)I��ti���mE��MjdK��*���[HJ&�5x�T���(�x`�����`���`�?��n*��o�xp����(Vx�P;~N��*��o?�h~��]%��3�T�{:b�zң>D��ߏ�o�$�sc�Wr�����[�p������]�1/�CVk�G'��?|k�4L�p�t�z����eV�d�*������n��ۯJ �F.Y�Q����|��҇��鴯u���:���0�A|�Gd�7mW:�k�}�2�@��'-��Pi9��c)�:~��?��ߖF.}�Q�M����PIZP��ä=:a%D�9戏6�L��,��#J��n:������?CqzSG�����������m�M#�%`zmu ]�q)��!����ε�6K/����o���wP�_�����wQ}�LN5�TS���E���4���Nd�(td��Ul��I*9��E��9���T�FI�V� �ך��w4���ጹX�}�)�&�����N���]wm��*�ؓ2��@��M�#�z?�� ��V���3*P�L�!�ÚesA$�*�4xd��/�	�>�0���o�ApQ�^���g�U>����    iۣ�N�Z�i�z�����kUL+L�5�6Z*�	�hs�^�"��B�9����D���
߀�#r�cW2�I�������K�N��nugr��e�8+V醋 *��m:�,�I�{Ί�>`\j���]+�V�P-[�_���V�V�Ф���(�z3��kU����L��9>��N��y��X�9��=V���G��!�N� ��)���H�ĦrW�>= ~|C���Z �@n�Lpg��>����f5�c9�.G	�$��%-7S*��;�: Q�/�0H�\��m��-���`�΃��5���@�x��>�b2Q��&�&T8���-���i|�������H���WZ�I�b�yi9����s�6X�z��Q�KL��P6��\#�^}|$��F�vAQ�"��Gۻn�m���F-��l����8��R@��^��ǳ��ޯ���j��ڟ�ˊ���xiX��f!�c��:��aP]�b��N��Sn���D���ڒ`����2��O�� ��o��d���eE�p6� �PT�{�A�L:zT�3R]6�"�>2"b������~҆�S:Q�2��WJj:n��2eaZ���w������{r�"^�z���,&��R�����
�t�Q˨ч��'r�n�\+KHn��AB>r)���EQ!��ESz)��ڇ�~ڽN+��0n���(9
�ZA��[8��Һ"L�P�j��ͨ��0f����� �!j��6�u��yu��$u�;.D. Q��Q���-��8�#����
^�� Wf�>��1C�:�R����N�!���I��$���~�A�yaZ���,CʫW�QJ�7��n�L�3��xI��.N�ޫ���g:���e9
��
�z��,���M�y˰c���/�&&���I	a5A�m-�X��U�s�`V���ظ�M�	��d���E~xyX����%��v�H�E�σF��=���ӹe��l�����nJ�+&��n
�*+2�iA���.�0d^�+&��ZT�>��K�_]�i_rS�M��oN�Xk���i�v�fI8z�2֍��d�ŁW�62E?����xx���i��ⴴ"�iAڅ�v��L�bI�R퐏~tؠ-��ٳA2�Jv���>-���� �ܼOK�D�k)6ɱ}�79Ι� M��d�:l��h$2��#ۏ��]���`ҋYF�8֞te�^�Liep�r���H�^�1҆⛙Vh�p�*B K@8����v�P��WWaVV��v��l�_���Ǯ7�*q<b�x��rfס�!�q1�o��Sn���f���Yc��ٯ��}\͋+�_����GY���!l�Ԩ�"�tk�D�N�k���O��~3q�X�����=��Ȼ�~石ښ�Ȇc�7�9�ۄ�u=_�n2�@����Jw:(�2����ؽIAҔ6\G7�"�4��X�/$мe�|���jJ3 KF�Y�u�)m �(�k��GK�5R|1���E4���j��ݦ��B���-���]�Ϸ��s�K6��d�f6̈r�r���=v�\ܣ���1鐔~��o�|T�RJ!?p��wu���lt�k}�Δ�Y��Mo����"9L��/� �x?��/��ߟ0w�^�d��O���QDzu$A�!��ʐ���G&���zU�3r�L�T1���!����G������u�>���;)��DG�ėBe�|��'����5[L��`(��b٧�B~��̊�,N ���ꎦV�]]�Q��=_�����b��8D��x�q�f饾q�ͧU ����Wx��޴y܊���/ZzZ|C��"~tvU`KF���Mx��i��xj����.�)�C�
w:�5t�g�@����}�oY`�݀����04���hk�����m=�9��YoXD(��|�Y!��	Ƅ���%"�����+�d��<$97�W����O��Ǧ�nC��@Q���^x��bq�E�v:H�� �a[� ���ҭ��&9�9���|�Hq�ޔ���x���6D�[�IM��EoظȂ��7���Xl�Q�Ϯ��_�|u�uubY�\'�W�N�����$9Bg��ʌ��c}A2{���O[X'���
���1Y�G(��и�S;��c�n�*�fÕ�va o���P
��P8t��f��`;�L�-�a9�Ն|�%t������,��f���ޚ��OQq�0��#�f�JŽɞT��o��KT�$�G7�\5�������>�R7�C��W6�y\q�F%�I�Mg�&U&���F��^�'��ue,)Y���!��G���?B^�j���Elɣ�G ���M�Ȇc#�7�-������`��]���M�8J�,p.
���Ykוbl�n|Χ�`ֹ��[�%������WD���6�%���$5���z��KTV+6�K-B	��,��3��;�>�� ��fZXvH;�� �� ��=v�\*w��� d9{��}3�?k�W@.�i���;�q��Эs���%�b:�n�qzG�
:7R"B��R�e\��ۇ? Dk���O�AD�$�R�Ժ��'@2lq��H��}Q�� y<[�^KL����$˽$�����9��Nf����K�[������yP�j���`r�dbLoJ�d͖����G?#d91|���+5��E�8tl�ɭu����W/&�OAV�6]eZOθ�����,�t'���{c����R�@h!Y�]��E򾮲7l0qM�3�޺޼a�=G�5�B�_o�p�3�O�d}�l0���b�Ʉ�Z�q�uU�Kh����$�<c��S����h�w��ӂѼYbW��%���Q�$p�Hrq~$��u�MO��b�f
l|έ��%p~����{�y� l��J]tO�gehd�o�r�5�b�}��NV�@���ȱQ����X9��,���0�풣�@���^�]�v���Ό�r�RDL�������VF/�x��? ��4���}5�_�ɸ�8gN�&8k�14#S��s�B��R�{$��r:�]�F�� o!J:v
�
�z3!a5����QZ7��C��`���&�s�F}����Nˊ�ЃV.�þ��QX����a�t��bY;�O�Am#L��pe�j�<��ϸ�O�ω|>oN��0&�^w�����ry�QZ�u�(�j�A�dt=.ޒG�繇7�9ϚH��^�����P_8��{�/�t,v��$v�`�E2q����h3���7��P�7p�D�QX��MZH�3|<z��K�JQ=�>�X� -rS��Isu�+���w�������/4�':Č���p���%�r��]����" �W���I�B��=��7Ľ.�Ɛl�wBNw'�<gga�ƴ��DKCf��Q�P#J~g�L�F/�gK�^�5���ܽے$9�%�\��D!`��bު����R�]S�ݳ�Ԃ��;3$�K���y�"�=2�"���/�R���3�ޠz� F�	gh��˩4;��8�5�|`�f�7�`֬�t@lG��0�)1l>\�3��{�Bd�5]4v	�+��{0��5j���|8K
�o�ڃ��=7�+t���C����b�-�CK�5�;3ZƮ,~�T�-�ѕ���=�=���ͼ>���µդCg��u?�:����^y>D�:'�����_,�X3z+~`�}Њ�,e��`I~4���$5,/�;���֩�%gߝJ.E�V��eh+Z��N,�^�+�d;��[9����3x�sS�q�l�N8ҎF&R�
B�w�IY2�܉R��>M-*f�1�J�#��G}�k�=y����r�G�GZ���n̳\,�d��e7s|��]��N�8�LQz)��^b�#?7������K�1D.ȶ��ö��ic�Ӿ���s�e�9Β�`�a�Uo�ū�T��F�����:��V��j�K�v�Z��ta�k��EtPb״�..Ք�tդ���i"t���Ł�(4���{����Ϗ�;~����V�cu&z��D	��Q_�6d,PRΈ�!���2���߻Y���j3��匈��2�kJBÖ�@Lx�d���d��s9k	�m���h������[g\�������L    ������~���}���P)n2��d���V2��G�A�,ōG�{�]��Q�W{�H<��w֠�𵺨��������
�lu�O�kP�X�z���YsP=� ��ͦm��'U��X���
3�'ǎlX״�X�z��$��<&8�3�lL�s��ܮ�,��Knӵ8 (����sN�ji+���#&��� 'Hz�l�0��	��=$��6���`�{�Vڱ�:t��n��(.�V�)�Õ�OUaR0=����X��3췉`ZO��Vq�6a#��e�U��&�S{�B�֧fR�M���*�����K���cE�=����i7GPt �K���9�MQvM� Kw�dwGz��/u�L�aMl&��,����j����G"�����g�e�����4�{P���䲬��bv�*ju�%N��d�8�O�E����H��s{f�XOfX��)pae��Yް�w�=����IcQk������ſ�{~��Dp=a��SG��G>�Î��n��pb�,�hC��U�0�Qnu��.Ź�����u�֘��s��m.� CKԈv�|�ɒ������]n�!�R��
[Tm$ؑ/�a߰4S�z�Ę�d�Iery���L+{�BZ�@
	`�C��Ěz�4N������=�v\��ټ���0��)���:"�!��x�<uɦٹ
❭�!wX������<������fU	�l�5���F��5�>Mh�օ�wZQ�����5��^zlsN�O����MG2�>��6�@P` ��cEE�K$d���$;���k(��@��`�.��sX\z^U{�jֿ���� �&��f:� ����Ӷק��|�^cq	i`�rgM�qq���s��Ẽ�����3m�����n�A9 �t�,�΢���K÷��V���l�O��Q�=p�K����6�:D+b��ό"�����3��P|�r&�S�M�S``�v*��&R�����F=���-�0�J�S�1\�jA��P��ckJ�2J@�R5���?��T���D�Q�uk s�#zY;��wt�+�mZ�V�v��U�>G/i'�_F�א4�E��3�`�]�7SI��I�?���Za6�=�qe�p��T���t��Z�#��-�>�� AV\�#�R��MO؆�$��챧g���H���F�֧�.����@�=�}�����Brc�z�1M���Dk���|E�_"��#f�x"��������S�0ӎ���]����Q���!foL��U�v�ñ��%�Q��7�o���O��{�E�z�G�b��[� ��Vq+9����q1������2Ŕ�����G(�,׃`R���6� ��;2h��G(�A���땬��9x�6���^�6�&��%`H�6k�V��iX)�{�[��Y��ه�\�i�w1o;=��aO��w�y����*ov����Hb+W=�y^
��]��� A݀1m�-�@E�i{V�L0��x�R1q{��R�B��7��;�,F?#��T��=�6���͊�d��H�������^x���@�1�vxw)���z���t��=\./��R��T���U����ZOFUIu{�mFv�$q7w="�2��,�\A�H�� ��qF�ϋ����E�+@�������(e,~�;F��ǃ ��y���se�rK:v]	�f����;����#��y�f}�Œ�$�:9�U��ܣYu��6;+I��!IF�YT���|S���,�g�#�os�:k��/m��= ���*M�|D�߹K��	%���F��L�]�3�<�Q+�矿��LPEO�؃ �����[��%����K�=M��jIE�|�<o#����Y�d:��M*<_�*k-6��2s~�6Hޥe�|P$��M�5p)�/�WH�&���n�j9՜�9P-?���l6!�}$�GY^K�X�]3�vU��@{�
k�<2֨���b�+ֱ#[i���By����CQA-��%�"Cn#^;�	�%j6��}dj��C���< 1͊s����2��-�ץ%z/~s�J���!���D�/w��l'�%�)uL���/6��jI�q��!<z���\��_�:��D;��iD�r�� �pI&�lt�v�D3lG��a���J|�S��+������= "!	�y_���1���2�5.�1�u#E��.��5Y9(z�#ih\IC�&��ܘh������F�Z�X��s�Cl	�`�uVB k�4���eq��BwL�j�2#� ��0�:�KEwh�z݃�s�{�`h5O��k>���g�T��1&�/��>T���l\*驽b��q���S�U�g[�b���c���>�7kV�6���v� AK>�=����4[+�È&��[a/��f��g�������B	��_�����d8.J\�g�8�lZ�%�H�xm������_G��X�a#v��i�	�؈�t��c��?�)�M
Y��Un��� c���ѭ=HKy/%��`�|�}�؛���;v��9�9�X=v)��a�����f�Ǝ}^�G$�c�j��ƅ��ɐ�E,��1�h�@ptm[�?�����q��m������/o� ?� C8�k�C|:~�O?5�p^PǮ�H5���k��G}���_~y�;0�o�=%5�C~+.�S��^�����2��E��a?��9��2�?�n���<R^RЁ�]c��x�dTk����w�x��Z�!�j���n��ΜY����>�7]RS��b�5-�\dLiۇ��q	΋���\�ώ�N|�D<6��NE��j>߃���7ZS�U�ǩ"�.yA�%�Zfn!�!;�(+yC�6���F2��YuV�G{E�����&�n�9`M�ԵU�6j[<���e��3ؽLp�{n1f���הLÛޙ��Ķo�$�GZ��H�Cޣ�I� �G���^� tH)	��N ��P$#M���=�G&��ҨdO[0>m�_���	�I�M�����ؑ_�8��|��!�a�{_�����b��ϥ��0l5�r3%�Y9��d���5튠�#Zq7h�����V_�H�����S=�s��5�'��ҿF�I����h#���M��1�<�]RJ�����Զ���w&�i�g+��>��m���j<pƩ
�Q��N��SޮU��촅HI�s�'A;m�y$ZH ���g�IR5HC�r�(�[3G�b��>��#G���݃��ڼQ��0_�],:��g�L	� ��=�z�I������֬��+v�?�(<��݃���3�/�ڻ��T��v5a��z�] �Y�5mѰH��/M��i���#\�@�7ϵ<�x��i'��H�QX�(�4Y�~�Lg[�#q�|8���V�i�LK��v���B����*�B{	R
r���4]�}�0�a�{HM#��?0�Y W��d{�x��?`@wrZ$'r;��uB]�"�Á}`����t	)	�}����:|s�z��KٓH�6�c��њ���X{����X�����LjH������0{�~�����:���b��&OiG�CM��"1�����S�F?\f	�y�Oo�[��:ε���$%��Is�d���L�5 ��Y��'g�d�q	�|��u�V�ZԆ�Ə��ך3n(o.�<L��>���u��S���v^U�e�gT(�>�$����EP�s]�m1䡣>.̰E;�"�:��\;�`�%���Q�G��������1Z�܊�������m"h=��q���Q�K�Q��	A���х�G�\JMk>IG�iaV�����֖�C9�?����DP��bm�F�ذ�mtv����dxGJs�^�#�)؈��\���t<IrǓ�7�J�`�N�]se..��6�,?�Ǫ	'
�N�b�
����6�J��]���H�?��K�Y�����߇��6�q�<!�y�1���-�)��L��HTe�*Eor�qxD1�>��cC=�цz͡e��?a���k��M�0�b�!���#;	9�r8��FV�ftf�98���\"m�i"    ����B�&����>4m��p�y��,q�5�Xљ-RC*a��h|�����׆l�VD�Q̞�k>��h횈	IMz�*��Q�G��N�c�xS|)&M��X��7G�W��]��_����o��Q��<�7�Xǫ�縷(jkəX�+K5!����&�9H��%ݠ;���Ȑ�:۔��Aեe��\ɭ��!>Uuv��Z�>����s6R]Ś�ô���3#z؎oA�GiO(���
m/ȸ�l7�`�2N��ڍk�z�%�ARc>�9�������R�~0�&=��a����ճ�z������=�j$P�'o��n`�y�x���e�ۮ��Bݞ��ZL�^6�p?�!��{�`f�XK���8��j�����p��*�� �3�cq�"�)��6����/Vŗv�w>i�=J*�8k��&�tL�۪��0c-�y�����Mo،$��cG4ԝFd$;d�������܃L�e��E��*9S��"	���V�~@Sq ��{�t�y��_iװ�v?�I���S�N�y�ne�қC�t�)=EӧO�(���p�·���*���pޭ!.0�P$UݢJlv�n)Y;�-z���L3��Tt��
=��?=�����S[U<T�d'����9�vH�)�)�����������>�c�&�h���*�Ց���6���@�'E�$n:,TG���x�)��	�Q�X~�ܨ��b���u�"�!f��U�|����Epd=����a�ñF���� ��]��-N� Ǡ�z��>,��d���^\ks��B���p��
�,�}:y~��/]�ֆr���&o����2��P�_&҉��`�&�*��L��o��_����AV�R����*�)#y��9H�=t�GG[�G�4����&�R�H����n;�ty�P��:�xP���v��M#G8��ӆ6�kϿBa��]j�'��ƌ��a�)g)�rxǏ����w��ZTE�'=��M7�3�M�p�0�X�9�=[$U��vo�aM� 0]+ޔ���zf�~�㟿8����`�m	�hh�������hhh#o8::�{u��34a��F��AI^G�)��'>����_�-��S�W�-�c`��|ڣ©��'l�=��Ƿ�|+�bUqx�h&��`���D��q&p<�d�����������;wl�8����+��{ 62�;\���5�f�a���o|�A�����a��l�T�?�a���}��a�e^Jh���c�����#�0ߦ�#�#?����������?��� �sO}��l������J��ć�ʼEi��J�ij����	�L�X<|H���Y�;b��w�c����غo��*`��Z����¦�c��aoK!��V���-Ӫ�9H�.Y3H�����Y_T�6��F=����{3g<�JB���[dCO�K�2��ü��U�[Ι�^������95=+�H���8���S�����������_���(���������_���������B��;>�L+$�� ��O�מ��exjܸBﱣ`�E[t�9��'�g�l������z\��<L�[�'X�:w�gb�:���^ZޅHvY�9&���MΌu��-�Q�Sz�����?�����}o��o���QKK���t4���։U�b;0�jp�-�8�$*%�_�IIU�
϶�|b���:l��?������������v嵤�x���sH���v�#$lK���,I�k5��s�Ҭ�Q�B��۷?���[�K�	�/����4zs�'-d�IryxB[u���H��v�&�&ǒMtRDz#��Y����_�{y`W�Z�M�GP�Y�����A���:��@�ަ]-��@�`5^���5�l��m��=��Wh�x��n�?@�vv[�_�2?�D��6�.!IѷN����wd���5���΀�������Z屫N�yW���q ��g�ٙ��#$���4M;V�._m��u�|����+��6)!��������h�'��ocM32��A�YX`R j쒿~UE��l���g"i	x�˃����޻R�W��U`,> dPJ}��^��!��j6�Z�FR��]��'Gv�A��v�{�=���f,��}��5�aW��dc+.<����_~���{�.)�;����p���#��B��ǰ7[M�*��J��_5�'F(���ן5Q�Ւk}OYBwm^�B�P�y���k�¢�F��)>";�w;3�{�dq ��o���?��x88�o�_m�/?����pb��Vo�_��H�*e���SsT
��8�jgU�:��Ga�V�����9&�\Xx���5[����脁`����'��b�KP���!�D1��u���9���o��K�0[�w#�`g�FF��2�ڋ�sz?��������m��6[ch�W2"�c�}�#'W�=�8��XQ)�,mb�|�?�<�6o�xZb;:�N����-csꀢS�ĀEu#4�Q�o�����߲�[���X˔4�q���.Gڴ���m�MA�i���Å��z�_Sgys\z�x_-�O���@_pi�;�����.�D�y�����|��K=�_��kJ���7�;aY�UX�9e���q�T��1���t�������֗ڃ�){�D�� ��ر5'vj�6��̱eM0^��Wfc��ݳO؉%�*�N�3�o�����ʍH��n�뎚�.y���rH?W#�q����|�d�&[G���#a�ኻY�\xW����͙+}���3��#~���o��/�~�����O?|��_nYm�Y[�B�qsJ��0i��-ڏO�R]8-ʪ��k�X�R�T�����9��Vɺ�٧�r��G̾;?f1���9S	��|�v���J�
c+f~/�%ۃ�d��$�
q1����x�'2��)�9G���0G�?������BBkS"�[�����`$WX
: ��HNgKR�V�ԹՐ�-��j��s½��5�iHT�Ԇ���T���B�X��S���a�\z�Y���)sCdp�0��,�m��;����AÃ�z�E�3΅δ�[�����?�|���2Z��)�ʐ����Lr3���ߐG��M��"�!p07'6���9NmW�׮�vC ��=����.�2o���'.�3�=��7%�N�4�ֱ���l�����cD�+BDV]$�4Y���$%|�Z�|b�#�ݮ�0҆K�L*ކ�ϔBQ�����^���d�ð�5�I]pg�o���i]Zs3۴%�$:��)o�;|�~VL@xsK�j�ǂ�CǱa�M�H��!U	5�n�;/�Q��#i�J�X�6M�QPӇ�&1?�� ��&�o�����������¾sek��7e��MO�����*B0"*?a)�S��@��2�rn�?�@��k�������}E�'�ԥ�E��k�/�A�G���k%n�w�f��/g⨫2$���4�~ZI2�xf���T�[�Эu�2'�U�,�|�wV�>�����Y�L�6�lu�Z��p�~��c�v������x�f�|k���lU�.x���	����)4����g���+U�?���?��w?��<��l�����4Z>$iϹ�{jX��-�B�v�X�gʂȑu���e�0�y�$T����5A��:��@����v�K��\��_~��_���鏸�5�o�BN�F:DvK�� u�����98�t�GF�E8LnQ�}C��k��y7{ >L�+�KV���:�<�췡��w���罀��`�5w�kb�[��4l����U܈��b��� $�*��N�͉�]�uoDe�=���P���)�_��5�^��m�"��N�W�B�
��=b��%l��A�j 1aN*�@�֨�
%��q�d ��X>AI~	9?v�\ܨf��9"Rbm�s���5����r����˟����ˮ¯Y��܅#/9d&ދ��E��q�Z�g6"ؗ�̈́(G�|��MWb3���Y�7Վdb���m��oɻ��Q;��/�sT>C�w    Cyږd[IO�ė��@
(�����'���Cy��KB���f��v�2/�;��(O���#Zk��������s�2�K���'�N��{��u��!�����*'$�-���եF�hT��l$b�:�����kQ�-yoPF-d��>���מ)^ǺF�4����#¬�:,^Tc�k'@�Va��A��>(=-I�d�a�IP��:3�֘�(�Q3%&2S��[��S�uM+��np\g���-��q�EG9����I֕��9�hZE�kU9�۔)i�k[��?�_���Y���~�f���l��P��>9�
�h�m ���1Ԗ;�w��b���^�d5��"p΍s+�}z3�]A���cm�)y�c��wNڌa�8s��kSc�-�L���QO��ײ�'��~1��CV%o������;��:86\��a �Si(�ԃ���K�~��?��Zۡ�����MDi���3(�]�ip�	Y�lTJ�`u�Kl5�l�8��t^�ֵ@�SX�H��-��qtKb��]eK��k������g7�GmA�:�����[ҮPڻ�2�=Ｉ��9�~�
]�,����x���d�L?�|щ�>��]��ϑe�i�D�u�/�fǯp�ʎV��aW�J�5%��l1��@�v�b�i��H�%:~����L��B�"��4�&r��$�Ek������*R�m�� ���Q���J.����|S=���WJ*d���i��ϔu��G�+Ibڠ��ưd'.\��C>�C�aJ�:�|��'�4=�Z>�#�-���g���nG�<����'�H����;���\RT�ۏ��g��0|&ڹ�:V����X>�����z�IU�؆1k����Qm�ڤE�Np��p ��$�r��
fؑJ:e�$�p*yҎ,��a%���V�����'�}o/������٨����6�,�)�m�s� ��*x�c����x8U�F)UU��7�F�QH��!���,~E�e+s�kC�5�4�Y܆Y��$���]�o���*QV��ʉ��JU=�����;��}M���͈�7��<��-ɱ�}���~)��,VCU���7
m��.#���3�X�����?{�*�vaK~C(�|0�/����>�*��fy1&�Q�����X��M�)�iۜp���X����׿���������������u������k���z�����x�֭2��a%6�=��z�s)Y�����Ϲ�,_+����u���B��(���f�o�+V�k��S���`��1� ��v��at�U4~�[Pf�J3�Z�����-U���Rqң��y'ѵ���A�&k��=!�!��F%�d|�GFr��ç^J�x_��um�����v��ϩIu�.g�a��jG�r�]2�}���,��ل�������
ۗD[���QI�V����A�8|�$�2u�s��$H��FnY���g��0��)�֜g����~;��I����л�:�ʩ
�ˌHB�yH 'k������=�F���ۄ�}iC<��͑�I�6%�2� � �U��[��ZJR_�a��/������z@��ʎb�U_l���˂jX1��a:S���J!�f]t�]�M�i=�&��ĬKfqM���j��>��׺���� ����(��>�H���<fx��:��I��H.H ��)��t?��3 1�ϻ�d����7Rjo�`����(Ax�&���^p�a�����e�EnBA��Vv=Oƭl��z�^Z�ǰ{�r�2ϥ�}�#�� m�	0ˌ@/=\�]�m"JT�#�O}�I�������k�DkqW׏E@��,�;N:+q���h��S=���(�H�s�	�a�j*���eC	9#�P���|�.dg}��0�1%(ŋT�?�a�i��������ΕG�o^ݩ�ɣN®��JL!yw��D�R�<^����;<�5��}�s���܌wmF��1���A|�������V�f/i�DX9	��i��yf�E�cS�F2!:����o���2R���De]�q�fm�
�����8�{Ñ��A�ם�GB!{�Nw����	�6��2MN��4�ئ�կ�տ�!3O��O�%�l\X`�~�
7�>uӂUZ��`1�S"̞������#n8��N �.�I=�6_ی?����5�Ǖ4K�1��R���g :[}	��=6Y@Q#n�UNH��;���,�@Zu�?�&�J�Q#���x�O��v(��FZ��V�K&��;L=��&��zD���M =iF׷��_2�|!gx#��Ǌ���:�k���p OErp���O*�	�'N&�J��YT
<�S����G�ߛ_~�����
�y��b���ê����x�n��C���~�r�!u�b�k�n���.J�6�i�@�a���f���.�՗��鎪l�V�U֩�]�<Z$�3�w�w�Џo�s�bZ��ѩ��L�-��
��kjZ�H��5�>6j�Ʊ�����SZ�0�2�=Ok��sC�$� ���|�>[��^]dvy����a��������A$�v�ۂ,�Oa~�
�<�a�[��H�.�����wF��bcd:.qLV�Y�`�Np��m��Kortx(�:=���6�2�𧜲��sߓ��H���d-x�q��j&َ��'z����K��p���;oF1/	)w�N.1<�bi��0�LS$z��@�����\b�M�8;X�
~�5���CO!�\�b���t���;���FQ��3ح�x���lC�dVe%��C-�"@ETOZ�;�ح[��t�![A|D�g�L.=T���Y�/��م�e�[��,��D�'^�4"�+��v�S�����HR�OT��0��%���OZ��Bv??�I���"�8෪��������d��|Lt���|O���k"�w���S��M�y39��(̑���s6[_wڛ5yF,e���v��cw�0ߵ"�f�^��A�Q6��-�W��n�\`��o�׭g�"ދ�a���H8��)�#�2L	�������M��s�\R~ç��{�v^�,�Ύ�e���'1������hzGd*zl2�5ba�kI�?���w�k�Ӣk��!�ƅ2aw�nȥj���ΕY��u�����ʌ�2'�Bs�k��W=�9q1=�ꥻ?8`�$f ��.RW_�:�l_�Ii!�,��=OJC8k�?���rBy`]�.B�o�v����g ��ͫ�7���]�>,�Y>��)�)��D���k� f�V��:��e�ׄ]V��{;Cf1�����W��n��<Ih	1f�X;Ӄ�ސ+X|�9�3�ElS�������{#��j�8j/����:BKnN7_���4@]��E��1�+��
�G��;
a��c��]��:����n�z��2`��҈ծ�`�j����"p� ��� ��K%�'�/[=�#�bIkQ��ӛM�&�v�Nڲ�:.�,.o �y��vUʖ���/qJVH�iG0���>=H$6$��s�1叹[��c�t�zI������X➄�V����w����a�ղv�T�V#'&�HN{�%�ը��]6�����N72`��_A��gm /^9u5Y/�z|Qd���6e�6�`զq=�HӚH���rK����tw��(�rCJ"��%Vt�X�*L�Mz��l#��0����X�wv�o�g�\�ʸ*X:݉j4c�䵹�#w$���x��':�+�S�#���5s�])��[J���>�7����p�uD��F��5JְS�	ȣc	FaT�:
�Z3�34�'�>���6���A�w��d"��#�@�"nr�ֿ&�����;�����\�$�6��Ye=�� �)r/��O@�~F�h�%!���Oѵn�3�krRA��x��U�,����P��PQ����ި�瑊�V���6'����7�*��Jw����t���.<��*kWmF�{e�U�?��U�6yLK�y4�G�	G�Ǚ��FB�]7��h�����8t��H}�<��������d��^�RQi\3    ��oT�X$��4<��_��<����p@#,H}����"��ZM�Δt��⮭5����n�Ku?m+4�b���M�i8DTX�gU��h$�i"�Ln����q&����S�j��t^�)�K�}���J����J������~\�w�)��Jt]YW�����-��Ȭk7����c�K������l�>���1�������5����ډ����@Y���p�1N#)��e�����.�Bys �H$�-�<i�J���jp�a|��*�'���K-���n���|��=Y8���+��б#
#�7c�.*�Ϣq����h�]�
�]�r?rMʍ��2�F)-�[	��DL�)gq6��+>9��:�Y8��E�P�kVz��Z`T��X6q�\��͡K$g�T��CqR�v�v�%T�m8��MV
�>	�VR�k��E�ko�B�tе��I=h"���������G��\s+Q�|�������ŝok��F+6*�B��*	^����,2`�4����:��ɭ�pv��r]+�G��~	�+��U
VRf.^�����^�R��8�%�dϖ�D
Z��եh��m$	�m'�r
�#ݐ�����Pn�_T息k��w~������Ѕ�Ѥ�DPi���Wи$E�����[9ۑ�I,��9�4���G=2y�~3���ZD�^�<~r�W�ri�0�l]'9����p���jʆ�����T=�淟EQw�1t�ƞ�,�4+�gwT,l�֣ZS簚�7�#n���Ѹ����vq�v�h���
)�����:�R=֊�NX�Ϙ��7g�
Z�5��u��j�<��V�����&8e܍�n�V1�1��x�y1�Ҙ�D� pّ5%�P��T�:��X�oEX���|Uړ6�p�xg���>�	�$��Q��r��^��":�9q	�~�j�i\�	�����#�-�C�-���r�x�w����������I$G��N��#%o�ga��hN���jU�Rt�7"/�|��m��X�r��g6|p�����^]n?�z��[�h�`���>�ss�;!U%�xQ	�;���l�??�_�6�%fw�&�����8y��}ËH�Q�`��ǩ����u�}�*�Þ�R��7zKlU�bf���\��{ ����^�-.:�ys4x���-Nk��ZU�E���j��WX�� .U.��-�$$�t��IH�9h�U��\|j���hi��Z����e�<(���@��>9�
�A,p�JpM6��r'��xV��ip�ڸǒ��F:���6�v���%����2����������Io�k5����!ف\d�d0��6����@��܅������
I#�Hˡj�fŞ(E�Ȭ=�_R�����z�D�t��~Av���κOh{�Y�X��=*iEM/�k1��kY����n�/���񪽂��1�t�V�&��8W6�j+�-�Z��(���шK�0'�M,$��$93�$�p�5$���g������,���U�"�D���8U!�������g�3$|��Ϗ��y<��F��.�5- pr�i3N���q��u�V�kh<�Q��1�?XZp�"g�ܧ�Q�RI��T���qT#g< N����ڀP\H���8�%���|݂�H�͎v�n��w��\��7k�[ؽ�����uEEer�LI�5PՍ�5�����|t�"5�v�%�W㨻��+�z��Ӓ�h��9�z��rQ%v2���K�%ٿZ�:n�{+
F�L^H����R$�hF��Cf=��u�����|$uoq-�ȋ��e��Z�b J����ֶ1����۔j��H�BD̷Ɓ삔�|&�$*���P�]���J�Tl������V�(ӻ��"*š�����@N
h���FJo�U.�*\
�q����נ�(��������8��G�H��te=�kJ�_K(�Kjğ����ͨ��}�n�؆�+�IO�|@�1�4�|�+��k��R��7"-�CJ�m�JaJTL΢��Ne�j��ѽM��|H{�FJ��}:��:)���4uol ����.5l��|����2�m�>���������QlgF�6O���4�
�PCYX_mU{*�[/N\e"��|�4�oخM�A�{+�g����e�'�/J�~s4��%8:[�If��Q�aB��ޚ�ւ��>`I>�b~%s�KI�m1�\Rſ��r�EwEX��eHF��Z��E�po�F\ز��rZ��-O��9��x@(�� ��5�!��uQ�!��Lr]Ҩ2kL	��aN��P���3�;��6f9I��C����lP��Jc���0ؒ0S���5�y�Z\�Q�k��Y�qQ���r:cY�B�H�V�1���6?t�e�2]KX��Z!�R����=�����C�M�k�iHf��l%P=I��6�cl�ѵ#�#�QÈQ�>b����۟��-~�5�k�2*G�kZ�#�ʿ i��W�eA��hO;[S�i����!5qV�|i�+9JT�i������?ѽi=�
�~��x6K7�uf�N�34=���u�~Hu��O��0^~g���BV5�$���ۧt�x܍��xG�������9�Y�!@�{�="@�aO$v�TO��n�;�x��#���['��ϡ�:U�_���%N�|n�a���"����б���!��5#��M���h��� \�h[���֝��5�����#��V����P	d|�M��(�E�U	.r����k2�q7G<t
��x դ�e�Uˎ��jfgr�R�J��)x܍��Ļ�q]�ag�>��h /ʒ����K�N��O��n��xU8u9_��M���W�@��!����hId��?�F��- #�O���x��H5�VTU;X$��oK)���_�z���h������U��Gm�4��0�ZE�̃|	X�q
w��|ă����#��G�sq	kX�~�6�L�G�Tb.�<�F��GTQ:���Ix�ֹ���E"&��RÔI>i����x�BL1\�^�rk�Juٱ�+�ug6kBXW��:���<��������N�2������ԟ:�{��tU�rj:�5?�{�ϙ�%�Oa��U@�Dm��7eBfz�P�{O�c�v����ݒ�_�ޞ1�n(9��gCC:'�sp'��5?�{��9,�q���<�^|�6;�f��$����z�+o9�d��m<����)?g^$Fw�v�����%��k񡻷�@�ͽ�D�0��'�x����@I�W�����tP��2`��k}��:��s�s�Z��BF�w=B�I�v��-�O�~��B��L��>	��)z�E�ԃ-�$�)������i����?X����|2'JmV��(gL��k����:�� rog�����|�J'�#ܺ�ԭ��x� ��Άu��k��N	��3B���!��Z������������R�X_m��7�� ��CBREk�R\X�6F�Jn��R�L����#��K^�Wื3BRʌ�B8_�~ �զc�͌�a�ǚ��f9�`��!!����h�Gp X����X�����L="]q��n[��q�7��SBR⌄w���{Z�[�$� ��:
]M�%�=�7�l���]X?��1!����t]�c��j3U/�;��E6q���9���N�	I�4$$'��!5�I���Q��M�\k����Yݧ�x�ӃBR./���Ya=�ِ�ǌ����p�jkIR� ���BR:��r���!}piQ�y��p��2n��!�G�'9��;*$���l��q4�n�>T-�F23�`Y��v����B�a+K��;�0VCY�
�:~cj@Z�]�����������k0G��lr ����������Ì�T;�zX��;=-$��9r��Swm���p�`-�K��D;z�� �v\H:�Õ+�#�*�XGU��}I�Er�Ξ{>�`�y:�S��x!ě��V<-O�����:�	1�;�o8a���3ݣ���5Ow�����$���l������(~C���.��gB�f��$��<��S��dQ��+�z���S�fn� � <�%�6\����O
z�    ���{��]^�F8����R�ƺ�@EB�&��.�!Q<	�5Ow���{Z|HW�7�!.7�F?Ą!Ք	�.�:���QN
�ܚ��{Jӽ[�p�]7�j�T_q��W�͎���\�wJޗO:.tk���)M�����K��jǂ8p�����*��XE{ �׻{J�}\`��rNKC<!��uĬ9��]��ZM�{���)�����t� +���T�HD�>Z�{7T���W�����^�!��^�d�F,NG<�2�tݡ����'<`U�<y`�b6���i~J��$3��# ��9��!�!��/��<f�֡�a��6D䄔�k��&��9n�����'�1`���(z;�ȴ9��;|cT;�S�&�#a	�<p]<��^a�L��>�7℔�ř�|���:�#q�&���c�8R���{C
��4��m�.1~JR��$37�#-��O�$<fL�R�����
_!�p%��֥�C����ݨ|����u�y��U����C��V��k�+����ra��[��	!����N��&Q~K$_]I�����-͆�㓊�$��9nq>��:O"	H5��K�:���P>�w���k�d�	x܏���$	�_���p��+Sl���:���G���W��Uqă�:�K�ӜON��Ń�?V�������������#q!{>����U�ȣ%��f^��V�&�\�����fŅIfn��,���L��Q�<��3�[,Z���[���72�_O�����7�#/Yl<_y�4Ά����Ctk�h͔@��>�g��w
���-NU�ٳ=߁�i�T�(x��
5D���w��Tb�q�o��9q!I�|";'r�ڔ�e�[=B���L�]��|����r�D��i�붍
�!�*�φ���\]�y�i�O��]r ���$�O��4� �xa��f�_5#2�Og�
n������;o�����O�`ݘ3�*��g2.�xN~�Pcy�"�ۀ�]�T5O,�|���$�]��	J�7�c���^?}�~�ٜ����u�u!�
0��a�"Q�{���Z�O�x/7ypk@|XȲ�ugs23�)b�r��j$ՕL�Vq^>]ú\g���H�N=��-U1#Ģㄪ�搥s���>�I>����$�%P�W��	��>S5A�ޑ�+ӻT�/���t�rmq7D�>c���m��X���ԇ  ���1x9��x���[�a�bEܕ��ڴ�xU��k�bp����!������.oHZ� Թn#���L7�̎4dL%�Yguf/�_a�4�߭!�xϼnR+>�
�D�ʶ���-�CXND��E��F��Q������ץa�V`�l�AB,GG�+�o�"�JKV^Ӌ�4ӭ�p�l��fV�Pʨ�^2����4}F�N��v|�I��N
���z\��r��'��R���d �T=�+���$'U�0��XKte��)	� ���%*\u�����$r����K���Cz�]�IH)��EX}�5ԓ�B.0 }k@�]���ʵw�H�*TT�a�r��`{�i��N/0�ys@c:��i1�%�S�H�B�¢Q�,�.u;*�yJ�~~Ο[�a�}t��t�ʩ�V�ɩ����:x����|Z�~o�kN�`]���� �y�-�~:�W��P���՘F���_� ro�9H
���Я\W�͏VJ7c��M���3�i�}�5ʧ-����o�,��_��n��>��`���4���V[SF�pR�����Ҕ� N�60uZ�$�>���k[5�Z�4�(�!�˰���{k! i��ٕ�S��V�|�ڑ5�$ケ.���O�d�_��ݢS�>�I�Yy���zN`�DZX�T<>��~9減��Q�r�e�X�d�]�p+.S8v��{�B�O;N??/֭	��i�y���t�����]&o 
�fk�5��I@���9 qa�ں. Q�d��aW�CR�����<-!Y���Q��o�����oH�-~��_��w��77S-���}7�5U��Q��^$�aʗc��+�>�(r�����+��ݭ2��|]�鄇/��z�J���0��C'>#�,��E6f�G=������%-1��Jjvi����&\�?�ig�Q�����]�ؚj�S*	�l{�����j�UPn$'yIP2���]/65�yQ����Eɒ����>�P~�IJ^g��|���@I>���7�k��:ғ֫I���M"��r#Y�K����$��:~O3_c؁FXS�S"G��֍�l��xy��	Pn�-yIP<�br�u;�|���w\�@h�g��7ͅ�S��Gzꯂr#}�K��K ��>���-�<k���s@,��y����ɐ�Hc���$��r�$Pj���fF����#��"�
=L�O�F:��E��|<Z'�"�$]�Ub��ty1U�Ֆ�q쫠�Hk�x��D�|M�'�����ӆ�
�`�<��=��DQ����r+��K�BKt!���eV)W�R>��L����?�B���
ʍ4'/	�_���|�\'�bciH��E��U�l��>���/y>ʍt'/	JXp��^��[JE�\F�N�&�W�_h%K-�e��'@����%A���sη��:����lXu�:�dD��W��0���H򒠤E|<#��I��X�T��U������Mr�@��Xe���(�_�~��JJQ�Zµ=ήA�4�a[����0c+6Y��a����E��:�M*�&��'��:����G��ͥ���%�%���C����7;^T���������=b����O�r�n�K���نHO������̂�#�CR��$���S�إ��7��h�uA�y$B4�4�$��!;�MMz�>���g�UPn4LzIP�B�t�C�%"U�f������e$f���Q�ѫ�ܨw���Ȓ��|��U[�)�!]��u|E�֚H�ʜ�~<��*(7�G� (lU�R�}���ݵ�H�������(���y�z`x��y�}�_���=���]WN'��3"�D�Fe�B�	�"��)�Urw���X
Y����k�]�]B�gA����HP��^��JN��16�.]�$�lu��6F������o���4��H!F[�����	����M����2`��PK��\\$���-�-�Xq�u�I�i��J�[�C�-v���%8���ʥ�WKUPy���3�"�%`x"�dc����U��V�W�m�'[~����E�g�s�籁������H0���u"y��C�)pu�'��=�_��2�E�6'��1\rq�R���"�PK�l��'��#OJ�2yr`��AQsu�Rs�4�z,-��˜��]��gA����ȓ�6֔O�?�o�����t5vuER�~��k�N��2�HPt�;��ܜd���KL1�a�K���4��ի��~��؇��l���|)}.]Zt�d�*�[S�"\%G�G|���_^��ߓUT����O90�4j�&s���_�I�%�P~Kib�݂n�/cM�{T�wN~�z�?������z��j�
KLOS�@8�� W֭EY�>�B�;v�כWk[��`1ǎ���c*�HSM�R�װr�U ��O�_���>�z�<��5��/�jib��y�$�2��]y��6G%����0�2��,�T�(��SSM<oL:��#�h���X�j����V�UW_����^�`e����Ď,*F�lv���q�,�Urh%�O�>J�2z����5��If�V������j��ą�H��Kw�2���:䤚2*�`�\��BM�*+�rQґ�Ȧ�sx�~مK�=M߻ca�`�1�⨰�Tgă?��E�HGⒷX�^��.\b����\���l�d�Bf�G��c#��n%z)OK�مK�GjjF[��V1����4�
�����>��z�q�d7/P§������b]�i�0�X4�h�~H�]T�t$.a#k{�y1��JP��F��o�=Ƕ��),�\.�K:��I����b�#�1ƪs�7=��Rk٧L�C��Ҥ#q����}^
�>\FJ��՟*X�H�X�,M�/�%͏���\U�t$.iK�����%A�&�jbS�h�� �  :Y���w���`��>�HXt�r<W�{�1� ��-cF{r"��ڪf^c����G�\T�t$.e����j�w�b�s�NPF�H�P��̾jZ�==�c\.�R:��-�٩����$Le%��7�_%V���B��?�#\.*T:��)Q<�[���h�˱h�ތ�NiV���v�.���y9.�ŨO�NڅKҙ���o�n��ٵ�:V=�Z3���������c>-�b�5��%��R1u�5M�]�K��p�i��\���z9.yc_�yE}��-���"��Ƭ0jq9d��+�&>����l/�E��H����r��yk�n�E��
�e���l�Ǹ<�U�ոD� PR>�Kszm�c��Ҿ�9�yu���.��
���_�W%ǰ����1;�2����m�m�)9Yɗ�g^q�kmK���l�-
 ���`�x�� s6��	�l>r~^߃}4��$g��`A!����S�}�����P^/�Ӗ2�\3N^b_����VO�z�=�`U���׋�G����d"^��	�֣)�jT�\�1^UM�]J/z$(e�r2�eo�t�t+s��[3{�-H�I��C�z�|�[(fꩠ�>s�\ܤ�U�[xN���a;}��H^J.z$(aӘ�?�
�|�8�y�}Z�6����h��+)�{&�ς�z�|�-⥥�	��T/��X<Y�ku%tqY���f�#��,(��gيO'�^V#@=U��E�%T,ߒ��LV�o�]����^��ƒ�ɦ��ZS1�-�0�G������v���߳n���<��VŕV���0p��4`\��ݓ�t)�聘Y�N>(�;	�.�P���.r,R�^���\~]J.z$(a��S9�qlS|(P�d��,����xx^w���Kܒ�UN_SKƙ4F�q�A��I�	F�:�d�]J.z$(����^�Ԥ7�-��Ka��bu��b`[x_�� ���K�2��D�}����U�H��JX�%*�U^�2��~�h��8��mufΕ����z�᛭p��K\\'��'��B�R68��d�J���+b(��N[�nZ���z�}��raz���$�����yV�UKЭ�k�:���Zg�5���W�ѳ�kb��I�W�a���6p�Elu��2S����E�'(�	�?Y����m��ݝ o���l�H.�ח�����r�v��wY\������
�`obZD^�g��\,���
g_��e\�ӊ��`�J�[S��Z��uG-���hď�%o�0����z�\^�n	s19^ �B3&�+��y��I�H\�P��I)U�ɵU�UI�:
�1᪫$}���1.�����Mr<��u<��������=l���$���)���ď�%l>h,�i�JLf`�Ұ��>e`�S�Gp��Q�H\�r���V�=��%Zӗ�M��\��S���S�.����l!�<��m_��ZiY�!�
|�}Nn��pŨ�a�.�O�K�rN�d\��k\=V_R�%�&le�7��d�!s�"��#q�-�R�Ǹ��@ӗ���iizz�nĺE�m���\���=�����2���6\Y�����N�WH����ڈ<��"z�q	~��y}[�1�5j��[�b㉭�k��������v��%lE�;�\�=�-�\]nr����(��n�k.�C�rQ��#q�3��뼳��&t{U�(�c���䴦�x���G챫���%md��\9�jXX�r�M��^�Ad]3�;��G�<?�9.yK�?�zG�喭�3����J�ɯ��}�#\�Կ���B:��q���r�3��x^����ˈSR{��������%Җ����U��J���ѵ�-O&rIɻB5��>r?v@l�r\��^N���`�K����u�KyR�xG�b���������MY4�k���=����<�}�$��Bأ�bۣ�.���b���|�Sv+ʍ���[Zw��vJ��w`si��#A��7fzr�J�z�a��x�|\��K&A��ʻ��G���0m$�<��r_�e�]X��>������]P����\��z�}�[���i�%�,͊���%ۺ\�7��̨������G��D��s��o����̩���'�p`Rm��Ay��>3���znՑz?S�pA��e%�N>P��֞K�K{�	J��"����V�7
7��b	�E��[��������z�|����1��+��
Y��4Jf(E����ح��)���?�������I���4�+id���'�$uϝ˥m�E�e{��]�$G l!f8�c�}�������F�q�b�s��`_���R�\�Q�$jI]eZ?(�Z�~�X��p�w��z!|������[�0�1����a��|�k%-�B��v�=�������s�%���aؿػ�+�]��G�_JްH�s�W�=N�7هU�a`��Sr*c��+�I;��rP�j�E�e��m,�5%�N�+a-��ǿ����������-�[|.(kh[l��Y��!�kc�G������[○ً��J�d��اLh�Y�Z�u�U����"����@y��=@�[�|<�\b�]�"��؋+�D�--�1�$�}��r�z���B\�dn*��j.���.[���,��FQ�{��GU�_J2f=}^
�.Pj���;�Z�yX�6Q��w\��n,����#d�o��<v�y��be�����5.�4�B×����-�6�(,�,X�ėJsd��	�>�� L�>'^6^�ywĻ0Y�=���`k�ª�x'X�t�Y��X�ӯy� =0�-� ��Ȯ�~|0K���{�O�c_hʁ�[�Y"� �O�f��C��`�;Ez#����j���i����� @�|T6Iby�L0�}
 訍���-��)3@�EqJ_>��W�������Lu�,�������g��x� ;]��>� �7d��zM����䒱�0P���kd�O9����B3�]�
ݨ ��x�k����A16�J �"^���N��?|���/lF)�{�������y���9�׀Bk�	�+F3� q�Cq�cL�a�sӵ���5X��,7��͑xP��֞V&�z��Ս(��'5[��Jk���u���I��l�(B�Nlwdo���~���˶؊�!~1�1�:@�>qK~�I�K��JŚm��.Š�-z���,۬�8�a�?���Ζy��`����\L��*�U��2T[Ǯ�8\��|�)9]�:��Ks�!�	ݘ�)����Ӗ����z5����"%�X쁫7�|���M�
����D˙�˵:�st�F����2��#��������"�'�b\��![��?��ӃYLϾ\�)��yΑ�y�.�L����w��_/���1zq����WA�D�d���O���0f����bt��تj�8��}0�-��݈j�y4�r����rk
)q��X�r\��['c�����_��ͦ�5~�����nooo)�s�      {   �  x���O��4���O�;�UU�����++�����H=�����������Q|x���U�e��Ě9�Ng׭�ZѪ�<=����^�R��]K�;&WR͎
�,ܴ3N��a�!�ϬA����z��C�D��C�	9�I3Й��9�(�IN�3������Yfp�5�����Z�������_���"z@IzA)��uȋ���X�q�2���8���1�0jc	qz�浽���S�]�}$A��7�829�6xi�;��4�@eqyq!$Nk��C^���>y&P�����.�/��>������"�E�ǅ�˝ЉVny��O���4�|��˧��_�gg�+�9%���
zU�C���Б���h��uq����p%
��$.�O�ry���Ao�d���3�O����k�S�諤�6B0dFEdW��%IXrM)����_^>_���S����7�%B�c�(�'h#�|ȓ�M"�Q��,9�M!��R���-]:3K�>Fx}��'��(�Ǧ%x�}"o��Y���$,���T���P�EY��0�����ǚ�ϗ��oy�������l�c�r�7�x1�DAͶs�㮐�R\m�(TrV���dc�������}��?�u��;�L��M��:Bw���5�D��b98�qK�p��şN�� ����      z     x���Mo7���_�S/�,f�!��[�h�����?l9�|��S��a��ZR��!�yw$v�� �3�,P*:P�C�sk1N��v�������ҟ^�NNU�Vi	���j�쓃T%����i�:5�&ҁ��\AɁ[�L�Cǀ�緬[�s�>�q:\8I� m]چ8�K!�e�1}���Ma.p��){B�E,�>c��<x�m��Ӫ�a&���*t�����1z�IB����[&(�e����j���z�}��ʨ1��p%j$�$Ǩ�s.>��������I�P��o�}?�����о����4�U��LQ%�+�5�a�����!s.��s��T�����5��Y0���'��yc�+K�f�^��q�h��"R��l굺�a�޻\�N��>�=vO�/��*�̤�E�9���ɮ�j�]0���U�[�@LՋwEO����G�_���k��ѶC�6�0� ��PCFT�� ��[L[�3�y������M��\��yLj�S�hݦH����g'�f����8�{�Ero�T;M*
�y��9����d�ݪ��=���9�ն���m�j�^�z��~ھ�ٙ�	�ʺ��O|Nw��G6�=�-����_�7�8���a��~1hīj���bt�V7"��	��e��|����+�B�5�S�ae�".��u���X��"6�P�p�S�D�m?���]͇��Û_�م�j�Ȯo�L�m%Cl^�$���%��2��$[�X�"�t�?����$>lٺ~4���U�5k�V3�l+�{����PبGZ����(Ձy͚�2[���yu���{:M�1$�06�$�a]��ډ�K��>��۽�:0�Z��D��]��ޑz�f<��5���ų��4��%|a�J�An����C?L��{����֍ٯ��%�k���v��K�A�P��ꁋ�i˰�&�f@�ɹ>f�k��.�u'�6I�v�I�SU,+�&mm!'*B%�zɶ�� �ߟ�C�g|X=���{�w�Lh����曛�� ���      |      x��\�rG�}n}E?ڱSغ_��H���#&�*!�%[��{�AI���j�lQD#;++��2Ej.�cU*�4W��T5��+�Jl*��l��q�;��_������vٯ_�t-�VD�8W�q-Yr92���F_��$��	�d�������2��y���_�O;\_!��Lgϙ�*�`�g�mu����i7�>���]�>m��������$��[��y$��&���
\r\�&���;v����-��W/���|u������^8��j�[��b�I��ʂ)��`��E�Z����g=};U93�Y5*�q҉�k�[�C�,&��k��ftw~qG�~w���v~���ҨYPAI5&�o��v�e�!M��:�+�1	�J02�n�YӀb6���d�處ڌ��
7�
͒��i�x���5I�[��4�w�����~���m}|]w��T��L�`��J�cuc-9��e��@7�4#w��n�_W4>[�]_-'ϔ��`Ը�TJh���AE�hZa�q�R��֋�.>ncz����ZK�x�~�S�3�Q�k=�$��I܄�
�M
䔭VW�]w	C�$C���\���Ta�LY��c+�1��m�oЎr�q���/l���t~ҝƴ�է�2�72�Q��D�0bi�_t��y�<S�s˥���������_Ƨ�k�l�~�qKi��*�j��7(e�N$曅��CU��?O����oS�3�#y�$�|�����q�
�/^U'���4�w���i�8Q�g�p7j����,�"Ӓ�:|(�T��N9����S�r7�_�c�b�8S����K'Gä26Z'Y�UA=Ű(Z`�WY&6���Ϯ(L.���O�U6�����[\��c�u�X�d!��h`�Q���E��=ܟ��P
S�y��BD��j�x���r5݌��I�T��Z'|T̉�,-�g�d9�,��6��-��ݰ�.I�dL�,�nc���0�XT-8������1_�q��~�y����=����4y��nČNw�ِ3XZ�=�0��ȜϵTkmAt�9��A�f��[��t��3x4��1it�J�ș�S�I����(n "'B������c}���~[�.O�[.8��hXWMb�-�J�w�(U���Lwu��{�_�,o	���� �]�M�@3��;*�J�SVaxV�XR�U�k� ��{�_���������Jdg�(��Q����:5^�� d�d@Xk�U�u����W���z5U7�{3��^%��E���c���kU׽|uA1������tI� e�D�����|�$�o(�a�G��Kc���y�cw���/�������S~3U?#�GG�)����`�x� о$�nm�@����N����YL���=���G�W&�g�����3(��̀���Sn�H�	�r8�E�\;�aCơ�<��ic�0R��O����2���d�5��
�3��Q
����5�H"�*4 -}.2�ڴ@y�9C��z_�� ��i}��G�x� ����GG�����f��B�^��
�|E��� !\x��pS�Ot7�����/�[8�����;R "��Gi! �
.à��5�,���C��0$�x�Q�d���cW�_��  g�Y���LB�p��+X��a��� ),� X9�� z<��dD�L�.w�/ǹ>!@o����G7ޚI�����|�����Ƞ���TV��RfD \�Z*#�����ܖ���G��/�8���L:-�Q^_!Z�5��!���K�J��׷X����M�)���1�޽�>�N]���}F%����Ӽ�'5hPv�/ (>n�H؃�*����d�j�T�C}~����6=�B������9>7#�/'���O�ypһ��qe�����O��{�دrq����ן_�9>����-���;*�>S `Cb��h��!A����@c	$�R���F�m6ݦ���>�'��/�����ʀx��� (	�k��FQ��k�)��a`>JX�qw����.�͠�����Z�(Y8��`�/��%*+��
�B,�E�+>p�\�=����3���ק�,~����@NрZL�s�@p�L��3;�)�
�\_W���VJ{&!$���jÍc��aA�~����a�/����f�`��)+` �fmgpgXH̓�)u�<;ݽ�Y��~�K����o����ҟ>��?�
�X��_l� c�B�,��"K�Z�eFxJA^�W7k�]\]��[#-�簾=@ �M��g[�B���7�1���t���j��OY�������x	H7��"�4
 ڦ�H?p#:{f�m��t����~�v*�3����
n�WϬ�^L�a]uQŢ��N��'����`���/Z�2�6kV�d���r&|.w�����5������8p�at.�r%����M�o߰��oJ��0�[ޜ�����z������$"�T�Ub&�UfTO�1MaugC�	� z��X7܌p����������j��=��N���(^���"k����J�p4�(,jBT|
^EK�2�w��������O���i��9����QI*bfRj3��m�,nGQj��ST�{oc0��Z���_Ҹߝ������u!��(
��Q�!u���t�0}%e慬E[�[�0�������q��-���8>h�Gsx@0�'�2RG+&��/�Zyp���w	�U���#gL#�㷣wM���X�5�O�rJ��ݩT��7%u�h���>� %�1�:?�� ��WQAI�4_�ͫLE�&]��[��7���m|���v��ד������ ���V�'ô��%u&y�*�"�+�(��HGE,0�G���xmBv�kg4L����XM�w���'�������j�}��O��c����ƀ`���_lf�2��y��Ɂ}2�w��K�������\_�~�Sx�}�>�R'�����m['�2da�jE~�0?Tk,4-Dg>�X.�?驧�M��҇aty$�����fY���Q���._�i@;/㻾���ٜV�|t+��yԜ5��@�\";�Z�
T%���mw�}����ۇ��ۧ���Ʒzoky������ϸ�r|�,����-a]F�3��-�@N�����������כc��!�3��0&�FE+��P	|j��QY^h����4�o��#���3!lFiI�:J9f �r�M�N�d��u��7�e-���I�o�O��� iAJ�GuT9�5�Y���	<�[d`+����?�;{7�.�VQj53KqL%Պ�$譩2����p��!kg�M/��n~��l�r���(a)�2ٔ�L)��Q]�>5�%�^1�rk³��[���%I�����_~y��SM��X0K �)�%(a!�LR�n��ϴ#y���Uʁ��̒ �>d����-k��gl��O����sj����x3�U{�!�x�n��-./h ۯ�WGմi33 ����D"��0��,�4Yʮ��`�.tw�j��o��@3�n�,v&�Tc4G�Ҍ�T��&A�*#p6��
8��O�'�1������d|q�2n� 0f�b���49�򨠚R��-D[�?-i�����&0��}�}=��Y�����k4�����ȞJ"-|~b�6_k���	��NN�K�8�O"�"?{|=][~�@��h�l�Ya�ҕJ�!`0�$�R�Z\�.�4��/k�hG�Z�}1��c��Ya�������v�i����j����<U�0#8�ƫ������A�x1��hY�^�"���nϮh�����h͵���R�Dat��L��P�!"R�oh��8�q�bq¤��t�`R�K�'��3Ni��Rq�|6�� yb���b���l��nM�~w�\]�N�/Hⴰv���C?���r׮i�x LMQQӝ#b�/�D����x:Y+rK���H��5�	��[�,H�|�������,���[����|Ш���Q�.a���-����V�m��V �  ��mDM�7��P xT��x���F!��*L��Q>c��(�����0�ny��f�zR���tBc�L����E��ZЎ����8��QP��ӽ:Y�Cs~����n��d��o.���Jef�Y7Nb2�E�aBk��ɕv� <4sKΥn(ܿ~�o�5���k���R ��7��K�-�y��9d �>��1#�+)�	꯻�������r~۟/�S���Rm�'�*	e��u�1,��mJ�dT-��fC�j[���m�-9 !���Dc��E{ʸ����X	��t?nnh��~�X_�B5Nm80~f���$K�]�P����f�[bO2�%Y��n��0 �|���q��M��L�R �PR�Ưڬ,�2�^ʐCFjJC8��B� �����\�-�K��kT���+`h����=ߨRq.�,E��9��|�v�?����a��q�<��I��,��%0�R4s��SD�8�N��a�{��۴C bh;޽cL������!��""�+��s��C�ղ�	���a�T�Zh�u�V{ BP��١=S8E�ٔ�(�m����.�?�C���.�o,r	� ,GK��QP|/\eQ)��3}[�r���֏���e�F=��Jb��$��5�P��~�����yu׳~C���XC%��3��C99��Lp�:��	�8�A���M�1ug��6���6r��B�C��:%��p��J�lY�X�%�f5@5�E�>���� �|	�S%2 V�Cyk����L	�TXd^$ #�1c*���iE�~����֐)տ-���ȼ��fA�YO��H@T�a#j��*� ��]���x.���tA�	F��EUÒLz�n�y���B6�'��"[-�2���D)�"���Ƞ[r����K,����aD�͂�(zH)��a�k����������,���Y����X�k
��
�hmN�K�7V�>k�����W4�w'������|��.L�7�MT&Q婢0��4bJ���׌��j3TLBy���������_l6-��N3[=aE�aȶ��j��2>�9\n�b���ݻi�>���bJU�"��
�Yp+w�g�V%C��f,{�"�|�N�#x��xːDM`v�ީ!/\f=����4�W���~}��j>�EAŚb����PA�4�2�jRW��@��T��$��AXl�Z?@���"�L/ƃ�'�K4������h�m�b୻�_Ҹ�]�ڬ&�i�������&otn�s�	�)CpL��k�Z���0!��_�����Ҽ��V��Sx�\2g��� ���}y�R�֭���:�o�[xA*I�ڗi�z�N�^��������]�P5hOLx?DUU��?]��ts���[X·�f�A��~j^ASG��@7������P4�^�D���ٵV�@Gmh�W����0�+m���x��U<d�HQ��#��yU�uN��l�4�2��ӛc�5�bi��qc.���`.P��2�9f���:���������M'�1�-r-`4�Q�	���,����be��� n>�!?����bs~9](�5n:kI��Y��h)BCTձ�5/�[/nh� �:[�zթ�x���x����5HE�T�d�� �k�́;_e���bM�~7$�'�i:1@"����Z���n�6x|��}B��Cw�Z�x>���d� L��#w^�3���~G�8�Vm��J�5�������pz���T�%9P�����PD@L ��-��n�J@�2*Ň�݁����[�_���=%��J#�k��Yf�0��%�s.(��u��x��������aM�a���� I��n4x�`�r7�#a@c ��?��#�Y�����dx����D!��Z���9	@�����ܰ�J�Ӄ'���"���ګ���w�;��i�ۚ��k���}":�H�y1SX��	ǢU#L�))Hx�p�Sz�ȃ%45�s-�x���P�k
�Q� �&�C屔H��Nw�O��/���7����c��~�Q�MiD|.c��!d���b�0�jK[��h�9@�̥����,n��������P�5EŇF��;�Oy�h��a�p��!Ix��fEu.�:tݮ���	rh9V�!��Gnb�� ����i�j���^(E���t��I���ǋ���2nwOuGgF�?n϶UJՖܛ0����&��R>П�.<�fUט��*��p�Uc�Ք�52jC��'����˻�c�3h����=f�b�"�B��Z�B� �1�m���ꂤ9\��24SM�=�F�Rxc�=lO��ǨYmt(KLtʐ�j�$�6������.��Җ��nRS��M,� ���&R��>�h�z���E���
�F�s�L;�����D���_��n2P�LF8/��K�Xw��7�u����Wr@5��q>4�}��P�����S�3�&�`Ø�!{2�q��;v��5��儸/�?�7��_A㇞XO�M�FwUJ��vUp�a�2�!qŊ*�W�)�������!P����������Ns�=�A&(O*�J��z�6�^0�����@ۃ�K��w�+��
�D��x�yRĄ��Y��\��k�({��q���?�P���LCB9� �ÓIjy���s�ė�m�Z1.P;��ԕ���D�P�'9$��?lFb�!|	-���%I�
�E�	aX����|���>��<����,?�4�1PZ-0�-U�B�@� R��5�	^�����% �2�I<w�=�{���\6J�W�Y)��**���+�Fך��t�&Qd�Ҵu(��ܲ��e�[0�Ax"_m��
1$~ɿ�������B�CX����y���:5 �VG.�t�F��|y����??2���?����1C���}'��XJ�q����A81����Q>��e�;,�Vͳ�O|��d�T��5��P��8l�KE]�M'�UO"�8T*�7c��]է_���������}�s��o��]�~ؖ����#m���k��=�,�z>n'�z���&�vD�_�>!Sr�G�,UwS��;I��JY���:�~N~�?8�D�/�_����@�j��d����޿�ϛ�}��F�֫�B��ʊ	�nBL����O� NGA��'t	a'���lQ���Aԙ9����7ځ�B}#������d+�6��?{���� sF��      d      x���ms\Ǒ&�������ծ�ʬ��u8��dKs)�#r�Q�F(�uƱ�4!ٳw����H l�d�Ѡ%S I��Y��d�[,8)��Z�!:)�]m�������;���������{����o���������������燏������o������������t��������_����_���_��o����}�����}�l���W������?���S�?_?�{��
	{����$�����f=���p�\ͭ8�>����z�����ޟ�x���������ۙ�����?��xݕ��aW�I��c�S�}����k�t8��`�wr&tA�&.�d}�Ϯ�!nD
%Hi�ǎ3��8�N�3��B�wr�S,�Up���0$�Nq �}+�}��x£�cMxtB��M���ɛ��".��Djτ��
TfǚS��&ޢ��'�kB�H�蝼
���.���x� 5��ey��\on�7�x~C��͛]
��������+\*�1�����pB8 �&D�7��g;eJP�-��:��2��������㧷���Ö��]�5�m��y�(a��l?�������FC��)8fl�K@�1~Ō}�r^��%�co0&��`lǊL�t_�+իrLU�'�%'�!6yŊ���Xә�6>�$|;3��K&GMk��ji���S�xŌ�Q���f�<f�MfX`F1�ܦ���'j�D��7]X�8�k��7D9�f���i���Ό�=�<�OTQ�Q��^�Giq�T���������a�'.^�v�}e6`<#��K�g�����c5N�!+���]�E��	}
!��.��B�΅5���@�����[�-��暆��%jt����EJq��f��{���|X�G�y�sJ~/����8�i�7���d��*�D,!��Z|�� V�Ú��8|�3�71���|P��qN�/
��:iFT��$��̯�p+��&�=`#�I�B�-�1�8i�����,����ZQ>����v�d�'^�wEV�>�ڼHg ��{or���w~j�u�֢*ER�!^u����E�3�k���XU/��TG�g/|�1C�����Ǧ�Q��^�S�ʁK���+f�ů��bM{4V��x�ǹ^�k�C��4�hS��ݤ��v�Y�k#�ŮϋUq�ј!����Ŗ�N����]#
����/$�y��Bym��B�#�5AԱ�a����~�eF3��y�}��h�����4A�g/�=w/^xpO���}���g�~�{�͓����m�A_����G���_���w���������3o�W��>�v��w<[����є:V�X��E� wI5��_z��MƂ�}���?���_������W~���}�uі��=~G�]}��$��ǳH�n5Ε�ٸsf{�Zv]���݅c�	��<<}�?=^o�Z��O_��j:����I,�tX�Z��B�fM��bV����$h�Y�����'|�����״��t}�j\�����(�ހ���3����,���5�1�0}I2#��~�BO&�w������x[�l=��K����ԟ��^��О�_?���)��?z���Y��[!��x�\�Z�<$�-�ϖ���on�	��!������go���ek��c5�3�����	�)��x�Œ��O��5(!�`j�����c[��a:ss6�!��`���8n�eUx��əkXIɉGeY��!Oi��ȦZ�� �1�p�82��4ղ����Y������C^é�!�#+=W@i���A��T��G���G�;��âHq����A����H����ӣ���d~�&$}���F$����)���kT�|n�GmN0�  1�!}���m��,}(} yKi!���*$��UT�$�1)R�#m��)��;�V�g�z}fg������t�\ܳE*);�ݺ��+.�܄�<N��������|�e#!��構���9WG����c��F�-1�h-/�|�r���K`��[mxC]~k���?���wc�6���}�����_��y��=�����������(�Bx胉"��3��5�W{Vr�#wv��妅�����r���+��[H�?y(a�� g��*�nd�'#$7�eO��g��Ts�j�k8�u����C��v��-��߄�Q�;�3'i���%񮀾�3cl��'zu��V-~V��|�FCE�����t���X�h��5'l>cÜ�yw�[�����g�ap8!x���i�gћ9"J({Q�����^���}��Y}����K�J��~(ѻ���r�yI��^�>oN��̦'h��5�a��q�$_)�Rd\>�} �8��"��}]>(��o�B�_�|�:�F������#�NM�9RU���e��s��a�������|zu��3NN�+0��;]\����S�R�������s�~����B���X~��q�MIoCB���[kD(�>2��Qɓ�E��� F��ǎg��y�:��z�����J��'W��欹�2��m\:�}��*����m>(�!l�"����c�ʝ]@�s'a�KU�0����K�穏����i17%�1�e����N:���2�p��;��	�@�o7�k���������ѯ�����fe�����֡�#I�j�4p�S�*��fD?��E�,T{��Q�jM��Y�n*ThY���@5Dŗ�5Mk^�W���2��}*I���B��7E���N���BEֈ9��7��S+���
p}�N�7��Dz���8K%_X�ݭDah-r�qC� sܯ�W�c��-fp�w(Yu6uq��Fi�!S�}�_>]:ݷy���.d�\��u�WҕZ-·j`�g��Мo����k��̓���%+�)E~���HH�{s0�FU[W�F���1f��ȃ�O��x��Y;�V��z�dM���T�&�e���ȁ��C2-��|ʉR��ƃg/�򣚩s���w����g/n����e[�JW0�ʑ�_�e�6G�=AmI��]��bI4|���?����s�֯���8�.�/K�lb��l��KZ��cu��l�*;A�%�0�2{����vWΎl�OR��$�E�ZU
4]��6�,:Vx���b ����?Q������t�OϲX���the�4�.��e����藾l?��t�wZ�}�"F�!�i��6��j���A-?��4Ȏ�+���S���g�)Z�+�zͥ�'f�Kޚ2ئy��e�¨>���7��9��%#_U���{�k.�$􃗤.�*y��Ӆ��(68
�f�%+�@f&=쟗{�%$�zݱ��8�qhɵ��Ċ�����x�P��<��a�E�E�W��F��d��)��]ꅠx_a�lo]�*P�i�KgWw�pp�B�V0�9E���ز�U����Ȣ�Y\╠�^fusX�Ƞ�T8/
�$&����UHIg��!���DK�ўVo7��amg�e�b��9�{��V!%������ՀW�+�A��X���FN&�)a�>�/�)��b8���fGJg�DY�j�i��*�i��Z�9f��QK�!ASz{� ͚JH�F�H��"ieP)�U��=*D�"C6죧���-m�!%�Q��97�:\Q����G��Jt���0ҹ�z���.b��N-�	�s�J��UR�!�o(q�{A��^�Ko��:i�+�K-�b�1�̘�|�2�H�0)4�g[PO��+)�(:��R�Ü޳ie-R�&F����m�8P{w��`�f����{*���3�+���a�m���{48RV<&Y�Cs.�:��AC����SgkQ%��?�}����c�l[�*�Q��:�:���z�{�t�JTQ��;|w�3��U����[�ٓ]5I�*�7�Q�-��Z�e)R/=��E�Ah	��H&�p�ڷ����cUW!#���!�QrEkS�[��76�M�K7b���M���{��#���?��������U���$��7&�}4!�
�����}���MD�Q��5bh�����0s��+~u<'���0�8ך7���[�Y�h��� &M    GѦ��J�k���)͉1�N����o
�)��y����-�!o��������RK�f�
#(�(]U�/̅����w��?W�;������9vGq(�3,��iK��"�!n�v�2�����Zаs����Yw�U_"��Ë��5v�l�m����z����y�8��)SK�b~�S\4�#h�=zrQ,q釚Z��~?j�-ӡ��=�tp/��>�"h`\l�*EE��m�<��³e���>D��O�u]%�}�Qd/2)�o�(�z���ڬ�z���2��'D��Xo����p�P��`��,pK�G*p��y��65%�DGN��3�F�h������ ��f��)6z;���:g>ur��+���[^<�oR��:�}�JO�u,Z�É^V����]`��n/��-�����-�,�J�!����pZ�ɊݎʵE�c�G�D�(q�,�Fl�-9�J�����Je��o��d L��{���"�>��kœ��ה���{�M��$�7� �_�o	Xh��ϣ�pvv2�>'�D����x-y?����.z?��3�C�(|�.Yă�p���V�Bss6[������ch��u��OM�������s˭t�2V7끳,�6
�����Ǯp��.��^���$d�FL�.�u�S�v������|~�`�O1v��n�[Ѹo�K�e$
����_|q0�ʵ5V�r4��>6�PY��@p�C�@K��HV�5=Xŝ������K�\.�w�q�G�[s�Dɋ+<�d)Hhu��F�%����Clq���s��axE�g�t'$�j3���{AV�ԧe3��Rm���NeZ?�+	?�{���%�nHx�HPTp�d��<1(Ho#W���R����V�=�;�ٓ�7�H=�k�I�L�r�AdM��0/n��Smz�悚vK�㙣�s2�����]�U<}�E��܅�yO֥�A".5eC�X�����T�c��I����6f(��r�a>�~� ~��}�
��rͨݾo�����J!'�_vv1�!���U��=h\5�݈�'F���k��W,��px��h�r8���mPeLq�c\l�i�Z�H�'v�28�R�	F�-����'�a�'�Kv��F�-G�εlMQ����d!)��:��!J�M%k]%��f����c⃊���pU�zq�$I�q	kJ��Oc��J,��1k,J}u�p�ںz�s|m=tx��;�d�M��H�醙!'V�J��o���9}��)�n�\���#z|Ot���Q�΂������Ro��G#��䌮� N��|��A��/N^؞#/i�9��-(�A������4�'j�z��M᲎_�_
�<�Ʃy�^�����'O���WD�-p�Q���"lY��ˊ.�sg�@��PT�(j۸cP��S�D�v%z�������`�����	ܻ�"�7��RJ���Gv^,4���w��B!��}J8���W��k�`�?�6�5�\�[}Ĉٵl�(<5}:���l��.������� �"rmS�{��"K,ߖ+>�ȡ��e��7g�Q�ڬc�^g���I���1dS����z�wN�����M�֯A�6�M��qɾ�~)cr�V�7��Ъ�ź33\�{����=zzT�����u8�7�9,:�2zcL�A�6��듩�?*t*k>u�$h�&����~-{��fFm��-�=���,]���Z̝����l!��=���'�?/h\_��=Ǖ�U���|��M��YHB��e��!Wf��B���:��#~�Į��M�=�p�����d���o"�hW�4�Y�}��U��`�9�pt�����uG��ڪ�95�������5s�#k��K��pɮ�0�ʕ�/����z��vN��g/:A�#��~qQ��U-*fq�����d�I�o}2��ȝtU�+"?����U3\��z�'�Z��I~�{��{�z�
I�ȭ��r�"�l�E����/kM>\*m8�:�9�K��K��ˤ��?i���pmaӷ���ۦv�!��*���n�:HcX���5J���?����Ͽzy��sז5{��	�lw�x�������G��l�24O�.�Y�����|��{�S��$�-lO�t4Q[�8q����@6H�"Ӫ?)�kl��tb7���l6빤=:�4�kז�G�K0���*9.�Ǒ2udg�A�̎��!�Ir.j'�^�����Xۊ��O�=-Z�R/E�m�7�ѨJ^L�.��`|����^�����D��¦o9�];϶^t��5���uH�"ؼ�Ѫ+�g���*�~I�N����''mk�n��:r�ϋ��~�	���u����jl���5d��}�钄}D�o��ᓌ��:���(`��nhԑkO.�V�]ɬ�!g�@6�����Q+0
̀����Bv/Mp'd�ix�I�󹅜j���O�)s�G�g71���C@E����BuR(��{m���+��v��d�-G�7>���Lm�gpѮ�۪�х
Q�,�t���v��8�[zxlJ�L���Ȑ����1�BV�;��c��,B�^)����;J��"�5y�S�a�>�/�FS�͵8֨�%Ě����z ~M!'7�B�T�}\\J���]��zc�������K�W���j��m[�ct����P/��3a���k��\n;�B��A��8�u���1���n��;[l���@/���M'��!=���R�YS�r�2�p�G0��4>0,6:$T�.�a�jh�>T��p0{��#x�W
�E�&�Ui&ս���S�g��yo��X�*���	��D���6�\i���,��x��KJ;=��)/�a��j#���gtT���s;n�Ya����ج���j[�4P�#�)�L�UA�!�"Khc�ˉ����iJ��aq�TmR%}T�j�f7{.��m�q�L�T��kҏ3�k{v��
��0J ��פcO�M��p�u�Rf�-�=_Vv?��"Vȶ�Q�"�٪]�X7�S�i�X1��� DY_�ȫ�۰R���e��d����b���!0F�	��d�\�t/��n�u�V��E�>�ƶ_P�aJ�JSe����4}?�,I+��,�]�D�F���a(UC�2���m�К�|���#^�I2�a��ၴ$a�����n��m�jl�Leփ��ޝ��3/�胆�KEOs�x�|�aJ�R��C���,ru��'pzk�؞�5$�K6�s�8C�a�Q��5����m=xN�ɖ�!���3����1[^��q��u�Ų%ɥ�E].�^�tO�E�dj�~)��Q�^@��'�����lLD$5+P���t_N��JT��/�Ih0���Hq��6 <���=�z�^ꓸG����qIe�P����M��0t�, 9	�ߍ�%_.��G�v	�:�iqS�D�	ѩYS�[�e;2D�ָ��C�?�ˀ�s�$6�)f���Y�5r�f,��S����o)}�JЮ���kE����
�C*�%�b�����)L%�ܿl��|�CP�[�x��%��X+8,u8f���O���F�b��������|��?��.��P2 ����|$���X鬶����M�l�QV��8+��k�x��D�h5��;V,���(j%���<��⎌[�F<��!���A�lj�Վ��l�@�x���B�1�jd�o�:p�^�/��V�n���i�a��h4T��z�9�d���&�,��luTa��f%6�h'U�M����>j��{��ǋ]�a%?� ��|����x���ٟW�� ֯����&��ىT��eyj\�<��c��e�;iZu�/���GƟd��5ߧ��_���{���W>�p�����˚��1뿤6��yɆb��FR�UX]�o.w�����k�v�#��x
�'� .���B�섛]�%kB�m�b����p�_Q9xv�̴(�XLΐ����VJ ��f}�k��dVHyw��	�M|��� �F:u8��h�Փ͹[B[�c<]���XRPO���,u��$|"M��k�qg!В��U�18��}    18�qg���h��觸L#[9���B.u#h�_���:Z1 h|f��z�ن*���Ur�/LVo :?�d]0`y[�K;%+T�zt@��L�YB��hU�/ݓo�3��i��K�	���7��I�?А]����Qz��Bta�X�ц���x��d,!�~P��ц��"q�CL�(D�B�����
�r6[_l��� 1IuD����?�E��,���V�Ŷ���V^:�6`���ja��fL֘���^x�)I����1q^^r�c8Kg�-���q!���8�:�-I�p~��b-O��E�hR�۵%Չ�t��A酢��J�;�h�YM���el�ct�jg�� �KEз�2��cI�3���*~���GkP8�wVWa��(�^B�p���f��S��4dK.6g�V�����ց��ID�r�����gH���.բ��T]�C���|e`������q�p��w�p��P\�j�m:�|\�֬��|v��`"&&rsj�R���V~})�v�k����J��v,�o��+&�-NkI�k7���;�,��bH�#h��]ΤO�
lī��I���K8��;���^�U���m 59��U| �<��&���+�Ry����%���Mjw�`��%u�K��+�N�Q�U��Y2+��� �x{6��CWD�����Y�j�&�t-A�9 BA����YT,SuQ�B(�z���(ߣR���9q���mk(E�팉Pn��T^�x����БB)��IvC��x䳨�_���|��!ؔ�Y9Z��WU+���̢p'�kg��X��%[A%�����h\$j��X�AN�β�d4=&����{�Z�+�v�7�GxX���ώ�B^�(?�)6�i�>X���Ѥ�m��A��7v������0��Fɒ/�gVˤ>,���	�,.�I�qW�p���W/�;���
}k�d7~��DN�z��%�V�,�� �=N �CR�Q�m�o�$�]��3#��5����ۿ��b���4~����F��Ͻ����p��8������ϗTwͤaĒ1�9�P\���(�O�+��]R�6�24vϿ���[�󾙜���*r9�K�s�6"(듛-�f��f��U��:�V����c~u�b��!GY܈3
���C��5�S�d�F���7�0F?�=Grw��-_�򺼅#TJ��s�%}Zr��ߖ�����_9�?���SUL�X�U�eq��1�+�D5�~Fuໟ}v=�q��~t�t2'̶I�s��dsC��+6atCY$��j�%�x�u�ol��	�����;�2�c�8�C[\�V48������i�ݷ��**vi���Y�y9O�e�G��������wU� �		#/%�3w��Q*�ٮzVG������O���&���m�S��o�K�������(
�=GTeLe���X��MT�Ǹ�D��D'?|��5o�*o7��qt������{�)t	\|k��J��QFKIl2$ᥣ� s;Ӄ��F2�]�j�Z"j�ϯ��ǟ�Q�*����	���R�8�ێq�n{�����x���O=vϿy���i��7�\�?뛎\��ڰ�f��/��Z�#��
h97*^�ݖ�%_�Ƀ�[�\3�v	�p3r�q;z�<L`�Shc���9�,J����;�ҳ��eG���1�nI���پ#��Z���O���/���ᣇ�]=������F�l�Q
���4��V���d����A]�����d���姂�o|�k�E�< �4,�G�%��¥�Q�L�#4'��ka�V��1�V����3��2O,4 Ya<l�}�m�Ւ]%}r3x�\0^��k������=�(��G�gw1��J$��2@�H�ݍf�i���#d�5p�)�������7/?����ׄ7	��wR#�Gk���-��}�_"׭�s�N&7�jj�z��F$�, ��5�M�?kĝ����AIi1.�N}\t�v~��H��Fn�yH�|Ŀ|��Z��6\%��&�IM kR'K�,n�PaT+P�U��K?��\gh�L�&<�o����W�9yEx��������D�g]�{�`a�v�����2�X׋W�/�4ǁ�.O�B��/�5�x��Z�SW���%�NJ~�X�/l��>�5'i�z���Rq��)b��$��� �_~���+�y���̭����M�V�қ+��j��v�ȥ_��i]��~J�.�iy[lͶQWih��a)6��l�q��m��o�t�e$��D^�G%��q�]�m-8R��#�RstI3�q-/��u�k��S=HX�8TGA7't�����T�!D��|�k���}v-zx#>,k�54�ɶB,���Jr�<sᆾ�7�y�M`&k�[���)y��'%*��j ����T&���Fc�������^�r9k���Ӱ�UTl�[]6cn�V']1
�r��UHR�U�0��U�����'7�>���M���칅q=յ��9���D�0h��j�Ã�U[w�϶=�c��f�<zpRl�O��JI�r)��(��J3�M��
�s`��ʼ��cc ߕ��O�MK	.�М��J3��|.y8y�~M�g���Z-65�����U�T�����Qq<rr��=�ޖ���e��kֈ�����}��R�"�ު�b}&=iD�+���VkO��\6N^��Y�&X�����h�6z�B�����ɕ�̙�7y���t����t�u�N��4��F�~�!�>4��hOV�]C�LeO��ԕ`G�gɿ��o;B6�g`	5��v!'b�bS��Si��7�ب�{�ӧ.��>��|��h�E��5��7ze��զ�TW�H.��P�6|K��;I#œ�V�#��V�E��ڽ�A���b+D	�˥N
Jr����<$�A��4��|��}��O�O������PHq)��,Ø�oS�~WK�n���5��NWU�<y�����s���+�(-/Da������z��r�ш��������
J�d�K�
(�F� `[��Ȯx}Q��z걖˓�o>�l%� 6�3-6JTAjM�k�i�=jtbu�K�:j��)ԭ���"j�#��2k|�(T�|�W��|���z��6�D�a��X�	��n����z2[�VA�ɨ3��)������B�v	DJ9�⦰+�!�J���a(��͍�1����5zn�?IY��I��u$O�.��ON4\3�	E�ɐp��[�I��|D\�z����T��Ř�%z�(%��^���<z�ܞY������;�c�ghꉪ�t�x��m�4�ٻ��#VW�a#!��o�B,�5�+O۟ّ�
�r	��\q���#E��Y��?��~��~�� ��!ȋ�A�%�ȥ>�.`qJ�">�>(C?d �J)�m�P\?�$��S̈́D3�
bkr�O~��xu����E����h��
��2I9�������>ᐜk�
�B��?���)A����{�o;��y�^�� u�P����j�[2�l�S���ȉ���F��.�ު��EКj�'���OEݴ n�;�����%s�{}�q��Q��9^�=���]َ�g�k�b��K�j�Ⱥ�rV�T�,Ca����D�_wW��7*|�@�N]&�[�P�.��Z��SQ�_�����a+��,�#_��ﾸ�qG��Ҩo9yQ6��{\޵���4����PR��ы�]oG�����?�Q�uQܑ��(�[�(R�h��a)\)e0���:�W>�J��/ї��O�55�N����V��E���nl���Eu�lj�i�ia��]�)�A��>9hH�W?j	��ŷmI�,��!��Y�֡��=�t��օU�Q����]�~������wA_Q��@�^td�p1�rS�@K��QL��M�cI�\�0�F����Ͽ�����ӯ�X^&vu y�NT��Q{i�65y��7v�Ysdˠ3(�,���D _�GO��>��̵R�r�H&�Diy�e�s��d���օ�f�>��oH��{qͳ#suI|y�(2m�3/�8�\����YG�}��G�G���>�_ů�Ǎ�WG�q��4�lG���I���
#��GKN�>����c& %  ���_��ٷ_|yˋp�&�W�][4��v����q�@�vb�HrE�eTic���a�!�k�Tm��o���ǉ�?#9��D\����R�1Yuڠr��t]�'��Տ��n6�蔎3�8� �c��;r���n��Ygv�O���\����8��_��>~��O��~��o?�#���r.��OV�<;��\M�W��*:'Sc�$Mj����h�����먹N���M�r+��-4��}�&��܃E!o0f^�<����k�%�98�N����r��n����ü�rs��-][���3�3��iyeTO��L��j��'\%?5�N(�f[�u�g�x|��1\Sޡ|� 6��Y�fύ�K�1[��L���ą%)&~�A�ρM����M������ 7���85Ġ���P9gVL#d�Ҽ�0k����o�]y��mm����ĥ�`)�qS<�-W�ӕ��'���.M|x��ˣ�|\"y����Ksj���a͈R�}En"�Q��4\jY�Z	�zغ�����]�PR��e�_�e>ȕ U�Ǳ�[����i�M� i���	��8pHU���CdT(!ѨT�t������E/��&ƴ��K�j�z�0�hpK�Mn~��P�æۣ���hq6�ȵ�У�-6/v�Xwy/��aP���g��0la���ѥW�⒏h���	xt���f�N��ܬEm�pI	��k1R�7}Vv%q�H��c���kѧAIK<�R��\��|��5�PNi,�R�"�F�MT3�t3���6l�����+Q����-��B�j�.�޾z�ݏ_������������o?~7�?~����_�F�����lv�N��l�۔Ar|cET�/�SS�����������|kD�MJ1/��=}�*��Ôr$.c��{���01h-
y��[º��� ����8��Pe����L��1#!W!-Z�3�"�%���"&7)�8yE�]1y.��/{�-�+�J1.B��&;6�0�t���
�D�{x���Z��S��c�#��Tgч�*���%x� JK1�~�ޢp7_2�}qÁ�r���[Rd�4r���P�(��{ϕ�k����yQ6�@�Ӧt�x5�\��Ap|�8�������]6 +�r�)������l��Ы
�x�5�o{���������>z�ߟ?}����!Il�T�GŨ��c���ӢOJR-� �^1`L�_�����ǷG�l<���a�)6�"JU��5Jb�>y������x�Vb2Ҁl[���#.e�>z5��ǡ�1��f�.���M.7C|uQb�U'u �b&�����d&�r-6q)
*�(�P���P��b��0�}-
��b3~����s�(F-���#���/ޘ�D�(S�/"��c*�Լ*Yj棍(���	��2����g��Z��	P�,"��h#蚲�a����v�!�!�Q7����_��l&�Q�ka�sK��6'�65�!�=A��+�S�n�Z�2[6��bm�XJU`A�ٖ�Y�IlnрnFNX�h[��%���4^��z���߮���xŮ/5��xg��*xc3C���P#>'�b�I��B������^#�T��N<A	�>H�pZ�وA��k8�L4��\�u}Y�ŗ���\�I�	�o�F�g���R��b�x��-��%���ϸ-����#�^�,���
v�����+��
XM���Ađ��ߦ�цaq���/^&��y���d�bYZ�Do�g�����k��㗿I�S�=H^��~*�̦H��Ơ�v?} ے��Qсc�-U���Z���t i$��\�6�]��p����A��"��a�Q{�6�m��PJ�+�����`\gˑZk�M�s�v�Ɉ#���Fc�9��ͿF���#�c��GDy��5���]Z"[iN7Z�RҀ�-�����t�5������ or¸X��y��]��� ��BwĶ]�H�V��wKbv]�%��\�x*6'=wց��̮�Xb̙Hވ�ެ ��u����k����-U}��IWL�+9�ŶIu<EW+��o"����.P~���b���	����z�¨R��B�*�bG�D[IaȮ;�7�q�1]��D��>?lg}�X������bhl9W���c���dh�hdTQ̓�&bz/���'jL����"l<��
�*���M�(6��h8i�60Ր�"����=����_<�f��/��>���v�����[�P���J������r^��	�( '7�V͓]"9k�#^�{i�OB���,ԫ	uؖ�yi�CI]2����m2,sؼ��f��{��o��X�Tv����S<0����6�2�=�Z�7"��:�k�Q��y`�loLo{�O�~��h�fx���#n�%�6d�IܘQ�(��Xfu9�^g��C���^3�v̺7��[)?Q1]5�؉i�]����c�xûR��g���슷��0���=���J����C�Tl�m"\�l�~�*�Y#�9li�>��d_���{!��������Yl��ĥ��e�\�8j%;Æ�2��![�~��Fh�6f��Ƴ�R�Ɉ�C��O��5����t �2�DJ���S��&.%��9p%w[�6GG/�S���?uY]����~���v�f���X*�(�|Fv
W�Io�&�4g�.卮�O����E�� �$k�^� -�Ŋ�5_��R�_��U��i���rBmb��{O��"k�đ���Rdo�)t���|gOp8O��7ѳ��$�ƥ��p��s8�`�x�Id�ѯiT=���!\���9[˲`v�#��鱲��~��/Ռ����~���m��      e   �  x���;�1���_���_�nMv��8s�D�Gr�����������ES���Z��T�9@�
��w�0�.	w���������齗��R=��- �4P��CTO=$Ϻ���F���wPT��k��K�]iadT�tEܐ6M+�y�/�˯[D ]Y6�}E�0?D����<�R=��ӼPE�Ϳ���Z[�2����C9e�d�r'g62�3gi�];�LZ�Bn{��q��yy:q>=�SW���3,5�3g��-z�1@s�����>�{徼�8_�;g�+�-�&��p����V��sDi`�Ҽ�+�d�*�G�� ��~+��:��U���9���ɏa�&nY���	�9�n��Ŕ�['�!"�1��r�����G��*��좼�`�2�M`}��n.=0���)*yhT4K�L|WT��E�++[]�pr�#�J&�s�禳A��>�c&C��OY���M|����;k����W��JDS����z�\~�w��      :   %  x�}V�r�8<�?ƅ���#�S�X2˲sJ�a�pq�?���x|���~{�a��@rg�ѝ�˝>5y�k�GtKn��(Ab3���*Ҧ�[���G�氐H"X�awe� ��%%��˹�;����*�l��Ҫf囒 ��0{RU��^���zO�.o����A3e���$�I��F����ǾR����Rp�b� R{~?�l��c��]�Ab,"RƄq(�\XL$�Y�C�	��%,�Rp�^f��"@3����Wo�vn��.��J��%&͍*� wBJ.'��t�
l�!G�S`�����!$�_z��7?ssR���cJ�r�}����)�'��r?1�7}T�i�ƍ��@���k�S��2�U&#e�&��:�g4���X�M]��Y8�PG3].�,t���@L��g�ja�jY�S�` O��Zk���;m�n9�ұ0�W���]ߨ�׃>��ڨ�z�v�k�l�%R&�/q���V�q����\���.���2�#c��0�1�����B=?�Y�v
3���a�x̀�ܙ�*Ab^���s0�B����� �!0�sR��{�T�*�b!��+D)�1,��&M��n�	 \:� �����,ђ� �BJF.-MMb�
,��M`a�*0�̵go��ą���7vS��ۦ靟��%*�\e��\�#�?)[�!���i�B��%'�&E��\D��0�Pa$֦��y�4��E��]ҩ*�?6GI �C���ce��6K|`�L�[_ⅸ�R��Q{	L�[��l�АAlg��as�*o�Wh{�	����m�F�M}>�<t��a+fK�-/u���{��+Ӏ�c[���^ay��,0=@��?�L�*���D�r��e����/x0y,4�tZ0��b�Vv�L�|xH@c� �j*ݶ��G�Wp�y6�d�M̾pD��8;x�3��!r=x����X��p��N��%S������B��f1���	wo�i�BM��>��u�NK���x|D��>�ԃ2�������{|e�gW�p��>�)�>�jaw�F�0�&c�w���ۛ��� 3�"�     