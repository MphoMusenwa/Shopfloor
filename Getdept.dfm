?
 TFRM_GETDEPT 0  TPF0Tfrm_GetDeptfrm_GetDeptLeftTopsActiveControldbgrid_CompanyBorderIcons BorderStylebsDialogCaptionSelect Customer DepartmentClientHeight'ClientWidthaColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height?	Font.NameTimes New Roman
Font.Style OldCreateOrder	PositionpoScreenCenterOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel1Left Top WidthaHeight? AlignalTopTabOrder  TLabelLabel2LeftTopWidthDHeightCaptionDepartments  TLabelLabel3LeftXTop? Width]HeightCaptionDepartment Code  TDBGriddbgrid_CompanyLeftTopWidthAHeight? 
DataSourceds_DepartmentTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclBlackTitleFont.Height?TitleFont.NameTimes New RomanTitleFont.Style 
OnColEnterdbgrid_CompanyColEnter
OnDblClickdbgrid_CompanyDblClick
OnKeyPressdbgrid_CompanyKeyPress  TEditedit_DepartmentLeft? Top? WidthyHeightTabOrder   TBitBtnbtnOKLeftTop WidthYHeight!Caption&OKTabOrderOnClick
btnOKClickKindbkOK  TBitBtn	btnCancelLeft Top WidthYHeight!Caption&CancelTabOrderKindbkCancel  TQueryqryDepartmentDatabaseName	METROFILESQL.StringsSELECT DISTINCT Department,Name FROM Department WHERE Code = :Code  
UpdateModeupWhereKeyOnlyLeftpTop 	ParamDataDataTypeftStringNameCode	ParamType	ptUnknown    TDataSourceds_DepartmentAutoEditDataSetqryDepartmentOnDataChangeds_DepartmentDataChangeLeft? Top   TQueryqryDeptNameDatabaseName	METROFILESQL.StringsSELECT Name FROM Department )WHERE Code = :code AND Department = :dept Left? Top 	ParamDataDataType	ftUnknownNamecode	ParamType	ptUnknown DataType	ftUnknownNamedept	ParamType	ptUnknown     