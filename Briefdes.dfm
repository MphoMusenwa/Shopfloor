?
 TFRM_BRIEFDESCR 0?V  TPF0Tfrm_BriefDescrfrm_BriefDescrLeft? Top5WidthrHeight?HelpContext
CaptionBrief Description Editor
Font.ColorclBlackFont.Height?	Font.NameTimes New Roman
Font.Style 	FormStyle
fsMDIChild	Icon.Data
?             ?     (       @         ?                        ?  ?   ?? ?   ? ? ??  ??? ???   ?  ?   ?? ?   ? ? ??  ??? ?               ?wwwwwwwwwwwwwwp?wwwwwwwwwwwwwwp?wwwwwwwwwxwwwwp?w?wwww????wwwwp?ww???w????wwwwp?wx??w???wwwwwp?w???????wwwwwp?wx??????xwwwwwp?ww?x????xwwwwwp?wwx?w???xwwwwwp?wwx?wx??xwwwwwp???̏??????????????̈????????????????ȏ??????????????̈?3????????????????<???????????????3????????????????<???????????????3????????????????<???????????????3????????????????<???????????????3????????????????<???????????????3????????????????<???????????????<?????????????????????????????????????????????????????????????????                                                                                                                                Position	poDefaultVisible	WindowStatewsMaximizedOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TTabbedNotebookntb_BriefDescLeft Top WidthjHeightRHelpContext
AlignalClientTabFont.Color	clBtnTextTabFont.Height?TabFont.NameMS Sans SerifTabFont.Style TabOrder OnChangentb_BriefDescChange TTabPage LeftTopCaptionBrief Description (&1) TLabellbl_BriefDescLeftTop8WidthZHeightCaptionBrief Description
Font.ColorclBlackFont.Height?	Font.NameTimes New Roman
Font.Style 
ParentFont  TLabellbl_RetPeriodLeft?Top<WidthYHeightCaptionRetention period
Font.ColorclBlackFont.Height?	Font.NameTimes New Roman
Font.Style 
ParentFont  TLabellbl_CompanyLeftTopWidthRHeightCaptionCompany Code
Font.ColorclBlackFont.Height?	Font.NameTimes New Roman
Font.Style 
ParentFont  TLabellbl_DepartmentLeftTopWidth>HeightCaption
Department
Font.ColorclBlackFont.Height?	Font.NameTimes New Roman
Font.Style 
ParentFont  TLabellbl_ViewNameLeftTop? Width;HeightCaption	View Name
Font.ColorclBlackFont.Height?	Font.NameTimes New Roman
Font.Style 
ParentFont  TLabel
lbl_monthsLeft?TopRWidth0HeightCaption(months)  TLabellbl_ViewsAvailLeftTop? WidthVHeightCaptionAvailable Views  TLabellbl_CompanyNameLeftTop Width:HeightCaption	(Company)
Font.ColorclBlueFont.Height?	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontShowAccelChar  TLabellbl_DeptNameLeftXTop WidthHHeightCaption(Department)
Font.ColorclBlueFont.Height?	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontShowAccelChar  TLabellbl_CommentsLeftTopXWidth8HeightCaptionComments  TLabel	lbl_ItemsLeftHTop? Width)Height	AlignmenttaRightJustifyAutoSizeCaptionItem  TLabellbl_HeadingLeftDTophWidth-Height	AlignmenttaRightJustifyAutoSizeCaptionHeading  TDBEditedt_DescriptionLeftpTop8WidthHeightHint(Brief descriptions used for file captureHelpContext
	DataFieldDescription
DataSourcedts_BriefDescription
Font.ColorclBlackFont.Height?	Font.NameTimes New Roman
Font.Style 	MaxLength2
ParentFontTabOrder  TDBEditedt_RetentionPeriodLeft?Top8Width)HeightHint;The default retention period of boxes with this descriptionHelpContext
	DataFieldRETENTIONPERIOD
DataSourcedts_BriefDescription
Font.ColorclBlackFont.Height?	Font.NameTimes New Roman
Font.Style 	MaxLength 
ParentFontTabOrder  TDBEditedt_ViewNameLeftpTop? Width? HeightHint#Name of view defined in CREATE VIEWHelpContext
	DataFieldVIEWNAME
DataSourcedts_BriefDescription
Font.ColorclBlackFont.Height?	Font.NameTimes New Roman
Font.Style 	MaxLength
ParentFontReadOnly	TabOrder  TDBEditedt_DepartmentLeftXTopWidthYHeightHelpContext
	DataField
Department
DataSourcedts_BriefDescription
Font.ColorclBlackFont.Height?	Font.NameTimes New Roman
Font.Style 	MaxLength
ParentFontTabOrderOnChangeedt_DepartmentChange  TDBEditedt_CodeLeftpTopWidthYHeightHelpContext
	DataFieldCode
DataSourcedts_BriefDescription
Font.ColorclBlackFont.Height?	Font.NameTimes New Roman
Font.Style 	MaxLength
ParentFontTabOrder OnChangeedt_CodeChange  TButtonbtn_SelectDeptLeft?TopWidthHeightHint/Select department from company departments listHelpContext
Caption>>
Font.ColorclBlackFont.Height?	Font.NameTimes New Roman
Font.Style 
ParentFontTabOrderOnClickbtn_SelectDeptClick  TListBoxlst_ViewLeftpTop? Width? HeightAHint1Select a view from this for the brief description
ItemHeightTabOrderOnClicklst_ViewClick  TBitBtnbtn_RefreshViewsLeft8Top? WidthHeightHintRefresh the list of view namesHelpContext
TabOrderOnClickbtn_RefreshViewsClick
Glyph.Data
z  v  BMv      v   (                                     ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? 33333333333???33339??33333?ww??339????3337w37w?33??ps??33w37?w?9?3 9?37s3w3w?9?3ps3?37s37337??333339?w?33?37?330339?w?37?33s?33ps333w?3w333?33333w?3w????33 ???w?3www9?3 9??7??w7w9?3 3??7s?w?w3??ps???3w?7?ww39????3?37w37w3s339??333337ww333	NumGlyphs  TDBGridgrd_ViewLeftTop? Width1Height1HelpContext

DataSourcedts_ViewTabOrder
TitleFont.ColorclBlackTitleFont.Height?TitleFont.NameTimes New RomanTitleFont.Style Visible  TBitBtnbtn_ViewLeftTTop? WidthHeightHintDisplay selected viewHelpContext
TabOrder	OnClickbtn_ViewClick
Glyph.Data
|  x  BMx      v   (                                      ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? 33333333????????        wwwwwwww?????????????? ? ? ?w7sw7w7?????????????? ? ? ?w7sw7w7?????????????? ? ? ?w7sw7w7?????????????? ? ? ?w7sw7w7?????????????????????wwwwwwww?????Ȁ?wwww?        wwwwwwww33333333333333333333333333333333  	NumGlyphs  TDBMemomem_CommentsLeftpTopXWidth? Height)Hint(Comments regarding the brief descriptionHelpContext
	DataFieldComments
DataSourcedts_BriefDescription	MaxLength? 
ScrollBars
ssVerticalTabOrder  TListBoxlst_HeadingLeft`Top? WidthUHeight? Hint+List of Headings for this brief description
ItemHeightTabOrderOnClicklst_HeadingClick  TEditedt_LookItemLefttTop? Width? HeightHintItem to be added to LookupHelpContext
TabOrder  TBitBtnbtn_AddLookupLeftDTop? WidthHeightHintAdd Lookup to listHelpContext
TabOrderOnClickbtn_AddLookupClick
Glyph.Data
|  x  BMx      v   (                                      ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? UUUUUUUUU_?????UUP    UUwwwww?UUP????UU_??W?UUP? ?UUwwUW?UUP????UU_????UUP?  UUwwwW?UUP????UU_????UUP?  UUwwwW?UUP????UU_?UW?UUP? ??UUwu_??UUP??? UU_?wwUUUP???UUUwUuUUUP???UUU??wUUUUP   UUUUwwwuUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU  	NumGlyphs  TBitBtnbtn_DelLookupLeftDTop? WidthHeightHintDelete Selected LookupHelpContext
TabOrderOnClickbtn_DelLookupClick
Glyph.Data
z  v  BMv      v   (                                     ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? 33333333333333?33333303333337333333s33??33ws3< 330w337w?37w????3p  ww?wwww?3?0w???w?w?w????  wwwpwwwwwwww<??     7wwwwwww330???33????3< ??37ww773?<???3w??373?<??3w?ss??3? 3?  3ww??ww3<?3?37w3s73333?3333?s3333   33333www3	NumGlyphs  TEditedt_LookHeadingLefttTopdWidth? HeightHint$Heading under which item will appearHelpContext
TabOrder  TListBoxlst_ItemLeft?Top? WidthmHeight? Hint(List of Items for this brief description
ItemHeightTabOrderOnClicklst_ItemClick   TTabPage LeftTopCaptionDefine Views (&2) TLabellbl_NumFieldsLeft8Top? WidthOHeightCaptionNumeric Fields  TLabellbl_DateFieldsLeft8Top0Width<HeightCaptionDate Fields  TLabellbl_TextFieldsContLeft? Top0Width`HeightCaptionText Fields (cont.)  TLabellbl_TextFieldsLeftTop0Width:HeightCaptionText Fields  TLabellbl_NameOfViewLeftTopWidthIHeightCaptionName of View  TLabellbl_ViewOwnerLeftTopWidth@HeightCaption
View Owner  TDBEditedt_No15Left?Top? WidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos15
DataSourcedts_ViewDefinition	MaxLength TabOrderOnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TDBEditedt_No14Left?Top? WidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos14
DataSourcedts_ViewDefinition	MaxLength TabOrderOnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TDBEdit	edt_Text8Left? Top? WidthyHeightHelpContext
	DataFieldText8
DataSourcedts_ViewDefinition	MaxLength TabOrder  TDBEdit	edt_Text7Left? TophWidthyHeightHelpContext
	DataFieldText7
DataSourcedts_ViewDefinition	MaxLength TabOrder  TDBEdit	edt_Text6Left? Top@WidthyHeightHelpContext
	DataFieldText6
DataSourcedts_ViewDefinition	MaxLength TabOrder  TDBEdit	edt_Text1LeftTop@WidthyHeightHelpContext
	DataFieldText1
DataSourcedts_ViewDefinition	MaxLength TabOrder  TDBEdit	edt_Text2LeftTophWidthyHeightHelpContext
	DataFieldText2
DataSourcedts_ViewDefinition	MaxLength TabOrder  TDBEdit	edt_Text3LeftTop? WidthyHeightHelpContext
	DataFieldText3
DataSourcedts_ViewDefinition	MaxLength TabOrder  TDBEdit	edt_Text4LeftTop? WidthyHeightHelpContext
	DataFieldText4
DataSourcedts_ViewDefinition	MaxLength TabOrder  TDBEdit	edt_Text5LeftTop? WidthyHeightHelpContext
	DataFieldText5
DataSourcedts_ViewDefinition	MaxLength TabOrder
  TDBEditedt_Number1Left8Top? WidthyHeightHelpContext
	DataFieldNumeric1
DataSourcedts_ViewDefinition	MaxLength TabOrder  TDBEditedt_Number2Left8Top? WidthyHeightHelpContext
	DataFieldNumeric2
DataSourcedts_ViewDefinition	MaxLength TabOrder  TDBEdit	edt_Text9Left? Top? WidthyHeightHelpContext
	DataFieldText9
DataSourcedts_ViewDefinition	MaxLength TabOrder  TDBEdit
edt_Text10Left? Top? WidthyHeightHelpContext
	DataFieldText10
DataSourcedts_ViewDefinition	MaxLength TabOrder  TDBEdit	edt_Date1Left8Top@WidthyHeightHelpContext
	DataFieldDate1
DataSourcedts_ViewDefinition	MaxLength TabOrder  TDBEdit	edt_Date2Left8TophWidthyHeightHelpContext
	DataFieldDate2
DataSourcedts_ViewDefinition	MaxLength TabOrder  TDBEdit	edt_Date3Left8Top? WidthyHeightHelpContext
	DataFieldDate3
DataSourcedts_ViewDefinition	MaxLength TabOrder  TDBEditedt_No1Left? Top@WidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos1
DataSourcedts_ViewDefinition	MaxLength TabOrderOnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TDBEditedt_No2Left? TophWidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos2
DataSourcedts_ViewDefinition	MaxLength TabOrderOnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TDBEditedt_No3Left? Top? WidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos3
DataSourcedts_ViewDefinition	MaxLength TabOrderOnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TDBEditedt_No4Left? Top? WidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos4
DataSourcedts_ViewDefinition	MaxLength TabOrder	OnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TDBEditedt_No5Left? Top? WidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos5
DataSourcedts_ViewDefinition	MaxLength TabOrderOnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TDBEditedt_No6LeftTop@WidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos6
DataSourcedts_ViewDefinition	MaxLength TabOrderOnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TDBEditedt_No7LeftTophWidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos7
DataSourcedts_ViewDefinition	MaxLength TabOrderOnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TDBEditedt_No8LeftTop? WidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos8
DataSourcedts_ViewDefinition	MaxLength TabOrderOnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TDBEditedt_No9LeftTop? WidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos9
DataSourcedts_ViewDefinition	MaxLength TabOrderOnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TDBEditedt_No10LeftTop? WidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos10
DataSourcedts_ViewDefinition	MaxLength TabOrderOnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TDBEditedt_No11Left?Top@WidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos11
DataSourcedts_ViewDefinition	MaxLength TabOrderOnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TDBEditedt_No12Left?TophWidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos12
DataSourcedts_ViewDefinition	MaxLength TabOrderOnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TDBEditedt_No13Left?Top? WidthHeightHintPosition of column in ViewHelpContext
Color	clBtnFace	DataFieldPos13
DataSourcedts_ViewDefinition	MaxLength TabOrderOnClick	btn_Click
OnDblClick	btn_ClickOnExitbtn_Exit
OnKeyPressbtn_KeyPress  TBitBtn
btn_CreateLeftTopWidthQHeightHintCreate the ViewHelpContext
CaptionC&reateTabOrder%VisibleOnClickbtn_CreateClick
Glyph.Data
z  v  BMv      v   (                                     ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? 333333333333?333333?3333333w?333333?3?????w?   ????3wwwwwww??𙙙?37wwww?𙙙????wwwww 𙙙?w7wwwws?𙙙?3??wwww3 ????3w337ws3?????33????w33 ?  33w7wws33???333???s333??3333w7?3333??3333??s3333   33333www333333333333333333333	NumGlyphs  TBitBtnbtn_DropLeft_TopWidthQHeightHintDrop (delete) the ViewHelpContext
Caption&DropTabOrder&VisibleOnClickbtn_DropClick
Glyph.Data
|  x  BMx      v   (                                      ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? P  UUUWwwuU?U    UPUUwwwwU?UU U PUUUw?wWUUU UPUUUUw?W_?UUPP UUUW?uw?UUU PPUUUw?Ww?UUU	?UUU?uwww?UPU	??UW_wwwu?PP??0UWu?wwW_U PU	UwWUwuuuUUUUP??0UU_UWWWWUUUU3UUuUUuuUUUUUUP??UU?UUW_UUPUUUU?UWUUUUu?UUUUUUP?UUUUUUW_UUUUUUUUUUUUUUu  	NumGlyphs  TBitBtnbtn_AdvanceLeft?TopWidthQHeightHintTurn Advance View ON/OFFHelpContext
Caption SQLTabOrder#OnClickbtn_AdvanceClick
Glyph.Data
|  x  BMx      v   (                                      ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? 33333333????????        wwwwwwww?????????????? ?  ?w7swsw7??????????3??? ??  ?w7s7ww????????3337?????????????7?7?  ?????ww?7?77  ?????ww37337?????????????????????wwwwwwww?????Ȁs7wwwws7        wwwwwwww33333333333333333333333333333333  	NumGlyphs  TBitBtnbtn_ProcessLeft(TopWidthQHeightHint*Process the input and create SQL statementHelpContext
Caption&ProcessEnabledTabOrder"OnClickbtn_ProcessClick
Glyph.Data
|  x  BMx      v   (                                      ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? 7w33303?33?7? 370?sws33s? w330p w33377w?p337 w3?s?33w3p p333p7w733?7p733 7?s33ws 3333xw3??3?30 33 ?7w??ws0p73?s???s??p p p7 x7w7w?3w? wwp0p w3??77wp w707w??s7w 30s?w37xw33?s?33? 33s?sws33? w333s7w3s333  	NumGlyphs  TDBEditedt_NameOfViewLeftXTopWidthyHeightHelpContext
	DataFieldViewName
DataSourcedts_ViewDefinition	MaxLength TabOrder   TDBMemomem_SQLLeftTop@Width?Height? HelpContext
	DataFieldSQLstatement
DataSourcedts_ViewDefinitionTabOrderVisible  TBitBtnbtn_ShowLeft? TopWidthQHeightHintShow the viewHelpContext
Caption&ShowTabOrder!OnClickbtn_ShowClick
Glyph.Data
|  x  BMx      v   (                                      ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? 33333333????????        wwwwwwww?????????????? ? ? ?w7sw7w7?????????????? ? ? ?w7sw7w7?????????????? ? ? ?w7sw7w7?????????????? ? ? ?w7sw7w7?????????????????????wwwwwwww?????Ȁ?wwww?        wwwwwwww33333333333333333333333333333333  	NumGlyphs  TDBGridgrd_ShowViewLeftTop@Width?Height? HelpContext

DataSourcedts_ViewTabOrder TitleFont.ColorclBlackTitleFont.Height?TitleFont.NameTimes New RomanTitleFont.Style Visible  TDBEditedt_UserNameLeftPTopWidthyHeightHint"Name of the user who owns the viewHelpContext
	DataFieldUserName
DataSourcedts_ViewDefinitionEnabled	MaxLength TabOrder$  TListBoxlst_ReservedWordsLeftToplWidth9Heighti
ItemHeightItems.StringsABSOLUTEACTIONALLOCATEALTERARE	ASSERTIONATAUTHORIZATIONAVGBLOBBOTHCASCADECASCADEDCASTCATALOGCHARCHAR_LENGTH	CHARACTERCHARACTER_LENGTHCOLLATE COLLATIONCOLUMNCOMMITCONNECT
CONNECTIONCONSTRAINTSCORRESPONDINGCOUNTCREATEDATABASEDATEDAYDECIMALDECLARE
DEFERRABLEDEFERREDDELETEDESCRIBE
DESCRIPTORDIAGNOSTICS
DISCONNECTDOMAINDOUBLEDROPEND_EXECESCAPE	EXCEPTIONEXECUTE
EXPIREDATEEXTERNALEXTRACTFALSEFILEFILTERFIRSTFLOATFULLFUNCTIONGEN_ID	GENERATORGETGLOBALGRANTHOUR	IMMEDIATEINDEX	INITIALLYINNERINPUTINSERTINTEGERINTERVALJOINLASTLEADINGLEFTLOCALMATCHMAXMINMINUTEMONTHNAMESNATIONALNATURALNCHARNEXTNONUMERICOCTET_LENGTHOUTEROUTPUTOVERLAPSPADPARTIALPOSITION	PRECISIONPRESERVEPRIOR
PRIVILEGES	PROCEDURERELATIVERESTRICT
RETAINDAYSREVOKERIGHTROLLBACKROWSSCHEMASECONDSELECTSESSIONSETSHADOWSIZESMALLINTSPACESQLSTATE
STATISTICSSUMTABLETIME	TIMESTAMPTIMEZONE_HOURTIMEZONE_MINUTETRAILINGTRANSACTION	TRANSLATETRANSLATIONTRIGGERTRUEUNKNOWNUPDATEUPPERUSAGEUSINGVALUEVARCHARVIEWVOLUMEWORKWRITEYEARZONE Sorted	TabOrder'Visible  TListBoxlst_ReservedSymbolsLeftTop? Width9Height5
ItemHeightItems.Strings'- !"#%&*,./:;?@\]^`|~+<=>[ Sorted	TabOrder(Visible    TPanelpnl_TopLeft Top WidthjHeight HelpContext
AlignalTopTabOrder TBitBtn	btn_CloseLeftTopWidthIHeightHintClose this windowHelpContext
TabOrder OnClickbtn_CloseClickKindbkClose  TDBNavigatornav_DescrViewsLeft? TopWidth? HeightHelpContext

DataSourcedts_BriefDescriptionVisibleButtonsnbFirstnbPriornbNextnbLastnbInsertnbDeletenbEdit	nbRefresh TabOrderOnClicknav_DescrViewsClick  TBitBtnbtn_FindLeftPTopWidthIHeightHint)Use the SEARCH function to find a  recordHelpContext
Caption&FindTabOrderOnClickbtn_FindClick
Glyph.Data
z  v  BMv      v   (                                     ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? 333333333333333?3333330 ?????37w 0  330 w?ww?37w???333ws3?33?࿿ 33 w?3ws?3w?????33 w?3????w࿿   33w?3www?????????w?????sw??    3?w?wwww3w ?3333ws?s333?30 3333 37w3333w3333333 3333333w333333333333333?3333330 3333337w3333330 3333337w3333333333333333	NumGlyphs   TTabletbl_BriefDescriptionDatabaseName	METROFILE	TableNameBriefDescription.db
UpdateModeupWhereKeyOnlyLeft?  TDataSourcedts_BriefDescriptionAutoEditDataSettbl_BriefDescriptionOnDataChangedts_BriefDescriptionDataChangeLeft?  TQuery
qry_CreateDatabaseName	METROFILELeft?Top?   TQueryqry_DropViewDatabaseName	METROFILELeft?Top?   TTabletbl_ViewDefinitionAfterInsert"tblViewDefinitionAfterInsertOrEdit	AfterEdit"tblViewDefinitionAfterInsertOrEdit
BeforePosttbl_ViewDefinitionBeforePost	AfterPosttbl_ViewDefinitionAfterPostDatabaseName	METROFILE	TableNameViewDefinition.db
UpdateModeupWhereKeyOnlyLeft?  TDataSourcedts_ViewDefinitionAutoEditDataSettbl_ViewDefinitionLeft?  TDataSourcedts_ViewAutoEditDataSetqry_ViewLeft@Top8  TQueryqry_GetViewsDatabaseName	METROFILESQL.Strings.SELECT UserName, ViewName FROM ViewDefinition  ORDER By ViewName Left?Top?   TQueryqry_GetCompanyDatabaseName	METROFILEParams.Data
     Code    SQL.StringsSELECT Company FROM Company WHERE Code = :Code Left?Top?   TQueryqry_GetDeptDatabaseName	METROFILEParams.Data
     Code    Dept    SQL.StringsSELECT Name FROM Department WHERE Code = :Code AND             Department = :Dept Left?Top@  TQuery
qry_LookupDatabaseName	METROFILEParams.Data
#     CD     DP     DES     SQL.Strings,select ColumnHeading, Item from lookup_text where code = :CD and department = :DPand description = :DES Left?Top`  TQueryqry_ViewDatabaseName	METROFILELeft@Top   