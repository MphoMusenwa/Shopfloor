unit eRecSrchSpec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ADODB, Buttons, DateUtils;

type
  Tfrm_SearcheRecords = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbl_RecordCat: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    edt_DeptGroup: TEdit;
    edt_RecordTypeGroup: TEdit;
    edt_RecordCatGroup: TEdit;
    edt_ColGroup1: TEdit;
    edt_ColGroup2: TEdit;
    edt_ColGroup3: TEdit;
    edt_ColGroup4: TEdit;
    edt_ColGroup5: TEdit;
    edt_ColGroup6: TEdit;
    edt_ColGroup7: TEdit;
    edt_ColGroup8: TEdit;
    edt_ColGroup9: TEdit;
    edt_ColGroup10: TEdit;
    edt_BranchGroup: TEdit;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    edt_Dept: TEdit;
    btn_SelDept: TButton;
    edt_RecordType: TEdit;
    btn_SelRType: TButton;
    btn_OK: TButton;
    btn_Cancel: TButton;
    btn_Clear: TButton;
    btn_Help: TButton;
    cb_RecordCat: TComboBox;
    qry_RecCat: TADOQuery;
    qry_RecordType: TADOQuery;
    qry_Lookup: TADOQuery;
    cb_Col1: TComboBox;
    cb_Col2: TComboBox;
    cb_Col3: TComboBox;
    cb_Col4: TComboBox;
    cb_Col5: TComboBox;
    cb_Col6: TComboBox;
    cb_Col7: TComboBox;
    cb_Col8: TComboBox;
    cb_Col9: TComboBox;
    cb_Col10: TComboBox;
    Label8: TLabel;
    Shape5: TShape;
    chk_DeptCollapse: TCheckBox;
    chk_RecordTypeCollapse: TCheckBox;
    chk_RecordCatCollapse: TCheckBox;
    chk_BranchCollapse: TCheckBox;
    Shape6: TShape;
    chk_ColCollapse1: TCheckBox;
    chk_ColCollapse2: TCheckBox;
    chk_ColCollapse3: TCheckBox;
    chk_ColCollapse4: TCheckBox;
    chk_ColCollapse5: TCheckBox;
    chk_ColCollapse6: TCheckBox;
    chk_ColCollapse7: TCheckBox;
    chk_ColCollapse8: TCheckBox;
    chk_ColCollapse9: TCheckBox;
    chk_ColCollapse10: TCheckBox;
    lbl_Col11: TLabel;
    lbl_Col14: TLabel;
    lbl_Col15: TLabel;
    lbl_Col12: TLabel;
    lbl_Col13: TLabel;
    edt_ColGroup11: TEdit;
    edt_ColGroup12: TEdit;
    edt_ColGroup13: TEdit;
    edt_ColGroup14: TEdit;
    edt_ColGroup15: TEdit;
    chk_ColCollapse11: TCheckBox;
    chk_ColCollapse12: TCheckBox;
    chk_ColCollapse13: TCheckBox;
    chk_ColCollapse14: TCheckBox;
    chk_ColCollapse15: TCheckBox;
    cb_Col14: TComboBox;
    cb_Col15: TComboBox;
    edt_FrDate1: TEdit;
    btn_FrDate1: TSpeedButton;
    lbl_btDate1: TLabel;
    edt_ToDate1: TEdit;
    btn_ToDate1: TSpeedButton;
    edt_FrDate2: TEdit;
    btn_FrDate2: TSpeedButton;
    lbl_btDate2: TLabel;
    edt_ToDate2: TEdit;
    btn_ToDate2: TSpeedButton;
    edt_FrDate3: TEdit;
    btn_FrDate3: TSpeedButton;
    lbl_btDate3: TLabel;
    edt_ToDate3: TEdit;
    btn_ToDate3: TSpeedButton;
    chk_Partial: TCheckBox;
    Label9: TLabel;
    Shape7: TShape;
    edt_DeptSort: TEdit;
    edt_RecordTypeSort: TEdit;
    edt_RecordCatSort: TEdit;
    edt_BranchSort: TEdit;
    Shape8: TShape;
    edt_ColSort1: TEdit;
    edt_ColSort2: TEdit;
    edt_ColSort3: TEdit;
    edt_ColSort4: TEdit;
    edt_ColSort5: TEdit;
    edt_ColSort6: TEdit;
    edt_ColSort7: TEdit;
    edt_ColSort8: TEdit;
    edt_ColSort9: TEdit;
    edt_ColSort10: TEdit;
    edt_ColSort11: TEdit;
    edt_ColSort12: TEdit;
    edt_ColSort13: TEdit;
    edt_ColSort14: TEdit;
    edt_ColSort15: TEdit;
    cb_BranchSortOpt: TComboBox;
    cb_DeptSortOpt: TComboBox;
    cb_RecordTypeSortOpt: TComboBox;
    cb_RecordCatSortOpt: TComboBox;
    cb_ColSortOpt1: TComboBox;
    cb_ColSortOpt2: TComboBox;
    cb_ColSortOpt3: TComboBox;
    cb_ColSortOpt4: TComboBox;
    cb_ColSortOpt5: TComboBox;
    cb_ColSortOpt6: TComboBox;
    cb_ColSortOpt7: TComboBox;
    cb_ColSortOpt8: TComboBox;
    cb_ColSortOpt9: TComboBox;
    cb_ColSortOpt10: TComboBox;
    cb_ColSortOpt11: TComboBox;
    cb_ColSortOpt12: TComboBox;
    cb_ColSortOpt13: TComboBox;
    cb_ColSortOpt14: TComboBox;
    cb_ColSortOpt15: TComboBox;
    lbl_Branch: TLabel;
    lbl_Dept: TLabel;
    procedure edt_BranchGroupKeyPress(Sender: TObject; var Key: Char);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_SelRTypeClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure cb_Col1DropDown(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure btn_FrDate1Click(Sender: TObject);
    procedure btn_FrDate2Click(Sender: TObject);
    procedure btn_FrDate3Click(Sender: TObject);
    procedure btn_ToDate1Click(Sender: TObject);
    procedure btn_ToDate2Click(Sender: TObject);
    procedure btn_ToDate3Click(Sender: TObject);
    procedure edt_BranchGroupChange(Sender: TObject);
    procedure edt_BranchSortChange(Sender: TObject);
    procedure edt_RecordTypeChange(Sender: TObject);
    procedure edt_BranchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_DeptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_RecordTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_BranchChange(Sender: TObject);
    procedure edt_DeptChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Initialize(RefreshCookies :Boolean);
    function Execute:Integer;
  end;

var
  frm_SearcheRecords: Tfrm_SearcheRecords;

implementation

uses SelBranch, SelDept, MetrofilerDataModule, main, SelRType, getdate;

{$R *.dfm}

function Tfrm_SearcheRecords.Execute:Integer;
begin
  Result := ShowModal;
end;


procedure Tfrm_SearcheRecords.Initialize(RefreshCookies :Boolean);
Var
  J               :Integer;
  BranchCookie    :String;
  DepartmentCookie:String;
  RecordTypeCookie:String;
  RecordCatCookie :String;
begin
  edt_BranchGroup.Text := '';
  edt_BranchSort.Text := '';
  cb_BranchSortOpt.ItemIndex := 0;
  edt_Branch.Text := '';
  lbl_Branch.Caption := '';
  chk_BranchCollapse.Checked := True;
//----
  edt_DeptGroup.Text := '';
  edt_DeptSort.Text := '';
  cb_DeptSortOpt.ItemIndex := 0;
  edt_Dept.Text := '';
  lbl_Dept.Caption := '';
  chk_DeptCollapse.Checked := True;
//----
  edt_RecordType.Text := '';
  edt_RecordTypeGroup.Text := '';
  edt_RecordTypeSort.Text := '';
  cb_RecordTypeSortOpt.ItemIndex := 0;
  chk_RecordTypeCollapse.Checked := True;
//----
  edt_RecordCatGroup.Text := '';
  edt_RecordCatSort.Text := '';
  cb_RecordCatSortOpt.ItemIndex := 0;
  chk_RecordCatCollapse.Checked := True;
  cb_RecordCat.Items.Clear;
//----Text Fields
  For J := 1 to 10 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColGroup'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
      TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J))).Visible := False;
      TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J))).Visible := False;
      TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J))).Checked := True;
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Visible := False;
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text := '';
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Items.Clear;
    end;
//----Date Fields
  For J := 11 to 13 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColGroup'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
      TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J))).Visible := False;
      TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J))).Visible := False;
      TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J))).Checked := True;
      TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Visible := False;
      TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Text := '';
      TSpeedbutton(FindComponent('btn_FrDate'+InttoStr(J-10))).Visible := False;
      TLabel(FindComponent('lbl_btDate'+InttoStr(J-10))).Visible := False;
      TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Visible := False;
      TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Text := '';
      TSpeedbutton(FindComponent('btn_ToDate'+InttoStr(J-10))).Visible := False;
    end;
//----Num Fields
  For J := 14 to 15 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColGroup'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
      TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J))).Visible := False;
      TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J))).Visible := False;
      TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J))).Checked := True;
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Visible := False;
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text := '';
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Items.Clear;
    end;

  If not RefreshCookies Then
    exit;
//============Get Cookies=======================================================
  BranchCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieERecManBranch);
  DepartmentCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieERecManDepartment);
  RecordTypeCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieERecManRecordType);
  RecordCatCookie := dm_Metrofiler.GetSearchCookie(dm_Metrofiler.CookieERecManRecordCat);

  if BranchCookie <> '' then
    begin
      frm_SelBranch.OpenDbOnly(User);
      if frm_SelBranch.qry_Branch.Locate('Branch', BranchCookie, []) then
        begin
          edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
          lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
        end;
      frm_SelBranch.qry_Branch.Close;
    end;

  if DepartmentCookie <> '' then
    begin
      If length(edt_Branch.Text) = 0 Then
        begin
          Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
          exit;
        end;
      frm_SelDept.OpenDbOnly(edt_Branch.Text, User);
      if frm_SelDept.qry_Dept.Locate('Department', DepartmentCookie, []) then
        begin
          edt_Dept.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
          lbl_Dept.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
        end;
      frm_SelDept.qry_Dept.Close;
    end;

  if RecordTypeCookie <> '' then
    begin
      If length(edt_Dept.Text) = 0 Then
        begin
          Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
          exit;
        end;
      frm_SelRType.OpenDbOnly(edt_Branch.Text,
                              edt_Dept.Text,
                              User,
                              False,
                              False,
                              False,
                              True,
                              False);
      If frm_SelRType.qry_RType.Locate('Description', RecordTypeCookie, []) Then
        begin
          edt_RecordType.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
        end;
      frm_SelRType.qry_RType.Close;
    end;

  If cb_RecordCat.Items.IndexOf(RecordCatCookie) <> -1 Then
    cb_RecordCat.ItemIndex := cb_RecordCat.Items.IndexOf(RecordCatCookie);
end;



procedure Tfrm_SearcheRecords.edt_BranchChange(Sender: TObject);
begin
  edt_Dept.Text := '';
  lbl_Dept.Caption := '';
end;

procedure Tfrm_SearcheRecords.edt_BranchGroupChange(Sender: TObject);
begin
  If trim(TEdit(Sender).Text) <> '' Then
    begin
      If TEdit(Sender).Name = 'edt_BranchGroup' Then edt_BranchSort.Text := '';
      If TEdit(Sender).Name = 'edt_DeptGroup' Then edt_DeptSort.Text := '';
      If TEdit(Sender).Name = 'edt_RecordTypeGroup' Then edt_RecordTypeSort.Text := '';
      If TEdit(Sender).Name = 'edt_RecordCatGroup' Then edt_RecordCatSort.Text := '';

      If TEdit(Sender).Name = 'edt_ColGroup1' Then edt_ColSort1.Text := '';
      If TEdit(Sender).Name = 'edt_ColGroup2' Then edt_ColSort2.Text := '';
      If TEdit(Sender).Name = 'edt_ColGroup3' Then edt_ColSort3.Text := '';
      If TEdit(Sender).Name = 'edt_ColGroup4' Then edt_ColSort4.Text := '';
      If TEdit(Sender).Name = 'edt_ColGroup5' Then edt_ColSort5.Text := '';
      If TEdit(Sender).Name = 'edt_ColGroup6' Then edt_ColSort6.Text := '';
      If TEdit(Sender).Name = 'edt_ColGroup7' Then edt_ColSort7.Text := '';
      If TEdit(Sender).Name = 'edt_ColGroup8' Then edt_ColSort8.Text := '';
      If TEdit(Sender).Name = 'edt_ColGroup9' Then edt_ColSort9.Text := '';
      If TEdit(Sender).Name = 'edt_ColGroup10' Then edt_ColSort10.Text := '';
      If TEdit(Sender).Name = 'edt_ColGroup11' Then edt_ColSort11.Text := '';
      If TEdit(Sender).Name = 'edt_ColGroup12' Then edt_ColSort12.Text := '';
      If TEdit(Sender).Name = 'edt_ColGroup13' Then edt_ColSort13.Text := '';
      If TEdit(Sender).Name = 'edt_ColGroup14' Then edt_ColSort14.Text := '';
      If TEdit(Sender).Name = 'edt_ColGroup15' Then edt_ColSort15.Text := '';
    end;
end;

procedure Tfrm_SearcheRecords.edt_BranchGroupKeyPress(Sender: TObject;
  var Key: Char);
begin
  If (Key <> '0')and
     (Key <> '1')and
     (Key <> '2')and
     (Key <> '3')and
     (Key <> '4')and
     (Key <> '5')and
     (Key <> '6')and
     (Key <> '7')and
     (Key <> '8')and
     (ord(Key) <> 8)and //BackSpace
     (Key <> '9')Then
    abort;
end;

procedure Tfrm_SearcheRecords.edt_BranchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_Branch.Text := '';
      lbl_Branch.Caption := '---';
    end;
end;

procedure Tfrm_SearcheRecords.edt_BranchSortChange(Sender: TObject);
begin
  If trim(TEdit(Sender).Text) <> '' Then
    begin
      If TEdit(Sender).Name = 'edt_BranchSort' Then edt_BranchGroup.Text := '';
      If TEdit(Sender).Name = 'edt_DeptSort' Then edt_DeptGroup.Text := '';
      If TEdit(Sender).Name = 'edt_RecordTypeSort' Then edt_RecordTypeGroup.Text := '';
      If TEdit(Sender).Name = 'edt_RecordCatSort' Then edt_RecordCatGroup.Text := '';

      If TEdit(Sender).Name = 'edt_ColSort1' Then edt_ColGroup1.Text := '';
      If TEdit(Sender).Name = 'edt_ColSort2' Then edt_ColGroup2.Text := '';
      If TEdit(Sender).Name = 'edt_ColSort3' Then edt_ColGroup3.Text := '';
      If TEdit(Sender).Name = 'edt_ColSort4' Then edt_ColGroup4.Text := '';
      If TEdit(Sender).Name = 'edt_ColSort5' Then edt_ColGroup5.Text := '';
      If TEdit(Sender).Name = 'edt_ColSort6' Then edt_ColGroup6.Text := '';
      If TEdit(Sender).Name = 'edt_ColSort7' Then edt_ColGroup7.Text := '';
      If TEdit(Sender).Name = 'edt_ColSort8' Then edt_ColGroup8.Text := '';
      If TEdit(Sender).Name = 'edt_ColSort9' Then edt_ColGroup9.Text := '';
      If TEdit(Sender).Name = 'edt_ColSort10' Then edt_ColGroup10.Text := '';
      If TEdit(Sender).Name = 'edt_ColSort11' Then edt_ColGroup11.Text := '';
      If TEdit(Sender).Name = 'edt_ColSort12' Then edt_ColGroup12.Text := '';
      If TEdit(Sender).Name = 'edt_ColSort13' Then edt_ColGroup13.Text := '';
      If TEdit(Sender).Name = 'edt_ColSort14' Then edt_ColGroup14.Text := '';
      If TEdit(Sender).Name = 'edt_ColSort15' Then edt_ColGroup15.Text := '';
    end
  else
    begin
      If TEdit(Sender).Name = 'edt_BranchSort' Then cb_BranchSortOpt.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_DeptSort' Then cb_DeptSortOpt.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_RecordTypeSort' Then cb_RecordTypeSortOpt.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_RecordCatSort' Then cb_RecordCatSortOpt.ItemIndex := 0;

      If TEdit(Sender).Name = 'edt_ColSort1' Then cb_ColSortOpt1.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_ColSort2' Then cb_ColSortOpt2.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_ColSort3' Then cb_ColSortOpt3.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_ColSort4' Then cb_ColSortOpt4.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_ColSort5' Then cb_ColSortOpt5.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_ColSort6' Then cb_ColSortOpt6.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_ColSort7' Then cb_ColSortOpt7.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_ColSort8' Then cb_ColSortOpt8.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_ColSort9' Then cb_ColSortOpt9.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_ColSort10' Then cb_ColSortOpt10.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_ColSort11' Then cb_ColSortOpt11.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_ColSort12' Then cb_ColSortOpt12.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_ColSort13' Then cb_ColSortOpt13.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_ColSort14' Then cb_ColSortOpt14.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_ColSort15' Then cb_ColSortOpt15.ItemIndex := 0;
    end;
end;

procedure Tfrm_SearcheRecords.edt_DeptChange(Sender: TObject);
begin
  edt_RecordType.Text := '';
end;

procedure Tfrm_SearcheRecords.edt_DeptKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edt_Dept.Text := '';
  lbl_Dept.Caption := '---';
end;

procedure Tfrm_SearcheRecords.edt_RecordTypeChange(Sender: TObject);
Var
  J, T   :Integer;
  ACol   :String;
  AValue :String;
begin
//==============================================================================
//============Clear Fields======================================================
//==============================================================================
//----Text Fields
  For J := 1 to 10 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColGroup'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
      TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColGroup'+InttoStr(J))).Text := '';
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
      TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J))).ItemIndex := 0;
      TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J))).Visible := False;
      TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J))).Checked := True;
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Visible := False;
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text := '';
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Items.Clear;
    end;
//----Date Fields
  For J := 11 to 13 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColGroup'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
      TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColGroup'+InttoStr(J))).Text := '';
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
      TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J))).ItemIndex := 0;
      TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J))).Visible := False;
      TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J))).Checked := True;
      TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Visible := False;
      TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Text := '';
      TSpeedbutton(FindComponent('btn_FrDate'+InttoStr(J-10))).Visible := False;
      TLabel(FindComponent('lbl_btDate'+InttoStr(J-10))).Visible := False;
      TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Visible := False;
      TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Text := '';
      TSpeedbutton(FindComponent('btn_ToDate'+InttoStr(J-10))).Visible := False;
    end;
//----Num Fields
  For J := 14 to 15 Do
    begin
      TLabel(FindComponent('lbl_Col'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColGroup'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Visible := False;
      TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J))).Visible := False;
      TEdit(FindComponent('edt_ColGroup'+InttoStr(J))).Text := '';
      TEdit(FindComponent('edt_ColSort'+InttoStr(J))).Text := '';
      TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J))).ItemIndex := 0;
      TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J))).Visible := False;
      TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J))).Checked := True;
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Visible := False;
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text := '';
      TComboBox(FindComponent('cb_Col'+InttoStr(J))).Items.Clear;
    end;
//==============================================================================
//============Setup Fields======================================================
//==============================================================================
  If edt_RecordType.Text <> '' Then
    begin
      qry_RecordType.Close;
      qry_RecordType.SQL.Clear;
      qry_RecordType.SQL.Add('SELECT COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15, UseRecordCat');
      qry_RecordType.SQL.Add('FROM IndexDefinitions');
      qry_RecordType.SQL.Add('WHERE Description = :DS');
      qry_RecordType.Parameters.ParamByName('DS').Value := edt_RecordType.Text;
      qry_RecordType.Open;
//-----
      T := 156-24;
//-----
      for J := 0 to qry_RecordType.FieldCount-1 do        //Only interested in the Description Fields
        begin
          ACol := trim(UpperCase(qry_RecordType.Fields[J].FieldName));
          AValue :=  trim(qry_RecordType.Fields[J].asString);
          If AValue = '' Then
            Continue;
          if (ACol = 'COL1') or            //Text Fields
             (ACol = 'COL2') or
             (ACol = 'COL3') or
             (ACol = 'COL4') or
             (ACol = 'COL5') or
             (ACol = 'COL6') or
             (ACol = 'COL7') or
             (ACol = 'COL8') or
             (ACol = 'COL9') or
             (ACol = 'COL10') then
            begin
              Inc(T, 24);
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Caption := AValue+' :';
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Visible := True;
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Top := T;
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Tag := J+1;
              TEdit(FindComponent('edt_ColGroup'+InttoStr(J+1))).Visible := True;
              TEdit(FindComponent('edt_ColSort'+InttoStr(J+1))).Visible := True;
              TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J+1))).Visible := True;
              TEdit(FindComponent('edt_ColGroup'+InttoStr(J+1))).Top := T;
              TEdit(FindComponent('edt_ColSort'+InttoStr(J+1))).Top := T;
              TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J+1))).Top := T;
              TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J+1))).Visible := True;
              TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J+1))).Top := T;
              TComboBox(FindComponent('cb_Col'+InttoStr(J+1))).Visible := True;
              TComboBox(FindComponent('cb_Col'+InttoStr(J+1))).Items.Clear;
              TComboBox(FindComponent('cb_Col'+InttoStr(J+1))).Top := T;
           end
         else if (ACol = 'COL11') or            //Date Fields
                 (ACol = 'COL12') or
                 (ACol = 'COL13') Then
            begin
              Inc(T, 24);
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Caption := AValue+' :';
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Visible := True;
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Tag := J+1;
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Top := T;
              TEdit(FindComponent('edt_ColGroup'+InttoStr(J+1))).Visible := True;
              TEdit(FindComponent('edt_ColSort'+InttoStr(J+1))).Visible := True;
              TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J+1))).Visible := True;
              TEdit(FindComponent('edt_ColGroup'+InttoStr(J+1))).Top := T;
              TEdit(FindComponent('edt_ColSort'+InttoStr(J+1))).Top := T;
              TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J+1))).Top := T;
              TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J+1))).Visible := True;
              TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J+1))).Top := T;
              TEdit(FindComponent('edt_FrDate'+InttoStr(J-9))).Visible := True;
              TEdit(FindComponent('edt_FrDate'+InttoStr(J-9))).Top := T;
              TSpeedbutton(FindComponent('btn_FrDate'+InttoStr(J-9))).Visible := True;
              TSpeedbutton(FindComponent('btn_FrDate'+InttoStr(J-9))).Top := T;
              TLabel(FindComponent('lbl_btDate'+InttoStr(J-9))).Visible := True;
              TLabel(FindComponent('lbl_btDate'+InttoStr(J-9))).Top := T;
              TEdit(FindComponent('edt_ToDate'+InttoStr(J-9))).Visible := True;
              TEdit(FindComponent('edt_ToDate'+InttoStr(J-9))).Top := T;
              TSpeedbutton(FindComponent('btn_ToDate'+InttoStr(J-9))).Visible := True;
              TSpeedbutton(FindComponent('btn_ToDate'+InttoStr(J-9))).Top := T;
           end
         else if (ACol = 'COL14') or            //Number Fields
                 (ACol = 'COL15') Then
            begin
              Inc(T, 24);
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Caption := AValue+' :';
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Visible := True;
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Tag := J+1;
              TLabel(FindComponent('lbl_Col'+InttoStr(J+1))).Top := T;
              TEdit(FindComponent('edt_ColGroup'+InttoStr(J+1))).Visible := True;
              TEdit(FindComponent('edt_ColSort'+InttoStr(J+1))).Visible := True;
              TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J+1))).Visible := True;
              TEdit(FindComponent('edt_ColGroup'+InttoStr(J+1))).Top := T;
              TEdit(FindComponent('edt_ColSort'+InttoStr(J+1))).Top := T;
              TComboBox(FindComponent('cb_ColSortOpt'+InttoStr(J+1))).Top := T;
              TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J+1))).Visible := True;
              TCheckBox(FindComponent('chk_ColCollapse'+InttoStr(J+1))).Top := T;
              TComboBox(FindComponent('cb_Col'+InttoStr(J+1))).Visible := True;
              TComboBox(FindComponent('cb_Col'+InttoStr(J+1))).Items.Clear;
              TComboBox(FindComponent('cb_Col'+InttoStr(J+1))).Top := T;
            end;
        end;
//------
      cb_RecordCat.ItemIndex := -1;
      cb_RecordCat.Items.Clear;
      lbl_RecordCat.Visible := False;
      edt_RecordCatGroup.Visible := False;
      edt_RecordCatSort.Visible := False;
      cb_RecordCatSortOpt.Visible := False;
      chk_RecordCatCollapse.Visible := False;
      cb_RecordCat.Visible := False;

      if qry_RecordType.FieldByName('UseRecordCat').AsBoolean then
        begin
          lbl_RecordCat.Visible := True;
          edt_RecordCatGroup.Visible := True;
          edt_RecordCatSort.Visible := True;
          cb_RecordCatSortOpt.Visible := True;
          chk_RecordCatCollapse.Visible := True;
          cb_RecordCat.Visible := True;

          qry_RecCat.Close;
          qry_RecCat.SQL.Clear;
          qry_RecCat.SQL.Add('SELECT DISTINCT');
          qry_RecCat.SQL.Add('	rc.RecCatType');
          qry_RecCat.SQL.Add('FROM ');
          qry_RecCat.SQL.Add('	RecordCat rc');
          qry_RecCat.SQL.Add('	INNER JOIN RCRTRts rt ON rc.RecCatType = rt.RecordCat');
          qry_RecCat.SQL.Add('	INNER JOIN IndexDefinitions i ON rt.RecordType = i.Description');
          qry_RecCat.SQL.Add('WHERE');
          qry_RecCat.SQL.Add('	i.UseERecords = 1 AND');
          qry_RecCat.SQL.Add('	rt.RecordType = :RecordType');
          qry_RecCat.Parameters.ParamByName('RecordType').Value := edt_RecordType.Text;
          If not frm_Console.AccessSysAdmin Then
            begin
              qry_RecCat.SQL.Add('AND');
              qry_RecCat.SQL.Add('	(rc.RecCatType IN (SELECT a.RecordCat FROM RCAuthRts a WHERE a.UserId = :ID1))');
              qry_RecCat.SQL.Add('OR');
              qry_RecCat.SQL.Add('	(rc.RecCatType IN (SELECT a.RecordCat FROM RCAuthRts a INNER JOIN RolesRts o ON a.RoleId = o.RoleId WHERE o.UserId = :ID2))');
              qry_RecCat.Parameters.ParamByName('ID1').Value := User;
              qry_RecCat.Parameters.ParamByName('ID2').Value := User;
            end;
          qry_RecCat.SQL.Add('ORDER BY');
          qry_RecCat.SQL.Add('	rc.RecCatType');
          qry_RecCat.Open;


          cb_RecordCat.Items.Append('');
          cb_RecordCat.ItemIndex := 0;
          qry_RecCat.First;
          While not qry_RecCat.EOF Do
            begin
              cb_RecordCat.Items.Append(qry_RecCat.FieldbyName('RecCatType').asString);
              qry_RecCat.Next;
            end;
          edt_RecordCatGroup.Text := '';
        end;
    end;
  qry_RecordType.Close;
end;

procedure Tfrm_SearcheRecords.edt_RecordTypeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_RecordType.Text := '';
    end;
end;

procedure Tfrm_SearcheRecords.btn_SelBranchClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
    end;
end;

procedure Tfrm_SearcheRecords.btn_SelDeptClick(Sender: TObject);
begin
  If length(edt_Branch.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_Branch.Text, User) = mrOK Then
    begin
      edt_Dept.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_Dept.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_SearcheRecords.btn_SelRTypeClick(Sender: TObject);
begin
  If length(edt_Dept.Text) = 0 Then
    begin
      Messagedlg('Please select a Department!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelRType.Execute(False,
                          edt_Branch.Text,
                          edt_Dept.Text,
                          User,
                          False,
                          False,
                          False,
                          True,
                          False) = mrOK Then
    begin
      edt_RecordType.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
    end;
end;

procedure Tfrm_SearcheRecords.btn_CancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrm_SearcheRecords.cb_Col1DropDown(Sender: TObject);
Var
  J, A      :Integer;
  FieldName :String;
  TempStr   :String;
begin
  TComboBox(Sender).Items.BeginUpdate;
  try
    TempStr := TComboBox(Sender).Name;
    Delete(TempStr, 1, 6);
    J := StrtoInt(TempStr);


    A := TLabel(FindComponent('lbl_Col'+InttoStr(J))).Tag;
    If (A = 1)or
       (A = 2)or
       (A = 3)or
       (A = 4)or
       (A = 5)or
       (A = 6)or
       (A = 7)or
       (A = 8)or
       (A = 9)or
       (A = 10)Then
      FieldName := 'TEXT'+InttoStr(A)
    else If (A = 11)or
            (A = 12)or
            (A = 13)Then
      FieldName := 'DATE'+InttoStr(A-10)
    else If (A = 14)or
            (A = 15)Then
      FieldName := 'Number'+InttoStr(A-13);
//-------
    qry_Lookup.Close;
    qry_Lookup.SQL.Clear;
    qry_Lookup.SQL.Add('SELECT distinct ['+FieldName+'] FROM eRecords');
    qry_Lookup.SQL.Add('WHERE Branch = :Branch');
    qry_Lookup.SQL.Add('AND Department = :Department');
    qry_Lookup.SQL.Add('AND RecordType = :RecordType');
    qry_Lookup.Parameters.ParamByName('Branch').Value := edt_Branch.Text;
    qry_Lookup.Parameters.ParamByName('Department').Value := edt_Dept.Text;
    qry_Lookup.Parameters.ParamByName('RecordType').Value := edt_RecordType.Text;
//----
    If cb_RecordCat.Text <> '' Then
      begin
        qry_Lookup.SQL.Add('AND RecordCat = :RecordCat');
        qry_Lookup.Parameters.ParamByName('RecordCat').Value := cb_RecordCat.Text;
      end;
//----
    TComboBox(Sender).Items.Clear;
    qry_Lookup.Open;
    qry_Lookup.First;
    While not qry_Lookup.EOF Do
      begin
        TComboBox(Sender).Items.Append(trim(qry_Lookup.Fields[0].asString));
        qry_Lookup.Next;
      end;
    qry_Lookup.Close;
  finally
    TComboBox(Sender).Items.EndUpdate;
  end;
end;

procedure Tfrm_SearcheRecords.btn_ClearClick(Sender: TObject);
begin
  Initialize(False);
end;

procedure Tfrm_SearcheRecords.btn_OKClick(Sender: TObject);
Var
   J     :Integer;
   Flag  :Boolean;
   Audit :String;
begin
  If trim(edt_Branch.Text) = '' Then
    begin
      Messagedlg('Please select a Branch first!!', mtInformation, [mbOK], 0);
      exit;
    end;
  If trim(edt_Dept.Text) = '' Then
    begin
      Messagedlg('Please select a Department first!!', mtInformation, [mbOK], 0);
      exit;
    end;
  If trim(edt_RecordType.Text) = '' Then
    begin
      Messagedlg('Please select a Record Type first!!', mtInformation, [mbOK], 0);
      exit;
    end;
//----
  Flag := False;
  If not Flag Then
    begin
      For J := 1 to 10 Do
        begin
          IF (TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text <> '')AND
             (TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text <> '%')Then
            begin
              Flag := True;
              break;
            end;
        end;
      For J := 11 to 13 Do
        begin
          IF TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Text <> '' Then
            begin
              Flag := True;
              break;
            end;
        end;
      For J := 14 to 15 Do
        begin
          IF TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text <> '' Then
            begin
              Flag := True;
              break;
            end;
        end;

      If not Flag Then
        begin
          Messagedlg('No search criteria has been defined. Please enter some search criteria first?', mtInformation, [mbOK], 0);
          exit;
        end;
    end;

  dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieERecManBranch, edt_Branch.Text);
  dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieERecManDepartment, edt_Dept.Text);
  dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieERecManRecordType, edt_RecordType.Text);
  dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieERecManRecordCat, cb_RecordCat.Text);

  Audit := 'Branch: ' + edt_Branch.Text + #13#10;
  Audit := Audit +  'Department: ' + edt_Dept.Text + #13#10;
  Audit := Audit +  'RecordType: ' + edt_RecordType.Text + #13#10;
  Audit := Audit +  'RecordCat: ' + cb_RecordCat.Text + #13#10;

  For J := 1 to 10 Do
    begin
      If (TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text <> '')Then
        Audit := Audit +  TLabel(FindComponent('lbl_Col'+InttoStr(J))).Caption + ': ' + TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text + #13#10;
    end;

  For J := 11 to 13 Do
    begin
      If (TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Text <> '') AND (TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Text <> '') Then
        Audit := Audit +  TLabel(FindComponent('lbl_Col'+InttoStr(J))).Caption + ': ' + TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Text + ' => ' + TEdit(FindComponent('edt_ToDate'+InttoStr(J-10))).Text + #13#10
      else if (TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Text <> '')  Then
        Audit := Audit +  TLabel(FindComponent('lbl_Col'+InttoStr(J))).Caption + ': ' + TEdit(FindComponent('edt_FrDate'+InttoStr(J-10))).Text + #13#10;
    end;

  For J := 14 to 15 Do
    begin
      If (TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text <> '')Then
        Audit := Audit +  TLabel(FindComponent('lbl_Col'+InttoStr(J))).Caption + ': ' + TComboBox(FindComponent('cb_Col'+InttoStr(J))).Text + #13#10;
    end;

  dm_Metrofiler.InsAudit('Specific eRecord Search', 0, 0, '', Audit, 0);

  ModalResult := mrOK;
end;

procedure Tfrm_SearcheRecords.btn_FrDate1Click(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      edt_FrDate1.Text := DatetoStr(StartoftheDay(frm_GetDate.mCal.Date));
    end;
end;

procedure Tfrm_SearcheRecords.btn_FrDate2Click(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      edt_FrDate2.Text := DatetoStr(StartoftheDay(frm_GetDate.mCal.Date));
    end;
end;

procedure Tfrm_SearcheRecords.btn_FrDate3Click(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      edt_FrDate3.Text := DatetoStr(StartoftheDay(frm_GetDate.mCal.Date));
    end;
end;

procedure Tfrm_SearcheRecords.btn_ToDate1Click(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      edt_ToDate1.Text := DatetoStr(StartoftheDay(frm_GetDate.mCal.Date));
    end;
end;

procedure Tfrm_SearcheRecords.btn_ToDate2Click(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      edt_ToDate2.Text := DatetoStr(StartoftheDay(frm_GetDate.mCal.Date));
    end;
end;

procedure Tfrm_SearcheRecords.btn_ToDate3Click(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(TSpeedbutton(Sender).Left, TSpeedbutton(Sender).Top+TSpeedbutton(Sender).Height+2) = mrOK Then
    begin
      edt_ToDate3.Text := DatetoStr(StartoftheDay(frm_GetDate.mCal.Date));
    end;
end;

end.
