unit Briefdes;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, DBCtrls, DB, DBTables, ExtCtrls,
  Buttons, GetComp, GetDept, TabNotBk, Grids, DBGrids, GetView, GetDescr,
  ComCtrls;

type
  ENotProcessed = class(Exception);
  Tfrm_BriefDescr = class(TForm)
    btn_AddLookup: TBitBtn;
    btn_Advance: TBitBtn;
    btn_Close: TBitBtn;
    btn_Create: TBitBtn;
    btn_DelLookup: TBitBtn;
    btn_Drop: TBitBtn;
    btn_Find: TBitBtn;
    btn_Process: TBitBtn;
    btn_RefreshViews: TBitBtn;
    btn_SelectDept: TButton;
    btn_Show: TBitBtn;
    btn_View: TBitBtn;
    dts_BriefDescription: TDataSource;
    dts_View: TDataSource;
    dts_ViewDefinition: TDataSource;
    edt_Code: TDBEdit;
    edt_Date1: TDBEdit;
    edt_Date2: TDBEdit;
    edt_Date3: TDBEdit;
    edt_Department: TDBEdit;
    edt_Description: TDBEdit;
    edt_LookHeading: TEdit;
    edt_LookItem: TEdit;
    edt_NameOfView: TDBEdit;
    edt_No10: TDBEdit;
    edt_No11: TDBEdit;
    edt_No12: TDBEdit;
    edt_No13: TDBEdit;
    edt_No14: TDBEdit;
    edt_No15: TDBEdit;
    edt_No1: TDBEdit;
    edt_No2: TDBEdit;
    edt_No3: TDBEdit;
    edt_No4: TDBEdit;
    edt_No5: TDBEdit;
    edt_No6: TDBEdit;
    edt_No7: TDBEdit;
    edt_No8: TDBEdit;
    edt_No9: TDBEdit;
    edt_Number1: TDBEdit;
    edt_Number2: TDBEdit;
    edt_RetentionPeriod: TDBEdit;
    edt_Text10: TDBEdit;
    edt_Text1: TDBEdit;
    edt_Text2: TDBEdit;
    edt_Text3: TDBEdit;
    edt_Text4: TDBEdit;
    edt_Text5: TDBEdit;
    edt_Text6: TDBEdit;
    edt_Text7: TDBEdit;
    edt_Text8: TDBEdit;
    edt_Text9: TDBEdit;
    edt_UserName: TDBEdit;
    edt_ViewName: TDBEdit;
    grd_ShowView: TDBGrid;
    grd_View: TDBGrid;
    lbl_BriefDesc: TLabel;
    lbl_Comments: TLabel;
    lbl_Company: TLabel;
    lbl_CompanyName: TLabel;
    lbl_DateFields: TLabel;
    lbl_Department: TLabel;
    lbl_DeptName: TLabel;
    lbl_Heading: TLabel;
    lbl_Items: TLabel;
    lbl_NameOfView: TLabel;
    lbl_NumFields: TLabel;
    lbl_RetPeriod: TLabel;
    lbl_TextFields: TLabel;
    lbl_TextFieldsCont: TLabel;
    lbl_ViewName: TLabel;
    lbl_ViewOwner: TLabel;
    lbl_ViewsAvail: TLabel;
    lbl_months: TLabel;
    lst_Heading: TListBox;
    lst_Item: TListBox;
    lst_View: TListBox;
    mem_Comments: TDBMemo;
    mem_SQL: TDBMemo;
    nav_DescrViews: TDBNavigator;
    ntb_BriefDesc: TTabbedNotebook;
    pnl_Top: TPanel;
    qry_Create: TQuery;
    qry_DropView: TQuery;
    qry_GetCompany: TQuery;
    qry_GetDept: TQuery;
    qry_GetViews: TQuery;
    qry_Lookup: TQuery;
    qry_View: TQuery;
    tbl_BriefDescription: TTable;
    tbl_ViewDefinition: TTable;
    lst_ReservedWords: TListBox;
    lst_ReservedSymbols: TListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_AddLookupClick(Sender: TObject);
    procedure btn_AdvanceClick(Sender: TObject);
    procedure btn_Click(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_CreateClick(Sender: TObject);
    procedure btn_DelLookupClick(Sender: TObject);
    procedure btn_DropClick(Sender: TObject);
    procedure btn_Exit(Sender: TObject);
    procedure btn_FindClick(Sender: TObject);
    procedure btn_KeyPress(Sender: TObject; var Key: Char);
    procedure btn_ProcessClick(Sender: TObject);
    procedure btn_RefreshViewsClick(Sender: TObject);
    procedure btn_SelectCompanyClick(Sender: TObject);
    procedure btn_SelectDeptClick(Sender: TObject);
    procedure btn_ShowClick(Sender: TObject);
    procedure btn_ViewClick(Sender: TObject);
    procedure dts_BriefDescriptionDataChange(Sender: TObject; Field: TField);
    procedure edt_CodeChange(Sender: TObject);
    procedure edt_DepartmentChange(Sender: TObject);
    procedure lst_HeadingClick(Sender: TObject);
    procedure lst_ItemClick(Sender: TObject);
    procedure lst_ViewClick(Sender: TObject);
    procedure nav_DescrViewsClick(Sender: TObject; Button: TNavigateBtn);
    procedure ntb_BriefDescChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure tblViewDefinitionAfterInsertOrEdit(DataSet: TDataset);
    procedure tbl_ViewDefinitionAfterPost(DataSet: TDataset);
    procedure tbl_ViewDefinitionBeforePost(DataSet: TDataset);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Processed : Boolean;
    function ProcessInput : Boolean;
    procedure BuildLookupList;
    procedure BuildViewList;
    procedure ClearArray;
    function CheckWord(name : String) : boolean;
    function CheckSymbol(name : String) : boolean;
  public
    { Public declarations }
  end;


type
  tColumnRecord = record
    sName     : String;
    bDataType : Byte;    {0 = CHAR  1 = NUMERIC  2 = DATE}
  end;

const
  MaxArray = 15;

var
  frm_BriefDescr: Tfrm_BriefDescr;
  arColumn       : Array[1..MaxArray] of tColumnRecord;
  arButton       : Array[1..MaxArray] of Pointer;
  arText         : Array[1..MaxArray] of Pointer;

implementation

{$R *.DFM}

uses main;

procedure Tfrm_BriefDescr.BuildViewList;
begin
  qry_GetViews.Active := true;
  lst_View.Clear;

  while not( qry_GetViews.EOF) do
  begin
    lst_View.Items.Add( qry_GetViews.Fields[0].AsString + '.' +
                        qry_GetViews.Fields[1].AsString );
    qry_GetViews.Next;
  end;

  qry_GetViews.Active := false;
end;

procedure Tfrm_BriefDescr.ClearArray;
var
  b : Byte;
begin
  for b := 1 to MaxArray do
  begin
    arColumn[b].sName     := '';
    arColumn[b].bDataType := 99;
  end;
end;

function Tfrm_BriefDescr.CheckWord(name : String) : boolean;
  var
    i : integer;
  begin
    name := UpperCase(name);
    CheckWord := FALSE;
    for i := 0 to lst_ReservedWords.Items.Count-1 do
      begin
        if name = lst_ReservedWords.Items[i] then
          CheckWord := TRUE;
      end;
  end;

function Tfrm_BriefDescr.CheckSymbol(name : String) : boolean;
  var
    i : integer;
  begin
    name := UpperCase(name);
    CheckSymbol := FALSE;
    for i := 0 to lst_ReservedSymbols.Items.Count-1 do
      begin
        if Pos(lst_ReservedSymbols.Items[i][1],name) > 0 then
          CheckSymbol := TRUE;
      end;
  end;

function Tfrm_BriefDescr.ProcessInput : Boolean;
var
  b     : Byte;
  bPos  : Byte;
  bText : Byte;
  bNum  : Byte;
  bDate : Byte;
  sLine1: String;
  sLine2: String;
  sCount: String;
begin
  ProcessInput := false;
  Processed := false;
  if length(edt_NameOfView.Text) = 0 then
    begin
      MessageDlg('View name not specified. Please correct.', mtWarning,
                 [mbOK], 0);
      Exit;
    end;

  if CheckWord(edt_NameOfView.Text) then
    begin
      MessageDlg('View name is a reserved word. Please correct.', mtWarning,
                 [mbOK], 0);
      Exit;
    end;
  if CheckSymbol(edt_NameOfView.Text) then
    begin
      MessageDlg('View name contains a reserved symbol. Please correct.', mtWarning,
                 [mbOK], 0);
      Exit;
    end;

  mem_SQL.Lines.Clear;
  ClearArray;
  for b := 1 to MaxArray do
  begin
    bPos := StrToInt( TDBEdit(arButton[b]^).Text );
    if bPos > 15 then
    begin
      MessageDlg('Error. Sequence number may not be larger than 15.', mtWarning,
                 [mbOK], 0);
      TDBEdit(arButton[b]^).SetFocus;
      Exit;
    end;
    if bPos > 0 then
    begin
      arColumn[ bPos ].sName := TEdit(arText[b]^).Text;
      if Pos('Text', TDBedit(arText[b]^).Name ) > 0 then
        arColumn[ bPos ].bDataType := 0;
      if Pos('Number', TDBedit(arText[b]^).Name ) > 0 then
        arColumn[ bPos ].bDataType := 1;
      if Pos('Date', TButton(arText[b]^).Name ) > 0 then
        arColumn[ bPos ].bDataType := 2;
    end;
  end;

  bText := 0;
  bNum  := 0;
  bDate := 0;
  sLine1:= '';
  sLine2:= '';

  for b := 1 to MaxArray do
  begin
    if arColumn[b].bDataType <> 99 then
    begin
      if CheckWord(arColumn[b].sName) then
        begin
          Str(b,sCount);
          MessageDlg('Field '+sCount+' is a reserved word. Please correct.', mtWarning,
                     [mbOK], 0);
          Exit;
        end;
      if CheckSymbol(arColumn[b].sName) then
        begin
          Str(b,sCount);
          MessageDlg('Field '+sCount+' contains a reserved symbol. Please correct.', mtWarning,
                     [mbOK], 0);
          Exit;
        end;
      sLine1 := sLine1 + ', ' +arColumn[b].sName;

      case arColumn[b].bDataType of
        0 : begin
              Inc(bText);
              sLine2 := sLine2 + ', Text' + IntToStr(bText);
            end;
        1 : begin
              Inc(bNum);
              sLine2 := sLine2 + ', Number' + IntToStr(bNum);
            end;
        2 : begin
              Inc(bDate);
              sLine2 := sLine2 + ', Date' + IntToStr(bDate);
            end;
      end; {CASE}

    end;
  end;

  mem_SQL.Lines.Add('CREATE VIEW ' + edt_NameOfView.Text );
  mem_SQL.Lines.Add('  (BoxNumber, FileNumber' + sLine1 + ') AS ');
  mem_SQL.Lines.Add('  SELECT BoxNumber, FileNumber ' + sLine2);
  mem_SQL.Lines.Add('  FROM Files');
  ProcessInput := true;
  Processed := true;
end;

procedure Tfrm_BriefDescr.FormCreate(Sender: TObject);
begin
  ShowHint := frm_Console.bShowHints;
  Screen.Cursor := crHourglass;
  tbl_BriefDescription.Active := true;
  tbl_ViewDefinition.Active := true;

  arButton[1]  := @edt_No1;
  arButton[2]  := @edt_No2;
  arButton[3]  := @edt_No3;
  arButton[4]  := @edt_No4;
  arButton[5]  := @edt_No5;
  arButton[6]  := @edt_No6;
  arButton[7]  := @edt_No7;
  arButton[8]  := @edt_No8;
  arButton[9]  := @edt_No9;
  arButton[10] := @edt_No10;
  arButton[11] := @edt_No11;
  arButton[12] := @edt_No12;
  arButton[13] := @edt_No13;
  arButton[14] := @edt_No14;
  arButton[15] := @edt_No15;

  arText[1]  := @edt_Text1;
  arText[2]  := @edt_Text2;
  arText[3]  := @edt_Text3;
  arText[4]  := @edt_Text4;
  arText[5]  := @edt_Text5;
  arText[6]  := @edt_Text6;
  arText[7]  := @edt_Text7;
  arText[8]  := @edt_Text8;
  arText[9]  := @edt_Text9;
  arText[10] := @edt_Text10;
  arText[11] := @edt_Date1;
  arText[12] := @edt_Date2;
  arText[13] := @edt_Date3;
  arText[14] := @edt_Number1;
  arText[15] := @edt_Number2;

  ClearArray;
  ntb_BriefDesc.PageIndex := 0;
  BuildViewList;
  Top := 0;
  Left := 0;
  Height := 400;
  Width := 490;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_BriefDescr.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  mrResult : TModalResult;
begin
  if tbl_BriefDescription.State in [dsEdit, dsInsert] then
  begin
    mrResult := MessageDlg('Save the changes to the Brief Description Editor?',
                           mtConfirmation,
                           [mbYes, mbNo, mbAbort], 0);
    case mrResult of
      mrYes   : tbl_BriefDescription.Post;
      mrNo    : tbl_BriefDescription.Cancel;
      mrAbort : Exit;
    end;
  end;

  if tbl_ViewDefinition.State in [dsEdit, dsInsert] then
  begin
    mrResult := MessageDlg('Exit and Save the changes to the View Definition '+
                           'Editor?', mtConfirmation,
                           [mbYes, mbNo, mbAbort], 0);
    case mrResult of
      mrYes   : tbl_ViewDefinition.Post;
      mrNo    : tbl_ViewDefinition.Cancel;
      mrAbort : Exit;
    end;
  end;


  frm_Console.itm_Tools_BriefDescriptions.Enabled := True;
  Action := caFree;
end;


procedure Tfrm_BriefDescr.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_BriefDescr.nav_DescrViewsClick(Sender: TObject;
  Button: TNavigateBtn);
var
  b : Byte;
begin
  if (nav_DescrViews.Datasource = dts_ViewDefinition) and (Button = nbInsert) then
  begin
    for b := 1 to MaxArray do TDBEdit(arButton[b]^).Text := '0';
  end;

  if (nav_DescrViews.Datasource = dts_ViewDefinition) and
     ( (Button = nbInsert) or (Button = nbEdit) ) then
  begin
    Processed := false;
    btn_Show.Enabled := false;
    btn_Process.Enabled := true;
    edt_NameOfView.SetFocus;
  end else
  begin
    btn_Show.Enabled := true;
    btn_Process.Enabled := false;
  end;

  with nav_DescrViews do
  begin
    case Button of
      nbInsert  : VisibleButtons := [nbPost, nbCancel];
      {nbDelete  : VisibleButtons := [nbPost, nbCancel];}
      nbEdit    : VisibleButtons := [nbPost, nbCancel];
      nbPost    : VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast,
                                     nbInsert, nbDelete, nbEdit, nbRefresh];
      nbCancel  : VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast,
                                     nbInsert, nbDelete, nbEdit, nbRefresh];
    end;
  end;
end;

procedure Tfrm_BriefDescr.btn_SelectCompanyClick(Sender: TObject);
begin
  if frm_GetCompany.ShowModal = mrOK then
  begin
    edt_Code.Text := frm_GetCompany.CompanyCode;
    edt_Department.SetFocus;
  end;
end;

procedure Tfrm_BriefDescr.btn_SelectDeptClick(Sender: TObject);
begin
  if frm_GetDept.Execute(edt_Code.Text)  = mrOK then
  begin
    edt_Department.Text := frm_GetDept.DeptCode;
    edt_Description.SetFocus;
  end;
end;

procedure Tfrm_BriefDescr.btn_AdvanceClick(Sender: TObject);
begin
  grd_ShowView.Visible := false;
  btn_Show.Caption := 'Show';
  mem_SQL.Visible := not(mem_SQL.Visible);

  if mem_SQL.Visible then
    btn_Advance.Caption := 'Definition'
  else
    btn_Advance.Caption := 'SQL';
end;

procedure Tfrm_BriefDescr.btn_Click(Sender: TObject);
var
  bNum : Byte;
  iErr : Integer;
begin
  if (dts_ViewDefinition.State <> dsEdit) and (dts_ViewDefinition.State <> dsInsert)
  then Exit;

  Val( TDBEdit(Sender).Text, bNum, iErr);
  if iErr = 0 then
    Inc(bNum)
  else
    bNum := 0;

   if bNum > MaxArray then bNum := 0;

   TDBEdit(Sender).Text := IntToStr(bNum);
end;

procedure Tfrm_BriefDescr.btn_ProcessClick(Sender: TObject);
begin
  if ProcessInput then
    begin
      mem_SQL.Visible := true;
      btn_Advance.Caption := 'Definition';
    end;
end;

procedure Tfrm_BriefDescr.btn_CreateClick(Sender: TObject);
begin
  if not(ProcessInput) then Exit;
  qry_Create.Active := false;
  qry_Create.SQL.Clear;
  qry_Create.SQL.Assign( mem_SQL.Lines );
  try
    qry_Create.ExecSQL;
  except
    on EDBEngineError do
      begin
        MessageDlg('ERROR : View ' + edt_NameOfView.Text + ' was not created', mtError,
                   [mbOK], 0);
        Exit;
      end;
  end;
  MessageDlg('View ' + edt_NameOfView.Text + ' was created', mtInformation,
             [mbOK], 0);
end;

procedure Tfrm_BriefDescr.btn_DropClick(Sender: TObject);
begin
  qry_DropView.Active := false;
  qry_DropView.SQl.Clear;
  qry_DropView.SQL.Add('if exists (select * from sysobjects');
  qry_DropView.SQL.Add('           where id = object_id("'+ edt_NameOfView.Text +
                      '") and');
  qry_DropView.SQL.Add('           sysstat & 0xf = 2)');
  qry_DropView.SQL.Add('  drop view ' + edt_NameOfView.Text );
  qry_DropView.ExecSQL;
  MessageDlg('The view '+ edt_NameOfView.Text + ' was dropped from the database',
              mtInformation, [mbOK], 0);
end;

procedure Tfrm_BriefDescr.ntb_BriefDescChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  if ntb_BriefDesc.PageIndex <> 2 then
  begin
    if (dts_BriefDescription.State = dsEdit) or
       (dts_BriefDescription.State = dsInsert) or
       (dts_ViewDefinition.State = dsEdit) or
       (dts_ViewDefinition.State = dsInsert) then
    begin
      AllowChange := false;
      Exit;
    end;
  end;

  case NewTab of
    0 : nav_DescrViews.DataSource  := dts_BriefDescription;
    1 : nav_DescrViews.DataSource  := dts_ViewDefinition;
  end;
end;

procedure Tfrm_BriefDescr.btn_RefreshViewsClick(Sender: TObject);
begin
  BuildViewList;
end;

procedure Tfrm_BriefDescr.lst_ViewClick(Sender: TObject);
var
  sView : String;
  bPos  : Byte;
begin
  if lst_View.ItemIndex > -1 then
  begin
    if (dts_BriefDescription.State = dsEdit) or
       (dts_BriefDescription.State = dsInsert) then
    begin
      sView := lst_View.Items [ lst_View.ItemIndex ];
      bPos := Pos('.', sView);
      if bPos > 0 then
        edt_ViewName.Text := Copy(sView,bPos+1, length(sView)-bPos)
      else
        edt_ViewName.Text := sView;
      end;
  end;
end;

procedure Tfrm_BriefDescr.btn_ShowClick(Sender: TObject);
var
  i : Integer;
begin
  if grd_ShowView.Visible then
  begin
    btn_Show.Caption := 'Show';
    grd_ShowView.Visible := false;
    Exit;
  end;

  with qry_View do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from ');
    SQL.Add(edt_UserName.Text + '.' + edt_NameOfView.Text);
    SQL.Add(' where filenumber < "0"');
    Open;
    for i := 0 to FieldCount-1 do
    begin
      qry_View.Fields[i].DisplayWidth := 10;
    end;
  end;

  btn_Show.Caption := 'Hide';
  grd_ShowView.Visible := true;
end;

procedure Tfrm_BriefDescr.tbl_ViewDefinitionBeforePost(DataSet: TDataset);
begin
  if not Processed then
    raise ENotProcessed.Create('View definition not processed.'+chr(13)+chr(10)+'Please press Process button before Posting.');
  Processed := false;
end;

procedure Tfrm_BriefDescr.btn_ViewClick(Sender: TObject);
var
  i : Integer;
begin
  if lst_View.ItemIndex > -1 then
  begin
    with qry_View do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from ');
        SQL.Add(lst_View.Items[lst_View.ItemIndex]);
        SQL.Add(' where filenumber = "bogus"');
        Open;
        for i := 0 to FieldCount-1 do
          qry_View.Fields[i].DisplayWidth := 10;
      end;

    grd_View.Visible := true;
    MessageDlg('View ' + lst_View.Items[ lst_View.ItemIndex ] + ' displayed',
               mtInformation, [mbOK], 0);

  end;
end;

procedure Tfrm_BriefDescr.edt_CodeChange(Sender: TObject);
begin
  qry_GetCompany.Active := false;
  qry_GetCompany.ParamByName('Code').AsString := edt_Code.Text;
  qry_GetCompany.Active := true;
  lbl_CompanyName.Caption := qry_GetCompany.Fields[0].AsString;
  qry_GetCompany.Active := false;
  if length(edt_Department.Text) > 0 then
  begin
    qry_GetDept.Active := false;
    qry_GetDept.ParamByName('Code').AsString := edt_Code.Text;
    qry_GetDept.ParamByName('Dept').AsString := edt_Department.Text;
    qry_GetDept.Active := true;
    lbl_DeptName.Caption := qry_GetDept.Fields[0].AsString;
    qry_GetDept.Active := false;
  end;
end;

procedure Tfrm_BriefDescr.tbl_ViewDefinitionAfterPost(DataSet: TDataset);
var
  bError : Boolean;
begin
  try
    qry_DropView.Active := false;
    qry_DropView.SQl.Clear;
    qry_DropView.SQL.Add('if exists (select * from sysobjects');
    qry_DropView.SQL.Add('           where id = object_id("'+ edt_NameOfView.Text +
                        '") and');
    qry_DropView.SQL.Add('           sysstat & 0xf = 2)');
    qry_DropView.SQL.Add('  drop view ' + edt_NameOfView.Text );
    qry_DropView.ExecSQL;
  except
    on EDatabaseError do
    begin
      if MessageDlg('Failed to drop the view. It may mean that you are not '+
                    'not the owner of the view and have insufficient rights '+
                    'granted by the owner. This error can also indicate that'+
                    'you are trying to create a view with a reserved name'+
                    'Continue?',
                    mtWarning, [mbYes, mbNo], 0) = mrNo then Exit;
    end;
  end;

  qry_Create.Active := false;

  if mem_SQL.Lines.Count < 1 then
  begin
    mem_SQL.Visible := true;
    MessageDlg('An error has occured - the CREATE VIEW SQL was not created!',
                mtWarning, [mbAbort], 0);
    Exit;
  end;

  try
    qry_Create.SQL.Clear;
    qry_Create.SQL.Assign( mem_SQL.Lines );
    qry_Create.ExecSQL;
    bError := false;
  except
    on EDatabaseError do
    begin
      MessageDlg('Failed to create the view. The VIEW possibly contains '+
                 'reserved word(s). Please edit this View Definition and '+
                 'correct it as it can not be used in Box and File Capture.',
                      mtWarning, [mbAbort], 0);
      bError := true;
    end;
  end;

  if not(bError) then
  begin
    qry_Create.SQL.Clear;
    qry_Create.SQL.Add('GRANT ALL ON '+edt_UserName.Text+'.'+ edt_NameOfView.Text +
                      ' TO PUBLIC');
    qry_Create.ExecSQL;
    MessageDlg('View ' + edt_NameOfView.Text + ' was created', mtInformation,
               [mbOK], 0);

  end;

end;

procedure Tfrm_BriefDescr.btn_KeyPress(Sender: TObject; var Key: Char);
begin
  if not( Key in ['0'..'9', #8 ] ) then Key := #0;

end;

procedure Tfrm_BriefDescr.btn_Exit(Sender: TObject);
begin
  if StrToInt( TDBEdit(Sender).Text ) > 15 then
    TDBEdit(Sender).Text := '0';
end;

procedure Tfrm_BriefDescr.tblViewDefinitionAfterInsertOrEdit(DataSet: TDataset);
begin
//  edt_UserName.Text :=  frm_Console.sOperator;
  mem_SQL.Lines.Add(' ');
end;

procedure Tfrm_BriefDescr.edt_DepartmentChange(Sender: TObject);
begin
  qry_GetDept.Active := false;
  qry_GetDept.ParamByName('Code').AsString := edt_Code.Text;
  qry_GetDept.ParamByName('Dept').AsString := edt_Department.Text;
  qry_GetDept.Active := true;
  lbl_DeptName.Caption := qry_GetDept.Fields[0].AsString;
  qry_GetDept.Active := false;
end;

procedure Tfrm_BriefDescr.btn_FindClick(Sender: TObject);
var
  sCode, sDept, sBDescr : String;
begin
  if ntb_BriefDesc.PageIndex = 0 then
  begin
    if frm_GetBriefDescr.Execute = mrOK then
    begin
      Screen.Cursor := crHourglass;
      {with tblBriefDescription do
      begin
        EditRangeStart;
        FieldByName('Code').AsString := frmGetBriefDescr.Code;
        if length(frmGetBriefDescr.Dept) > 0 then
          FieldByName('Department').AsString := frmGetBriefDescr.Dept;
        if length(frmGetBriefDescr.BriefDescr) > 0 then
          FieldByName('Description').AsString := frmGetBriefDescr.BriefDescr;

        EditRangeEnd;
        FieldByName('Code').AsString := frmGetBriefDescr.Code;
        if length(frmGetBriefDescr.Dept) > 0 then
          FieldByName('Department').AsString := frmGetBriefDescr.Dept;
        if length(frmGetBriefDescr.BriefDescr) > 0  then
          FieldByName('Description').AsString := frmGetBriefDescr.BriefDescr;

        ApplyRange;
      end;}
      sCode := frm_GetBriefDescr.Code;
      sDept := frm_GetBriefDescr.Dept;
      sBDescr := frm_GetBriefDescr.BriefDescr;
      if not( tbl_BriefDescription.FindKey( [sCode,sDept,sBDescr] ) ) then
      begin
        Screen.Cursor := crDefault;
        MessageDlg('ERROR: Failed to find specified Brief Description', mtWarning,
                   [mbOK], 0);
      end;
      Screen.Cursor := crDefault;
    end;
  end else
  begin
    if frm_ViewList.Execute = mrOK then
    begin
      Screen.Cursor := crHourglass;
      with tbl_ViewDefinition do
      begin
        EditRangeStart; { Set the beginning key }
        FieldByName('ViewName').AsString := frm_ViewList.ViewName;
        EditRangeEnd; { Set the ending key }
        FieldByName('ViewName').AsString := frm_ViewList.ViewName;
        ApplyRange; { Tell the dataset to establish the range }
      end;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure Tfrm_BriefDescr.BuildLookupList;
var
  sTemp : string;
begin
{
  with qry_Lookup do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ColumnHeading, Item from lookup_text ');
      SQL.Add('where code = :CD and department = :DP ');
      SQL.Add('and description = :DES ');
      SQL.Add('order by columnheading ');
      ParambyName('CD').AsString := edt_Code.Text;
      ParambyName('DP').AsString := edt_Department.Text;
      ParambyName('DES').AsString := edt_Description.Text;
      Open;
      lst_Heading.Items.Clear;
      lst_Item.Items.Clear;
      while not eof do
        begin
          lst_Heading.Items.Add(FieldbyName('ColumnHeading').AsString);
          lst_Item.Items.Add(FieldbyName('Item').AsString);
          Next;
        end;
      Close;
    end;
}
end;

procedure Tfrm_BriefDescr.dts_BriefDescriptionDataChange(Sender: TObject;
  Field: TField);
begin
  edt_LookHeading.Text := '';
  edt_LookItem.Text := '';
  BuildLookupList;
end;

procedure Tfrm_BriefDescr.btn_AddLookupClick(Sender: TObject);
begin
  if (edt_LookHeading.Text = '') or (edt_LookItem.Text = '') then
    begin
      MessageDlg('Please type or choose a heading and item first.',
        mtInformation,[mbOk], 0);
      Exit;
    end;
  with qry_Lookup do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT lookup_text (ColumnHeading,Code,Department,Description,Item)');
      SQL.Add('VALUES (:CH,:CD,:DP,:DES,:ITEM)');
      ParambyName('CD').AsString := edt_Code.Text;
      ParambyName('DP').AsString := edt_Department.Text;
      ParambyName('DES').AsString := edt_Description.Text;
      ParambyName('CH').AsString := edt_LookHeading.Text;
      ParambyName('ITEM').AsString := edt_LookItem.Text;
      ExecSQL;
      Close;
    end;
  BuildLookupList;
end;

procedure Tfrm_BriefDescr.lst_HeadingClick(Sender: TObject);
begin
  lst_Item.ItemIndex := lst_Heading.ItemIndex;
  edt_LookHeading.Text := lst_Heading.Items[lst_Heading.ItemIndex];
  edt_LookItem.Text := lst_Item.Items[lst_Item.ItemIndex];
end;

procedure Tfrm_BriefDescr.lst_ItemClick(Sender: TObject);
begin
  lst_Heading.ItemIndex := lst_Item.ItemIndex;
  edt_LookHeading.Text := lst_Heading.Items[lst_Heading.ItemIndex];
  edt_LookItem.Text := lst_Item.Items[lst_Item.ItemIndex];
end;

procedure Tfrm_BriefDescr.btn_DelLookupClick(Sender: TObject);
begin
  if (edt_LookHeading.Text = '') or (edt_LookItem.Text = '') then
    begin
      MessageDlg('Please type or choose a heading and item first.',
        mtInformation,[mbOk], 0);
      Exit;
    end;
  with qry_Lookup do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from lookup_text ');
      SQL.Add('where code = :CD and department = :DP ');
      SQL.Add('and description = :DES and ColumnHeading = :CH ');
      SQL.Add('and Item = :ITEM ');
      ParambyName('CD').AsString := edt_Code.Text;
      ParambyName('DP').AsString := edt_Department.Text;
      ParambyName('DES').AsString := edt_Description.Text;
      ParambyName('CH').AsString := lst_Heading.Items[lst_Heading.ItemIndex];
      ParambyName('ITEM').AsString := lst_Item.Items[lst_Item.ItemIndex];
      ExecSQL;
      Close;
    end;
  BuildLookupList;
end;

procedure Tfrm_BriefDescr.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

end.

