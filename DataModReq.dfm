?
 TDATMODREQ 0?  TPF0
TDatModReq	DatModReqOldCreateOrder	Height? Width  	TADOQuery	qry_Items
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters Left? Top  TDataSource	dts_PickdDataSet	qry_PickdLeft?TopE  	TADOQueryqry_NotFiled
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.Stringsselect * from itemswhere (status = 'P')or (status = 'L')or (status = 'R')or (status = 'IU')or (status = 'AU') LeftTop  TDataSource	dts_ItemsDataSet	qry_ItemsLeft? TopE  	TADOQuery	qry_Pickd
Connectiondm_Metrofiler.ADOConnect_mFiler
CursorTypectStaticOnCalcFieldsqry_PickdCalcFields
Parameters SQL.Stringsselect * from pickd Left?Top TAutoIncFieldqry_PickdItemNo	FieldNameItemNoReadOnly	  TStringFieldqry_PickdBarcode	FieldNameBarcode  TIntegerFieldqry_PickdTx_No	FieldNameTx_No  TStringFieldqry_PickdWareHouse	FieldName	WareHouseSize  TStringFieldqry_PickdRow	FieldNameRowSize  TIntegerFieldqry_PickdLevelNum	FieldNameLevelNum  TIntegerFieldqry_PickdBay	FieldNameBay  TStringFieldqry_PickdLocNo	FieldNameLocNoSize  TIntegerFieldqry_PickdRecordNo	FieldNameRecordNo  TIntegerFieldqry_PickdMatched	FieldNameMatched  TStringFieldqry_PickdItemNumber	FieldName
ItemNumber  TStringFieldqry_PickdFilingMethod	FieldNameFilingMethodSize  TStringFieldqry_PickdTrType	FieldNameTrTypeSize  TStringFieldqry_PickdContainer	FieldName	Container	FixedChar	  TStringFieldqry_PickdMatchedDescr	FieldKindfkCalculated	FieldNameMatchedDescrSize

Calculated	   TDataSourcedts_NotFiledDataSetqry_NotFiledLeftTopE  TDataSource	dts_FilesLeftpTopE  TDataSourcedts_PickDataSetqry_PickLeft_TopE  TDataSourcedts_ContainerDataSetqry_ContainerLeft!TopE  	TADOQueryqry_Container
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.StringsSELECT * FROM DISPATCH Left!Top  	TADOQueryqry_FilesMain
Connectiondm_Metrofiler.ADOConnect_mFiler
ParametersNamemFileDataTypeftStringNumericScale? 	Precision? SizeValue   SQL.Strings-select * from files where filenumber = :mFile         LeftpTop  	TADOQuery	Qry_Files
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.Strings{select  filenumber,recordno,LocNo,Issuestatus from files where locno = :locno and warehouse = :mware and IssueStatus = 'IN'order by recordno LefthTop?   	TADOQueryqry_Gen
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.Strings7select text1,text2,text3,text4,text5,text6,date1,date2,5Number1,Number2  from files where filenumber = :mFile LeftTop?   	TADOQueryqry_UpdLocation2
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.StringsOupdate location set BoxNumber = null, Used = 'N' where warehouse = :mWHouse and(LocNo = :mLocNo and BoxNumber =  :mRecNo Left?Top?   	TADOQueryqry_Pick
Connectiondm_Metrofiler.ADOConnect_mFiler
CursorTypectStatic	AfterOpenqry_PickAfterOpenAfterScrollqry_PickAfterScrollOnCalcFieldsqry_PickCalcFields
Parameters SQL.Strings&SELECT * FROM PICK ORDER BY TX_NO DESC Left_Top TIntegerFieldqry_PickTx_No	FieldNameTx_NoOrigin
PICK.Tx_NoProviderFlags	pfInWhere ReadOnly	  TStringFieldqry_PickRequester	FieldName	RequesterOriginPICK.RequesterProviderFlags
pfInUpdate Size  TStringFieldqry_PickDeliver	FieldNameDeliverOriginPICK.DeliverProviderFlags
pfInUpdate Sized  TStringFieldqry_PickUserId	FieldNameUserIdOriginPICK.UserIdProviderFlags
pfInUpdate Size
  TDateTimeFieldqry_PickTxDate	FieldNameTxDateOriginPICK.TxDateProviderFlags
pfInUpdate   TStringFieldqry_PickType	FieldNameTypeOrigin	PICK.TypeProviderFlags
pfInUpdate Size  TStringFieldqry_PickTypeDesc	FieldNameTypeDescOriginPICK.TypeDescProviderFlags
pfInUpdate   TSmallintFieldqry_PickUpdated	FieldNameUpdatedOriginPICK.UpdatedProviderFlags
pfInUpdate   TStringFieldqry_PickStatus	FieldNameStatusOriginPICK.StatusProviderFlags
pfInUpdate Size  TStringFieldqry_PickBranchDisplayWidth	FieldNameBranchOriginPICK.BranchProviderFlags
pfInUpdate Size  TStringFieldqry_PickDepartmentDisplayWidth	FieldName
DepartmentOriginPICK.DepartmentProviderFlags
pfInUpdate Size  TStringFieldqry_PickBranch_Name	FieldNameBranch_NameProviderFlags
pfInUpdate Size2  TStringFieldqry_PickDept_Name	FieldName	Dept_NameProviderFlags
pfInUpdate Size2  TBooleanFieldqry_PickPrinted	FieldNamePrintedOriginMETROSQL.PICK.Printed  TStringFieldqry_PickDeliveryAddress	FieldNameDeliveryAddressSize?  TBooleanFieldqry_PickDeliveryNotePrinted	FieldNameDeliveryNotePrinted  TStringFieldqry_PickCostCentre	FieldName
CostCentreSize2  TStringFieldqry_PickInternalDept	FieldNameInternalDeptSize2  TStringFieldqry_PickSLA	FieldNameSLASize2  TIntegerFieldqry_PickSLAn	FieldNameSLAn  TStringFieldqry_PickPrintedDescr	FieldKindfkCalculated	FieldNamePrintedDescrSize
Calculated	  TStringFieldqry_PickComments	FieldNameCommentsSize?    	TADOQueryqry_UpdContainer
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.StringsSELECT * FROM DISPATCH Left?Top?   	TADOQuery
qry_GenIns
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.StringsSELECT * FROM DISPATCH Left? Top?   	TADOQueryqry_VerContContents
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters Left@Top?   	TADOQueryqry_SetFilesOffSite
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters Left?Top?   	TADOQueryqry_CheckLoc
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.StringsSELECT * FROM DISPATCH LeftFTop?   	TADOQueryqry_CheckFile
Connectiondm_Metrofiler.ADOConnect_mFiler
Parameters SQL.StringsSELECT * FROM DISPATCH Left? Top?    