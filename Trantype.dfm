�
 TFRM_TRANTYPES 0  TPF0Tfrm_TranTypesfrm_TranTypesLeft� Top� Width�Height5CaptionTransaction Type Editor
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman
Font.Style 	FormStyle
fsMDIChildPosition	poDefaultVisible	WindowStatewsMaximizedOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TLabellbl_TranTypeLeftTop0Width_HeightCaptionTransaction Type  TLabellbl_ChargeCodeLeftTopPWidthEHeightCaptionCharge Code  TLabel	lbl_DescrLeftTop� Width>HeightCaptionDescription  TLabel
lbl_StatusLeftTopxWidthpHeightCaptionStatus Code  Change  TLabellbl_ToLeft TopxWidthHeightCaptionTo  TLabellbl_FromLeft� TopxWidthHeightCaptionFrom  TPanelpnl_TopLeft Top Width�Height AlignalTopTabOrder TBitBtn	btn_CloseLeftTopWidthIHeightTabOrder KindbkClose  TDBNavigatornav_TranTypesLeftPTopWidth� Height
DataSourceds_TranTypeVisibleButtonsnbFirstnbPriornbNextnbLastnbInsertnbDeletenbEdit	nbRefresh TabOrderOnClicknav_TranTypesClick  	TComboBox	cmb_TransLeftHTopWidthyHeightStylecsDropDownList
ItemHeightTabOrderOnChangecmb_TransChange   TDBEditedt_TranTypeLeft� Top0WidthyHeightHint3 character transaction code	DataFieldTranType
DataSourceds_TranType	MaxLength TabOrder   TDBEditedt_ChargeCodeLeft� TopPWidthyHeightHint5 character charge code 	DataField
ChargeCode
DataSourceds_TranType	MaxLength TabOrder  TDBMemomem_DescriptionLeft� Top� Width1HeightYHintdescription of this transaction	DataFieldDescription
DataSourceds_TranType
ScrollBars
ssVerticalTabOrder  TPanel
pnl_ChargeLeft=Top0Width|Height5TabOrder TDBCheckBox
chk_ChargeLeftTopWidthnHeightHint;Determines whether this Charge code is charged to customers	AlignmenttaLeftJustifyCaptionCan be Charged	DataField
Chargeable
DataSourceds_TranTypeTabOrder ValueCheckedYValueUncheckedN  TDBCheckBox	chk_OrderLeftTopWidthnHeightHint?Determines whether this Charge code can be ordered by Customers	AlignmenttaLeftJustifyCaptionCan be Ordered	DataField	Orderable
DataSourceds_TranTypeTabOrderValueCheckedYValueUncheckedN   TDBEditedt_StatusFromLeft� TopxWidthaHeight	DataField
FromStatus
DataSourceds_TranType	MaxLength TabOrder  TDBEditedt_StatusToLeft8TopxWidthqHeight	DataFieldToStatus
DataSourceds_TranType	MaxLength TabOrder  TTabletbl_TransTypeDatabaseName	METROFILEIndexFieldNamesTranType	TableNameTransaction_Type.DBLeft(Top�   TDataSourceds_TranTypeAutoEditDataSettbl_TransTypeLeftTop�   TQuery	qry_TransDatabaseName	METROFILESQL.Strings%SELECT TranType FROM Transaction_Type Left(Top�    