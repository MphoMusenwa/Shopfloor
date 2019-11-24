//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit ContainerSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, DBCtrls, StdCtrls, Buttons, ToolWin, Mask, Db,
  DBTables, Grids, DBGrids, ADODB;

type
  Tfrm_ContainerSearch = class(TForm)
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
    Panel5: TPanel;
    Label28: TLabel;
    NoRecs: TLabel;
    qry_FileType: TADOQuery;
    DBGrid1: TDBGrid;
    Date1: TDateTimePicker;
    Date2: TDateTimePicker;
    Label1: TLabel;
    lbl_CBranchSrc: TLabel;
    edt_CBranchSrc: TEdit;
    btn_SelBranch: TButton;
    lbl_CDeptSrc: TLabel;
    edt_CDeptSrc: TEdit;
    btn_SelDept: TButton;
    btn_SelRecordType: TButton;
    edt_CRTypeSrc: TEdit;
    lbl_cWHouseSrc: TLabel;
    edt_cWHouseSrc: TEdit;
    btn_SelWHouse: TButton;
    qry_ConSearch: TADOQuery;
    dts_ConSearch: TDataSource;
    qry_ConSearchContainer: TStringField;
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
    qry_ConSearchDepartment: TStringField;
    qry_ConSearchBranch: TStringField;
    qry_ConSearchWarehouse: TStringField;
    qry_ConSearchIssueStatus: TStringField;
    ToolButton2: TToolButton;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_CBranchSrcChange(Sender: TObject);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure edt_CDeptSrcChange(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure edt_CRTypeSrcChange(Sender: TObject);
    procedure btn_SelRecordTypeClick(Sender: TObject);
    procedure edt_cWHouseSrcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_SelWHouseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ContainerSearch: Tfrm_ContainerSearch;

implementation

Uses Main, SelBranch, SelDept, SelRType, SelWHouse, MetrofilerDataModule;

{$R *.DFM}

procedure Tfrm_ContainerSearch.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := Tabsheet1;
  Date1.Date := Now;
  Date2.Date := Now;
end;

procedure Tfrm_ContainerSearch.btn_SearchClick(Sender: TObject);
Var
  SQLText  :String;
begin
  if (length(edt_CRTypeSrc.Text) = 0) Then
    begin
      MessageDlg('Please select the Record Type ',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
  qry_ConSearch.Active := False;
  qry_ConSearch.SQL.Clear;
  qry_ConSearch.SQL.Add('SELECT Container, IssueStatus, Text1, Text2, Text3, Text4, Text5,');
  qry_ConSearch.SQL.Add('Text6, Date1, Date2, Number1, Number2, FileType, Warehouse,');
  qry_ConSearch.SQL.Add('Department, Branch');
  qry_ConSearch.SQL.Add('FROM Containers');
  qry_ConSearch.SQL.Add('WHERE (Branch = :BN)AND(FileType = :FT)AND(Department = :DN)and(Code = :CC)');
  SQLText := '';
  If length(edt_cWHouseSrc.Text) > 0 Then
    SQLText := SQLText + 'AND(Warehouse = :WH)';
  If length(edt_Text1.Text) > 0 Then
    SQLText := SQLText + 'AND(Text1 = :T1)';
  If length(edt_Text2.Text) > 0 Then
    SQLText := SQLText + 'AND(Text2 = :T2)';
  If length(edt_Text3.Text) > 0 Then
    SQLText := SQLText + 'AND(Text3 = :T3)';
  If length(edt_Text4.Text) > 0 Then
    SQLText := SQLText + 'AND(Text4 = :T4)';
  If length(edt_Text5.Text) > 0 Then
    SQLText := SQLText + 'AND(Text5 = :T5)';
  If length(edt_Text6.Text) > 0 Then
    SQLText := SQLText + 'AND(Text6 = :T6)';
  If Date1.Checked Then
    SQLText := SQLText + 'AND(Date1 = :D1)';
  If Date2.Checked Then
    SQLText := SQLText + 'AND(Date2 = :D2)';
  If length(edt_No1.Text) > 0 Then
    SQLText := SQLText + 'AND(Number1 = :N1)';
  If length(edt_No2.Text) > 0 Then
    SQLText := SQLText + 'AND(Number2 = :N2)';
  qry_ConSearch.SQL.Add(SQLText);
//==============================================================================
  qry_ConSearch.Parameters.ParamByName('BN').Value := edt_CBranchSrc.Text;
  qry_ConSearch.Parameters.ParamByName('CC').Value := CompsCode;
  qry_ConSearch.Parameters.ParamByName('FT').Value := edt_CRTypeSrc.Text;
  qry_ConSearch.Parameters.ParamByName('DN').Value := edt_CDeptSrc.Text;
  If length(edt_cWHouseSrc.Text) > 0 Then
    qry_ConSearch.Parameters.ParamByName('WH').Value := edt_cWHouseSrc.Text;
  If length(edt_Text1.Text) > 0 Then
    qry_ConSearch.Parameters.ParamByName('T1').Value := ''+edt_Text1.Text+'';
  If length(edt_Text2.Text) > 0 Then
    qry_ConSearch.Parameters.ParamByName('T2').Value := ''+edt_Text2.Text+'';
  If length(edt_Text3.Text) > 0 Then
    qry_ConSearch.Parameters.ParamByName('T3').Value := ''+edt_Text3.Text+'';
  If length(edt_Text4.Text) > 0 Then
    qry_ConSearch.Parameters.ParamByName('T4').Value := ''+edt_Text4.Text+'';
  If length(edt_Text5.Text) > 0 Then
    qry_ConSearch.Parameters.ParamByName('T5').Value := ''+edt_Text5.Text+'';
  If length(edt_Text6.Text) > 0 Then
    qry_ConSearch.Parameters.ParamByName('T6').Value := ''+edt_Text6.Text+'';
  If Date1.Checked Then
    qry_ConSearch.Parameters.ParamByName('D1').Value := Trunc(Date1.Date);
  If Date2.Checked Then
    qry_ConSearch.Parameters.ParamByName('D2').Value := Trunc(Date2.Date);
  If length(edt_No1.Text) > 0 Then
    qry_ConSearch.Parameters.ParamByName('N1').Value := StrtoInt(edt_No1.Text);
  If length(edt_No2.Text) > 0 Then
    qry_ConSearch.Parameters.ParamByName('N2').Value := StrtoInt(edt_No2.Text);
  qry_ConSearch.Active := True;
  If not qry_ConSearch.IsEmpty Then
    begin
      NoRecs.Caption := InttoStr(qry_ConSearch.RecordCount);
      PageControl1.ActivePage := Tabsheet2;
    end
  else ShowMessage('No Results Found!!');
end;

procedure Tfrm_ContainerSearch.PageControl1Change(Sender: TObject);
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

procedure Tfrm_ContainerSearch.BitBtn1Click(Sender: TObject);
begin
  If qry_ConSearch.Active Then
    If not qry_ConSearch.IsEmpty Then
      begin
        ModalResult := mrOK;
        exit;
      end;
  Showmessage('Please search for a Container first!!');
end;


procedure Tfrm_ContainerSearch.FormShow(Sender: TObject);
begin
  Height := 438;
  Width := 678;
end;


procedure Tfrm_ContainerSearch.edt_CBranchSrcChange(Sender: TObject);
begin
  edt_CDeptSrc.Text := '';
  lbl_CDeptSrc.Caption := '---';
end;

procedure Tfrm_ContainerSearch.btn_SelBranchClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_CBranchSrc.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_CBranchSrc.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_ContainerSearch.edt_CDeptSrcChange(Sender: TObject);
begin
  edt_CRTypeSrc.Text := '';
end;

procedure Tfrm_ContainerSearch.btn_SelDeptClick(Sender: TObject);
begin
  If length(edt_CBranchSrc.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_CBranchSrc.Text, User) = mrOK Then
    begin
      edt_CDeptSrc.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_CDeptSrc.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_ContainerSearch.edt_CRTypeSrcChange(Sender: TObject);
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
      Active := false;
      SQL.Clear;
      SQL.Add('select col1,col2,col3,col4,col5,col6,col7,col8,col9,col10 from IndexDefinitions WHERE Description = :mtype');
      Parameters.ParamByName('mType').Value := edt_CRTypeSrc.Text;
      Active := true;
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
      Close;
    end;
end;

procedure Tfrm_ContainerSearch.btn_SelRecordTypeClick(Sender: TObject);
begin
  If length(edt_CDeptSrc.Text) = 0 Then
    begin
      Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(False,
                          edt_CBranchSrc.Text,
                          edt_CDeptSrc.Text,
                          User,
                          True,
                          False,
                          False,
                          False,
                          False) = mrOK Then
    edt_CRTypeSrc.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_ContainerSearch.edt_cWHouseSrcKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_cWHouseSrc.Text := '';
      lbl_cWHouseSrc.Caption := '---';
    end;
end;

procedure Tfrm_ContainerSearch.btn_SelWHouseClick(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  frm_SelWHouse.Flag3D := 1;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_cWHouseSrc.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_cWHouseSrc.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

end.
