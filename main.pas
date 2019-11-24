//============================================================\\
//===Platform: Windows
//===Development Tool:  Borland® Developer Studio Enterprise
//===Database Connectivity:  ADO
//============================================================\\
unit main;

interface

uses
  Windows, Messages,Classes, Graphics, Forms, Controls, Menus, Dialogs, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, INIFiles, DB, TransView, Processing, Req, Retrievals,
  Delivery,Whouse, DBTables, MRegister, Mask, DBCtrls,
  Registry, Grids, DBGrids, DirDlg, RegSec, Variants, ScktComp, ADODB, ActnList,
  XPStyleActnCtrls, ActnMan, ActnCtrls, ToolWin, ActnMenus, StdActns,  eRecords,
  ImgList, ImgCentre, ePending, DateUtils, Shellapi, Registration, COOL,
  ADSISearch;

Const
  VersionNo: Integer = 600027;
  VersionDate: String = '20/11/2019';
  HelpFilename :string = 'Metrofiler.chm';
  WM_MY_MESSAGE = $A123;
//--------Disable Print Screen---------
  KC = 104;
  KC_ALT = 105;
  KC_CTRL = 106;
//--------Disable Print Screen---------
type
  Tfrm_Console = class(TForm)
    StatusBar: TStatusBar;
    Timer_ThreadReg: TTimer;
    ActionManager1: TActionManager;
    ActionMainMenuBar1: TActionMainMenuBar;
    act_Exit: TFileExit;
    act_ContainerTypes: TAction;
    act_DeliveryTypes: TAction;
    act_ExportFile: TAction;
    act_Warehouse: TAction;
    act_Locations: TAction;
    act_ChangeOffSiteCont: TAction;
    act_MetroFileriReports: TAction;
    act_RecordTypes: TAction;
    act_Periods: TAction;
    act_Register: TAction;
    act_RecMovSched: TAction;
    act_Security: TAction;
    WindowMinimizeAll1: TWindowMinimizeAll;
    act_Help: THelpContents;
    act_About: TAction;
    Action19: TAction;
    Action20: TAction;
    Action21: TAction;
    Action22: TAction;
    Action23: TAction;
    Action24: TAction;
    Action25: TAction;
    Action26: TAction;
    Action27: TAction;
    Action28: TAction;
    Action29: TAction;
    Action30: TAction;
    Action31: TAction;
    Action32: TAction;
    act_Capture: TAction;
    act_Reqs: TAction;
    act_Retrievals: TAction;
    act_Filing: TAction;
    act_Trx: TAction;
    act_Rec: TAction;
    ImageList1: TImageList;
    qry_Login: TADOQuery;
    act_Logon: TAction;
    qry_SQL: TADOQuery;
    act_eRecords: TAction;
    act_RecordCat: TAction;
    act_ImgCentre: TAction;
    ClientSocket: TClientSocket;
    RegSec: TRegSec;
    act_LogOff: TAction;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll2: TWindowMinimizeAll;
    WindowArrange1: TWindowArrange;
    ActionToolBar1: TActionToolBar;
    act_ReportGen: TAction;
    act_IndexDefsRelations: TAction;
    act_BulkImport: TAction;
    act_ChangeDet: TAction;
    ImageList2: TImageList;
    ImageList3: TImageList;
    img_Forms: TImageList;
    act_BranchesDepartments: TAction;
    qry_Access: TADOQuery;
    act_eRecBulkCapture: TAction;
    act_ProxyLoc: TAction;
    act_Reports: TAction;
    act_BulkImportPurge: TAction;
    act_DataManager: TAction;
    act_BulkExport: TAction;
    act_ChangeBarcode: TAction;
    act_COOL: TAction;
    act_Actions: TAction;
    qry_Upd: TADOQuery;
    actDBConfig: TAction;
    procedure actDBConfigExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure About(Sender: TObject);
    procedure SetButtons(Status : Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure Timer_ThreadRegTimer(Sender: TObject);
    procedure act_CaptureExecute(Sender: TObject);
    procedure act_ReqsExecute(Sender: TObject);
    procedure act_RetrievalsExecute(Sender: TObject);
    procedure act_FilingExecute(Sender: TObject);
    procedure act_TrxExecute(Sender: TObject);
    procedure act_RecExecute(Sender: TObject);
    procedure act_LogonExecute(Sender: TObject);
    procedure act_LogoffExecute(Sender: TObject);
    procedure act_ContainerTypesExecute(Sender: TObject);
    procedure act_DeliveryTypesExecute(Sender: TObject);
    procedure act_ExportFileExecute(Sender: TObject);
    procedure act_WarehouseExecute(Sender: TObject);
    procedure act_LocationsExecute(Sender: TObject);
    procedure act_ChangeOffSiteContExecute(Sender: TObject);
    procedure act_MetroFileriReportsExecute(Sender: TObject);
    procedure act_RecordTypesExecute(Sender: TObject);
    procedure act_PeriodsExecute(Sender: TObject);
    procedure act_RegisterExecute(Sender: TObject);
    procedure act_RecMovSchedExecute(Sender: TObject);
    procedure act_SecurityExecute(Sender: TObject);
    procedure act_ExitHint(var HintStr: String; var CanShow: Boolean);
    procedure act_HelpExecute(Sender: TObject);
    procedure act_AboutExecute(Sender: TObject);
    procedure Action19Execute(Sender: TObject);
    procedure Action20Execute(Sender: TObject);
    procedure Action21Execute(Sender: TObject);
    procedure Action22Execute(Sender: TObject);
    procedure Action23Execute(Sender: TObject);
    procedure Action24Execute(Sender: TObject);
    procedure Action25Execute(Sender: TObject);
    procedure Action26Execute(Sender: TObject);
    procedure Action27Execute(Sender: TObject);
    procedure Action28Execute(Sender: TObject);
    procedure Action29Execute(Sender: TObject);
    procedure Action30Execute(Sender: TObject);
    procedure Action31Execute(Sender: TObject);
    procedure Action32Execute(Sender: TObject);
    procedure act_eRecordsExecute(Sender: TObject);
    procedure act_RecordCatExecute(Sender: TObject);
    procedure act_ImgCentreExecute(Sender: TObject);
    procedure act_ReportGenExecute(Sender: TObject);
    procedure act_IndexDefsRelationsExecute(Sender: TObject);
    procedure act_BulkImportExecute(Sender: TObject);
    procedure act_ChangeDetExecute(Sender: TObject);
    procedure act_BranchesDepartmentsExecute(Sender: TObject);
    procedure act_eRecBulkCaptureExecute(Sender: TObject);
    procedure act_ProxyLocExecute(Sender: TObject);
    procedure act_ReportsExecute(Sender: TObject);
    procedure act_BulkImportPurgeExecute(Sender: TObject);
    procedure act_DataManagerExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure act_BulkExportExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure act_ChangeBarcodeExecute(Sender: TObject);
    procedure act_COOLExecute(Sender: TObject);
    procedure act_ActionsExecute(Sender: TObject);
  protected
    procedure WndProc(var Message: TMessage); override;
  private
    fThreadRunning   :Boolean;
    fTimerBusy       :Boolean;
    fFreeSession     :Boolean;
    procedure RegThreadDone(Sender: TObject);
    procedure WMHotKey(var Msg: TWMHotKey);
    procedure OpenDatabase;
    procedure CheckVersion;
    procedure DoLogon;
    procedure AutoLogon;
  public
    { Public declarations }
    ServerName :String;
    Superv     :Boolean;
    SecureHost     :String;
    SecureIPAddr   :String;
    SecurePort     :Integer;
    ReqNotify,FilRef :integer;
    TrackandTraceActive :smallint;
    FullTextSearch :smallint;
    PartialSearch :smallint;
    PickSlipAutoLocate  :Integer;
    sReqeMail :string;
    feRecords  :Tfrm_eRecords;
    fCOOL      :Tfrm_Cool;
    fImageCentre  :Tfrm_ImageCentre;
    fePending  :Tfrm_ePending;
    eRecNo, eRecImgNo :Integer;
    fProcessing  :Tfrm_Processing;
//--------
    fDocMan  :Word;
    fWareMan  :Word;
    fEntMan  :Word;
    feRecMan  :Word;
    fImgMan   :Word;
    fCOOLMan  :Word;
    fWebMan   :Word;
    fIndexMatchingMan   :Word;
    feRecBulkCapture :Word;
    fSecureID        :Integer;
    fExpireDays      :Integer;
    fExpireDaysFlag  :Boolean;
    fErrorMessage    :String;
    AccessSysAdmin   :Boolean;
    AccessImageCentreAdmin   :Boolean;
    Procedure AutoSizeExistingColumns(var DBGrid  :TDBGrid);
    Procedure AutoSizeNewColumns(var DBGrid  :TDBGrid);
    procedure CheckRegistration(var ErrorMessage :string);
    procedure FreeSession(var ErrorMessage :string);
    function AccessRight(Access :Integer):Boolean;
    function ADAuthUser(UserId  :String):boolean;
    function ADAuthUserDebug(UserId  :String):boolean;
    function GetADValue(Header  :String; slTemp   :TStringList):String;
    function GetADValueList(Header  :String; SubHeader:String; slTemp   :TStringList):TStringList;
    function LinkADAuthUser(ADUserPrefix :String; UserId :String;Surname :String;Name :String;Designation :String;
                            Department :String;Telephone :String; Address :String; eMail :String;
                            RoleList  :TStringList):boolean;
  end;
var
  frm_Console           :Tfrm_Console;
  CompsCode             :String;
  User                  :String;
  Surname               :String;
  FirstName             :String;
  AuthType              :smallint;
  WorkPlaceId           :String;
  Dept                  :String;
  UReg                  :Boolean;
  OutOffice             :Boolean;

implementation

uses  SysUtils, Mapi, About, Logon, ContainerSearch, ContType, Period, Location,
      Receiving, repFilesInuseputawaynottracked, OffSiteExporttoFile,
      ChangeOffSiteRecsCont, rep_FilesOut, repListRecordTypes, repListofCont_FullDetails,
      repListContRec, repOffsiteConContents, rep_Destruction, rep_SchDestruct, Rep_WhCont,
      repRequisitionsDaily, repReturnsPutawaysDaily, rep_RHistory, repWorkCaptured,
      SelFromToDate, repContSAtoIA, MetroTrackRep, MetroFilerDataModule, RecCat,
      repGenerator, IndexDefsRelations, IndexDefinitions, BulkImport, ChangeDet,
      RetSched, BranchesDepartments, BulkCapture, Security,
      ProxyLocations, Reports, BulkImportPurge, DataMan, Filing, eRecExport, ChangeBarcode,
      Actions, DBConfig;

{$R *.DFM}


procedure Tfrm_Console.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_MY_MESSAGE:  begin
                      act_eRecords.Enabled := False;

                      If frm_Console.fePending = Nil Then
                        begin
                          If feRecords = Nil Then
                            feRecords := Tfrm_eRecords.Create(Self)
                          else feRecords.BringToFront;

                          eRecNo := 0;
                          eRecImgNo := 0;
                          fePending := Tfrm_ePending.Create(Self);
                          fePending.LaunchedFrom := 'eRecords';
                        end
                      else fePending.BringToFront;
                      fePending.qry_InBox.Close;
                      fePending.qry_InBox.Open;
                      fePending.qry_InBox.Last;

                      Application.BringToFront;
                    end;
  end;
  inherited;
end;

procedure Tfrm_Console.WMHotKey(var Msg: TWMHotKey);
begin
  if (msg.HotKey = KC_ALT) then
    Exit;
  if (msg.HotKey = KC_CTRL) then
    Exit;
  if (msg.HotKey = KC) then
    Exit;
end;

function Tfrm_Console.AccessRight(access :Integer):Boolean;
begin
  If AccessSysAdmin Then
    begin
      Result := True;
      exit;
    end;

  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('SELECT');
  qry_Access.SQL.Add('	a.Access');
  qry_Access.SQL.Add('FROM');
  qry_Access.SQL.Add('	AuthRts a');
  qry_Access.SQL.Add('WHERE');
  qry_Access.SQL.Add('	(a.UserId = :ID1)');
  qry_Access.SQL.Add('OR');
  qry_Access.SQL.Add('	(a.RoleId IN (SELECT r.RoleId FROM RolesRts r WHERE r.UserId = :ID2))');
  qry_Access.Parameters.ParamByName('ID1').Value := User;
  qry_Access.Parameters.ParamByName('ID2').Value := User;
  dm_Metrofiler.ExecuteCached(qry_Access, EncodeTime(1,0,0,0));
  Result := qry_Access.Locate('Access', Access, []);
  qry_Access.Close;
end;

procedure Tfrm_Console.actDBConfigExecute(Sender: TObject);
var
  INIReg            :TINIFile;
  ConnectionString  :String;
begin
  Application.CreateForm(Tfrm_DatabaseConfig, frm_DatabaseConfig);
//----------------------------
  INIReg := TINIFile.Create('MetroFiler.ini');
  try
     ConnectionString := INIReg.ReadString('Database', 'ConnectionString', '');
     if ConnectionString <> '' then
       begin
         ConnectionString := dm_MetroFiler.DecryptPassw(ConnectionString);
       end;
  finally
    INIReg.Free;
  end;
//------------------------------
  try
    frm_DatabaseConfig.edt_ConnectionString.Text := ConnectionString;
    if frm_DatabaseConfig.Execute() = mrOK Then
      begin
//----------------------------
        INIReg := TINIFile.Create('MetroFiler.ini');
        try
           ConnectionString := frm_DatabaseConfig.edt_ConnectionString.Text;
           ConnectionString := dm_MetroFiler.EncryptPassw(ConnectionString);
           INIReg.WriteString('Database', 'ConnectionString', ConnectionString);
        finally
          INIReg.Free;
        end;
//------------------------------
      end;
  finally
    frm_DatabaseConfig.Free;
  end;

end;

procedure Tfrm_Console.act_BulkImportPurgeExecute(Sender: TObject);
begin
  act_BulkImportPurge.Enabled := False;
  Application.CreateForm(Tfrm_BulkImportPurge, frm_BulkImportPurge);
end;

procedure Tfrm_Console.FormCreate(Sender: TObject);
begin
//---------------Disable Print Screen---------------------------
  if not FileExists('C:\MetroBypassPrntScrn.txt') then
    begin
      RegisterHotKey(frm_Console.handle, KC_ALT, MOD_ALT, VK_SNAPSHOT);
      RegisterHotKey(frm_Console.Handle, KC_CTRL, MOD_CONTROL, VK_SNAPSHOT);
      RegisterHotKey(frm_Console.Handle, KC, 0, VK_SNAPSHOT);
    end;
//---------------Disable Print Screen---------------------------
  SetButtons(False);
  fThreadRunning := False;
  fTimerBusy := false;
  fExpireDaysFlag := false;
  Caption := Caption + ' ('+InttoStr(VersionNo)+' / ' + VersionDate+')';
  StatusBar.Panels[1].Text := 'Logged Off              ';
//--------------------------------
//  AutoLogon;
end;

procedure Tfrm_Console.FormDestroy(Sender: TObject);
begin
//---------------Disable Print Screen---------------------------
  if not FileExists('C:\MetroBypassPrntScrn.txt') then
    begin
      UnRegisterHotKey(frm_Console.Handle, KC_ALT);
      UnRegisterHotKey(frm_Console.Handle, KC_CTRL);
      UnRegisterHotKey(frm_Console.Handle, KC);
    end;
end;

procedure Tfrm_Console.FormResize(Sender: TObject);
begin
  StatusBar.Panels[0].Width := Trunc(Width / 2);
  StatusBar.Panels[1].Width := Trunc(Width / 2);
end;

procedure Tfrm_Console.About(Sender: TObject);
begin
  AboutBox.ShowModal;
end;
//------------------------------------------------------------
procedure Tfrm_Console.SetButtons(Status : Boolean);
begin
  if not status then
    begin
      act_Warehouse.Visible := false;
      act_ContainerTypes.Visible := false;
      act_Locations.Visible := false;
      act_Periods.Visible := false;
      act_Security.Visible := false;
      act_DeliveryTypes.Visible := false;
      act_Capture.Visible := false;
      act_Reqs.Visible := false;
      act_Filing.Visible := false;
      act_Retrievals.Visible := false;
      act_RecordTypes.Visible := false;
      act_IndexDefsRelations.Visible := false;
      act_Trx.Visible := false;
      act_Register.Visible := false;
      act_RecMovSched.Visible := false;
      act_Logon.Visible   := true;
      act_Logoff.Visible  := false;
      act_Rec.Visible := False;
      act_ExportFile.Visible := False;
      act_ChangeOffSiteCont.Visible := False;
      act_MetroFileriReports.Visible := False;
      act_eRecords.Visible := False;
      act_RecordCat.Visible := False;
      act_ImgCentre.Visible := False;
      act_COOL.Visible := False;
      act_BulkImport.Visible := False;
      act_BulkImportPurge.Visible := False;
      act_ChangeDet.Visible := False;
      act_eRecBulkCapture.Visible := False;
      act_BulkExport.Visible := False;
      act_BranchesDepartments.Visible := False;
      act_ProxyLoc.Visible := False;
      act_DataManager.Visible := False;
      act_ChangeBarcode.Visible := False;
      act_Actions.Visible := False;
      actDBConfig.Visible := True;
//---------
      Action19.Visible := False;
      Action20.Visible := False;
      Action21.Visible := False;
      Action22.Visible := False;
      Action23.Visible := False;
      Action24.Visible := False;
      Action25.Visible := False;
      Action26.Visible := False;
      Action27.Visible := False;
      Action28.Visible := False;
      Action29.Visible := False;
      Action30.Visible := False;
      Action31.Visible := False;
      Action32.Visible := False;
      act_ReportGen.Visible := False;
      act_Reports.Visible := False;
//---------
    end                        
  else
    begin
      act_Logon.Visible   := false;
      act_Logoff.Visible  := true;
      act_ChangeDet.Visible := true;
      actDBConfig.Visible := false;
    end;
end;

procedure Tfrm_Console.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {Dont allow user to logoff with open windows}
  if MDIChildCount > 0 then
    begin
      MessageDLG('Please Close/Exit all open modules and Logoff before exiting!!',mtError,[mbOK],0);
      Abort;
    end;
  if act_Logoff.Visible then
    begin
      MessageDLG('Please Close/Exit all open modules and Logoff before exiting!!',mtError,[mbOK],0);
      Abort;
    end;
  Action := caFree;
end;

procedure Tfrm_Console.ClientSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  ErrorCode := 0;
end;

procedure Tfrm_Console.CheckRegistration(var ErrorMessage :string);
begin
  With TRegThread.Create(fSecureID, SecureIPAddr, SecureHost, SecurePort) Do
    begin
      fThreadRunning := True;
      OnTerminate := RegThreadDone;
    end;

  While fThreadRunning Do
    begin
      Sleep(10);
      Application.ProcessMessages;
    end;

  If fErrorMessage <> '' Then
    begin
      Messagedlg(fErrorMessage, mtWarning, [mbOK], 0);
      Application.Terminate;
      exit;
    end;

  If not fExpireDaysFlag Then
    begin
      fExpireDaysFlag := True;
      If (fExpireDays <= 20)  Then
        begin
          Messagedlg('Warning.... This version of Metrofiler will expire in '+InttoStr(fExpireDays+1)+' day(s). Please re-register with Metrofile.', mtWarning, [mbOK], 0);
          exit;
        end;
    end;
end;


procedure Tfrm_Console.Timer_ThreadRegTimer(Sender: TObject);
Var
  ErrorMsg  :String;
begin
  If fTimerBusy Then
    exit;
//======================Check that Server is registered=========================
  fTimerBusy := True;
  Application.ProcessMessages;
  try
    If fFreeSession Then
      begin
        Timer_ThreadReg.Enabled := false;
        FreeSession(ErrorMsg);
        exit;
      end;
    CheckRegistration(ErrorMsg);
  finally
    fTimerBusy := false;
    Application.ProcessMessages;
  end;
end;

procedure Tfrm_Console.act_CaptureExecute(Sender: TObject);
begin
  act_Capture.Enabled := False;
  Screen.Cursor := crHourglass;
  try
    If fProcessing = Nil Then
      fProcessing := Tfrm_Processing.Create(Self)
    else fProcessing.BringToFront;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Console.act_ReqsExecute(Sender: TObject);
begin
  act_Reqs.Enabled := False;
  Tfrm_Requisitions.Create(self);
end;

procedure Tfrm_Console.act_RetrievalsExecute(Sender: TObject);
begin
  act_Retrievals.Enabled := False;
  Tfrm_Retrievals.Create(self);
end;

procedure Tfrm_Console.act_FilingExecute(Sender: TObject);
begin
  act_Filing.Enabled := False;
  Application.CreateForm(Tfrm_Filing, frm_Filing);
end;

procedure Tfrm_Console.act_TrxExecute(Sender: TObject);
begin
  act_Trx.Enabled := False;
  Tfrm_TransView.Create(self);
end;

procedure Tfrm_Console.act_RecExecute(Sender: TObject);
begin
  act_Rec.Enabled := False;
  Application.CreateForm(Tfrm_Receiving, frm_Receiving);
end;

procedure Tfrm_Console.OpenDatabase;
var
  INIReg            :TINIFile;
begin
  INIReg := TINIFile.Create('MetroFiler.ini');
  try
     dm_MetroFiler.ConnectionString := INIReg.ReadString('Database', 'ConnectionString', '');
     if dm_MetroFiler.ConnectionString <> '' then
       begin
         dm_MetroFiler.ConnectionString := dm_MetroFiler.DecryptPassw(dm_MetroFiler.ConnectionString);
       end;

    If dm_MetroFiler.ConnectionString = '' Then
      begin
        MessageDlg('Your SQL-Server ConnectionString. Please configure first.', mtWarning, [mbOK], 0);
        Exit;
      end;
//-----
    dm_MetroFiler.ADAuthentication := INIReg.ReadBool('Connection', 'ADAuthentication', false);
  finally
    INIReg.Free;
  end;
//-----
  Screen.Cursor := crHourglass;
  try
    dm_MetroFiler.ConnectDB();
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure Tfrm_Console.CheckVersion;
var
  sVersion          :Integer;
begin
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('select * from MetroSystem where Descr = ''Version''');
  qry_SQL.Open;
  sVersion := qry_SQL.FieldByname('nCount').AsInteger;
  if qry_SQL.FieldByname('nCount').AsInteger <> VersionNo then
    begin
      qry_SQL.Close;
      SetButtons(False);
      dm_MetroFiler.DisconnectDB;
      Raise Exception.Create('Incorrect Version, ('+IntToStr(sVersion)+')');
    end;
  qry_SQL.Close;
end;

procedure Tfrm_Console.DoLogon;
var
  INIReg            :TINIFile;
  ErrorMsg          :String;
begin
  qry_Login.Close;

  If OutOffice Then
    begin
      dm_Metrofiler.InsAudit('System Logon', 0, 0, '', 'Success - Out of Office', 0);
      StatusBar.Panels[1].Text := 'Logged On as: '+ FirstName+' '+Surname + ' (Out Of Office)'
    end
  else
    begin
      dm_Metrofiler.InsAudit('System Logon', 0, 0, '', 'Success', 0);
      StatusBar.Panels[1].Text := 'Logged On as: '+ FirstName+' '+Surname + '              ';
    end;
//===========================Get ServerName=====================================
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT CONVERT(CHAR(255), @@SERVERNAME)');
  qry_SQL.Open;
  ServerName := trim(qry_SQL.Fields[0].asString);
  qry_SQL.Close;
//===================Set date format============================================
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('set dateformat dmy');
  qry_SQL.ExecSQL;
//===================Set Server Address=========================================
  SecureHost := ServerName;
  SecurePort := 1024;
//---
  qry_SQL.Close;
  qry_SQL.SQL.Text := 'SELECT * FROM MetroSystem WHERE Descr = ''MetroSecHost''';
  qry_SQL.Open;
  If not qry_SQL.IsEmpty Then
    begin
      SecureHost := qry_SQL.FieldbyName('SValue').asString;
      SecurePort := qry_SQL.FieldbyName('nCount').asInteger;
    end;
  qry_SQL.Close;
//---
  SecureIPAddr := '';
  qry_SQL.Close;
  qry_SQL.SQL.Text := 'SELECT * FROM MetroSystem WHERE Descr = ''MetroSecIP''';
  qry_SQL.Open;
  If not qry_SQL.IsEmpty Then
    begin
      SecureIPAddr := qry_SQL.FieldbyName('SValue').asString;
      SecurePort := qry_SQL.FieldbyName('nCount').asInteger;
    end;
  qry_SQL.Close;
//---Check if not specified in the INIFile as it has higher priority------------
  INIReg := TINIFile.Create('MetroFiler.ini');
  If INIReg.ValueExists('Security','Address') Then
    begin
      SecureIPAddr := INIReg.ReadString('Security', 'Address', '');
      SecurePort := INIReg.ReadInteger('Security', 'Port', 1024);
    end;
  INIReg.Free;
//===================Check That System is registered============================
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT TOP 1 * FROM COMPANY');
  qry_SQL.Open;
  CompsCode := qry_SQL.FieldByName('CompanyCode').AsString;
  If length(CompsCode) = 0 then
    begin
      qry_SQL.Close;
      MessageDlg('Warning.... you have not setup your Company Information, select the Company Information option from the Configuration menu and complete the details first.',mtInformation,[mbOK],0);
      UReg := true; //flag that system is not registered!!
      act_Register.Visible := true;
      exit;
    end;
   FilRef := qry_SQL.FieldByName('FilAreaRefresh').AsInteger;
   ReqNotify := qry_SQL.FieldByName('ReqeMailDel').AsInteger;
   PickSlipAutoLocate := qry_SQL.FieldByName('PickSlipAutoLocate').AsInteger;
   TrackandTraceActive := qry_SQL.FieldByName('TrackandTraceActive').AsInteger;
   FullTextSearch := qry_SQL.FieldByName('FullTextSearch').AsInteger;
//   PartialSearch := qry_SQL.FieldByName('PartialSearch').AsInteger;
//-------
   if FilRef = 0 then
     FilRef := 300000    //default to 5 mins
   else FilRef := FilRef*1000;    //Input as seconds!!!
//-------
   qry_SQL.Close;
//======================Check that Server is registered=========================
  fSecureID        := 0;
  Screen.Cursor := crHourglass;
  try
    CheckRegistration(ErrorMsg);
  finally
    Screen.Cursor := crDefault;
  end;
  If ErrorMsg <> '' Then
    begin
      Messagedlg(ErrorMsg, mtWarning, [mbOK], 0);
      UReg := true; //flag that system is not registered!!
      act_Register.Enabled := true;
      Screen.Cursor := crDefault;
      exit;
    end;
//--------------
  UReg := false;//got here so must be registered

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('CREATE TABLE #UserInfo (UserId varchar(255) NOT NULL, Surname varchar(50) NULL, Firstname varchar(50) NULL)');
  qry_SQL.SQL.Add('INSERT INTO #UserInfo (UserId, Surname, Firstname) VALUES (:UserId, :Surname, :Firstname)');
  qry_SQL.Parameters.ParamValues['UserId'] := User;
  qry_SQL.Parameters.ParamValues['Surname'] := Surname;
  qry_SQL.Parameters.ParamValues['Firstname'] := FirstName;
  qry_SQL.ExecSQL;
//--------------
  dm_Metrofiler.ClearCache;
//==============================================================================
//=========================Update System Access=================================
//==============================================================================
  If (frm_Console.fDocMan = 1)or(frm_Console.fWareMan = 1)or(frm_Console.fEntMan = 1) Then
    begin
      if AccessRight(22) then act_Warehouse.Visible := True;
      if AccessRight(23) then act_Locations.Visible := True;
      if AccessRight(2) then act_RecordTypes.Visible := True;
      if AccessRight(2) then act_IndexDefsRelations.Visible := True;
      if AccessRight(25) then act_DeliveryTypes.Visible := True;
      if AccessRight(13) then act_Capture.Visible := True;
      if AccessRight(16) then act_Filing.Visible := True;
      if AccessRight(15) then act_Retrievals.Visible := True;
      if AccessRight(18) then act_Trx.Visible := True;
      if AccessRight(3) then act_RecMovSched.Visible := True;
      if AccessRight(17) then act_Rec.Visible := True;
      if AccessRight(30) then act_ExportFile.Visible := True;
      if AccessRight(40) then act_ChangeOffSiteCont.Visible := True;
      if AccessRight(44) then act_DataManager.Visible := True;
      if AccessRight(26) then act_ContainerTypes.Visible := True;
      if AccessRight(46) then act_ProxyLoc.Visible := True;
      if AccessRight(48) then act_ChangeBarcode.Visible := True;

      if AccessRight(29) then
        begin
          Action19.Visible := True;
          Action20.Visible := True;
          Action21.Visible := True;
          Action22.Visible := True;
          Action23.Visible := True;
          Action24.Visible := True;
          Action25.Visible := True;
          Action26.Visible := True;
          Action27.Visible := True;
          Action28.Visible := True;
          Action29.Visible := True;
          Action30.Visible := True;
          Action31.Visible := True;
          Action32.Visible := True;
          act_ReportGen.Visible := True;
        end;
      if AccessRight(14) then act_Reqs.Visible := True;
    end;
  If (frm_Console.feRecMan = 1)or(frm_Console.fEntMan = 1) Then
    begin
      if AccessRight(38) then act_MetroFileriReports.Visible := True;
      if AccessRight(7) then act_eRecords.Visible := True;
      if AccessRight(5) then act_RecordCat.Visible := True;
      if AccessRight(11) then act_ImgCentre.Visible := True;
      if AccessRight(2) then act_RecordTypes.Visible := True;
      if AccessRight(2) then act_IndexDefsRelations.Visible := True;
    end;
 { If (frm_Console.fCOOLMan = 1)or(frm_Console.fEntMan = 1) Then
    begin
      act_COOL.Visible := True;
    end;}
  If (frm_Console.fImgMan = 1)or(frm_Console.fEntMan = 1) Then
    begin
      if AccessRight(38) then act_MetroFileriReports.Visible := True;
      if AccessRight(7) then act_eRecords.Visible := True;
      if AccessRight(5) then act_RecordCat.Visible := True;
      if AccessRight(2) then act_RecordTypes.Visible := True;
      if AccessRight(2) then act_IndexDefsRelations.Visible := True;
    end;
  If (frm_Console.feRecBulkCapture = 1)or(frm_Console.fEntMan = 1) Then
    begin
      if AccessRight(38) then act_MetroFileriReports.Visible := True;
      if AccessRight(5) then act_RecordCat.Visible := True;
      if AccessRight(2) then act_RecordTypes.Visible := True;
      if AccessRight(2) then act_IndexDefsRelations.Visible := True;
      if AccessRight(41) then act_eRecBulkCapture.Visible := True;
      if AccessRight(41) then act_BulkExport.Visible := True;
    end;
//-----
  if AccessRight(29) then
    begin
      act_Reports.Visible := True;
    end;
//-----
  if AccessRight(1) Then act_Register.Visible := True;
  if AccessRight(4) Then
    begin
      act_Security.Visible := true;
      SuperV := True;
    end
  else SuperV := False;
  if AccessRight(42) then act_BranchesDepartments.Visible := True;
  if AccessRight(6) then act_BulkImport.Visible := True;
  if AccessRight(43) then act_BulkImportPurge.Visible := True;
  if AccessRight(53) then act_Actions.Visible := True;
//-----------------------
  fFreeSession := False;
  Timer_ThreadReg.Enabled := True;
  Screen.Cursor := crDefault;
//------------------------------------------
  SetButtons(True);
//------------------------------------------
end;

procedure Tfrm_Console.AutoLogon;
var
  mUserID           :String;
begin
  OpenDatabase;
  CheckVersion;
//----------------------------------
  mUserId := dm_Metrofiler.GetLoggedOnUser();
//============================Check Security====================================
  if not ADAuthUser(mUserId) then
    begin
      qry_Login.Close;
      dm_Metrofiler.DisconnectDB;
      exit;
    end;

  qry_Login.Close;
  qry_Login.SQL.Clear;
  qry_Login.SQL.Add('SELECT UserId, Valid_Option, Valid_From, Valid_To, Surname, Name, WorkPlaceId, SysAdmin, ImageCentreAdmin, OutOfOffice_option, OutOfOffice_From, OutOfOffice_To FROM AuthCodes WHERE UserId = :ID AND UserType = ''A''');
  qry_Login.Parameters.ParamValues['ID'] := mUserId;
  qry_Login.Open;
  If qry_Login.IsEmpty Then
    begin
      qry_Login.Close;
      dm_Metrofiler.DisconnectDB;
      exit;
    end;
  If qry_Login.FieldByName('Valid_Option').AsInteger = 1 Then
    begin
      If (dm_MetroFiler.GetServTimeNow < Trunc(qry_Login.FieldByName('Valid_From').AsDateTime))OR
         (dm_MetroFiler.GetServTimeNow >= (Trunc(qry_Login.FieldByName('Valid_To').AsDateTime)+1))Then
        begin
          qry_Login.Close;
          dm_Metrofiler.DisconnectDB;
          exit;
        end;
    end;
  AuthType := 0;
  Surname := qry_Login.FieldByName('Surname').asString;
  FirstName := qry_Login.FieldByName('Name').asString;
  WorkPlaceId := qry_Login.FieldByName('WorkPlaceId').asString;
  AccessSysAdmin := qry_Login.FieldByName('SysAdmin').asInteger = 1;
  AccessImageCentreAdmin := qry_Login.FieldByName('ImageCentreAdmin').asInteger = 1;
  User := qry_Login.FieldByName('UserId').asString;

  OutOffice := false;
  if qry_Login.FieldByName('OutOfOffice_option').AsInteger = 1 then
    begin
      If (dm_MetroFiler.GetServTimeNow > Trunc(qry_Login.FieldByName('OutOfOffice_From').AsDateTime))OR
         (dm_MetroFiler.GetServTimeNow < (Trunc(qry_Login.FieldByName('OutOfOffice_To').AsDateTime)+1))Then
        begin
          OutOffice := true;
        end;
    end;
  //==================================
  DoLogon;
end;

procedure Tfrm_Console.act_LogonExecute(Sender: TObject);
var
  mAuthentication   :smallint;
  mUserID           :String;
  mPassw            :String;
  DePassw           :String;
  Auth              :Boolean;
begin
  If not act_Logon.Visible Then
    exit;
  OpenDatabase;
  CheckVersion;
//----------------------------------
  PasswordDlg.Count := 3;
  Auth := False;
  PasswordDlg.cbAuthentication.ItemIndex := 0;
  PasswordDlg.cbAuthenticationChange(Self);
  Repeat
    If NOT(PasswordDlg.ShowModal = mrOK) Then
      begin
        PasswordDlg.Count := 0;
        exit;
      end;
    mAuthentication := PasswordDlg.cbAuthentication.ItemIndex;
    mUserId := trim(PasswordDlg.edt_UserId.Text);
    mPassw := trim(PasswordDlg.edt_Password.Text);
//============================Check Security====================================
    if mAuthentication = 0 then
      begin
        if not ADAuthUser(mUserId) then
          begin
            User := mUserId;
            dm_Metrofiler.InsAudit('System Logon', 0, 0, '', 'Failed', 0);
            User := '';
            Messagedlg('Userid and Password are not Defined!!', mtWarning ,[mbOK], 0);
            PasswordDlg.Count := PasswordDlg.Count-1;
            Continue;
          end;
        qry_Login.Close;
        qry_Login.SQL.Clear;
        qry_Login.SQL.Add('SELECT UserId, Valid_Option, Valid_From, Valid_To, Surname, Name, WorkPlaceId, SysAdmin, ImageCentreAdmin, OutOfOffice_option, OutOfOffice_From, OutOfOffice_To  FROM AuthCodes WHERE UserId = :ID AND UserType = ''A''');
        qry_Login.Parameters.ParamValues['ID'] := mUserId;
        qry_Login.Open;
        If qry_Login.IsEmpty Then
          begin
            User := mUserId;
            dm_Metrofiler.InsAudit('System Logon', 0, 0, '', 'Failed', 0);
            User := '';
            Messagedlg('Userid and Password are not Defined!!', mtWarning ,[mbOK], 0);
            PasswordDlg.Count := PasswordDlg.Count-1;
            Continue;
          end;
        AuthType := 0;
      end
    else
      begin
        qry_Login.Close;
        qry_Login.SQL.Clear;
        qry_Login.SQL.Add('SELECT UserId, Passw, Valid_Option, Valid_From, Valid_To, Surname, Name, WorkPlaceId, SysAdmin, ImageCentreAdmin, OutOfOffice_option, OutOfOffice_From, OutOfOffice_To FROM AuthCodes WHERE UserId = :ID AND UserType = ''S''');
        qry_Login.Parameters.ParamValues['ID'] := mUserId;
        qry_Login.Open;
        If qry_Login.IsEmpty Then
          begin
            User := mUserId;
            dm_Metrofiler.InsAudit('System Logon', 0, 0, '', 'Failed', 0);
            User := '';
            Messagedlg('Userid and Password are not Defined!!', mtWarning ,[mbOK], 0);
            PasswordDlg.Count := PasswordDlg.Count-1;
            Continue;
          end;
        try
          DePassw := dm_Metrofiler.DecryptPassw(qry_Login.FieldByName('PASSW').AsString);
        except
          User := mUserId;
          dm_Metrofiler.InsAudit('System Logon', 0, 0, '', 'Failed', 0);
          User := '';
          Messagedlg('Userid and Password are not Defined!!', mtWarning ,[mbOK], 0);
          PasswordDlg.Count := PasswordDlg.Count-1;
          Continue;
        end;
        If mPassw <> DePassw Then
          begin
            User := mUserId;
            dm_Metrofiler.InsAudit('System Logon', 0, 0, '', 'Failed', 0);
            User := '';
            Messagedlg('Userid and Password are not Defined!!', mtWarning ,[mbOK], 0);
            PasswordDlg.Count := PasswordDlg.Count-1;
            Continue;
          end;
        AuthType := 1;
      end;
    If qry_Login.FieldByName('Valid_Option').AsInteger = 1 Then
      begin
        If (dm_MetroFiler.GetServTimeNow < Trunc(qry_Login.FieldByName('Valid_From').AsDateTime))OR
           (dm_MetroFiler.GetServTimeNow >= (Trunc(qry_Login.FieldByName('Valid_To').AsDateTime)+1))Then
          begin
            User := mUserId;
            dm_Metrofiler.InsAudit('System Logon', 0, 0, '', 'Failed - Expired', 0);
            User := '';
            Messagedlg('Userid and Password is expired!!', mtWarning ,[mbOK], 0);
            PasswordDlg.Count := PasswordDlg.Count-1;
            Continue;
          end;
      end;
    Surname := qry_Login.FieldByName('Surname').asString;
    FirstName := qry_Login.FieldByName('Name').asString;
    WorkPlaceId := qry_Login.FieldByName('WorkPlaceId').asString;
    AccessSysAdmin := qry_Login.FieldByName('SysAdmin').asInteger = 1;
    AccessImageCentreAdmin := qry_Login.FieldByName('ImageCentreAdmin').asInteger = 1;
    User := qry_Login.FieldByName('UserId').asString;

    OutOffice := false;
    if qry_Login.FieldByName('OutOfOffice_option').AsInteger = 1 then
      begin
        If (dm_MetroFiler.GetServTimeNow > Trunc(qry_Login.FieldByName('OutOfOffice_From').AsDateTime))OR
           (dm_MetroFiler.GetServTimeNow < (Trunc(qry_Login.FieldByName('OutOfOffice_To').AsDateTime)+1))Then
          begin
            OutOffice := true;
          end;
      end;

    StatusBar.Panels[1].Text := 'Logged On as: '+ FirstName+' '+Surname + '              ';
    Auth := True;
    qry_Login.Close;
    PasswordDlg.Count := 0;//Authorised
  Until PasswordDlg.Count <= 0;
//==========Now Check=============
  If not dm_MetroFiler.ADOConnect_mFiler.Connected Then
    begin
      Messagedlg('Logon Failed!!', mtWarning ,[mbOK], 0);
      Surname := '';
      FirstName := '';
      User := '';
      exit;
    end;
  If not Auth Then
    begin
      Messagedlg('Logon Failed!!', mtWarning ,[mbOK], 0);
      Surname := '';
      FirstName := '';
      User := '';
      exit;
    end;
  //==================================
  DoLogon;
end;

procedure Tfrm_Console.act_LogoffExecute(Sender: TObject);
var
  bCount            :Byte;
begin
  Screen.Cursor := crHourglass;
  try
    {close all open MDIs}
    if MDIChildCount > 0 then
      begin
        for bCount := 0 to MDIChildCount-1 do
          MDIChildren[bCount].Close;
      end;

    SetButtons(False);
    dm_MetroFiler.DisconnectDB;
    StatusBar.Panels[1].Text := 'Logged Off              ';
  //---------Disconnect User from MetrofileSecure
    While fTimerBusy Do
      begin
        Sleep(10);
        Application.ProcessMessages;
      end;

    fFreeSession := True;
    Timer_ThreadRegTimer(Timer_ThreadReg);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Console.act_ContainerTypesExecute(Sender: TObject);
begin
  act_ContainerTypes.Enabled := False;
  Application.CreateForm(Tfrm_ContTypes, frm_ContTypes);
end;

procedure Tfrm_Console.act_COOLExecute(Sender: TObject);
begin
  act_COOL.Enabled := False;

  If fCOOL = Nil Then
    fCOOL := Tfrm_Cool.Create(Self)
  else fCOOL.BringToFront;
end;

procedure Tfrm_Console.act_DataManagerExecute(Sender: TObject);
begin
  act_DataManager.Enabled := False;
  Application.CreateForm(Tfrm_DataMan, frm_DataMan);
end;

procedure Tfrm_Console.act_DeliveryTypesExecute(Sender: TObject);
begin
  act_DeliveryTypes.Enabled := False;
  Tfrm_DeliveryType.Create(self);
end;

procedure Tfrm_Console.act_ExportFileExecute(Sender: TObject);
begin
  act_ExportFile.Enabled := False;
  Application.CreateForm(Tfrm_OffsiteExporttoFile, frm_OffsiteExporttoFile);
end;

procedure Tfrm_Console.act_WarehouseExecute(Sender: TObject);
begin
  act_Warehouse.Enabled := False;
  Tfrm_Warehouse.Create(self);
end;

procedure Tfrm_Console.act_LocationsExecute(Sender: TObject);
begin
  act_Locations.Enabled := False;
  Tfrm_Locations.Create(Self);
end;

procedure Tfrm_Console.act_ChangeOffSiteContExecute(Sender: TObject);
begin
  act_ChangeOffSiteCont.Enabled := False;
  Application.CreateForm(Tfrm_changeOffSiteRecsCont, frm_changeOffSiteRecsCont);
end;

procedure Tfrm_Console.act_MetroFileriReportsExecute(Sender: TObject);
begin
  act_MetroFileriReports.Enabled := False;
  Application.CreateForm(Tfrm_MetroTrackRep, frm_MetroTrackRep);
end;

procedure Tfrm_Console.act_RecordTypesExecute(Sender: TObject);
begin
  act_RecordTypes.Enabled := False;
  Application.CreateForm(Tfrm_IndexDefinitions, frm_IndexDefinitions);
end;

procedure Tfrm_Console.act_PeriodsExecute(Sender: TObject);
begin
  act_Periods.Enabled := False;
  Tfrm_Period.Create(Self);
end;

procedure Tfrm_Console.act_ProxyLocExecute(Sender: TObject);
begin
  act_ProxyLoc.Enabled := False;
  Application.CreateForm(Tfrm_ProxyLocactions, frm_ProxyLocactions);
end;

procedure Tfrm_Console.act_RegisterExecute(Sender: TObject);
begin
  act_Register.Enabled := False;
  Tfrm_Register.Create(self);
end;

procedure Tfrm_Console.act_RecMovSchedExecute(Sender: TObject);
begin
  act_RecMovSched.Enabled := False;
  Application.CreateForm(Tfrm_RetSched, frm_RetSched);
end;

procedure Tfrm_Console.act_SecurityExecute(Sender: TObject);
begin
  act_Security.Enabled := False;
  Application.CreateForm(Tfrm_Security, frm_Security);
end;

procedure Tfrm_Console.act_ExitHint(var HintStr: String;
  var CanShow: Boolean);
begin
  Close;
end;

procedure Tfrm_Console.act_HelpExecute(Sender: TObject);
begin
  If not FileExists(ExtractFilePath(ParamStr(0))+HelpFileName) Then
    begin
      Messagedlg('Help is not available. The Help File does not exist.', mtError, [mbOK], 0);
      exit;
    end;
  ShellExecute(application.Handle,'open',pchar(ExtractFilePath(ParamStr(0))+HelpFileName),pchar(''),'',1);
end;

procedure Tfrm_Console.act_AboutExecute(Sender: TObject);
begin
  If not UReg Then
    begin
      AboutBox.lbl_Reg.Visible := True;
    end;

  AboutBox.lbl_Reg.Caption := '';
//---
  If fEntMan = 1 Then
    begin
      AboutBox.lbl_Reg.Caption := AboutBox.lbl_Reg.Caption + 'Enterprise Manager,'
    end
  else
    begin
      If fDocMan = 1 Then
        AboutBox.lbl_Reg.Caption := AboutBox.lbl_Reg.Caption + 'Document Manager,'
      else If fWareMan = 1 Then
        AboutBox.lbl_Reg.Caption := AboutBox.lbl_Reg.Caption + 'Document && Warehouse Manager,';

      If feRecMan = 1 Then
        AboutBox.lbl_Reg.Caption := AboutBox.lbl_Reg.Caption + 'eRecords Manager,'
      else If fImgMan = 1 Then
        AboutBox.lbl_Reg.Caption := AboutBox.lbl_Reg.Caption + 'Image Manager,'
    end;

  If fWebMan = 1 Then
    AboutBox.lbl_Reg.Caption := AboutBox.lbl_Reg.Caption + 'Web Manager,';
  If feRecBulkCapture = 1 Then
    AboutBox.lbl_Reg.Caption := AboutBox.lbl_Reg.Caption + 'eRecords Bulk Capture,';

  AboutBox.lbl_Reg.Caption := copy(AboutBox.lbl_Reg.Caption, 1, length(AboutBox.lbl_Reg.Caption)-1);

  AboutBox.ShowModal;
end;

procedure Tfrm_Console.act_ActionsExecute(Sender: TObject);
begin
  act_Actions.Enabled := false;
  Application.CreateForm(Tfrm_Actions, frm_Actions);
end;

procedure Tfrm_Console.act_BranchesDepartmentsExecute(Sender: TObject);
begin
  act_BranchesDepartments.Enabled := false;
  Application.CreateForm(Tfrm_BranchesDepartments, frm_BranchesDepartments);
end;

procedure Tfrm_Console.Action19Execute(Sender: TObject);
begin
  If frm_SelFromToDates.ShowModal = mrOK Then
    begin
      rep_ContSAtoIA.mFrom := Trunc(frm_SelFromToDates.date_From.Date);
      rep_ContSAtoIA.mTo := Trunc(frm_SelFromToDates.date_To.Date)+EncodeTime(23,59,59,59);
      rep_ContSAtoIA.REPORT.Preview;
      rep_ContSAtoIA.qry_Containers.Close;
      rep_ContSAtoIA.qry_Files.Close;
    end;
end;

procedure Tfrm_Console.Action20Execute(Sender: TObject);
begin
  Application.CreateForm(Tfrm_FilesWithdrawn, frm_FilesWithdrawn);
end;

procedure Tfrm_Console.Action21Execute(Sender: TObject);
begin
  Application.CreateForm(Trep_ListRecordTypes, rep_ListRecordTypes);
  try
    rep_ListRecordTypes.qry_RecordTypes.Open;
    rep_ListRecordTypes.Report.PreviewModal;
  finally
    rep_ListRecordTypes.qry_RecordTypes.Close;
    rep_ListRecordTypes.Free;
  end;
end;

procedure Tfrm_Console.Action22Execute(Sender: TObject);
begin
  Application.CreateForm(Trep_ListContFullDet, rep_ListContFullDet);
  try
    rep_ListContFullDet.qry_BranchDept.Open;
    rep_ListContFullDet.report.Preview;
  finally
    rep_ListContFullDet.qry_BranchDept.Close;
    rep_ListContFullDet.qry_Containers.close;
    rep_ListContFullDet.Free;
  end;
end;

procedure Tfrm_Console.Action23Execute(Sender: TObject);
begin
  Application.CreateForm(Trep_ListContRecords, rep_ListContRecords);
end;

procedure Tfrm_Console.Action24Execute(Sender: TObject);
begin
  Application.CreateForm(Trep_OffSiteConContents, rep_OffSiteConContents);
end;

procedure Tfrm_Console.Action25Execute(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Destruction, frm_Destruction);
end;

procedure Tfrm_Console.Action26Execute(Sender: TObject);
begin
  Application.CreateForm(Tfrm_OutSched, frm_OutSched);
end;

procedure Tfrm_Console.Action27Execute(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Rep_WhCont, frm_Rep_WhCont);
end;

procedure Tfrm_Console.Action28Execute(Sender: TObject);
begin
  Application.CreateForm(Trep_RequisitionsDaily, rep_RequisitionsDaily);
end;

procedure Tfrm_Console.Action29Execute(Sender: TObject);
begin
  Application.CreateForm(Trep_ReturnsPutawaysDaily, rep_ReturnsPutawaysDaily);
end;

procedure Tfrm_Console.Action30Execute(Sender: TObject);
begin
  Application.CreateForm(Tfrm_FilesInuseputawaynottracked, frm_FilesInuseputawaynottracked);
end;

procedure Tfrm_Console.Action31Execute(Sender: TObject);
begin
  Application.CreateForm(Tfrm_RetrieveHistory, frm_RetrieveHistory);
end;

procedure Tfrm_Console.Action32Execute(Sender: TObject);
begin
  Application.CreateForm(Trep_workCaptured, rep_workCaptured);
end;

procedure Tfrm_Console.act_eRecordsExecute(Sender: TObject);
begin
  act_eRecords.Enabled := False;

  If feRecords = Nil Then
    feRecords := Tfrm_eRecords.Create(Self)
  else feRecords.BringToFront;
end;

procedure Tfrm_Console.act_RecordCatExecute(Sender: TObject);
begin
  act_RecordCat.Enabled := False;
  Tfrm_RecCat.Create(self);
end;

procedure Tfrm_Console.act_ImgCentreExecute(Sender: TObject);
begin
  act_ImgCentre.Enabled := False;

  If fImageCentre = Nil Then
    fImageCentre := Tfrm_ImageCentre.Create(Self)
  else fImageCentre.BringToFront;
end;

Procedure Tfrm_Console.AutoSizeExistingColumns(var DBGrid  :TDBGrid);
Var
  j, DataWidth           :Integer;
  MaxFieldSizes          :Array[0..255] of Integer;
begin
  If not DBGrid.DataSource.DataSet.Active Then
    exit;
  Application.ProcessMessages;
  Screen.Cursor := crHourglass;
  DBGrid.Columns.BeginUpdate;
  DBGrid.DataSource.DataSet.DisableControls;
  try

    For J := 0 to 255 Do
      MaxFieldSizes[J] := 0;

    For J := 0 to DBGrid.Columns.Count-1 Do
      begin
        DBGrid.Columns.Items[J].Width := 10;
      end;

    For J := 0 to DBGrid.Columns.Count-1 Do
      begin
        MaxFieldSizes[J] := DBGrid.canvas.TextWidth(trim(DBGrid.Columns.Items[J].Title.Caption))+15;
      end;
//---
    DBGrid.DataSource.DataSet.First;
    While not DBGrid.DataSource.DataSet.EOF Do
      begin
        For J := 0 to DBGrid.Columns.Count-1 Do
           begin
             If DBGrid.Columns.Items[J].Field <> Nil Then
               DataWidth := Canvas.TextWidth(trim(DBGrid.Columns.Items[J].Field.DisplayText))+10
             else DataWidth := 10;

             If DataWidth > MaxFieldSizes[J] Then
               MaxFieldSizes[J] := DataWidth;
           end;
        DBGrid.DataSource.DataSet.Next;
      end;
//---
    For J := 0 to DBGrid.Columns.Count-1 Do
      begin
        DBGrid.Columns.Items[J].Width := MaxFieldSizes[J];
      end;
  finally
    DBGrid.DataSource.DataSet.EnableControls;
    DBGrid.DataSource.DataSet.First;
    DBGrid.Columns.EndUpdate;
    Screen.Cursor := crDefault;
  end;
end;


Procedure Tfrm_Console.AutoSizeNewColumns(var DBGrid  :TDBGrid);
Var
  j, DataWidth   :Integer;
  MaxFieldSizes          :Array of Integer;
begin
  If not DBGrid.DataSource.DataSet.Active Then
    exit;
  Application.ProcessMessages;
  Screen.Cursor := crHourglass;
  DBGrid.Columns.Clear;
  DBGrid.DataSource.DataSet.DisableControls;
  DBGrid.Columns.BeginUpdate;
  try
    Setlength(MaxFieldSizes, DBGrid.DataSource.DataSet.Fields.Count);

    For J := 0 to DBGrid.DataSource.DataSet.Fields.Count-1 Do
      begin
        If DBGrid.DataSource.DataSet.Fields[J].Visible Then
          MaxFieldSizes[J] := Canvas.TextWidth(trim(DBGrid.DataSource.DataSet.Fields[J].FieldName))+15;
      end;
    DBGrid.DataSource.DataSet.First;
    While not DBGrid.DataSource.DataSet.EOF Do
      begin
        For J := 0 to DBGrid.DataSource.DataSet.Fields.Count-1 Do
          begin
            If DBGrid.DataSource.DataSet.Fields[J].Visible Then
              begin
                DataWidth := DBGrid.Canvas.TextWidth(trim(DBGrid.DataSource.DataSet.Fields[J].AsString))+10;
                If DataWidth > MaxFieldSizes[J] Then
                  MaxFieldSizes[J] := DataWidth;
              end;
          end;
        DBGrid.DataSource.DataSet.Next;
      end;

    For J := 0 to DBGrid.DataSource.DataSet.Fields.Count-1 Do
      begin
        If DBGrid.DataSource.DataSet.Fields[J].Visible Then
          begin
            DBGrid.Columns.Add;
            DBGrid.Columns.Items[J].FieldName := DBGrid.DataSource.DataSet.Fields[J].FieldName;
            DBGrid.Columns.Items[J].Width := MaxFieldSizes[J];
          end;
      end;
  finally
    DBGrid.DataSource.DataSet.EnableControls;
    DBGrid.DataSource.DataSet.First;
    DBGrid.Columns.EndUpdate;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Console.act_ReportGenExecute(Sender: TObject);
begin
  act_ReportGen.Enabled := False;
  Application.CreateForm(Tfrm_RepGenerator, frm_RepGenerator);
end;

procedure Tfrm_Console.act_ReportsExecute(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Reports, frm_Reports);
end;

procedure Tfrm_Console.act_IndexDefsRelationsExecute(Sender: TObject);
begin
  act_IndexDefsRelations.Enabled := False;
  Application.CreateForm(Tfrm_IndexDefsRelations, frm_IndexDefsRelations);
end;

procedure Tfrm_Console.act_eRecBulkCaptureExecute(Sender: TObject);
begin
  act_eRecBulkCapture.Enabled := false;
  Application.CreateForm(Tfrm_BulkCapture, frm_BulkCapture);
end;

procedure Tfrm_Console.act_BulkExportExecute(Sender: TObject);
begin
  act_BulkExport.Enabled := False;
  Application.CreateForm(Tfrm_eRecExport, frm_eRecExport);
end;

procedure Tfrm_Console.act_BulkImportExecute(Sender: TObject);
begin
  act_BulkImport.Enabled := False;
  Application.CreateForm(Tfrm_BulkImport, frm_BulkImport);
  try
    frm_BulkImport.ShowModal;
  finally
    act_BulkImport.Enabled := True;
    frm_BulkImport.Free;
  end;
end;

procedure Tfrm_Console.act_ChangeBarcodeExecute(Sender: TObject);
begin
  act_ChangeBarcode.Enabled := false;
  Application.CreateForm(Tfrm_ChangeBarcode, frm_ChangeBarcode);
end;

procedure Tfrm_Console.act_ChangeDetExecute(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ChangeDet, frm_ChangeDet);
  try
    frm_ChangeDet.GroupBox2.Visible :=  (AuthType = 1);
    frm_ChangeDet.Execute(User);
  finally
    frm_ChangeDet.qry_SQL.Close;
    frm_ChangeDet.Free;
  end;
end;

procedure Tfrm_Console.FreeSession(var ErrorMessage :string);
var
  mTemp             :String;
  mCommand          :String;
  Stream            :TWinSocketStream;
  Buffer            :Array[0 .. 999] of Char;
  LastError         :String;
  Retries           :Integer;
  IsError           :Boolean;
begin
  If SecureIPAddr <> '' Then
    ClientSocket.Address := SecureIPAddr
  else ClientSocket.Host := SecureHost;
  ClientSocket.Port := SecurePort;
  Retries := 0;
  Repeat
    IsError := false;
    LastError := '';
    Inc(Retries);
    LastError := '';
    try
      try
        ClientSocket.Open;
  //------------
        If not ClientSocket.Active Then
          begin
            IsError := true;
            LastError := 'Warning.... Could not free session. Security server is unavailable.';
            Continue;
          end;
  //-----------Check if MetroFiler Registered
        Clientsocket.Socket.SendText('Close?MetroFiler?'+InttoStr(fSecureID));
        Stream := TWinSocketStream.Create(ClientSocket.Socket, 60000);
        FillChar(Buffer, 1000, 0);
        If not Stream.WaitForData(5000) Then
          begin
            IsError := true;
            LastError := 'Warning.... Could not free session. Security server not responding.';
            Continue;
          end;
        If Stream.Read(Buffer, 1000) = 0 then
          begin
            IsError := true;
            LastError := 'Warning.... Could not free session. Security server responded with a NULL string.';
            Continue;
          end;
  //--------------now process the request-------------
        mTemp := Buffer;
        RegSec.SoftwareTitle := 'MetroFiler';
        mCommand := RegSec.pDCrypt(mTemp, 'MetroFiler');
        If copy(mCommand, 1, 21) <> 'Close?MetroFiler=>OK.' Then
          begin
            IsError := true;
            LastError := 'Warning.... Could not free Session.'+mCommand;
            break;
          end;
        break;
      except
        on E: Exception do
          begin
            IsError := true;
            LastError := 'Warning.... Could not free session. '+E.Message;
            Continue;
          end;
      end;
    finally
      If ClientSocket.Active Then
        ClientSocket.Close;
    end;
  Until Retries >= 5;

  fSecureID := 0;

  If IsError Then
    ErrorMessage := LastError
  else ErrorMessage := '';
end;

procedure Tfrm_Console.RegThreadDone(Sender: TObject);
begin
  fThreadRunning := False;
end;

function Tfrm_Console.ADAuthUser(UserId  :String):boolean;
var
  adsearch   :TADSISearch;
  slTemp : TStringList;
  ADPath, tempstr :string;
  ADUserPrefix :string;

  Surname :String;
  Name :String;
  Designation :String;
  Department :String;
  Telephone :String;
  Address :String;
  eMail :String;
  RoleList  :TStringList;
begin
  adsearch := TADSISearch.Create(Self);
  try
    try
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('select * from MetroSystem where Descr = ''ADPath''');
      qry_SQL.Open;
      if qry_SQL.IsEmpty then
        begin
          result := false;
          exit;
        end;
      ADPath := trim(qry_SQL.FieldByname('sValue').AsString);
      if ADPath = '' then
        begin
          result := false;
          exit;
        end;
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('select * from MetroSystem where Descr = ''ADUserPrefix''');
      qry_SQL.Open;
      if qry_SQL.IsEmpty then
        begin
          result := false;
          exit;
        end;
      ADUserPrefix := trim(qry_SQL.FieldByname('sValue').AsString);
      if ADUserPrefix = '' then
        begin
          result := false;
          exit;
        end;

      if pos(ADUserPrefix, UserId) <> -1 then
        begin
          Delete(Userid, pos(ADUserPrefix, UserId), length(ADUserPrefix));
        end;

      adsearch.BasePath := ADPath;
      adsearch.MaxRows := 1;
      adsearch.Filter := 'SAMAccountName='+Userid;
      adsearch.ObjectClass := 'User';
      adsearch.Attributes := '';
      adsearch.Search;

      slTemp := adsearch.GetFirstRow();
      If (slTemp = nil) Then
        begin
          result := false;
          exit;
        end;

      Surname := GetADValue('sn', slTemp);
      Name := GetADValue('givenName', slTemp);
      Designation := GetADValue('title', slTemp);
      Department := GetADValue('department', slTemp);
      Telephone := GetADValue('telephoneNumber', slTemp);
      Address := GetADValue('streetAddress', slTemp);
      eMail := GetADValue('mail', slTemp);
      RoleList := GetADValueList('memberOf', 'CN', slTemp);

      result := LinkADAuthUser(ADUserPrefix, ADUserPrefix + Userid, Surname, Name, Designation, Department, Telephone, Address, eMail, RoleList);
    except
      on E: Exception do
        begin
          result := false;
          exit;
        end;
    end;
  finally
     adsearch.Free;
  end;
end;

function Tfrm_Console.ADAuthUserDebug(UserId  :String):boolean;
var
  adsearch   :TADSISearch;
  slTemp : TStringList;
  ADPath, tempstr :string;
  ADUserPrefix :string;
  Surname :String;
  Name :String;
  Designation :String;
  Department :String;
  Telephone :String;
  Address :String;
  eMail :String;
  RoleList  :TStringList;
begin
  adsearch := TADSISearch.Create(Self);
  try
    try
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('select * from MetroSystem where Descr = ''ADPath''');
      qry_SQL.Open;
      if qry_SQL.IsEmpty then
        begin
          result := false;
          exit;
        end;
      ADPath := trim(qry_SQL.FieldByname('sValue').AsString);
      if ADPath = '' then
        begin
          result := false;
          exit;
        end;
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('select * from MetroSystem where Descr = ''ADUserPrefix''');
      qry_SQL.Open;
      if qry_SQL.IsEmpty then
        begin
          result := false;
          exit;
        end;
      ADUserPrefix := trim(qry_SQL.FieldByname('sValue').AsString);
      if ADUserPrefix = '' then
        begin
          result := false;
          exit;
        end;

      if pos(ADUserPrefix, UserId) <> -1 then
        begin
          Delete(Userid, pos(ADUserPrefix, UserId), length(ADUserPrefix));
        end;

      slTemp := TStringList.Create;
      slTemp.Add('objectClass[0]=top');
      slTemp.Add('objectClass[1]=person');
      slTemp.Add('objectClass[2]=organizationalPerson');
      slTemp.Add('objectClass[3]=user');
      slTemp.Add('cn=Chris Viljoen');
      slTemp.Add('sn=Viljoen');
      slTemp.Add('c=ZA');
      slTemp.Add('title=Senior Developer');
      slTemp.Add('description=Senior Developer');
      slTemp.Add('postOfficeBox=P.O. Box 40264,');
      slTemp.Add('physicalDeliveryOfficeName=Facility 1');
      slTemp.Add('telephoneNumber=+27 (11) 677 3119');
      slTemp.Add('userCertificate[0]=(unknown data type 8)');
      slTemp.Add('userCertificate[1]=(unknown data type 8)');
      slTemp.Add('givenName=Chris');
      slTemp.Add('distinguishedName=CN=Chris Viljoen,OU=Development,OU=Users,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('instanceType=4');
      slTemp.Add('whenCreated=2007-01-03 11:47:53 AM');
      slTemp.Add('whenChanged=2016-04-28 06:11:37 PM');
      slTemp.Add('displayName=Chris Viljoen');
      slTemp.Add('uSNCreated=29651');
      slTemp.Add('memberOf[0]=CN=Production Servers,OU=CLV-FLS-001,OU=Groups,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[1]=CN=webDashboards,OU=Web-Security,DC=metrofile,DC=local');
      slTemp.Add('memberOf[2]=CN=Webdev,OU=Groups,DC=metrofile,DC=local');
      slTemp.Add('memberOf[3]=CN=SSLVPN,OU=Groups,DC=metrofile,DC=local');
      slTemp.Add('memberOf[4]=CN=FamilyServices,OU=EBranding,OU=Groups,DC=metrofile,DC=local');
      slTemp.Add('memberOf[5]=CN=SQL Backups,OU=Groups,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[6]=CN=CRNFLS,OU=Groups,OU=Disabled Accounts,DC=metrofile,DC=local');
      slTemp.Add('memberOf[7]=CN=MetroAssets_General,OU=Groups,OU=MetroAssets,OU=MetroSystems,OU=National,DC=metrofile,DC=local');
      slTemp.Add('memberOf[8]=CN=CPTSERVER,OU=Groups,OU=Cape Town,DC=metrofile,DC=local');
      slTemp.Add('memberOf[9]=CN=JHBSQLAdmin,OU=Groups,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[10]=CN=Marcomms,OU=Groups,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[11]=CN=ClvVPNUsers,OU=Groups,OU=Disabled Accounts,DC=metrofile,DC=local');
      slTemp.Add('memberOf[12]=CN=CPTVPNUsers,OU=Groups,OU=Cape Town,DC=metrofile,DC=local');
      slTemp.Add('memberOf[13]=CN=Standard Internet Members,OU=Groups,DC=metrofile,DC=local');
      slTemp.Add('memberOf[14]=CN=Cell Users,OU=Groups,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[15]=CN=PLZSQLADMIN,OU=Groups,OU=Port Elizabeth,DC=metrofile,DC=local');
      slTemp.Add('memberOf[16]=CN=Images,OU=Groups,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[17]=CN=webJHB,OU=Web-Security,DC=metrofile,DC=local');
      slTemp.Add('memberOf[18]=CN=CptSQLadmin,OU=Groups,OU=Cape Town,DC=metrofile,DC=local');
      slTemp.Add('memberOf[19]=CN=ITOps,OU=CLV-FLS-001,OU=Groups,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[20]=CN=Standard Bank Home Loans,OU=CLV-FLS-001,OU=Groups,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[21]=CN=Metrofile Cellphone Users,OU=Groups,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[22]=CN=MetroCheck,OU=Groups,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[23]=CN=PTAsqladmin,OU=Groups,OU=Pretoria,DC=metrofile,DC=local');
      slTemp.Add('memberOf[24]=CN=Mail Restriction 10MB,OU=Groups,DC=metrofile,DC=local');
      slTemp.Add('memberOf[25]=CN=MHNational,OU=Groups,DC=metrofile,DC=local');
      slTemp.Add('memberOf[26]=CN=MetroCheckPE,OU=Groups,OU=Port Elizabeth,DC=metrofile,DC=local');
      slTemp.Add('memberOf[27]=CN=MHRegional,OU=Groups,DC=metrofile,DC=local');
      slTemp.Add('memberOf[28]=CN=WebSQL,OU=Web-Security,DC=metrofile,DC=local');
      slTemp.Add('memberOf[29]=CN=MetroCheckDBN,OU=Groups,OU=Durban,DC=metrofile,DC=local');
      slTemp.Add('memberOf[30]=CN=Cleveland Users,OU=Groups,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[31]=CN=Cleveland MngInternet,OU=Groups,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[32]=CN=Cleveland Internet,OU=Groups,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[33]=CN=OpsManagement,OU=Groups,DC=metrofile,DC=local');
      slTemp.Add('memberOf[34]=CN=MetroClock_REPORTS,OU=Groups,DC=metrofile,DC=local');
      slTemp.Add('memberOf[35]=CN=MetroCheckCPT,OU=Groups,OU=Cape Town,DC=metrofile,DC=local');
      slTemp.Add('memberOf[36]=CN=MetroCheckCPR,OU=Groups,OU=CIPC,OU=Roseville,OU=Pretoria,DC=metrofile,DC=local');
      slTemp.Add('memberOf[37]=CN=WebExManagement,OU=Web-Security,DC=metrofile,DC=local');
      slTemp.Add('memberOf[38]=CN=MetroClock_SYSADMIN,OU=Groups,DC=metrofile,DC=local');
      slTemp.Add('memberOf[39]=CN=MetroHelpReports,DC=metrofile,DC=local');
      slTemp.Add('memberOf[40]=CN=MetroCheckROS,OU=Groups,OU=Pretoria,DC=metrofile,DC=local');
      slTemp.Add('memberOf[41]=CN=MetroCheckREP,OU=Groups,OU=Repens,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[42]=CN=mitweb,OU=Groups,DC=metrofile,DC=local');
      slTemp.Add('memberOf[43]=CN=Everybody,CN=Builtin,DC=metrofile,DC=local');
      slTemp.Add('memberOf[44]=CN=MetroCheckCRN,OU=Groups,OU=Crown,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[45]=CN=Metro System Support Users,OU=Groups,OU=Cape Town,DC=metrofile,DC=local');
      slTemp.Add('memberOf[46]=CN=BoU Project,OU=Groups,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('memberOf[47]=CN=CptRas,OU=Groups,OU=Cape Town,DC=metrofile,DC=local');
      slTemp.Add('uSNChanged=70516141');
      slTemp.Add('co=South Africa');
      slTemp.Add('delivContLength=12288');
      slTemp.Add('department=Development');
      slTemp.Add('company=Metrofile (Pty) Ltd.');
      slTemp.Add('homeMTA=CN=Microsoft MTA,CN=CLV-EXS-001,CN=Servers,CN=Exchange Administrative Group (FYDIBOHF23SPDLT),CN=Administrative Groups,CN=Metrofile,CN=Microsoft Exchange,CN=Services,CN=Configuration,DC=metrofile,DC=local');
      slTemp.Add('proxyAddresses[0]=smtp:ChrisV2@globalcontinuity.co.za');
      slTemp.Add('proxyAddresses[1]=smtp:chrisv@jhb.metrofiler.co.za');
      slTemp.Add('proxyAddresses[2]=smtp:chrisv@archive.co.za');
      slTemp.Add('proxyAddresses[3]=smtp:chrisv@metrofileholdings.co.za');
      slTemp.Add('proxyAddresses[4]=smtp:chrisv@exsol.co.za');
      slTemp.Add('proxyAddresses[5]=smtp:chrisv@csx.co.za');
      slTemp.Add('proxyAddresses[6]=smtp:chrisv@metrofile.com');
      slTemp.Add('proxyAddresses[7]=smtp:chrisv@mgxholdings.co.za');
      slTemp.Add('proxyAddresses[8]=smtp:chrisv@mgxgroup.com');
      slTemp.Add('proxyAddresses[9]=SMTP:chrisv@metrofile.co.za');
      slTemp.Add('proxyAddresses[10]=X400:c=US;a= ;p=Metrofile;o=Exchange;s=Viljoen;g=Chris;');
      slTemp.Add('homeMDB=CN=JHB IT,CN=Databases,CN=Exchange Administrative Group (FYDIBOHF23SPDLT),CN=Administrative Groups,CN=Metrofile,CN=Microsoft Exchange,CN=Services,CN=Configuration,DC=metrofile,DC=local');
      slTemp.Add('streetAddress=3 Gowie Road, The Gables, Cleveland, Gauteng, 2022');
      slTemp.Add('submissionContLength=12288');
      slTemp.Add('publicDelegatesBL[0]=CN=Metrofile Webmaster,OU=Accounts,OU=Information Technology,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('publicDelegatesBL[1]=CN=Buffalo - Metrofile Gowie,OU=Boardroom Users,OU=Users,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('publicDelegatesBL[2]=CN=Metrofile IT/IS Support,OU=Systems&Services,OU=IT Users,OU=Users,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('mDBUseDefaults=1');
      slTemp.Add('directReports[0]=CN=Development,OU=Development,OU=Users,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('directReports[1]=CN=AD One,OU=Accounts,OU=Information Technology,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('directReports[2]=CN=AppTest,OU=Accounts,OU=Information Technology,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('mailNickname=chrisv');
      slTemp.Add('wWWHomePage=www.metrofile.co.za');
      slTemp.Add('protocolSettings[0]=HTTP§1§1§§§§§§');
      slTemp.Add('protocolSettings[1]=OWA§1');
      slTemp.Add('name=Chris Viljoen');
      slTemp.Add('objectGUID=(unknown data type 8)');
      slTemp.Add('userAccountControl=512');
      slTemp.Add('badPwdCount=0');
      slTemp.Add('codePage=0');
      slTemp.Add('countryCode=710');
      slTemp.Add('badPasswordTime=131065624515367595');
      slTemp.Add('lastLogoff=0');
      slTemp.Add('lastLogon=131067760888367714');
      slTemp.Add('pwdLastSet=131042216975700325');
      slTemp.Add('primaryGroupID=513');
      slTemp.Add('objectSid=(unknown data type 8)');
      slTemp.Add('adminCount=1');
      slTemp.Add('accountExpires=9223372036854775807');
      slTemp.Add('logonCount=1607');
      slTemp.Add('sAMAccountName=chrisv');
      slTemp.Add('sAMAccountType=805306368');
      slTemp.Add('showInAddressBook[0]=CN=Default Global Address List,CN=All Global Address Lists,CN=Address Lists Container,CN=Metrofile,CN=Microsoft Exchange,CN=Services,CN=Configuration,DC=metrofile,DC=local');
      slTemp.Add('showInAddressBook[1]=CN=Metrofile Global Address List,CN=All Global Address Lists,CN=Address Lists Container,CN=Metrofile,CN=Microsoft Exchange,CN=Services,CN=Configuration,DC=metrofile,DC=local');
      slTemp.Add('showInAddressBook[2]=CN=All Users,CN=All Address Lists,CN=Address Lists Container,CN=Metrofile,CN=Microsoft Exchange,CN=Services,CN=Configuration,DC=metrofile,DC=local');
      slTemp.Add('legacyExchangeDN=/o=Metrofile/ou=First Administrative Group/cn=Recipients/cn=chrisv');
      slTemp.Add('userPrincipalName=chrisv@metrofile.local');
      slTemp.Add('lockoutTime=0');
      slTemp.Add('servicePrincipalName=MSSQLSvc/clv-dev-001.metrofile.local:1433');
      slTemp.Add('objectCategory=CN=Person,CN=Schema,CN=Configuration,DC=metrofile,DC=local');
      slTemp.Add('dSCorePropagationData[0]=2016-02-19 10:41:52 AM');
      slTemp.Add('dSCorePropagationData[1]=2016-02-04 11:53:36 AM');
      slTemp.Add('dSCorePropagationData[2]=2015-12-09 03:01:19 PM');
      slTemp.Add('dSCorePropagationData[3]=2015-10-05 07:40:13 AM');
      slTemp.Add('dSCorePropagationData[4]=1601-07-15 01:27:27 AM');
      slTemp.Add('lastLogonTimestamp=131063389034572527');
      slTemp.Add('msExchRequireAuthToSendTo=0');
      slTemp.Add('textEncodedORAddress=X400:C=US;A= ;P=Metrofile;O=Exchange;S=Viljoen;G=Chris;');
      slTemp.Add('mail=chrisv@metrofile.co.za');
      slTemp.Add('manager=CN=Guy Kimble,OU=Senior Management Users,OU=Users,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('msExchHomeServerName=/o=Metrofile/ou=Exchange Administrative Group (FYDIBOHF23SPDLT)/cn=Configuration/cn=Servers/cn=CLV-EXS-001');
      slTemp.Add('msExchALObjectVersion=684');
      slTemp.Add('msExchMailboxSecurityDescriptor=(unknown data type 25)');
      slTemp.Add('msExchUserAccountControl=0');
      slTemp.Add('msExchMailboxGuid=(unknown data type 8)');
      slTemp.Add('msExchPoliciesIncluded[0]=986b0e13-dc36-4b12-b173-7a030b308174');
      slTemp.Add('msExchPoliciesIncluded[1]={26491cfc-9e50-4857-861b-0cb8df22b5d7}');
      slTemp.Add('msExchUMDtmfMap[0]=reversedPhone:91137761172+');
      slTemp.Add('msExchUMDtmfMap[1]=emailAddress:247478');
      slTemp.Add('msExchUMDtmfMap[2]=lastNameFirstName:845563624747');
      slTemp.Add('msExchUMDtmfMap[3]=firstNameLastName:247478455636');
      slTemp.Add('msExchRecipientDisplayType=1073741824');
      slTemp.Add('msExchSafeSendersHash=(unknown data type 8)');
      slTemp.Add('msExchUserCulture=en-ZA');
      slTemp.Add('msExchVersion=88218628259840');
      slTemp.Add('msExchRecipientTypeDetails=1');
      slTemp.Add('msExchMobileMailboxFlags=1');
      slTemp.Add('msExchRBACPolicyLink=CN=Default Role Assignment Policy,CN=Policies,CN=RBAC,CN=Metrofile,CN=Microsoft Exchange,CN=Services,CN=Configuration,DC=metrofile,DC=local');
      slTemp.Add('msExchTextMessagingState[0]=302120705');
      slTemp.Add('msExchTextMessagingState[1]=16842751');
      slTemp.Add('msExchDelegateListBL[0]=CN=Development,OU=Development,OU=Users,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('msExchDelegateListBL[1]=CN=Metrofile Webmaster,OU=Accounts,OU=Information Technology,OU=Johannesburg,DC=metrofile,DC=local');
      slTemp.Add('msExchWhenMailboxCreated=2011-03-12 10:56:41 AM');
      slTemp.Add('ADsPath=LDAP://metrofile.local/CN=Chris Viljoen,OU=Development,OU=Users,OU=Cleveland,OU=Johannesburg,DC=metrofile,DC=local');

      Surname := GetADValue('sn', slTemp);
      Name := GetADValue('givenName', slTemp);
      Designation := GetADValue('title', slTemp);
      Department := GetADValue('department', slTemp);
      Telephone := GetADValue('telephoneNumber', slTemp);
      Address := GetADValue('streetAddress', slTemp);
      eMail := GetADValue('mail', slTemp);
      RoleList := GetADValueList('memberOf', 'CN', slTemp);


      result := LinkADAuthUser(ADUserPrefix, ADUserPrefix + Userid, Surname, Name, Designation, Department, Telephone, Address, eMail, RoleList);
    except
      on E: Exception do
        begin
          result := false;
          exit;
        end;
    end;
  finally
     adsearch.Free;
  end;
end;



function Tfrm_Console.GetADValue(Header  :String; slTemp   :TStringList):String;
var
  i,x,y     :Integer;
  tempstr   :String;
  ValueString :String;
begin
  ValueString := '';
  For i := 0 to slTemp.Count-1 Do
    begin
      tempstr := slTemp[i];

      If (copy(tempstr, 1, length(Header)+1) = Header+'=') Then
        begin
          x := pos('=', tempstr);
          ValueString := copy(tempstr, x + 1, 1000);
          break;
        end;
    end;
  result := ValueString;
end;

function Tfrm_Console.GetADValueList(Header  :String; SubHeader:String; slTemp   :TStringList):TStringList;
var
  i,x,y     :Integer;
  tempstr   :String;
  ValueList   :TStringList;
begin
  ValueList := TStringList.Create;
  For i := 0 to slTemp.Count-1 Do
    begin
      tempstr := slTemp[i];

      If (copy(tempstr, 1, length(Header)) = Header) Then
        begin
          x := pos('=', tempstr);
          tempstr := copy(tempstr, x + 1, 1000);

          If (copy(tempstr, 1, length(SubHeader)) = SubHeader) Then
            begin
              x := pos('=', tempstr);
              y := pos(',', tempstr);
              tempstr := copy(tempstr, x + 1, y-4);
              ValueList.Add(Uppercase(tempstr));
            end;

        end;
    end;
  result := ValueList;
end;

function Tfrm_Console.LinkADAuthUser(ADUserPrefix :String; UserId :String;Surname :String;Name :String;Designation :String;
                           Department :String;Telephone :String; Address :String; eMail :String; RoleList  :TStringList):Boolean;
Var
  J, RoleId     :Integer;
  ADRoleName    :string;
  HasAccesstoSystemRole   :Boolean;
begin
  //========First Check if an AD Role is linked to system=======================
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM Roles WHERE ADRoleName IS NOT NULL AND ADRoleName <> ''''');
  qry_SQL.Open;
  qry_SQL.First;
  HasAccesstoSystemRole := false;
  while not qry_SQL.Eof do
    begin
      ADRoleName := uppercase(trim(qry_SQL.FieldByName('ADRoleName').AsString));
      if pos(ADUserPrefix, ADRoleName) <> -1 then
        begin
          Delete(ADRoleName, pos(ADUserPrefix, ADRoleName), length(ADUserPrefix));
        end;

      RoleId := qry_SQL.FieldByName('RoleId').asInteger;

      if RoleList.IndexOf(ADRoleName) <> -1 then
        begin
          HasAccesstoSystemRole := true;
          break;
        end;
      qry_SQL.Next;
    end;

  if (not HasAccesstoSystemRole) then
    begin
      Result := false;
      exit;
    end;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM AuthCodes WHERE UserID = :UserId AND UserType <> ''S''');
  qry_SQL.Parameters.ParamByName('UserId').Value := Userid;
  qry_SQL.Open;
  if qry_SQL.IsEmpty then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('INSERT INTO AuthCodes(UserId, Surname, Name, Designation, InternalDept, Telephone, Address, eMail, valid_from,');
      qry_SQL.SQL.Add('                      UserType, SysAdmin, OutOfOffice_Option, ProxyLoc, WorkplaceId, ImageCentreAdmin)');
      qry_SQL.SQL.Add('VALUES(:UserId, :Surname, :Name, :Designation, :Department, :Telephone, :Address, :eMail, 0,');
      qry_SQL.SQL.Add('       ''A'', 0, 0, 0, :WorkplaceId, 0)');
      qry_SQL.Parameters.ParamByName('UserId').Value := Userid;
      qry_SQL.Parameters.ParamByName('Surname').Value := Surname;
      qry_SQL.Parameters.ParamByName('Name').Value := Name;
      qry_SQL.Parameters.ParamByName('Designation').Value := Designation;
      qry_SQL.Parameters.ParamByName('Department').Value := Department;
      qry_SQL.Parameters.ParamByName('Telephone').Value := Telephone;
      qry_SQL.Parameters.ParamByName('Address').Value := Address;
      qry_SQL.Parameters.ParamByName('eMail').Value := eMail;
      qry_SQL.Parameters.ParamByName('WorkplaceId').Value := dm_Metrofiler.CreateGuid;
      qry_SQL.ExecSQL;
    end;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM Roles WHERE ADRoleName IS NOT NULL AND ADRoleName <> ''''');
  qry_SQL.Open;
  qry_SQL.First;
  while not qry_SQL.Eof do
    begin
      ADRoleName := trim(qry_SQL.FieldByName('ADRoleName').AsString);
      if pos(ADUserPrefix, ADRoleName) <> -1 then
        begin
          Delete(ADRoleName, pos(ADUserPrefix, ADRoleName), length(ADUserPrefix));
        end;
      ADRoleName := uppercase(ADRoleName);
      RoleId := qry_SQL.FieldByName('RoleId').asInteger;

      qry_Upd.Close;
      qry_Upd.SQL.Clear;
      if RoleList.IndexOf(ADRoleName) <> -1 then
        begin
          qry_Upd.SQL.Add('IF NOT EXISTS(SELECT * FROM RolesRts WHERE RoleId = :RoleId1 AND UserId = :UserId1)');
          qry_Upd.SQL.Add('INSERT INTO RolesRts (RoleId, UserId) VALUES (:RoleId2, :UserId2)');
        end
      else
        begin
          qry_Upd.SQL.Add('IF EXISTS(SELECT * FROM RolesRts WHERE RoleId = :RoleId1 AND UserId = :UserId1)');
          qry_Upd.SQL.Add('DELETE FROM RolesRts WHERE RoleId = :RoleId2 AND UserId = :UserId2');
        end;
      qry_Upd.Parameters.ParamByName('RoleId1').Value := RoleId;
      qry_Upd.Parameters.ParamByName('RoleId2').Value := RoleId;
      qry_Upd.Parameters.ParamByName('UserId1').Value := UserId;
      qry_Upd.Parameters.ParamByName('UserId2').Value := UserId;
      qry_Upd.ExecSQL;

      qry_SQL.Next;
    end;
  qry_SQL.Close;
  Result := True;
end;

end.

