unit COOLSrchQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB;

type
  Tfrm_COOLSearchCross = class(TForm)
    GroupBox1: TGroupBox;
    edt_QueryStr: TEdit;
    GroupBox2: TGroupBox;
    btn_OK: TButton;
    btn_Cancel: TButton;
    btn_Clear: TButton;
    btn_Help: TButton;
    qry_RecordType: TADOQuery;
    qry_RecCat: TADOQuery;
    chk_Partial: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbl_RecordCat: TLabel;
    Shape1: TShape;
    Shape3: TShape;
    Shape5: TShape;
    Shape7: TShape;
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
    cb_RecordCat: TComboBox;
    chk_DeptCollapse: TCheckBox;
    chk_RecordTypeCollapse: TCheckBox;
    chk_RecordCatCollapse: TCheckBox;
    chk_BranchCollapse: TCheckBox;
    edt_DeptSort: TEdit;
    edt_RecordTypeSort: TEdit;
    edt_RecordCatSort: TEdit;
    edt_BranchSort: TEdit;
    cb_BranchSortOpt: TComboBox;
    cb_DeptSortOpt: TComboBox;
    cb_RecordTypeSortOpt: TComboBox;
    cb_RecordCatSortOpt: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_SelRTypeClick(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure edt_BranchGroupKeyPress(Sender: TObject; var Key: Char);
    procedure edt_BranchGroupChange(Sender: TObject);
    procedure edt_BranchSortChange(Sender: TObject);
    procedure edt_RecordTypeChange(Sender: TObject);
  private
    { Private declarations }
    RestrictRecordCat   :Boolean;
  public
    { Public declarations }
    procedure Initialize(RefreshCookies :Boolean);
    function Execute:Integer;
  end;

var
  frm_COOLSearchCross: Tfrm_COOLSearchCross;

implementation

uses SelBranch, SelDept, MetrofilerDataModule, main, SelRType;

{$R *.dfm}

function Tfrm_COOLSearchCross.Execute:Integer;
begin
  Result := ShowModal;
end;


procedure Tfrm_COOLSearchCross.Initialize(RefreshCookies :Boolean);
Var
  J               :Integer;
  BranchCookie    :String;
  DepartmentCookie:String;
  RecordTypeCookie:String;
  RecordCatCookie :String;
  T               :Integer;
  ACol            :String;
  AValue          :String;
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
  If frm_Console.AccessSysAdmin Then
    begin
      RestrictRecordCat := False;
      cb_RecordCat.Items.Clear;
      qry_RecCat.Close;
      qry_RecCat.SQL.Clear;
      qry_RecCat.SQL.Add('SELECT');
      qry_RecCat.SQL.Add('	r.RecCatType');
      qry_RecCat.SQL.Add('FROM');
      qry_RecCat.SQL.Add('	RecordCat r');
      qry_RecCat.SQL.Add('ORDER BY');
      qry_RecCat.SQL.Add('	RecCatType');
      qry_RecCat.Open;
      cb_RecordCat.Items.Append('');
      cb_RecordCat.ItemIndex := 0;
      qry_RecCat.First;
      While not qry_RecCat.EOF Do
        begin
          cb_RecordCat.Items.Append(qry_RecCat.FieldbyName('RecCatType').asString);
          qry_RecCat.Next;
        end;
    end
  else
    begin
      RestrictRecordCat := True;
      cb_RecordCat.Items.Clear;
      qry_RecCat.Close;
      qry_RecCat.SQL.Clear;
      qry_RecCat.SQL.Add('SELECT');
      qry_RecCat.SQL.Add('	r.RecCatType');
      qry_RecCat.SQL.Add('FROM');
      qry_RecCat.SQL.Add('	RecordCat r');
      qry_RecCat.SQL.Add('WHERE');
      qry_RecCat.SQL.Add('	(r.RecCatType IN (SELECT a.RecordCat FROM RCAuthRts a WHERE a.UserId = :ID1))');
      qry_RecCat.SQL.Add('OR');
      qry_RecCat.SQL.Add('	(r.RecCatType IN (SELECT a.RecordCat FROM RCAuthRts a INNER JOIN RolesRts o ON a.RoleId = o.RoleId WHERE o.UserId = :ID2))');
      qry_RecCat.SQL.Add('ORDER BY');
      qry_RecCat.SQL.Add('	RecCatType');
      qry_RecCat.Parameters.ParamByName('ID1').Value := User;
      qry_RecCat.Parameters.ParamByName('ID2').Value := User;
      qry_RecCat.Open;
      If qry_RecCat.IsEmpty Then
        begin
          qry_RecCat.Close;
          qry_RecCat.SQL.Clear;
          qry_RecCat.SQL.Add('SELECT RecCatType FROM RecordCat ORDER BY RecCatType');
          qry_RecCat.Open;
          RestrictRecordCat := False;
        end;
      cb_RecordCat.Items.Append('');
      cb_RecordCat.ItemIndex := 0;
      qry_RecCat.First;
      While not qry_RecCat.EOF Do
        begin
          cb_RecordCat.Items.Append(qry_RecCat.FieldbyName('RecCatType').asString);
          qry_RecCat.Next;
        end;
    end;
  edt_RecordCatGroup.Text := '';
  edt_RecordCatSort.Text := '';
//----
  edt_QueryStr.Text := '';

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
        end;
      frm_SelRType.qry_RType.Close;
    end;

  If cb_RecordCat.Items.IndexOf(RecordCatCookie) <> -1 Then
    cb_RecordCat.ItemIndex := cb_RecordCat.Items.IndexOf(RecordCatCookie)
end;

procedure Tfrm_COOLSearchCross.btn_CancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrm_COOLSearchCross.btn_SelBranchClick(Sender: TObject);
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
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_COOLSearchCross.btn_SelDeptClick(Sender: TObject);
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
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_COOLSearchCross.btn_SelRTypeClick(Sender: TObject);
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
    end;
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_COOLSearchCross.btn_ClearClick(Sender: TObject);
begin
  Initialize(False);
end;

procedure Tfrm_COOLSearchCross.btn_OKClick(Sender: TObject);
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
  If trim(edt_QueryStr.Text) = '' Then
    begin
      Messagedlg('Please enter a Query String first!!', mtInformation, [mbOK], 0);
      exit;
    end;

  dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieERecManBranch, edt_Branch.Text);
  dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieERecManDepartment, edt_Dept.Text);
  dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieERecManRecordType, edt_RecordType.Text);
  dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieERecManRecordCat, cb_RecordCat.Text);

  ModalResult := mrOK;
end;

procedure Tfrm_COOLSearchCross.edt_BranchGroupChange(Sender: TObject);
begin
  If trim(TEdit(Sender).Text) <> '' Then
    begin
      If TEdit(Sender).Name = 'edt_BranchGroup' Then edt_BranchSort.Text := '';
      If TEdit(Sender).Name = 'edt_DeptGroup' Then edt_DeptSort.Text := '';
      If TEdit(Sender).Name = 'edt_RecordTypeGroup' Then edt_RecordTypeSort.Text := '';
      If TEdit(Sender).Name = 'edt_RecordCatGroup' Then edt_RecordCatSort.Text := '';
    end;
end;

procedure Tfrm_COOLSearchCross.edt_BranchGroupKeyPress(Sender: TObject;
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
    Abort;
end;

procedure Tfrm_COOLSearchCross.edt_BranchSortChange(Sender: TObject);
begin
  If trim(TEdit(Sender).Text) <> '' Then
    begin
      If TEdit(Sender).Name = 'edt_BranchSort' Then edt_BranchGroup.Text := '';
      If TEdit(Sender).Name = 'edt_DeptSort' Then edt_DeptGroup.Text := '';
      If TEdit(Sender).Name = 'edt_RecordTypeSort' Then edt_RecordTypeGroup.Text := '';
      If TEdit(Sender).Name = 'edt_RecordCatSort' Then edt_RecordCatGroup.Text := '';
    end
  else
    begin
      If TEdit(Sender).Name = 'edt_BranchSort' Then cb_BranchSortOpt.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_DeptSort' Then cb_DeptSortOpt.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_RecordTypeSort' Then cb_RecordTypeSortOpt.ItemIndex := 0;
      If TEdit(Sender).Name = 'edt_RecordCatSort' Then cb_RecordCatSortOpt.ItemIndex := 0;
    end;
end;

procedure Tfrm_COOLSearchCross.edt_RecordTypeChange(Sender: TObject);
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

end.
