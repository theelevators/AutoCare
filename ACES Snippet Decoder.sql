
CREATE OR ALTER FUNCTION dbo.udf_decode_ACES_Snippet (@Snippet XML)
RETURNS XML
AS 

BEGIN

IF (@Snippet) IS NULL
	BEGIN
		RETURN @Snippet
	END
DECLARE  @MakeName XML
		,@ModelName XML
		,@Position XML
		,@PartTypeName XML
		,@Vehicle XML
		,@Engine XML
		,@Region XML
		,@Block XML
		,@VIN XML
		,@SubModel XML
		,@BodyType XML
		,@DriveType XML
		,@Aspiration XML
		,@BrakeABS XML
		,@EngineDesignation XML
		,@FuelDeliveryType XML
		,@TransmissionMfrCode XML
		,@TransmissionNumSpeeds XML
		,@TransmissionControlType XML
		,@Valves XML
		,@CylinderHeadType XML
		,@FuelType XML
		,@EngineVersion XML
		,@FuelSystemDesign XML
		,@IgnitionSystemType XML
		,@FuelDeliverySubType XML
		,@FuelSystemControlType XML
		,@TransmissionType XML
		,@MfrBodyCode XML
		,@WheelBase XML
		,@BodyNumDoors XML
		,@BedType XML
		,@TransmissionBase XML
		,@SteeringType XML
		,@SteeringSystem XML
		,@EngineMfr XML
		,@BedLength XML
		,@PowerOutput XML
		


DECLARE @ACESSnippetCodes TABLE (
								MakeID VARCHAR(MAX)
								,ModelID VARCHAR(MAX)
								,PartTypeID VARCHAR(MAX)
								,PositionID VARCHAR(MAX)
								,BaseVehicleID VARCHAR(MAX)
								,EngineBaseID VARCHAR(MAX)
								,RegionID VARCHAR(MAX)
								,EngineBlockID VARCHAR(MAX)
								,EngineVinID VARCHAR(MAX)
								,BodyTypeID VARCHAR(MAX)
								,SubModelID VARCHAR(MAX)
								,EngineDesignationID VARCHAR(MAX)
								,BrakeABSID VARCHAR(MAX)
								,FuelDeliveryTypeID VARCHAR(MAX)
								,AspirationID VARCHAR(MAX)
								,DriveTypeID VARCHAR(MAX)
								,TransmissionMfrCodeID VARCHAR(MAX)
								,TransmissionNumSpeedsID VARCHAR(MAX)
								,TransmissionControlTypeID VARCHAR(MAX)
								,ValvesID VARCHAR(MAX)
								,CylinderHeadTypeID VARCHAR(MAX)
								,FuelTypeID VARCHAR(MAX)
								,EngineVersionID VARCHAR(MAX)
								,FuelSystemDesignID VARCHAR(MAX)	
								,IgnitionSystemTypeID VARCHAR(MAX)
								,FuelDeliverySubTypeID VARCHAR(MAX)
								,FuelSystemControlTypeID VARCHAR(MAX)
								,TransmissionTypeID VARCHAR(MAX)
								,MfrBodyCodeID VARCHAR(MAX)
								,WheelBaseID VARCHAR(MAX)
								,BodyNumDoorsID VARCHAR(MAX)
								,BedTypeID VARCHAR(MAX)
								,TransmissionBaseID VARCHAR(MAX)
								,SteeringSystemID VARCHAR(MAX)
								,SteeringTypeID VARCHAR(MAX)
								,EngineMfrID VARCHAR(MAX)
								,PowerOutputID VARCHAR(MAX)
								,BedLengthID VARCHAR(MAX)
								)

INSERT INTO @ACESSnippetCodes
SELECT *
FROM	(
			SELECT 
				(
					SELECT t.x.value('./@id', 'varchar(max)') --
					FROM @Snippet.nodes('App/Make') t(x)

				) AS MakeID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/Model') t(x) 

				) AS ModelID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/PartType') t(x) 

				) AS PartTypeID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/Position') t(x) 

				) AS PositionID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/BaseVehicle') t(x) 

				) AS BaseVehicleID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/EngineBase') t(x) 

				) AS EngineBaseID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/Region') t(x) 

				) AS RegionID				
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/EngineBlock') t(x) 

				) AS EngineBlockID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/EngineVIN') t(x) 

				) AS EngineVinID				
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/BodyType') t(x) 

				) AS BodyTypeID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/SubModel') t(x) 

				) AS SubModelID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/EngineDesignation') t(x) 

				) AS EngineDesignationID				
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/BrakeABS') t(x) 

				) AS BrakeABSID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/FuelDeliveryType') t(x) 

				) AS FuelDeliveryTypeID				
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/Aspiration') t(x) 

				) AS AspirationID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/DriveType') t(x) 

				) AS DriveTypeID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/TransmissionMfrCode') t(x) 

				) AS TransmissionMfrCodeID				
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/TransmissionNumSpeeds') t(x) 

				) AS TransmissionNumSpeedsID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/TransmissionControlType') t(x) 

				) AS TransmissionControlTypeID				
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/Valves') t(x) 

				) AS ValvesID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/CylinderHeadType') t(x) 

				) AS CylinderHeadTypeID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/FuelType') t(x) 

				) AS FuelTypeID				
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/EngineVersion') t(x) 

				) AS EngineVersionID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/FuelSystemDesign') t(x) 

				) AS FuelSystemDesignID				
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/IgnitionSystemType') t(x) 

				) AS IgnitionSystemTypeID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/FuelDeliverySubType') t(x) 

				) AS FuelDeliverySubTypeID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/FuelSystemControlType') t(x) 

				) AS FuelSystemControlTypeID				
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/TransmissionType') t(x) 

				) AS TransmissionTypeID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/MfrBodyCode') t(x) 

				) AS MfrBodyCodeID				
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/WheelBase') t(x) 

				) AS WheelBaseID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/BodyNumDoors') t(x) 

				) AS BodyNumDoorsID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/BedType') t(x) 

				) AS BedTypeID				
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/TransmissionBase') t(x) 

				) AS TransmissionBaseID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/SteeringSystem') t(x) 

				) AS SteeringSystemID				
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/SteeringType') t(x) 

				) AS SteeringTypeID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/EngineMfr') t(x) 

				) AS EngineMfrID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/PowerOutput') t(x) 

				) AS PowerOutputID
				,(
					SELECT t.x.value('./@id', 'varchar(max)') 
					FROM @Snippet.nodes('App/BedLength') t(x) 

				) AS BedLengthID
		)
AS t

SELECT 
	@MakeName = CAST( '<!--'+ make.MakeName +'-->' AS XML)
	,@ModelName = CAST('<!--'+ model.ModelName +'-->'AS XML)
	,@Position = CAST('<!--'+ p.Position +'-->'AS XML)
	,@PartTypeName = CAST('<!--'+ part.PartTerminologyName +'-->'AS XML)
	,@Vehicle = CAST ('<!--'+ (

								SELECT CAST(B.YearID AS VARCHAR) + ' ' +  m.MakeName + ' ' + m2.ModelName 
								FROM Vcdb.dbo.BaseVehicle B
										JOIN Vcdb.dbo.Make M 
											ON B.MakeID = M.MakeID
										JOIN Vcdb.dbo.model M2 
											ON B.ModelID = M2.ModelID
								WHERE b.BaseVehicleID = t.BaseVehicleID

								)

					+'-->'AS XML)
	,@Engine =  CAST ('<!--'+ 
								CAST(e.Liter AS VARCHAR) + 'L ' +  e.BlockType + CAST(e.Cylinders AS VARCHAR) + ' ' + 
								CASE
									WHEN CAST(e.CC AS VARCHAR) = '-' THEN ''
									ELSE CAST(e.CC AS VARCHAR) + 'cc '
								END
					+'-->'AS XML)
	,@Region = CAST('<!--'+ r.RegionName +'-->'AS XML)
	,@Block = CAST ('<!--'+ 
								CAST(eb.Liter AS VARCHAR) + 'L ' +  eb.BlockType + CAST(eb.Cylinders AS VARCHAR) + ' ' + 
								CASE
									WHEN CAST(eb.CC AS VARCHAR) = '-' THEN ''
									ELSE CAST(eb.CC AS VARCHAR) + 'cc '
								END
					+'-->'AS XML)
	,@VIN = CAST('<!--'+ vin.EngineVINName +'-->'AS XML)
	,@SubModel = CAST('<!--'+ sm.SubmodelName +'-->'AS XML)
	,@BodyType = CAST('<!--'+ bt.BodyTypeName +'-->'AS XML)
	,@DriveType = CAST('<!--'+ dt.DriveTypeName +'-->'AS XML)
	,@Aspiration = CAST('<!--'+ a.AspirationName +'-->'AS XML)
	,@BrakeABS = CAST('<!--'+ babs.BrakeABSName  +'-->'AS XML)
	,@EngineDesignation = CAST('<!--'+ ed.EngineDesignationName +'-->'AS XML)
	,@FuelDeliveryType = CAST('<!--'+ fdt.FuelDeliveryTypeName +'-->'AS XML)
	,@TransmissionMfrCode = CAST('<!--'+ tmc.TransmissionMfrCode +'-->'AS XML)
	,@TransmissionNumSpeeds = CAST('<!--'+ tns.TransmissionNumSpeeds +'-->'AS XML)
	,@TransmissionControlType = CAST('<!--'+ tct.TransmissionControlTypeName  +'-->'AS XML)
	,@Valves = CAST('<!--'+ v.ValvesPerEngine +'-->'AS XML)
	,@CylinderHeadType = CAST('<!--'+ cht.CylinderHeadTypeName +'-->'AS XML)
	,@FuelType = CAST('<!--'+ ft.FuelTypeName +'-->'AS XML)
	,@EngineVersion = CAST('<!--'+ ev.EngineVersion +'-->'AS XML)
	,@FuelSystemDesign = CAST('<!--'+ fsd.FuelSystemDesignName  +'-->'AS XML)
	,@FuelDeliverySubType = CAST('<!--'+ fdst.FuelDeliverySubTypeName +'-->'AS XML)
	,@IgnitionSystemType = CAST('<!--'+ (
											SELECT DISTINCT IST.IgnitionSystemTypeName 
											FROM vcdb.dbo.EngineConfig EC
												JOIN vcdb.dbo.IgnitionSystemType IST
													ON IST.IgnitionSystemTypeID = EC.IgnitionSystemTypeID
												WHERE EC.IgnitionSystemTypeID  = t.IgnitionSystemTypeID
										) 
								+ '-->'AS XML)
	,@FuelSystemControlType = CAST('<!--'+ fsct.FuelSystemControlTypeName +'-->'AS XML)
	,@TransmissionType = CAST('<!--'+ tt.TransmissionTypeName +'-->'AS XML)
	,@MfrBodyCode = CAST('<!--'+ mbc.MfrBodyCodeName +'-->'AS XML)
	,@WheelBase = CAST('<!--'+ wb.WheelBaseDescription  +'-->'AS XML)
	,@BodyNumDoors = CAST('<!--'+ bnd.BodyNumDoors +'-->'AS XML)
	,@BedType = CAST('<!--'+ bedtype.BedTypeName +'-->'AS XML)
	,@SteeringSystem = CAST('<!--'+ ss.SteeringSystemName +'-->'AS XML)
	,@SteeringType = CAST('<!--'+ st.SteeringTypeName +'-->'AS XML)
	,@TransmissionBase = CAST('<!--'+ (
										
										
										
										SELECT TT.TransmissionTypeName + ' ' +  
										CAST(TNS.TransmissionNumSpeeds AS VARCHAR) + ' Speed' + ' ' 
										+ TCT.TransmissionControlTypeName	
										FROM vcdb.dbo.TransmissionBase TB
										LEFT JOIN vcdb.dbo.TransmissionType TT 
											ON TT.TransmissionTypeID = TB.TransmissionTypeID
										LEFT JOIN vcdb.dbo.TransmissionNumSpeeds TNS
											ON TNS.TransmissionNumSpeedsID = TB.TransmissionNumSpeedsID
										LEFT JOIN vcdb.dbo.TransmissionControlType TCT
											ON TCT.TransmissionControlTypeID = TB.TransmissionControlTypeID
										WHERE TB.TransmissionBaseID = t.TransmissionBaseID

									)

									  +'-->'AS XML)
	,@EngineMfr = CAST('<!--'+ (
									
									Select DISTINCT M.MfrName
									FROM Vcdb.dbo.EngineConfig EC
									JOIN Vcdb.dbo.Mfr M
									ON EC.EngineMfrID = M.MfrID
									WHERE ec.EngineMfrID = t.EngineMfrID
									
									
								)
					+'-->'AS XML)
	,@BedLength = CAST('<!--'+ bl.BedLengthDescription +'-->'AS XML)
	,@PowerOutput = CAST('<!--'+ (
									SELECT DISTINCT PO.HorsepowerDescription 
									FROM Vcdb.dbo.EngineConfig EC
									JOIN Vcdb.dbo.PowerOutput PO
										ON EC.PowerOutputID = PO.PowerOutputID
									WHERE EC.PowerOutputID = t.PowerOutputID
								) +'-->'AS XML)




FROM @ACESSnippetCodes t
LEFT JOIN  Vcdb.dbo.Make make
	ON make.MakeID = t.MakeID
LEFT JOIN Vcdb.dbo.Model model
	ON model.ModelID = t.ModelID
LEFT JOIN PCdb.dbo.Positions p
	ON p.PositionID = t.PositionID
LEFT JOIN PCdb.dbo.Parts part
	ON part.PartTerminologyID = t.PartTypeID
LEFT JOIN vcdb.dbo.EngineBase e
	ON e.EngineBaseID = t.EngineBaseID
LEFT JOIN vcdb.dbo.Region r
	ON r.RegionID = t.RegionID
LEFT JOIN Vcdb.dbo.EngineBlock eb
	ON t.EngineBlockID = eb.EngineBlockID 
LEFT JOIN vcdb.dbo.EngineVIN vin
	ON t.EngineVinID =  vin.EngineVINID
LEFT JOIN Vcdb.dbo.Submodel sm
	ON t.SubmodelID = sm.SubModelID
LEFT JOIN vcdb.dbo.BodyType bt
	ON t.BodyTypeID =  bt.BodyTypeID
LEFT JOIN vcdb.dbo.DriveType dt
	ON t.DriveTypeID = dt.DriveTypeID
LEFT JOIN Vcdb.dbo.Aspiration a
	ON t.AspirationID = a.AspirationID 
LEFT JOIN vcdb.dbo.BrakeABS babs
	ON t.BrakeABSID =  babs.BrakeABSID
LEFT JOIN Vcdb.dbo.EngineDesignation ed
	ON t.EngineDesignationID = ed.EngineDesignationID
LEFT JOIN vcdb.dbo.FuelDeliveryType fdt
	ON t.FuelDeliveryTypeID =  fdt.FuelDeliveryTypeID
LEFT JOIN vcdb.dbo.TransmissionMfrCode tmc
	ON t.TransmissionMfrCodeID = tmc.TransmissionMfrCodeID
LEFT JOIN Vcdb.dbo.TransmissionNumSpeeds tns
	ON t.TransmissionNumSpeedsID = tns.TransmissionNumSpeedsID 
LEFT JOIN vcdb.dbo.TransmissionControlType tct
	ON t.TransmissionControlTypeID =  tct.TransmissionControlTypeID
LEFT JOIN Vcdb.dbo.Valves v
	ON t.ValvesID = v.ValvesID
LEFT JOIN vcdb.dbo.CylinderHeadType cht
	ON t.CylinderHeadTypeID =  cht.CylinderHeadTypeID
LEFT JOIN Vcdb.dbo.FuelType ft
	ON t.FuelTypeID = ft.FuelTypeID 
LEFT JOIN vcdb.dbo.EngineVersion ev
	ON t.EngineVersionID =  ev.EngineVersionID
LEFT JOIN Vcdb.dbo.FuelSystemDesign fsd
	ON t.FuelSystemDesignID = fsd.FuelSystemDesignID
LEFT JOIN vcdb.dbo.FuelDeliverySubType fdst
	ON t.FuelDeliverySubTypeID =  fdst.FuelDeliverySubTypeID
LEFT JOIN vcdb.dbo.FuelSystemControlType fsct
	ON t.FuelSystemControlTypeID =  fsct.FuelSystemControlTypeID
LEFT JOIN Vcdb.dbo.TransmissionType tt
	ON t.TransmissionTypeID = tt.TransmissionTypeID 
LEFT JOIN vcdb.dbo.MfrBodyCode mbc
	ON t.MfrBodyCodeID =  mbc.MfrBodyCodeID
LEFT JOIN Vcdb.dbo.WheelBase wb
	ON t.WheelBaseID = wb.WheelBaseID
LEFT JOIN vcdb.dbo.BodyNumDoors bnd
	ON t.BodyNumDoorsID =  bnd.BodyNumDoorsID
LEFT JOIN vcdb.dbo.BedType bedtype
	ON t.BedTypeID =  bedtype.BedTypeID
LEFT JOIN vcdb.dbo.SteeringSystem ss
	ON t.SteeringSystemID =  ss.SteeringSystemID
LEFT JOIN Vcdb.dbo.SteeringType st
	ON t.SteeringTypeID = st.SteeringTypeID
LEFT JOIN Vcdb.dbo.BedLength bl
	ON t.BedLengthID = bl.BedLengthID

SET @Snippet.modify (
'
	insert sql:variable("@MakeName") 
	after (/App/Make)[1]

'
)

SET @Snippet.modify (
'
	insert sql:variable("@ModelName")
	after (/App/Model)[1]
'
)

SET @Snippet.modify (
'
	insert sql:variable("@Position")
	after (/App/Position)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@Vehicle")
	after (/App/BaseVehicle)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@PartTypeName")
	after (/App/PartType)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@Engine")
	after (/App/EngineBase)[1]

'
)

SET @Snippet.modify (
'
	insert sql:variable("@Region")
	after (/App/Region)[1]

'
)

SET @Snippet.modify (
'
	insert sql:variable("@Block")
	after (/App/EngineBlock)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@VIN")
	after (/App/EngineVIN)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@BodyType")
	after (/App/BodyType)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@SubModel")
	after (/App/SubModel)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@FuelDeliveryType")
	after (/App/FuelDeliveryType)[1]

'
)

SET @Snippet.modify (
'
	insert sql:variable("@EngineDesignation")
	after (/App/EngineDesignation)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@BrakeABS")
	after (/App/BrakeABS)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@Aspiration")
	after (/App/Aspiration)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@DriveType")
	after (/App/DriveType)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@TransmissionMfrCode")
	after (/App/TransmissionMfrCode)[1]

'
)

SET @Snippet.modify (
'
	insert sql:variable("@TransmissionNumSpeeds")
	after (/App/TransmissionNumSpeeds)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@TransmissionControlType")
	after (/App/TransmissionControlType)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@Valves")
	after (/App/Valves)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@CylinderHeadType")
	after (/App/CylinderHeadType)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@FuelType")
	after (/App/FuelType)[1]

'
)

SET @Snippet.modify (
'
	insert sql:variable("@EngineVersion")
	after (/App/EngineVersion)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@FuelSystemDesign")
	after (/App/FuelSystemDesign)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@IgnitionSystemType")
	after (/App/IgnitionSystemType)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@FuelDeliverySubType")
	after (/App/FuelDeliverySubType)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@FuelSystemControlType")
	after (/App/FuelSystemControlType)[1]

'
)

SET @Snippet.modify (
'
	insert sql:variable("@TransmissionType")
	after (/App/TransmissionType)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@MfrBodyCode")
	after (/App/MfrBodyCode)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@WheelBase")
	after (/App/WheelBase)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@BodyNumDoors")
	after (/App/BodyNumDoors)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@BedType")
	after (/App/BedType)[1]

'
)

SET @Snippet.modify (
'
	insert sql:variable("@TransmissionBase")
	after (/App/TransmissionBase)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@SteeringSystem")
	after (/App/SteeringSystem)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@SteeringType")
	after (/App/SteeringType)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@EngineMfr")
	after (/App/EngineMfr)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@PowerOutput")
	after (/App/PowerOutput)[1]

'
)
SET @Snippet.modify (
'
	insert sql:variable("@BedLength")
	after (/App/BedLength)[1]

'
)


RETURN @Snippet
END

