�
 TFRM_ORDERS 0�  TPF0Tfrm_Orders
frm_OrdersLeft� Top� Width7Height_CaptionOrders
Font.ColorclWindowTextFont.Height�	Font.NameSystem
Font.Style 	FormStyle
fsMDIChild	Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� �               �wwwwwwwwwwwwwwp�wwwwwwwwwwwwwwp�wwwwwwwwwxwwwwp�w�wwww����wwwwp�ww���w����wwwwp�wx��w���wwwwwp�w�������wwwwwp�wx������xwwwwwp�ww�x����xwwwwwp�wwx�w���xwwwwwp�wwx�wx��xwwwwwp���̏��������������̈����������������ȏ��������������̈�3����������������<���������������3����������������<���������������3����������������<���������������3����������������<���������������3����������������<���������������3����������������<���������������<�����������������������������������������������������������������                                                                                                                                Position	poDefaultVisible	WindowStatewsMaximizedOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TLabelLabel6LeftTop(WidthRHeightCaptionCompany Code
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman
Font.Style 
ParentFont  TLabel	lbCompanyLeftTop@Width:HeightCaption	(Company)
Font.ColorclBlueFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontShowAccelChar  TLabelLabel7LeftTop(Width>HeightCaption
Department
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman
Font.Style 
ParentFont  TLabellbDeptLeftPTop@WidthHHeightCaption(Department)
Font.ColorclBlueFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontShowAccelChar  TLabelLabel1LeftTop\WidthHeightCaptionItem
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman
Font.Style 
ParentFont  TLabelLabel2Left� Top\Width/HeightCaptionQuantity
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman
Font.Style 
ParentFont  TLabelLabel3Left(Top\WidthLHeightCaptionDelivery Type
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman
Font.Style 
ParentFont  TLabelLabel4LeftTop� Width^HeightCaptionDelivery Address
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman
Font.Style 
ParentFont  TLabel
lblItemDesLeftToptWidthHeight%AutoSizeCaption(no item selected)WordWrap	  TLabelLabel5LeftTop� Width8HeightCaptionComments
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman
Font.Style 
ParentFont  TMemomemDelAddressLeftTop� WidthHeight� 
ScrollBars
ssVerticalTabOrderWordWrap  TPanelPanel1Left Top Width/Height AlignalTopTabOrder TBitBtnbutton_CloseLeftTopWidthIHeightHintClose this windowTabOrder OnClickbutton_CloseClickKindbkClose  TBitBtnbutton_SubmitLeftXTopWidthIHeightCaption&SubmitTabOrderOnClickbutton_SubmitClick
Glyph.Data
|  x  BMx      v   (                                      �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� UUUUUUUUUUUUUUUUUUUUUUUUUUU�UUUUUUYUUUUUUW�UUUUU��UUUUUUww�UUUUU��UUUUUUww�UUUUY��UUUUWwwUUUU���UUUUwww�UUW���UUUWwuww�UUyUY�UUUwuUWw�UUUUUY�UUUUUWwUUUUUU�UUUUUUw�UUUUUY�UUUUUUWw�UUUUUUyUUUUUUw�UUUUUW�UUUUUUWw�UUUUUUY�UUUUUUWwUUUUUUUUUUUUUUUU  	NumGlyphs   TButtonButton1Left�Top'WidthHeightHint/Select department from company departments listCaption>>
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman
Font.Style 
ParentFontTabOrderOnClickButton1Click  	TMaskEdittxtQtyLeft� TopXWidth-HeightEditMask
!99999;0;_	MaxLengthTabOrder  TEdittxtCommentsLeftTop� Width� HeightTabOrder  	TComboBoxcmbItemsLeft(TopXWidth� HeightStylecsDropDownList
ItemHeightTabOrderOnChangecmbItemsChange  	TComboBoxcmbDeliveryLeftxTopXWidth� HeightStylecsDropDownList
ItemHeightTabOrder  TEditdbCodeLeftpTop(WidthYHeightAutoSize	MaxLengthTabOrder OnChangedbCodeChange  TEditdbDepartmentLeftPTop(Width]Height	MaxLengthTabOrderOnChangedbDepartmentChange  TDBMemomemTempLeft[Top� WidthRHeightY	DataFieldDelivery_Address
DataSourcedsDepReadOnly	TabOrder	VisibleWordWrap  TQueryqryGetCompanyDatabaseName	METROFILEParams.Data
     Code    SQL.StringsSELECT * FROM Company WHERE Code = :Code Left� Top(  TQuery
qryGetDeptDatabaseName	METROFILEParams.Data
     Code     Dept     SQL.StringsSELECT * FROM Department WHERE Code = :Code AND             Department = :Dept Left�Top(  TQueryqryTranTypesDatabaseName	METROFILESQL.Strings@select ChargeCode, TranType, Description  from Transaction_Type  LeftTop  TQueryqryDeliveryDatabaseName	METROFILESQL.Strings!select DeliveryType from Delivery LeftTopW  TDataSourcedsDepDataSet
qryGetDeptLeft�Top(  TQuery	qrySubmitDatabaseName	METROFILELeft�   TQueryqryAuthorityDatabaseName	METROFILEParams.Data
"     Code     
Department     SQL.Strings<select Authority_Code, Surname, Initials from Authority_Code where Code = :Code and Department = :Department LeftTop    