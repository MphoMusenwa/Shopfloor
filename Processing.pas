//============================================================\\
//===Platform: Windows
//===Development Tool:  Borland® Developer Studio Enterprise
//===Database Connectivity:  ADO
//============================================================\\
unit Processing;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, TabNotBk, DB, DBTables,
  DBCtrls, Mask, GetComp, GetDept, INIFiles, GetBox, Grids,
  DBGrids, Menus, ComCtrls, Printers, FileCtrl, WinSpool, Variants,
  QRCtrls, QuickRpt, framItemAuditLoc, ADODB,
  DateUtils, framPutAwayFileItem;

Type
  Results  = record
    Filenumber  :String[30];
    FileType    :String[30];
    Dept_Name   :String[30];
    Warehouse   :String[30];
    Text1       :String[50];
    Text2       :String[50];
    Text3       :String[50];
    Text4       :String[50];
    Text5       :String[50];
    Text6       :String[50];
    Date1       :TDate;
    Date2       :TDate;
  end;
  LookupRecord = Record
    ColumnHeading   :String[50];
    Item            :String[50];
  end;
  EBoxError = class(Exception);
  Tfrm_Processing = class(TForm)
    pnl_Top: TPanel;
    Label1: TLabel;
    LookupFile: TEdit;
    btn_FindFile: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    GroupBox3: TGroupBox;
    Label44: TLabel;
    Label46: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    editFilesWIP: TDBEdit;
    editFilesAons: TDBEdit;
    editFilesSaons: TDBEdit;
    editFilesInos: TDBEdit;
    GroupBox4: TGroupBox;
    Label22: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    Label21: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    lbl_RContainer: TLabel;
    lbl_CStat: TLabel;
    DBEdit1: TDBEdit;
    EditRecordNo: TDBEdit;
    editFilesEntryDate: TDBEdit;
    editFilesUserid: TDBEdit;
    edt_RStatus: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    edt_RContainer: TDBEdit;
    edt_CStat: TDBEdit;
    TabSheet5: TTabSheet;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Date_Filed: TDateTimePicker;
    editDescription: TDBEdit;
    editFilingMethod: TDBEdit;
    editStatus: TDBEdit;
    editItemCode: TDBEdit;
    editFile: TDBEdit;
    editDate2File: TDBEdit;
    editDateFiled: TDBEdit;
    lbl_DateFormat: TLabel;
    nav_Capture: TDBNavigator;
    DBGrid2: TDBGrid;
    Label67: TLabel;
    editItemFiler: TDBEdit;
    TabSheet10: TTabSheet;
    qry_repRecordHead: TADOQuery;
    btn_PrintRecordDetails: TSpeedButton;
    rep_Result: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRSysData4: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel7: TQRLabel;
    ql_Text1: TQRLabel;
    ql_Text2: TQRLabel;
    ql_Text3: TQRLabel;
    ql_Text4: TQRLabel;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText24: TQRDBText;
    qrlbl4: TQRDBText;
    qrlbl3: TQRDBText;
    qrlbl2: TQRDBText;
    qrlbl1: TQRDBText;
    QRDBText25: TQRDBText;
    btn_InUse: TSpeedButton;
    btn_InUseItem: TSpeedButton;
    scbar_metadata: TScrollBox;
    pnl_Text1: TPanel;
    txt_Text1: TDBText;
    edt_RText1: TDBEdit;
    pnl_Text2: TPanel;
    txt_Text2: TDBText;
    edt_RText2: TDBEdit;
    pnl_Text3: TPanel;
    txt_Text3: TDBText;
    edt_RText3: TDBEdit;
    pnl_Text4: TPanel;
    txt_Text4: TDBText;
    edt_RText4: TDBEdit;
    pnl_Text5: TPanel;
    txt_Text5: TDBText;
    edt_RText5: TDBEdit;
    pnl_Text6: TPanel;
    txt_Text6: TDBText;
    edt_RText6: TDBEdit;
    pnl_Text7: TPanel;
    txt_Text7: TDBText;
    edt_RText7: TDBEdit;
    pnl_Text8: TPanel;
    txt_Text8: TDBText;
    edt_RText8: TDBEdit;
    pnl_Text9: TPanel;
    txt_Text9: TDBText;
    edt_RText9: TDBEdit;
    pnl_Text10: TPanel;
    txt_Text10: TDBText;
    edt_RText10: TDBEdit;
    pnl_Date1: TPanel;
    txt_Date1: TDBText;
    lbl_DateFormat1: TLabel;
    edt_RDate1: TDBEdit;
    pnl_Date2: TPanel;
    txt_Date2: TDBText;
    lbl_DateFormat2: TLabel;
    edt_RDate2: TDBEdit;
    pnl_Date3: TPanel;
    txt_Date3: TDBText;
    lbl_DateFormat3: TLabel;
    edt_RDate3: TDBEdit;
    pnl_Num1: TPanel;
    txt_Num1: TDBText;
    edt_RNum1: TDBEdit;
    pnl_Num2: TPanel;
    txt_Num2: TDBText;
    edt_RNum2: TDBEdit;
    GroupBox17: TGroupBox;
    editFileNoDestroy: TDBCheckBox;
    Label5: TLabel;
    edt_FileRetentionPeriod: TDBEdit;
    btn_CalcDestFiles: TButton;
    editFilesDestruct: TDBEdit;
    lbl_DateFormat4: TLabel;
    Panel4: TPanel;
    btn_ViewImage: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Label48: TLabel;
    Splitter1: TSplitter;
    ScrollBox2: TScrollBox;
    btn_SelFileDestroyDate: TSpeedButton;
    btn_Comments: TSpeedButton;
    qry_repRecordDetail: TADOQuery;
    btn_ManualRetr: TSpeedButton;
    TabSheet7: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label26: TLabel;
    lbl_CBranchCap: TDBText;
    lbl_CDeptCap: TDBText;
    Label34: TLabel;
    Label51: TLabel;
    GroupBox9: TGroupBox;
    Label64: TLabel;
    Label66: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label63: TLabel;
    DBEdit12: TDBEdit;
    edt_ConEntryDate: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit2: TDBEdit;
    cmb_ContType: TDBLookupComboBox;
    btn_CBranchCap: TButton;
    edt_CBranchCap: TDBEdit;
    btn_CDeptCap: TButton;
    edt_CDeptCap: TDBEdit;
    btn_CRTypeCap: TButton;
    edt_CRTypeCap: TDBEdit;
    edt_ContainerNo: TDBEdit;
    ScrollBox3: TScrollBox;
    pnl_CText1: TPanel;
    DBText3: TDBText;
    edt_CText1: TDBEdit;
    pnl_CText2: TPanel;
    DBText4: TDBText;
    edt_CText2: TDBEdit;
    pnl_CText3: TPanel;
    DBText6: TDBText;
    edt_CText3: TDBEdit;
    pnl_CText4: TPanel;
    DBText7: TDBText;
    edt_CText4: TDBEdit;
    pnl_CText5: TPanel;
    DBText8: TDBText;
    edt_CText5: TDBEdit;
    pnl_CText6: TPanel;
    DBText9: TDBText;
    edt_CText6: TDBEdit;
    pnl_CText7: TPanel;
    DBText10: TDBText;
    edt_CText7: TDBEdit;
    pnl_CText8: TPanel;
    DBText11: TDBText;
    edt_CText8: TDBEdit;
    pnl_CText9: TPanel;
    DBText12: TDBText;
    edt_CText9: TDBEdit;
    pnl_CText10: TPanel;
    DBText13: TDBText;
    edt_CText10: TDBEdit;
    pnl_CDate1: TPanel;
    DBText14: TDBText;
    lbl_DateFormat5: TLabel;
    edt_CDate1: TDBEdit;
    pnl_CDate2: TPanel;
    DBText15: TDBText;
    lbl_DateFormat6: TLabel;
    edt_CDate2: TDBEdit;
    pnl_CDate3: TPanel;
    DBText16: TDBText;
    lbl_DateFormat7: TLabel;
    edt_CDate3: TDBEdit;
    pnl_CNum1: TPanel;
    DBText17: TDBText;
    edt_CNum1: TDBEdit;
    pnl_CNum2: TPanel;
    DBText18: TDBText;
    edt_CNum2: TDBEdit;
    GroupBox8: TGroupBox;
    Label56: TLabel;
    lbl_DateFormat8: TLabel;
    SpeedButton2: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    DBEdit10: TDBEdit;
    Button1: TButton;
    DBEdit11: TDBEdit;
    GroupBox18: TGroupBox;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    btn_ContComments: TSpeedButton;
    Label52: TLabel;
    btn_IRecordType: TButton;
    edt_IRecordType: TDBEdit;
    ScrollBox4: TScrollBox;
    pnl_iText1: TPanel;
    DBText19: TDBText;
    edt_IText1: TDBEdit;
    pnl_iText2: TPanel;
    DBText20: TDBText;
    edt_IText2: TDBEdit;
    pnl_iText3: TPanel;
    DBText21: TDBText;
    edt_IText3: TDBEdit;
    pnl_iText4: TPanel;
    DBText22: TDBText;
    edt_IText4: TDBEdit;
    pnl_iText5: TPanel;
    DBText23: TDBText;
    edt_IText5: TDBEdit;
    pnl_iText6: TPanel;
    DBText25: TDBText;
    edt_IText6: TDBEdit;
    pnl_iText7: TPanel;
    DBText26: TDBText;
    edt_IText7: TDBEdit;
    pnl_iText8: TPanel;
    DBText27: TDBText;
    edt_IText8: TDBEdit;
    pnl_iText9: TPanel;
    DBText28: TDBText;
    edt_IText9: TDBEdit;
    pnl_iText10: TPanel;
    DBText29: TDBText;
    edt_IText10: TDBEdit;
    pnl_iDate1: TPanel;
    DBText30: TDBText;
    Label53: TLabel;
    edt_IDate1: TDBEdit;
    pnl_iDate2: TPanel;
    DBText31: TDBText;
    Label54: TLabel;
    edt_IDate2: TDBEdit;
    pnl_iDate3: TPanel;
    DBText32: TDBText;
    Label57: TLabel;
    edt_IDate3: TDBEdit;
    pnl_iNum1: TPanel;
    DBText33: TDBText;
    edt_INum1: TDBEdit;
    pnl_iNum2: TPanel;
    DBText34: TDBText;
    edt_INum2: TDBEdit;
    Bevel1: TBevel;
    lbl_Col1: TLabel;
    lbl_Col2: TLabel;
    lbl_Col3: TLabel;
    lbl_Col4: TLabel;
    lbl_Col5: TLabel;
    lbl_Col6: TLabel;
    lbl_Col9: TLabel;
    lbl_Col10: TLabel;
    lbl_Col7: TLabel;
    lbl_Col8: TLabel;
    lbl_Col11: TLabel;
    lbl_Col14: TLabel;
    lbl_Col15: TLabel;
    lbl_Col12: TLabel;
    lbl_Col13: TLabel;
    edt_Col1: TEdit;
    edt_Col2: TEdit;
    edt_Col3: TEdit;
    edt_Col4: TEdit;
    edt_Col5: TEdit;
    edt_Col6: TEdit;
    edt_Col7: TEdit;
    edt_Col8: TEdit;
    edt_Col9: TEdit;
    edt_Col10: TEdit;
    edt_Col11: TEdit;
    edt_Col12: TEdit;
    edt_Col13: TEdit;
    edt_Col14: TEdit;
    edt_Col15: TEdit;
    Panel8: TPanel;
    Label47: TLabel;
    ResultGrid: TDBGrid;
    btn_Close: TSpeedButton;
    chk_DCMatchItemstoFile: TCheckBox;
    Label40: TLabel;
    Label41: TLabel;
    Label45: TLabel;
    Label30: TLabel;
    lbl_RBranchSrc: TLabel;
    lbl_RDeptSrc: TLabel;
    lbl_RWHouseSrc: TLabel;
    Label28: TLabel;
    lbl_SearchRecordCat: TLabel;
    edt_RBranchSrc: TEdit;
    btn_SelBranch: TButton;
    edt_RDeptSrc: TEdit;
    btn_SelDept: TButton;
    btn_SelRecordType: TButton;
    edt_RRTypeSrc: TEdit;
    edt_RWHouseSrc: TEdit;
    btn_SelWHouse: TButton;
    cb_SearchType: TComboBox;
    cb_SearchRecordCat: TComboBox;
    lbl_RecordFound: TLabel;
    Bevel2: TBevel;
    btn_Search: TBitBtn;
    btn_Print: TBitBtn;
    chk_Partial: TCheckBox;
    qry_RecCat: TADOQuery;
    Label17: TLabel;
    Label32: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    DBText2: TDBText;
    DBText24: TDBText;
    Label29: TLabel;
    lbl_RecordCat: TLabel;
    btn_RBranchCap: TButton;
    edt_RBranchCap: TDBEdit;
    btn_RDeptCap: TButton;
    edt_RDeptCap: TDBEdit;
    btn_RRTypeCap: TButton;
    edt_RRTypeCap: TDBEdit;
    edt_FileMeth: TDBEdit;
    edt_RecordCat: TDBEdit;
    btn_RecordCat: TButton;
    qry_Auto: TADOQuery;
    qry_SQL: TADOQuery;
    sp_SearchbyRecordType: TADOStoredProc;
    ds_SearchbyRecordType: TDataSource;
    EditFileNumber: TDBEdit;
    Button2: TButton;
    btnMatch: TSpeedButton;
    btn_PrintItemCoversheet: TSpeedButton;
    edt_FileLocation: TEdit;
    procedure DBEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_KeyPress(Sender: TObject; var Key: Char);
    procedure dbnav_EditClick(Sender: TObject; Button: TNavigateBtn);
    procedure btn_CalcDestFilesClick(Sender: TObject);
    procedure CheckFile;
    procedure RefreshFields(Dataset   :TDataset);
    procedure HideFields;
    procedure btn_FindFileClick(Sender: TObject);
    procedure EditFileNumberExit(Sender: TObject);
    procedure nav_CaptureBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure btn_SearchClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    function ExecuteFile(const FileName, Params, DefaultDir: string;
         ShowCmd: Integer): THandle;
    procedure Date_FiledChange(Sender: TObject);
    procedure btn_PutAwayItemClick(Sender: TObject);
    procedure edt_RStatusChange(Sender: TObject);
    procedure editWhouseCloseUp(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure PageControl1Change(Sender: TObject);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure edt_RRTypeSrcChange(Sender: TObject);
    procedure btn_SelRecordTypeClick(Sender: TObject);
    procedure edt_RBranchSrcChange(Sender: TObject);
    procedure edt_RDeptSrcChange(Sender: TObject);
    procedure btn_SelWHouseClick(Sender: TObject);
    procedure edt_RWHouseSrcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_RBranchCapClick(Sender: TObject);
    procedure btn_RDeptCapClick(Sender: TObject);
    procedure btn_RRTypeCapClick(Sender: TObject);
    procedure edt_RRTypeCapChange(Sender: TObject);
    procedure btn_CBranchCapClick(Sender: TObject);
    procedure btn_CDeptCapClick(Sender: TObject);
    procedure btn_CRTypeCapClick(Sender: TObject);
    procedure edt_CRTypeCapChange(Sender: TObject);
    procedure nav_CaptureClick(Sender: TObject; Button: TNavigateBtn);
    procedure editFileNoDestroyClick(Sender: TObject);
    procedure btn_PrintRecordDetailsClick(Sender: TObject);
    procedure rep_ResultBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure btn_PrintClick(Sender: TObject);
    procedure btn_InUseClick(Sender: TObject);
    procedure EditText1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editConText1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_InUseItemClick(Sender: TObject);
    procedure ResultGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn_ViewImageClick(Sender: TObject);
    procedure btn_SelFileDestroyDateClick(Sender: TObject);
    procedure btn_CommentsClick(Sender: TObject);
    procedure btn_ManualRetrClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btn_IRecordTypeClick(Sender: TObject);
    procedure edt_IRecordTypeChange(Sender: TObject);
    procedure cb_SearchTypeChange(Sender: TObject);
    procedure edt_IText1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_ContCommentsClick(Sender: TObject);
    procedure btn_RecordCatClick(Sender: TObject);
    procedure Button2Enter(Sender: TObject);
    procedure sp_SearchbyRecordTypeAfterScroll(DataSet: TDataSet);
    procedure edt_RBranchSrcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_RDeptSrcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_RRTypeSrcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_SearchRecordCatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnMatchClick(Sender: TObject);
    procedure QRDBText8Print(sender: TObject; var Value: string);
    procedure btn_PrintItemCoversheetClick(Sender: TObject);
  private
    { Private declarations }
    Lookups                     :Array of LookupRecord;
    procedure DoAutoFill;
  public
    { Public declarations }
    procedure DisplayRecord(aRecordNumber :String);
    procedure DisplayItem(aItemNumber :String);
  end;

var
  frm_Processing: Tfrm_Processing;
  Tipe            :Integer;
  Result          :Array[1..1000] of Results;
  InsertFlag      :Boolean;

implementation

uses ShellAPI, main, DataModCap, ContainerSearch, SelBranch,
  SelDept, SelRType, SelWHouse, DataVer, RecordLookup,
  MetrofilerDataModule, getdate, RecordComments, ManualRetrieval, Location,
  ContainerComments, SelRCat, MetroImp, FileCoversheet, ItemCoversheet;

{$R *.DFM}

function Tfrm_Processing.ExecuteFile(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): THandle;
var
  zFileName, zParams, zDir: array[0..255] of Char;
begin
  Result := ShellExecute(Application.MainForm.Handle, nil,
    StrPCopy(zFileName, FileName), StrPCopy(zParams, Params),
    StrPCopy(zDir, DefaultDir), ShowCmd);
end;

procedure Tfrm_Processing.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  iResult : Integer;
begin
  With DatmodCap do
    begin
      if dts_Files.State in [dsEdit,dsInsert] then
        begin
          iResult := MessageDlg('Do you want to save your changes?', mtInformation, [mbYes,mbNo,mbAbort], 0);
          if iResult = mrYes then
            qry_FilesMain.Post
          else if iResult = mrNo then
            qry_FilesMain.Cancel;
        end;

      qry_Dept.Active := false;
      qry_Whouse.Active := false;
      qry_RecordType.Active := false;
      qry_3DFileType.Active := false;
      qry_FileType.Active := false;
      qry_3DWHouse.active := false;
      qry_FilesMain.Active := false;
      qry_ContainersMain.Active := false;
      qry_Items.Active := false;
      frm_Console.act_Capture.Enabled := true;
      frm_Console.fProcessing := Nil;
      Action := caFree;
    end;    //With DatModCon
end;

procedure Tfrm_Processing.FormCreate(Sender: TObject);
Var
  Flag3D          :Boolean;
  LocView         :Boolean;
  J               :Integer;
begin
  chk_Partial.checked := (frm_Console.PartialSearch = 1);

//-----Disable quick find-------
Label1.Visible := false;
LookUpFile.Visible := false;
Btn_FindFile.Visible := false;
//----
btn_ViewImage.Visible := (frm_Console.fEntMan = 1)or(frm_Console.feRecMan = 1);
//----
Flag3D := frm_Console.AccessRight(39);
LocView := frm_Console.AccessRight(27);
If frm_Console.AccessRight(19) Then
  nav_capture.VisibleButtons := [nbInsert,nbDelete,nbEdit,nbPost,nbCancel,nbRefresh]
else nav_capture.VisibleButtons := [nbInsert,nbEdit,nbPost,nbCancel,nbRefresh];

btn_InUse.Visible := frm_Console.AccessRight(20);
btn_InUseItem.Visible := frm_Console.AccessRight(20);
btn_ManualRetr.Visible := frm_Console.AccessRight(36);

Tabsheet7.TabVisible := Flag3D;

label19.Visible := LocView;
label20.Visible := LocView;
edt_FileLocation.Visible := LocView;
editRecordNo.Visible := LocView;
DBEdit12.Visible := LocView;
DBEdit2.Visible := LocView;
label63.Visible := LocView;
label64.Visible := LocView;
DBEdit1.Visible := LocView;
label22.Visible := LocView;
With DatmodCap do
begin
  Screen.Cursor := crHourglass;
  PageControl1.ActivePage := Tabsheet1;
  nav_Capture.DataSource := dts_Files;
//-------------------------------------
//-------------------------------------<<
  qry_WHouse.Active := false;
  qry_WHouse.Parameters.ParambyName('CUSER').Value := User;
  qry_WHouse.Active := true;
  qry_WHouse.First;
//-------------------------------------<<
  qry_3dWHouse.Active := false;
  qry_3dWHouse.Parameters.ParambyName('CUSER').Value := User;
  qry_3dWHouse.Active := true;
  qry_3dWHouse.First;

edt_RStatusChange(Self);

lbl_DateFormat1.Caption := ShortDateFormat;
lbl_DateFormat2.Caption := ShortDateFormat;
lbl_DateFormat3.Caption := ShortDateFormat;
lbl_DateFormat4.Caption := ShortDateFormat;
lbl_DateFormat5.Caption := ShortDateFormat;
lbl_DateFormat6.Caption := ShortDateFormat;
lbl_DateFormat7.Caption := ShortDateFormat;
lbl_DateFormat8.Caption := ShortDateFormat;
Screen.Cursor := crDefault;
end;    //With DatModCap
  //=====Don't display fields = no record type selected======
  For J := 1 to 15 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible := False;
    end;
//=====
cb_SearchTypeChange(cb_SearchType);
end;

procedure Tfrm_Processing.dbnav_EditClick(Sender: TObject;
  Button: TNavigateBtn);
var
  mFileNo :string;
begin
  With DatmodCap do
    begin
      case Button of
        nbInsert  : begin
                    end;
        nbPost    : begin
                      If nav_Capture.DataSource = dts_Files Then
                        begin
                          mFileNo := qry_FilesMain.FieldByName('FilenUmber').AsString;
                          qry_FilesMain.Close;
                          qry_FilesMain.SQL.Clear;
                          qry_FilesMain.SQL.Add('SELECT * FROM Files WHERE Filenumber = :Filenumber');
                          qry_FilesMain.Parameters.ParamByName('Filenumber').Value := mFileNo;
                          qry_FilesMain.Open;
                        end;
                    end;
      end;
  end;
end;


procedure Tfrm_Processing.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Processing.btn_KeyPress(Sender: TObject;
  var Key: Char);
begin
With DatmodCap do
begin
  if UpCase(Key) = 'I' then
  begin
    qry_FilesMain.Append;
    dbnav_EditClick(Sender, nbInsert);
  end;

  if UpCase(Key) = 'D' then
  begin
    qry_FilesMain.Delete;
    dbnav_EditClick(Sender, nbDelete);
  end;

  if UpCase(Key) = 'E' then
  begin
    qry_FilesMain.Edit;
    dbnav_EditClick(Sender, nbEdit);
  end;
end;    //With DatModCap
end;


procedure Tfrm_Processing.btn_CalcDestFilesClick(Sender: TObject);
begin
  if (DatmodCap.qry_FilesMain.State <> dsEdit) and  (DatmodCap.qry_FilesMain.State <> dsInsert)then
    begin
      MessageDLG('The record must be in edit mode before calculating the destruction date',mtInformation,[mbOK],0);
      exit;
    end;
  DatmodCap.CalculateDestructionDateFiles;
end;

procedure Tfrm_Processing.CheckFile;
  var
    cType : char;
    i : integer;
    sSuffix : String[10];
    sBoxNumber : String[25];
    sBox : String[30];
  begin
    i := 1;
    sBoxNumber := '';
    sBox := editFileNumber.Text;
    while sBox[i] in ['0'..'9'] do
      begin
        sBoxNumber := sBoxNumber + sBox[i];
        i := i + 1;
      end;
    sSuffix := copy(sBox,i,length(sBox)-i);
    cType := sBox[length(sBox)];
    if cType <> 'F' then
       begin
//      MessageDlg('Error. A barcode must end with a F character!',mtError,[mbOK],0);
//      exit;
        sBox := trim(editFileNumber.Text) + 'F';
        editFileNumber.Text := sBox;
      end;
  end;

procedure Tfrm_Processing.btn_FindFileClick(Sender: TObject);
begin
  If PageControl1.ActivePage = TabSheet2 Then
    begin
      With DatmodCap do
        begin
//--------
//CHECK STATE OF DATA SET ... CANT MOVE IF IN EDIT
//--------
          if dts_Files.State in [dsEdit,dsInsert] then
            begin
              if MessageDlg('Do you want to save your changes?', mtInformation,
                                    [mbYes,mbNo], 0) = mrNo then
                begin
                  qry_FilesMain.Cancel;
                  Exit;
                end
              else
                qry_FilesMain.Post
            end;
//--------
          Screen.Cursor := crHourglass;
          qry_FilesMain.Close;
          qry_FilesMain.SQL.Clear;
          qry_FilesMain.SQL.Add('Select * from files where filenumber = :MFILE and Code = :CC');
          qry_FilesMain.Parameters.ParamByName('MFILE').Value := lookupfile.text;
          qry_FilesMain.Parameters.ParamByName('CC').Value := CompsCode;
          qry_FilesMain.Open;
          if qry_FilesMain.isEmpty then
            begin
              Screen.Cursor := crDefault;
              MessageDLG('No Files found',mtInformation,[mbOK],0);
              exit;
            end;
          dm_Metrofiler.InsAudit('View File', 0, 0, lookupfile.text, '', 0);
          RefreshFields(DatModCap.qry_FileType);
          Screen.Cursor := crDefault;
        end;
    end;
  If PageControl1.ActivePage = TabSheet7 Then
    begin
      DatmodCap.qry_ContainersMain.Active := False;
      DatmodCap.qry_ContainersMain.SQL.Clear;
      DatmodCap.qry_ContainersMain.SQL.Add('SELECT * FROM CONTAINERS WHERE CONTAINER = :CN AND CODE = :CC');
      DatmodCap.qry_ContainersMain.Parameters.ParamByName('CN').Value := lookupfile.Text;
      DatmodCap.qry_ContainersMain.Parameters.ParamByName('CC').Value := CompsCode;
      DatmodCap.qry_ContainersMain.Active := True;
      If DatmodCap.qry_ContainersMain.IsEmpty Then
        begin
          Showmessage('No Result found!!');
          exit;
        end;
      dm_Metrofiler.InsAudit('View Container', 0, 0, lookupfile.text, '', 0);
    end;
end;

procedure Tfrm_Processing.EditFileNumberExit(Sender: TObject);
begin
//CheckFile;
end;

procedure Tfrm_Processing.nav_CaptureBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  If Button = nbRefresh Then
    begin
      If nav_Capture.DataSource.DataSet.State in dsEditModes then
        begin
          Messagedlg('Cannot Refresh while in Edit Mode', mtInformation, [mbOK], 0);
          Abort
        end;
    end;
end;


function VerifyText(Header, Value  :String):Boolean;
Var
  CheckStr, TStr  :String;
  C :Integer;
begin
  Repeat
    CheckStr := '';
    frm_DataVer.Top := 0;
    frm_DataVer.Left := 0;
    frm_DataVer.Height := Screen.Height;
    frm_DataVer.Width := Screen.Width;
    If frm_DataVer.Execute = mrOK Then
      begin
        CheckStr := frm_DataVer.edt_Value.Text;
        TStr := '';
        For C := length(CheckStr) downto 1 Do
          TStr := TStr + CheckStr[C];
        CheckStr := TStr;
      end
    else
      begin
        Result := False;
        exit;
      end;
    If CheckStr <> Value Then
      Messagedlg('The verified Text does not match! Please re-enter!', mtWarning, [mbOK], 0);
  Until CheckStr = Value;
  Result := True;
end;


procedure Tfrm_Processing.DoAutoFill;
var
  AutoInsertFlag :Boolean;
  j, A      :Integer;
  LabelStr   :String;
begin
//==============================================================================
//----------AutoInsert Feature--------------------------------------------------
//==============================================================================
  If edt_RRTypeSrc.Text = '"General Search"' Then
    exit;

  qry_Auto.Close;
  qry_Auto.SQL.Clear;
  qry_Auto.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :Description');
  qry_Auto.Parameters.ParamValues['Description'] := edt_RRTypeSrc.Text;
  dm_Metrofiler.ExecuteCached(qry_Auto, EncodeTime(1,0,0,0));
  If qry_Auto.IsEmpty Then
    begin
      qry_SQL.Close;
      exit;
    end;
//-------
  AutoInsertFlag := False;

  For J := 1 to 15 Do
    begin
      If TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible Then
        begin
          A := TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag;
          LabelStr := TEdit(FindComponent('edt_Col'+InttoStr(J))).Text;

          If (A >= 1)and(A <= 10)Then
            begin
              If (qry_Auto.FieldbyName('Col'+InttoStr(A)+'Auto').AsInteger = 1)and
                 (trim(labelStr) <> '')Then
                AutoInsertFlag := True;
            end
          else If (A >= 11)and(A <= 13)Then
            begin
              If (qry_Auto.FieldbyName('Col'+InttoStr(A)+'Auto').AsInteger = 1)and
                 (trim(labelStr) <> '')Then
                AutoInsertFlag := True;
            end
          else If (A >= 14)and(A <= 15)Then
            begin
              If (qry_Auto.FieldbyName('Col'+InttoStr(A)+'Auto').AsInteger = 1)and
                 (trim(labelStr) <> '')Then
                AutoInsertFlag := True;
            end
        end;
    end;
//-------------
  If AutoInsertFlag Then
    begin
      DatModCap.qry_FilesMain.Close;
      DatModCap.qry_FilesMain.SQL.Clear;
      DatModCap.qry_FilesMain.SQL.Add('select * from files where filenumber = ''zzxx'' ');
      DatModCap.qry_FilesMain.Open;

      Label1.Visible := true;
      LookUpFile.Visible := true;
      btn_FindFile.Visible := true;
      nav_Capture.Visible := true;
      nav_Capture.DataSource := DatModCap.dts_Files;

      HideFields;
//---------------
      PageControl1.ActivePageIndex := 1;
      EditFileNumber.SetFocus;

      DatModCap.qry_FilesMain.Insert;
      DatModCap.NoVerifyFlag := True;
      try
        DatModCap.qry_FilesMain['Branch'] := trim(edt_RBranchSrc.Text);
        DatModCap.qry_FilesMain['Department'] := trim(edt_RDeptSrc.Text);
        DatModCap.qry_FilesMain['FileType'] := trim(edt_RRTypeSrc.Text);
//------------------
        For J := 1 to 15 Do
          begin
            If TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible Then
              begin
                A := TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag;
                LabelStr := TEdit(FindComponent('edt_Col'+InttoStr(J))).Text;

                If (A >= 1)and(A <= 10)Then
                  begin
                    If (qry_Auto.FieldbyName('Col'+InttoStr(A)+'Auto').AsInteger = 1)and
                       (trim(labelStr) <> '')Then
                      begin
                        If (qry_Auto.FieldbyName('Col'+InttoStr(A)+'Ver').AsInteger = 1)Then
                          begin
                            If VerifyText(trim(qry_Auto.FieldbyName('Col'+InttoStr(A)).asString), LabelStr) Then
                              DatModCap.qry_FilesMain['Text'+InttoStr(A)] := LabelStr
                            else
                              begin
                                DatModCap.qry_FilesMain.Cancel;
                                DatModCap.qry_FilesMain.Close;
                                PageControl1.ActivePageIndex := 0;
                                PageControl1Change(Self);
                              end;
                          end
                        else DatModCap.qry_FilesMain['Text'+InttoStr(A)] := LabelStr;
                      end;
                  end
                else If (A >= 11)and(A <= 13)Then
                  begin
                    If (qry_Auto.FieldbyName('Col'+InttoStr(A)+'Auto').AsInteger = 1)and
                       (trim(labelStr) <> '')Then
                      begin
                        If (qry_Auto.FieldbyName('Col'+InttoStr(A)+'Ver').AsInteger = 1)Then
                          begin
                            If VerifyText(trim(qry_Auto.FieldbyName('Col'+InttoStr(A)).asString), LabelStr) Then
                              DatModCap.qry_FilesMain['Date'+InttoStr(A-10)] := LabelStr
                            else
                              begin
                                DatModCap.qry_FilesMain.Cancel;
                                DatModCap.qry_FilesMain.Close;
                                PageControl1.ActivePageIndex := 0;
                                PageControl1Change(Self);
                              end;
                          end
                        else DatModCap.qry_FilesMain['Date'+InttoStr(A-10)] := LabelStr;
                      end;
                  end
                else If (A >= 14)and(A <= 15)Then
                  begin
                    If (qry_Auto.FieldbyName('Col'+InttoStr(A)+'Auto').AsInteger = 1)and
                       (trim(labelStr) <> '')Then
                      begin
                        If (qry_Auto.FieldbyName('Col'+InttoStr(A)+'Ver').AsInteger = 1)Then
                          begin
                            If VerifyText(trim(qry_Auto.FieldbyName('Col'+InttoStr(A)).asString), LabelStr) Then
                              DatModCap.qry_FilesMain['Number'+InttoStr(A-13)] := LabelStr
                            else
                              begin
                                DatModCap.qry_FilesMain.Cancel;
                                DatModCap.qry_FilesMain.Close;
                                PageControl1.ActivePageIndex := 0;
                                PageControl1Change(Self);
                              end;
                          end
                        else DatModCap.qry_FilesMain['Number'+InttoStr(A-13)] := LabelStr;
                      end;
                  end
              end;
          end;
      finally
        DatModCap.NoVerifyFlag := False;
      end;
//-------------------------------------
    end;
end;

procedure Tfrm_Processing.btn_SearchClick(Sender: TObject);
var
  mViewStr       :String;
  J,A            :Integer;
  LabelStr       :String;
  FillInFlag     :Boolean;
begin
//=================================================================
//==============Check if certain fields contains values
//=================================================================
  if (length(edt_RRTypeSrc.Text) = 0) Then
    begin
      MessageDlg('Please select the Record Type ',mtError,[mbOK],0);
      exit;
    end;
  if (length(edt_RDeptSrc.Text) = 0) then
    begin
      MessageDlg('Please select the Department',mtError,[mbOK],0);
      exit;
    end;

  FillInFlag := False;
  if (edt_Col1.Text <> '')and(edt_Col1.Visible) Then FillInFlag := True;
  if (edt_Col2.Text <> '')and(edt_Col2.Visible) Then FillInFlag := True;
  if (edt_Col3.Text <> '')and(edt_Col3.Visible) Then FillInFlag := True;
  if (edt_Col4.Text <> '')and(edt_Col4.Visible) Then FillInFlag := True;
  if (edt_Col5.Text <> '')and(edt_Col5.Visible) Then FillInFlag := True;
  if (edt_Col6.Text <> '')and(edt_Col6.Visible) Then FillInFlag := True;
  if (edt_Col7.Text <> '')and(edt_Col7.Visible) Then FillInFlag := True;
  if (edt_Col8.Text <> '')and(edt_Col8.Visible) Then FillInFlag := True;
  if (edt_Col9.Text <> '')and(edt_Col9.Visible) Then FillInFlag := True;
  if (edt_Col10.Text <> '')and(edt_Col10.Visible) Then FillInFlag := True;
  if (edt_Col11.Text <> '')and(edt_Col11.Visible) Then FillInFlag := True;
  if (edt_Col12.Text <> '')and(edt_Col12.Visible) Then FillInFlag := True;
  if (edt_Col13.Text <> '')and(edt_Col13.Visible) Then FillInFlag := True;
  if (edt_Col14.Text <> '')and(edt_Col14.Visible) Then FillInFlag := True;
  if (edt_Col15.Text <> '')and(edt_Col15.Visible) Then FillInFlag := True;

  if not FillInFlag Then
    begin
      MessageDlg('Please specify some search criteria!!',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
//======================================Build SQL String========================
  if cb_SearchType.ItemIndex = 0 Then   //Files
    begin
      dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManBranch, edt_RBranchSrc.Text);
      dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManDepartment, edt_RDeptSrc.Text);
      dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManRecordType, edt_RRTypeSrc.Text);
      if cb_SearchRecordCat.Visible then
        dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManRecordCat, cb_SearchRecordCat.Text)
      else
        dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManRecordCat, '');

      sp_SearchbyRecordType.Close;
      For J := 0 to sp_SearchbyRecordType.Parameters.Count-1 Do
        sp_SearchbyRecordType.Parameters[J].Value := null;
      sp_SearchbyRecordType.Parameters.ParamByName('@ReqUserId').Value := User;
      sp_SearchbyRecordType.Parameters.ParamByName('@Branch').Value :=  edt_RBranchSrc.Text;
      sp_SearchbyRecordType.Parameters.ParamByName('@Department').Value := edt_RDeptSrc.Text;
      sp_SearchbyRecordType.Parameters.ParamByName('@Module').Value := 'PROCESSING';
      sp_SearchbyRecordType.Parameters.ParamByName('@SearchType').Value := 'FILES';
      sp_SearchbyRecordType.Parameters.ParamByName('@RecordType').Value := edt_RRTypeSrc.Text;
      sp_SearchbyRecordType.Parameters.ParamByName('@RecordCat').Value := cb_SearchRecordCat.Text;
      sp_SearchbyRecordType.Parameters.ParamByName('@PartialSearch').Value := chk_Partial.Checked;

      For J := 1 to 15 Do
        begin
          If TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible Then
            begin
              A := TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag;
              LabelStr := TEdit(FindComponent('edt_Col'+InttoStr(J))).Text;
              If LabelStr <> '' Then
                begin
                  If (A >= 1)and(A <= 10)Then
                    begin
                      sp_SearchbyRecordType.Parameters.ParamByName('@Text'+InttoStr(A)).Value := LabelStr
                    end
                  else if (A >= 11)and(A <= 13)Then
                    begin
                      sp_SearchbyRecordType.Parameters.ParamByName('@Date'+InttoStr(A-10)).Value := StrtoDate(LabelStr);
                    end
                  else if (A >= 14)and(A <= 15)Then
                    begin
                      sp_SearchbyRecordType.Parameters.ParamByName('@Number'+InttoStr(A-13)).Value := StrtoInt(LabelStr);
                    end;
                end;
            end;
        end;

      If trim(edt_RWHouseSrc.Text) <> '' Then
        begin
          sp_SearchbyRecordType.Parameters.ParamByName('@Warehouse').Value := edt_RWHouseSrc.Text;
        end;
      sp_SearchbyRecordType.Parameters.ParamByName('@ShowImageStatus').Value := True;
//--------
      Screen.Cursor := CrHourglass;
      try
        ResultGrid.Columns.Clear;
        sp_SearchbyRecordType.Open;
        sp_SearchbyRecordType.FieldByName('ReqAble').Visible := False;
        sp_SearchbyRecordType.FieldByName('IssueStatus').Visible := False;
        sp_SearchbyRecordType.FieldByName('ReqAbleInternally').Visible := False;
        sp_SearchbyRecordType.FieldByName('HasItems').Visible := False;
        Application.ProcessMessages;
        FRM_cONSOLE.AutoSizeNewColumns(ResultGrid);
      finally
        Screen.Cursor := CrDefault;
      end;
      lbl_RecordFound.Caption := 'Records found: '+InttoStr(sp_SearchbyRecordType.RecordCount);
      If not sp_SearchbyRecordType.isEmpty Then
        exit;
      MessageDLG('No records found',mtInformation,[mbOK],0);
      DoAutoFill;
    end;
//======================================================================
  if cb_SearchType.ItemIndex = 1 Then   //Items
    begin
      dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManBranch, edt_RBranchSrc.Text);
      dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManDepartment, edt_RDeptSrc.Text);
      dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieDocManRecordType, edt_RRTypeSrc.Text);

      sp_SearchbyRecordType.Close;
      For J := 0 to sp_SearchbyRecordType.Parameters.Count-1 Do
        sp_SearchbyRecordType.Parameters[J].Value := null;

      sp_SearchbyRecordType.Parameters.ParamByName('@ReqUserId').Value := User;
      sp_SearchbyRecordType.Parameters.ParamByName('@Branch').Value :=  edt_RBranchSrc.Text;
      sp_SearchbyRecordType.Parameters.ParamByName('@Department').Value := edt_RDeptSrc.Text;
      sp_SearchbyRecordType.Parameters.ParamByName('@Module').Value := 'PROCESSING';
      sp_SearchbyRecordType.Parameters.ParamByName('@SearchType').Value := 'ITEMS';
      sp_SearchbyRecordType.Parameters.ParamByName('@RecordType').Value := edt_RRTypeSrc.Text;
      sp_SearchbyRecordType.Parameters.ParamByName('@RecordCat').Value := cb_SearchRecordCat.Text;
      sp_SearchbyRecordType.Parameters.ParamByName('@PartialSearch').Value := chk_Partial.Checked;

      For J := 1 to 15 Do
        begin
          If TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible Then
            begin
              A := TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag;
              LabelStr := TEdit(FindComponent('edt_Col'+InttoStr(J))).Text;
              If LabelStr <> '' Then
                begin
                  If (A >= 1)and(A <= 10)Then
                    begin
                      sp_SearchbyRecordType.Parameters.ParamByName('@Text'+InttoStr(A)).Value := LabelStr
                    end
                  else if (A >= 11)and(A <= 13)Then
                    begin
                      sp_SearchbyRecordType.Parameters.ParamByName('@Date'+InttoStr(A-10)).Value := StrtoDate(LabelStr);
                    end
                  else if (A >= 14)and(A <= 15)Then
                    begin
                      sp_SearchbyRecordType.Parameters.ParamByName('@Number'+InttoStr(A-13)).Value := StrtoInt(LabelStr);
                    end;
                end;
            end;
        end;

      If trim(edt_RWHouseSrc.Text) <> '' Then
        begin
          sp_SearchbyRecordType.Parameters.ParamByName('@Warehouse').Value := edt_RWHouseSrc.Text;
        end;
      sp_SearchbyRecordType.Parameters.ParamByName('@ShowImageStatus').Value := True;
//--------
      Screen.Cursor := CrHourglass;
      try
        ResultGrid.Columns.Clear;
        sp_SearchbyRecordType.Open;
        sp_SearchbyRecordType.FieldByName('ReqAble').Visible := False;
        sp_SearchbyRecordType.FieldByName('IssueStatus').Visible := False;
        sp_SearchbyRecordType.FieldByName('ReqAbleInternally').Visible := False;
        Application.ProcessMessages;
        frm_Console.AutoSizeNewColumns(ResultGrid);
      finally
        Screen.Cursor := CrDefault;
      end;
      lbl_RecordFound.Caption := 'Records found: '+InttoStr(sp_SearchbyRecordType.RecordCount);
      If not sp_SearchbyRecordType.isEmpty Then
        exit;
      MessageDLG('No records found',mtInformation,[mbOK],0);
    end;
//======================================================================
  if cb_SearchType.ItemIndex = 2 Then     //Containers
    begin
      dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieWareManBranch, edt_RBranchSrc.Text);
      dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieWareManDepartment, edt_RDeptSrc.Text);
      dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieWareManRecordType, edt_RRTypeSrc.Text);

      sp_SearchbyRecordType.Close;
      For J := 0 to sp_SearchbyRecordType.Parameters.Count-1 Do
        sp_SearchbyRecordType.Parameters[J].Value := null;

      sp_SearchbyRecordType.Parameters.ParamByName('@ReqUserId').Value := User;
      sp_SearchbyRecordType.Parameters.ParamByName('@Branch').Value :=  edt_RBranchSrc.Text;
      sp_SearchbyRecordType.Parameters.ParamByName('@Department').Value := edt_RDeptSrc.Text;
      sp_SearchbyRecordType.Parameters.ParamByName('@Module').Value := 'PROCESSING';
      sp_SearchbyRecordType.Parameters.ParamByName('@SearchType').Value := 'CONTAINERS';
      sp_SearchbyRecordType.Parameters.ParamByName('@RecordType').Value := edt_RRTypeSrc.Text;
      sp_SearchbyRecordType.Parameters.ParamByName('@PartialSearch').Value := chk_Partial.Checked;

      For J := 1 to 15 Do
        begin
          If TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible Then
            begin
              A := TEdit(FindComponent('edt_Col'+InttoStr(J))).Tag;
              LabelStr := TEdit(FindComponent('edt_Col'+InttoStr(J))).Text;
              If LabelStr <> '' Then
                begin
                  If (A >= 1)and(A <= 10)Then
                    begin
                      sp_SearchbyRecordType.Parameters.ParamByName('@Text'+InttoStr(A)).Value := LabelStr
                    end
                  else if (A >= 11)and(A <= 13)Then
                    begin
                      sp_SearchbyRecordType.Parameters.ParamByName('@Date'+InttoStr(A-10)).Value := StrtoDate(LabelStr);
                    end
                  else if (A >= 14)and(A <= 15)Then
                    begin
                      sp_SearchbyRecordType.Parameters.ParamByName('@Number'+InttoStr(A-13)).Value := StrtoInt(LabelStr);
                    end;
                end;
            end;
        end;

      If trim(edt_RWHouseSrc.Text) <> '' Then
        begin
          sp_SearchbyRecordType.Parameters.ParamByName('@Warehouse').Value := edt_RWHouseSrc.Text;
        end;
      sp_SearchbyRecordType.Parameters.ParamByName('@ShowImageStatus').Value := True;
//--------
      Screen.Cursor := CrHourglass;
      try
        ResultGrid.Columns.Clear;
        sp_SearchbyRecordType.Open;
        sp_SearchbyRecordType.FieldByName('ReqAble').Visible := False;
        sp_SearchbyRecordType.FieldByName('IssueStatus').Visible := False;
        sp_SearchbyRecordType.FieldByName('HasFiles').Visible := False;
        Application.ProcessMessages;
        frm_Console.AutoSizeNewColumns(ResultGrid);
      finally
        Screen.Cursor := CrDefault;
      end;
      lbl_RecordFound.Caption := 'Records found: '+InttoStr(sp_SearchbyRecordType.RecordCount);
      If not sp_SearchbyRecordType.isEmpty Then
        exit;
      MessageDLG('No records found',mtInformation,[mbOK],0);
    end;
end;

procedure Tfrm_Processing.SpeedButton1Click(Sender: TObject);
var
  Barcode :string;
  iFile    :String;
begin
  With DatmodCap do
    begin
      if sp_SearchbyRecordType.IsEmpty Then
        begin
          MessageDlg('No Record selected!!',mtError,[mbOK],0);
          exit;
        end;

      if UpperCase(sp_SearchbyRecordType.Fields[1].FieldName) = 'CONTAINER' Then
        begin
          Barcode := sp_SearchbyRecordType.FieldByName('CONTAINER').AsString;
          PageControl1.ActivePage := Tabsheet7;
          PageControl1Change(Self);
          LookupFile.Text := Barcode;
          btn_FindFileClick(Sender);
          LookupFile.Text := '';
          exit;
        end;

      if UpperCase(sp_SearchbyRecordType.Fields[1].FieldName) = 'FILENUMBER' Then
        begin
          Barcode := sp_SearchbyRecordType.FieldByName('FILENUMBER').AsString;
          PageControl1.ActivePage := Tabsheet2;
          PageControl1Change(Self);
          LookupFile.Text := Barcode;
          btn_FindFileClick(Sender);
          LookupFile.Text := '';
          exit;
        end;

      if UpperCase(sp_SearchbyRecordType.Fields[1].FieldName) = 'ITEMNUMBER' Then
        begin
          Barcode := sp_SearchbyRecordType.FieldByName('ITEMNUMBER').AsString;
          iFile := sp_SearchbyRecordType.FieldByName('FILENUMBER').AsString;

          PageControl1.ActivePage := Tabsheet2;
          PageControl1Change(Self);
          LookupFile.Text := iFile;
          btn_FindFileClick(Sender);
          LookupFile.Text := '';

          PageControl1.ActivePage := Tabsheet5;
          PageControl1Change(Self);

          qry_Items.Locate('Itemnumber', Barcode, []);
          exit;
        end;
    end;    //With DatmodCap do
end;




procedure Tfrm_Processing.btn_RecordCatClick(Sender: TObject);
begin
  If not(DatModCap.qry_FilesMain.State in dsEditModes)
   Then
    begin
      Messagedlg('Please edit this File before selecting a Record Category.', mtInformation ,[mbOK], 0);
      exit;
    end;
  If length(DatModCap.qry_FilesMain.FieldbyName('FILETYPE').asString) = 0 Then
    begin
      Messagedlg('Please select a Record Type.', mtInformation ,[mbOK], 0);
      exit;
    end;

  If not(DatModCap.qry_FilesMain.State in dsEditModes)
   Then
    begin
      Messagedlg('Please edit this record before selecting a Record Category!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  frm_SelRCat.ShowGen := False;
  frm_SelRCat.qry_RCat.Close;
  frm_SelRCat.qry_RCat.Parameters.ParamByName('mRecType').Value := trim(edt_RRTypeCap.Text);
  frm_SelRCat.qry_RCat.Open;
  If frm_SelRCat.ShowModal = mrOK Then
      DatModCap.qry_FilesMain['RecordCat'] := frm_SelRCat.qry_RCat.FieldbyName('RecordCat').asString;
  frm_SelRCat.qry_RCat.Close;
end;

procedure Tfrm_Processing.RefreshFields(Dataset   :TDataset);
Var
  J   :Integer;
  T   :Integer;

function IsFieldUpperCase(FieldNameL :String):Boolean;
Var
  x   :Integer;
begin
  For x := 1 to 15 Do
    begin
      If trim(UpperCase(Dataset.FieldByName('COL'+InttoStr(x)).AsString)) = trim(UpperCase(FieldNameL)) Then
        begin
          Result := (Dataset.FieldByName('COL'+InttoStr(x)+'Upp').asInteger = 1);
          exit;
        end
    end;
  Result := False;
end;


begin
  T  := 3;
  For J := 1 to 15 Do
    begin
      If trim(Dataset.FieldByName('COL'+InttoStr(J)).AsString) <> '' Then
        begin
          If (J >= 1)and(J <= 10) Then
            begin
              TPanel(FindComponent('pnl_Text'+InttoStr(J))).Top := T;
              TPanel(FindComponent('pnl_Text'+InttoStr(J))).Visible := True;
              TPanel(FindComponent('pnl_cText'+InttoStr(J))).Top := T;
              TPanel(FindComponent('pnl_cText'+InttoStr(J))).Visible := True;
              TPanel(FindComponent('pnl_iText'+InttoStr(J))).Top := T;
              TPanel(FindComponent('pnl_iText'+InttoStr(J))).Visible := True;
            end
          else If (J >= 11)and(J <= 13) Then
            begin
              TPanel(FindComponent('pnl_Date'+InttoStr(J-10))).Top := T;
              TPanel(FindComponent('pnl_Date'+InttoStr(J-10))).Visible := True;
              TPanel(FindComponent('pnl_cDate'+InttoStr(J-10))).Top := T;
              TPanel(FindComponent('pnl_cDate'+InttoStr(J-10))).Visible := True;
              TPanel(FindComponent('pnl_iDate'+InttoStr(J-10))).Top := T;
              TPanel(FindComponent('pnl_iDate'+InttoStr(J-10))).Visible := True;
            end
          else If (J >= 14)and(J <= 15) Then
            begin
              TPanel(FindComponent('pnl_Num'+InttoStr(J-13))).Top := T;
              TPanel(FindComponent('pnl_Num'+InttoStr(J-13))).Visible := True;
              TPanel(FindComponent('pnl_cNum'+InttoStr(J-13))).Top := T;
              TPanel(FindComponent('pnl_cNum'+InttoStr(J-13))).Visible := True;
              TPanel(FindComponent('pnl_iNum'+InttoStr(J-13))).Top := T;
              TPanel(FindComponent('pnl_iNum'+InttoStr(J-13))).Visible := True;
            end;
          Inc(T, 35);
        end;
    end;
//----------
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT TOP 10000 ColumnHeading, Item FROM IndexDefsLookups');
  qry_SQL.SQL.Add('WHERE Description = '+QuotedStr(Dataset.FieldbyName('Description').asString));
  qry_SQL.SQL.Add('ORDER BY ColumnHeading, Item');
  qry_SQL.Open;
  qry_SQL.First;
  SetLength(Lookups, 0);
  J := 0;
  While not qry_SQL.EOF Do
    begin
      Inc(J);
      SetLength(Lookups, J);
      Lookups[J-1].ColumnHeading := trim(qry_SQL.FieldbyName('ColumnHeading').asString);
      If IsFieldUpperCase(Lookups[J-1].ColumnHeading) Then
        Lookups[J-1].Item := UpperCase(trim(qry_SQL.FieldbyName('Item').asString))
      else Lookups[J-1].Item := trim(qry_SQL.FieldbyName('Item').asString);
      qry_SQL.Next;
    end;
  qry_SQL.Close;
end;

procedure Tfrm_Processing.HideFields;
Var
  J   :Integer;
begin
  For J := 1 to 15 Do
    begin
      If (J >= 1)and(J <= 10) Then
        begin
          TPanel(FindComponent('pnl_Text'+InttoStr(J))).Visible := False;
          TPanel(FindComponent('pnl_cText'+InttoStr(J))).Visible := False;
          TPanel(FindComponent('pnl_iText'+InttoStr(J))).Visible := False;
        end
      else If (J >= 11)and(J <= 13) Then
        begin
          TPanel(FindComponent('pnl_Date'+InttoStr(J-10))).Visible := False;
          TPanel(FindComponent('pnl_cDate'+InttoStr(J-10))).Visible := False;
          TPanel(FindComponent('pnl_iDate'+InttoStr(J-10))).Visible := False;
        end
      else If (J >= 14)and(J <= 15) Then
        begin
          TPanel(FindComponent('pnl_Num'+InttoStr(J-13))).Visible := False;
          TPanel(FindComponent('pnl_cNum'+InttoStr(J-13))).Visible := False;
          TPanel(FindComponent('pnl_iNum'+InttoStr(J-13))).Visible := False;
        end;
    end;
end;

procedure Tfrm_Processing.Date_FiledChange(Sender: TObject);
begin
  DatModCap.qry_Items.Edit;
  DatModCap.qry_Items.FieldByName('DATEFILED').asDateTime := Trunc(Date_Filed.Date);
end;

procedure Tfrm_Processing.edt_IText1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
  spDBEdit          :TDBEdit;
  sHead, SType             :String;
  p, i              :Integer;
  theText           :String;
begin
  case key of
    8, 13, 46, 37..39: ;
    27 : Abort;
    40 : begin
           If (Shift = [ssAlt]) Then
             begin
                spDBEdit := Sender as TDBEdit;
                sType := UPPERCASE(spDBEdit.DataField);
                If sType = 'TEXT1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL1').AsString;
                If sType = 'TEXT2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL2').AsString;
                If sType = 'TEXT3' Then sHead := DatModCap.qry_FileType.FieldbyName('COL3').AsString;
                If sType = 'TEXT4' Then sHead := DatModCap.qry_FileType.FieldbyName('COL4').AsString;
                If sType = 'TEXT5' Then sHead := DatModCap.qry_FileType.FieldbyName('COL5').AsString;
                If sType = 'TEXT6' Then sHead := DatModCap.qry_FileType.FieldbyName('COL6').AsString;
                If sType = 'TEXT7' Then sHead := DatModCap.qry_FileType.FieldbyName('COL7').AsString;
                If sType = 'TEXT8' Then sHead := DatModCap.qry_FileType.FieldbyName('COL8').AsString;
                If sType = 'TEXT9' Then sHead := DatModCap.qry_FileType.FieldbyName('COL9').AsString;
                If sType = 'TEXT10' Then sHead := DatModCap.qry_FileType.FieldbyName('COL10').AsString;
          //-------
                If sType = 'DATE1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL11').AsString;
                If sType = 'DATE2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL12').AsString;
                If sType = 'DATE3' Then sHead := DatModCap.qry_FileType.FieldbyName('COL13').AsString;
          //-------
                If sType = 'NUMBER1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL14').AsString;
                If sType = 'NUMBER2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL15').AsString;
          //--------
                frm_RecordLookup.Editable := False;
                If frm_RecordLookup.Execute(sHead, sType,
                                            DatModCap.qry_FileType.FieldbyName('Description').AsString) = mrOk Then
                  begin
                    If not(DatModCap.qry_Items.State in dsEditModes) Then
                      DatModCap.qry_Items.edit;
                    If sType = 'TEXT1' Then sHead := 'Col1';
                    If sType = 'TEXT2' Then sHead := 'Col2';
                    If sType = 'TEXT3' Then sHead := 'Col3';
                    If sType = 'TEXT4' Then sHead := 'Col4';
                    If sType = 'TEXT5' Then sHead := 'Col5';
                    If sType = 'TEXT6' Then sHead := 'Col6';
                    If sType = 'TEXT7' Then sHead := 'Col7';
                    If sType = 'TEXT8' Then sHead := 'Col8';
                    If sType = 'TEXT9' Then sHead := 'Col9';
                    If sType = 'TEXT10' Then sHead := 'Col10';
              //-------
                    If sType = 'DATE1' Then sHead := 'Col11';
                    If sType = 'DATE2' Then sHead := 'Col12';
                    If sType = 'DATE3' Then sHead := 'Col13';
              //-------
                    If sType = 'NUMBER1' Then sHead := 'Col14';
                    If sType = 'NUMBER2' Then sHead := 'Col15';
                    If DatModCap.CheckIfUpperCase(sHead) Then
                      spDBEdit.Field.Value := UPPERCASE(frm_RecordLookup.TextString)
                    else spDBEdit.Field.Value := frm_RecordLookup.TextString;
                  end;
             end
         end
      else
        begin
    //-------Check the rest
          spDBEdit := Sender as TDBEdit;
          sType := UPPERCASE(spDBEdit.DataField);
          If sType = 'TEXT1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL1').AsString;
          If sType = 'TEXT2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL2').AsString;
          If sType = 'TEXT3' Then sHead := DatModCap.qry_FileType.FieldbyName('COL3').AsString;
          If sType = 'TEXT4' Then sHead := DatModCap.qry_FileType.FieldbyName('COL4').AsString;
          If sType = 'TEXT5' Then sHead := DatModCap.qry_FileType.FieldbyName('COL5').AsString;
          If sType = 'TEXT6' Then sHead := DatModCap.qry_FileType.FieldbyName('COL6').AsString;
          If sType = 'TEXT7' Then sHead := DatModCap.qry_FileType.FieldbyName('COL7').AsString;
          If sType = 'TEXT8' Then sHead := DatModCap.qry_FileType.FieldbyName('COL8').AsString;
          If sType = 'TEXT9' Then sHead := DatModCap.qry_FileType.FieldbyName('COL9').AsString;
          If sType = 'TEXT10' Then sHead := DatModCap.qry_FileType.FieldbyName('COL10').AsString;
    //-------
          If sType = 'DATE1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL11').AsString;
          If sType = 'DATE2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL12').AsString;
          If sType = 'DATE3' Then sHead := DatModCap.qry_FileType.FieldbyName('COL13').AsString;
    //-------
          If sType = 'NUMBER1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL14').AsString;
          If sType = 'NUMBER2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL15').AsString;

          p :=  TDBEdit(Sender).SelStart;
          theText := copy(TDBEdit(Sender).Text, 0, p);
          For i := Low(Lookups) to High(Lookups) Do
            begin

              if (pos(upperCase(theText), upperCase(Lookups[I].Item))=1)and(Lookups[I].ColumnHeading = sHead) then

                if compareText(theText, Lookups[I].Item) < 0 then
                  begin
                    If pos(upperCase(TDBEdit(Sender).text), upperCase(Lookups[I].Item)) > 0 Then
                      begin
                        TDBEdit(Sender).Text := Lookups[I].Item;
                        TDBEdit(Sender).selStart := p;
                        TDBEdit(Sender).SelLength := length(TDBEdit(Sender).text) - TDBEdit(Sender).selStart;
                      end;
                    break;
                  end;
            end;
        end;
  end;
end;

procedure Tfrm_Processing.btn_PutAwayItemClick(Sender: TObject);
begin
  If DatModCap.qry_Items.State in dsEditModes Then
    begin
      Messagedlg('Please save your changes first before put away!!', mtInformation, [mbOK], 0);
      exit;
    end;
  DatModCap.qry_Items.Edit;
  DatModCap.qry_Items['Status'] := 'I';
  DatModCap.qry_Items['DateFiled'] := dm_Metrofiler.GetServTimeNow;
  DatModCap.qry_Items['ItemFiler'] := User;
  DatModCap.qry_Items.Post;
  Showmessage('Successful!!');
end;

procedure Tfrm_Processing.btn_ContCommentsClick(Sender: TObject);
begin
  frm_ContainerComments.Execute(DatmodCap.qry_ContainersMain.FieldByname('Container').AsString);
end;

procedure Tfrm_Processing.edt_RStatusChange(Sender: TObject);
begin
  If (edt_RStatus.Text = 'CON')OR(edt_RStatus.Text = 'MET')OR(edt_RStatus.Text = 'MIN') Then
    begin
      edt_RContainer.Enabled := True;
      lbl_RContainer.Enabled := True;
      lbl_CStat.Enabled := True;
      edt_CStat.Enabled := True;
    end
  else
    begin
      lbl_RContainer.Enabled := False;
      edt_RContainer.Enabled := False;
      lbl_CStat.Enabled := False;
      edt_CStat.Enabled := False;
    end;
end;

procedure Tfrm_Processing.editWhouseCloseUp(Sender: TObject);
begin
  With DatModCap.qry_Loc Do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT locno FROM location WHERE warehouse = :wh');
      Parameters.ParambyName('wh').Value := DatModCap.qry_WHouse.FieldbyName('CODE').asString;
      Active := True;
    end;
end;



procedure Tfrm_Processing.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  With DatmodCap do
    begin
//==============================================================================
      if (qry_FilesMain.State in dsEditModes) then
        begin
          MessageDlg('Save or Discard your File changes',mtInformation,[mbOK],0);
          AllowChange := false;
          exit;
        end;
      if (qry_Items.State in dsEditModes) then
        begin
          MessageDlg('Save or Discard your Item changes',mtInformation,[mbOK],0);
          AllowChange := false;
          exit;
        end;
//==============================================================================
//Need to Keep Min Tables open at once
//==============================================================================
  if PageControl1.ActivePage = Tabsheet7 Then    //Capture Containers
        begin
          qry_ContType.Active := False;
        end;
//==============================================================================
    end;
  AllowChange := True;  
end;

procedure Tfrm_Processing.QRDBText8Print(sender: TObject; var Value: string);
begin
  Value := '*' + Value + '*';
end;

procedure Tfrm_Processing.PageControl1Change(Sender: TObject);
begin
  With DatmodCap do
    begin
      If PageControl1.ActivePage = Tabsheet1 Then    //Search
        begin
          Label1.Visible := false;
          LookUpFile.Visible := false;
          btn_FindFile.Visible := false;
          nav_Capture.Visible := false;
          btnMatch.Visible := false;
        end
      else if PageControl1.ActivePage = Tabsheet2 Then  //Files Capture
        begin
          If qry_FilesMain.Active = false Then
            begin
              qry_FilesMain.Close;
              qry_FilesMain.SQL.Clear;
              qry_FilesMain.SQL.Add('select * from files where filenumber = ''zzxx'' ');
              qry_FilesMain.Open;
            end;

          Label1.Visible := true;
          LookUpFile.Visible := true;
          btn_FindFile.Visible := true;

          nav_Capture.Visible := true;
          nav_Capture.DataSource := dts_Files;
//          btnMatch.Visible := true;

          HideFields;

          edt_RBranchCap.SetFocus;
        end
      else if PageControl1.ActivePage = Tabsheet5 Then
        begin
          If qry_FilesMain.IsEmpty Then
            begin
              Showmessage('Cannot add/edit Items! First select a File under Capture File...');
              PageControl1.ActivePage := Tabsheet2;
              PageControl1Change(sELF);
              exit;
            end;
          If trim(qry_FilesMain.FieldbyName('Filenumber').AsString) = '' Then
            begin
              Showmessage('Cannot add/edit Items! First select a File under Capture File...');
              PageControl1.ActivePage := Tabsheet2;
              PageControl1Change(sELF);
              exit;
            end;
//==============================================================================
         Label1.Visible := false;
         LookUpFile.Visible := false;
         btn_FindFile.Visible := false;
         nav_Capture.Visible := true;
         nav_Capture.DataSource := dts_Items;
//         btnMatch.Visible := true;
//==============================================================================
         if qry_FilesMain.Active then
           begin
             HideFields;
             miFilenumber := qry_FilesMain.FieldByName('FileNumber').asString;
             miBranch := qry_FilesMain.FieldByName('Branch').asString;
             miDepartment := qry_FilesMain.FieldByName('Department').asString;
             miIssueStatus := qry_FilesMain.FieldByName('IssueStatus').asString;

             qry_Items.Close;
             qry_Items.SQL.Clear;
             qry_Items.SQL.Add('SELECT * FROM Items WHERE Filenumber = :Filenumber ORDER BY ItemNumber');
             qry_Items.Parameters.ParamValues['Filenumber'] := miFilenumber;
             qry_Items.Open;
//==============================================================================
           end;
          editFile.SetFocus;
        end
      else if PageControl1.ActivePage = Tabsheet7 Then    //Capture Containers
        begin
          HideFields;
          
          qry_ContainersMain.Active := false;
          qry_ContainersMain.SQL.Clear;
          qry_ContainersMain.SQL.Add('select * from containers where container = ''zzxx''');
          qry_ContainersMain.Active := True;
          qry_ContType.Active := True;

          Label1.Visible := true;
          LookUpFile.Visible := true;
          btn_FindFile.Visible := true;
//          btnMatch.Visible := true;

          nav_Capture.Visible := true;
          nav_Capture.DataSource := dts_ContainersMain;

          edt_CBranchCap.SetFocus;
        end;
    end;
end;

procedure Tfrm_Processing.btn_SelBranchClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_RBranchSrc.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_RBranchSrc.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_Processing.btn_SelDeptClick(Sender: TObject);
begin
  If length(edt_RBranchSrc.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_RBranchSrc.Text, User) = mrOK Then
    begin
      edt_RDeptSrc.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_RDeptSrc.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_Processing.edt_RRTypeSrcChange(Sender: TObject);
Var
   RecordType :String;
   ColNames   :Array[1..15] of String;
   J, I       :Integer;
   MaxLblLen  :Integer;
begin
  RecordType := trim(edt_RRTypeSrc.Text);
  For J := 1 to 15 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Visible := False;
    end;

  lbl_SearchRecordCat.Visible := false;
  cb_SearchRecordCat.Visible := false;

  If RecordType = '"General Search"' Then
   begin
     qry_SQL.Close;
     qry_SQL.SQL.Clear;
     qry_SQL.SQL.Add('SELECT');
     qry_SQL.SQL.Add('  ''Text1'' Col1, ');
     qry_SQL.SQL.Add('  ''Text2'' Col2, ');
     qry_SQL.SQL.Add('  ''Text3'' Col3, ');
     qry_SQL.SQL.Add('  ''Text4'' Col4, ');
     qry_SQL.SQL.Add('  ''Text5'' Col5, ');
     qry_SQL.SQL.Add('  ''Text6'' Col6, ');
     qry_SQL.SQL.Add('  ''Text7'' Col7, ');
     qry_SQL.SQL.Add('  ''Text8'' Col8, ');
     qry_SQL.SQL.Add('  ''Text9'' Col9, ');
     qry_SQL.SQL.Add('  ''Text10'' Col10, ');
     qry_SQL.SQL.Add('  ''Date1'' Col11, ');
     qry_SQL.SQL.Add('  ''Date2'' Col12, ');
     qry_SQL.SQL.Add('  ''Date3'' Col13, ');
     qry_SQL.SQL.Add('  ''Number1'' Col14, ');
     qry_SQL.SQL.Add('  ''Number2'' Col15 ');
     qry_SQL.Open;
   end
  else
   begin
     qry_SQL.Close;
     qry_SQL.SQL.Clear;
     qry_SQL.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :Description');
     qry_SQL.Parameters.ParamValues['Description'] := edt_RRTypeSrc.Text;
     dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));
     If cb_SearchType.ItemIndex = 0 Then
       If qry_SQL.FieldByName('UseRecordCat').AsBoolean Then
         begin
           lbl_SearchRecordCat.Visible := true;
           cb_SearchRecordCat.Visible := true;
         end;
   end;
  For J := 1 to 15 Do
    ColNames[J] := trim(qry_SQL.FieldbyName('Col'+InttoStr(J)).AsString);
  qry_SQL.Close;
//----
  MaxLblLen := 0;
  I := 0;
  For J := 1 to 15 Do
    begin
      If ColNames[J] <> '' Then
        begin
          Inc(I);
          If (J >= 1)AND(J <= 10) Then
            begin
              If MaxLblLen < Canvas.TextWidth(ColNames[J]+' :') Then
                MaxLblLen := Canvas.TextWidth(ColNames[J]+' :');

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := ColNames[J]+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := '';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Tag := J;
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Width := 300;
            end
          else if (J >= 11)AND(J <= 13) Then
            begin
              If MaxLblLen < Canvas.TextWidth(ColNames[J]+' :') Then
                MaxLblLen := Canvas.TextWidth(ColNames[J]+' :');

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := ColNames[J]+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := '';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Tag := J;
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Width := 120;
            end
          else if (J >= 14)AND(J <= 15) Then
            begin
              If MaxLblLen < Canvas.TextWidth(ColNames[J]+' :') Then
                MaxLblLen := Canvas.TextWidth(ColNames[J]+' :');

              TLabel(FindComponent('lbl_Col'+InttoStr(I))).Caption := ColNames[J]+' :';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Text := '';
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Tag := J;
              TEdit(FindComponent('edt_Col'+InttoStr(I))).Width := 120;
            end;
          TLabel(FindComponent('lbl_Col'+InttoStr(I))).Visible := True;
          TEdit(FindComponent('edt_Col'+InttoStr(I))).Visible := True;
        end;
    end;

  qry_SQL.Close;

  For J := 1 to 15 Do
    begin
//-------Set Lbl Size Properties
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Width := MaxLblLen+5;
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Left := 2;
//-------Set Edit Size Properties
      TEdit(FindComponent('edt_Col'+InttoStr(J))).Left := MaxLblLen+8;
    end;
//------
  cb_SearchRecordCat.Items.Clear;
  If cb_SearchRecordCat.Visible Then
    begin
      if frm_Console.AccessSysAdmin then
        begin
          qry_RecCat.Close;
          qry_RecCat.SQL.Clear;
          qry_RecCat.SQL.Add('SELECT');
          qry_RecCat.SQL.Add('	r.RecCatType');
          qry_RecCat.SQL.Add('FROM');
          qry_RecCat.SQL.Add('	RecordCat r');
          qry_RecCat.SQL.Add('	INNER JOIN RCRTRts s ON r.RecCatType = s.RecordCat');
          qry_RecCat.SQL.Add('WHERE');
          qry_RecCat.SQL.Add('	s.RecordType = :RecordType');
          qry_RecCat.SQL.Add('ORDER BY');
          qry_RecCat.SQL.Add('	RecCatType');
          qry_RecCat.Parameters.ParamByName('RecordType').Value := edt_RRTypeSrc.Text;
          qry_RecCat.Open;
          cb_SearchRecordCat.Items.Append('');
          cb_SearchRecordCat.ItemIndex := 0;
          qry_RecCat.First;
          While not qry_RecCat.EOF Do
            begin
              cb_SearchRecordCat.Items.Append(qry_RecCat.FieldbyName('RecCatType').asString);
              qry_RecCat.Next;
            end;
        end
      else
        begin
          qry_RecCat.Close;
          qry_RecCat.SQL.Clear;
          qry_RecCat.SQL.Add('SELECT');
          qry_RecCat.SQL.Add('	r.RecCatType');
          qry_RecCat.SQL.Add('FROM');
          qry_RecCat.SQL.Add('	RecordCat r');
          qry_RecCat.SQL.Add('	INNER JOIN RCRTRts s ON r.RecCatType = s.RecordCat');
          qry_RecCat.SQL.Add('WHERE');
          qry_RecCat.SQL.Add('	s.RecordType = :RecordType AND');
          qry_RecCat.SQL.Add('(');
          qry_RecCat.SQL.Add('	(r.RecCatType IN (SELECT a.RecordCat FROM RCAuthRts a WHERE a.UserId = :ID1))');
          qry_RecCat.SQL.Add('OR');
          qry_RecCat.SQL.Add('	(r.RecCatType IN (SELECT a.RecordCat FROM RCAuthRts a INNER JOIN RolesRts o ON a.RoleId = o.RoleId WHERE o.UserId = :ID2))');
          qry_RecCat.SQL.Add(')');
          qry_RecCat.SQL.Add('ORDER BY');
          qry_RecCat.SQL.Add('	RecCatType');
          qry_RecCat.Parameters.ParamByName('ID1').Value := User;
          qry_RecCat.Parameters.ParamByName('ID2').Value := User;
          qry_RecCat.Parameters.ParamByName('RecordType').Value := edt_RRTypeSrc.Text;
          qry_RecCat.Open;
          cb_SearchRecordCat.Items.Append('');
          cb_SearchRecordCat.ItemIndex := 0;
          qry_RecCat.First;
          While not qry_RecCat.EOF Do
            begin
              cb_SearchRecordCat.Items.Append(qry_RecCat.FieldbyName('RecCatType').asString);
              qry_RecCat.Next;
            end;
        end;
    end;
end;

procedure Tfrm_Processing.edt_RRTypeSrcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_RRTypeSrc.Text := '';
    end;
end;

procedure Tfrm_Processing.btn_SelRecordTypeClick(Sender: TObject);
begin
  If length(edt_RDeptSrc.Text) = 0 Then
    begin
      Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(True,
                          edt_RBranchSrc.Text,
                          edt_RDeptSrc.Text,
                          User,
                          cb_SearchType.ItemIndex = 2,
                          cb_SearchType.ItemIndex = 0,
                          cb_SearchType.ItemIndex = 1,
                          False,
                          False) = mrOK Then
    begin
      If frm_SelRType.IsGen Then
        edt_RRTypeSrc.Text := '"General Search"'
      else edt_RRTypeSrc.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_Processing.edt_RBranchSrcChange(Sender: TObject);
begin
  edt_RDeptSrc.Text := '';
  lbl_RDeptSrc.Caption := '---';
end;

procedure Tfrm_Processing.edt_RBranchSrcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_RBranchSrc.Text := '';
      lbl_RBranchSrc.Caption := '---';
    end;
end;

procedure Tfrm_Processing.edt_RDeptSrcChange(Sender: TObject);
begin
  edt_RRTypeSrc.Text := '';
end;

procedure Tfrm_Processing.edt_RDeptSrcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_RDeptSrc.Text := '';
      lbl_RDeptSrc.Caption := '---';
    end;
end;

procedure Tfrm_Processing.btn_SelWHouseClick(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  frm_SelWHouse.Flag3D := 0;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_RWHouseSrc.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_RWHouseSrc.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfrm_Processing.edt_RWHouseSrcKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_RWHouseSrc.Text := '';
      lbl_RWHouseSrc.Caption := '---';
    end;
end;

procedure Tfrm_Processing.btn_RBranchCapClick(Sender: TObject);
begin
  If not(DatModCap.qry_FilesMain.State in dsEditModes)
   Then
    begin
      Messagedlg('Please edit this File before selecting a branch!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      DatModCap.qry_FilesMain['Branch'] := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      DatModCap.qry_FilesMain['Department'] := '';
      DatModCap.qry_FilesMain['FileType'] := '';
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_Processing.btn_RDeptCapClick(Sender: TObject);
begin
  If not(DatModCap.qry_FilesMain.State in dsEditModes)
   Then
    begin
      Messagedlg('Please edit this File before selecting a branch!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  If length(DatModCap.qry_FilesMain.FieldbyName('BRANCH').asString) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(DatModCap.qry_FilesMain.FieldbyName('BRANCH').asString, User) = mrOK Then
    begin
      DatModCap.qry_FilesMain['Department'] := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      DatModCap.qry_FilesMain['FileType'] := '';
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_Processing.btn_RRTypeCapClick(Sender: TObject);
begin
  If not(DatModCap.qry_FilesMain.State in dsEditModes)
   Then
    begin
      Messagedlg('Please edit this File before selecting a branch!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  If length(DatModCap.qry_FilesMain.FieldbyName('DEPARTMENT').asString) = 0 Then
    begin
      Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(False,
                          DatModCap.qry_FilesMain.FieldbyName('BRANCH').asString,
                          DatModCap.qry_FilesMain.FieldbyName('DEPARTMENT').asString,
                          User,
                          False,
                          True,
                          False,
                          False,
                          False) = mrOK Then
    begin
      DatModCap.qry_FilesMain['FileType'] := frm_SelRType.qry_RType.FieldbyName('Description').asString;
//----------------------------------------------------------
//Update Retention Matrix
//----------------------------------------------------------
      DatModCap.qry_FilesMain['WIP'] := frm_SelRType.qry_RType.FieldByName('fWIP').AsInteger;
      DatModCap.qry_FilesMain['AONS'] := frm_SelRType.qry_RType.FieldByName('fAONS').AsInteger;
      DatModCap.qry_FilesMain['SAONS'] := frm_SelRType.qry_RType.FieldByName('fSAONS').AsInteger;
      DatModCap.qry_FilesMain['INOS'] := frm_SelRType.qry_RType.FieldByName('fINOS').AsInteger;
      DatModCap.qry_FilesMain['RETENTIONPERIOD'] := frm_SelRType.qry_RType.FieldByName('fRETENTIONPERIOD').asInteger;
      DatModCap.qry_FilesMain['FILINGMETHOD'] := frm_SelRType.qry_RType.FieldByName('FILINGMETHOD').AsString;
      DatModCap.qry_FilesMain['DESTROY'] := frm_SelRType.qry_RType.FieldByName('fDESTROY').Value;
      DatmodCap.CalculateDestructionDateFiles;
//----------------------------------------------------------
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_Processing.edt_RRTypeCapChange(Sender: TObject);
Var
  J :Integer;
begin
  HideFields;
  lbl_RecordCat.Visible := False;
  edt_RecordCat.Visible := False;
  btn_RecordCat.Visible := False;
  If length(DatModCap.qry_FilesMain.FieldbyName('FileType').asString) = 0 then
    exit;
  With DatmodCap do
    begin
      qry_FileType.Close;
      qry_FileType.SQL.Clear;
      qry_FileType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :Description');
      qry_FileType.Parameters.ParamValues['Description'] := qry_FilesMain.FieldbyName('FileType').asString;
      dm_Metrofiler.ExecuteCached(qry_FileType, EncodeTime(1,0,0,0));
//----------
      SetLength(FieldProperties, 0);
      For J := 1 to 15 Do
        begin
          If trim(qry_FileType.FieldByName('Col'+InttoStr(J)).AsString) <> '' Then
            begin
              SetLength(FieldProperties, Length(FieldProperties)+1);
              FieldProperties[length(FieldProperties)-1].FieldName := 'Col'+InttoStr(J);
              FieldProperties[length(FieldProperties)-1].Alias := trim(qry_FileType.FieldByName('Col'+InttoStr(J)).AsString);
              FieldProperties[length(FieldProperties)-1].UpperCase := (qry_FileType.FieldByName('Col'+InttoStr(J)+'Upp').asInteger = 1);
              FieldProperties[length(FieldProperties)-1].Verify := (qry_FileType.FieldByName('Col'+InttoStr(J)+'Ver').asInteger = 1);
              FieldProperties[length(FieldProperties)-1].Required := (qry_FileType.FieldByName('Col'+InttoStr(J)+'Req').asInteger = 1);
            end;
        end;
      IndexDefMatchCol := trim(qry_FileType.FieldByName('IndexMatchCol').asString);
//----------
      if DatModCap.qry_FileType.FieldByName('UseRecordCat').AsBoolean then
        begin
          lbl_RecordCat.Visible := True;
          edt_RecordCat.Visible := True;
          btn_RecordCat.Visible := True;
        end
      else
        begin
          lbl_RecordCat.Visible := False;
          edt_RecordCat.Visible := False;
          btn_RecordCat.Visible := False;
        end;
//----------
      RefreshFields(DatModCap.qry_FileType);
    end;
end;

procedure Tfrm_Processing.btn_CBranchCapClick(Sender: TObject);
begin
  If not(DatModCap.qry_ContainersMain.State in dsEditModes)
   Then
    begin
      Messagedlg('Please edit this File before selecting a branch!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      DatModCap.qry_ContainersMain['Branch'] := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      DatModCap.qry_ContainersMain['Department'] := '';
      DatModCap.qry_ContainersMain['FileType'] := '';
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_Processing.btn_CDeptCapClick(Sender: TObject);
begin
  If not(DatModCap.qry_ContainersMain.State in dsEditModes)
   Then
    begin
      Messagedlg('Please edit this File before selecting a branch!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  If length(DatModCap.qry_ContainersMain.FieldbyName('BRANCH').asString) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(DatModCap.qry_ContainersMain.FieldbyName('BRANCH').asString, User) = mrOK Then
    begin
      DatModCap.qry_ContainersMain['Department'] := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      DatModCap.qry_ContainersMain['FileType'] := '';
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_Processing.btn_CRTypeCapClick(Sender: TObject);
begin
  If not(DatModCap.qry_ContainersMain.State in dsEditModes)
   Then
    begin
      Messagedlg('Please edit this File before selecting a branch!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  If length(DatModCap.qry_ContainersMain.FieldbyName('DEPARTMENT').asString) = 0 Then
    begin
      Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(False,
                          DatModCap.qry_ContainersMain.FieldbyName('BRANCH').asString,
                          DatModCap.qry_ContainersMain.FieldbyName('DEPARTMENT').asString,
                          User,
                          True,
                          False,
                          False,
                          False,
                          False) = mrOK Then
    begin
      DatModCap.qry_ContainersMain['FileType'] := frm_SelRType.qry_RType.FieldbyName('Description').asString;
//----------------------------------------------------------
//Update Retention Matrix
//----------------------------------------------------------
      DatModCap.qry_ContainersMain['WIP'] := frm_SelRType.qry_RType.FieldByName('cWIP').AsInteger;
      DatModCap.qry_ContainersMain['AONS'] := frm_SelRType.qry_RType.FieldByName('cAONS').AsInteger;
      DatModCap.qry_ContainersMain['SAONS'] := frm_SelRType.qry_RType.FieldByName('cSAONS').AsInteger;
      DatModCap.qry_ContainersMain['INOS'] := frm_SelRType.qry_RType.FieldByName('cINOS').AsInteger;
      DatModCap.qry_ContainersMain['RETENTIONPERIOD'] := frm_SelRType.qry_RType.FieldByName('cRETENTIONPERIOD').AsInteger;
      DatModCap.qry_ContainersMain['DESTROY'] := frm_SelRType.qry_RType.FieldByName('cDESTROY').AsInteger;
      DatmodCap.CalculateDestructionDateContainers;;
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_Processing.edt_CRTypeCapChange(Sender: TObject);
Var
  J  :Integer;
begin
  HideFields;
  If length(DatModCap.qry_ContainersMain.FieldbyName('FileType').asString) = 0 then
    exit;
  With DatmodCap do
    begin
      qry_3DFileType.Close;
      qry_3DFileType.SQL.Clear;
      qry_3DFileType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :Description');
      qry_3DFileType.Parameters.ParamValues['Description'] := qry_ContainersMain.FieldbyName('FileType').asString;
      dm_Metrofiler.ExecuteCached(qry_3DFileType, EncodeTime(1,0,0,0));
//----------
      SetLength(FieldProperties, 0);
      For J := 1 to 10 Do
        begin
          If trim(qry_3DFileType.FieldByName('Col'+InttoStr(J)).AsString) <> '' Then
            begin
              SetLength(FieldProperties, Length(FieldProperties)+1);
              FieldProperties[length(FieldProperties)-1].FieldName := 'Col'+InttoStr(J);
              FieldProperties[length(FieldProperties)-1].Alias := trim(qry_3DFileType.FieldByName('Col'+InttoStr(J)).AsString);
              FieldProperties[length(FieldProperties)-1].UpperCase := (qry_3DFileType.FieldByName('Col'+InttoStr(J)+'Upp').asInteger = 1);
              FieldProperties[length(FieldProperties)-1].Verify := (qry_3DFileType.FieldByName('Col'+InttoStr(J)+'Ver').asInteger = 1);
              FieldProperties[length(FieldProperties)-1].Required := (qry_3DFileType.FieldByName('Col'+InttoStr(J)+'Req').asInteger = 1);
            end;
        end;
//----------
      RefreshFields(qry_3DFileType);
    end;
end;

procedure Tfrm_Processing.nav_CaptureClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  If Button = nbEdit Then
    begin
      If nav_Capture.DataSource = DatModCap.dts_Files Then
        begin
          dm_Metrofiler.InsAudit('Edit File', 0, 0, DatModCap.qry_FilesMain.FieldbyName('FILENUMBER').asString, '', 0);
        end;
      If nav_Capture.DataSource = DatModCap.dts_ContainersMain Then
        begin
          dm_Metrofiler.InsAudit('Edit Container', 0, 0, DatModCap.qry_ContainersMain.FieldbyName('CONTAINER').asString, '', 0);
        end;
    end
  else If Button = nbInsert Then
    begin
      If PageControl1.ActivePageIndex = 1 Then
        begin
          EditFileNumber.SetFocus;
          If EditFileNumber.ReadOnly Then
            SelectNext(EditFileNumber, True, True);
        end
      else if PageControl1.ActivePageIndex = 2 Then
        begin
          editItemCode.SetFocus;
          If editItemCode.ReadOnly Then
            SelectNext(editItemCode, True, True);
        end
      else if PageControl1.ActivePageIndex = 3 Then
        begin
          edt_ContainerNo.SetFocus;
          If edt_ContainerNo.ReadOnly Then
            SelectNext(edt_ContainerNo, True, True);
        end;
    end;
end;

procedure Tfrm_Processing.editFileNoDestroyClick(Sender: TObject);
begin
 If (DatModCap.qry_FilesMain.State in dsEditModes)and(editFileNoDestroy.Checked) Then
   DatModCap.qry_FilesMain['Destruct'] := Null;
end;

procedure Tfrm_Processing.btn_PrintRecordDetailsClick(Sender: TObject);
begin
  If DatModCap.qry_FilesMain.IsEmpty Then
    begin
      Messagedlg('No File selected!!', mtInformation, [MBok], 0);
      exit;
    end;

  Application.CreateForm(Tfrm_FileCoversheet, frm_FileCoversheet);
  try
    if frm_FileCoversheet.Execute(DatModCap.qry_FilesMain.FieldbyName('FILENUMBER').AsString) = mrOK then
    begin
      frm_FileCoversheet.rep_RecordDetails.PreviewModal;
    end;
  finally
    frm_FileCoversheet.Free;;
  end;
end;

procedure Tfrm_Processing.rep_ResultBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  If sp_SearchbyRecordType.FieldCount = 3 Then
    begin
      qrlbl1.DataField := sp_SearchbyRecordType.Fields[1].Fieldname;
      qrlbl2.Enabled := True;
      qrlbl2.Enabled := False;
      qrlbl3.Enabled := False;
      qrlbl4.Enabled := False;
    end;
  If sp_SearchbyRecordType.FieldCount = 4 Then
    begin
      qrlbl1.DataField := sp_SearchbyRecordType.Fields[1].Fieldname;
      qrlbl2.DataField := sp_SearchbyRecordType.Fields[2].Fieldname;
      qrlbl2.Enabled := True;
      qrlbl2.Enabled := True;
      qrlbl3.Enabled := False;
      qrlbl4.Enabled := False;
    end;
  If sp_SearchbyRecordType.FieldCount = 5 Then
    begin
      qrlbl1.DataField := sp_SearchbyRecordType.Fields[1].Fieldname;
      qrlbl2.DataField := sp_SearchbyRecordType.Fields[2].Fieldname;
      qrlbl3.DataField := sp_SearchbyRecordType.Fields[3].Fieldname;
      qrlbl2.Enabled := True;
      qrlbl2.Enabled := True;
      qrlbl3.Enabled := True;
      qrlbl4.Enabled := False;
    end;
  If sp_SearchbyRecordType.FieldCount >= 6 Then
    begin
      qrlbl1.DataField := sp_SearchbyRecordType.Fields[1].Fieldname;
      qrlbl2.DataField := sp_SearchbyRecordType.Fields[2].Fieldname;
      qrlbl3.DataField := sp_SearchbyRecordType.Fields[3].Fieldname;
      qrlbl4.DataField := sp_SearchbyRecordType.Fields[4].Fieldname;
      qrlbl2.Enabled := True;
      qrlbl2.Enabled := True;
      qrlbl3.Enabled := True;
      qrlbl4.Enabled := True;
    end;
end;

procedure Tfrm_Processing.btn_PrintClick(Sender: TObject);
begin
  rep_Result.Print;
end;

procedure Tfrm_Processing.btn_PrintItemCoversheetClick(Sender: TObject);
begin
  If DatModCap.qry_Items.IsEmpty Then
    begin
      Messagedlg('No Item selected!!', mtInformation, [MBok], 0);
      exit;
    end;

  Application.CreateForm(Tfrm_ItemCoversheet, frm_ItemCoversheet);
  try
    if frm_ItemCoversheet.Execute(DatModCap.qry_Items.FieldbyName('ITEMNUMBER').AsString) = mrOK then
    begin
      frm_ItemCoversheet.rep_RecordDetails.PreviewModal;
    end;
  finally
    frm_ItemCoversheet.Free;;
  end;
end;

procedure Tfrm_Processing.btn_InUseClick(Sender: TObject);
Var
  pFilenumber    :String;
begin
  If DatmodCap.qry_FilesMain.IsEmpty Then
    begin
      Messagedlg('Please select or add a File First!', mtInformation, [mbOK], 0);
      exit;
    end;
//----
  If DatmodCap.qry_FilesMain.State in dsEditModes Then
    DatmodCap.qry_FilesMain.Post;
//----
  If trim(DatmodCap.qry_FilesMain.FieldbyName('IssueStatus').AsString) <> '' Then
    begin
      Messagedlg('Please select a File that has not been put-away or add a File First!', mtInformation, [mbOK], 0);
      exit;
    end;
  pFilenumber := trim(DatmodCap.qry_FilesMain.FieldbyName('Filenumber').AsString);
//----
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('UPDATE Files SET');
  qry_SQL.SQL.Add('   IssueStatus = ''INUSE'',');
  qry_SQL.SQL.Add('   LocNo = ''In Transit'',');
  qry_SQL.SQL.Add('   ReceivedBy = NULL,');
  qry_SQL.SQL.Add('   ReceivedOn = NULL,');
  qry_SQL.SQL.Add('   IssuedUserId = :IssuedUserId,');
  qry_SQL.SQL.Add('   IssuedTo = :IssuedTo,');
  qry_SQL.SQL.Add('   IssuedOn = GETDATE(), UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
  qry_SQL.SQL.Add('WHERE Filenumber = :Filenumber');
  qry_SQL.Parameters.ParamByName('IssuedUserId').Value := User;
  qry_SQL.Parameters.ParamByName('IssuedTo').Value := trim(FirstName+' '+Surname);
  qry_SQL.Parameters.ParamByName('Filenumber').Value := pFilenumber;
  qry_SQL.ExecSQL;

  If frm_Console.TrackandTraceActive = 1 Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('INSERT INTO RequisitionQue (ReqUserID, Barcode)');
      qry_SQL.SQL.Add('VALUES (:ReqUserID, :Barcode)');
      qry_SQL.Parameters.ParamByName('ReqUserID').Value := User;
      qry_SQL.Parameters.ParamByName('Barcode').Value := pFilenumber;
      qry_SQL.ExecSQL;

      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('EXEC [dbo].[ap_ProxyReceive] :Location, :Barcode, :ReceivedBy, NULL, :Userid');
      qry_SQL.Parameters.ParamByName('Location').Value := WorkPlaceId;
      qry_SQL.Parameters.ParamByName('Barcode').Value := pFilenumber;
      qry_SQL.Parameters.ParamByName('ReceivedBy').Value := User;
      qry_SQL.Parameters.ParamByName('Userid').Value := User;
      qry_SQL.ExecSQL;
    end;
//----
  DatmodCap.qry_FilesMain.Refresh;
end;

procedure Tfrm_Processing.DBEditKeyPress(Sender: TObject; var Key: Char);
Var
  S, FieldName :String;
begin
  If Key = #27 Then
    Abort;
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT1')Then
    FieldName := 'Col1';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT2')Then
    FieldName := 'Col2';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT3')Then
    FieldName := 'Col3';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT4')Then
    FieldName := 'Col4';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT5')Then
    FieldName := 'Col5';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT6')Then
    FieldName := 'Col6';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT7')Then
    FieldName := 'Col7';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT8')Then
    FieldName := 'Col8';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT9')Then
    FieldName := 'Col9';
  If (UpperCase(TDBEdit(Sender).DataField) = 'TEXT10')Then
    FieldName := 'Col10';
//-----
  If (UpperCase(TDBEdit(Sender).DataField) = 'DATE1')Then
    FieldName := 'Col11';
  If (UpperCase(TDBEdit(Sender).DataField) = 'DATE2')Then
    FieldName := 'Col12';
  If (UpperCase(TDBEdit(Sender).DataField) = 'DATE3')Then
    FieldName := 'Col13';
//-----
  If (UpperCase(TDBEdit(Sender).DataField) = 'NUMBER1')Then
    FieldName := 'Col14';
  If (UpperCase(TDBEdit(Sender).DataField) = 'NUMBER2')Then
    FieldName := 'Col15';
//==============
  If DatModCap.CheckIfUpperCase(trim(FieldName)) Then
    If (ord(Key) >= 97)and(ord(Key) <= 122) Then
      begin
        S := uppercase(Key);
        Key := S[1];
      end;
end;


procedure Tfrm_Processing.EditText1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
  spDBEdit          :TDBEdit;
  sHead, SType             :String;
  p, i              :Integer;
  theText           :String;
begin
  case key of
    8, 13, 46, 37..39: ;
    27 : Abort;
    40 : begin
           If (Shift = [ssAlt]) Then
             begin
                spDBEdit := Sender as TDBEdit;
                sType := UPPERCASE(spDBEdit.DataField);
                If sType = 'TEXT1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL1').AsString;
                If sType = 'TEXT2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL2').AsString;
                If sType = 'TEXT3' Then sHead := DatModCap.qry_FileType.FieldbyName('COL3').AsString;
                If sType = 'TEXT4' Then sHead := DatModCap.qry_FileType.FieldbyName('COL4').AsString;
                If sType = 'TEXT5' Then sHead := DatModCap.qry_FileType.FieldbyName('COL5').AsString;
                If sType = 'TEXT6' Then sHead := DatModCap.qry_FileType.FieldbyName('COL6').AsString;
                If sType = 'TEXT7' Then sHead := DatModCap.qry_FileType.FieldbyName('COL7').AsString;
                If sType = 'TEXT8' Then sHead := DatModCap.qry_FileType.FieldbyName('COL8').AsString;
                If sType = 'TEXT9' Then sHead := DatModCap.qry_FileType.FieldbyName('COL9').AsString;
                If sType = 'TEXT10' Then sHead := DatModCap.qry_FileType.FieldbyName('COL10').AsString;
          //-------
                If sType = 'DATE1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL11').AsString;
                If sType = 'DATE2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL12').AsString;
                If sType = 'DATE3' Then sHead := DatModCap.qry_FileType.FieldbyName('COL13').AsString;
          //-------
                If sType = 'NUMBER1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL14').AsString;
                If sType = 'NUMBER2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL15').AsString;
          //--------
                frm_RecordLookup.Editable := False;
                If frm_RecordLookup.Execute(sHead, sType,
                                            DatModCap.qry_FileType.FieldbyName('Description').AsString) = mrOk Then
                  begin
                    If not(DatModCap.qry_FilesMain.State in dsEditModes) Then
                      DatModCap.qry_FilesMain.edit;
                    If sType = 'TEXT1' Then sHead := 'Col1';
                    If sType = 'TEXT2' Then sHead := 'Col2';
                    If sType = 'TEXT3' Then sHead := 'Col3';
                    If sType = 'TEXT4' Then sHead := 'Col4';
                    If sType = 'TEXT5' Then sHead := 'Col5';
                    If sType = 'TEXT6' Then sHead := 'Col6';
                    If sType = 'TEXT7' Then sHead := 'Col7';
                    If sType = 'TEXT8' Then sHead := 'Col8';
                    If sType = 'TEXT9' Then sHead := 'Col9';
                    If sType = 'TEXT10' Then sHead := 'Col10';
              //-------
                    If sType = 'DATE1' Then sHead := 'Col11';
                    If sType = 'DATE2' Then sHead := 'Col12';
                    If sType = 'DATE3' Then sHead := 'Col13';
              //-------
                    If sType = 'NUMBER1' Then sHead := 'Col14';
                    If sType = 'NUMBER2' Then sHead := 'Col15';
                    If DatModCap.CheckIfUpperCase(sHead) Then
                      spDBEdit.Field.Value := UPPERCASE(frm_RecordLookup.TextString)
                    else spDBEdit.Field.Value := frm_RecordLookup.TextString;
                  end;
             end
         end
      else
        begin
    //-------Check the rest
          spDBEdit := Sender as TDBEdit;
          sType := UPPERCASE(spDBEdit.DataField);
          If sType = 'TEXT1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL1').AsString;
          If sType = 'TEXT2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL2').AsString;
          If sType = 'TEXT3' Then sHead := DatModCap.qry_FileType.FieldbyName('COL3').AsString;
          If sType = 'TEXT4' Then sHead := DatModCap.qry_FileType.FieldbyName('COL4').AsString;
          If sType = 'TEXT5' Then sHead := DatModCap.qry_FileType.FieldbyName('COL5').AsString;
          If sType = 'TEXT6' Then sHead := DatModCap.qry_FileType.FieldbyName('COL6').AsString;
          If sType = 'TEXT7' Then sHead := DatModCap.qry_FileType.FieldbyName('COL7').AsString;
          If sType = 'TEXT8' Then sHead := DatModCap.qry_FileType.FieldbyName('COL8').AsString;
          If sType = 'TEXT9' Then sHead := DatModCap.qry_FileType.FieldbyName('COL9').AsString;
          If sType = 'TEXT10' Then sHead := DatModCap.qry_FileType.FieldbyName('COL10').AsString;
    //-------
          If sType = 'DATE1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL11').AsString;
          If sType = 'DATE2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL12').AsString;
          If sType = 'DATE3' Then sHead := DatModCap.qry_FileType.FieldbyName('COL13').AsString;
    //-------
          If sType = 'NUMBER1' Then sHead := DatModCap.qry_FileType.FieldbyName('COL14').AsString;
          If sType = 'NUMBER2' Then sHead := DatModCap.qry_FileType.FieldbyName('COL15').AsString;

          p :=  TDBEdit(Sender).SelStart;
          theText := copy(TDBEdit(Sender).Text, 0, p);
          For i := Low(Lookups) to High(Lookups) Do
            begin

              if (pos(upperCase(theText), upperCase(Lookups[I].Item))=1)and(Lookups[I].ColumnHeading = sHead) then

                if compareText(theText, Lookups[I].Item) < 0 then
                  begin
                    If pos(upperCase(TDBEdit(Sender).text), upperCase(Lookups[I].Item)) > 0 Then
                      begin
                        TDBEdit(Sender).Text := Lookups[I].Item;
                        TDBEdit(Sender).selStart := p;
                        TDBEdit(Sender).SelLength := length(TDBEdit(Sender).text) - TDBEdit(Sender).selStart;
                      end;
                    break;
                  end;
            end;
        end;
  end;
end;

procedure Tfrm_Processing.editConText1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
Var
  spDBEdit          :TDBEdit;
  sHead, SType             :String;
  p, i              :Integer;
  theText           :String;
begin
  case key of
    8, 13, 46, 37..39: ;
    27 : Abort;
    40 : begin
           If (Shift = [ssAlt]) Then
             begin
                spDBEdit := Sender as TDBEdit;
                sType := UPPERCASE(spDBEdit.DataField);
                If sType = 'TEXT1' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL1').AsString;
                If sType = 'TEXT2' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL2').AsString;
                If sType = 'TEXT3' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL3').AsString;
                If sType = 'TEXT4' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL4').AsString;
                If sType = 'TEXT5' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL5').AsString;
                If sType = 'TEXT6' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL6').AsString;
                If sType = 'TEXT7' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL7').AsString;
                If sType = 'TEXT8' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL8').AsString;
                If sType = 'TEXT9' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL9').AsString;
                If sType = 'TEXT10' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL10').AsString;
          //-------
                If sType = 'DATE1' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL11').AsString;
                If sType = 'DATE2' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL12').AsString;
                If sType = 'DATE3' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL13').AsString;
          //-------
                If sType = 'NUMBER1' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL14').AsString;
                If sType = 'NUMBER2' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL15').AsString;
          //--------
                frm_RecordLookup.Editable := False;
                If frm_RecordLookup.Execute(sHead, sType,
                                            DatModCap.qry_3DFileType.FieldbyName('Description').AsString) = mrOk Then
                  begin
                    If not(DatModCap.qry_ContainersMain.State in dsEditModes) Then
                      DatModCap.qry_ContainersMain.edit;
                    If sType = 'TEXT1' Then sHead := 'Col1';
                    If sType = 'TEXT2' Then sHead := 'Col2';
                    If sType = 'TEXT3' Then sHead := 'Col3';
                    If sType = 'TEXT4' Then sHead := 'Col4';
                    If sType = 'TEXT5' Then sHead := 'Col5';
                    If sType = 'TEXT6' Then sHead := 'Col6';
                    If sType = 'TEXT7' Then sHead := 'Col7';
                    If sType = 'TEXT8' Then sHead := 'Col8';
                    If sType = 'TEXT9' Then sHead := 'Col9';
                    If sType = 'TEXT10' Then sHead := 'Col10';
              //-------
                    If sType = 'DATE1' Then sHead := 'Col11';
                    If sType = 'DATE2' Then sHead := 'Col12';
                    If sType = 'DATE3' Then sHead := 'Col13';
              //-------
                    If sType = 'NUMBER1' Then sHead := 'Col14';
                    If sType = 'NUMBER2' Then sHead := 'Col15';
                    If DatModCap.CheckIfUpperCase(sHead) Then
                      spDBEdit.Field.Value := UPPERCASE(frm_RecordLookup.TextString)
                    else spDBEdit.Field.Value := frm_RecordLookup.TextString;
                  end;
             end
         end
      else
        begin
    //-------Check the rest
          spDBEdit := Sender as TDBEdit;
          sType := UPPERCASE(spDBEdit.DataField);
          If sType = 'TEXT1' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL1').AsString;
          If sType = 'TEXT2' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL2').AsString;
          If sType = 'TEXT3' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL3').AsString;
          If sType = 'TEXT4' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL4').AsString;
          If sType = 'TEXT5' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL5').AsString;
          If sType = 'TEXT6' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL6').AsString;
          If sType = 'TEXT7' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL7').AsString;
          If sType = 'TEXT8' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL8').AsString;
          If sType = 'TEXT9' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL9').AsString;
          If sType = 'TEXT10' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL10').AsString;
    //-------
          If sType = 'DATE1' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL11').AsString;
          If sType = 'DATE2' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL12').AsString;
          If sType = 'DATE3' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL13').AsString;
    //-------
          If sType = 'NUMBER1' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL14').AsString;
          If sType = 'NUMBER2' Then sHead := DatModCap.qry_3DFileType.FieldbyName('COL15').AsString;

          p :=  TDBEdit(Sender).SelStart;
          theText := copy(TDBEdit(Sender).Text, 0, p);
          For i := Low(Lookups) to High(Lookups) Do
            begin

              if (pos(upperCase(theText), upperCase(Lookups[I].Item))=1)and(Lookups[I].ColumnHeading = sHead) then

                if compareText(theText, Lookups[I].Item) < 0 then
                  begin
                    If pos(upperCase(TDBEdit(Sender).text), upperCase(Lookups[I].Item)) > 0 Then
                      begin
                        TDBEdit(Sender).Text := Lookups[I].Item;
                        TDBEdit(Sender).selStart := p;
                        TDBEdit(Sender).SelLength := length(TDBEdit(Sender).text) - TDBEdit(Sender).selStart;
                      end;
                    break;
                  end;
            end;
        end;
  end;
end;

procedure Tfrm_Processing.btn_InUseItemClick(Sender: TObject);
begin
  If DatmodCap.qry_Items.IsEmpty Then
    begin
      Messagedlg('Please select or add an Item First!', mtInformation, [mbOK], 0);
      exit;
    end;
//----
  If DatmodCap.qry_Items.State in dsEditModes Then
    DatmodCap.qry_Items.Post;
//----
  If trim(DatmodCap.qry_Items.FieldbyName('Status').AsString) <> 'P' Then
    begin
      Messagedlg('Please select an Item that has not been put-away or add an Item First!', mtInformation, [mbOK], 0);
      exit;
    end;
//----
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM Files WHERE Filenumber = '+QuotedStr(DatModCap.qry_Items.FieldbyName('FILENUMBER').asString));
  qry_SQL.Open;
  If qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      Messagedlg('File '+DatModCap.qry_Items.FieldbyName('FILENUMBER').asString+' not found!', mtInformation, [mbOK], 0);
      exit;
    end;
  If (qry_SQL.FieldByName('IssueStatus').AsString <> 'INUSE')AND
     (qry_SQL.FieldByName('IssueStatus').AsString <> 'INUSEI') Then
    begin
      qry_SQL.Close;
      Messagedlg('File '+DatModCap.qry_Items.FieldbyName('FILENUMBER').asString+' not flagged as INUSE!', mtInformation, [mbOK], 0);
      exit;
    end;
//----
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('UPDATE Items SET');
  qry_SQL.SQL.Add('   Status = ''IU'',');
  qry_SQL.SQL.Add('   LocNo = ''In Transit'',');
  qry_SQL.SQL.Add('   ReceivedBy = NULL,');
  qry_SQL.SQL.Add('   ReceivedOn = NULL,');
  qry_SQL.SQL.Add('   IssuedUserId = :IssuedUserId,');
  qry_SQL.SQL.Add('   IssuedTo = :IssuedTo,');
  qry_SQL.SQL.Add('   IssuedOn = GETDATE(), UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
  qry_SQL.SQL.Add('WHERE Itemnumber = :Itemnumber');
  qry_SQL.Parameters.ParamByName('IssuedUserId').Value := User;
  qry_SQL.Parameters.ParamByName('IssuedTo').Value := trim(FirstName+' '+Surname);
  qry_SQL.Parameters.ParamByName('Itemnumber').Value := trim(DatmodCap.qry_Items.FieldbyName('Itemnumber').AsString);
  qry_SQL.ExecSQL;

  If frm_Console.TrackandTraceActive = 1 Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('INSERT INTO RequisitionQue (ReqUserID, Barcode)');
      qry_SQL.SQL.Add('VALUES (:ReqUserID, :Barcode)');
      qry_SQL.Parameters.ParamByName('ReqUserID').Value := User;
      qry_SQL.Parameters.ParamByName('Barcode').Value := trim(DatmodCap.qry_Items.FieldbyName('Itemnumber').AsString);
      qry_SQL.ExecSQL;

      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('EXEC [dbo].[ap_ProxyReceive] :Location, :Barcode, :ReceivedBy, NULL, Userid');
      qry_SQL.Parameters.ParamByName('Location').Value := WorkPlaceId;
      qry_SQL.Parameters.ParamByName('Barcode').Value := trim(DatmodCap.qry_Items.FieldbyName('Itemnumber').AsString);
      qry_SQL.Parameters.ParamByName('ReceivedBy').Value := User;
      qry_SQL.Parameters.ParamByName('Userid').Value := User;
      qry_SQL.ExecSQL;
    end;
//----
  DatmodCap.qry_Items.Refresh;
end;

procedure Tfrm_Processing.ResultGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
 ListStr :string;
begin
//Set Font
  If (Column.Field = sp_SearchbyRecordType.Fields[0]) Then
    begin
      ResultGrid.Canvas.Font.Style := [fsBold];
    end;
//------------------------------------------------------------------------------
//Set Status symbol
//------------------------------------------------------------------------------
  If (UpperCase(Column.Field.FieldName) = 'IMAGESTATUS') and (sp_SearchbyRecordType.FieldByName('ImageStatus').AsInteger > 0) Then
    ListStr := 'IMAGED'      //Imaged
  else ListStr := '';
//------------------------------------------------------------------------------
//Draw Standard Text
//------------------------------------------------------------------------------
  If (UpperCase(Column.Field.FieldName) = 'IMAGESTATUS') Then
    ResultGrid.Canvas.TextRect(Rect,Rect.Left+1,Rect.Top+1,ListStr)
  else ResultGrid.Canvas.TextRect(Rect,Rect.Left+1,Rect.Top+1,Column.Field.DisplayText)
//------------------------------------------------------------------------------
end;

procedure Tfrm_Processing.btn_ViewImageClick(Sender: TObject);
begin
  If sp_SearchbyRecordType.FieldByName('ImageStatus').AsInteger <= 0 Then
    begin
      Messagedlg('Not Imaged!!', mtInformation, [mbOK], 0);
      exit;
    end;
  frm_Console.act_eRecordsExecute(frm_Console.act_eRecords);
  If UpperCase(sp_SearchbyRecordType.Fields[1].FieldName) = 'ITEMNUMBER' Then
    begin
      frm_Console.feRecords.DisplayeRecord(sp_SearchbyRecordType.FieldByName('Itemnumber').AsString, sp_SearchbyRecordType.FieldByName('Filenumber').AsString);
    end
  else if UpperCase(sp_SearchbyRecordType.Fields[1].FieldName) = 'FILENUMBER' Then
    begin
      frm_Console.feRecords.DisplayeRecord('', sp_SearchbyRecordType.FieldByName('Filenumber').AsString);
    end;
end;

procedure Tfrm_Processing.DisplayRecord(aRecordNumber :String);
begin
  PageControl1.ActivePage := Tabsheet2;
  PageControl1Change(Self);
  LookupFile.Text := aRecordNumber;
  btn_FindFileClick(btn_FindFile);
  LookupFile.Text := '';
end;

procedure Tfrm_Processing.DisplayItem(aItemNumber :String);
Var
  Filenumber  :String;
begin
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT Filenumber FROM Items WHERE Itemnumber = '+QuotedStr(aItemNumber));
  qry_SQL.Open;
  If qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      Messagedlg('Item '+aItemNumber+' not found.', mtInformation, [mbOK], 0);
      exit;
    end;
  Filenumber := qry_SQL.FieldByName('FILENUMBER').AsString;

  PageControl1.ActivePage := Tabsheet2;
  PageControl1Change(Self);
  LookupFile.Text := Filenumber;
  btn_FindFileClick(btn_FindFile);
  LookupFile.Text := '';

  PageControl1.ActivePage := Tabsheet5;
  PageControl1Change(Self);

  DatModCap.qry_Items.Locate('Itemnumber', aItemNumber, []);
  exit;
end;

procedure Tfrm_Processing.btn_SelFileDestroyDateClick(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      DatmodCap.qry_FilesMain.edit;
      DatmodCap.qry_FilesMain['Destruct'] := StartoftheDay(frm_GetDate.mCal.Date);
    end;
end;

procedure Tfrm_Processing.btn_CommentsClick(Sender: TObject);
begin
  frm_RecordComments.Execute(DatmodCap.qry_FilesMain.FieldByname('Filenumber').AsString);
end;

procedure Tfrm_Processing.btn_ManualRetrClick(Sender: TObject);
Var
  RecordNumber, TempStr   :String;
begin
  If DatModCap.qry_FilesMain.IsEmpty Then
    begin
      Messagedlg('No File selected!!', mtInformation, [MBok], 0);
      exit;
    end;
  If DatModCap.qry_FilesMain.FieldbyName('ISSUESTATUS').AsString <> 'IN' Then
    begin
      Messagedlg('File does not have a status of <IN>.', mtInformation, [MBok], 0);
      exit;
    end;

  RecordNumber := DatModCap.qry_FilesMain.FieldbyName('FILENUMBER').AsString;

  Application.CreateForm(Tfrm_ManualRetrieval, frm_ManualRetrieval);
  try
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT USERID,RTRIM(SURNAME) SURNAME,RTRIM(name) NAME FROM dbo.AuthCodes order by USERID');
    qry_SQL.Open;
    qry_SQL.First;

    frm_ManualRetrieval.cb_ReqName.Items.Clear;
    frm_ManualRetrieval.cb_ReqUserID.Items.Clear;

    While not qry_SQL.Eof Do
      begin
        TempStr := trim(trim(qry_SQL.FieldByname('Name').AsString) + ' ' + trim(qry_SQL.FieldByname('Surname').AsString));
        If TempStr <> '' Then
          begin
            frm_ManualRetrieval.cb_ReqName.Items.Add(TempStr);
            frm_ManualRetrieval.cb_ReqUserID.Items.Append(trim(qry_SQL.FieldByname('UserId').AsString));
          end;
        qry_SQL.Next;
      end;
    frm_ManualRetrieval.cb_ReqName.ItemIndex := 0;

    qry_SQL.Close;
    If frm_ManualRetrieval.ShowModal = mrOK Then
      begin
      //------Update Record----------
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('UPDATE Files SET IssueStatus = ''REQ'', IssuedOn = GETDATE(),');
        qry_SQL.SQL.Add('IssuedUserID = '+QuotedStr(frm_ManualRetrieval.cb_ReqUserID.Items.Strings[frm_ManualRetrieval.cb_ReqName.ItemIndex])+',  IssuedTo = '+QuotedStr(frm_ManualRetrieval.cb_ReqName.Text)+', ItTxNo = '+InttoStr(0)+', UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
        qry_SQL.SQL.Add('WHERE Filenumber = '+QuotedStr(RecordNumber));
        qry_SQL.ExecSQL;
      //------Audit Entry----------
        dm_Metrofiler.InsAudit('Requested File', 0, 0, RecordNumber, '', 0);
      //------Update Record----------
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('UPDATE Files SET');
        qry_SQL.SQL.Add('IssueStatus = ''OUT'',');
        qry_SQL.SQL.Add('  ReturnedOn = NULL,');
        qry_SQL.SQL.Add('  IssuedOn = GetDate(),');
        qry_SQL.SQL.Add('  LocNo = NULL,');
        qry_SQL.SQL.Add('  Warehouse = NULL,');
        qry_SQL.SQL.Add('  RecordNo = NULL, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
        qry_SQL.SQL.Add('WHERE Filenumber = '+QuotedStr(RecordNumber));
        qry_SQL.ExecSQL;

        Messagedlg('Successfully Retrieved.', mtInformation, [mbOK], 0);
        DatModCap.qry_FilesMain.Close;
        DatModCap.qry_FilesMain.Open;
      end;
  finally
    frm_ManualRetrieval.Free;
  end;
end;

procedure Tfrm_Processing.SpeedButton2Click(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      DatmodCap.qry_ContainersMain.edit;
      DatmodCap.qry_ContainersMain['Destruct'] := StartoftheDay(frm_GetDate.mCal.Date);
    end;
end;

procedure Tfrm_Processing.btnMatchClick(Sender: TObject);
begin
  If PageControl1.ActivePage = Tabsheet2 Then  //Files Capture
    begin
      If edt_RRTypeCap.Text = '' Then
        exit;

      frm_DataImpMatch.Execute(edt_RRTypeCap.Text);
      if not(DatModCap.qry_FilesMain.State in dsEditModes) then
        DatModCap.qry_FilesMain.edit;

      DatModCap.NoVerifyFlag := True;
      try
        DatModCap.qry_FilesMain['Text1'] := frm_DataImpMatch.Text1;
        DatModCap.qry_FilesMain['Text2'] := frm_DataImpMatch.Text2;
        DatModCap.qry_FilesMain['Text3'] := frm_DataImpMatch.Text3;
        DatModCap.qry_FilesMain['Text4'] := frm_DataImpMatch.Text4;
        DatModCap.qry_FilesMain['Text5'] := frm_DataImpMatch.Text5;
        DatModCap.qry_FilesMain['Text6'] := frm_DataImpMatch.Text6;
        DatModCap.qry_FilesMain['Text7'] := frm_DataImpMatch.Text7;
        DatModCap.qry_FilesMain['Text8'] := frm_DataImpMatch.Text8;
        DatModCap.qry_FilesMain['Text9'] := frm_DataImpMatch.Text9;
        DatModCap.qry_FilesMain['Text10'] := frm_DataImpMatch.Text10;

        DatModCap.qry_FilesMain['Date1'] := frm_DataImpMatch.Date1;
        DatModCap.qry_FilesMain['Date2'] := frm_DataImpMatch.Date2;
        DatModCap.qry_FilesMain['Date3'] := frm_DataImpMatch.Date3;

        DatModCap.qry_FilesMain['Number1'] := frm_DataImpMatch.Number1;
        DatModCap.qry_FilesMain['Number2'] := frm_DataImpMatch.Number2;
      finally
        DatModCap.NoVerifyFlag := False;
      end;
    end
  else if PageControl1.ActivePage = Tabsheet5 Then  //Item Capture
    begin
      If edt_IRecordType.Text = '' Then
        exit;

      frm_DataImpMatch.Execute(edt_IRecordType.Text);
      if not(DatModCap.qry_Items.State in dsEditModes) then
        DatModCap.qry_Items.edit;

      DatModCap.NoVerifyFlag := True;
      try
        DatModCap.qry_Items['Text1'] := frm_DataImpMatch.Text1;
        DatModCap.qry_Items['Text2'] := frm_DataImpMatch.Text2;
        DatModCap.qry_Items['Text3'] := frm_DataImpMatch.Text3;
        DatModCap.qry_Items['Text4'] := frm_DataImpMatch.Text4;
        DatModCap.qry_Items['Text5'] := frm_DataImpMatch.Text5;
        DatModCap.qry_Items['Text6'] := frm_DataImpMatch.Text6;
        DatModCap.qry_Items['Text7'] := frm_DataImpMatch.Text7;
        DatModCap.qry_Items['Text8'] := frm_DataImpMatch.Text8;
        DatModCap.qry_Items['Text9'] := frm_DataImpMatch.Text9;
        DatModCap.qry_Items['Text10'] := frm_DataImpMatch.Text10;

        DatModCap.qry_Items['Date1'] := frm_DataImpMatch.Date1;
        DatModCap.qry_Items['Date2'] := frm_DataImpMatch.Date2;
        DatModCap.qry_Items['Date3'] := frm_DataImpMatch.Date3;

        DatModCap.qry_Items['Number1'] := frm_DataImpMatch.Number1;
        DatModCap.qry_Items['Number2'] := frm_DataImpMatch.Number2;
      finally
        DatModCap.NoVerifyFlag := False;
      end;
    end
  else if PageControl1.ActivePage = Tabsheet7 Then  //Containers Capture
    begin
      If edt_CRTypeCap.Text = '' Then
        exit;

      frm_DataImpMatch.Execute(edt_CRTypeCap.Text);
      if not(DatModCap.qry_ContainersMain.State in dsEditModes) then
        DatModCap.qry_ContainersMain.edit;

      DatModCap.NoVerifyFlag := True;
      try
        DatModCap.qry_ContainersMain['Text1'] := frm_DataImpMatch.Text1;
        DatModCap.qry_ContainersMain['Text2'] := frm_DataImpMatch.Text2;
        DatModCap.qry_ContainersMain['Text3'] := frm_DataImpMatch.Text3;
        DatModCap.qry_ContainersMain['Text4'] := frm_DataImpMatch.Text4;
        DatModCap.qry_ContainersMain['Text5'] := frm_DataImpMatch.Text5;
        DatModCap.qry_ContainersMain['Text6'] := frm_DataImpMatch.Text6;
        DatModCap.qry_ContainersMain['Text7'] := frm_DataImpMatch.Text7;
        DatModCap.qry_ContainersMain['Text8'] := frm_DataImpMatch.Text8;
        DatModCap.qry_ContainersMain['Text9'] := frm_DataImpMatch.Text9;
        DatModCap.qry_ContainersMain['Text10'] := frm_DataImpMatch.Text10;

        DatModCap.qry_ContainersMain['Date1'] := frm_DataImpMatch.Date1;
        DatModCap.qry_ContainersMain['Date2'] := frm_DataImpMatch.Date2;
        DatModCap.qry_ContainersMain['Date3'] := frm_DataImpMatch.Date3;

        DatModCap.qry_ContainersMain['Number1'] := frm_DataImpMatch.Number1;
        DatModCap.qry_ContainersMain['Number2'] := frm_DataImpMatch.Number2;
      finally
        DatModCap.NoVerifyFlag := False;
      end;
    end;
end;

procedure Tfrm_Processing.sp_SearchbyRecordTypeAfterScroll(DataSet: TDataSet);
begin
  btn_ViewImage.Enabled := Dataset.FieldByName('ImageStatus').asInteger <> 0;
end;

procedure Tfrm_Processing.Button1Click(Sender: TObject);
begin
  if (DatmodCap.qry_ContainersMain.State <> dsEdit) and  (DatmodCap.qry_ContainersMain.State <> dsInsert)then
    begin
      MessageDLG('The File must be in edit mode before calculating the destruction date',mtInformation,[mbOK],0);
      exit;
    end;
  DatmodCap.CalculateDestructionDateContainers;
end;

procedure Tfrm_Processing.Button2Enter(Sender: TObject);
begin
  If DatModCap.qry_FilesMain.State in dsEditModes Then
    begin
      If edt_RBranchCap.Text = '' Then
        begin
          edt_RBranchCap.SetFocus;
        end
      else if edt_RDeptCap.Text = '' Then
        begin
          edt_RDeptCap.SetFocus;
        end
      else if edt_RRTypeCap.Text = '' Then
        begin
          edt_RRTypeCap.SetFocus;
        end
      else
        begin
          DatModCap.qry_FilesMain.Post;

          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT * FROM Barcode_Range WHERE Branch = :Branch AND Department = :Department AND RecordType = :RecordType AND Type = ''F'' AND AutoGenBarcode = 1');
          qry_SQL.Parameters.ParamValues['Branch'] := DatModCap.qry_FilesMain.FieldbyName('Branch').asString;
          qry_SQL.Parameters.ParamValues['Department'] := DatModCap.qry_FilesMain.FieldbyName('Department').asString;
          qry_SQL.Parameters.ParamValues['RecordType'] := DatModCap.qry_FilesMain.FieldbyName('FileType').asString;
          dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));
          If qry_SQL.IsEmpty Then
            DatModCap.qry_FilesMain.Append;
          qry_SQL.Close;

          editFilenumber.SetFocus;
        end;
    end;
end;

procedure Tfrm_Processing.btn_IRecordTypeClick(Sender: TObject);
begin
  If trim(DatModCap.qry_FilesMain.FieldByName('Filenumber').AsString) = '' Then
    begin
      Messagedlg('Please select a File before selecting a Record Type!!', mtWarning ,[mbOK], 0);
      exit;
    end;

  If not(DatModCap.qry_Items.State in dsEditModes) Then
    begin
      Messagedlg('Please edit this Item before selecting a Record Type!!', mtWarning ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(False,
                          DatModCap.qry_FilesMain.FieldbyName('BRANCH').asString,
                          DatModCap.qry_FilesMain.FieldbyName('DEPARTMENT').asString,
                          User,
                          False,
                          False,
                          True,
                          False,
                          False) = mrOK Then
    begin
      DatModCap.qry_Items['FileType'] := frm_SelRType.qry_RType.FieldbyName('Description').asString;
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_Processing.edt_IRecordTypeChange(Sender: TObject);
Var
  J :Integer;
begin
  HideFields;
  If length(DatModCap.qry_Items.FieldbyName('FileType').asString) = 0 then
    exit;
  With DatmodCap do
    begin
      qry_FileType.Close;
      qry_FileType.SQL.Clear;
      qry_FileType.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :Description');
      qry_FileType.Parameters.ParamValues['Description'] := qry_Items.FieldbyName('FileType').asString;
      dm_Metrofiler.ExecuteCached(qry_FileType, EncodeTime(1,0,0,0));
//----------
      SetLength(FieldProperties, 0);
      For J := 1 to 15 Do
        begin
          If trim(qry_FileType.FieldByName('Col'+InttoStr(J)).AsString) <> '' Then
            begin
              SetLength(FieldProperties, Length(FieldProperties)+1);
              FieldProperties[length(FieldProperties)-1].FieldName := 'Col'+InttoStr(J);
              FieldProperties[length(FieldProperties)-1].Alias := trim(qry_FileType.FieldByName('Col'+InttoStr(J)).AsString);
              FieldProperties[length(FieldProperties)-1].UpperCase := (qry_FileType.FieldByName('Col'+InttoStr(J)+'Upp').asInteger = 1);
              FieldProperties[length(FieldProperties)-1].Verify := (qry_FileType.FieldByName('Col'+InttoStr(J)+'Ver').asInteger = 1);
              FieldProperties[length(FieldProperties)-1].Required := (qry_FileType.FieldByName('Col'+InttoStr(J)+'Req').asInteger = 1);
            end;
        end;
//----------
      RefreshFields(DatModCap.qry_FileType);
    end;
end;

procedure Tfrm_Processing.cb_SearchRecordCatKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      cb_SearchRecordCat.ItemIndex := 0;
    end;
end;

procedure Tfrm_Processing.cb_SearchTypeChange(Sender: TObject);
VAR
  BranchCookie    :String;
  DepartmentCookie:String;
  RecordTypeCookie:String;
  RecordCatCookie :String;
begin
Screen.Cursor := crHourglass;
try
  edt_RRTypeSrc.Text := '';
//=========================Add Cached Search Options============================
  if cb_SearchType.ItemIndex = 0 then
    begin
      BranchCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManBranch);
      DepartmentCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManDepartment);
      RecordTypeCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManRecordType);
      RecordCatCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManRecordCat);

      if BranchCookie <> '' then
        begin
          frm_SelBranch.OpenDbOnly(User);
          if frm_SelBranch.qry_Branch.Locate('Branch', BranchCookie, []) then
            begin
              edt_RBranchSrc.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
              lbl_RBranchSrc.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
            end;
          frm_SelBranch.qry_Branch.Close;
        end;

      if DepartmentCookie <> '' then
        begin
          If length(edt_RBranchSrc.Text) = 0 Then
            begin
              Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelDept.OpenDbOnly(edt_RBranchSrc.Text, User);
          if frm_SelDept.qry_Dept.Locate('Department', DepartmentCookie, []) then
            begin
              edt_RDeptSrc.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
              lbl_RDeptSrc.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
            end;
          frm_SelDept.qry_Dept.Close;
        end;

      if RecordTypeCookie <> '' then
        begin
          If length(edt_RDeptSrc.Text) = 0 Then
            begin
              Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
              exit;
            end;

      frm_SelRType.OpenDbOnly(edt_RBranchSrc.Text,
                              edt_RDeptSrc.Text,
                              User,
                              cb_SearchType.ItemIndex = 2,
                              cb_SearchType.ItemIndex = 0,
                              cb_SearchType.ItemIndex = 1,
                              False,
                              False);
          if frm_SelRType.qry_RType.Locate('Description', RecordTypeCookie, []) then
            begin
              edt_RRTypeSrc.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
            end;
          frm_SelRType.qry_RType.Close;
        end;
      if cb_SearchRecordCat.Visible then
        If cb_SearchRecordCat.Items.IndexOf(RecordCatCookie) <> -1 Then
          cb_SearchRecordCat.ItemIndex := cb_SearchRecordCat.Items.IndexOf(RecordCatCookie);
       
    end
  else if cb_SearchType.ItemIndex = 1 then
    begin
      BranchCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManBranch);
      DepartmentCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManDepartment);
      RecordTypeCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieDocManRecordType);

      if BranchCookie <> '' then
        begin
          frm_SelBranch.OpenDbOnly(User);
          if frm_SelBranch.qry_Branch.Locate('Branch', BranchCookie, []) then
            begin
              edt_RBranchSrc.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
              lbl_RBranchSrc.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
            end;
          frm_SelBranch.qry_Branch.Close;
        end;

      if DepartmentCookie <> '' then
        begin
          If length(edt_RBranchSrc.Text) = 0 Then
            begin
              Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelDept.OpenDbOnly(edt_RBranchSrc.Text, User);
          if frm_SelDept.qry_Dept.Locate('Department', DepartmentCookie, []) then
            begin
              edt_RDeptSrc.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
              lbl_RDeptSrc.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
            end;
          frm_SelDept.qry_Dept.Close;
        end;

      if RecordTypeCookie <> '' then
        begin
          If length(edt_RDeptSrc.Text) = 0 Then
            begin
              Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
              exit;
            end;
      frm_SelRType.OpenDbOnly(edt_RBranchSrc.Text,
                              edt_RDeptSrc.Text,
                              User,
                              cb_SearchType.ItemIndex = 2,
                              cb_SearchType.ItemIndex = 0,
                              cb_SearchType.ItemIndex = 1,
                              False,
                              False);
          if frm_SelRType.qry_RType.Locate('Description', RecordTypeCookie, []) then
            begin
              edt_RRTypeSrc.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
            end;
          frm_SelRType.qry_RType.Close;
        end;
    end
  else  if cb_SearchType.ItemIndex = 2 then
    begin
      BranchCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieWareManBranch);
      DepartmentCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieWareManDepartment);
      RecordTypeCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieWareManRecordType);
      if BranchCookie <> '' then
        begin
          frm_SelBranch.OpenDbOnly(User);
          if frm_SelBranch.qry_Branch.Locate('Branch', BranchCookie, []) then
            begin
              edt_RBranchSrc.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
              lbl_RBranchSrc.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
            end;
          frm_SelBranch.qry_Branch.Close;
        end;

      if DepartmentCookie <> '' then
        begin
          If length(edt_RBranchSrc.Text) = 0 Then
            begin
              Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelDept.OpenDbOnly(edt_RBranchSrc.Text, User);
          if frm_SelDept.qry_Dept.Locate('Department', DepartmentCookie, []) then
            begin
              edt_RDeptSrc.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
              lbl_RDeptSrc.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
            end;
          frm_SelDept.qry_Dept.Close;
        end;

      if RecordTypeCookie <> '' then
        begin
          If length(edt_RDeptSrc.Text) = 0 Then
            begin
              Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
              exit;
            end;
          frm_SelRType.OpenDbOnly(edt_RBranchSrc.Text,
                                  edt_RDeptSrc.Text,
                                  User,
                                  cb_SearchType.ItemIndex = 2,
                                  cb_SearchType.ItemIndex = 0,
                                  cb_SearchType.ItemIndex = 1,
                                  False,
                                  False);
          if frm_SelRType.qry_RType.Locate('Description', RecordTypeCookie, []) then
            begin
              edt_RRTypeSrc.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
            end;
          frm_SelRType.qry_RType.Close;
        end;
    end;
finally
  Screen.Cursor := crDefault;
end;
end;

end.



