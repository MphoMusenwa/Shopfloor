unit COOLSrchSpec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ADODB, Buttons, DateUtils;

type
  Tfrm_COOLSearchSpecific = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbl_RecordCat: TLabel;
    Shape1: TShape;
    Shape3: TShape;
    edt_DeptGroup: TEdit;
    edt_RecordTypeGroup: TEdit;
    edt_RecordCatGroup: TEdit;
    edt_BranchGroup: TEdit;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    edt_BranchName: TEdit;
    edt_Dept: TEdit;
    edt_DeptName: TEdit;
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
    Label8: TLabel;
    Shape5: TShape;
    chk_DeptCollapse: TCheckBox;
    chk_RecordTypeCollapse: TCheckBox;
    chk_RecordCatCollapse: TCheckBox;
    chk_BranchCollapse: TCheckBox;
    chk_Partial: TCheckBox;
    Label9: TLabel;
    Shape7: TShape;
    edt_DeptSort: TEdit;
    edt_RecordTypeSort: TEdit;
    edt_RecordCatSort: TEdit;
    edt_BranchSort: TEdit;
    cb_BranchSortOpt: TComboBox;
    cb_DeptSortOpt: TComboBox;
    cb_RecordTypeSortOpt: TComboBox;
    cb_RecordCatSortOpt: TComboBox;
    sb_Details: TScrollBox;
    procedure edt_BranchGroupKeyPress(Sender: TObject; var Key: Char);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_SelRTypeClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure cb_Col1DropDown(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure edt_BranchGroupChange(Sender: TObject);
    procedure edt_BranchSortChange(Sender: TObject);
    procedure edt_RecordTypeChange(Sender: TObject);
  private
    { Private declarations }
    TotFields   :Integer;
    procedure SetupFields;
    procedure ClearFields;
  public
    { Public declarations }
    procedure Initialize(RefreshCookies :Boolean);
    function Execute:Integer;
  end;

var
  frm_COOLSearchSpecific: Tfrm_COOLSearchSpecific;

implementation

uses SelBranch, SelDept, MetrofilerDataModule, main, SelRType;

{$R *.dfm}

procedure Tfrm_COOLSearchSpecific.ClearFields;
Var
  ComponentTot, J  :Integer;
begin
  ComponentTot := sb_Details.ComponentCount;
  For J := ComponentTot - 1 downto 0 Do
    sb_Details.Components[J].Free;
end;

procedure Tfrm_COOLSearchSpecific.SetupFields;
Var
  A, T   :Integer;
begin
  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('SELECT FieldName');
  qry_RecordType.SQL.Add('FROM IndexDefinitions_COOL');
  qry_RecordType.SQL.Add('WHERE Description = :DS');
  qry_RecordType.SQL.Add('ORDER BY FieldName');
  qry_RecordType.Parameters.ParamByName('DS').Value := edt_RecordType.Text;
  qry_RecordType.Open;
//-----
  T := 5 - 24;
  A := 0;
//-----
  qry_RecordType.First;
  While not qry_RecordType.EOF Do
    begin
      Inc(T, 24);
      Inc(A);
      //----
      TLabel.Create(sb_Details).Name := 'lbl_Col'+InttoStr(A);
      TLabel(sb_Details.FindComponent('lbl_Col'+InttoStr(A))).Parent := sb_Details;
      TLabel(sb_Details.FindComponent('lbl_Col'+InttoStr(A))).AutoSize := false;
      TLabel(sb_Details.FindComponent('lbl_Col'+InttoStr(A))).Top := T;
      TLabel(sb_Details.FindComponent('lbl_Col'+InttoStr(A))).Left := 4;
      TLabel(sb_Details.FindComponent('lbl_Col'+InttoStr(A))).Width := 150;
      TLabel(sb_Details.FindComponent('lbl_Col'+InttoStr(A))).Alignment := taRightJustify;
      TLabel(sb_Details.FindComponent('lbl_Col'+InttoStr(A))).Caption := qry_RecordType.FieldByName('FieldName').AsString;
      //----
      TEdit.Create(sb_Details).Name := 'edt_ColGroup'+InttoStr(A);
      TEdit(sb_Details.FindComponent('edt_ColGroup'+InttoStr(A))).Parent := sb_Details;
      TEdit(sb_Details.FindComponent('edt_ColGroup'+InttoStr(A))).Top := T-4;
      TEdit(sb_Details.FindComponent('edt_ColGroup'+InttoStr(A))).Left := 165;
      TEdit(sb_Details.FindComponent('edt_ColGroup'+InttoStr(A))).Text := '';
      TEdit(sb_Details.FindComponent('edt_ColGroup'+InttoStr(A))).Width := 29;
      //----
      TEdit.Create(sb_Details).Name := 'edt_ColSort'+InttoStr(A);
      TEdit(sb_Details.FindComponent('edt_ColSort'+InttoStr(A))).Parent := sb_Details;
      TEdit(sb_Details.FindComponent('edt_ColSort'+InttoStr(A))).Top := T-4;
      TEdit(sb_Details.FindComponent('edt_ColSort'+InttoStr(A))).Left := 205;
      TEdit(sb_Details.FindComponent('edt_ColSort'+InttoStr(A))).Text := '';
      TEdit(sb_Details.FindComponent('edt_ColSort'+InttoStr(A))).Width := 29;
      //----
      TComboBox.Create(sb_Details).Name := 'cb_ColSortOpt'+InttoStr(A);
      TComboBox(sb_Details.FindComponent('cb_ColSortOpt'+InttoStr(A))).Parent := sb_Details;
      TComboBox(sb_Details.FindComponent('cb_ColSortOpt'+InttoStr(A))).Top := T-4;
      TComboBox(sb_Details.FindComponent('cb_ColSortOpt'+InttoStr(A))).Left := 234;
      TComboBox(sb_Details.FindComponent('cb_ColSortOpt'+InttoStr(A))).Items.Clear;
      TComboBox(sb_Details.FindComponent('cb_ColSortOpt'+InttoStr(A))).Items.Add('Asc');
      TComboBox(sb_Details.FindComponent('cb_ColSortOpt'+InttoStr(A))).Items.Add('Desc');
      TComboBox(sb_Details.FindComponent('cb_ColSortOpt'+InttoStr(A))).Style := csDropDownList;
      TComboBox(sb_Details.FindComponent('cb_ColSortOpt'+InttoStr(A))).ItemIndex := 0;
      TComboBox(sb_Details.FindComponent('cb_ColSortOpt'+InttoStr(A))).Width := 50;
      //----
      TCheckBox.Create(sb_Details).Name := 'chk_ColCollapse'+InttoStr(A);
      TCheckBox(sb_Details.FindComponent('chk_ColCollapse'+InttoStr(A))).Parent := sb_Details;
      TCheckBox(sb_Details.FindComponent('chk_ColCollapse'+InttoStr(A))).Caption := '';
      TCheckBox(sb_Details.FindComponent('chk_ColCollapse'+InttoStr(A))).Top := T;
      TCheckBox(sb_Details.FindComponent('chk_ColCollapse'+InttoStr(A))).Left := 310;
      TCheckBox(sb_Details.FindComponent('chk_ColCollapse'+InttoStr(A))).Width := 19;
      TCheckBox(sb_Details.FindComponent('chk_ColCollapse'+InttoStr(A))).Checked := false;
      //----
      TComboBox.Create(sb_Details).Name := 'cb_Col'+InttoStr(A);
      TComboBox(sb_Details.FindComponent('cb_Col'+InttoStr(A))).Parent := sb_Details;
      TComboBox(sb_Details.FindComponent('cb_Col'+InttoStr(A))).Top := T-4;
      TComboBox(sb_Details.FindComponent('cb_Col'+InttoStr(A))).Left := 359;
      TComboBox(sb_Details.FindComponent('cb_Col'+InttoStr(A))).Width := 321;
      TComboBox(sb_Details.FindComponent('cb_Col'+InttoStr(A))).Text := '';
      //----
      qry_RecordType.Next;
    end;
  TotFields := A;
end;

function Tfrm_COOLSearchSpecific.Execute:Integer;
begin
  Result := ShowModal;
end;


procedure Tfrm_COOLSearchSpecific.Initialize(RefreshCookies :Boolean);
Var
  BranchCookie    :String;
  DepartmentCookie:String;
  RecordTypeCookie:String;
  RecordCatCookie :String;
begin
  edt_BranchGroup.Text := '';
  edt_BranchSort.Text := '';
  cb_BranchSortOpt.ItemIndex := 0;
  edt_Branch.Text := '';
  edt_BranchName.Text := '';
  chk_BranchCollapse.Checked := True;
//----
  edt_DeptGroup.Text := '';
  edt_DeptSort.Text := '';
  cb_DeptSortOpt.ItemIndex := 0;
  edt_Dept.Text := '';
  edt_DeptName.Text := '';
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
//----
  ClearFields;

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
          edt_BranchName.Text := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
          edt_Dept.Text := '';
          edt_DeptName.Text := '---';
          edt_RecordType.Text := '';
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
          edt_DeptName.Text := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
          edt_RecordType.Text := '';
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
                              False,
                              True);
      If frm_SelRType.qry_RType.Locate('Description', RecordTypeCookie, []) Then
        begin
          edt_RecordType.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
          SetupFields;
    //------
          cb_RecordCat.Items.Clear;

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
              qry_RecCat.Parameters.ParamByName('RecordType').Value := edt_RecordType.Text;
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
              qry_RecCat.Parameters.ParamByName('RecordType').Value := edt_RecordType.Text;
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
    //------
      frm_SelRType.qry_RType.Close;
    end;

  If cb_RecordCat.Items.IndexOf(RecordCatCookie) <> -1 Then
    cb_RecordCat.ItemIndex := cb_RecordCat.Items.IndexOf(RecordCatCookie);
end;



procedure Tfrm_COOLSearchSpecific.edt_BranchGroupChange(Sender: TObject);
begin
  If trim(TEdit(Sender).Text) <> '' Then
    begin
      If TEdit(Sender).Name = 'edt_BranchGroup' Then edt_BranchSort.Text := '';
      If TEdit(Sender).Name = 'edt_DeptGroup' Then edt_DeptSort.Text := '';
      If TEdit(Sender).Name = 'edt_RecordTypeGroup' Then edt_RecordTypeSort.Text := '';
      If TEdit(Sender).Name = 'edt_RecordCatGroup' Then edt_RecordCatSort.Text := '';

  {    If TEdit(Sender).Name = 'edt_ColGroup1' Then edt_ColSort1.Text := '';
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
      If TEdit(Sender).Name = 'edt_ColGroup15' Then edt_ColSort15.Text := '';  }
    end;
end;

procedure Tfrm_COOLSearchSpecific.edt_BranchGroupKeyPress(Sender: TObject;
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

procedure Tfrm_COOLSearchSpecific.edt_BranchSortChange(Sender: TObject);
begin
  If trim(TEdit(Sender).Text) <> '' Then
    begin
      If TEdit(Sender).Name = 'edt_BranchSort' Then edt_BranchGroup.Text := '';
      If TEdit(Sender).Name = 'edt_DeptSort' Then edt_DeptGroup.Text := '';
      If TEdit(Sender).Name = 'edt_RecordTypeSort' Then edt_RecordTypeGroup.Text := '';
      If TEdit(Sender).Name = 'edt_RecordCatSort' Then edt_RecordCatGroup.Text := '';

     { If TEdit(Sender).Name = 'edt_ColSort1' Then edt_ColGroup1.Text := '';
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
      If TEdit(Sender).Name = 'edt_ColSort15' Then edt_ColGroup15.Text := '';  }
    end
  else
    begin
      If TEdit(Sender).Name = 'edt_BranchSort' Then cb_BranchSortOpt.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_DeptSort' Then cb_DeptSortOpt.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_RecordTypeSort' Then cb_RecordTypeSortOpt.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_RecordCatSort' Then cb_RecordCatSortOpt.ItemIndex := 0;

     { If TEdit(Sender).Name = 'edt_ColSort1' Then cb_ColSortOpt1.ItemIndex := 0;
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
      If TEdit(Sender).Name = 'edt_ColSort15' Then cb_ColSortOpt15.ItemIndex := 0;   }
    end;
end;

procedure Tfrm_COOLSearchSpecific.edt_RecordTypeChange(Sender: TObject);
begin
  qry_RecordType.Close;
  qry_RecordType.SQL.Clear;
  qry_RecordType.SQL.Add('select UseRecordCat from IndexDefinitions where Description = :DS');
  qry_RecordType.Parameters.ParamByName('DS').Value := edt_RecordType.Text;
  qry_RecordType.Open;
//----------
  if qry_RecordType.FieldByName('UseRecordCat').AsBoolean then
    begin
      lbl_RecordCat.Visible := True;
      edt_RecordCatGroup.Visible := True;
      edt_RecordCatSort.Visible := True;
      cb_RecordCatSortOpt.Visible := True;
      chk_RecordCatCollapse.Visible := True;
      cb_RecordCat.Visible := True;
    end
  else
    begin
      lbl_RecordCat.Visible := False;
      edt_RecordCatGroup.Visible := False;
      edt_RecordCatSort.Visible := False;
      cb_RecordCatSortOpt.Visible := False;
      chk_RecordCatCollapse.Visible := False;
      cb_RecordCat.Visible := False;
      cb_RecordCat.ItemIndex := -1;
    end;
  qry_RecordType.Close;
end;

procedure Tfrm_COOLSearchSpecific.btn_SelBranchClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      edt_BranchName.Text := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
//----
      edt_Dept.Text := '';
      edt_DeptName.Text := '';
//----
      edt_RecordType.Text := '';
//----
      ClearFields;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_COOLSearchSpecific.btn_SelDeptClick(Sender: TObject);
begin
  If length(edt_Branch.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_Branch.Text, User) = mrOK Then
    begin
      edt_Dept.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      edt_DeptName.Text := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
//----
      edt_RecordType.Text := '';
//----
      ClearFields;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_COOLSearchSpecific.btn_SelRTypeClick(Sender: TObject);
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
                          False,
                          True) = mrOK Then
    begin
      edt_RecordType.Text := frm_SelRType.qry_RType.FieldbyName('Description').asString;
//----
      ClearFields;
//----
      SetupFields;
//----
      cb_RecordCat.Items.Clear;

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
          qry_RecCat.Parameters.ParamByName('RecordType').Value := edt_RecordType.Text;
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
          qry_RecCat.Parameters.ParamByName('RecordType').Value := edt_RecordType.Text;
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
//----
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_COOLSearchSpecific.btn_CancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrm_COOLSearchSpecific.cb_Col1DropDown(Sender: TObject);
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
    qry_Lookup.SQL.Add('WHERE Branch = '+QuotedStr(edt_Branch.Text));
    qry_Lookup.SQL.Add('AND Department = '+QuotedStr(edt_Dept.Text));
    qry_Lookup.SQL.Add('AND RecordType = '+QuotedStr(edt_RecordType.Text));
//----
    If cb_RecordCat.Text <> '' Then
      qry_Lookup.SQL.Add('AND RecordCat = '+QuotedStr(cb_RecordCat.Text));
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

procedure Tfrm_COOLSearchSpecific.btn_ClearClick(Sender: TObject);
begin
  Initialize(False);
end;

procedure Tfrm_COOLSearchSpecific.btn_OKClick(Sender: TObject);
Var
   J     :Integer;
   Flag  :Boolean;
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
      For J := 1 to TotFields Do
        begin
          IF (TComboBox(sb_Details.FindComponent('cb_Col'+InttoStr(J))).Text <> '')AND
             (TComboBox(sb_Details.FindComponent('cb_Col'+InttoStr(J))).Text <> '%')Then
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

  ModalResult := mrOK;
end;

end.
