�
 TFRM_EMAIL 0�  TPF0
Tfrm_Email	frm_EmailLeft� TopwWidth>Height�CaptionMessagesFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	FormStyle
fsMDIChildPosition	poDefaultVisible	WindowStatewsMaximizedOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TPanelPanel1Left Top!Width6HeightqAlignalClientTabOrder  TLabelLabel1LeftTop
WidthHeightCaptionType:  TPanelPanel3Left0Top	WidthQHeightv
BevelInnerbvRaised
BevelOuter	bvLoweredTabOrder  TRadioButtonBtn_OutLeftTopCWidth)HeightCaptionOutTabOrder OnClickBtn_OutClick  TPanelPanel11Left Top WidthQHeight<
BevelInnerbvRaised
BevelOuter	bvLoweredTabOrder  TRadioButtonbtn_InLeftTop!Width1HeightCaptionInTabOrderOnClickBtn_InClick  TRadioButtonbtn_NewLeftTopWidth1HeightCaptionNewChecked	TabOrderTabStop	OnClickbtn_NewClick  TRadioButtonbtn_SentLeftTop]Width)HeightCaptionSentTabOrderOnClickbtn_SentClick   TPanelPanel4Left� Top	Width_HeightP
BevelOuter	bvLoweredCaptionPanel4TabOrder TLabelLabel7LeftTopWidth*HeightCaption	Subject :  TDBEditedit_SubjectLeft:TopWidthHeight	DataFieldSUBJECT
DataSource
MailSourceTabOrder   TDBLookupListBoxLBox_SubjectLeft:TopWidthHeight+KeyFieldSUBJECT	ListFieldSUBJECT
ListSource
MailSourceTabOrderOnClickLBox_SubjectClick   TPanelPanel5LeftTop� Width� Height
BevelOuter	bvLoweredCaptionPanel4TabOrder TLabelLabel2LeftTopWidthHeightCaptionFrom:  TDBEditFrom_BoxLeft%TopWidthyHeight	DataFieldMFROM
DataSource
MailSourceReadOnly	TabOrder    TPanelPanel6LeftTop� Width� Height
BevelOuter	bvLoweredCaptionPanel4TabOrder TLabelLabel3LeftTopWidthHeightCaptionDate:  TDBEdit	Edit_DateLeft$TopWidthyHeight	DataFieldMDATE
DataSource
MailSourceReadOnly	TabOrder    TPanelPanel7LeftTop� Width�Height~
BevelOuter	bvLoweredCaptionPanel4TabOrder TLabelLabel8LeftTopWidth.HeightCaptionMessage:  TDBMemoEdit_MessageLeft�TopWidth�HeightY	DataFieldMESSGE
DataSource
MailSourceTabOrder    TPanelPanel8Left� Top� WidthcHeight
BevelOuter	bvLoweredTabOrder TLabelLabel6LeftTopWidth!HeightCaptionStatus:  TDBEdit
Status_BoxLeft*TopWidth1Height	DataFieldSTATUS
DataSource
MailSourceReadOnly	TabOrder    TPanelPanel9Left� Top� Width� Height
BevelOuter	bvLoweredTabOrder TLabelLabel5LeftTopWidthHeightCaptionTo:  TDBLookupComboBoxTo_BoxLeftTopWidth� Height	DataFieldMTo
DataSource
MailSourceKeyFieldAuthority_Code	ListFieldSurname
ListSourcedts_ToTabOrder    TPanelPanel10LeftTop� Width� Height
BevelOuter	bvLoweredCaptionPanel4TabOrder TLabelLabel4LeftTopWidthHeightCaptionTime:  TDBEdit	Edit_TimeLeft$TopWidthYHeight	DataFieldMTIME
DataSource
MailSourceReadOnly	TabOrder    	TGroupBoxgrp_BoxRFileLeftnTop_Width� HeightbCaptionRequest FilesEnabledTabOrder TDBText
dis_FileNoLeftPTopWidthAHeight	DataFieldMFileNumber
DataSource
MailSource  TLabel	lbl_RecNoLeftTopWidth:HeightCaptionRecord No.:  TRadioButtonrad_ReqFileLeft	Top0WidthqHeightHint)Generate a Request to retrieve the recordCaptionRequest FileEnabledParentShowHintShowHint	TabOrder   TRadioButtonrad_RemoveQLeft	Top@WidthqHeightHint$Remove yourself from the Reserve QueCaptionRemove From QueEnabledParentShowHintShowHint	TabOrder  TBitBtnbtn_ProcessLeft� Top2WidthIHeightCaptionProcessEnabledTabOrderOnClickbtn_ProcessClickKindbkOK   TPanelPanel12Left� Top� WidthqHeight!Caption TabOrder	 TLabelLabel9LeftTopWidth)HeightCaption	Delivery:  TDBLookupComboBoxeditDeliverMethodLeft8TopWidth1HeightKeyFieldDescription	ListFieldDescription
ListSourcedts_DeliverTabOrder     TPanelPanel2Left Top Width6Height!AlignalTopTabOrder TBitBtn	btn_CloseLeftTopWidthKHeightTabOrder OnClickbtn_CloseClickKindbkClose  TDBNavigatorNav_MailLeft� TopWidth� Height
DataSource
MailSourceTabOrderOnClickNav_MailClick  TBitBtnbtn_SendLeftpTopWidthKHeightCaption&SendTabOrderOnClickbtn_SendClick
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� U0UP   UW�WwwwU0U���UW�uUUWU0P���UW����uU0    UUWwwww�U     UUwU_w�U x   pU_wU_wW� x�  wpUwUUwUW��� wwpUUUwUUW��wwpU�uUUW�	��wwpUw�UUUW����wwpUwuUu�UWU	���wwUwUUW_�uU���� UUUUUwwUU���UUUu�U_wUUUP��UUUUW_�wUUUUU UUUUUUwwUUUUU	NumGlyphs   TQueryQRY_MAIL
BeforePostQRY_MAILBeforePost	AfterPostQRY_MAILAfterPostAfterCancelQRY_MAILAfterCancelDatabaseNameminimetRequestLive	SQL.StringsSELECT * FROM USERMAIL  UniDirectional	Left� TopI TAutoIncFieldQRY_MAILTran_No	FieldNameTran_NoOrigin"USERID_MAIL.DB".Tran_No  TStringFieldQRY_MAILMfrom	FieldNameMfromOrigin"USERID_MAIL.DB".MfromSize  TStringFieldQRY_MAILMTo	FieldNameMToOrigin"USERID_MAIL.DB".MToSize  
TDateFieldQRY_MAILMDate	FieldNameMDateOrigin"USERID_MAIL.DB".MDate  TStringFieldQRY_MAILMTime	FieldNameMTimeOrigin"USERID_MAIL.DB".MTimeSize  TStringFieldQRY_MAILMessge	FieldNameMessgeOrigin"USERID_MAIL.DB".MessgeSize�   TStringFieldQRY_MAILStatus	FieldNameStatusOrigin"USERID_MAIL.DB".StatusSize  TStringFieldQRY_MAILMFileNumber	FieldNameMFileNumberOrigin"USERID_MAIL.DB".MFileNumber  TStringFieldQRY_MAILSubject	FieldNameSubjectOrigin"USERID_MAIL.DB".SubjectSize2   TDataSource
MailSourceDataSetQRY_MAILLeft� Topi  TQueryQry_AddDatabaseNameminimetRequestLive	SQL.StringsSELECT * FROM MAIL Left� Top)  TTable
tbl_RecordDatabaseNameminimetLeftTop@  TTabletbl_UpDatabaseNameminimet	TableName
Company.DBLeftTop`  TTabletbl_PickDatabaseNameminimet	TableNamePick.dbLeftTop�   TDataSourcedts_DeliverDataSettbl_DeliverLeft(Top�   TTabletbl_DeliverDatabaseNameminimet	TableNameDelivery.dbLeftNTop�   TDataSourcedts_ToDataSettbl_ToLeft�Top  TTabletbl_ToDatabaseNameminimet	TableNameAuthCode.DBLeft�Top   