//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit Location;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DBCtrls, ExtCtrls, DB, DBTables, Grids, DBGrids,
  DBLookup, Mask, Buttons, TabNotBk, ComCtrls, ADODB;

type
  Tfrm_Locations = class(TForm)
    qry_SQL: TADOQuery;
    qry_DisWhouse: TADOQuery;
    dts_DisWhouse: TDataSource;
    dts_WHouse: TDataSource;
    qry_DelLocation: TADOQuery;
    qry_TestLoc: TADOQuery;
    qry_ExecProc: TADOQuery;
    qry_WHouse: TADOQuery;
    qry_BoxTypes: TADOQuery;
    pnl_Top: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btn_Close: TSpeedButton;
    ScrollBox1: TScrollBox;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    lbl_BoxType: TLabel;
    edRow: TEdit;
    edBayFrom: TEdit;
    edLevelFrom: TEdit;
    Panel2: TPanel;
    btn_ExecProc: TBitBtn;
    btn_Delete: TBitBtn;
    edBayTo: TEdit;
    edLevelTo: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBCheckBox1: TDBCheckBox;
    cmb_BoxTypes: TComboBox;
    cb_LocLen: TComboBox;
    ScrollBox2: TScrollBox;
    dbgridLocation: TDBGrid;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    DisQry: TBitBtn;
    Label41: TLabel;
    lbl_WHouse: TLabel;
    edt_WHouse: TEdit;
    btn_SelWHouse: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_ExecProcClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure edTextKeyPress(Sender: TObject; var Key: Char);
    procedure edRowKeyPress(Sender: TObject; var Key: Char);
    procedure DisQryClick(Sender: TObject);
    procedure genLocation(Warehouse :string;Row :string;bay :integer;rlevel :integer);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure cb_LocLenChange(Sender: TObject);
    procedure btn_SelWHouseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Locations: Tfrm_Locations;

implementation

uses main, MetrofilerDatamodule, SelWHouse;

{$R *.DFM}

procedure Tfrm_Locations.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_Whouse.Close;
  qry_DisWhouse.Close;
  frm_Console.act_Locations.Enabled := True;
  Action := caFree;
end;

procedure Tfrm_Locations.FormCreate(Sender: TObject);
begin
  DBCheckBox1.Visible := (frm_Console.fEntMan = 1)or(frm_Console.fWareMan = 1);

  qry_Whouse.Open;
  qry_BoxTypes.Open;
  while Not(qry_BoxTypes.EOF) do
    begin
      cmb_BoxTypes.Items.Add(qry_BoxTypes.FieldByName('ContType').AsString);
      qry_BoxTypes.Next;
    end;
  qry_BoxTypes.Close;
  cmb_BoxTypes.ItemIndex := 0;

  PageControl1.ActivePageIndex := 0;
end;

procedure  Tfrm_Locations.genLocation(Warehouse :string;Row :string;bay :integer;rlevel :integer);
var
  TBay,TLevel :string;
begin
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('insert into location(Warehouse, RowNum, Bay, LevelNum, BoxNumber, Used,LocNo)');
  qry_SQL.SQL.Add('values (:Warehouse, :RowNum, :Bay, :LevelNum,:BoxNumber, :Used,:LocNo)');
  qry_SQL.Parameters.ParamByName('Warehouse').Value := Warehouse;
  qry_SQL.Parameters.ParamByName('RowNum').Value := Row;
  qry_SQL.Parameters.ParamByName('Bay').Value := bay;
  qry_SQL.Parameters.ParamByName('LevelNum').Value := rlevel;
  qry_SQL.Parameters.ParamByName('BoxNumber').Value := '';
  qry_SQL.Parameters.ParamByName('Used').Value := 'N';
  If cb_Loclen.ItemIndex = 1 Then
    begin
      if bay > 99 then
        TBay := InttoStr(bay)
      else if bay > 9 then
        TBay := '0' + IntToStr(bay)
      else TBay := '00' + IntToStr(bay);
    end
  else
    begin
      if bay > 9 then
        TBay := IntToStr(bay)
      else TBay := '0' + IntToStr(bay);
    end;
  if rlevel < 10 then
    TLevel := '0' + IntToStr(rlevel)
  else TLevel := IntToStr(rlevel);
//-----------------
//Test For Duplicate
//-----------------
  qry_TestLoc.Close;
  qry_TestLoc.SQL.Clear;
  qry_TestLoc.SQL.Add('select LocNo from location where warehouse = :mWare and LocNo = :mLoc');
  qry_TestLoc.Parameters.ParamByName('mWare').Value := warehouse;
  qry_TestLoc.Parameters.ParamByName('mLoc').Value := Row + TBay + TLevel;
  qry_TestLoc.Open;
  if qry_TestLoc.isEmpty then
     begin
       qry_SQL.Parameters.ParamByName('LocNo').Value := Row + TBay + TLevel;
       qry_SQL.ExecSQL;
     end
  else MessageDlg('Duplicate location, warehouse ' + warehouse + ', LocNo: ' + Row + TBay + TLevel,mtError,[mbOK],0);
  qry_TestLoc.Close;
end;


procedure Tfrm_Locations.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Locations.btn_ExecProcClick(Sender: TObject);
var
  iFromL, iToL : Integer;
  iFromB, iToB : Integer;
  i,j          : Integer;
  Flag3D       : Boolean;
begin
  if MessageDlg('Are you sure that the location(s) are correct?', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
    Exit;

  if length(TRIM(edRow.Text)) < 2 then
    begin
      MessageDlg('The Row must be 2 Alpha Numeric characters', mtInformation, [mbOK], 0);
      edRow.SetFocus;
      Exit;
    end;
  if length(edLevelFrom.Text) = 0 then
    begin
      MessageDlg('Please specify the FROM level number', mtInformation, [mbOK], 0);
      edLevelFrom.SetFocus;
      Exit;
    end;
  if length(edLevelTo.Text) = 0 then
    edLevelTo.Text := edLevelFrom.Text;
  if length(edBayFrom.Text) = 0 then
    begin
      MessageDlg('Please specify the FROM bay number', mtInformation, [mbOK], 0);
      edBayFrom.SetFocus;
      Exit;
    end;
  if length(edBayTo.Text) = 0 then
    edBayTo.Text := edBayFrom.Text;

  iFromL := StrToInt(edLevelFrom.Text);
  iToL   := StrToInt(edLevelTo.Text);
  iFromB := StrToInt(edBayFrom.Text);
  iToB   := StrToInt(edBayTo.Text);

  if (iFromL < 0) or (iToL < 0) or (iFromB < 0) or (iToB < 0) then
    begin
      MessageDlg('Negative numbers are not allowed', mtWarning, [mbOK], 0);
      edLevelFrom.SetFocus;
      Exit;
    end;

  if (iFromL > iToL) then
    begin
      MessageDlg('From Level is bigger than To Level.', mtWarning, [mbOK], 0);
      edLevelFrom.SetFocus;
      Exit;
    end;

  if (iFromB > iToB) then
    begin
      MessageDlg('From Bay is bigger than To Bay.', mtWarning, [mbOK], 0);
      edBayFrom.SetFocus;
      Exit;
    end;

  Flag3D := False;
  if qry_Whouse.FieldByName('D3Flag').AsInteger = 1 then
    Flag3D := True;
  Screen.Cursor := crHourglass;
  for i := iFromB to iToB do
    begin
      for j := iFromL to iToL do
        begin
          if Flag3D then
            begin
              qry_ExecProc.Close;
              qry_ExecProc.SQL.Clear;
              qry_ExecProc.SQL.Add('EXEC sp_genlocation :boxtype, :warehouse, :row, :bay, :level, :loclen');
              qry_ExecProc.Parameters.ParamByName('BoxType').Value := cmb_BoxTypes.Items[cmb_BoxTypes.ItemIndex];
              qry_ExecProc.Parameters.ParamByName('Warehouse').Value := qry_WHouse.FieldbyName('Warehouse').asString;
              qry_ExecProc.Parameters.ParamByName('Row').Value := edRow.Text;
              qry_ExecProc.Parameters.ParamByName('Bay').Value := i;
              qry_ExecProc.Parameters.ParamByName('Level').Value := j;
              If cb_Loclen.ItemIndex = 1 Then
                qry_ExecProc.Parameters.ParamByName('loclen').Value := 1
              else qry_ExecProc.Parameters.ParamByName('Loclen').Value := 0;
              qry_Execproc.ExecSQL;
            end
          else genLocation(qry_WHouse.FieldbyName('Warehouse').asString, edRow.Text, i, j);
        end;
    end;
  edRow.Text := '';
  edBayFrom.Text := '';
  edBayTo.Text := '';
  edLevelFrom.Text := '';
  edLevelTo.Text := '';
  Screen.Cursor := crDefault;
  MessageDLG('Location generation complete',mtInformation,[MBOK],0);
end;

procedure Tfrm_Locations.btn_SelWHouseClick(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  frm_SelWHouse.Flag3D := -1;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_WHouse.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_WHouse.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfrm_Locations.btn_DeleteClick(Sender: TObject);
var
  iFromL, iToL : Integer;
  iFromB, iToB : Integer;
  i,j          : Integer;
begin
  if MessageDlg('Are you sure that the location(s) are empty and must be deleted?',
                mtConfirmation, [mbYes,mbNo], 0 ) = mrNo then
                exit;

  if length(edLevelFrom.Text) = 0 then
    begin
      MessageDlg('Please specify the FROM level number', mtInformation, [mbOK], 0);
      edLevelFrom.SetFocus;
      Exit;
    end;
  if length(edLevelTo.Text) = 0 then
    edLevelTo.Text := edLevelFrom.Text;

  if length(edBayFrom.Text) = 0 then
    begin
      MessageDlg('Please specify the FROM bay number', mtInformation, [mbOK], 0);
      edBayFrom.SetFocus;
      Exit;
    end;
  if length(edBayTo.Text) = 0 then
    edBayTo.Text := edBayFrom.Text;

  iFromL := StrToInt(edLevelFrom.Text);
  iToL   := StrToInt(edLevelTo.Text);
  iFromB := StrToInt(edBayFrom.Text);
  iToB   := StrToInt(edBayTo.Text);

  if (iFromL < 0) or (iToL < 0) or (iFromB < 0) or (iToB < 0) then
    begin
      MessageDlg('Negative numbers are not allowed', mtWarning, [mbOK], 0);
      Exit;
    end;

  if (iFromL > iToL) then
    begin
      MessageDlg('From Level is bigger than To Level.', mtWarning, [mbOK], 0);
      edLevelFrom.SetFocus;
      Exit;
    end;

  if (iFromB > iToB) then
    begin
      MessageDlg('From Bay is bigger than To Bay.', mtWarning, [mbOK], 0);
      edBayFrom.SetFocus;
      Exit;
    end;
  Screen.Cursor := crHourglass;
//---------------------------------
//Do Delete
//---------------------------------
  for i := iFromB to iToB do
    begin
      for j := iFromL to iToL do
        begin
          qry_DelLocation.Close;
          qry_DelLocation.SQL.Clear;
          qry_DelLocation.SQL.Add('delete from location');
          qry_DelLocation.SQL.Add('where Warehouse = :mWare');
          qry_DelLocation.SQL.Add('and RowNum = :mRow');
          qry_DelLocation.SQL.Add('and Bay = :mBay');
          qry_DelLocation.SQL.Add('and  LevelNum  = :mLevel');
          qry_DelLocation.Parameters.ParamByName('mWare').Value := qry_WHouse.FieldbyName('Warehouse').asString;
          qry_DelLocation.Parameters.ParamByName('mRow').Value := edRow.Text;
          qry_DelLocation.Parameters.ParamByName('mBay').Value := i;
          qry_DelLocation.Parameters.ParamByName('mLevel').Value := j;
          qry_DelLocation.ExecSQL;
        end;
    end;
  Screen.Cursor := crDefault;
  edRow.Text := '';
  edBayFrom.Text := '';
  edBayTo.Text := '';
  edLevelFrom.Text := '';
  edLevelTo.Text := '';
  MessageDLG('Positions deleted successfully',mtInformation,[mbOK],0);
end;

procedure Tfrm_Locations.edTextKeyPress(Sender: TObject;
  var Key: Char);
begin
  if  Not( (Key in ['0','1','2','3','4','5','6','7','8','9']) or (Key = #08) )
    then Key := #0;
end;

procedure Tfrm_Locations.edRowKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#0..#31,'A'..'Z','a'..'z']) then
    Key := #0;
end;

procedure Tfrm_Locations.DisQryClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  qry_DisWhouse.Close;
  qry_DisWhouse.SQL.Clear;
  qry_DisWhouse.SQL.Add('select * from location');
  qry_DisWhouse.SQL.Add('where warehouse = :code');
  qry_DisWhouse.SQL.Add('order by rownum, bay, levelnum');
  qry_DisWhouse.Parameters.ParamByName('Code').Value := edt_WHouse.Text;
  qry_DisWhouse.Open;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_Locations.DBLookupComboBox1CloseUp(Sender: TObject);
Var
  indx   :integer;
begin
  indx := cb_loclen.ItemIndex;
  if qry_Whouse.FieldByName('D3Flag').AsInteger = 1 then
    begin
      cmb_BoxTypes.Visible := true;
      lbl_BoxType.Visible := true;
      cb_LocLen.Clear;
      cb_LocLen.Items.Append('12 Digit Loc');
      cb_LocLen.Items.Append('13 Digit Loc');
    end
  else
    begin
      cmb_BoxTypes.Visible := false;
      lbl_BoxType.Visible := false;
      cb_LocLen.Clear;
      cb_LocLen.Items.Append('6 Digit Loc');
      cb_LocLen.Items.Append('7 Digit Loc');
    end;
  cb_loclen.ItemIndex := indx;
end;

procedure Tfrm_Locations.cb_LocLenChange(Sender: TObject);
begin
  If cb_loclen.ItemIndex = 0 Then
    begin
      edBayFrom.MaxLength := 2;
      edBayTo.MaxLength := 2;
      edBayFrom.Text := copy(edBayFrom.Text, 1, 2);
      edBayTo.Text := copy(edBayTo.Text, 1, 2);
    end
  else
    begin
      edBayFrom.MaxLength := 3;
      edBayTo.MaxLength := 3;
    end
end;

end.
