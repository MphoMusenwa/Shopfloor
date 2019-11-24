//============================================================\\
//===Platform: Windows
//===Development Tool:  Borland® Developer Studio Enterprise
//===Database Connectivity:  ADO
//============================================================\\
unit IndexDefinitions;

interface

uses
  Windows, Messages, WinTypes,WinProcs,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, DB, DBTables, DBCtrls,ExtCtrls, Grids,
  DBGrids, Mask, Tabnotbk, ADODB, Variants, DirDlg, ieview, imageenview, ExtDlgs, ImageEnProc,
  iemview, Menus;

type
  PCOOLPosRec = ^TMyCOOLPosRec;
  TMyCOOLPosRec = record
    ID        :Integer;
    FieldName :String;
    FontName  :String;
    FontSize  :Integer;
    FontStyle :String;
    PosX      :Integer;
    PosY      :Integer;
    Visible   :Boolean;
  end;
  Tfrm_IndexDefinitions = class(TForm)
    dts_IndexDefs: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    qry_IndexDefs: TADOQuery;
    qry_SQL: TADOQuery;
    pnl_Top: TPanel;
    FileNavigator: TDBNavigator;
    btn_Close: TSpeedButton;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    ScrollBox1: TScrollBox;
    Bevel1: TBevel;
    Label14: TLabel;
    grp_Files: TGroupBox;
    Label15: TLabel;
    Label31: TLabel;
    Bevel3: TBevel;
    Label32: TLabel;
    Label34: TLabel;
    edt_fRetentionPeriod: TDBEdit;
    chk_fNotDestroy: TDBCheckBox;
    chk_fCalcDateInsert: TDBCheckBox;
    cb_fCalcCapField: TDBComboBox;
    grp_FilesMatrix: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    edt_fWIP: TDBEdit;
    edt_fAOS: TDBEdit;
    edt_fSAOS: TDBEdit;
    edt_fIOS: TDBEdit;
    grp_eRecords: TGroupBox;
    Label21: TLabel;
    Label41: TLabel;
    Bevel2: TBevel;
    Label42: TLabel;
    Label43: TLabel;
    edt_eRetentionPeriod: TDBEdit;
    chk_eNotDestroy: TDBCheckBox;
    chk_eCalcDateInsert: TDBCheckBox;
    cb_eCalcCapField: TDBComboBox;
    grp_Items: TGroupBox;
    Label58: TLabel;
    Label59: TLabel;
    Bevel7: TBevel;
    Label60: TLabel;
    Label61: TLabel;
    edt_iRetentionPeriod: TDBEdit;
    chk_iNotDestroy: TDBCheckBox;
    chk_iCalcDateInsert: TDBCheckBox;
    cb_iCalcCapField: TDBComboBox;
    grp_ContainerMatrix: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    edt_cWIP: TDBEdit;
    edt_cAOS: TDBEdit;
    edt_cSAOS: TDBEdit;
    edt_cIOS: TDBEdit;
    grp_Containers: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    Bevel6: TBevel;
    Label47: TLabel;
    Label48: TLabel;
    edt_cRetentionPeriod: TDBEdit;
    chk_cNotDestroy: TDBCheckBox;
    chk_cCalcDateInsert: TDBCheckBox;
    cb_cCalcCapField: TDBComboBox;
    Bevel5: TBevel;
    Label2: TLabel;
    Label11: TLabel;
    edt_FilingMethod: TDBEdit;
    cb_Email: TDBComboBox;
    TabSheet4: TTabSheet;
    ScrollBox2: TScrollBox;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label16: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbl_LookupCnt1: TLabel;
    btn_Lookup1: TSpeedButton;
    lbl_LookupCnt2: TLabel;
    btn_Lookup2: TSpeedButton;
    lbl_LookupCnt3: TLabel;
    btn_Lookup3: TSpeedButton;
    lbl_LookupCnt4: TLabel;
    btn_Lookup4: TSpeedButton;
    lbl_LookupCnt5: TLabel;
    btn_Lookup5: TSpeedButton;
    lbl_LookupCnt6: TLabel;
    btn_Lookup6: TSpeedButton;
    lbl_LookupCnt11: TLabel;
    btn_Lookup11: TSpeedButton;
    lbl_LookupCnt12: TLabel;
    btn_Lookup12: TSpeedButton;
    lbl_LookupCnt14: TLabel;
    btn_Lookup14: TSpeedButton;
    lbl_LookupCnt15: TLabel;
    btn_Lookup15: TSpeedButton;
    lbl_LookupDesc1: TLabel;
    lbl_LookupDesc2: TLabel;
    lbl_LookupDesc3: TLabel;
    lbl_LookupDesc4: TLabel;
    lbl_LookupDesc5: TLabel;
    lbl_LookupDesc6: TLabel;
    lbl_LookupDesc11: TLabel;
    lbl_LookupDesc12: TLabel;
    lbl_LookupDesc14: TLabel;
    lbl_LookupDesc15: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    lbl_LookupCnt7: TLabel;
    btn_Lookup7: TSpeedButton;
    lbl_LookupDesc7: TLabel;
    Label17: TLabel;
    lbl_LookupCnt8: TLabel;
    btn_Lookup8: TSpeedButton;
    lbl_LookupDesc8: TLabel;
    Label33: TLabel;
    lbl_LookupCnt9: TLabel;
    btn_Lookup9: TSpeedButton;
    lbl_LookupDesc9: TLabel;
    Label36: TLabel;
    lbl_LookupCnt10: TLabel;
    btn_Lookup10: TSpeedButton;
    lbl_LookupDesc10: TLabel;
    Label39: TLabel;
    lbl_LookupCnt13: TLabel;
    btn_Lookup13: TSpeedButton;
    lbl_LookupDesc13: TLabel;
    Label1: TLabel;
    Label44: TLabel;
    Bevel4: TBevel;
    lbl_eRecStoreType: TLabel;
    lbl_eRecStoreWhere: TLabel;
    edt_1: TDBEdit;
    edt_2: TDBEdit;
    edt_3: TDBEdit;
    edt_4: TDBEdit;
    edt_5: TDBEdit;
    edt_6: TDBEdit;
    edt_11: TDBEdit;
    edt_12: TDBEdit;
    edt_14: TDBEdit;
    edt_15: TDBEdit;
    chk_Req1: TDBCheckBox;
    chk_Req2: TDBCheckBox;
    chk_Req3: TDBCheckBox;
    chk_Req4: TDBCheckBox;
    chk_Req5: TDBCheckBox;
    chk_Req6: TDBCheckBox;
    chk_Req11: TDBCheckBox;
    chk_Req12: TDBCheckBox;
    chk_Req14: TDBCheckBox;
    chk_Req15: TDBCheckBox;
    chk_Ver1: TDBCheckBox;
    chk_Ver2: TDBCheckBox;
    chk_Ver3: TDBCheckBox;
    chk_Ver4: TDBCheckBox;
    chk_Ver5: TDBCheckBox;
    chk_Ver6: TDBCheckBox;
    chk_Ver11: TDBCheckBox;
    chk_Ver12: TDBCheckBox;
    chk_Ver14: TDBCheckBox;
    chk_Ver15: TDBCheckBox;
    chk_Upp1: TDBCheckBox;
    chk_Upp2: TDBCheckBox;
    chk_Upp3: TDBCheckBox;
    chk_Upp4: TDBCheckBox;
    chk_Upp5: TDBCheckBox;
    chk_Upp6: TDBCheckBox;
    chk_Upp11: TDBCheckBox;
    chk_Upp12: TDBCheckBox;
    chk_Upp14: TDBCheckBox;
    chk_Upp15: TDBCheckBox;
    chk_Auto1: TDBCheckBox;
    chk_Auto2: TDBCheckBox;
    chk_Auto3: TDBCheckBox;
    chk_Auto4: TDBCheckBox;
    chk_Auto5: TDBCheckBox;
    chk_Auto6: TDBCheckBox;
    chk_Auto11: TDBCheckBox;
    chk_Auto12: TDBCheckBox;
    chk_Auto14: TDBCheckBox;
    chk_Auto15: TDBCheckBox;
    edt_7: TDBEdit;
    chk_Req7: TDBCheckBox;
    chk_Ver7: TDBCheckBox;
    chk_Upp7: TDBCheckBox;
    chk_Auto7: TDBCheckBox;
    edt_8: TDBEdit;
    chk_Req8: TDBCheckBox;
    chk_Ver8: TDBCheckBox;
    chk_Upp8: TDBCheckBox;
    chk_Auto8: TDBCheckBox;
    edt_9: TDBEdit;
    chk_Req9: TDBCheckBox;
    chk_Ver9: TDBCheckBox;
    chk_Upp9: TDBCheckBox;
    chk_Auto9: TDBCheckBox;
    edt_10: TDBEdit;
    chk_Req10: TDBCheckBox;
    chk_Ver10: TDBCheckBox;
    chk_Upp10: TDBCheckBox;
    chk_Auto10: TDBCheckBox;
    edt_13: TDBEdit;
    chk_Req13: TDBCheckBox;
    chk_Ver13: TDBCheckBox;
    chk_Upp13: TDBCheckBox;
    chk_Auto13: TDBCheckBox;
    edt_Description: TDBEdit;
    chk_Containers: TDBCheckBox;
    chk_Files: TDBCheckBox;
    chk_Items: TDBCheckBox;
    chk_eRecords: TDBCheckBox;
    cb_eRecStoreType: TDBComboBox;
    edt_eRecStoreWhere: TDBEdit;
    ScrollBox3: TScrollBox;
    ScrollBox4: TScrollBox;
    Label62: TLabel;
    btn_GeteRecFileRepositry: TSpeedButton;
    TabSheet5: TTabSheet;
    btn_GrantRoleRights: TBitBtn;
    Panel3: TPanel;
    Label75: TLabel;
    DBText3: TDBText;
    Label72: TLabel;
    chk_Val1: TDBCheckBox;
    chk_Val2: TDBCheckBox;
    chk_Val3: TDBCheckBox;
    chk_Val4: TDBCheckBox;
    chk_Val5: TDBCheckBox;
    chk_Val6: TDBCheckBox;
    chk_Val7: TDBCheckBox;
    chk_Val8: TDBCheckBox;
    chk_Val9: TDBCheckBox;
    chk_Val10: TDBCheckBox;
    chk_Val11: TDBCheckBox;
    chk_Val12: TDBCheckBox;
    chk_Val13: TDBCheckBox;
    chk_Val14: TDBCheckBox;
    chk_Val15: TDBCheckBox;
    btn_ImportLookup1: TSpeedButton;
    btn_ImportLookup2: TSpeedButton;
    btn_ImportLookup3: TSpeedButton;
    btn_ImportLookup4: TSpeedButton;
    btn_ImportLookup5: TSpeedButton;
    btn_ImportLookup6: TSpeedButton;
    btn_ImportLookup11: TSpeedButton;
    btn_ImportLookup12: TSpeedButton;
    btn_ImportLookup14: TSpeedButton;
    btn_ImportLookup15: TSpeedButton;
    btn_ImportLookup7: TSpeedButton;
    btn_ImportLookup8: TSpeedButton;
    btn_ImportLookup9: TSpeedButton;
    btn_ImportLookup10: TSpeedButton;
    btn_ImportLookup13: TSpeedButton;
    btn_ClearLookup1: TSpeedButton;
    btn_ClearLookup2: TSpeedButton;
    btn_ClearLookup3: TSpeedButton;
    btn_ClearLookup4: TSpeedButton;
    btn_ClearLookup5: TSpeedButton;
    btn_ClearLookup6: TSpeedButton;
    btn_ClearLookup11: TSpeedButton;
    btn_ClearLookup12: TSpeedButton;
    btn_ClearLookup14: TSpeedButton;
    btn_ClearLookup15: TSpeedButton;
    btn_ClearLookup7: TSpeedButton;
    btn_ClearLookup8: TSpeedButton;
    btn_ClearLookup9: TSpeedButton;
    btn_ClearLookup10: TSpeedButton;
    btn_ClearLookup13: TSpeedButton;
    odlg_Import: TOpenDialog;
    Bevel8: TBevel;
    Label74: TLabel;
    cb_IndexMatchCol: TDBComboBox;
    lblMatchCnt: TLabel;
    btnMatch: TSpeedButton;
    lblmatchDescr: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label76: TLabel;
    chkWebEdit1: TDBCheckBox;
    chkWebEdit2: TDBCheckBox;
    chkWebEdit3: TDBCheckBox;
    chkWebEdit4: TDBCheckBox;
    chkWebEdit5: TDBCheckBox;
    chkWebEdit6: TDBCheckBox;
    chkWebEdit11: TDBCheckBox;
    chkWebEdit12: TDBCheckBox;
    chkWebEdit14: TDBCheckBox;
    chkWebEdit15: TDBCheckBox;
    chkWebEdit7: TDBCheckBox;
    chkWebEdit8: TDBCheckBox;
    chkWebEdit9: TDBCheckBox;
    chkWebEdit10: TDBCheckBox;
    chkWebEdit13: TDBCheckBox;
    Label77: TLabel;
    edt_AlternativeDescription: TDBEdit;
    chk_COOL: TDBCheckBox;
    tb_COOL: TTabSheet;
    qry_CoolDefs: TADOQuery;
    dts_CoolDefs: TDataSource;
    DBGrid4: TDBGrid;
    btnAddCool: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btnEditCool: TSpeedButton;
    tb_COOLLayouts: TTabSheet;
    Panel4: TPanel;
    DBText4: TDBText;
    Label53: TLabel;
    btnLoadCOOLImage: TSpeedButton;
    Panel5: TPanel;
    Bevel9: TBevel;
    btn_ZoomOut: TSpeedButton;
    btn_ZoomIn: TSpeedButton;
    btn_FittoBest: TSpeedButton;
    btn_FittoActual: TSpeedButton;
    btn_FittoHeight: TSpeedButton;
    btn_FittoWidth: TSpeedButton;
    Panel6: TPanel;
    ImageViewer: TImageEnView;
    qry_COOLBackground: TADOQuery;
    odlg_Pic: TOpenPictureDialog;
    qry_COOLLabels: TADOQuery;
    Panel7: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    GroupBox4: TGroupBox;
    ImageEnMView1: TImageEnMView;
    Button5: TButton;
    GroupBox5: TGroupBox;
    chk_Visible: TCheckBox;
    Button6: TButton;
    Label66: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    lbl_FieldName: TLabel;
    lbl_FontName: TLabel;
    lbl_FontSize: TLabel;
    lbl_FontStyle: TLabel;
    lbl_PosX: TLabel;
    lbl_PosY: TLabel;
    Panel10: TPanel;
    DBText5: TDBText;
    Label83: TLabel;
    sgrd_Roles: TStringGrid;
    qry_Access: TADOQuery;
    sgrd_Users: TStringGrid;
    btn_GrantUserRights: TBitBtn;
    Panel2: TPanel;
    Label64: TLabel;
    DBText2: TDBText;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label5: TLabel;
    DBText1: TDBText;
    sgrd_Depts: TStringGrid;
    PopupMenu1: TPopupMenu;
    SelectAll1: TMenuItem;
    DeSelectAll1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    btn_RecordCatAccess: TSpeedButton;
    qry_OldRecordRType: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_ReqReturnClick(Sender: TObject);
    procedure DisplayDeptAccess;
    procedure DisplayRoleAccess;
    procedure DisplayUserAccess;
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure trol1Change(Sender: TObject);
    procedure qry_IndexDefsAfterInsert(DataSet: TDataSet);
    procedure qry_IndexDefsBeforePost(DataSet: TDataSet);
    procedure qry_IndexDefsAfterScroll(DataSet: TDataSet);
    procedure dts_IndexDefsStateChange(Sender: TObject);
    procedure btn_Lookup1Click(Sender: TObject);
    procedure dts_IndexDefsDataChange(Sender: TObject; Field: TField);
    procedure btn_CloseClick(Sender: TObject);
    procedure qry_IndexDefsAfterPost(DataSet: TDataSet);
    procedure qry_IndexDefsAfterEdit(DataSet: TDataSet);
    procedure chk_cNotDestroyClick(Sender: TObject);
    procedure chk_fNotDestroyClick(Sender: TObject);
    procedure chk_iNotDestroyClick(Sender: TObject);
    procedure chk_eNotDestroyClick(Sender: TObject);
    procedure chk_eRecordsClick(Sender: TObject);
    procedure cb_eRecStoreTypeChange(Sender: TObject);
    procedure btn_GeteRecFileRepositryClick(Sender: TObject);
    procedure SetDateReq(FieldHead:String);
    procedure qry_IndexDefsAfterOpen(DataSet: TDataSet);
    procedure chk_FilesClick(Sender: TObject);
    procedure btn_ClearLookup1Click(Sender: TObject);
    procedure btn_ImportLookup1Click(Sender: TObject);
    procedure btnMatchClick(Sender: TObject);
    procedure chk_COOLClick(Sender: TObject);
    procedure btnAddCoolClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnEditCoolClick(Sender: TObject);
    procedure btn_ZoomInClick(Sender: TObject);
    procedure btn_ZoomOutClick(Sender: TObject);
    procedure btn_FittoWidthClick(Sender: TObject);
    procedure btn_FittoHeightClick(Sender: TObject);
    procedure btn_FittoActualClick(Sender: TObject);
    procedure btn_FittoBestClick(Sender: TObject);
    procedure btnLoadCOOLImageClick(Sender: TObject);
    procedure ImageViewerMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageViewerMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ImageEnMView1ImageSelect(Sender: TObject; idx: Integer);
    procedure sgrd_RolesDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgrd_RolesClick(Sender: TObject);
    procedure btn_GrantRoleRightsClick(Sender: TObject);
    procedure sgrd_UsersClick(Sender: TObject);
    procedure sgrd_UsersDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btn_GrantUserRightsClick(Sender: TObject);
    procedure sgrd_DeptsClick(Sender: TObject);
    procedure sgrd_DeptsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure DeSelectAll1Click(Sender: TObject);
    procedure btn_RecordCatAccessClick(Sender: TObject);
  private
    { Private declarations }
    bitmapX,bitmapY      :integer;
    mDescription         :String;
    PrevValues           :Array[1..15] of string[30];
    meRecStoreType       :String;
    meRecFileStoreLoc    :String;
    FCheck, FNoCheck     :TBitmap;
    UpdateeRecRepositry  :Boolean;

    DeptsChk   :TStringList;

    RolesCChk  :TStringList;
    RolesFChk  :TStringList;
    RolesIChk  :TStringList;
    RolesEChk  :TStringList;

    UsersCChk  :TStringList;
    UsersFChk  :TStringList;
    UsersIChk  :TStringList;
    UsersEChk  :TStringList;

    function AddCoolField(FieldName :String; FieldSize :Integer):Boolean;
    function EditCoolField(FieldName :String; NewFieldName :String; FieldSize :Integer):Boolean;
    function DeleteCoolField(FieldName :String):Boolean;
    function DrawCOOLBackground(RecordType  :String):Boolean;
    function DrawCOOLFields(RecordType  :String):Boolean;
    procedure RefreshLayerViewer;
    procedure IETextOut(Canvas: TCanvas; x,y:integer; angle:integer; const Text: String);
    procedure ToggleCheckboxRoles( acol, arow: Integer );
    procedure ToggleCheckboxUsers( acol, arow: Integer );
    procedure ToggleCheckboxDepts( acol, arow: Integer );
  public
    { Public declarations }
  end;

var
  frm_IndexDefinitions: Tfrm_IndexDefinitions;

implementation

uses main, SelBranch, RecordLookup, MetrofilerDataModule, SelDept, Progress,
  IndexDefinitionsSelBranch, IndexDefinitionsSelDept,
  IndexDefinitionsMatch, AddCOOLField, RelRecordTypeRecordCat;

{$R *.DFM}

type
  TGridCracker = Class( TStringgrid );

procedure Tfrm_IndexDefinitions.FormCreate(Sender: TObject);
var 
  bmp: TBitmap; 
begin 
  FCheck:= TBitmap.Create;
  FNoCheck:= TBitmap.Create; 
  bmp:= TBitmap.create; 
  try 
    bmp.handle := LoadBitmap( 0, PChar(OBM_CHECKBOXES )); 
    // bmp now has a 4x3 bitmap of divers state images
    // used by checkboxes and radiobuttons
    With FNoCheck Do Begin
      // the first subimage is the unchecked box 
      width := bmp.width div 4;
      height := bmp.height div 3; 
      canvas.copyrect( canvas.cliprect, bmp.canvas, canvas.cliprect ); 
    End;
    With FCheck Do Begin 
      // the second subimage is the checked box 
      width := bmp.width div 4; 
      height := bmp.height div 3;
      canvas.copyrect( 
        canvas.cliprect, 
        bmp.canvas, 
        rect( width, 0, 2*width, height )); 
    End;
  finally 
    bmp.free 
  end;

  DeptsChk := TStringList.Create;

  RolesCChk  := TStringList.Create;
  RolesFChk  := TStringList.Create;
  RolesIChk  := TStringList.Create;
  RolesEChk  := TStringList.Create;

  UsersCChk  := TStringList.Create;
  UsersFChk  := TStringList.Create;
  UsersIChk  := TStringList.Create;
  UsersEChk  := TStringList.Create;

//-----------------------
  chk_eRecords.Enabled := False;
  chk_Files.Enabled := False;
  chk_Containers.Enabled := False;
  chk_Items.Enabled := False;
  chk_COOL.Enabled := False;
  If (frm_Console.fImgMan = 1)or(frm_Console.feRecMan = 1)or(frm_Console.fWebMan =1)or(frm_Console.fEntMan = 1) Then
    begin
      chk_eRecords.Enabled := True;
    end;
  If (frm_Console.fWareMan = 1)or(frm_Console.fDocMan =1)or(frm_Console.fEntMan = 1) Then
    begin
      chk_Files.Enabled := True;
      chk_Containers.Enabled := True;
      chk_Items.Enabled := True;
    end;
{  If (frm_Console.fCOOLMan = 1)or(frm_Console.fEntMan = 1) Then
    begin
      chk_COOL.Enabled := True;
    end;}

  PageControl1.ActivePageIndex := 0;
  trol1Change(Self);

  Tabsheet2.TabVisible := frm_Console.AccessSysAdmin;
  Tabsheet4.TabVisible := frm_Console.AccessSysAdmin;
  Tabsheet5.TabVisible := frm_Console.AccessSysAdmin;

  If frm_Console.AccessSysAdmin Then
    FileNavigator.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbDelete,nbEdit,nbPost,nbCancel,nbRefresh]
  else
    FileNavigator.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,nbEdit,nbPost,nbCancel,nbRefresh];
end;

procedure Tfrm_IndexDefinitions.ImageEnMView1ImageSelect(Sender: TObject;
  idx: Integer);
Var
   J   :Integer;
begin
  ImageViewer.LayersCurrent := idx;
  If idx = 0 Then
    begin
      lbl_FieldName.Caption := 'Background';
      lbl_FontName.Caption := '...';
      lbl_FontSize.Caption := '...';
      lbl_FontStyle.Caption := '...';
      lbl_PosX.Caption := '0';
      lbl_PosY.Caption := '0';
      chk_Visible.Checked := True;

      For J := 0 to ImageViewer.LayersCount-1 Do
        ImageViewer.Layers[J].Visible := True;
    end
  else
    begin
      For J := 1 to ImageViewer.LayersCount-1 Do
        ImageViewer.Layers[J].Visible := False;

      lbl_FieldName.Caption := PCOOLPosRec(ImageViewer.Layers[idx].UserData)^.FieldName;
      lbl_FontName.Caption := PCOOLPosRec(ImageViewer.Layers[idx].UserData)^.FontName;
      lbl_FontSize.Caption := InttoStr(PCOOLPosRec(ImageViewer.Layers[idx].UserData)^.FontSize);
      lbl_FontStyle.Caption := PCOOLPosRec(ImageViewer.Layers[idx].UserData)^.FontStyle;
      lbl_PosX.Caption := InttoStr(PCOOLPosRec(ImageViewer.Layers[idx].UserData)^.PosX);
      lbl_PosY.Caption := InttoStr(PCOOLPosRec(ImageViewer.Layers[idx].UserData)^.PosY);
      chk_Visible.Checked := PCOOLPosRec(ImageViewer.Layers[idx].UserData)^.Visible;
      ImageViewer.Layers[idx].Visible := True;
    end;
end;

procedure Tfrm_IndexDefinitions.ImageViewerMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  with ImageViewer do
  begin
    bitmapX:=imin(imax(0,XScr2Bmp(X)),IEBitmap.Width-1);
    bitmapY:=imin(imax(0,YScr2Bmp(Y)),IEBitmap.Height-1);
  end;
end;

procedure Tfrm_IndexDefinitions.IETextOut(Canvas: TCanvas; x,y:integer; angle:integer; const Text: String);
var
  XAdj, YAdj   :Integer;
  tWidth, tHeight   :Integer;
begin
  with Canvas do
  begin
    XAdj := Round(Font.Height/20);
    YAdj := Round(Font.Height/5);
    tWidth := TextWidth(Text);
    tHeight := TextHeight(Text);
    TextOut( x-XAdj, y-YAdj, Text);
  end;
end;

procedure Tfrm_IndexDefinitions.ImageViewerMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Var
    COOLDataPtr   :PCOOLPosRec;
begin
  If ImageViewer.Cursor = crCross Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SET NOCOUNT On');
      qry_SQL.SQL.Add('INSERT INTO IndexDefinitions_COOL_Pos(Description, FieldName, FontName, FontSize, FontStyle, XPos, YPos, Visible)');
      qry_SQL.SQL.Add('VALUES(:Description, :FieldName, :FontName, :FontSize, :FontStyle, :XPos, :YPos, :Visible)');
      qry_SQL.SQL.Add('SET NOCOUNT Off');
      qry_SQL.SQL.Add('SELECT @@IDENTITY AS ID');
      qry_SQL.Parameters.ParamByName('Description').Value := qry_IndexDefs.FieldbyName('Description').asString;
      qry_SQL.Parameters.ParamByName('FieldName').Value := frm_AddCOOLField.cb_FieldName.Text;
      qry_SQL.Parameters.ParamByName('FontName').Value := frm_AddCOOLField.edt_FontName.Text;
      qry_SQL.Parameters.ParamByName('FontSize').Value := StrtoInt(frm_AddCOOLField.edt_FontSize.Text);
      qry_SQL.Parameters.ParamByName('FontStyle').Value := frm_AddCOOLField.edt_FontStyle.Text;
      qry_SQL.Parameters.ParamByName('XPos').Value := BitmapX;
      qry_SQL.Parameters.ParamByName('YPos').Value := BitmapY;
      qry_SQL.Parameters.ParamByName('Visible').Value := True;
      qry_SQL.Open;
      New(COOLDataPtr);
      COOLDataPtr.ID := qry_SQL.FieldByName('ID').AsInteger;
      COOLDataPtr.FieldName := frm_AddCOOLField.cb_FieldName.Text;
      COOLDataPtr.FontName := frm_AddCOOLField.edt_FontName.Text;
      COOLDataPtr.FontSize := StrtoInt(frm_AddCOOLField.edt_FontSize.Text);
      COOLDataPtr.FontStyle := frm_AddCOOLField.edt_FontStyle.Text;
      COOLDataPtr.PosX := BitmapX;
      COOLDataPtr.PosY := BitmapY;
      COOLDataPtr.Visible := True;

      ImageViewer.LayersAdd;
      ImageViewer.Layers[ImageViewer.LayersCurrent].UserData := COOLDataPtr;
      ImageViewer.Proc.Fill(CreateRGB(255,255,255));
      ImageViewer.Bitmap.Canvas.Font := frm_AddCOOLField.FontDialog1.Font;
      IETextOut(ImageViewer.Bitmap.Canvas, BitmapX, BitmapY, 0, frm_AddCOOLField.cb_FieldName.Text); // draw text on NEW layer
      ImageViewer.Proc.SetTransparentColors(CreateRGB(255,255,255), CreateRGB(255,255,255), 0); // remove the white, making it as transparent
      RefreshLayerViewer;

      ImageViewer.Cursor := crArrow;
    end;
end;

procedure Tfrm_IndexDefinitions.MenuItem1Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to UsersCChk.Count-1 do
    begin
      If UsersCChk.Strings[J] = '0' Then UsersCChk.Strings[J] := '1';
      If UsersFChk.Strings[J] = '0' Then UsersFChk.Strings[J] := '1';
      If UsersIChk.Strings[J] = '0' Then UsersIChk.Strings[J] := '1';
      If UsersEChk.Strings[J] = '0' Then UsersEChk.Strings[J] := '1';
    end;

  For J := 1 to sgrd_Users.RowCount - 1 do
    begin
      TGridCracker(sgrd_Users).InvalidateCell(sgrd_Users.ColCount-1 , J);
      TGridCracker(sgrd_Users).InvalidateCell(sgrd_Users.ColCount-2 , J);
      TGridCracker(sgrd_Users).InvalidateCell(sgrd_Users.ColCount-3 , J);
      TGridCracker(sgrd_Users).InvalidateCell(sgrd_Users.ColCount-4 , J);
    end;
end;

procedure Tfrm_IndexDefinitions.MenuItem2Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to UsersCChk.Count-1 do
    begin
      If UsersCChk.Strings[J] = '1' Then UsersCChk.Strings[J] := '0';
      If UsersFChk.Strings[J] = '1' Then UsersFChk.Strings[J] := '0';
      If UsersIChk.Strings[J] = '1' Then UsersIChk.Strings[J] := '0';
      If UsersEChk.Strings[J] = '1' Then UsersEChk.Strings[J] := '0';
    end;

  For J := 1 to sgrd_Users.RowCount - 1 do
    begin
      TGridCracker(sgrd_Users).InvalidateCell(sgrd_Users.ColCount-1 , J);
      TGridCracker(sgrd_Users).InvalidateCell(sgrd_Users.ColCount-2 , J);
      TGridCracker(sgrd_Users).InvalidateCell(sgrd_Users.ColCount-3 , J);
      TGridCracker(sgrd_Users).InvalidateCell(sgrd_Users.ColCount-4 , J);
    end;
end;

procedure Tfrm_IndexDefinitions.MenuItem3Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to RolesCChk.Count-1 do
    begin
      If RolesCChk.Strings[J] = '0' Then RolesCChk.Strings[J] := '1';
      If RolesFChk.Strings[J] = '0' Then RolesFChk.Strings[J] := '1';
      If RolesIChk.Strings[J] = '0' Then RolesIChk.Strings[J] := '1';
      If RolesEChk.Strings[J] = '0' Then RolesEChk.Strings[J] := '1';
    end;

  For J := 1 to sgrd_Roles.RowCount - 1 do
    begin
      TGridCracker(sgrd_Roles).InvalidateCell(sgrd_Roles.ColCount-1 , J);
      TGridCracker(sgrd_Roles).InvalidateCell(sgrd_Roles.ColCount-2 , J);
      TGridCracker(sgrd_Roles).InvalidateCell(sgrd_Roles.ColCount-3 , J);
      TGridCracker(sgrd_Roles).InvalidateCell(sgrd_Roles.ColCount-4 , J);
    end;
end;

procedure Tfrm_IndexDefinitions.MenuItem4Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to RolesCChk.Count-1 do
    begin
      If RolesCChk.Strings[J] = '1' Then RolesCChk.Strings[J] := '0';
      If RolesFChk.Strings[J] = '1' Then RolesFChk.Strings[J] := '0';
      If RolesIChk.Strings[J] = '1' Then RolesIChk.Strings[J] := '0';
      If RolesEChk.Strings[J] = '1' Then RolesEChk.Strings[J] := '0';
    end;

  For J := 1 to sgrd_Roles.RowCount - 1 do
    begin
      TGridCracker(sgrd_Roles).InvalidateCell(sgrd_Roles.ColCount-1 , J);
      TGridCracker(sgrd_Roles).InvalidateCell(sgrd_Roles.ColCount-2 , J);
      TGridCracker(sgrd_Roles).InvalidateCell(sgrd_Roles.ColCount-3 , J);
      TGridCracker(sgrd_Roles).InvalidateCell(sgrd_Roles.ColCount-4 , J);
    end;
end;

procedure Tfrm_IndexDefinitions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm_Metrofiler.ClearCache;
  qry_IndexDefs.Close;
  FNoCheck.Free;
  FCheck.Free;
  frm_Console.act_RecordTypes.Enabled := true;
  Action := caFree;
end;

procedure Tfrm_IndexDefinitions.btn_RecordCatAccessClick(Sender: TObject);
begin
  frm_RelRecordTypeRecordCat.Execute(qry_IndexDefs.FieldByName('Description').AsString);
end;

procedure Tfrm_IndexDefinitions.btn_ReqReturnClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_IndexDefinitions.chk_COOLClick(Sender: TObject);
begin
  If chk_COOL.Checked and chk_COOL.Enabled and chk_COOL.Visible Then
    begin
      tb_COOL.TabVisible := True;
      tb_COOLLayouts.TabVisible := True;
    end
  else
    begin
      tb_COOL.TabVisible := False;
      tb_COOLLayouts.TabVisible := False;
    end;
end;

procedure Tfrm_IndexDefinitions.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  If PageControl1.ActivePageIndex = 0 Then
    begin
      If dts_IndexDefs.State in dsEditModes Then
        begin
          MessageDlg('Save you Changes first!!', mtInformation, [mbOK], 0);
          AllowChange := false;
          exit;
        end;
      If qry_IndexDefs.IsEmpty Then
        begin
          MessageDlg('Please enter a Record Type first', mtInformation, [mbOK], 0);
          AllowChange := false;
          exit;
        end;
    end;
end;

procedure Tfrm_IndexDefinitions.trol1Change(Sender: TObject);
begin
  If PageControl1.ActivePage = TabSheet1 Then
    begin
      qry_IndexDefs.Close;
      qry_IndexDefs.SQL.Clear;
      qry_IndexDefs.SQL.Add('SELECT');
      qry_IndexDefs.SQL.Add('	*');
      qry_IndexDefs.SQL.Add('FROM');
      qry_IndexDefs.SQL.Add('	IndexDefinitions i');
      if not frm_Console.AccessSysAdmin then
        begin
          qry_IndexDefs.SQL.Add('WHERE');
          qry_IndexDefs.SQL.Add('	EXISTS (SELECT * FROM IndexUAuthRts u WHERE u.Description = i.Description AND u.UserID = ''METROFILE\chrisv'')');
          qry_IndexDefs.SQL.Add('	OR');
          qry_IndexDefs.SQL.Add('	EXISTS (SELECT * FROM IndexUAuthRts u INNER JOIN RolesRts r ON u.RoleID = r.RoleId WHERE u.Description = i.Description AND r.UserID = ''METROFILE\chrisv'')');
        end;
      qry_IndexDefs.SQL.Add('ORDER BY');
      qry_IndexDefs.SQL.Add('	i.Description');
      qry_IndexDefs.Open;

      FileNavigator.Visible := True;
      lbl_eRecStoreType.Visible := chk_eRecords.Checked and chk_eRecords.Enabled;
      cb_eRecStoreType.Visible := chk_eRecords.Checked and chk_eRecords.Enabled;
      lbl_eRecStoreWhere.Visible := (cb_eRecStoreType.Text <> 'SQL-Server')and(chk_eRecords.Checked  and chk_eRecords.Enabled);
      edt_eRecStoreWhere.Visible := (cb_eRecStoreType.Text <> 'SQL-Server')and(chk_eRecords.Checked and chk_eRecords.Enabled);
      btn_GeteRecFileRepositry.Visible := (cb_eRecStoreType.Text <> 'SQL-Server')and(chk_eRecords.Checked and chk_eRecords.Enabled);
    end
  else If PageControl1.ActivePage = TabSheet3 Then
    begin
      FileNavigator.Visible := True;
    end
  else if PageControl1.ActivePage = TabSheet2 Then
    begin
      FileNavigator.Visible := False;
      DisplayDeptAccess;
    end
  else if PageControl1.ActivePage = TabSheet5 Then
    begin
      FileNavigator.Visible := False;
      DisplayRoleAccess;
    end
  else if PageControl1.ActivePage = TabSheet4 Then
    begin
      FileNavigator.Visible := False;
      DisplayUserAccess;
    end
  else if PageControl1.ActivePage = tb_COOL Then
    begin
      FileNavigator.Visible := False;
      qry_CoolDefs.Close;
      qry_CoolDefs.SQL.Clear;
      qry_CoolDefs.SQL.Add('SELECT * FROM IndexDefinitions_COOL WHERE Description = :DS ORDER BY FieldName');
      qry_CoolDefs.Parameters.ParamByName('DS').Value := qry_IndexDefs.FieldbyName('Description').asString;
      qry_CoolDefs.Open;
    end
  else if PageControl1.ActivePage = tb_COOLLayouts Then
    begin
      FileNavigator.Visible := False;
      DrawCOOLBackground(qry_IndexDefs.FieldbyName('Description').asString);
      DrawCOOLFields(qry_IndexDefs.FieldbyName('Description').asString);
    end;
end;

procedure Tfrm_IndexDefinitions.qry_IndexDefsAfterInsert(DataSet: TDataSet);
Var
   J   :Integer;
begin
  UpdateeRecRepositry := false;
  For J := 1 to 15 Do
    begin
      Dataset.FieldByName('Col'+InttoStr(J)+'Req').AsInteger := 0;
      Dataset.FieldByName('Col'+InttoStr(J)+'Upp').AsInteger := 0;
      Dataset.FieldByName('Col'+InttoStr(J)+'Ver').AsInteger := 0;
      Dataset.FieldByName('Col'+InttoStr(J)+'Auto').AsInteger := 0;
      Dataset.FieldByName('Col'+InttoStr(J)+'Val').AsInteger := 0;
      Dataset.FieldByName('Col'+InttoStr(J)+'Wedt').AsInteger := 1;

      PrevValues[J] := '';
    end;
  Dataset['cDestroy'] := 0;
  Dataset['fDestroy'] := 0;
  Dataset['iDestroy'] := 0;
  Dataset['eDestroy'] := 0;

  Dataset['UseFiles'] := 0;
  Dataset['UseItems'] := 0;
  Dataset['UseERecords'] := 0;
  Dataset['UseContainers'] := 0;

  Dataset['cCalcDestructOnEntryDate'] := 0;
  Dataset['fCalcDestructOnEntryDate'] := 0;
  Dataset['iCalcDestructOnEntryDate'] := 0;
  Dataset['eCalcDestructOnEntryDate'] := 0;

  PageControl1.ActivePageIndex := 0;
  edt_Description.SetFocus;
end;

procedure Tfrm_IndexDefinitions.qry_IndexDefsAfterOpen(DataSet: TDataSet);
begin
  chk_FilesClick(chk_Files);
  chk_COOLClick(chk_COOL);
end;

procedure Tfrm_IndexDefinitions.qry_IndexDefsBeforePost(DataSet: TDataSet);
vAR
  TableName  :String;
  Flag       :Boolean;

begin
  Flag := False;
  If (chk_Containers.Enabled) AND (qry_IndexDefs.FieldByName('UseContainers').AsBoolean) Then
    Flag := True;
  If (chk_Files.Enabled) AND (qry_IndexDefs.FieldByName('UseFiles').AsBoolean) Then
    Flag := True;
  If (chk_Items.Enabled) AND (qry_IndexDefs.FieldByName('UseItems').AsBoolean) Then
    Flag := True;
  If (chk_eRecords.Enabled) AND (qry_IndexDefs.FieldByName('UseERecords').AsBoolean) Then
    Flag := True;
  If (chk_COOL.Enabled) AND (qry_IndexDefs.FieldByName('UseCOOL').AsBoolean) Then
    Flag := True;

  If not Flag Then
    begin
      Messagedlg('Please tick at least one "Use With" selection.',mtInformation,[mbOK],0);
      Abort;
    end;

  If (length(Dataset.FieldByName('Col1').asString) = 0)and
     (length(Dataset.FieldByName('Col2').asString) = 0)and
     (length(Dataset.FieldByName('Col3').asString) = 0)and
     (length(Dataset.FieldByName('Col4').asString) = 0)and
     (length(Dataset.FieldByName('Col5').asString) = 0)and
     (length(Dataset.FieldByName('Col6').asString) = 0)and
     (length(Dataset.FieldByName('Col7').asString) = 0)and
     (length(Dataset.FieldByName('Col8').asString) = 0)and
     (length(Dataset.FieldByName('Col9').asString) = 0)and
     (length(Dataset.FieldByName('Col10').asString) = 0)and
     (length(Dataset.FieldByName('Col11').asString) = 0)and
     (length(Dataset.FieldByName('Col12').asString) = 0)and
     (length(Dataset.FieldByName('Col13').asString) = 0)and
     (length(Dataset.FieldByName('Col14').asString) = 0)and
     (length(Dataset.FieldByName('Col15').asString) = 0)Then
    begin
      Messagedlg('Please enter at least 1 Column, Date or Number Description!!',mtInformation,[mbOK],0);
      Abort;
    end;

  If (Dataset.FieldbyName('cCalcDestructOnEntryDate').asBoolean = false)AND
     (trim(Dataset.FieldbyName('cCalcDestructOnField').asString) <> '') Then
    SetDateReq(Dataset.FieldbyName('cCalcDestructOnField').asString);
  If (Dataset.FieldbyName('fCalcDestructOnEntryDate').asBoolean = false)AND
     (trim(Dataset.FieldbyName('fCalcDestructOnField').asString) <> '') Then
    SetDateReq(Dataset.FieldbyName('fCalcDestructOnField').asString);
  If (Dataset.FieldbyName('iCalcDestructOnEntryDate').asBoolean = false)AND
     (trim(Dataset.FieldbyName('iCalcDestructOnField').asString) <> '') Then
    SetDateReq(Dataset.FieldbyName('iCalcDestructOnField').asString);
  If (Dataset.FieldbyName('eCalcDestructOnEntryDate').asBoolean = false)AND
     (trim(Dataset.FieldbyName('eCalcDestructOnField').asString) <> '') Then
    SetDateReq(Dataset.FieldbyName('eCalcDestructOnField').asString);

  If (meRecStoreType <> trim(Dataset.FieldbyName('eRecStoreType').AsString))OR
     (meRecFileStoreLoc <> trim(Dataset.FieldbyName('eRecFileStoreLoc').AsString))Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT');
      qry_SQL.SQL.Add('  i.TrxNo,');
      qry_SQL.SQL.Add('  e.eRecNo,');
      qry_SQL.SQL.Add('  e.RecordType,');
      qry_SQL.SQL.Add('  i.DocName');
      qry_SQL.SQL.Add('FROM');
      qry_SQL.SQL.Add('  eRecords e');
      qry_SQL.SQL.Add('  INNER JOIN eRecordImages i ON e.eRecNo = i.eRecNo');
      qry_SQL.SQL.Add('WHERE');
      qry_SQL.SQL.Add('  e.RecordType = '+QuotedStr(Dataset.FieldByName('Description').asString));
      qry_SQL.Open;
      If not qry_SQL.IsEmpty Then
        begin
          If Messagedlg('Changing the eRecord Repositry will result in moving all the related eRecords to the New Respositry. This might take a long time. Are you Sure you want to Change the Repositry?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
            begin
              qry_SQL.Close;
              Abort;
            end;
          UpdateeRecRepositry := True;
        end;
      qry_SQL.Close;
    end;

  If Dataset['COOLID'] = null Then
    begin
      Dataset['COOLID'] := dm_Metrofiler.CreateGuid;
      TableName := 'COOL_'+Dataset.FieldbyName('COOLID').asString;

      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('CREATE TABLE [dbo].['+TableName+'](');
      qry_SQL.SQL.Add('	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,');
      qry_SQL.SQL.Add('	[DateAdded] [datetime] NOT NULL DEFAULT(GETDATE()),');
      qry_SQL.SQL.Add('	[AddedBy] [varchar](255) NOT NULL,');
      qry_SQL.SQL.Add('	[Branch] [varchar](3) NOT NULL,');
      qry_SQL.SQL.Add('	[Department] [varchar](2) NOT NULL,');
      qry_SQL.SQL.Add('	[RecordType] [varchar](30) NOT NULL,');
      qry_SQL.SQL.Add('	[RecordCat] [varchar](30) NOT NULL,');
      qry_SQL.SQL.Add(') ON [PRIMARY]');
      qry_SQL.ExecSQL;
    end;
end;

procedure Tfrm_IndexDefinitions.qry_IndexDefsAfterScroll(DataSet: TDataSet);
Var
  J   :SmallInt;
  FieldName  :String;
begin
  For J := 1 to 15 Do
    begin
      FieldName := 'Col'+InttoStr(J);
//--------
      If trim(Dataset.FieldByName(FieldName).asString) <> '' Then
        begin
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT Count(*) AS Tot FROM IndexDefsLookups');
          qry_SQL.SQL.Add('WHERE Description = '+QuotedStr(Dataset.FieldbyName('Description').asString));
          qry_SQL.SQL.Add('AND ColumnHeading = '+QuotedStr(Dataset.FieldByName(FieldName).asString));
          qry_SQL.Open;
          TLabel(FindComponent('lbl_LookupCnt'+InttoStr(J))).Caption := InttoStr(qry_SQL.FieldbyName('TOT').asInteger);
          qry_SQL.Close;
        end
      else TLabel(FindComponent('lbl_LookupCnt'+InttoStr(J))).Caption := '0';
    end;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT Count(*) AS Tot FROM IndexDefsMatch');
  qry_SQL.SQL.Add('WHERE Description = '+QuotedStr(Dataset.FieldbyName('Description').asString));
  qry_SQL.Open;
  lblMatchCnt.Caption := InttoStr(qry_SQL.FieldbyName('TOT').asInteger);
  qry_SQL.Close;

  chk_COOLClick(chk_COOL);
end;

procedure Tfrm_IndexDefinitions.dts_IndexDefsStateChange(Sender: TObject);
Var
  J :Integer;
begin
  For J := 1 to 15 Do
    begin
      TSpeedbutton(FindComponent('btn_Lookup'+InttoStr(J))).Visible := not(qry_IndexDefs.State in dsEditModes);
      TSpeedbutton(FindComponent('btn_ImportLookup'+InttoStr(J))).Visible := not(qry_IndexDefs.State in dsEditModes);
      TSpeedbutton(FindComponent('btn_ClearLookup'+InttoStr(J))).Visible := not(qry_IndexDefs.State in dsEditModes);
    end;
//  lbl_eRecStoreType.Enabled := (qry_IndexDefs.State = dsInsert);
//  cb_eRecStoreType.Enabled := (qry_IndexDefs.State = dsInsert);
//  lbl_eRecStoreWhere.Enabled := (qry_IndexDefs.State = dsInsert);
//  edt_eRecStoreWhere.Enabled := (qry_IndexDefs.State = dsInsert);

  btn_RecordCatAccess.Enabled := false;
  If not(qry_IndexDefs.State in dsEditModes) Then
    If qry_IndexDefs.FieldbyName('UseRecordCat').asBoolean Then
      btn_RecordCatAccess.Enabled := true;
end;

procedure Tfrm_IndexDefinitions.btn_Lookup1Click(Sender: TObject);
Var
  spbutton          :TSpeedbutton;
  SeqNo             :Integer;
  SType             :String;
begin
  spbutton := Sender as TSpeedbutton;
  SeqNo := StrtoInt(trim(copy(spButton.Name, 11, 2)));
  If SeqNo IN [1,2,3,4,5,6,7,8,9,10] Then sType := 'TEXT'
  else if SeqNo IN [11,12,13] Then sType := 'DATE'
  else if SeqNo IN [14,15] Then sType := 'NUM';
  frm_RecordLookup.Editable := True;
  frm_RecordLookup.Execute(TDBEdit(FindComponent('edt_'+InttoStr(SeqNo))).Text,
                           sType,
                           qry_IndexDefs.FieldbyName('Description').AsString);
  qry_IndexDefsAfterScroll(qry_IndexDefs);
end;

procedure Tfrm_IndexDefinitions.dts_IndexDefsDataChange(Sender: TObject;
  Field: TField);
Var
  J   :Integer;
begin
  cb_eMail.Items.Clear;
  cb_eMail.Items.Add('');

  cb_cCalcCapField.Items.Clear;
  cb_fCalcCapField.Items.Clear;
  cb_iCalcCapField.Items.Clear;
  cb_eCalcCapField.Items.Clear;
  cb_cCalcCapField.Items.Add('');
  cb_fCalcCapField.Items.Add('');
  cb_iCalcCapField.Items.Add('');
  cb_eCalcCapField.Items.Add('');

  cb_IndexMatchCol.Items.Clear;
  cb_IndexMatchCol.Items.Add('');


  For J := 1 to 15 Do
    If trim(qry_IndexDefs.FieldbyName('Col'+InttoStr(J)).AsString) <> '' Then
      begin
        cb_eMail.Items.Add(qry_IndexDefs.FieldbyName('Col'+InttoStr(J)).AsString);
        cb_IndexMatchCol.Items.Add(qry_IndexDefs.FieldbyName('Col'+InttoStr(J)).AsString);
        If (J >= 11) AND (J <= 13) Then
          begin
            cb_cCalcCapField.Items.Add(qry_IndexDefs.FieldbyName('Col'+InttoStr(J)).AsString);
            cb_fCalcCapField.Items.Add(qry_IndexDefs.FieldbyName('Col'+InttoStr(J)).AsString);
            cb_iCalcCapField.Items.Add(qry_IndexDefs.FieldbyName('Col'+InttoStr(J)).AsString);
            cb_eCalcCapField.Items.Add(qry_IndexDefs.FieldbyName('Col'+InttoStr(J)).AsString);
          end;
      end;
  cb_eMail.Text := qry_IndexDefs.FieldbyName('eMailField').AsString;
  cb_cCalcCapField.Text := qry_IndexDefs.FieldbyName('cCalcDestructOnField').AsString;
  cb_fCalcCapField.Text := qry_IndexDefs.FieldbyName('fCalcDestructOnField').AsString;
  cb_iCalcCapField.Text := qry_IndexDefs.FieldbyName('iCalcDestructOnField').AsString;
  cb_eCalcCapField.Text := qry_IndexDefs.FieldbyName('eCalcDestructOnField').AsString;
  cb_IndexMatchCol.Text := qry_IndexDefs.FieldbyName('IndexMatchCol').AsString;

  btn_RecordCatAccess.Enabled := false;
  If not(qry_IndexDefs.State in dsEditModes) Then
    If qry_IndexDefs.FieldbyName('UseRecordCat').asBoolean Then
      btn_RecordCatAccess.Enabled := true;
end;

function Tfrm_IndexDefinitions.AddCoolField(FieldName :String; FieldSize :Integer):Boolean;
Var
  TableName  :String;
begin
  TableName := 'COOL_' + qry_IndexDefs.FieldByName('COOLID').AsString;

  Result := False;
  Screen.Cursor := crHourglass;
  try
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('ALTER TABLE [dbo].['+TableName+'] ADD');
    qry_SQL.SQL.Add('['+FieldName+'] [varchar]('+InttoStr(FieldSize)+') NULL');
    qry_SQL.ExecSQL;
    Result := True;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function Tfrm_IndexDefinitions.EditCoolField(FieldName :String; NewFieldName :String; FieldSize :Integer):Boolean;
Var
  TableName  :String;
begin
  TableName := 'COOL_' + qry_IndexDefs.FieldByName('COOLID').AsString;

  Result := False;
  Screen.Cursor := crHourglass;
  try
    If FieldName <> NewFieldName Then
      begin
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('ALTER TABLE [dbo].['+TableName+'] ADD');
        qry_SQL.SQL.Add('['+NewFieldName+'] [varchar]('+InttoStr(FieldSize)+') NULL');
        qry_SQL.ExecSQL;
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('UPDATE [dbo].['+TableName+'] SET');
        qry_SQL.SQL.Add('['+NewFieldName+'] = ['+FieldName+']');
        qry_SQL.ExecSQL;
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('ALTER TABLE [dbo].['+TableName+'] DROP COLUMN');
        qry_SQL.SQL.Add('['+FieldName+']');
        qry_SQL.ExecSQL;
      end
    else
      begin
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('ALTER TABLE [dbo].['+TableName+']');
        qry_SQL.SQL.Add('ALTER COLUMN ['+NewFieldName+'] [varchar]('+InttoStr(FieldSize)+') NULL');
        qry_SQL.ExecSQL;
      end;
    Result := True;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function Tfrm_IndexDefinitions.DeleteCoolField(FieldName :String):Boolean;
Var
  TableName  :String;
begin
  TableName := 'COOL_' + qry_IndexDefs.FieldByName('COOLID').AsString;

  Result := False;
  Screen.Cursor := crHourglass;
  try
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('ALTER TABLE [dbo].['+TableName+'] DROP COLUMN');
    qry_SQL.SQL.Add('['+FieldName+']');
    qry_SQL.ExecSQL;
    Result := True;
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure Tfrm_IndexDefinitions.DeSelectAll1Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to DeptsChk.Count-1 do
    begin
      DeptsChk.Strings[J] := '0';
    end;

  For J := 1 to sgrd_Depts.RowCount - 1 do
    begin
      TGridCracker(sgrd_Depts).InvalidateCell(sgrd_Depts.ColCount-1 , J);
    end;
end;

procedure Tfrm_IndexDefinitions.BitBtn1Click(Sender: TObject);
var
  i : Integer;
begin
  Screen.Cursor := crHourglass;
//---------------Delete---------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('DELETE FROM IndexAuthRts');
  qry_Access.SQL.Add('WHERE Description = :Description');
  qry_Access.Parameters.ParamValues['Description'] := qry_IndexDefs.FieldbyName('Description').asString;
  qry_Access.ExecSQL;
//---------------Add Roles---------------------
  if (sgrd_Depts.Cells[0,1] > '')and(sgrd_Depts.RowCount > 1)then
    begin
      for I := 1 to sgrd_Depts.RowCount-1 do
        begin
          If DeptsChk.Strings[I-1] = '1' Then
            begin
              qry_Access.Close;
              qry_Access.SQL.Clear;
              qry_Access.SQL.Add('INSERT INTO IndexAuthRts (Description, Code, Branch, Department) VALUES(:Description, :Code, :Branch, :Department)');
              qry_Access.Parameters.ParamValues['Description'] := qry_IndexDefs.FieldbyName('Description').asString;
              qry_Access.Parameters.ParamByName('Code').Value := CompsCode;
              qry_Access.Parameters.ParamByName('Branch').Value := sgrd_Depts.Cells[0,I];
              qry_Access.Parameters.ParamByName('Department').Value := sgrd_Depts.Cells[2,I];
              qry_Access.ExecSQL;
            end;
        end;
    end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_IndexDefinitions.btnAddCoolClick(Sender: TObject);
Var
  RecordType  :String;
  FieldName   :String;
  sFieldSize  :String;
  FieldSize   :Integer;
begin
  RecordType := qry_IndexDefs.FieldByName('Description').AsString;

  If RecordType = '' Then
    exit;

  If Messagedlg('Are you sure you want to add a new COOL field to Record Type ' + RecordType + '?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;

  try
    if not InputQuery('Enter the Field Name', 'Field Name:', FieldName) then
      exit;

    Screen.Cursor := crHourglass;
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT COUNT(*) FROM IndexDefinitions_COOL WHERE Description = :DS AND FieldName = :FN');
    qry_SQL.Parameters.ParamValues['DS'] := RecordType;
    qry_SQL.Parameters.ParamValues['FN'] := FieldName;
    qry_SQL.Open;
    If qry_SQL.Fields[0].AsInteger > 0 Then
      begin
        Messagedlg('Field Name already exits for Record Type ' + RecordType + '.', mtInformation, [mbOK], 0);
        exit;
      end;

    Screen.Cursor := crDefault;
    if not InputQuery('Enter the Field Size', 'Field Size:', sFieldSize) then
      exit;

    FieldSize := StrtoIntDef(sFieldSize, -1);

    If (FieldSize < 1)or(FieldSize > 4000) Then
      begin
        Messagedlg('Invalid Field Size. Field Size must be between 1 and 4000.', mtInformation, [mbOK], 0);
        exit;
      end;

    Screen.Cursor := crHourglass;
    AddCoolField(FieldName, FieldSize);
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('INSERT INTO IndexDefinitions_COOL (Description, FieldName, FieldSize, XPos, YPos, Visible)');
    qry_SQL.SQL.Add('VALUES (:Description, :FieldName, :FieldSize, :XPos, :YPos, :Visible)');
    qry_SQL.Parameters.ParamValues['Description'] := RecordType;
    qry_SQL.Parameters.ParamValues['FieldName'] := FieldName;
    qry_SQL.Parameters.ParamValues['FieldSize'] := FieldSize;
    qry_SQL.Parameters.ParamValues['XPos'] := 0;
    qry_SQL.Parameters.ParamValues['YPos'] := 0;
    qry_SQL.Parameters.ParamValues['Visible'] := True;
    qry_SQL.ExecSQL;
    If qry_SQL.RowsAffected = 1 Then
      begin
        qry_CoolDefs.Close;
        qry_CoolDefs.Open;
        Messagedlg('Field ' + FieldName + ' added successfully.', mtInformation, [mbOK], 0);
      end;
  finally
    Screen.Cursor := crDefault;
    qry_SQL.Close;
  end;
end;

procedure Tfrm_IndexDefinitions.btnEditCoolClick(Sender: TObject);
Var
  RecordType  :String;
  FieldName   :String;
  NewFieldName:String;
  sFieldSize  :String;
  FieldSize   :Integer;
begin
  RecordType := qry_IndexDefs.FieldByName('Description').AsString;
  FieldName := qry_CoolDefs.FieldByName('FieldName').AsString;

  If RecordType = '' Then
    exit;

  If FieldName = '' Then
    exit;


  If Messagedlg('Are you sure you want to edit the COOL field ' + FieldName + ' for Record Type ' + RecordType + '?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;

  try
    NewFieldName := FieldName;
    if not InputQuery('Enter the Field Name', 'Field Name:', NewFieldName) then
      exit;

    Screen.Cursor := crHourglass;
    If NewFieldName <> FieldName Then
      begin
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('SELECT COUNT(*) FROM IndexDefinitions_COOL WHERE Description = :DS AND FieldName = :FN');
        qry_SQL.Parameters.ParamValues['DS'] := RecordType;
        qry_SQL.Parameters.ParamValues['FN'] := NewFieldName;
        qry_SQL.Open;
        If qry_SQL.Fields[0].AsInteger > 0 Then
          begin
            Messagedlg('Field Name already exits for Record Type ' + RecordType + '.', mtInformation, [mbOK], 0);
            exit;
          end;
      end;

    Screen.Cursor := crDefault;
    if not InputQuery('Enter the Field Size', 'Field Size:', sFieldSize) then
      exit;

    FieldSize := StrtoIntDef(sFieldSize, -1);

    If (FieldSize < 1)or(FieldSize > 4000) Then
      begin
        Messagedlg('Invalid Field Size. Field Size must be between 1 and 4000.', mtInformation, [mbOK], 0);
        exit;
      end;

    Screen.Cursor := crHourglass;
    EditCoolField(FieldName, NewFieldName, FieldSize);
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('UPDATE IndexDefinitions_COOL SET FieldName = :NewFieldName, FieldSize = :NewFieldSize');
    qry_SQL.SQL.Add('WHERE Description = :DS AND FieldName = :FN');
    qry_SQL.Parameters.ParamValues['NewFieldName'] := NewFieldName;
    qry_SQL.Parameters.ParamValues['NewFieldSize'] := FieldSize;
    qry_SQL.Parameters.ParamValues['DS'] := RecordType;
    qry_SQL.Parameters.ParamValues['FN'] := FieldName;
    qry_SQL.ExecSQL;
    If qry_SQL.RowsAffected = 1 Then
      begin
        qry_CoolDefs.Close;
        qry_CoolDefs.Open;
        Messagedlg('Field ' + FieldName + ' changed successfully.', mtInformation, [mbOK], 0);
      end;
  finally
    Screen.Cursor := crDefault;
    qry_SQL.Close;
  end;
end;

procedure Tfrm_IndexDefinitions.btnLoadCOOLImageClick(Sender: TObject);
Var
  J               :Integer;
  FileName        :String;
  ImportERecNo         :Integer;
begin
  If not odlg_Pic.Execute Then
    exit;

  Screen.Cursor := crHourglass;
  try
    FileName := ExpandUNCFileName(odlg_Pic.FileName);
//--------------
    qry_COOLBackground.Close;
    qry_COOLBackground.SQL.Clear;
    qry_COOLBackground.SQL.Add('UPDATE IndexDefinitions SET COOLBackground = :CB WHERE Description = :DS');
    qry_COOLBackground.Parameters.ParamByName('CB').LoadFromFile(Filename, ftBlob);
    qry_COOLBackground.Parameters.ParamByName('DS').Value := qry_IndexDefs.FieldByName('Description').AsString;
    qry_COOLBackground.ExecSQL;
  finally
    DrawCOOLBackground(qry_IndexDefs.FieldByName('Description').AsString);
    Screen.Cursor := crDefault;
  end;end;

procedure Tfrm_IndexDefinitions.btnMatchClick(Sender: TObject);
begin
  frm_IndexDefsMatch.Execute(qry_IndexDefs.FieldByName('Description').AsString);
  qry_IndexDefsAfterScroll(qry_IndexDefs);
end;

procedure Tfrm_IndexDefinitions.btn_ClearLookup1Click(Sender: TObject);
Var
  spbutton          :TSpeedbutton;
  SeqNo             :Integer;
  SType             :String;
begin
  spbutton := Sender as TSpeedbutton;
  SeqNo := StrtoInt(trim(copy(spButton.Name, 16, 2)));
  If SeqNo IN [1,2,3,4,5,6,7,8,9,10] Then sType := 'TEXT'
  else if SeqNo IN [11,12,13] Then sType := 'DATE'
  else if SeqNo IN [14,15] Then sType := 'NUM';

  If Messagedlg('Are you sure you wish to clear the Lookup Values for '+TDBEdit(FindComponent('edt_'+InttoStr(SeqNo))).Text+'?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;

  Screen.Cursor := crHourglass;
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM IndexDefsLookups WHERE Description = :DS AND ColumnHeading = :CH');
  qry_SQL.Parameters.ParamByName('DS').Value := qry_IndexDefs.FieldbyName('Description').AsString;
  qry_SQL.Parameters.ParamByName('CH').Value := TDBEdit(FindComponent('edt_'+InttoStr(SeqNo))).Text;
  qry_SQL.ExecSQL;
  Screen.Cursor := crDefault;
  qry_IndexDefsAfterScroll(qry_IndexDefs);
end;

procedure Tfrm_IndexDefinitions.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_IndexDefinitions.qry_IndexDefsAfterPost(DataSet: TDataSet);
Var
  J, Tot  :Integer;
begin
//------------------------------------------------------------------------------
  For J := 1 to 15 Do
    begin
      If PrevValues[J] <> Dataset.FieldByName('Col'+InttoStr(J)).asString Then
        begin
          If (trim(PrevValues[J]) <> '') AND (trim(Dataset.FieldByName('Col'+InttoStr(J)).asString) <> '') Then
            begin
              qry_SQL.Close;
              qry_SQL.SQL.Clear;
              qry_SQL.SQL.Add('UPDATE IndexDefsLookups SET');
              qry_SQL.SQL.Add('  ColumnHeading = '+QuotedStr(Dataset.FieldByName('Col'+InttoStr(J)).asString));
              qry_SQL.SQL.Add('WHERE Description = '+QuotedStr(Dataset.FieldByName('Description').asString));
              qry_SQL.SQL.Add('AND ColumnHeading = '+QuotedStr(PrevValues[J]));
              qry_SQL.ExecSQL;
            end
          else If (trim(PrevValues[J]) <> '') AND (trim(Dataset.FieldByName('Col'+InttoStr(J)).asString) = '') Then
            begin
              qry_SQL.Close;
              qry_SQL.SQL.Clear;
              qry_SQL.SQL.Add('DELETE FROM IndexDefsLookups');
              qry_SQL.SQL.Add('WHERE Description = '+QuotedStr(Dataset.FieldByName('Description').asString));
              qry_SQL.SQL.Add('AND ColumnHeading = '+QuotedStr(PrevValues[J]));
              qry_SQL.ExecSQL;
            end
        end;
    end;
//------------------------------------------------------------------------------
  If UpdateeRecRepositry Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT');
      qry_SQL.SQL.Add('  i.TrxNo,');
      qry_SQL.SQL.Add('  e.eRecNo,');
      qry_SQL.SQL.Add('  e.RecordType,');
      qry_SQL.SQL.Add('  i.DocName');
      qry_SQL.SQL.Add('FROM');
      qry_SQL.SQL.Add('  eRecords e');
      qry_SQL.SQL.Add('  INNER JOIN eRecordImages i ON e.eRecNo = i.eRecNo');
      qry_SQL.SQL.Add('WHERE');
      qry_SQL.SQL.Add('  e.RecordType = '+QuotedStr(Dataset.FieldByName('Description').asString));
      qry_SQL.Open;
      If not qry_SQL.IsEmpty Then
        begin
          Screen.Cursor := crHourglass;
          frm_Progress.Show;
          frm_Progress.btn_Cancel.Enabled := false;
          try
            qry_SQL.First;
            J := 0;
            Tot := qry_SQL.RecordCount;
            While not qry_SQL.EOF Do
              begin
                Inc(J);
                Application.ProcessMessages;
                frm_Progress.Prog(Round((J/Tot)*100));
                If frm_Progress.Cancelled Then
                  break;
              //----
                try
                  dm_Metrofiler.UpdateERecRepositry(qry_SQL.FieldByName('TrxNo').AsInteger);
                except
                end;
              //----
                qry_SQL.Next;
              end;
          finally
            frm_Progress.Hide;
            frm_Progress.btn_Cancel.Enabled := True;
            Screen.Cursor := crDefault;
          end;
        end;
      UpdateeRecRepositry := False;
      qry_SQL.Close;
    end;
//------------------------------------------------------------------------------
  qry_IndexDefsAfterScroll(qry_IndexDefs);
end;

procedure Tfrm_IndexDefinitions.qry_IndexDefsAfterEdit(DataSet: TDataSet);
Var
  J   :Integer;
begin
  UpdateeRecRepositry := false;
  For J := 1 to 15 Do
    PrevValues[J] := Dataset.FieldbyName('COL'+InttoStr(J)).AsString;
  mDescription := Dataset.FieldbyName('DESCRIPTION').AsString;
  meRecStoreType       := trim(Dataset.FieldbyName('eRecStoreType').AsString);
  meRecFileStoreLoc    := trim(Dataset.FieldbyName('eRecFileStoreLoc').AsString);
end;

procedure Tfrm_IndexDefinitions.cb_eRecStoreTypeChange(Sender: TObject);
begin
  lbl_eRecStoreType.Visible := chk_eRecords.Checked and chk_eRecords.Enabled;
  cb_eRecStoreType.Visible := chk_eRecords.Checked and chk_eRecords.Enabled;
  lbl_eRecStoreWhere.Visible := (cb_eRecStoreType.Text <> 'SQL-Server')and(chk_eRecords.Checked  and chk_eRecords.Enabled);
  edt_eRecStoreWhere.Visible := (cb_eRecStoreType.Text <> 'SQL-Server')and(chk_eRecords.Checked and chk_eRecords.Enabled);
  btn_GeteRecFileRepositry.Visible := (cb_eRecStoreType.Text <> 'SQL-Server')and(chk_eRecords.Checked and chk_eRecords.Enabled);
end;

procedure Tfrm_IndexDefinitions.chk_cNotDestroyClick(Sender: TObject);
begin
  If chk_cNotDestroy.Checked Then
    begin
      chk_cCalcDateInsert.Enabled := False;
      cb_cCalcCapField.Enabled := False;
    end
  else
    begin
      chk_cCalcDateInsert.Enabled := True;
      cb_cCalcCapField.Enabled := True;
    end;
//-------
  If qry_IndexDefs.State in dsEditModes Then
    begin
      If chk_cNotDestroy.Checked Then
        begin
          qry_IndexDefs['cCalcDestructOnEntryDate'] := 0;
          qry_IndexDefs['cCalcDestructOnField'] := Null;
        end;
    end;
end;

procedure Tfrm_IndexDefinitions.chk_fNotDestroyClick(Sender: TObject);
begin
  If chk_fNotDestroy.Checked Then
    begin
      chk_fCalcDateInsert.Enabled := False;
      cb_fCalcCapField.Enabled := False;
    end
  else
    begin
      chk_fCalcDateInsert.Enabled := True;
      cb_fCalcCapField.Enabled := True;
    end;
//-------
  If qry_IndexDefs.State in dsEditModes Then
    begin
      If chk_fNotDestroy.Checked Then
        begin
          qry_IndexDefs['fCalcDestructOnEntryDate'] := 0;
          qry_IndexDefs['fCalcDestructOnField'] := Null;
        end;
    end;
end;

procedure Tfrm_IndexDefinitions.chk_iNotDestroyClick(Sender: TObject);
begin
  If chk_iNotDestroy.Checked Then
    begin
      chk_iCalcDateInsert.Enabled := False;
      cb_iCalcCapField.Enabled := False;
    end
  else
    begin
      chk_iCalcDateInsert.Enabled := True;
      cb_iCalcCapField.Enabled := True;
    end;
//-------
  If qry_IndexDefs.State in dsEditModes Then
    begin
      If chk_iNotDestroy.Checked Then
        begin
          qry_IndexDefs['iCalcDestructOnEntryDate'] := 0;
          qry_IndexDefs['iCalcDestructOnField'] := Null;
        end;
    end;
end;

procedure Tfrm_IndexDefinitions.chk_eNotDestroyClick(Sender: TObject);
begin
  If chk_eNotDestroy.Checked Then
    begin
      chk_eCalcDateInsert.Enabled := False;
      cb_eCalcCapField.Enabled := False;
    end
  else
    begin
      chk_eCalcDateInsert.Enabled := True;
      cb_eCalcCapField.Enabled := True;
    end;
//-------
  If qry_IndexDefs.State in dsEditModes Then
    begin
      If chk_eNotDestroy.Checked Then
        begin
          qry_IndexDefs['eCalcDestructOnEntryDate'] := 0;
          qry_IndexDefs['eCalcDestructOnField'] := Null;
        end;
    end;
end;

procedure Tfrm_IndexDefinitions.chk_eRecordsClick(Sender: TObject);
begin
  lbl_eRecStoreType.Visible := chk_eRecords.Checked and chk_eRecords.Enabled;
  cb_eRecStoreType.Visible := chk_eRecords.Checked and chk_eRecords.Enabled;
  lbl_eRecStoreWhere.Visible := (cb_eRecStoreType.Text <> 'SQL-Server')and(chk_eRecords.Checked  and chk_eRecords.Enabled);
  edt_eRecStoreWhere.Visible := (cb_eRecStoreType.Text <> 'SQL-Server')and(chk_eRecords.Checked and chk_eRecords.Enabled);
  btn_GeteRecFileRepositry.Visible := (cb_eRecStoreType.Text <> 'SQL-Server')and(chk_eRecords.Checked and chk_eRecords.Enabled);
end;

procedure Tfrm_IndexDefinitions.chk_FilesClick(Sender: TObject);
Var
   J   :Integer;
begin
  If chk_Files.checked Then
    begin
      For J := 1 to 15 Do
        TDBCheckBox(FindComponent('chk_Auto'+InttoStr(J))).Enabled := True
    end
  else
    begin
      For J := 1 to 15 Do
        begin
          TDBCheckBox(FindComponent('chk_Auto'+InttoStr(J))).Enabled := False;
          If qry_IndexDefs.State in dsEditModes Then
            begin
              If TDBCheckBox(FindComponent('chk_Auto'+InttoStr(J))).Checked Then
                TDBCheckBox(FindComponent('chk_Auto'+InttoStr(J))).Checked := False;
            end;
        end;
    end;
end;

procedure Tfrm_IndexDefinitions.btn_ZoomInClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
  If ImageViewer.Zoom <= 10 Then
    ImageViewer.Zoom := ImageViewer.Zoom+1
  else If ImageViewer.Zoom <= 20 Then
    ImageViewer.Zoom := ImageViewer.Zoom+2
  else If ImageViewer.Zoom <= 50 Then
    ImageViewer.Zoom := ImageViewer.Zoom+5
  else if ImageViewer.Zoom <= 100 Then
    ImageViewer.Zoom := ImageViewer.Zoom+10
  else ImageViewer.Zoom := ImageViewer.Zoom+20;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefinitions.btn_ZoomOutClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
   If ImageViewer.Zoom <= 10 Then
     ImageViewer.Zoom := ImageViewer.Zoom-1
   else If ImageViewer.Zoom <= 20 Then
     ImageViewer.Zoom := ImageViewer.Zoom-2
   else If ImageViewer.Zoom <= 50 Then
     ImageViewer.Zoom := ImageViewer.Zoom-5
   else if ImageViewer.Zoom <= 100 Then
     ImageViewer.Zoom := ImageViewer.Zoom-10
   else ImageViewer.Zoom := ImageViewer.Zoom-20;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefinitions.Button5Click(Sender: TObject);
Var
  RecordType  :String;
begin
  RecordType := qry_IndexDefs.FieldByName('Description').AsString;
  If frm_AddCOOLField.Execute(RecordType) = mrOK Then
    begin
      ImageViewer.Cursor := crCross;
    end;
end;

procedure Tfrm_IndexDefinitions.Button6Click(Sender: TObject);
begin
  If ImageViewer.LayersCurrent > 0 Then
    begin
      If Messagedlg('Are you sure you want to remove this COOL field?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
        exit;

      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('DELETE FROM IndexDefinitions_COOL_Pos WHERE ID = :ID');
      qry_SQL.Parameters.ParamByName('ID').Value := PCOOLPosRec(ImageViewer.Layers[ImageViewer.LayersCurrent].UserData)^.ID;
      qry_SQL.ExecSQL;
      DrawCOOLBackground(qry_IndexDefs.FieldbyName('Description').asString);
      DrawCOOLFields(qry_IndexDefs.FieldbyName('Description').asString);
    end;
end;

procedure Tfrm_IndexDefinitions.btn_FittoActualClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    ImageViewer.Zoom := 100;
    btn_FittoWidth.Down := false;
    btn_FittoHeight.Down := false;
    btn_FittoActual.Down := true;
    btn_FittoBest.Down := false;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefinitions.btn_FittoBestClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    ImageViewer.Fit;
    btn_FittoWidth.Down := false;
    btn_FittoHeight.Down := false;
    btn_FittoActual.Down := false;
    btn_FittoBest.Down := true;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefinitions.btn_FittoHeightClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    ImageViewer.FitToHeight;
    btn_FittoWidth.Down := false;
    btn_FittoHeight.Down := true;
    btn_FittoActual.Down := false;
    btn_FittoBest.Down := false;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefinitions.btn_FittoWidthClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    ImageViewer.FitToWidth;
    btn_FittoWidth.Down := true;
    btn_FittoHeight.Down := false;
    btn_FittoActual.Down := false;
    btn_FittoBest.Down := false;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefinitions.sgrd_DeptsClick(Sender: TObject);
var
  pt: TPoint;
  grid: TStringgrid;
  aCol, aRow: Integer;
begin
  GetCursorPos( pt );
  grid := Sender As TStringgrid;
  pt:= grid.ScreenToClient( pt );
  grid.MouseToCell( pt.x, pt.y, aCol, aRow );
  If (aCol in [4]) and (aRow >= grid.fixedRows) Then
    begin
      // click landed in a checkbox cell
      ToggleCheckboxDepts( aCol, aRow );
    end;
end;

procedure Tfrm_IndexDefinitions.sgrd_DeptsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  grid: TStringgrid;
begin
  If (gdFixed In State) Then
    exit;

  grid := Sender As TStringgrid;
  With grid.Canvas Do
    begin
      If aCol = 4 Then
        begin
          If DeptsChk.Strings[ARow-1] = '1' Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FCheck)
          else if DeptsChk.Strings[ARow-1] = '0' Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FNoCheck)
        end;
    end;
end;

procedure Tfrm_IndexDefinitions.sgrd_RolesClick(Sender: TObject);
var
  pt: TPoint;
  grid: TStringgrid;
  aCol, aRow: Integer;
begin
  GetCursorPos( pt );
  grid := Sender As TStringgrid;
  pt:= grid.ScreenToClient( pt );
  grid.MouseToCell( pt.x, pt.y, aCol, aRow );
  If (aCol in [6,7,8,9]) and (aRow >= grid.fixedRows) Then
    begin
      // click landed in a checkbox cell
      ToggleCheckboxRoles( aCol, aRow );
    end;
end;

procedure Tfrm_IndexDefinitions.ToggleCheckboxDepts( acol, arow: Integer );
begin
  if sgrd_Depts.Cells[0, aRow] = '' Then
    exit;
  With TGridCracker( sgrd_Depts ) Do
    begin
      If aCol = 4 Then
        begin

          If DeptsChk.Count < ARow Then
            exit;
          If DeptsChk.Strings[ARow-1] = '1' Then
            DeptsChk.Strings[ARow-1] := '0'
          else If DeptsChk.Strings[ARow-1] = '0' Then
            DeptsChk.Strings[ARow-1] := '1';
          InvalidateCell( aCol, aRow );
        end;
    end;
end;

procedure Tfrm_IndexDefinitions.ToggleCheckboxRoles( acol, arow: Integer );
begin
  if sgrd_Roles.Cells[0, aRow] = '' Then
    exit;
  With TGridCracker( sgrd_Roles ) Do
    Begin
      If aCol = 6 Then
        begin

          If RolesCChk.Count < ARow Then
            exit;
          If RolesCChk.Strings[ARow-1] = '1' Then
            RolesCChk.Strings[ARow-1] := '0'
          else If RolesCChk.Strings[ARow-1] = '0' Then
            RolesCChk.Strings[ARow-1] := '1';
          InvalidateCell( aCol, aRow );
        end;
      If aCol = 7 Then
        begin

          If RolesFChk.Count < ARow Then
            exit;
          If RolesFChk.Strings[ARow-1] = '1' Then
            RolesFChk.Strings[ARow-1] := '0'
          else If RolesFChk.Strings[ARow-1] = '0' Then
            RolesFChk.Strings[ARow-1] := '1';
          InvalidateCell( aCol, aRow );
        end;
      If aCol = 8 Then
        begin

          If RolesIChk.Count < ARow Then
            exit;
          If RolesIChk.Strings[ARow-1] = '1' Then
            RolesIChk.Strings[ARow-1] := '0'
          else If RolesIChk.Strings[ARow-1] = '0' Then
            RolesIChk.Strings[ARow-1] := '1';
          InvalidateCell( aCol, aRow );
        end;
      If aCol = 9 Then
        begin

          If RolesEChk.Count < ARow Then
            exit;
          If RolesEChk.Strings[ARow-1] = '1' Then
            RolesEChk.Strings[ARow-1] := '0'
          else If RolesEChk.Strings[ARow-1] = '0' Then
            RolesEChk.Strings[ARow-1] := '1';
          InvalidateCell( aCol, aRow );
        end;
    end;
end;

procedure Tfrm_IndexDefinitions.ToggleCheckboxUsers( acol, arow: Integer );
begin
  if sgrd_Users.Cells[0, aRow] = '' Then
    exit;
  With TGridCracker( sgrd_Users ) Do
    Begin
      If aCol = 6 Then
        begin

          If UsersCChk.Count < ARow Then
            exit;
          If UsersCChk.Strings[ARow-1] = '1' Then
            UsersCChk.Strings[ARow-1] := '0'
          else If UsersCChk.Strings[ARow-1] = '0' Then
            UsersCChk.Strings[ARow-1] := '1';
          InvalidateCell( aCol, aRow );
        end;
      If aCol = 7 Then
        begin

          If UsersFChk.Count < ARow Then
            exit;
          If UsersFChk.Strings[ARow-1] = '1' Then
            UsersFChk.Strings[ARow-1] := '0'
          else If UsersFChk.Strings[ARow-1] = '0' Then
            UsersFChk.Strings[ARow-1] := '1';
          InvalidateCell( aCol, aRow );
        end;
      If aCol = 8 Then
        begin

          If UsersIChk.Count < ARow Then
            exit;
          If UsersIChk.Strings[ARow-1] = '1' Then
            UsersIChk.Strings[ARow-1] := '0'
          else If UsersIChk.Strings[ARow-1] = '0' Then
            UsersIChk.Strings[ARow-1] := '1';
          InvalidateCell( aCol, aRow );
        end;
      If aCol = 9 Then
        begin

          If UsersEChk.Count < ARow Then
            exit;
          If UsersEChk.Strings[ARow-1] = '1' Then
            UsersEChk.Strings[ARow-1] := '0'
          else If UsersEChk.Strings[ARow-1] = '0' Then
            UsersEChk.Strings[ARow-1] := '1';
          InvalidateCell( aCol, aRow );
        end;
    end;
end;

procedure Tfrm_IndexDefinitions.sgrd_RolesDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  grid: TStringgrid;
begin
  If (gdFixed In State) Then
    exit;

  grid := Sender As TStringgrid;
  With grid.Canvas Do
    begin
      If aCol = 6 Then
        begin
          If (RolesCChk.Count >= ARow)and(RolesCChk.Strings[ARow-1] = '1') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FCheck)
          else If (RolesCChk.Count >= ARow)and(RolesCChk.Strings[ARow-1] = '0') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FNoCheck)
        end;
      If aCol = 7 Then
        begin
          If (RolesFChk.Count >= ARow)and(RolesFChk.Strings[ARow-1] = '1') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FCheck)
          else If (RolesFChk.Count >= ARow)and(RolesFChk.Strings[ARow-1] = '0') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FNoCheck)
        end;
      If aCol = 8 Then
        begin
          If (RolesIChk.Count >= ARow)and(RolesIChk.Strings[ARow-1] = '1') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FCheck)
          else If (RolesIChk.Count >= ARow)and(RolesIChk.Strings[ARow-1] = '0') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FNoCheck)
        end;
      If aCol = 9 Then
        begin
          If (RolesEChk.Count >= ARow)and(RolesEChk.Strings[ARow-1] = '1') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FCheck)
          else If (RolesEChk.Count >= ARow)and(RolesEChk.Strings[ARow-1] = '0') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FNoCheck)
        end;
    end;
end;

procedure Tfrm_IndexDefinitions.sgrd_UsersClick(Sender: TObject);
var
  pt: TPoint;
  grid: TStringgrid;
  aCol, aRow: Integer;
begin
  GetCursorPos( pt );
  grid := Sender As TStringgrid;
  pt:= grid.ScreenToClient( pt );
  grid.MouseToCell( pt.x, pt.y, aCol, aRow );
  If (aCol in [6,7,8,9]) and (aRow >= grid.fixedRows) Then
    begin
      // click landed in a checkbox cell
      ToggleCheckboxUsers( aCol, aRow );
    end;end;


procedure Tfrm_IndexDefinitions.sgrd_UsersDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  grid: TStringgrid;
begin
  If (gdFixed In State) Then
    exit;

  grid := Sender As TStringgrid;
  With grid.Canvas Do
    begin
      If aCol = 6 Then
        begin
          If (UsersCChk.Count >= ARow)and(UsersCChk.Strings[ARow-1] = '1') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FCheck)
          else If (UsersCChk.Count >= ARow)and(UsersCChk.Strings[ARow-1] = '0') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FNoCheck)
        end;
      If aCol = 7 Then
        begin
          If (UsersFChk.Count >= ARow)and(UsersFChk.Strings[ARow-1] = '1') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FCheck)
          else If (UsersFChk.Count >= ARow)and(UsersFChk.Strings[ARow-1] = '0') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FNoCheck)
        end;
      If aCol = 8 Then
        begin
          If (UsersIChk.Count >= ARow)and(UsersIChk.Strings[ARow-1] = '1') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FCheck)
          else If (UsersIChk.Count >= ARow)and(UsersIChk.Strings[ARow-1] = '0') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FNoCheck)
        end;
      If aCol = 9 Then
        begin
          If (UsersEChk.Count >= ARow)and(UsersEChk.Strings[ARow-1] = '1') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FCheck)
          else If (UsersEChk.Count >= ARow)and(UsersEChk.Strings[ARow-1] = '0') Then
              Draw((rect.right + rect.left - FNoCheck.width) div 2,
                   (rect.bottom + rect.top - FNoCheck.height) div 2,
                   FNoCheck)
        end;
    end;
end;

procedure Tfrm_IndexDefinitions.SpeedButton2Click(Sender: TObject);
Var
  RecordType  :String;
  FieldName   :String;
  sFieldSize  :String;
  FieldSize   :Integer;
begin
  RecordType := qry_IndexDefs.FieldByName('Description').AsString;
  FieldName := qry_CoolDefs.FieldByName('FieldName').AsString;

  If RecordType = '' Then
    exit;

  If FieldName = '' Then
    exit;

  If Messagedlg('Are you sure you want to Delete the COOL field ' + FieldName + ' for Record Type ' + RecordType + '?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;

  try
    Screen.Cursor := crHourglass;
    DeleteCoolField(FieldName);
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('DELETE FROM IndexDefinitions_COOL WHERE Description = :DS AND FieldName = :FN');
    qry_SQL.Parameters.ParamValues['DS'] := RecordType;
    qry_SQL.Parameters.ParamValues['FN'] := FieldName;
    qry_SQL.ExecSQL;
    If qry_SQL.RowsAffected = 1 Then
      begin
        qry_CoolDefs.Close;
        qry_CoolDefs.Open;
        Messagedlg('Field ' + FieldName + ' deleted successfully.', mtInformation, [mbOK], 0);
      end;
  finally
    Screen.Cursor := crDefault;
    qry_SQL.Close;
  end;
end;

procedure Tfrm_IndexDefinitions.btn_GeteRecFileRepositryClick(Sender: TObject);
var
  s        :String;
begin
  if SelectDirectory('Select location of Repositry.',s,'',s) then
    begin
      qry_IndexDefs.Edit;
      qry_IndexDefs['eRecFileStoreLoc'] := s;
    end;
end;

procedure Tfrm_IndexDefinitions.btn_GrantRoleRightsClick(Sender: TObject);
var
  i : Integer;
  ContainersAccess, FilesAccess, ItemsAccess, eRecordsAccess   :Boolean;
begin
  Screen.Cursor := crHourglass;
//---------------Delete---------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('DELETE FROM IndexUAuthRts');
  qry_Access.SQL.Add('WHERE Description = :Description');
  qry_Access.SQL.Add('AND RoleId <> 0');
  qry_Access.Parameters.ParamValues['Description'] := qry_IndexDefs.FieldbyName('Description').asString;
  qry_Access.ExecSQL;
//---------------Add Roles---------------------
  if (sgrd_Roles.Cells[0,1] > '')and(sgrd_Roles.RowCount > 1)then
    begin
      for I := 1 to sgrd_Roles.RowCount-1 do
        begin
          ContainersAccess := False;
          FilesAccess := False;
          ItemsAccess := False;
          eRecordsAccess := False;
          If RolesCChk.Strings[I-1] = '1' Then ContainersAccess := True;
          If RolesFChk.Strings[I-1] = '1' Then FilesAccess := True;
          If RolesIChk.Strings[I-1] = '1' Then ItemsAccess := True;
          If RolesEChk.Strings[I-1] = '1' Then eRecordsAccess := True;

          If ContainersAccess OR FilesAccess OR ItemsAccess OR eRecordsAccess Then
            begin
              qry_Access.Close;
              qry_Access.SQL.Clear;
              qry_Access.SQL.Add('INSERT INTO IndexUAuthRts (Description, Branch, Department, RoleID, Containers, Files, Items, eRecords) VALUES(:Description, :Branch, :Department, :RoleID, :Containers, :Files, :Items, :eRecords)');
              qry_Access.Parameters.ParamValues['Description'] := qry_IndexDefs.FieldbyName('Description').asString;
              qry_Access.Parameters.ParamByName('Branch').Value := sgrd_Roles.Cells[2,I];
              qry_Access.Parameters.ParamByName('Department').Value := sgrd_Roles.Cells[4,I];
              qry_Access.Parameters.ParamByName('RoleId').Value := StrtoInt(sgrd_Roles.Cells[0,I]);
              qry_Access.Parameters.ParamByName('Containers').Value := ContainersAccess;
              qry_Access.Parameters.ParamByName('Files').Value := FilesAccess;
              qry_Access.Parameters.ParamByName('Items').Value := ItemsAccess;
              qry_Access.Parameters.ParamByName('eRecords').Value := eRecordsAccess;
              qry_Access.ExecSQL;
            end;
        end;
    end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_IndexDefinitions.btn_GrantUserRightsClick(Sender: TObject);
var
  i : Integer;
  ContainersAccess, FilesAccess, ItemsAccess, eRecordsAccess   :Boolean;
begin
  Screen.Cursor := crHourglass;
//---------------Delete---------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('DELETE FROM IndexUAuthRts');
  qry_Access.SQL.Add('WHERE Description = :Description');
  qry_Access.SQL.Add('AND UserId <> ''Role#''');
  qry_Access.Parameters.ParamValues['Description'] := qry_IndexDefs.FieldbyName('Description').asString;
  qry_Access.ExecSQL;
//---------------Add Users---------------------
  if (sgrd_Users.Cells[0,1] > '')and(sgrd_Users.RowCount > 1)then
    begin
      for I := 1 to sgrd_Users.RowCount-1 do
        begin
          ContainersAccess := False;
          FilesAccess := False;
          ItemsAccess := False;
          eRecordsAccess := False;
          If UsersCChk.Strings[I-1] = '1' Then ContainersAccess := True;
          If UsersFChk.Strings[I-1] = '1' Then FilesAccess := True;
          If UsersIChk.Strings[I-1] = '1' Then ItemsAccess := True;
          If UsersEChk.Strings[I-1] = '1' Then eRecordsAccess := True;

          If ContainersAccess OR FilesAccess OR ItemsAccess OR eRecordsAccess Then
            begin
              qry_Access.Close;
              qry_Access.SQL.Clear;
              qry_Access.SQL.Add('INSERT INTO IndexUAuthRts (Description, Branch, Department, UserID, Containers, Files, Items, eRecords) VALUES(:Description, :Branch, :Department, :UserID, :Containers, :Files, :Items, :eRecords)');
              qry_Access.Parameters.ParamValues['Description'] := qry_IndexDefs.FieldbyName('Description').asString;
              qry_Access.Parameters.ParamByName('Branch').Value := sgrd_Users.Cells[2,I];
              qry_Access.Parameters.ParamByName('Department').Value := sgrd_Users.Cells[4,I];
              qry_Access.Parameters.ParamByName('UserID').Value := sgrd_Users.Cells[0,I];
              qry_Access.Parameters.ParamByName('Containers').Value := ContainersAccess;
              qry_Access.Parameters.ParamByName('Files').Value := FilesAccess;
              qry_Access.Parameters.ParamByName('Items').Value := ItemsAccess;
              qry_Access.Parameters.ParamByName('eRecords').Value := eRecordsAccess;
              qry_Access.ExecSQL;
            end;
        end;
    end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_IndexDefinitions.btn_ImportLookup1Click(Sender: TObject);
Var
  spbutton          :TSpeedbutton;
  SeqNo             :Integer;
  SType             :String;
  T                 :TextFile;
  Line              :String;
  LabelInd          :TLabel;
  i                 :Integer;
begin
  spbutton := Sender as TSpeedbutton;
  SeqNo := StrtoInt(trim(copy(spButton.Name, 17, 2)));
  If SeqNo IN [1,2,3,4,5,6,7,8,9,10] Then sType := 'TEXT'
  else if SeqNo IN [11,12,13] Then sType := 'DATE'
  else if SeqNo IN [14,15] Then sType := 'NUM';

  If not odlg_Import.Execute() Then
    exit;

  LabelInd := TLabel(FindComponent('lbl_LookupCnt'+InttoStr(SeqNo)));
  Screen.Cursor := crHourglass;
  AssignFile(T, odlg_Import.FileName);
  try
    Reset(T);
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('INSERT INTO IndexDefsLookups (Description, ColumnHeading, [Item])');
    qry_SQL.SQL.Add('VALUES (:DS, :CH, :IT)');
    qry_SQL.Parameters.ParamByName('DS').Value := qry_IndexDefs.FieldbyName('Description').AsString;
    qry_SQL.Parameters.ParamByName('CH').Value := TDBEdit(FindComponent('edt_'+InttoStr(SeqNo))).Text;

    i := StrtoInt(LabelInd.Caption);
    While not EOF(T) Do
      begin
        Readln(T, Line);
        qry_SQL.Parameters.ParamByName('IT').Value := copy(trim(Line), 1, 50);
        qry_SQL.ExecSQL;
        Inc(i);
        LabelInd.Caption := InttoStr(i);

        Application.ProcessMessages;
      end;
  finally
    CloseFile(T);
    Screen.Cursor := crDefault;
    qry_IndexDefsAfterScroll(qry_IndexDefs);
  end;
end;

procedure Tfrm_IndexDefinitions.SelectAll1Click(Sender: TObject);
Var
   J      :Integer;
begin
  For J := 0 to DeptsChk.Count-1 do
    begin
      DeptsChk.Strings[J] := '1';
    end;

  For J := 1 to sgrd_Depts.RowCount - 1 do
    begin
      TGridCracker(sgrd_Depts).InvalidateCell(sgrd_Depts.ColCount-1 , J);
    end;
end;

procedure Tfrm_IndexDefinitions.SetDateReq(FieldHead:String);
begin
  If qry_IndexDefs.IsEmpty Then
    exit;

  If UpperCase(qry_IndexDefs.FieldbyName('Col11').AsString) = UpperCase(FieldHead) Then
    begin
      If not (qry_IndexDefs.state in dsEditModes) Then
        qry_IndexDefs.edit;
      qry_IndexDefs.FieldbyName('Col11Req').asInteger := 1;
    end;
  If UpperCase(qry_IndexDefs.FieldbyName('Col12').AsString) = UpperCase(FieldHead) Then
    begin
      If not (qry_IndexDefs.state in dsEditModes) Then
        qry_IndexDefs.edit;
      qry_IndexDefs.FieldbyName('Col12Req').asInteger := 1;
    end;
  If UpperCase(qry_IndexDefs.FieldbyName('Col13').AsString) = UpperCase(FieldHead) Then
    begin
      If not (qry_IndexDefs.state in dsEditModes) Then
        qry_IndexDefs.edit;
      qry_IndexDefs.FieldbyName('Col13Req').asInteger := 1;
    end;
end;

procedure Tfrm_IndexDefinitions.DisplayDeptAccess;
Var
  R  :Integer;
  MaxLen  :Array[0..9]  of Integer;
begin
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('SELECT');
  qry_Access.SQL.Add('	b.Branch,');
  qry_Access.SQL.Add('	b.Name AS "BranchName",');
  qry_Access.SQL.Add('	d.Department AS "Dept",');
  qry_Access.SQL.Add('	d.Name AS "DeptName",');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN EXISTS(SELECT * FROM IndexAuthRts x WHERE x.Branch = d.Branch AND x.Department = d.Department AND x.Description = :Description) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS Access');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   branches b');
  qry_Access.SQL.Add('   INNER JOIN Departments d ON b.Branch = d.Branch');
  qry_Access.SQL.Add('WHERE');
  qry_Access.SQL.Add('   b.Status = 0 AND');
  qry_Access.SQL.Add('   d.Status = 0 ');
  qry_Access.SQL.Add('ORDER BY');
  qry_Access.SQL.Add('  b.Branch,');
  qry_Access.SQL.Add('  d.Department');
  qry_Access.Parameters.ParamValues['Description'] := qry_IndexDefs.FieldByName('Description').AsString;
  qry_Access.Open;

  sgrd_Depts.RowCount := 2;
  sgrd_Depts.Cells[0,0] := 'Branch';
  sgrd_Depts.Cells[1,0] := 'Branch Name';
  sgrd_Depts.Cells[2,0] := 'Dept';
  sgrd_Depts.Cells[3,0] := 'Dept Name';
  sgrd_Depts.Cells[4,0] := 'Access';

  sgrd_Depts.Cells[0,1] := '';
  sgrd_Depts.Cells[1,1] := '';
  sgrd_Depts.Cells[2,1] := '';
  sgrd_Depts.Cells[3,1] := '';
  sgrd_Depts.Cells[4,1] := '';

  MaxLen[0] := Canvas.TextWidth('Branch')+10;
  MaxLen[1] := Canvas.TextWidth('Branch Name')+10;
  MaxLen[2] := Canvas.TextWidth('Dept')+10;
  MaxLen[3] := Canvas.TextWidth('Dept Name')+10;

  DeptsChk.Clear;

  R := 0;
  qry_Access.First;
  While not qry_Access.EOF Do
    begin
      Inc(R);
      sgrd_Depts.RowCount := R+1;
      sgrd_Depts.Cells[0,R] := qry_Access.FieldByName('Branch').AsString;
      sgrd_Depts.Cells[1,R] := qry_Access.FieldByName('BranchName').AsString;
      sgrd_Depts.Cells[2,R] := qry_Access.FieldByName('Dept').AsString;
      sgrd_Depts.Cells[3,R] := qry_Access.FieldByName('DeptName').AsString;

      If qry_Access.FieldByName('Access').AsInteger = 1 Then
        DeptsChk.Append('1')
      else DeptsChk.Append('0');

      If Canvas.TextWidth(sgrd_Depts.Cells[0,R])+10 > MaxLen[0] Then
        MaxLen[0] := Canvas.TextWidth(sgrd_Depts.Cells[0,R])+10;
      If Canvas.TextWidth(sgrd_Depts.Cells[1,R])+10 > MaxLen[1] Then
        MaxLen[1] := Canvas.TextWidth(sgrd_Depts.Cells[1,R])+10;
      If Canvas.TextWidth(sgrd_Depts.Cells[2,R])+10 > MaxLen[2] Then
        MaxLen[2] := Canvas.TextWidth(sgrd_Depts.Cells[2,R])+10;
      If Canvas.TextWidth(sgrd_Depts.Cells[3,R])+10 > MaxLen[3] Then
        MaxLen[3] := Canvas.TextWidth(sgrd_Depts.Cells[3,R])+10;

      qry_Access.Next;
    end;
  qry_Access.Close;

  sgrd_Depts.ColWidths[0] := MaxLen[0];
  sgrd_Depts.ColWidths[1] := MaxLen[1];
  sgrd_Depts.ColWidths[2] := MaxLen[2];
  sgrd_Depts.ColWidths[3] := MaxLen[3];
  sgrd_Depts.ColWidths[4] := Canvas.TextWidth('Access')+10;
end;

procedure Tfrm_IndexDefinitions.DisplayRoleAccess;
Var
  R  :Integer;
  MaxLen  :Array[0..9]  of Integer;
begin
//-------------------Build Roles-----------------------------------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('SELECT');
  qry_Access.SQL.Add('   i.Branch,');
  qry_Access.SQL.Add('   b.Name AS "BranchName",');
  qry_Access.SQL.Add('   i.Department AS Dept,');
  qry_Access.SQL.Add('   d.Name AS "DeptName",');
  qry_Access.SQL.Add('   a.RoleId,');
  qry_Access.SQL.Add('   a.Role,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseContainers = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseContainers = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.RoleId = a.RoleId AND x.Containers = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS ContainersAccess,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseFiles = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseFiles = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.RoleId = a.RoleId AND x.Files = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS FilesAccess,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseItems = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseItems = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.RoleId = a.RoleId AND x.Items = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS ItemsAccess,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseERecords = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseERecords = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.RoleId = a.RoleId AND x.eRecords = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS eRecordsAccess,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseCool = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseCool = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.RoleId = a.RoleId AND x.COOL = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS COOLAccess');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   Roles a, IndexAuthRts i');
  qry_Access.SQL.Add('   INNER JOIN IndexDefinitions id ON i.Description = id.Description');
  qry_Access.SQL.Add('   INNER JOIN branches b ON i.Branch = b.Branch');
  qry_Access.SQL.Add('   INNER JOIN Departments d ON i.Branch = d.Branch AND i.Department = d.Department');
  qry_Access.SQL.Add('WHERE');
  qry_Access.SQL.Add('	i.Description = :Description');
  qry_Access.SQL.Add('ORDER BY');
  qry_Access.SQL.Add('   a.RoleId,');
  qry_Access.SQL.Add('   i.Branch,');
  qry_Access.SQL.Add('   i.Department');
  qry_Access.Parameters.ParamValues['Description'] := qry_IndexDefs.FieldByName('Description').AsString;
  qry_Access.Open;

  sgrd_Roles.RowCount := 2;
  sgrd_Roles.Cells[0,0] := 'RoleId';
  sgrd_Roles.Cells[1,0] := 'Role';
  sgrd_Roles.Cells[2,0] := 'Branch';
  sgrd_Roles.Cells[3,0] := 'Branch Name';
  sgrd_Roles.Cells[4,0] := 'Dept';
  sgrd_Roles.Cells[5,0] := 'Dept Name';
  sgrd_Roles.Cells[6,0] := 'Containers';
  sgrd_Roles.Cells[7,0] := 'Files';
  sgrd_Roles.Cells[8,0] := 'Items';
  sgrd_Roles.Cells[9,0] := 'eRecords';

  MaxLen[0] := Canvas.TextWidth('RoleId')+10;
  MaxLen[1] := Canvas.TextWidth('Role')+10;
  MaxLen[2] := Canvas.TextWidth('Branch')+10;
  MaxLen[3] := Canvas.TextWidth('Branch Name')+10;
  MaxLen[4] := Canvas.TextWidth('Dept')+10;
  MaxLen[5] := Canvas.TextWidth('Dept Name')+10;

  sgrd_Roles.Cells[0,1] := '';
  sgrd_Roles.Cells[1,1] := '';
  sgrd_Roles.Cells[2,1] := '';
  sgrd_Roles.Cells[3,1] := '';
  sgrd_Roles.Cells[4,1] := '';
  sgrd_Roles.Cells[5,1] := '';
  sgrd_Roles.Cells[6,1] := '';
  sgrd_Roles.Cells[7,1] := '';
  sgrd_Roles.Cells[8,1] := '';
  sgrd_Roles.Cells[9,1] := '';

  RolesCChk.Clear;
  RolesFChk.Clear;
  RolesIChk.Clear;
  RolesEChk.Clear;

  R := 0;
  qry_Access.First;
  While not qry_Access.EOF Do
    begin
      Inc(R);
      sgrd_Roles.RowCount := R+1;
      sgrd_Roles.Cells[0,R] := qry_Access.FieldByName('RoleId').AsString;
      sgrd_Roles.Cells[1,R] := qry_Access.FieldByName('Role').AsString;
      sgrd_Roles.Cells[2,R] := qry_Access.FieldByName('Branch').AsString;
      sgrd_Roles.Cells[3,R] := qry_Access.FieldByName('BranchName').AsString;
      sgrd_Roles.Cells[4,R] := qry_Access.FieldByName('Dept').AsString;
      sgrd_Roles.Cells[5,R] := qry_Access.FieldByName('DeptName').AsString;

      RolesCChk.Append(qry_Access.FieldByName('ContainersAccess').AsString);
      RolesFChk.Append(qry_Access.FieldByName('FilesAccess').AsString);
      RolesIChk.Append(qry_Access.FieldByName('ItemsAccess').AsString);
      RolesEChk.Append(qry_Access.FieldByName('eRecordsAccess').AsString);

      If Canvas.TextWidth(sgrd_Roles.Cells[0,R])+10 > MaxLen[0] Then
        MaxLen[0] := Canvas.TextWidth(sgrd_Roles.Cells[0,R])+10;
      If Canvas.TextWidth(sgrd_Roles.Cells[1,R])+10 > MaxLen[1] Then
        MaxLen[1] := Canvas.TextWidth(sgrd_Roles.Cells[1,R])+10;
      If Canvas.TextWidth(sgrd_Roles.Cells[2,R])+10 > MaxLen[2] Then
        MaxLen[2] := Canvas.TextWidth(sgrd_Roles.Cells[2,R])+10;
      If Canvas.TextWidth(sgrd_Roles.Cells[3,R])+10 > MaxLen[3] Then
        MaxLen[3] := Canvas.TextWidth(sgrd_Roles.Cells[3,R])+10;
      If Canvas.TextWidth(sgrd_Roles.Cells[4,R])+10 > MaxLen[4] Then
        MaxLen[4] := Canvas.TextWidth(sgrd_Roles.Cells[4,R])+10;
      If Canvas.TextWidth(sgrd_Roles.Cells[5,R])+10 > MaxLen[5] Then
        MaxLen[5] := Canvas.TextWidth(sgrd_Roles.Cells[5,R])+10;

      qry_Access.Next;
    end;
  qry_Access.Close;

  sgrd_Roles.ColWidths[0] := MaxLen[0];
  sgrd_Roles.ColWidths[1] := MaxLen[1];
  sgrd_Roles.ColWidths[2] := MaxLen[2];
  sgrd_Roles.ColWidths[3] := MaxLen[3];
  sgrd_Roles.ColWidths[4] := MaxLen[4];
  sgrd_Roles.ColWidths[5] := MaxLen[5];
  sgrd_Roles.ColWidths[6] := Canvas.TextWidth('Containers')+10;
  sgrd_Roles.ColWidths[7] := Canvas.TextWidth('Files')+10;
  sgrd_Roles.ColWidths[8] := Canvas.TextWidth('Items')+10;
  sgrd_Roles.ColWidths[9] := Canvas.TextWidth('eRecords')+10;
end;

procedure Tfrm_IndexDefinitions.DisplayUserAccess;
Var
  R  :Integer;
  MaxLen  :Array[0..9]  of Integer;
begin
//-------------------Build Users-----------------------------------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('SELECT');
  qry_Access.SQL.Add('   i.Description,');
  qry_Access.SQL.Add('   i.Branch,');
  qry_Access.SQL.Add('   b.Name AS "BranchName",');
  qry_Access.SQL.Add('   i.Department AS Dept,');
  qry_Access.SQL.Add('   d.Name AS "DeptName",');
  qry_Access.SQL.Add('   a.UserId,');
  qry_Access.SQL.Add('   RTRIM(ISNULL(a.Name, '''')) + '' '' + RTRIM(ISNULL(a.Surname, '''')) AS Name,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseContainers = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseContainers = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.UserID = a.UserID AND x.Containers = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS ContainersAccess,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseFiles = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseFiles = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.UserID = a.UserID AND x.Files = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS FilesAccess,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseItems = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseItems = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.UserID = a.UserID AND x.Items = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS ItemsAccess,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseERecords = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseERecords = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.UserID = a.UserID AND x.eRecords = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS eRecordsAccess,');
  qry_Access.SQL.Add('   CASE');
  qry_Access.SQL.Add('		WHEN id.UseCool = 0 THEN -1');
  qry_Access.SQL.Add('		WHEN id.UseCool = 1 AND EXISTS(SELECT * FROM IndexUAuthRts x WHERE x.Branch = i.Branch AND x.Department = i.Department AND X.Description = i.Description AND x.UserID = a.UserID AND x.COOL = 1) THEN 1');
  qry_Access.SQL.Add('		ELSE 0');
  qry_Access.SQL.Add('   END AS COOLAccess');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('   AuthCodes a, IndexAuthRts i');
  qry_Access.SQL.Add('   INNER JOIN IndexDefinitions id ON i.Description = id.Description');
  qry_Access.SQL.Add('   INNER JOIN branches b ON i.Branch = b.Branch');
  qry_Access.SQL.Add('   INNER JOIN Departments d ON i.Branch = d.Branch AND i.Department = d.Department');
  qry_Access.SQL.Add('WHERE');
  qry_Access.SQL.Add('	i.Description = :Description AND');
  qry_Access.SQL.Add('	a.UserId <> ''Role#''');
  qry_Access.SQL.Add('ORDER BY');
  qry_Access.SQL.Add('	a.UserId,');
  qry_Access.SQL.Add('	i.Branch,');
  qry_Access.SQL.Add('	i.Department');
  qry_Access.Parameters.ParamValues['Description'] := qry_IndexDefs.FieldByName('Description').AsString;
  qry_Access.Open;

  sgrd_Users.RowCount := 2;
  sgrd_Users.Cells[0,0] := 'UserId';
  sgrd_Users.Cells[1,0] := 'User Name';
  sgrd_Users.Cells[2,0] := 'Branch';
  sgrd_Users.Cells[3,0] := 'Branch Name';
  sgrd_Users.Cells[4,0] := 'Dept';
  sgrd_Users.Cells[5,0] := 'Dept Name';
  sgrd_Users.Cells[6,0] := 'Containers';
  sgrd_Users.Cells[7,0] := 'Files';
  sgrd_Users.Cells[8,0] := 'Items';
  sgrd_Users.Cells[9,0] := 'eRecords';

  MaxLen[0] := Canvas.TextWidth('UserId')+10;
  MaxLen[1] := Canvas.TextWidth('User Name')+10;
  MaxLen[2] := Canvas.TextWidth('Branch')+10;
  MaxLen[3] := Canvas.TextWidth('Branch Name')+10;
  MaxLen[4] := Canvas.TextWidth('Dept')+10;
  MaxLen[5] := Canvas.TextWidth('Dept Name')+10;

  sgrd_Users.Cells[0,1] := '';
  sgrd_Users.Cells[1,1] := '';
  sgrd_Users.Cells[2,1] := '';
  sgrd_Users.Cells[3,1] := '';
  sgrd_Users.Cells[4,1] := '';
  sgrd_Users.Cells[5,1] := '';
  sgrd_Users.Cells[6,1] := '';
  sgrd_Users.Cells[7,1] := '';
  sgrd_Users.Cells[8,1] := '';
  sgrd_Users.Cells[9,1] := '';

  UsersCChk.Clear;
  UsersFChk.Clear;
  UsersIChk.Clear;
  UsersEChk.Clear;

  R := 0;
  qry_Access.First;
  While not qry_Access.EOF Do
    begin
      Inc(R);
      sgrd_Users.RowCount := R+1;
      sgrd_Users.Cells[0,R] := qry_Access.FieldByName('UserId').AsString;
      sgrd_Users.Cells[1,R] := qry_Access.FieldByName('Name').AsString;
      sgrd_Users.Cells[2,R] := qry_Access.FieldByName('Branch').AsString;
      sgrd_Users.Cells[3,R] := qry_Access.FieldByName('BranchName').AsString;
      sgrd_Users.Cells[4,R] := qry_Access.FieldByName('Dept').AsString;
      sgrd_Users.Cells[5,R] := qry_Access.FieldByName('DeptName').AsString;

      UsersCChk.Append(qry_Access.FieldByName('ContainersAccess').AsString);
      UsersFChk.Append(qry_Access.FieldByName('FilesAccess').AsString);
      UsersIChk.Append(qry_Access.FieldByName('ItemsAccess').AsString);
      UsersEChk.Append(qry_Access.FieldByName('eRecordsAccess').AsString);

      If Canvas.TextWidth(sgrd_Users.Cells[0,R])+10 > MaxLen[0] Then
        MaxLen[0] := Canvas.TextWidth(sgrd_Users.Cells[0,R])+10;
      If Canvas.TextWidth(sgrd_Users.Cells[1,R])+10 > MaxLen[1] Then
        MaxLen[1] := Canvas.TextWidth(sgrd_Users.Cells[1,R])+10;
      If Canvas.TextWidth(sgrd_Users.Cells[2,R])+10 > MaxLen[2] Then
        MaxLen[2] := Canvas.TextWidth(sgrd_Users.Cells[2,R])+10;
      If Canvas.TextWidth(sgrd_Users.Cells[3,R])+10 > MaxLen[3] Then
        MaxLen[3] := Canvas.TextWidth(sgrd_Users.Cells[3,R])+10;
      If Canvas.TextWidth(sgrd_Users.Cells[4,R])+10 > MaxLen[4] Then
        MaxLen[4] := Canvas.TextWidth(sgrd_Users.Cells[4,R])+10;
      If Canvas.TextWidth(sgrd_Users.Cells[5,R])+10 > MaxLen[5] Then
        MaxLen[5] := Canvas.TextWidth(sgrd_Users.Cells[5,R])+10;

      qry_Access.Next;
    end;
  qry_Access.Close;

  sgrd_Users.ColWidths[0] := MaxLen[0];
  sgrd_Users.ColWidths[1] := MaxLen[1];
  sgrd_Users.ColWidths[2] := MaxLen[2];
  sgrd_Users.ColWidths[3] := MaxLen[3];
  sgrd_Users.ColWidths[4] := MaxLen[4];
  sgrd_Users.ColWidths[5] := MaxLen[5];
  sgrd_Users.ColWidths[6] := Canvas.TextWidth('Containers')+10;
  sgrd_Users.ColWidths[7] := Canvas.TextWidth('Files')+10;
  sgrd_Users.ColWidths[8] := Canvas.TextWidth('Items')+10;
  sgrd_Users.ColWidths[9] := Canvas.TextWidth('eRecords')+10;
end;

function Tfrm_IndexDefinitions.DrawCOOLBackground(RecordType  :String):Boolean;
Var
  MemoryStream   :TMemoryStream;
begin
  Screen.Cursor := crHourglass;
  MemoryStream   := TMemoryStream.Create;
  try
    ImageViewer.LayersClear;
    ImageViewer.Clear;
    qry_COOLBackground.Close;
    qry_COOLBackground.SQL.Clear;
    qry_COOLBackground.SQL.Add('SELECT COOLBackground FROM IndexDefinitions WHERE Description = :DS');
    qry_COOLBackground.Parameters.ParamByName('DS').Value := RecordType;
    qry_COOLBackground.Open;
    TBlobField(qry_COOLBackground.Fields[0]).SaveToStream(MemoryStream);
    If MemoryStream.Size > 0 Then
      begin
        MemoryStream.Position := 0;
        ImageViewer.IO.LoadFromStream(MemoryStream);
        RefreshLayerViewer;
      end;
  finally
    MemoryStream.Free;
    Screen.Cursor := crDefault;
  end;
end;

function Tfrm_IndexDefinitions.DrawCOOLFields(RecordType  :String):Boolean;
Var
  COOLDataPtr   :PCOOLPosRec;
begin
  Screen.Cursor := crHourglass;
  try
    qry_COOLLabels.Close;
    qry_COOLLabels.SQL.Clear;
    qry_COOLLabels.SQL.Add('SELECT * FROM IndexDefinitions_COOL_Pos WHERE Description = :DS ORDER BY ID');
    qry_COOLLabels.Parameters.ParamByName('DS').Value := RecordType;
    qry_COOLLabels.Open;
    qry_COOLLabels.First;

    While not qry_COOLLabels.EOF Do
      begin
        New(COOLDataPtr);
        COOLDataPtr.ID := qry_COOLLabels.FieldByName('ID').AsInteger;
        COOLDataPtr.FieldName := qry_COOLLabels.FieldByName('FieldName').AsString;
        COOLDataPtr.FontName := qry_COOLLabels.FieldByName('FontName').AsString;
        COOLDataPtr.FontSize := qry_COOLLabels.FieldByName('FontSize').AsInteger;
        COOLDataPtr.FontStyle := UpperCase(qry_COOLLabels.FieldByName('FontStyle').AsString);
        COOLDataPtr.PosX := qry_COOLLabels.FieldByName('XPos').AsInteger;
        COOLDataPtr.PosY := qry_COOLLabels.FieldByName('YPos').AsInteger;
        COOLDataPtr.Visible := qry_COOLLabels.FieldByName('Visible').asBoolean;

        ImageViewer.LayersAdd;
        ImageViewer.Layers[ImageViewer.LayersCurrent].UserData := COOLDataPtr;
        ImageViewer.Proc.Fill(CreateRGB(255,255,255));
        ImageViewer.Bitmap.Canvas.Font.Name := COOLDataPtr.FontName;
        ImageViewer.Bitmap.Canvas.Font.Size := COOLDataPtr.FontSize;
        ImageViewer.Bitmap.Canvas.Font.Style := [];
        If pos('BOLD', COOLDataPtr.FontStyle) > 0 Then ImageViewer.Bitmap.Canvas.Font.Style := ImageViewer.Bitmap.Canvas.Font.Style + [fsBold];
        If pos('ITALIC', COOLDataPtr.FontStyle) > 0 Then ImageViewer.Bitmap.Canvas.Font.Style := ImageViewer.Bitmap.Canvas.Font.Style + [fsItalic];
        If pos('UNDERLINE', COOLDataPtr.FontStyle) > 0 Then ImageViewer.Bitmap.Canvas.Font.Style := ImageViewer.Bitmap.Canvas.Font.Style + [fsUnderline];
        If pos('STRIKEOUT', COOLDataPtr.FontStyle) > 0 Then ImageViewer.Bitmap.Canvas.Font.Style := ImageViewer.Bitmap.Canvas.Font.Style + [fsStrikeOut];

        IETextOut(ImageViewer.Bitmap.Canvas, COOLDataPtr.PosX, COOLDataPtr.PosY, 0, COOLDataPtr.FieldName); // draw text on NEW layer
        ImageViewer.Proc.SetTransparentColors(CreateRGB(255,255,255), CreateRGB(255,255,255), 0); // remove the white, making it as transparent
        RefreshLayerViewer;

        qry_COOLLabels.Next;
      end;
    qry_COOLLabels.Close;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_IndexDefinitions.RefreshLayerViewer;
var
  i, idx: integer;
begin
  // update ImageEnMView1 with the contents of ImageEnView1
  ImageEnMView1.Clear;
  for i := 0 to ImageViewer.LayersCount - 1 do
  begin
    idx := ImageEnMView1.AppendImage;
    ImageEnMView1.SetIEBitmap(idx, ImageViewer.Layers[i].Bitmap);
    ImageEnMView1.ImageTopText[i] := 'Layer ' + inttostr(i);
//    ImageEnMView1.ImageTopText[i].Font.Color := clWhite;
  end;
  ImageEnMView1.SelectedImage := ImageViewer.LayersCurrent;
end;

end.


