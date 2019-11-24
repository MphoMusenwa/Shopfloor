unit OffsiteContainerSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, DBCtrls, StdCtrls, Buttons, ToolWin, Mask, Db,
  DBTables, Grids, DBGrids;

type
  Tfrm_OffsiteContainerSearch = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    BitBtn1: TBitBtn;
    ToolButton3: TToolButton;
    nav: TDBNavigator;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label40: TLabel;
    Label41: TLabel;
    Label45: TLabel;
    Label48: TLabel;
    Label30: TLabel;
    btn_Search: TBitBtn;
    editWCode: TDBEdit;
    edt_Department: TComboBox;
    ScrollBox2: TScrollBox;
    lbl_Text1: TLabel;
    lbl_Text2: TLabel;
    lbl_Text3: TLabel;
    lbl_Text4: TLabel;
    lbl_Text5: TLabel;
    lbl_Text6: TLabel;
    Field1: TLabel;
    field2: TLabel;
    field3: TLabel;
    field4: TLabel;
    field5: TLabel;
    field6: TLabel;
    field7: TLabel;
    field8: TLabel;
    lbl_Date1: TLabel;
    lbl_Date2: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    lbl_No1: TLabel;
    lbl_No2: TLabel;
    Label54: TLabel;
    edt_Text1: TEdit;
    edt_Text2: TEdit;
    edt_Text3: TEdit;
    edt_Text4: TEdit;
    edt_Text5: TEdit;
    edt_Text6: TEdit;
    edt_No1: TEdit;
    edt_No2: TEdit;
    editRecordType: TDBLookupComboBox;
    edt_Branch: TComboBox;
    edt_WareHouse: TDBLookupComboBox;
    Panel5: TPanel;
    Label28: TLabel;
    NoRecs: TLabel;
    qry_Branch: TQuery;
    dts_Whouse: TDataSource;
    qry_Dept: TQuery;
    qry_FileType: TQuery;
    dts_FileType: TDataSource;
    qry_ConSearch: TQuery;
    qry_ConSearchContainer: TStringField;
    qry_ConSearchWarehouse: TStringField;
    qry_ConSearchWare_Name: TStringField;
    qry_ConSearchText1: TStringField;
    qry_ConSearchText2: TStringField;
    qry_ConSearchText3: TStringField;
    qry_ConSearchText4: TStringField;
    qry_ConSearchText5: TStringField;
    qry_ConSearchText6: TStringField;
    qry_ConSearchDate1: TDateTimeField;
    qry_ConSearchDate2: TDateTimeField;
    qry_ConSearchNumber1: TIntegerField;
    qry_ConSearchNumber2: TIntegerField;
    qry_ConSearchFileType: TStringField;
    qry_ConSearchIssueStatus: TStringField;
    qry_ConSearchDepartment: TStringField;
    qry_ConSearchDept_Name: TStringField;
    qry_ConSearchBranch_Name: TStringField;
    dts_ConSearch: TDataSource;
    DBGrid1: TDBGrid;
    Date1: TDateTimePicker;
    Date2: TDateTimePicker;
    qry_WHouse: TQuery;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure edt_BranchKeyPress(Sender: TObject; var Key: Char);
    procedure edt_DepartmentKeyPress(Sender: TObject; var Key: Char);
    procedure edt_BranchChange(Sender: TObject);
    procedure edt_DepartmentChange(Sender: TObject);
    procedure editRecordTypeCloseUp(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure BuildBranch;
  public
    { Public declarations }
  end;

var
  frm_OffsiteContainerSearch: Tfrm_OffsiteContainerSearch;

implementation

Uses Main;

{$R *.DFM}

procedure Tfrm_OffsiteContainerSearch.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := Tabsheet1;
//=============================build the branch=================================
  qry_Branch.Active := false;
  qry_Branch.Params[0].AsString := User;
  qry_Branch.Active := true;
  BuildBranch;
  qry_Branch.Active := false;
//============================build the warehouse===============================
  qry_WHouse.Active := false;
  qry_WHouse.Params[0].AsString := User;
  qry_WHouse.Active := true;
  qry_WHouse.First;
//==============================================================================
  Date1.Date := Now;
  Date2.Date := Now;
end;

procedure Tfrm_OffsiteContainerSearch.BuildBranch;
begin
  qry_Branch.First;
  if qry_Branch.EOF then
    begin
      MessageDlg('No Branch Rights have been granted to you!!',mtError,[mbOK],0);
      exit;
    end;
  while not( qry_Branch.EOF ) do
    begin
      edt_Branch.Items.Add(qry_Branch.FieldByName('Name').AsString);
      qry_Branch.Next;
    end;                //while ! eof()
end;

procedure Tfrm_OffsiteContainerSearch.edt_BranchKeyPress(Sender: TObject;
  var Key: Char);
begin
  If ord(Key) = 8 Then
    begin
      edt_Branch.Text := '';
    end
  else abort;
end;

procedure Tfrm_OffsiteContainerSearch.edt_DepartmentKeyPress(Sender: TObject;
  var Key: Char);
begin
  If ord(Key) = 8 Then
    begin
      edt_Department.Text := '';
    end
  else abort;
end;

procedure Tfrm_OffsiteContainerSearch.edt_BranchChange(Sender: TObject);
var
  dcode :string;
begin
  edt_Department.Items.Clear;
  qry_Dept.Active := false;
  qry_Dept.Params[0].AsString := User;
  qry_Dept.Params[1].AsString := edt_Branch.Text;
  if qry_Dept.Params[1].AsString > '' then
    begin
      qry_Dept.Active := true;
      qry_Dept.First;
      if qry_Dept.isEmpty then
        begin
          qry_Dept.Active := false;
          exit;
        end;
      edt_Department.Items.Clear;
      while not( qry_Dept.EOF ) do
        begin
          edt_Department.Items.Add(qry_Dept.FieldByName('DeptName').AsString);
          qry_Dept.Next;
        end;
      qry_Dept.Active := false;
    end;
end;

procedure Tfrm_OffsiteContainerSearch.edt_DepartmentChange(Sender: TObject);
begin
  IF edt_Department.Text > '' then
    begin
      qry_FileType.Active := false;
      qry_FileType.Params[0].AsString := edt_Department.Text;
      qry_FileType.Active := true;
    end;
end;


procedure Tfrm_OffsiteContainerSearch.editRecordTypeCloseUp(Sender: TObject);
begin
//========================Labels================================================
  lbl_Text1.Visible := False;
  lbl_Text2.Visible := False;
  lbl_Text3.Visible := False;
  lbl_Text4.Visible := False;
  lbl_Text5.Visible := False;
  lbl_Text6.Visible := False;
  lbl_Date1.Visible := False;
  lbl_Date2.Visible := False;
  lbl_No1.Visible := False;
  lbl_No2.Visible := False;
//========================EditBoxes=============================================
  edt_Text1.Visible := False;
  edt_Text2.Visible := False;
  edt_Text3.Visible := False;
  edt_Text4.Visible := False;
  edt_Text5.Visible := False;
  edt_Text6.Visible := False;
  Date1.Visible := False;
  Date1.Checked := False;
  Date2.Visible := False;
  Date2.Checked := False;
  edt_No1.Visible := False;
  edt_No2.Visible := False;
//========================Fiels=================================================
  qry_ConSearch.FieldByName('TEXT1').Visible := False;
  qry_ConSearch.FieldByName('TEXT2').Visible := False;
  qry_ConSearch.FieldByName('TEXT3').Visible := False;
  qry_ConSearch.FieldByName('TEXT4').Visible := False;
  qry_ConSearch.FieldByName('TEXT5').Visible := False;
  qry_ConSearch.FieldByName('TEXT6').Visible := False;
  qry_ConSearch.FieldByName('DATE1').Visible := False;
  qry_ConSearch.FieldByName('DATE2').Visible := False;
  qry_ConSearch.FieldByName('NUMBER1').Visible := False;
  qry_ConSearch.FieldByName('NUMBER2').Visible := False;
//==============================================================================
  With qry_FileType Do
    begin
      If length(FieldbyName('COL1').asString) > 0 Then
        begin
          lbl_Text1.Visible := True;
          edt_Text1.Visible := True;
          qry_ConSearch.FieldByName('TEXT1').Visible := True;
          lbl_Text1.Caption := FieldbyName('COL1').asString;
          qry_ConSearch.FieldByName('TEXT1').DisplayLabel := FieldbyName('COL1').asString;
        end;
      If length(FieldbyName('COL2').asString) > 0 Then
        begin
          lbl_Text2.Visible := True;
          edt_Text2.Visible := True;
          qry_ConSearch.FieldByName('TEXT2').Visible := True;
          lbl_Text2.Caption := FieldbyName('COL2').asString;
          qry_ConSearch.FieldByName('TEXT2').DisplayLabel := FieldbyName('COL2').asString;
        end;
      If length(FieldbyName('COL3').asString) > 0 Then
        begin
          lbl_Text3.Visible := True;
          edt_Text3.Visible := True;
          qry_ConSearch.FieldByName('TEXT3').Visible := True;
          lbl_Text3.Caption := FieldbyName('COL3').asString;
          qry_ConSearch.FieldByName('TEXT3').DisplayLabel := FieldbyName('COL3').asString;
        end;
      If length(FieldbyName('COL4').asString) > 0 Then
        begin
          lbl_Text4.Visible := True;
          edt_Text4.Visible := True;
          qry_ConSearch.FieldByName('TEXT4').Visible := True;
          lbl_Text4.Caption := FieldbyName('COL4').asString;
          qry_ConSearch.FieldByName('TEXT4').DisplayLabel := FieldbyName('COL4').asString;
        end;
      If length(FieldbyName('COL5').asString) > 0 Then
        begin
          lbl_Text5.Visible := True;
          edt_Text5.Visible := True;
          qry_ConSearch.FieldByName('TEXT5').Visible := True;
          lbl_Text5.Caption := FieldbyName('COL5').asString;
          qry_ConSearch.FieldByName('TEXT5').DisplayLabel := FieldbyName('COL5').asString;
        end;
      If length(FieldbyName('COL6').asString) > 0 Then
        begin
          lbl_Text6.Visible := True;
          edt_Text6.Visible := True;
          qry_ConSearch.FieldByName('TEXT6').Visible := True;
          lbl_Text6.Caption := FieldbyName('COL6').asString;
          qry_ConSearch.FieldByName('TEXT6').DisplayLabel := FieldbyName('COL6').asString;
        end;
      If length(FieldbyName('COL7').asString) > 0 Then
        begin
          lbl_Date1.Visible := True;
          Date2.Visible := True;
          qry_ConSearch.FieldByName('DATE1').Visible := True;
          lbl_Date1.Caption := FieldbyName('COL7').asString;
          qry_ConSearch.FieldByName('DATE1').DisplayLabel := FieldbyName('COL7').asString;
        end;
      If length(FieldbyName('COL8').asString) > 0 Then
        begin
          lbl_Date2.Visible := True;
          Date2.Visible := True;
          qry_ConSearch.FieldByName('DATE2').Visible := True;
          lbl_Date2.Caption := FieldbyName('COL8').asString;
          qry_ConSearch.FieldByName('DATE2').DisplayLabel := FieldbyName('COL8').asString;
        end;
      If length(FieldbyName('COL9').asString) > 0 Then
        begin
          lbl_No1.Visible := True;
          edt_No1.Visible := True;
          qry_ConSearch.FieldByName('NUMBER1').Visible := True;
          lbl_No1.Caption := FieldbyName('COL9').asString;
          qry_ConSearch.FieldByName('NUMBER1').DisplayLabel := FieldbyName('COL9').asString;
        end;
      If length(FieldbyName('COL10').asString) > 0 Then
        begin
          lbl_No2.Visible := True;
          edt_No2.Visible := True;
          qry_ConSearch.FieldByName('NUMBER2').Visible := True;
          lbl_No2.Caption := FieldbyName('COL10').asString;
          qry_ConSearch.FieldByName('NUMBER2').DisplayLabel := FieldbyName('COL10').asString;
        end;
    end;
end;


procedure Tfrm_OffsiteContainerSearch.btn_SearchClick(Sender: TObject);
Var
  SQLText  :String;
begin
  if (length(editRecordType.Text) = 0) Then
    begin
      MessageDlg('Please select the Record Type ',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
  qry_ConSearch.Active := False;
  qry_ConSearch.SQL.Clear;
  qry_ConSearch.SQL.Add('SELECT Container, IssueStatus, Text1, Text2, Text3, Text4, Text5,');
  qry_ConSearch.SQL.Add('Text6, Date1, Date2, Number1, Number2, FileType, Warehouse, Ware_Name,');
  qry_ConSearch.SQL.Add('Department, Dept_Name, Branch_Name');
  qry_ConSearch.SQL.Add('FROM Containers');
  qry_ConSearch.SQL.Add('WHERE (Branch_Name = :BN)AND(FileType = :FT)AND(Dept_Name = :DN)');
  SQLText := '';
  If length(edt_Warehouse.Text) > 0 Then
    SQLText := 'AND(Ware_Name = :WH)';
  If length(edt_Text1.Text) > 0 Then
    SQLText := 'AND(Text1 = :T1)';
  If length(edt_Text2.Text) > 0 Then
    SQLText := 'AND(Text2 = :T2)';
  If length(edt_Text3.Text) > 0 Then
    SQLText := 'AND(Text3 = :T3)';
  If length(edt_Text4.Text) > 0 Then
    SQLText := 'AND(Text4 = :T4)';
  If length(edt_Text5.Text) > 0 Then
    SQLText := 'AND(Text5 = :T5)';
  If length(edt_Text6.Text) > 0 Then
    SQLText := 'AND(Text6 = :T6)';
  If Date1.Checked Then
    SQLText := 'AND(Date1 = :D1)';
  If Date2.Checked Then
    SQLText := 'AND(Date2 = :D2)';
  If length(edt_No1.Text) > 0 Then
    SQLText := 'AND(Number1 = :N1)';
  If length(edt_No2.Text) > 0 Then
    SQLText := 'AND(Number2 = :N2)';
  qry_ConSearch.SQL.Add(SQLText);
//==============================================================================
  qry_ConSearch.ParamByName('BN').asString := edt_Branch.Text;
  qry_ConSearch.ParamByName('FT').asString := editRecordType.Text;
  qry_ConSearch.ParamByName('DN').asString := edt_Department.Text;
  If length(edt_Warehouse.Text) > 0 Then
    qry_ConSearch.ParamByName('WH').asString := edt_Warehouse.Text;
  If length(edt_Text1.Text) > 0 Then
    qry_ConSearch.ParamByName('T1').asString := '%'+edt_Text1.Text+'%';
  If length(edt_Text2.Text) > 0 Then
    qry_ConSearch.ParamByName('T2').asString := '%'+edt_Text2.Text+'%';
  If length(edt_Text3.Text) > 0 Then
    qry_ConSearch.ParamByName('T3').asString := '%'+edt_Text3.Text+'%';
  If length(edt_Text4.Text) > 0 Then
    qry_ConSearch.ParamByName('T4').asString := '%'+edt_Text4.Text+'%';
  If length(edt_Text5.Text) > 0 Then
    qry_ConSearch.ParamByName('T5').asString := '%'+edt_Text5.Text+'%';
  If length(edt_Text6.Text) > 0 Then
    qry_ConSearch.ParamByName('T6').asString := '%'+edt_Text6.Text+'%';
  If Date1.Checked Then
    qry_ConSearch.ParamByName('D1').asDateTime := Trunc(Date1.Date);
  If Date2.Checked Then
    qry_ConSearch.ParamByName('D2').asDateTime := Trunc(Date2.Date);
  If length(edt_No1.Text) > 0 Then
    qry_ConSearch.ParamByName('N1').asInteger := StrtoInt(edt_No1.Text);
  If length(edt_No2.Text) > 0 Then
    qry_ConSearch.ParamByName('N2').asInteger := StrtoInt(edt_No2.Text);
  qry_ConSearch.Active := True;
  If not qry_ConSearch.IsEmpty Then
    begin
      NoRecs.Caption := InttoStr(qry_ConSearch.RecordCount);
      PageControl1.ActivePage := Tabsheet2;
    end
  else ShowMessage('No Results Found!!');
end;

procedure Tfrm_OffsiteContainerSearch.PageControl1Change(Sender: TObject);
begin
  If PageControl1.ActivePage = Tabsheet1 Then
    begin
      qry_Consearch.Active := False;
      nav.Visible := False;
    end
  else If PageControl1.ActivePage = Tabsheet2 Then
    begin
      nav.Visible := True;
    end;
end;

procedure Tfrm_OffsiteContainerSearch.BitBtn1Click(Sender: TObject);
begin
  If qry_ConSearch.Active Then
    If not qry_ConSearch.IsEmpty Then
      begin
        ModalResult := mrOK;
        exit;
      end;
  Showmessage('Please search for a Container first!!');
end;


procedure Tfrm_OffsiteContainerSearch.FormShow(Sender: TObject);
begin
  Height := 438;
  Width := 678;
end;



end.
