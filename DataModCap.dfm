?
 TDATMODCAP 0?L  TPF0
TDatModCap	DatModCapOldCreateOrder	OnCreateDataModuleCreateHeight?Widths 	TADOQueryqry_RecordType
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.Strings*select * from filetype where dept = :mdept Left? Top>  	TADOQueryqry_3DWhouse
Connectiondm_Metrofiler.ADOConnect_mFiler
ParametersNamecUserDataTypeftStringNumericScale? 	Precision? Size
Value   SQL.StringsSELECT b.code, a.name, a.d3flagFROM LAuthRts b,whouse aWHERE (b.code = a.warehouse)AND(b.UserId = :cUser)AND(a.d3flag = 1) LeftTop?   	TADOQueryqry_BrowseFiles
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters LeftTopl  	TADOQueryqry_FileType
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.Strings
SELECT  * FROM FAuthRts,filetype WHERE (FAuthRts.name = :dept)'AND (filetype.type = FAuthRts.filetype)AND (FileType.D3Flag = 0) Left? Top?   	TADOQuery	qry_Items
Connectiondm_Metrofiler.ADOConnect_mFilerCursorLocationclUseServerAfterInsertqry_ItemsAfterInsert
BeforePostqry_ItemsBeforePost	AfterPostqry_ItemsAfterPost
Parameters SQL.StringsSELECT * FROM ITEMS Left?Top TStringFieldqry_ItemsItemNumber	FieldName
ItemNumber  TStringFieldqry_ItemsFileNumber	FieldName
FileNumberProviderFlags
pfInUpdate   TStringFieldqry_ItemsDescription	FieldNameDescriptionProviderFlags
pfInUpdate Size2  TStringFieldqry_ItemsFilingMethod	FieldNameFilingMethodProviderFlags
pfInUpdate Size  TStringFieldqry_ItemsStatus	FieldNameStatusProviderFlags
pfInUpdate Size  TDateTimeFieldqry_ItemsSentToFile	FieldName
SentToFileProviderFlags
pfInUpdate   TDateTimeFieldqry_ItemsDateFiled	FieldName	DateFiledProviderFlags
pfInUpdate   TStringFieldqry_ItemsText1	FieldNameText1ProviderFlags
pfInUpdate Sized  TStringFieldqry_ItemsText2	FieldNameText2ProviderFlags
pfInUpdate Sized  TStringFieldqry_ItemsText3	FieldNameText3ProviderFlags
pfInUpdate Sized  TStringFieldqry_ItemsText4	FieldNameText4ProviderFlags
pfInUpdate Sized  TStringFieldqry_ItemsText5	FieldNameText5ProviderFlags
pfInUpdate Sized  TStringFieldqry_ItemsText6	FieldNameText6ProviderFlags
pfInUpdate Sized  TDateTimeFieldqry_ItemsDate1	FieldNameDate1ProviderFlags
pfInUpdate   TStringFieldqry_ItemsItemFiler	FieldName	ItemFilerProviderFlags
pfInUpdate Size  TStringFieldqry_ItemsWarehouse	FieldName	WarehouseProviderFlags
pfInUpdate Size
  TStringFieldqry_ItemsLocNo	FieldNameLocNoProviderFlags
pfInUpdate Size  TIntegerFieldqry_ItemsRecordNo	FieldNameRecordNoProviderFlags
pfInUpdate   TStringFieldqry_ItemsIssuedTo	FieldNameIssuedToProviderFlags
pfInUpdate Sizee  TDateTimeFieldqry_ItemsIssuedOn	FieldNameIssuedOnProviderFlags
pfInUpdate   TIntegerFieldqry_ItemsitTxNo	FieldNameitTxNoProviderFlags
pfInUpdate   TDateTimeFieldqry_ItemsDate2	FieldNameDate2ProviderFlags
pfInUpdate   TIntegerFieldqry_ItemsNumber1	FieldNameNumber1ProviderFlags
pfInUpdate   TIntegerFieldqry_ItemsNumber2	FieldNameNumber2ProviderFlags
pfInUpdate   TDateTimeFieldqry_ItemsEntryDate	FieldName	EntryDateProviderFlags
pfInUpdate   TStringFieldqry_ItemsUserId	FieldNameUserIdProviderFlags
pfInUpdate   TStringFieldqry_ItemsIssuedUserID	FieldNameIssuedUserIDProviderFlags
pfInUpdate Size
  TStringFieldqry_ItemsFileType	FieldNameFileTypeProviderFlags
pfInUpdate Size  TStringFieldqry_ItemsText7	FieldNameText7ProviderFlags
pfInUpdate Sized  TStringFieldqry_ItemsText8	FieldNameText8ProviderFlags
pfInUpdate Sized  TStringFieldqry_ItemsText9	FieldNameText9ProviderFlags
pfInUpdate Sized  TStringFieldqry_ItemsText10	FieldNameText10ProviderFlags
pfInUpdate Size?   TDateTimeFieldqry_ItemsDate3	FieldNameDate3ProviderFlags
pfInUpdate   TIntegerFieldqry_ItemsImportBatchNo	FieldNameImportBatchNoProviderFlags
pfInUpdate   TDateTimeFieldqry_ItemsUpdatedOn	FieldName	UpdatedOn  TStringFieldqry_ItemsUpdatedBy	FieldName	UpdatedBySize?    TDataSource
dts_WhouseDataSet
qry_WHouseLeft[Top?   TDataSourcedts_LocationDataSetqry_LocLeftfTop#  TDataSourcedts_BrowseFilesDataSetqry_BrowseFilesLeftTop;  TDataSource	dts_ItemsAutoEditDataSet	qry_ItemsOnStateChangedts_ItemsStateChangeOnDataChangedts_ItemsDataChangeLeft?Top;  TDataSourcedts_FileTypeDataSetqry_FileTypeLeft? Top?   TDataSource	dts_FilesAutoEditDataSetqry_FilesMainOnStateChangedts_FilesStateChangeOnDataChangedts_FilesDataChangeLeft?Top;  	TADOQueryqry_FilesMain
Connectiondm_Metrofiler.ADOConnect_mFiler	AfterOpenqry_FilesMainAfterScrollAfterInsertqry_FilesMainAfterInsert
BeforePostqry_FilesMainBeforePost	AfterPostqry_FilesMainAfterPostAfterScrollqry_FilesMainAfterScrollOnCalcFieldsqry_FilesMainCalcFields
Parameters SQL.StringsSELECT * FROM FILESWHERE (Filenumber = 'xxxx')  Left?Top TStringFieldqry_FilesMainFileNumber	FieldName
FileNumberOriginFILES.FileNumber  TStringFieldqry_FilesMainBoxNumber	FieldName	BoxNumberOriginFILES.BoxNumberProviderFlags
pfInUpdate   TStringFieldqry_FilesMainLocno	FieldNameLocnoOriginFILES.LocnoProviderFlags
pfInUpdate Size  TIntegerFieldqry_FilesMainRecordNo	FieldNameRecordNoOriginFILES.RecordNoProviderFlags
pfInUpdate   TStringFieldqry_FilesMainWarehouseDisplayWidth
	FieldName	WarehouseOriginFILES.WarehouseProviderFlags
pfInUpdate Size
  TStringFieldqry_FilesMainLabeled	FieldNameLabeledOriginFILES.LabeledProviderFlags
pfInUpdate Size  TIntegerFieldqry_FilesMainStatus	FieldNameStatusOriginFILES.StatusProviderFlags
pfInUpdate   TStringFieldqry_FilesMainText1	FieldNameText1OriginFILES.Text1ProviderFlags
pfInUpdate Sized  TStringFieldqry_FilesMainText2	FieldNameText2OriginFILES.Text2ProviderFlags
pfInUpdate Sized  TStringFieldqry_FilesMainText3	FieldNameText3OriginFILES.Text3ProviderFlags
pfInUpdate Sized  TStringFieldqry_FilesMainText4	FieldNameText4OriginFILES.Text4ProviderFlags
pfInUpdate Sized  TStringFieldqry_FilesMainText5	FieldNameText5OriginFILES.Text5ProviderFlags
pfInUpdate Sized  TStringFieldqry_FilesMainText6	FieldNameText6OriginFILES.Text6ProviderFlags
pfInUpdate Sized  TDateTimeFieldqry_FilesMainDate1	FieldNameDate1OriginFILES.Date1ProviderFlags
pfInUpdate   TDateTimeFieldqry_FilesMainDate2	FieldNameDate2OriginFILES.Date2ProviderFlags
pfInUpdate   TIntegerFieldqry_FilesMainNumber1	FieldNameNumber1OriginFILES.Number1ProviderFlags
pfInUpdate   TIntegerFieldqry_FilesMainNumber2	FieldNameNumber2OriginFILES.Number2ProviderFlags
pfInUpdate   TDateTimeFieldqry_FilesMainEntryDate	FieldName	EntryDateOriginFILES.EntryDateProviderFlags
pfInUpdate   TIntegerFieldqry_FilesMainWip	FieldNameWipOrigin	FILES.WipProviderFlags
pfInUpdate   TIntegerFieldqry_FilesMainAons	FieldNameAonsOrigin
FILES.AonsProviderFlags
pfInUpdate   TIntegerFieldqry_FilesMainSaons	FieldNameSaonsOriginFILES.SaonsProviderFlags
pfInUpdate   TIntegerFieldqry_FilesMainInos	FieldNameInosOrigin
FILES.InosProviderFlags
pfInUpdate   TDateTimeFieldqry_FilesMainDestruct	FieldNameDestructOriginFILES.DestructProviderFlags
pfInUpdate   TStringFieldqry_FilesMainFileTypeDisplayWidth	FieldNameFileTypeOriginFILES.FileTypeProviderFlags
pfInUpdate Size  TStringFieldqry_FilesMainUserId	FieldNameUserIdOriginFILES.UserIdProviderFlags
pfInUpdate   TStringFieldqry_FilesMainIssuedTo	FieldNameIssuedToOriginFILES.IssuedToProviderFlags
pfInUpdate Size  TDateTimeFieldqry_FilesMainIssuedOn	FieldNameIssuedOnOriginFILES.IssuedOnProviderFlags
pfInUpdate   TStringFieldqry_FilesMainIssueStatusDisplayWidth	FieldNameIssueStatusOriginFILES.IssueStatusProviderFlags
pfInUpdate Size  TDateTimeFieldqry_FilesMainReturnedOn	FieldName
ReturnedOnOriginFILES.ReturnedOnProviderFlags
pfInUpdate   TIntegerFieldqry_FilesMainNoDest	FieldNameNoDestOriginFILES.NoDestProviderFlags
pfInUpdate   TIntegerFieldqry_FilesMainDestroy	FieldNameDestroyOriginFILES.DestroyProviderFlags
pfInUpdate   TStringFieldqry_FilesMainFilingMethod	FieldNameFilingMethodOriginFILES.FilingMethodProviderFlags
pfInUpdate Size  TStringFieldqry_FilesMainDepartment	FieldName
DepartmentOriginFILES.DepartmentProviderFlags
pfInUpdate Size  TIntegerFieldqry_FilesMainItTxNo	FieldNameItTxNoOriginFILES.ItTxNoProviderFlags
pfInUpdate   TStringFieldqry_FilesMainContainerNo	FieldNameContainerNoOriginFILES.ContainerNoProviderFlags
pfInUpdate   
TMemoFieldqry_FilesMainComments	FieldNameCommentsOriginFILES.CommentsProviderFlags
pfInUpdate BlobTypeftMemo  TStringFieldqry_FilesMainBranchDisplayWidth	FieldNameBranchOriginFILES.BranchProviderFlags
pfInUpdate Size  TStringFieldqry_FilesMainBranch_Name	FieldKindfkCalculated	FieldNameBranch_NameProviderFlags
pfInUpdate Size2
Calculated	  TStringFieldqry_FilesMainDept_Name	FieldKindfkCalculated	FieldName	Dept_NameProviderFlags
pfInUpdate Size2
Calculated	  TStringFieldqry_FilesMainWare_Name	FieldKindfkCalculated	FieldName	Ware_NameProviderFlags
pfInUpdate Size
Calculated	  TStringFieldqry_FilesMainCode	FieldNameCodeOrigin
FILES.CodeSize  TStringFieldqry_FilesMainText7	FieldNameText7Sized  TStringFieldqry_FilesMainText8	FieldNameText8Sized  TStringFieldqry_FilesMainText9	FieldNameText9Sized  TStringFieldqry_FilesMainText10	FieldNameText10Size?   TDateTimeFieldqry_FilesMainDate3	FieldNameDate3  TSmallintFieldqry_FilesMainRetentionPeriod	FieldNameRetentionPeriod  TStringFieldqry_FilesMainRecordCat	FieldName	RecordCatSize  TStringFieldqry_FilesMainUpdatedBy	FieldName	UpdatedBySize?   TDateTimeFieldqry_FilesMainUpdatedOn	FieldName	UpdatedOn   	TADOQueryqry_Dept
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.Strings#select DeptName from DAuthRts whereDAuthRts.UserId = :cUser"and DAuthRts.BranchName = :mBranch     Left<Top?  	TADOQueryqry_Location
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters Left-TopT  	TADOQueryqry_Loc
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.Strings#select distinct locno from location LeftfTopT  	TADOTabletbl_Location
Connectiondm_Metrofiler.ADOConnect_mFiler	TableNamedbo.locationLeft?Top#  	TADOQueryqry_FilesFind
Connectiondm_Metrofiler.ADOConnect_mFiler
ParametersNamemfileDataTypeftStringNumericScale? 	Precision? SizeValue  NameccDataTypeftStringNumericScale? 	Precision? SizeValue   SQL.Strings<select * from files where filenumber = :mfile and code = :cc Left8Top?  	TADOQuery
qry_GenSQL
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters LeftxTop?  	TADOQuery	Qry_Files
Connectiondm_Metrofiler.ADOConnect_mFiler
ParametersNamelocno
Attributes
paNullable DataTypeftStringNumericScale? 	Precision? SizeValue  Namemware
Attributes
paNullable DataTypeftStringNumericScale? 	Precision? Size
Value   SQL.Strings,select filenumber,recordno,LocNo,Issuestatus
from fileswhere locno = :locnoand warehouse = :mwareorder by recordno Left?Top?  	TADOQueryqry_SecureScan
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters LeftTop  	TADOQueryqry_FilesSearch
Connectiondm_Metrofiler.ADOConnect_mFilerAfterScrollqry_FilesSearchAfterScroll
Parameters Left?Top?   TDataSourcedts_FilesSearchDataSetqry_FilesSearchLeft?Top?   	TADOQuery	ap_ExecSp
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.StringsEXEC Met_ReSerial  :Location,	  :wHouse         Left? Topv  	TADOQueryqry_ItemView
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.StringsSELECT * FROM CHRISTEST LeftpTop8  	TADOQueryqry_CheckViewPerm
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters LeftpToph  	TADOQueryqry_ContainersMain
Connectiondm_Metrofiler.ADOConnect_mFiler
CursorTypectStaticAfterInsertqry_ContainersMainAfterInsert
BeforePostqry_ContainersMainBeforePostBeforeDeleteqry_ContainersMainBeforeDeleteOnCalcFieldsqry_ContainersMainCalcFields
Parameters SQL.StringsSELECT * FROM CONTAINERS Left0Top TStringFieldqry_ContainersMainContainer	FieldName	ContainerOriginCONTAINERS.Container  TStringFieldqry_ContainersMainLocno	FieldNameLocnoOriginCONTAINERS.LocnoProviderFlags
pfInUpdate Size  TStringFieldqry_ContainersMainWarehouseDisplayWidth
	FieldName	WarehouseOriginCONTAINERS.WarehouseProviderFlags
pfInUpdate Size
  TStringFieldqry_ContainersMainText1	FieldNameText1OriginCONTAINERS.Text1ProviderFlags
pfInUpdate Sized  TStringFieldqry_ContainersMainText2	FieldNameText2OriginCONTAINERS.Text2ProviderFlags
pfInUpdate Sized  TStringFieldqry_ContainersMainText3	FieldNameText3OriginCONTAINERS.Text3ProviderFlags
pfInUpdate Sized  TStringFieldqry_ContainersMainText4	FieldNameText4OriginCONTAINERS.Text4ProviderFlags
pfInUpdate Sized  TStringFieldqry_ContainersMainText5	FieldNameText5OriginCONTAINERS.Text5ProviderFlags
pfInUpdate Sized  TStringFieldqry_ContainersMainText6	FieldNameText6OriginCONTAINERS.Text6ProviderFlags
pfInUpdate Sized  TDateTimeFieldqry_ContainersMainDate1	FieldNameDate1OriginCONTAINERS.Date1ProviderFlags
pfInUpdate   TDateTimeFieldqry_ContainersMainDate2	FieldNameDate2OriginCONTAINERS.Date2ProviderFlags
pfInUpdate   TIntegerFieldqry_ContainersMainNumber1	FieldNameNumber1OriginCONTAINERS.Number1ProviderFlags
pfInUpdate   TIntegerFieldqry_ContainersMainNumber2	FieldNameNumber2OriginCONTAINERS.Number2ProviderFlags
pfInUpdate   TDateTimeFieldqry_ContainersMainEntryDate	FieldName	EntryDateOriginCONTAINERS.EntryDateProviderFlags
pfInUpdate   TIntegerFieldqry_ContainersMainWip	FieldNameWipOriginCONTAINERS.WipProviderFlags
pfInUpdate   TIntegerFieldqry_ContainersMainAons	FieldNameAonsOriginCONTAINERS.AonsProviderFlags
pfInUpdate   TIntegerFieldqry_ContainersMainSaons	FieldNameSaonsOriginCONTAINERS.SaonsProviderFlags
pfInUpdate   TIntegerFieldqry_ContainersMainInos	FieldNameInosOriginCONTAINERS.InosProviderFlags
pfInUpdate   TDateTimeFieldqry_ContainersMainDestruct	FieldNameDestructOriginCONTAINERS.DestructProviderFlags
pfInUpdate   TStringFieldqry_ContainersMainFileTypeDisplayWidth	FieldNameFileTypeOriginCONTAINERS.FileTypeProviderFlags
pfInUpdate Size  TStringFieldqry_ContainersMainUserId	FieldNameUserIdOriginCONTAINERS.UserIdProviderFlags
pfInUpdate   TStringFieldqry_ContainersMainIssuedTo	FieldNameIssuedToOriginCONTAINERS.IssuedToProviderFlags
pfInUpdate Size  TDateTimeFieldqry_ContainersMainIssuedOn	FieldNameIssuedOnOriginCONTAINERS.IssuedOnProviderFlags
pfInUpdate   TStringFieldqry_ContainersMainIssueStatus	FieldNameIssueStatusOriginCONTAINERS.IssueStatusProviderFlags
pfInUpdate Size  TDateTimeFieldqry_ContainersMainReturnedOn	FieldName
ReturnedOnOriginCONTAINERS.ReturnedOnProviderFlags
pfInUpdate   TIntegerFieldqry_ContainersMainNoDest	FieldNameNoDestOriginCONTAINERS.NoDestProviderFlags
pfInUpdate   TIntegerFieldqry_ContainersMainDestroy	FieldNameDestroyOriginCONTAINERS.DestroyProviderFlags
pfInUpdate   TStringFieldqry_ContainersMainDepartment	FieldName
DepartmentOriginCONTAINERS.DepartmentProviderFlags
pfInUpdate Size  
TMemoFieldqry_ContainersMainComments	FieldNameCommentsOriginCONTAINERS.CommentsProviderFlags
pfInUpdate BlobTypeftMemo  TStringFieldqry_ContainersMainBranchDisplayWidth	FieldNameBranchOriginCONTAINERS.BranchProviderFlags
pfInUpdate Size  TStringFieldqry_ContainersMainContType	FieldNameContTypeOriginCONTAINERS.ContTypeProviderFlags
pfInUpdate Size  TStringFieldqry_ContainersMainBranch_Name	FieldKindfkCalculated	FieldNameBranch_NameProviderFlags
pfInUpdate Size2
Calculated	  TStringFieldqry_ContainersMainDept_Name	FieldKindfkCalculated	FieldName	Dept_NameProviderFlags
pfInUpdate Size2
Calculated	  TStringFieldqry_ContainersMainWare_Name	FieldKindfkCalculated	FieldName	Ware_NameProviderFlags
pfInUpdate Size
Calculated	  TStringFieldqry_ContainersMainCode	FieldNameCodeOriginCONTAINERS.CodeSize  TIntegerFieldqry_ContainersMainItTxNo	FieldNameItTxNo  TStringFieldqry_ContainersMainText7	FieldNameText7Sized  TStringFieldqry_ContainersMainText8	FieldNameText8Sized  TStringFieldqry_ContainersMainText9	FieldNameText9Sized  TStringFieldqry_ContainersMainText10	FieldNameText10Size?   TDateTimeFieldqry_ContainersMainDate3	FieldNameDate3  TSmallintField!qry_ContainersMainRetentionPeriod	FieldNameRetentionPeriod  TDateTimeFieldqry_ContainersMainUpdatedOn	FieldName	UpdatedOn  TStringFieldqry_ContainersMainUpdatedBy	FieldName	UpdatedBySize?    TDataSourcedts_ContainersMainAutoEditDataSetqry_ContainersMainOnStateChangedts_ContainersMainStateChangeOnDataChangedts_ContainersMainDataChangeLeft0Top8  TDataSourcedts_RecordTypeDataSetqry_RecordTypeLeftTop@  	TADOQuery
qry_WHouse
Connectiondm_Metrofiler.ADOConnect_mFiler
ParametersNameCUSERDataTypeftStringNumericScale? 	Precision? Size
Value   SQL.StringsSELECT b.CODE, a.NAME, a.D3FLAGFROM LAUTHRTS b,WHOUSE aWHERE (b.CODE = a.WAREHOUSE)AND (b.USERID = :CUSER)+AND ((a.D3FLAG <> 1) OR (a.D3FLAG IS NULL)) Left\Top?   TDataSourcedts_3DWhouseDataSetqry_3DWhouseLeftTop?   	TADOQueryqry_3DFileType
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.Strings
SELECT  * FROM FAuthRts,filetype WHERE (FAuthRts.name = :dept)'AND (filetype.type = FAuthRts.filetype)AND (FileType.D3Flag = 1) Left? Top?   TDataSourcedts_3DFileTypeDataSetqry_3DFileTypeLeft? Top?   	TADOQueryqry_GetConStatus
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters Left@Top?   TDataSourcedts_GetConStatusDataSetqry_GetConStatusLeftHTop?   	TADOQueryqry_RecsinCont
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters LeftPTop@  TDataSourcedts_ContTypeDataSetqry_ContTypeLeft? Top(  	TADOQueryqry_ContType
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.Stringsselect ContType from ContTypes Left? Top   	TADOQueryqry_InsertHist
Connectiondm_Metrofiler.ADOConnect_mFiler
ParametersNamenBarcodeSize?Value  Name	nDateTRetSize?Value   SQL.Strings'INSERT INTO History (Barcode, DateTRet)Values (:nBarcode, :nDateTRet)     Left?Top?   	TADOQueryqry_BrowseItems
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters LeftTop<  TDataSourcedts_BrowseItemsDataSetqry_BrowseItemsLeftTop  	TADOQueryqry_SQL
Connectiondm_Metrofiler.ADOConnect_mFiler
CursorTypectStaticLockType
ltReadOnly
ParametersNamenBarcodeSize?Value  Name	nDateTRetSize?Value   SQL.Strings'INSERT INTO History (Barcode, DateTRet)Values (:nBarcode, :nDateTRet)     LeftTop  	TADOQueryqry_BrowseContainers
Connectiondm_Metrofiler.ADOConnect_mFiler
CursorTypectStaticLockType
ltReadOnly
Parameters Left	Top?   TDataSourcedts_BrowseContainersAutoEditDataSetqry_BrowseContainersLeftTop?    