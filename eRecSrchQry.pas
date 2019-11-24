unit eRecSrchQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB;

type
  Tfrm_SearcheRecordsCross = class(TForm)
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
    edt_Dept: TEdit;
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
    lbl_Branch: TLabel;
    lbl_Dept: TLabel;
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
    procedure edt_BranchChange(Sender: TObject);
    procedure edt_DeptChange(Sender: TObject);
    procedure edt_BranchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_DeptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_RecordTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Initialize(RefreshCookies :Boolean);
    function Execute:Integer;
  end;

var
  frm_SearcheRecordsCross: Tfrm_SearcheRecordsCross;

implementation

uses SelBranch, SelDept, MetrofilerDataModule, main, SelRType;

{$R *.dfm}

function Tfrm_SearcheRecordsCross.Execute:Integer;
begin
  Result := ShowModal;
end;


procedure Tfrm_SearcheRecordsCross.Initialize(RefreshCookies :Boolean);
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
//----
  edt_RecordTypeChange(Self);
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
    cb_RecordCat.ItemIndex := cb_RecordCat.Items.IndexOf(RecordCatCookie)
end;

procedure Tfrm_SearcheRecordsCross.btn_CancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrm_SearcheRecordsCross.btn_SelBranchClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
//----
      edt_Dept.Text := '';
      lbl_Dept.Caption := '';
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_SearcheRecordsCross.btn_SelDeptClick(Sender: TObject);
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
//----
      edt_RecordType.Text := '';
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_SearcheRecordsCross.btn_SelRTypeClick(Sender: TObject);
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
  frm_SelRType.qry_RType.Close;
end;

procedure Tfrm_SearcheRecordsCross.btn_ClearClick(Sender: TObject);
begin
  Initialize(False);
end;

procedure Tfrm_SearcheRecordsCross.btn_OKClick(Sender: TObject);
Var
  Audit    :String;
begin
  If trim(edt_QueryStr.Text) = '' Then
    begin
      Messagedlg('Please enter a Query String first!!', mtInformation, [mbOK], 0);
      exit;
    end;

  dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieERecManBranch, edt_Branch.Text);
  dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieERecManDepartment, edt_Dept.Text);
  dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieERecManRecordType, edt_RecordType.Text);
  dm_Metrofiler.SaveSearchCookie(dm_Metrofiler.CookieERecManRecordCat, cb_RecordCat.Text);

  Audit := 'Branch: ' + edt_Branch.Text + #13#10;
  Audit := Audit +  'Department: ' + edt_Dept.Text + #13#10;
  Audit := Audit +  'RecordType: ' + edt_RecordType.Text + #13#10;
  Audit := Audit +  'RecordCat: ' + cb_RecordCat.Text + #13#10;
  Audit := Audit +  'Query: ' + edt_QueryStr.Text;

  dm_Metrofiler.InsAudit('Cross Query eRecord Search', 0, 0, '', Audit, 0);

  ModalResult := mrOK;
end;

procedure Tfrm_SearcheRecordsCross.edt_BranchChange(Sender: TObject);
begin
  edt_Dept.Text := '';
  lbl_Dept.Caption := '';
end;

procedure Tfrm_SearcheRecordsCross.edt_BranchGroupChange(Sender: TObject);
begin
  If trim(TEdit(Sender).Text) <> '' Then
    begin
      If TEdit(Sender).Name = 'edt_BranchGroup' Then edt_BranchSort.Text := '';
      If TEdit(Sender).Name = 'edt_DeptGroup' Then edt_DeptSort.Text := '';
      If TEdit(Sender).Name = 'edt_RecordTypeGroup' Then edt_RecordTypeSort.Text := '';
      If TEdit(Sender).Name = 'edt_RecordCatGroup' Then edt_RecordCatSort.Text := '';
    end;
end;

procedure Tfrm_SearcheRecordsCross.edt_BranchGroupKeyPress(Sender: TObject;
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

procedure Tfrm_SearcheRecordsCross.edt_BranchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_Branch.Text := '';
      lbl_Branch.Caption := '---';
    end;
end;

procedure Tfrm_SearcheRecordsCross.edt_BranchSortChange(Sender: TObject);
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

procedure Tfrm_SearcheRecordsCross.edt_DeptChange(Sender: TObject);
begin
  edt_RecordType.Text := '';
end;

procedure Tfrm_SearcheRecordsCross.edt_DeptKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  edt_Dept.Text := '';
  lbl_Dept.Caption := '---';
end;

procedure Tfrm_SearcheRecordsCross.edt_RecordTypeChange(Sender: TObject);
begin
  If edt_RecordType.Text = '' Then
    begin
      lbl_RecordCat.Visible := True;
      edt_RecordCatGroup.Visible := True;
      edt_RecordCatSort.Visible := True;
      cb_RecordCatSortOpt.Visible := True;
      chk_RecordCatCollapse.Visible := True;
      cb_RecordCat.Visible := True;
//----
      cb_RecordCat.Items.Clear;
      qry_RecCat.Close;
      qry_RecCat.SQL.Clear;
      qry_RecCat.SQL.Add('SELECT DISTINCT');
      qry_RecCat.SQL.Add('	rc.RecCatType');
      qry_RecCat.SQL.Add('FROM ');
      qry_RecCat.SQL.Add('	RecordCat rc');
      qry_RecCat.SQL.Add('	INNER JOIN RCRTRts rt ON rc.RecCatType = rt.RecordCat');
      qry_RecCat.SQL.Add('	INNER JOIN IndexDefinitions i ON rt.RecordType = i.Description');
      qry_RecCat.SQL.Add('WHERE');
      qry_RecCat.SQL.Add('	i.UseERecords = 1');
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
    end
  else if edt_RecordType.Text <> '' Then
    begin
      qry_RecordType.Close;
      qry_RecordType.SQL.Clear;
      qry_RecordType.SQL.Add('SELECT UseRecordCat');
      qry_RecordType.SQL.Add('FROM IndexDefinitions');
      qry_RecordType.SQL.Add('WHERE Description = :DS');
      qry_RecordType.Parameters.ParamByName('DS').Value := edt_RecordType.Text;
      qry_RecordType.Open;
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
        end;
      qry_RecordType.Close;
    end;
end;

procedure Tfrm_SearcheRecordsCross.edt_RecordTypeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_RecordType.Text := '';
    end;
end;

end.
