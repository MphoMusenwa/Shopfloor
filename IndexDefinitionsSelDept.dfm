ÿ
 TFRM_INDEXDEFINITIONSSELDEPT 0K  TPF0Tfrm_IndexDefinitionsSelDeptfrm_IndexDefinitionsSelDeptLeftæ TopgBorderStylebsDialogCaptionSelect DepartmentClientHeight\ClientWidth|Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style OldCreateOrderPositionpoScreenCenterPixelsPerInch`
TextHeight TToolBarToolBar1Left Top Width|HeightCaptionToolBar1TabOrder  TToolButtonToolButton1Left Top WidthCaptionToolButton1StyletbsSeparator  TBitBtn
btn_SelectLeftTop WidthKHeightCaptionSelectDefault	TabOrder OnClickbtn_SelectClick
Glyph.Data
â  Ş  BMŞ      v   (   $            h                                   ÀÀÀ    ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ 333333333333333333  333333333333ó33333  334C3333333833333  33B$33333338ó3333  34""C333338333333  3B""$33333338ó333  4"*""C3338ó8ó3333  2"£¢"C3338ó3333  :*3:"$3338ø38ó8ó33  3£33¢"C33333333  3333:"$3333338ó8ó3  33333¢"C33333333  33333:"$3333338ó8ó  333333¢"C3333333  333333:"C3333338ó  3333333¢#3333333  3333333:3333333383  333333333333333333  	NumGlyphs  TToolButtonToolButton2LeftSTop WidthCaptionToolButton2
ImageIndex StyletbsSeparator  TBitBtnBitBtn1Left[Top WidthKHeightCancel	CaptionCancelModalResultTabOrder
Glyph.Data
â  Ş  BMŞ      v   (   $            h                                   ÀÀÀ    ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ 333333333333333333  3333333333?333333  39333333ó33?33  3939338ó3?ó3  39338ó8óø33  33338ó338ó  3393333833ø3  33333338ó33?3  33313333333833  3339333338ó333  3333333383333  339333333333  33333838ó8ó3  3339333333  33933333ø38ó8ó  3333339333833ÿ  33333333333333383  333333333333333333  	NumGlyphs  TToolButtonToolButton3Left¦ Top WidthCaptionToolButton3
ImageIndexStyletbsSeparator  TDBNavigatorDBNavigator1Left® Top WidthÈ Height
DataSourcedts_DeptVisibleButtonsnbFirstnbPriornbNextnbLast ParentShowHintShowHint	TabOrder   TDBGridDBGrid1Left TopWidth|HeightAlignalTop
DataSourcedts_DeptOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.HeightõTitleFont.NameMS Sans SerifTitleFont.Style 
OnDblClickDBGrid1DblClick	OnKeyDownDBGrid1KeyDownColumnsExpanded	FieldName
DepartmentTitle.CaptionCodeWidth(Visible	 Expanded	FieldNameNameVisible	    TButtonbtn_SearchCodeLeftTop0WidthKHeightCaptionSearch &CodeTabOrderOnClickbtn_SearchCodeClick  TButtonButton1Left`Top0WidthKHeightCaptionSearch &NameTabOrderOnClickButton1Click  	TADOQueryqry_Dept
Connectiondm_Metrofiler.ADOConnect_mFiler
BeforeOpenqry_DeptBeforeOpen
ParametersNameCOSizeÿValue  NameIDSizeÿValue  NameBRSizeÿValue   SQL.Strings:SELECT a.Department, a.Name FROM Departments a, DAuthRts b#WHERE (a.Department = b.Department)AND(a.Branch = b.Branch)AND(a.Code = :CO)AND(b.UserId = :ID)AND(b.Branch = :BR)(AND((a.Status <> 1)OR(a.Status is Null))order by a.Department LeftHTop8  TDataSourcedts_DeptAutoEditDataSetqry_DeptLeftHTopX   