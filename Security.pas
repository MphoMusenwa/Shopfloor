//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 2006 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit Security;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBCtrls, DB, DBTables, StdCtrls, Mask, TabNotBk, Buttons,
  ExtCtrls, GetDept, ComCtrls, Grids, DBGrids, Registry, Variants,
  Spin, ADODB, DirDlg, FileCrypt, ImgList, Menus, DateUtils;

Const
  PasswordNotChanged  :String = 'Not Changed';
type
  Tfrm_Security = class(TForm)
    pnl_Top: TPanel;
    nav_Clients: TDBNavigator;
    dts_AuthorityCode: TDataSource;
    OpenDialog: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet8: TTabSheet;
    TabSheet10: TTabSheet;
    dts_BarcodeRanges: TDataSource;
    qry_DefLocLen: TADOQuery;
    qry_AuthorityCode: TADOQuery;
    dts_Company: TDataSource;
    qry_Company: TADOQuery;
    qry_BarcodeRanges: TADOQuery;
    btn_Close: TSpeedButton;
    qry_FileRepos: TADOQuery;
    ScrollBox8: TScrollBox;
    grp_DelLocLen: TGroupBox;
    cmb_DefLocLen: TComboBox;
    grp_PWRec: TGroupBox;
    DBCheckBox23: TDBCheckBox;
    grp_EMailDelNotes: TGroupBox;
    DBCheckBox22: TDBCheckBox;
    grp_FileAreaRefresh: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    edt_RefRate: TSpinEdit;
    grp_eRecRepositry: TGroupBox;
    Label12: TLabel;
    lbl_eRecFileRepositryLoc: TLabel;
    cb_eRecordRepositry: TComboBox;
    edt_eRecFileRepositryLoc: TEdit;
    ScrollBox9: TScrollBox;
    DBGrid2: TDBGrid;
    grp_PickDelInfoFields: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label20: TLabel;
    Bevel1: TBevel;
    Label21: TLabel;
    cmb_PrText1: TDBComboBox;
    cmb_PrText2: TDBComboBox;
    cmb_PrText3: TDBComboBox;
    cmb_PrText4: TDBComboBox;
    cmb_PickText1: TDBComboBox;
    btn_GeteRecFileRepositry: TSpeedButton;
    GroupBox2: TGroupBox;
    Label29: TLabel;
    cb_ContLabelPrint: TDBComboBox;
    qry_SQL: TADOQuery;
    TabSheet1: TTabSheet;
    Splitter3: TSplitter;
    ImageList1: TImageList;
    qry_Roles: TADOQuery;
    dts_Roles: TDataSource;
    tvSecurity: TTreeView;
    lvSecurityDetails: TListView;
    pmUsers: TPopupMenu;
    pmRoles: TPopupMenu;
    pmRequesters: TPopupMenu;
    itmAddUser: TMenuItem;
    itmDeleteUser: TMenuItem;
    itmAddRole: TMenuItem;
    itmDeleteRole: TMenuItem;
    itmAddRequester: TMenuItem;
    itmDeleteRequester: TMenuItem;
    pnlEditUser: TPanel;
    lbl_CtrlAuthCode: TLabel;
    lbl_CtrlSurname: TLabel;
    lbl_CtrlName: TLabel;
    lbl_ValidTo: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    lbl_Passw: TLabel;
    Label28: TLabel;
    edt_UserId: TDBEdit;
    edt_Surname: TDBEdit;
    edt_FirstName: TDBEdit;
    edt_ValidFrom: TDBEdit;
    edt_ValidTo: TDBEdit;
    btn_ValidFrom: TButton;
    btn_ValidTo: TButton;
    edt_Tel: TDBEdit;
    mem_DelAddr: TDBMemo;
    edt_Passw: TEdit;
    chk_Valid: TDBCheckBox;
    edt_eMail: TDBEdit;
    DBNavigator2: TDBNavigator;
    rgrp_UserType: TDBRadioGroup;
    btnRoleAccess: TBitBtn;
    btnUserSystemAccess: TBitBtn;
    pnlEditRole: TPanel;
    Label3: TLabel;
    edt_Role: TDBEdit;
    DBNavigator3: TDBNavigator;
    btn_RoleUserAccess: TBitBtn;
    btn_RoleSystemAccess: TBitBtn;
    btn_UserFilingAreaAccess: TBitBtn;
    btn_UserRecordTypeAccess: TBitBtn;
    btn_UserRecordCatAccess: TBitBtn;
    btn_RoleFilingAreaAccess: TBitBtn;
    btn_RoleRecordCatAccess: TBitBtn;
    btn_RoleRecordTypeAccess: TBitBtn;
    btn_BarcodeScannerLoc: TSpeedButton;
    edt_BarcodeScannerLoc: TDBEdit;
    lbl_BarcodeScannerLoc: TLabel;
    chk_SysAdmin: TDBCheckBox;
    lbl_OutTo: TLabel;
    edt_OutFrom: TDBEdit;
    edt_OutTo: TDBEdit;
    btn_OutFrom: TButton;
    btn_OutTo: TButton;
    chk_OutofOffice: TDBCheckBox;
    Label4: TLabel;
    edt_Inits: TDBEdit;
    Label5: TLabel;
    edt_Designation: TDBEdit;
    Label6: TLabel;
    edt_EmployeeNo: TDBEdit;
    edt_Fax: TDBEdit;
    Label7: TLabel;
    edt_Cell: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    edt_CostCentre: TDBEdit;
    Label10: TLabel;
    edt_InternalDept: TDBEdit;
    lbl_WorkPlaceID: TLabel;
    edt_WorkPlaceID: TDBEdit;
    Bevel2: TBevel;
    Bevel3: TBevel;
    chk_ProxyLoc: TDBCheckBox;
    btn_GenWorkPlaceID: TSpeedButton;
    btn_UserReportAccess: TBitBtn;
    btn_RoleReportsAccess: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    edt_PrintPickSlipQty: TDBEdit;
    edt_PrintDelNoteQty: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    Bevel4: TBevel;
    btn_Find: TSpeedButton;
    GroupBox1: TGroupBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    btn_RoleDeliveryTypeAccess: TBitBtn;
    btn_UserDeliveryTypeAccess: TBitBtn;
    GroupBox3: TGroupBox;
    chk_FullTextSearch: TDBCheckBox;
    rbtn_AuthType: TDBRadioGroup;
    pmImageCentreGroups: TPopupMenu;
    itmAddImageCentreGroup: TMenuItem;
    itmDeleteImageCentreGroup: TMenuItem;
    chk_ImageCentreAdmin: TDBCheckBox;
    Bevel5: TBevel;
    qry_ImageCentreGroups: TADOQuery;
    dts_ImageCentreGroups: TDataSource;
    pnlEditImageCentreGroup: TPanel;
    Label13: TLabel;
    edtImageCentreGroup: TDBEdit;
    DBNavigator1: TDBNavigator;
    btn_ImageCentreUserAccess: TBitBtn;
    GroupBox4: TGroupBox;
    DBCheckBox7: TDBCheckBox;
    GroupBox5: TGroupBox;
    DBCheckBox6: TDBCheckBox;
    Label14: TLabel;
    edt_ADRole: TDBEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_ValidFromClick(Sender: TObject);
    procedure btn_ValidToClick(Sender: TObject);
    procedure tbl_CompanyBeforeDelete(DataSet: TDataset);
    procedure tbl_DepartmentBeforeDelete(DataSet: TDataset);
    procedure btn_BarcodeScannerLocClick(Sender: TObject);
    procedure chk_ValidClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure qry_AuthorityCodeAfterInsert(DataSet: TDataSet);
    procedure qry_AuthorityCodeAfterPost(DataSet: TDataSet);
    procedure qry_AuthorityCodeBeforePost(DataSet: TDataSet);
    procedure edt_RefRateChange(Sender: TObject);
    procedure qry_CompanyBeforePost(DataSet: TDataSet);
    procedure cmb_DefLocLenChange(Sender: TObject);
    procedure qry_CompanyAfterCancel(DataSet: TDataSet);
    procedure qry_CompanyAfterPost(DataSet: TDataSet);
    procedure qry_AuthorityCodeBeforeEdit(DataSet: TDataSet);
    procedure cb_eRecordRepositryChange(Sender: TObject);
    procedure edt_eRecFileRepositryLocChange(Sender: TObject);
    procedure btn_GeteRecFileRepositryClick(Sender: TObject);
    procedure qry_BarcodeRangesAfterInsert(DataSet: TDataSet);
    procedure tvSecurityChange(Sender: TObject; Node: TTreeNode);
    procedure tvSecurityMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvSecurityExpanded(Sender: TObject; Node: TTreeNode);
    procedure tvSecurityMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lvSecurityDetailsDblClick(Sender: TObject);
    procedure itmAddUserClick(Sender: TObject);
    procedure qry_AuthorityCodeAfterCancel(DataSet: TDataSet);
    procedure qry_AuthorityCodeAfterEdit(DataSet: TDataSet);
    procedure itmDeleteUserClick(Sender: TObject);
    procedure itmAddRequesterClick(Sender: TObject);
    procedure itmDeleteRequesterClick(Sender: TObject);
    procedure qry_RolesAfterInsert(DataSet: TDataSet);
    procedure qry_RolesAfterPost(DataSet: TDataSet);
    procedure btnRoleAccessClick(Sender: TObject);
    procedure btn_UserFilingAreaAccessClick(Sender: TObject);
    procedure btn_UserRecordCatAccessClick(Sender: TObject);
    procedure btn_RoleFilingAreaAccessClick(Sender: TObject);
    procedure btn_RoleRecordCatAccessClick(Sender: TObject);
    procedure btn_UserRecordTypeAccessClick(Sender: TObject);
    procedure btn_RoleRecordTypeAccessClick(Sender: TObject);
    procedure btn_RoleUserAccessClick(Sender: TObject);
    procedure btnUserSystemAccessClick(Sender: TObject);
    procedure btn_RoleSystemAccessClick(Sender: TObject);
    procedure itmAddRoleClick(Sender: TObject);
    procedure itmDeleteRoleClick(Sender: TObject);
    procedure chk_OutofOfficeClick(Sender: TObject);
    procedure btn_OutFromClick(Sender: TObject);
    procedure btn_OutToClick(Sender: TObject);
    procedure dts_AuthorityCodeDataChange(Sender: TObject; Field: TField);
    procedure dts_AuthorityCodeStateChange(Sender: TObject);
    procedure btn_GenWorkPlaceIDClick(Sender: TObject);
    procedure btn_UserReportAccessClick(Sender: TObject);
    procedure btn_RoleReportsAccessClick(Sender: TObject);
    procedure edt_PasswKeyPress(Sender: TObject; var Key: Char);
    procedure btn_FindClick(Sender: TObject);
    procedure qry_AuthorityCodeAfterScroll(DataSet: TDataSet);
    procedure btn_UserDeliveryTypeAccessClick(Sender: TObject);
    procedure btn_RoleDeliveryTypeAccessClick(Sender: TObject);
    procedure rbtn_AuthTypeChange(Sender: TObject);
    procedure itmAddImageCentreGroupClick(Sender: TObject);
    procedure itmDeleteImageCentreGroupClick(Sender: TObject);
    procedure qry_ImageCentreGroupsAfterInsert(DataSet: TDataSet);
    procedure qry_ImageCentreGroupsAfterPost(DataSet: TDataSet);
    procedure btn_ImageCentreUserAccessClick(Sender: TObject);
    procedure qry_BarcodeRangesBeforePost(DataSet: TDataSet);
    procedure qry_BarcodeRangesAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
    PK_Auth   :String;
    PrevUserType :String[1];
    SecurityEditMode :Boolean;
    procedure BuildSecurityTree();
    procedure RefreshSecurityTree(TreeNode :TTreeNode);
  public
    { Public declarations }
  end;

var
  frm_Security: Tfrm_Security;
  OldRefRate :smallint;

implementation

{$R *.DFM}

uses main, MetrofilerDataModule, SelBranch, SelAuthCodeRts, SelDept, SelWHouse,
  AccessUserRole, AccessUserFilingArea, AccessUserRecordCat,AccessRoleFilingArea,
  AccessRoleRecordCat, AccessUserRecordType, AccessRoleRecordType, AccessRoleUser,
  AccessUserSystem, AccessRoleSystem, Getdate, AccessUserReports, AccessRoleReports,
  AccessUserDeliveryType, AccessRoleDeliveryType, AccessImageCentreGroup,
  edtBarcodeRange;

procedure Tfrm_Security.itmAddImageCentreGroupClick(Sender: TObject);
begin
  btn_ImageCentreUserAccess.Visible := false;
  pnlEditImageCentreGroup.Visible := True;
  lvSecurityDetails.Visible := False;

  qry_ImageCentreGroups.Close;
  qry_ImageCentreGroups.SQL.Clear;
  qry_ImageCentreGroups.SQL.Add('SELECT * FROM [ImageCentreGroups] WHERE GroupId = :Group');
  qry_ImageCentreGroups.Parameters.ParamValues['Group'] := -111;
  qry_ImageCentreGroups.Open;
  qry_ImageCentreGroups.Insert;
end;

procedure Tfrm_Security.itmAddRequesterClick(Sender: TObject);
begin
  btnRoleAccess.Visible := false;
  btnUserSystemAccess.Visible := false;
  btn_UserRecordTypeAccess.Visible := false;
  btn_UserRecordCatAccess.Visible := false;
  btn_UserFilingAreaaccess.Visible := false;
  btn_UserReportAccess.Visible := false;
  btn_UserDeliveryTypeAccess.Visible := false;

  pnlEditRole.Visible := False;
  pnlEditUser.Visible := True;
  pnlEditImageCentreGroup.Visible := False;
  lvSecurityDetails.Visible := False;

  qry_AuthorityCode.Close;
  qry_AuthorityCode.SQL.Clear;
  qry_AuthorityCode.SQL.Add('SELECT * FROM AuthCodes WHERE UserId = :UserId ORDER BY UserID');
  qry_AuthorityCode.Parameters.ParamValues['UserId'] := 'xxxcf';
  qry_AuthorityCode.Open;
  qry_AuthorityCode.Insert;
  qry_AuthorityCode['UserType'] := 'R';
end;

procedure Tfrm_Security.itmAddRoleClick(Sender: TObject);
begin
  btn_RoleUserAccess.Visible := false;
  btn_RoleSystemAccess.Visible := false;
  btn_RoleRecordTypeAccess.Visible := false;
  btn_RoleRecordCatAccess.Visible := false;
  btn_RoleFilingAreaaccess.Visible := false;
  btn_RoleReportsAccess.Visible := false;
  btn_RoleDeliveryTypeAccess.Visible := false;
  pnlEditRole.Visible := True;
  lvSecurityDetails.Visible := False;
  qry_Roles.Close;
  qry_Roles.SQL.Clear;
  qry_Roles.SQL.Add('SELECT * FROM Roles WHERE RoleId = :RoleId ORDER BY RoleID');
  qry_Roles.Parameters.ParamValues['RoleId'] := -111;
  qry_Roles.Open;
  qry_Roles.Insert;
end;

procedure Tfrm_Security.btn_UserRecordCatAccessClick(Sender: TObject);
begin
  frm_AccessUserRecordCat.Execute(qry_AuthorityCode.FieldbyName('USERID').asString);
end;

procedure Tfrm_Security.btn_UserRecordTypeAccessClick(Sender: TObject);
begin
  frm_AccessUserRecordType.Execute(qry_AuthorityCode.FieldbyName('USERID').asString);
end;

procedure Tfrm_Security.btn_UserReportAccessClick(Sender: TObject);
begin
  frm_AccessUserReports.Execute(qry_AuthorityCode.FieldbyName('USERID').asString);
end;

procedure Tfrm_Security.btn_RoleUserAccessClick(Sender: TObject);
begin
  frm_AccessRoleUser.Execute(qry_Roles.FieldbyName('RoleId').asInteger);
end;

procedure Tfrm_Security.btn_RoleSystemAccessClick(Sender: TObject);
begin
  frm_AccessRoleSystem.Execute(qry_Roles.FieldbyName('RoleId').asInteger);
end;

procedure Tfrm_Security.btnRoleAccessClick(Sender: TObject);
begin
  frm_AccessUserRole.Execute(qry_AuthorityCode.FieldbyName('USERID').asString);
end;

procedure Tfrm_Security.btnUserSystemAccessClick(Sender: TObject);
begin
  frm_AccessUserSystem.Execute(qry_AuthorityCode.FieldbyName('USERID').asString);
end;

procedure Tfrm_Security.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Security.btn_FindClick(Sender: TObject);
Var
  SrchCriteria  :String;
  J             :Integer;
begin
  if InputQuery('Enter Userid or Name to Find', 'Search Criteria :', SrchCriteria) then
    begin
      tvSecurity.FullExpand;
      For J := 0 to tvSecurity.Items.Count-1 Do
        begin
          If pos(SrchCriteria, tvSecurity.Items.Item[J].Text) > 0 Then
            begin
              tvSecurity.Items.Item[J].Selected := True;
              tvSecurityChange(tvSecurity, tvSecurity.Items.Item[J]);
              exit;
            end;
        end;
    end;
end;

procedure Tfrm_Security.FormCreate(Sender: TObject);
begin
  chk_SysAdmin.Visible := frm_Console.AccessSysAdmin;

  TabSheet10.TabVisible := False;
  TabSheet8.TabVisible := frm_Console.AccessSysAdmin;

  grp_eRecRepositry.Visible := False;
  grp_FileAreaRefresh.Visible := False;
  grp_PWRec.Visible := False;
  grp_EMailDelNotes.Visible := False;
  grp_PickDelInfoFields.Visible := False;
  grp_DelLocLen.Visible := False;

  If (frm_Console.fWareMan = 1)or(frm_Console.fEntMan = 1) Then
    begin
      TabSheet10.TabVisible := frm_Console.AccessSysAdmin;

      grp_DelLocLen.Visible := True;
      grp_PickDelInfoFields.Visible := True;
      grp_EMailDelNotes.Visible := True;
      grp_PWRec.Visible := True;
      grp_FileAreaRefresh.Visible := True;
    end;
  If (frm_Console.fDocMan = 1)or(frm_Console.fEntMan = 1) Then
    begin
      TabSheet10.TabVisible := frm_Console.AccessSysAdmin;

      grp_DelLocLen.Visible := True;
      grp_PickDelInfoFields.Visible := True;
      grp_EMailDelNotes.Visible := True;
      grp_PWRec.Visible := True;
      grp_FileAreaRefresh.Visible := True;
    end;
  If (frm_Console.feRecMan = 1)or(frm_Console.fEntMan = 1)or(frm_Console.fImgMan = 1) Then
    begin
      grp_eRecRepositry.Visible := True;
    end;
  If (frm_Console.fWebMan = 1)or(frm_Console.fEntMan = 1) Then
    begin
    end;
  If (frm_Console.fCOOLMan = 1)or(frm_Console.fEntMan = 1) Then
    begin
    end;

  PageControl1.ActivePage := Tabsheet1;
  PageControl1Change(Self);
end;

procedure Tfrm_Security.btn_ValidFromClick(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(Tbutton(Sender).Left, Tbutton(Sender).Top+Tbutton(Sender).Height+2) = mrOK Then
    begin
      qry_AuthorityCode.Edit;
      qry_AuthorityCode['Valid_From'] := StartoftheDay(frm_GetDate.mCal.Date);
    end;
end;

procedure Tfrm_Security.btn_GenWorkPlaceIDClick(Sender: TObject);
begin
  qry_AuthorityCode.Edit;
  qry_AuthorityCode['WorkPlaceID'] := dm_Metrofiler.CreateGuid;
end;

procedure Tfrm_Security.btn_GeteRecFileRepositryClick(Sender: TObject);
var
  s        :String;
begin
  if SelectDirectory('Select location of Repositry.',s,'',s) then
    edt_eRecFileRepositryLoc.Text := s;
end;

procedure Tfrm_Security.btn_ImageCentreUserAccessClick(Sender: TObject);
begin
  frm_AccessImageCentreGroup.Execute(qry_ImageCentreGroups.FieldbyName('GroupId').asInteger);
end;

procedure Tfrm_Security.btn_OutFromClick(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(Tbutton(Sender).Left, Tbutton(Sender).Top+Tbutton(Sender).Height+2) = mrOK Then
    begin
      qry_AuthorityCode.Edit;
      qry_AuthorityCode['OutOfOffice_From'] := StartoftheDay(frm_GetDate.mCal.Date);
    end;
end;

procedure Tfrm_Security.btn_OutToClick(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(Tbutton(Sender).Left, Tbutton(Sender).Top+Tbutton(Sender).Height+2) = mrOK Then
    begin
      qry_AuthorityCode.Edit;
      qry_AuthorityCode['OutOfOffice_To'] := StartoftheDay(frm_GetDate.mCal.Date);
    end;
end;

procedure Tfrm_Security.btn_RoleDeliveryTypeAccessClick(Sender: TObject);
begin
  frm_AccessRoleDeliveryType.Execute(qry_Roles.FieldbyName('RoleId').asInteger);
end;

procedure Tfrm_Security.btn_RoleFilingAreaAccessClick(Sender: TObject);
begin
  frm_AccessRoleFilingArea.Execute(qry_Roles.FieldbyName('RoleId').asInteger);
end;

procedure Tfrm_Security.btn_RoleRecordCatAccessClick(Sender: TObject);
begin
  frm_AccessRoleRecordCat.Execute(qry_Roles.FieldbyName('RoleId').asInteger);
end;

procedure Tfrm_Security.btn_RoleRecordTypeAccessClick(Sender: TObject);
begin
  frm_AccessRoleRecordType.Execute(qry_Roles.FieldbyName('RoleId').asInteger);
end;

procedure Tfrm_Security.btn_RoleReportsAccessClick(Sender: TObject);
begin
  frm_AccessRoleReports.Execute(qry_Roles.FieldbyName('RoleId').asInteger);
end;

procedure Tfrm_Security.btn_ValidToClick(Sender: TObject);
begin
  frm_GetDate.Init := False;
  If frm_GetDate.Execute(Tbutton(Sender).Left, Tbutton(Sender).Top+Tbutton(Sender).Height+2) = mrOK Then
    begin
      qry_AuthorityCode.Edit;
      qry_AuthorityCode['Valid_To'] := StartoftheDay(frm_GetDate.mCal.Date);
    end;
end;

procedure Tfrm_Security.btn_UserDeliveryTypeAccessClick(Sender: TObject);
begin
  frm_AccessUserDeliveryType.Execute(qry_AuthorityCode.FieldbyName('USERID').asString);
end;

procedure Tfrm_Security.btn_UserFilingAreaAccessClick(Sender: TObject);
begin
  frm_AccessUserFilingArea.Execute(qry_AuthorityCode.FieldbyName('USERID').asString);
end;

procedure Tfrm_Security.tbl_CompanyBeforeDelete(DataSet: TDataset);
begin
  Abort;
end;

procedure Tfrm_Security.tbl_DepartmentBeforeDelete(DataSet: TDataset);
begin
  Abort;
end;

procedure Tfrm_Security.tvSecurityChange(Sender: TObject; Node: TTreeNode);
Var
  ChildNode   :TTreeNode;
  J           :Integer;
  ListItem    :TListItem;
begin
  if SecurityEditMode then
    exit;
  if Node.Level = 0 then
    begin
      pnlEditRole.Visible := False;
      pnlEditUser.Visible := False;
      pnlEditImageCentreGroup.Visible := False;
      lvSecurityDetails.Visible := true;

      If (Node.Text = 'Users')OR(Node.Text = 'Roles')OR(Node.Text = 'Requesters')OR(Node.Text = 'Image Centre Groups') Then
        begin
          lvSecurityDetails.Items.Clear;
          For J := 0 to Node.Count-1 Do
            begin
              ChildNode := Node[J];
              ListItem := lvSecurityDetails.Items.Add();
              ListItem.Caption := ChildNode.Text;
              ListItem.ImageIndex := ChildNode.ImageIndex;
            end;
        end;
    end
  else if Node.Level = 1 then
    begin
      If (Node.Parent.Text = 'Users') OR (Node.Parent.Text = 'Requesters') Then
        begin
          pnlEditRole.Visible := False;
          pnlEditUser.Visible := true;
          pnlEditImageCentreGroup.Visible := false;
          lvSecurityDetails.Visible := False;

          btnRoleAccess.Visible := (Node.Parent.Text = 'Users');
          btnUserSystemAccess.Visible := (Node.Parent.Text = 'Users')and(frm_Console.AccessSysAdmin);
          btn_UserRecordTypeAccess.Visible := (Node.Parent.Text = 'Users')and(frm_Console.AccessSysAdmin);
          btn_UserRecordCatAccess.Visible := (Node.Parent.Text = 'Users')and(frm_Console.AccessSysAdmin);
          btn_UserFilingAreaaccess.Visible := (Node.Parent.Text = 'Users')and(frm_Console.AccessSysAdmin);
          btn_UserReportAccess.Visible := (Node.Parent.Text = 'Users')and(frm_Console.AccessSysAdmin);
          btn_UserDeliveryTypeAccess.Visible := (Node.Parent.Text = 'Users')and(frm_Console.AccessSysAdmin);

          qry_Roles.Close;

          qry_AuthorityCode.Close;
          qry_AuthorityCode.SQL.Clear;
          qry_AuthorityCode.SQL.Add('SELECT * FROM AuthCodes WHERE UserId = :UserId ORDER BY UserID');
          qry_AuthorityCode.Parameters.ParamValues['UserId'] := copy(Node.Text, 1, pos(' -', Node.Text)-1);
          qry_AuthorityCode.Open;
        end;
      If (Node.Parent.Text = 'Roles') Then
        begin
          pnlEditRole.Visible := true;
          pnlEditUser.Visible := false;
          pnlEditImageCentreGroup.Visible := false;
          lvSecurityDetails.Visible := False;

          btn_RoleUserAccess.Visible := (Node.Parent.Text = 'Roles');
          btn_RoleSystemAccess.Visible := (Node.Parent.Text = 'Roles')and(frm_Console.AccessSysAdmin);
          btn_RoleRecordTypeAccess.Visible := (Node.Parent.Text = 'Roles')and(frm_Console.AccessSysAdmin);
          btn_RoleRecordCatAccess.Visible := (Node.Parent.Text = 'Roles')and(frm_Console.AccessSysAdmin);
          btn_RoleFilingAreaaccess.Visible := (Node.Parent.Text = 'Roles')and(frm_Console.AccessSysAdmin);
          btn_RoleReportsAccess.Visible := (Node.Parent.Text = 'Roles')and(frm_Console.AccessSysAdmin);
          btn_RoleDeliveryTypeAccess.Visible := (Node.Parent.Text = 'Roles')and(frm_Console.AccessSysAdmin);

          qry_AuthorityCode.Close;

          qry_Roles.Close;
          qry_Roles.SQL.Clear;
          qry_Roles.SQL.Add('SELECT * FROM Roles WHERE RoleId = :Role');
          qry_Roles.Parameters.ParamValues['Role'] := copy(Node.Text, 1, pos(' -', Node.Text)-1);
          qry_Roles.Open;
        end;
      If (Node.Parent.Text = 'Image Centre Groups') Then
        begin
          pnlEditRole.Visible := false;
          pnlEditUser.Visible := false;
          pnlEditImageCentreGroup.Visible := true;
          lvSecurityDetails.Visible := False;

          btn_ImageCentreUserAccess.Visible := (Node.Parent.Text = 'Image Centre Groups');

          qry_AuthorityCode.Close;

          qry_ImageCentreGroups.Close;
          qry_ImageCentreGroups.SQL.Clear;
          qry_ImageCentreGroups.SQL.Add('SELECT * FROM [ImageCentreGroups] WHERE GroupId = :Group');
          qry_ImageCentreGroups.Parameters.ParamValues['Group'] := copy(Node.Text, 1, pos(' -', Node.Text)-1);
          qry_ImageCentreGroups.Open;
        end;
    end;
end;

procedure Tfrm_Security.tvSecurityExpanded(Sender: TObject;
  Node: TTreeNode);
Var
  TreeNode   :TTreeNode;
begin
  TreeNode := Node.getFirstChild;
  TreeNode.Selected := True;
end;

procedure Tfrm_Security.tvSecurityMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Var
  Node  :TTreeNode;
begin
  if SecurityEditMode then
    exit;

  IF tvSecurity.GetNodeAt(X, Y) <> Nil Then
    begin
      tvSecurity.ClearSelection(False);
      Node := tvSecurity.GetNodeAt(X, Y);
      Node.Selected := True;
    end;
end;

procedure Tfrm_Security.tvSecurityMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Var
  Node   :tTreeNode;
begin
  if SecurityEditMode then
    exit;
  If Button <> mbRight Then
    exit;
  IF tvSecurity.GetNodeAt(X, Y) <> Nil Then
    begin
      Node := tvSecurity.GetNodeAt(X, Y);
      If Node.Level = 0 Then
        begin
          If (Node.Text = 'Users') Then
            begin
              itmDeleteUser.Visible := false;
              itmAddUser.Visible := true;
              pmUsers.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
            end;
          If (Node.Text = 'Requesters') Then
            begin
              itmDeleteRequester.Visible := false;
              itmAddRequester.Visible := true;
              pmRequesters.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
            end;

          If (Node.Text = 'Roles') Then
            begin
              itmDeleteRole.Visible := false;
              itmAddRole.Visible := true;
              pmRoles.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
            end;
          If (Node.Text = 'Image Centre Groups') Then
            begin
              itmDeleteImageCentreGroup.Visible := false;
              itmAddImageCentreGroup.Visible := true;
              pmImageCentreGroups.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
            end;
        end
      else If Node.Parent.Text = 'Users' Then
        begin
          itmDeleteUser.Visible := true;
          itmAddUser.Visible := false;
          pmUsers.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
        end
      else If Node.Parent.Text = 'Requesters' Then
        begin
          itmDeleteRequester.Visible := true;
          itmAddRequester.Visible := false;
          pmRequesters.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
        end
      else If Node.Parent.Text = 'Roles' Then
        begin
          itmDeleteRole.Visible := true;
          itmAddRole.Visible := false;
          pmRoles.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
        end
      else If Node.Parent.Text = 'Image Centre Groups' Then
        begin
          itmDeleteImageCentreGroup.Visible := true;
          itmAddImageCentreGroup.Visible := false;
          pmImageCentreGroups.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
        end;
    end;
end;

procedure Tfrm_Security.btn_BarcodeScannerLocClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    begin
      qry_AuthorityCode.Edit;
      qry_AuthorityCode['ScanEXE'] := OpenDialog.FileName;
    end;
end;


procedure Tfrm_Security.edt_eRecFileRepositryLocChange(Sender: TObject);
begin
  If cb_eRecordRepositry.ItemIndex = 1 Then
    begin
      qry_FileRepos.Close;
      qry_FileRepos.SQL.Clear;
      qry_FileRepos.SQL.Add('DELETE FROM MetroSystem WHERE Descr = ''eRecFileLoc''');
      qry_FileRepos.ExecSQL;
//-----
      qry_FileRepos.Close;
      qry_FileRepos.SQL.Clear;
      qry_FileRepos.SQL.Add('INSERT INTO MetroSystem (Descr, nCount, sValue)');
      qry_FileRepos.SQL.Add('VALUES (''eRecFileLoc'', 0, '+QuotedStr(trim(edt_eRecFileRepositryLoc.Text))+')');
      qry_FileRepos.ExecSQL;
    end;
end;

procedure Tfrm_Security.edt_PasswKeyPress(Sender: TObject; var Key: Char);
begin
  qry_AuthorityCode.Edit;
end;

procedure Tfrm_Security.chk_ValidClick(Sender: TObject);
begin
  If chk_Valid.Checked Then
    begin
      edt_ValidFrom.Enabled := True;
      edt_ValidTo.Enabled := True;
      btn_ValidFrom.Enabled := True;
      btn_ValidTo.Enabled := True;
    end
  else
    begin
      edt_ValidFrom.Enabled := False;
      edt_ValidTo.Enabled := False;
      btn_ValidFrom.Enabled := False;
      btn_ValidTo.Enabled := False;
    end;
end;

procedure Tfrm_Security.qry_BarcodeRangesAfterEdit(DataSet: TDataSet);
begin
  Repeat
    If frm_edtBarcodeRange.Execute(False,
                                   Dataset.FieldByName('Type').asString,
                                   Dataset.FieldByName('Branch').asString,
                                   Dataset.FieldByName('Department').asString,
                                   Dataset.FieldByName('RecordType').asString,
                                   Dataset.FieldByName('Suffix').asString,
                                   Dataset.FieldByName('BarCode_From').asInteger,
                                   Dataset.FieldByName('BarCode_To').asInteger,
                                   Dataset.FieldByName('AutoGenSuffix').asBoolean,
                                   Dataset.FieldByName('AutoGenBarcode').asBoolean) = mrOK Then
      begin
        Case frm_edtBarcodeRange.rgrp_Type.ItemIndex of
          0 : Dataset['Type'] := 'C';
          1 : Dataset['Type'] := 'F';
          2 : Dataset['Type'] := 'I';
        End;
        Dataset['Branch'] := frm_edtBarcodeRange.edt_Branch.Text;
        Dataset['Department'] := frm_edtBarcodeRange.edt_Dept.Text;
        Dataset['RecordType'] := frm_edtBarcodeRange.edt_RType.Text;
        Dataset['BarCode_From'] := StrtoInt(frm_edtBarcodeRange.edt_FromRange.Text);
        Dataset['BarCode_To'] := StrtoInt(frm_edtBarcodeRange.edt_ToRange.Text);
        Dataset['Suffix'] := frm_edtBarcodeRange.edt_Suffix.Text;
        Dataset['AutoGenBarcode'] := frm_edtBarcodeRange.chk_AutoGenBarcode.Checked;
        Dataset['AutoGenSuffix'] := frm_edtBarcodeRange.chk_AutoGenSuffix.Checked;
        Dataset.Post;
      end
    else Dataset.Cancel;

  Until not (Dataset.State in dsEditModes);
end;

procedure Tfrm_Security.qry_BarcodeRangesAfterInsert(DataSet: TDataSet);
begin
  Dataset['Code'] := CompsCode;
  Dataset['AddedBy'] := User;
  Dataset['AddedOn'] := Now;
  Repeat
    If frm_edtBarcodeRange.Execute(True, 'Container', '', '', '', '', -1, -1, false, false) = mrOK Then
      begin
        Case frm_edtBarcodeRange.rgrp_Type.ItemIndex of
          0 : Dataset['Type'] := 'C';
          1 : Dataset['Type'] := 'F';
          2 : Dataset['Type'] := 'I';
        End;
        Dataset['Branch'] := frm_edtBarcodeRange.edt_Branch.Text;
        Dataset['Department'] := frm_edtBarcodeRange.edt_Dept.Text;
        Dataset['RecordType'] := frm_edtBarcodeRange.edt_RType.Text;
        Dataset['BarCode_From'] := StrtoInt(frm_edtBarcodeRange.edt_FromRange.Text);
        Dataset['BarCode_To'] := StrtoInt(frm_edtBarcodeRange.edt_ToRange.Text);
        Dataset['Suffix'] := frm_edtBarcodeRange.edt_Suffix.Text;
        Dataset['AutoGenBarcode'] := frm_edtBarcodeRange.chk_AutoGenBarcode.Checked;
        Dataset['AutoGenSuffix'] := frm_edtBarcodeRange.chk_AutoGenSuffix.Checked;
        Dataset.Post;
      end
    else Dataset.Cancel;

  Until not (Dataset.State in dsEditModes);
end;

procedure Tfrm_Security.qry_BarcodeRangesBeforePost(DataSet: TDataSet);
begin
  If Dataset.FieldByName('BarCode_From').AsInteger = 0 Then
    begin
      Messagedlg('Please specify a From Range.', mtInformation, [mbOK], 0);
      Abort;
    end;
  If Dataset.FieldByName('BarCode_To').AsInteger = 0 Then
    begin
      Messagedlg('Please specify a To Range.', mtInformation, [mbOK], 0);
      Abort;
    end;
  If (Dataset.FieldByName('Type').AsString <> 'C') AND
     (Dataset.FieldByName('Type').AsString <> 'F') AND
     (Dataset.FieldByName('Type').AsString <> 'I') Then
    begin
      Messagedlg('Please specify a valid Type.', mtInformation, [mbOK], 0);
      Abort;
    end;

  If Dataset.FieldByName('Branch').AsString = '' Then
    begin
      Messagedlg('Please specify a Branch.', mtInformation, [mbOK], 0);
      Abort;
    end;
  If Dataset.FieldByName('Department').AsString = '' Then
    begin
      Messagedlg('Please specify a Department.', mtInformation, [mbOK], 0);
      Abort;
    end;
  If Dataset.FieldByName('RecordType').AsString = '' Then
    begin
      Messagedlg('Please specify a RecordType.', mtInformation, [mbOK], 0);
      Abort;
    end;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM Branches WHERE Branch = :Branch');
  qry_SQL.Parameters.ParamValues['Branch'] := Dataset.FieldByName('Branch').AsString;
  qry_SQL.Open;
  If qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      Messagedlg('Please specify a valid Branch.', mtInformation, [mbOK], 0);
      Abort;
    end;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM Departments WHERE Branch = :Branch AND Department = :Department');
  qry_SQL.Parameters.ParamValues['Branch'] := Dataset.FieldByName('Branch').AsString;
  qry_SQL.Parameters.ParamValues['Department'] := Dataset.FieldByName('Department').AsString;
  qry_SQL.Open;
  If qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      Messagedlg('Please specify a valid Department.', mtInformation, [mbOK], 0);
      Abort;
    end;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM IndexAuthRts WHERE Branch = :Branch AND Department = :Department AND Description = :RecordType');
  qry_SQL.Parameters.ParamValues['Branch'] := Dataset.FieldByName('Branch').AsString;
  qry_SQL.Parameters.ParamValues['Department'] := Dataset.FieldByName('Department').AsString;
  qry_SQL.Parameters.ParamValues['RecordType'] := Dataset.FieldByName('RecordType').AsString;
  qry_SQL.Open;
  If qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      Messagedlg('Please specify a valid RecordType. Also check the Department Access under Index Definitions if valid.', mtInformation, [mbOK], 0);
      Abort;
    end;

//----------Veridy if Barcode_Range does not overlap with another---------------
  If Dataset.State = dsInsert Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT * FROM [Barcode_Range]');
      qry_SQL.SQL.Add('WHERE Branch = :Branch');
      qry_SQL.SQL.Add('AND Department = :Department');
      qry_SQL.SQL.Add('AND RecordType = :RecordType');
      qry_SQL.SQL.Add('AND Type = :Type');
      qry_SQL.SQL.Add('AND Suffix = :Suffix');
      qry_SQL.SQL.Add('AND :Barcode BETWEEN BarCode_From AND BarCode_To');
      qry_SQL.Parameters.ParamValues['Branch'] := Dataset.FieldByName('Branch').AsString;
      qry_SQL.Parameters.ParamValues['Department'] := Dataset.FieldByName('Department').AsString;
      qry_SQL.Parameters.ParamValues['RecordType'] := Dataset.FieldByName('RecordType').AsString;
      qry_SQL.Parameters.ParamValues['Type'] := Dataset.FieldByName('Type').AsString;
      qry_SQL.Parameters.ParamValues['Suffix'] := Dataset.FieldByName('Suffix').AsString;
      qry_SQL.Parameters.ParamValues['Barcode'] := Dataset.FieldByName('BarCode_From').AsString;
      qry_SQL.Open;
      If not qry_SQL.IsEmpty Then
        begin
          Messagedlg('There is already a barcode Range defined with the criteria you specified.', mtInformation, [mbOK], 0);
          qry_SQL.Close;
          Abort;
        end;
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT * FROM [Barcode_Range]');
      qry_SQL.SQL.Add('WHERE Branch = :Branch');
      qry_SQL.SQL.Add('AND Department = :Department');
      qry_SQL.SQL.Add('AND RecordType = :RecordType');
      qry_SQL.SQL.Add('AND Type = :Type');
      qry_SQL.SQL.Add('AND Suffix = :Suffix');
      qry_SQL.SQL.Add('AND :Barcode BETWEEN BarCode_From AND BarCode_To');
      qry_SQL.Parameters.ParamValues['Branch'] := Dataset.FieldByName('Branch').AsString;
      qry_SQL.Parameters.ParamValues['Department'] := Dataset.FieldByName('Department').AsString;
      qry_SQL.Parameters.ParamValues['RecordType'] := Dataset.FieldByName('RecordType').AsString;
      qry_SQL.Parameters.ParamValues['Type'] := Dataset.FieldByName('Type').AsString;
      qry_SQL.Parameters.ParamValues['Suffix'] := Dataset.FieldByName('Suffix').AsString;
      qry_SQL.Parameters.ParamValues['Barcode'] := Dataset.FieldByName('BarCode_To').AsString;
      qry_SQL.Open;
      If not qry_SQL.IsEmpty Then
        begin
          Messagedlg('There is already a barcode Range defined with the criteria you specified.', mtInformation, [mbOK], 0);
          qry_SQL.Close;
          Abort;
        end;
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT * FROM [Barcode_Range]');
      qry_SQL.SQL.Add('WHERE Branch = :Branch');
      qry_SQL.SQL.Add('AND Department = :Department');
      qry_SQL.SQL.Add('AND RecordType = :RecordType');
      qry_SQL.SQL.Add('AND Type = :Type');
      qry_SQL.SQL.Add('AND AutoGenBarcode = 1');
      qry_SQL.Parameters.ParamValues['Branch'] := Dataset.FieldByName('Branch').AsString;
      qry_SQL.Parameters.ParamValues['Department'] := Dataset.FieldByName('Department').AsString;
      qry_SQL.Parameters.ParamValues['RecordType'] := Dataset.FieldByName('RecordType').AsString;
      qry_SQL.Parameters.ParamValues['Type'] := Dataset.FieldByName('Type').AsString;
      qry_SQL.Open;
      If not qry_SQL.IsEmpty Then
        begin
          Messagedlg('There is already a barcode Range defined with the Auto-Generate Barcode for this RecordType. Only 1 Barcode Range with the Auto-Generate Barcode property is allowed per RecordType.', mtInformation, [mbOK], 0);
          qry_SQL.Close;
          Abort;
        end;
    end;
end;

procedure Tfrm_Security.PageControl1Change(Sender: TObject);
begin
  If PageControl1.ActivePage = Tabsheet1 Then
    begin  //Users, Roles, Requesters
      pnlEditUser.Align := alClient;
      pnlEditRole.Align := alClient;
      pnlEditImageCentreGroup.Align := alClient;
      lvSecurityDetails.Align := alClient;

      pnlEditUser.Visible := False;
      pnlEditRole.Visible := False;
      pnlEditImageCentreGroup.Visible := False;
      lvSecurityDetails.Visible := True;

      nav_Clients.visible := false;
      btn_Find.Visible := True;

      BuildSecurityTree();
    end;
  If PageControl1.ActivePage = Tabsheet8 Then
    begin
      qry_Company.Close;
      qry_Company.SQL.Clear;
      qry_Company.SQL.Add('select * from company where CompanyCode = '+QuotedStr(CompsCode));
      qry_Company.Open;
      OldRefRate := qry_Company.FieldByName('FilAreaRefresh').AsInteger;
      edt_RefRate.Text := qry_Company.FieldByName('FilAreaRefresh').AsString;
//------
      qry_DefLocLen.Close;
      qry_DefLocLen.SQL.Text := 'SELECT DefLocLen FROM Company WHERE CompanyCode = '+QuotedStr(CompsCode);
      qry_DefLocLen.Open;
      cmb_DefLocLen.ItemIndex := qry_DefLocLen.Fields[0].asInteger;
      qry_DefLocLen.Close;
//------
     qry_FileRepos.Close;
     qry_FileRepos.SQL.Clear;
     qry_FileRepos.SQL.Add('SELECT * FROM MetroSystem WHERE Descr = ''eRecLocType''');
     qry_FileRepos.Open;
     If qry_FileRepos.IsEmpty Then
       begin
         qry_FileRepos.Close;
         qry_FileRepos.SQL.Clear;
         qry_FileRepos.SQL.Add('INSERT INTO MetroSystem (Descr, nCount, sValue)');
         qry_FileRepos.SQL.Add('VALUES (''eRecLocType'', 0, ''SQL-Server'')');
         qry_FileRepos.ExecSQL;
         qry_FileRepos.Close;
         qry_FileRepos.SQL.Clear;
         qry_FileRepos.SQL.Add('INSERT INTO MetroSystem (Descr, nCount, sValue)');
         qry_FileRepos.SQL.Add('VALUES (''eRecFileLoc'', 0, '''')');
         qry_FileRepos.ExecSQL;
         cb_eRecordRepositry.ItemIndex := 0;
         edt_eRecFileRepositryLoc.Text := '';
       end
     else
       begin
         If UpperCase(trim(qry_FileRepos.FieldByName('sValue').AsString)) = 'SQL-SERVER' Then
           cb_eRecordRepositry.ItemIndex := 0
         else If UpperCase(trim(qry_FileRepos.FieldByName('sValue').AsString)) = 'FILE-SYSTEM' Then
          cb_eRecordRepositry.ItemIndex := 1
         else cb_eRecordRepositry.ItemIndex := -1;

         If cb_eRecordRepositry.ItemIndex = 1 Then
           begin
             qry_FileRepos.Close;
             qry_FileRepos.SQL.Clear;
             qry_FileRepos.SQL.Add('SELECT * FROM MetroSystem WHERE Descr = ''eRecFileLoc''');
             qry_FileRepos.Open;
             edt_eRecFileRepositryLoc.Text := trim(qry_FileRepos.FieldbyName('sValue').asString);
           end
         else
           begin
             edt_eRecFileRepositryLoc.Text := '';
           end;
       end;
      qry_FileRepos.Close;
      edt_eRecFileRepositryLoc.visible := (cb_eRecordRepositry.ItemIndex = 1);
      btn_GeteRecFileRepositry.visible := (cb_eRecordRepositry.ItemIndex = 1);
      lbl_eRecFileRepositryLoc.visible := (cb_eRecordRepositry.ItemIndex = 1);
//------
      nav_Clients.DataSource := dts_Company;
      nav_Clients.VisibleButtons := [nbEdit,nbPost,nbCancel,nbRefresh];
      nav_Clients.Visible := true;
      btn_Find.Visible := False;
    end;
  If PageControl1.ActivePage = Tabsheet10 Then
    begin
      qry_BarcodeRanges.Close;
      qry_BarcodeRanges.SQL.Clear;
      qry_BarcodeRanges.SQL.Add('SELECT * FROM dbo.Barcode_Range');
      qry_BarcodeRanges.Open;
      frm_Console.AutoSizeExistingColumns(DBGrid2);
//------
      nav_Clients.DataSource := dts_BarcodeRanges;
      nav_Clients.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbRefresh];
      nav_Clients.Visible := true;
      btn_Find.Visible := False;
    end;
end;

procedure Tfrm_Security.cb_eRecordRepositryChange(Sender: TObject);
begin
  qry_FileRepos.Close;
  qry_FileRepos.SQL.Clear;
  qry_FileRepos.SQL.Add('DELETE FROM MetroSystem WHERE Descr = ''eRecLocType''');
  qry_FileRepos.ExecSQL;
  qry_FileRepos.Close;
  qry_FileRepos.SQL.Clear;
  qry_FileRepos.SQL.Add('DELETE FROM MetroSystem WHERE Descr = ''eRecFileLoc''');
  qry_FileRepos.ExecSQL;
//-----
  If cb_eRecordRepositry.ItemIndex = 0 Then
    begin
      qry_FileRepos.Close;
      qry_FileRepos.SQL.Clear;
      qry_FileRepos.SQL.Add('INSERT INTO MetroSystem (Descr, nCount, sValue)');
      qry_FileRepos.SQL.Add('VALUES (''eRecLocType'', 0, ''SQL-Server'')');
      qry_FileRepos.ExecSQL;
//--------
      qry_FileRepos.Close;
      qry_FileRepos.SQL.Clear;
      qry_FileRepos.SQL.Add('INSERT INTO MetroSystem (Descr, nCount, sValue)');
      qry_FileRepos.SQL.Add('VALUES (''eRecFileLoc'', 0, '''')');
      qry_FileRepos.ExecSQL;
     end
   else If cb_eRecordRepositry.ItemIndex = 1 Then
     begin
      qry_FileRepos.Close;
      qry_FileRepos.SQL.Clear;
      qry_FileRepos.SQL.Add('INSERT INTO MetroSystem (Descr, nCount, sValue)');
      qry_FileRepos.SQL.Add('VALUES (''eRecLocType'', 0, ''File-System'')');
      qry_FileRepos.ExecSQL;
//--------
      qry_FileRepos.Close;
      qry_FileRepos.SQL.Clear;
      qry_FileRepos.SQL.Add('INSERT INTO MetroSystem (Descr, nCount, sValue)');
      qry_FileRepos.SQL.Add('VALUES (''eRecFileLoc'', 0, '+QuotedStr(trim(edt_eRecFileRepositryLoc.Text))+')');
      qry_FileRepos.ExecSQL;
     end;
   edt_eRecFileRepositryLoc.visible := (cb_eRecordRepositry.ItemIndex = 1);
   btn_GeteRecFileRepositry.visible := (cb_eRecordRepositry.ItemIndex = 1);
   lbl_eRecFileRepositryLoc.visible := (cb_eRecordRepositry.ItemIndex = 1);
   If edt_eRecFileRepositryLoc.visible = false then
     edt_eRecFileRepositryLoc.Text := '';
end;

procedure Tfrm_Security.chk_OutofOfficeClick(Sender: TObject);
begin
  If chk_OutofOffice.Checked Then
    begin
      edt_OutFrom.Enabled := True;
      edt_OutTo.Enabled := True;
      btn_OutFrom.Enabled := True;
      btn_OutTo.Enabled := True;
    end
  else
    begin
      edt_OutFrom.Enabled := False;
      edt_OutTo.Enabled := False;
      btn_OutFrom.Enabled := False;
      btn_OutTo.Enabled := False;
    end;
end;

procedure Tfrm_Security.qry_AuthorityCodeAfterCancel(DataSet: TDataSet);
begin
  tvSecurity.Enabled := True;
  SecurityEditMode := False;
  edt_Passw.Text := PasswordNotChanged;
  If tvSecurity.Selected <> nil Then
    RefreshSecurityTree(tvSecurity.Selected);
end;

procedure Tfrm_Security.qry_AuthorityCodeAfterEdit(DataSet: TDataSet);
begin
  tvSecurity.Enabled := False;
  SecurityEditMode := True;
end;

procedure Tfrm_Security.qry_AuthorityCodeAfterInsert(
  DataSet: TDataSet);
begin
  tvSecurity.Enabled := False;
  SecurityEditMode := True;
  Dataset['Valid_Option'] := 0;
  Dataset['OutOfOffice_option'] := 0;
  Dataset['ProxyLoc'] := 0;
  Dataset['sysadmin'] := 0;
  Dataset['ImageCentreAdmin'] := 0;
  edt_Passw.Text := '';
  Dataset['WorkPlaceID'] := dm_Metrofiler.CreateGuid;
end;

procedure Tfrm_Security.qry_AuthorityCodeAfterPost(DataSet: TDataSet);
Var
  J             :Integer;
begin
  tvSecurity.Enabled := True;
  SecurityEditMode := False;
  If (tvSecurity.Selected <> Nil) Then
    RefreshSecurityTree(tvSecurity.Selected);

  tvSecurity.FullExpand;
  For J := 0 to tvSecurity.Items.Count-1 Do
    begin
      If pos(Dataset.FieldByName('UserId').AsString, tvSecurity.Items.Item[J].Text) > 0 Then
        begin
          tvSecurity.Items.Item[J].Selected := True;
          tvSecurityChange(tvSecurity, tvSecurity.Items.Item[J]);
          exit;
        end;
    end;
end;

procedure Tfrm_Security.qry_AuthorityCodeAfterScroll(DataSet: TDataSet);
begin
  if Dataset.State <> dsInsert then
    edt_Passw.Text := PasswordNotChanged;
end;

procedure Tfrm_Security.qry_AuthorityCodeBeforePost(DataSet: TDataSet);
begin
  If (trim(Dataset.FieldByName('UserID').AsString) = '') Then
    begin
      MessageDlg('Please specify a Authority ID!', mtInformation, [mbOK], 0);
      Abort;
    end;
  If Dataset.FieldByName('UserType').AsString = 'S' Then
    If (trim(edt_Passw.Text) = '') Then
      begin
        MessageDlg('Please specify a Password!', mtInformation, [mbOK], 0);
        Abort;
      end;
  If (trim(Dataset.FieldByName('Surname').AsString) = '')or(trim(Dataset.FieldByName('Name').AsString) = '') Then
    begin
      MessageDlg('Please specify a Name and Surname!', mtInformation, [mbOK], 0);
      Abort;
    end;
//---------
{  If (Dataset.FieldByName('eRecDataMan').asInteger = 1)and
     (Dataset.FieldByName('ePending').asInteger = 0)Then
    begin
      MessageDlg('In order to grant rights to "eRecords Data Manager" you must have rights to "ePending"!', mtInformation, [mbOK], 0);
      Abort;
    end;}
  If edt_Passw.Text <> PasswordNotChanged  Then
    Dataset['Passw'] := dm_Metrofiler.EncryptPassw(edt_Passw.Text);
  PK_Auth := Dataset.FieldbyName('USERID').AsString;
end;

procedure Tfrm_Security.edt_RefRateChange(Sender: TObject);
begin
  if (qry_Company.fieldByName('FilAreaRefresh').AsInteger <> StrToIntDef(edt_RefRate.Text,0)) and
     (not (dts_Company.State in dsEditModes))then
    qry_Company.edit;
end;

procedure Tfrm_Security.qry_CompanyBeforePost(DataSet: TDataSet);
Var
  A, J   :Integer;
begin
  qry_Company['FilAreaRefresh'] := StrToIntDef(edt_RefRate.Text,0);
  qry_Company['DefLocLen'] := cmb_DefLocLen.itemIndex;
//=========PrText1==============================================================
  For A := 1 to 4 Do
    begin
      For J := 1 to 4 Do
        begin
          If trim(TDBComboBox(FindComponent('cmb_PrText'+InttoStr(A))).Text) <> '' Then
            begin
              If A <> J Then
                begin
                  If trim(TDBComboBox(FindComponent('cmb_PrText'+InttoStr(A))).Text) = trim(TDBComboBox(FindComponent('cmb_PrText'+InttoStr(J))).Text) Then
                    begin
                      MessageDlg('Duplicate Delivery Note Info Fields selected. Please correct.', mtInformation, [mbOK], 0);
                      Abort;
                    end;
                end;
            end;
        end;
    end;
end;

procedure Tfrm_Security.qry_ImageCentreGroupsAfterInsert(DataSet: TDataSet);
begin
  tvSecurity.Enabled := False;
  SecurityEditMode := True;
end;

procedure Tfrm_Security.qry_ImageCentreGroupsAfterPost(DataSet: TDataSet);
begin
  tvSecurity.Enabled := True;
  SecurityEditMode := False;
  If (tvSecurity.Selected <> Nil) Then
    RefreshSecurityTree(tvSecurity.Selected);
end;

procedure Tfrm_Security.qry_RolesAfterInsert(DataSet: TDataSet);
begin
  tvSecurity.Enabled := False;
  SecurityEditMode := True;
end;

procedure Tfrm_Security.qry_RolesAfterPost(DataSet: TDataSet);
Var
    J   :Integer;
begin
  tvSecurity.Enabled := True;
  SecurityEditMode := False;
  If (tvSecurity.Selected <> Nil) Then
    RefreshSecurityTree(tvSecurity.Selected);

  tvSecurity.FullExpand;
  For J := 0 to tvSecurity.Items.Count-1 Do
    begin
      If pos(Dataset.FieldByName('Role').AsString, tvSecurity.Items.Item[J].Text) > 0 Then
        begin
          tvSecurity.Items.Item[J].Selected := True;
          tvSecurityChange(tvSecurity, tvSecurity.Items.Item[J]);
          exit;
        end;
    end;
end;

procedure Tfrm_Security.rbtn_AuthTypeChange(Sender: TObject);
begin
  lbl_Passw.Visible :=  rbtn_AuthType.ItemIndex = 0;
  edt_Passw.Visible :=  rbtn_AuthType.ItemIndex = 0;
end;

procedure Tfrm_Security.cmb_DefLocLenChange(Sender: TObject);
begin
  qry_Company.Edit;
end;

procedure Tfrm_Security.dts_AuthorityCodeDataChange(Sender: TObject;
  Field: TField);
begin
  if qry_AuthorityCode.FieldByName('UserType').AsString = 'S' then
    begin
      lbl_Passw.Visible := True;
      edt_Passw.Visible := True;
      chk_OutofOffice.Visible := True;
      edt_OutFrom.Visible := True;
      btn_OutFrom.Visible := True;
      lbl_OutTo.Visible := True;
      edt_OutTo.Visible := True;
      btn_OutTo.Visible := True;
      chk_Valid.Visible := True;
      edt_ValidFrom.Visible := True;
      btn_ValidFrom.Visible := True;
      lbl_ValidTo.Visible := True;
      edt_ValidTo.Visible := True;
      btn_ValidTo.Visible := True;

      lbl_BarcodeScannerLoc.Visible := True;
      edt_BarcodeScannerLoc.Visible := True;
      btn_BarcodeScannerLoc.Visible := True;
      chk_SysAdmin.Visible := True;
      chk_ProxyLoc.Visible := True;
      chk_ImageCentreAdmin.Visible := True;
      btnRoleAccess.Visible := True;
      btnUserSystemAccess.Visible := True;
      btn_UserRecordTypeAccess.Visible := True;
      btn_UserRecordCatAccess.Visible := True;
      btn_UserFilingAreaAccess.Visible := True;
      btn_UserReportAccess.Visible := True;
      btn_UserDeliveryTypeAccess.Visible := True;
      rbtn_AuthType.Visible := True;
    end
  else if qry_AuthorityCode.FieldByName('UserType').AsString = 'R' then
    begin
      lbl_Passw.Visible := False;
      edt_Passw.Visible := False;
      chk_OutofOffice.Visible := False;
      edt_OutFrom.Visible := False;
      btn_OutFrom.Visible := False;
      lbl_OutTo.Visible := False;
      edt_OutTo.Visible := False;
      btn_OutTo.Visible := False;
      chk_Valid.Visible := False;
      edt_ValidFrom.Visible := False;
      btn_ValidFrom.Visible := False;
      lbl_ValidTo.Visible := False;
      edt_ValidTo.Visible := False;
      btn_ValidTo.Visible := False;

      lbl_BarcodeScannerLoc.Visible := False;
      edt_BarcodeScannerLoc.Visible := False;
      btn_BarcodeScannerLoc.Visible := False;
      chk_SysAdmin.Visible := False;
      chk_ProxyLoc.Visible := False;
      chk_ImageCentreAdmin.Visible := false;
      btnRoleAccess.Visible := False;
      btnUserSystemAccess.Visible := False;
      btn_UserRecordTypeAccess.Visible := False;
      btn_UserRecordCatAccess.Visible := False;
      btn_UserFilingAreaAccess.Visible := False;
      btn_UserReportAccess.Visible := False;
      btn_UserDeliveryTypeAccess.Visible := False;
      rbtn_AuthType.Visible := False;
    end
  else if qry_AuthorityCode.FieldByName('UserType').AsString = 'A' then
    begin
      lbl_Passw.Visible := False;
      edt_Passw.Visible := False;
      chk_OutofOffice.Visible := True;
      edt_OutFrom.Visible := True;
      btn_OutFrom.Visible := True;
      lbl_OutTo.Visible := True;
      edt_OutTo.Visible := True;
      btn_OutTo.Visible := True;
      chk_Valid.Visible := True;
      edt_ValidFrom.Visible := True;
      btn_ValidFrom.Visible := True;
      lbl_ValidTo.Visible := True;
      edt_ValidTo.Visible := True;
      btn_ValidTo.Visible := True;

      lbl_BarcodeScannerLoc.Visible := True;
      edt_BarcodeScannerLoc.Visible := True;
      btn_BarcodeScannerLoc.Visible := True;
      chk_SysAdmin.Visible := True;
      chk_ProxyLoc.Visible := True;
      chk_ImageCentreAdmin.Visible := True;
      btnRoleAccess.Visible := True;
      btnUserSystemAccess.Visible := True;
      btn_UserRecordTypeAccess.Visible := True;
      btn_UserRecordCatAccess.Visible := True;
      btn_UserFilingAreaAccess.Visible := True;
      btn_UserReportAccess.Visible := True;
      btn_UserDeliveryTypeAccess.Visible := True;
      rbtn_AuthType.Visible := True;
    end;
end;

procedure Tfrm_Security.dts_AuthorityCodeStateChange(Sender: TObject);
begin
  If (not(qry_AuthorityCode.State in dsEditModes))and(not(qry_AuthorityCode.IsEmpty)) Then
    begin
      btnRoleAccess.Enabled := True;
      btnUserSystemAccess.Enabled := True;
      btn_UserRecordTypeAccess.Enabled := True;
      btn_UserRecordCatAccess.Enabled := True;
      btn_UserFilingAreaAccess.Enabled := True;
      btn_UserReportAccess.Enabled := True;
      btn_UserDeliveryTypeAccess.Enabled := True;
    end
  else
    begin
      btnRoleAccess.Enabled := False;
      btnUserSystemAccess.Enabled := False;
      btn_UserRecordTypeAccess.Enabled := False;
      btn_UserRecordCatAccess.Enabled := False;
      btn_UserFilingAreaAccess.Enabled := False;
      btn_UserReportAccess.Enabled := False;
      btn_UserDeliveryTypeAccess.Enabled := False;
    end;
end;

procedure Tfrm_Security.qry_CompanyAfterCancel(DataSet: TDataSet);
begin
  edt_RefRate.Text := IntToStr(OldRefRate);
end;

procedure Tfrm_Security.qry_CompanyAfterPost(DataSet: TDataSet);
begin
  OldRefRate := StrToIntDef(edt_RefRate.Text,0);
  if OldRefRate = 0 then
    frm_Console.FilRef := 300000    //default to 5 mins
  else
    frm_Console.FilRef := OldRefRate*1000;    //Input as seconds!!!
end;

procedure Tfrm_Security.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_Console.act_Security.Enabled := True;
  Action := caFree;
end;

procedure Tfrm_Security.qry_AuthorityCodeBeforeEdit(DataSet: TDataSet);
begin
  PrevUserType := Dataset.FieldbyName('UserType').asString;
end;

procedure Tfrm_Security.itmAddUserClick(Sender: TObject);
begin
  btnRoleAccess.Visible := false;
  btnUserSystemAccess.Visible := false;
  btn_UserRecordTypeAccess.Visible := false;
  btn_UserRecordCatAccess.Visible := false;
  btn_UserFilingAreaaccess.Visible := false;
  btn_UserReportAccess.Visible := False;
  btn_UserDeliveryTypeAccess.Visible := False;

  pnlEditRole.Visible := False;
  pnlEditUser.Visible := True;
  pnlEditImageCentreGroup.Visible := False;
  lvSecurityDetails.Visible := False;

  qry_AuthorityCode.Close;
  qry_AuthorityCode.SQL.Clear;
  qry_AuthorityCode.SQL.Add('SELECT * FROM AuthCodes WHERE UserId = :UserId ORDER BY UserID');
  qry_AuthorityCode.Parameters.ParamValues['UserId'] := 'xxxcf';
  qry_AuthorityCode.Open;
  qry_AuthorityCode.Insert;
  qry_AuthorityCode['UserType'] := 'S';
end;

procedure Tfrm_Security.itmDeleteImageCentreGroupClick(Sender: TObject);
Var
  GroupID   :Integer;
begin
  GroupID := StrtoInt(copy(tvSecurity.Selected.Text, 1, pos(' -', tvSecurity.Selected.Text)-1));

  pnlEditImageCentreGroup.Visible := True;
  lvSecurityDetails.Visible := False;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM ImageCentreRts WHERE GroupId = :GroupId');
  qry_SQL.Parameters.ParamValues['GroupId'] := GroupId;
  qry_SQL.ExecSQL;

  qry_ImageCentreGroups.Close;
  qry_ImageCentreGroups.SQL.Clear;
  qry_ImageCentreGroups.SQL.Add('SELECT * FROM ImageCentreGroups WHERE GroupId = :GroupId ORDER BY GroupId');
  qry_ImageCentreGroups.Parameters.ParamValues['GroupId'] := GroupId;
  qry_ImageCentreGroups.Open;
  qry_ImageCentreGroups.Delete;

  tvSecurity.Selected.Delete;
end;

procedure Tfrm_Security.itmDeleteRequesterClick(Sender: TObject);
Var
  UserID   :String;
begin
  UserID := copy(tvSecurity.Selected.Text, 1, pos(' -', tvSecurity.Selected.Text)-1);

  pnlEditUser.Visible := True;
  lvSecurityDetails.Visible := False;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM LAuthRts WHERE UserId = :UserID');
  qry_SQL.Parameters.ParamValues['UserId'] := UserID;
  qry_SQL.ExecSQL;
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM RCAuthRts WHERE UserId = :UserID');
  qry_SQL.Parameters.ParamValues['UserId'] := UserID;
  qry_SQL.ExecSQL;
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM IndexUAuthRts WHERE UserId = :UserID');
  qry_SQL.Parameters.ParamValues['UserId'] := UserID;
  qry_SQL.ExecSQL;

  qry_AuthorityCode.Close;
  qry_AuthorityCode.SQL.Clear;
  qry_AuthorityCode.SQL.Add('SELECT * FROM AuthCodes WHERE UserId = :UserId ORDER BY UserID');
  qry_AuthorityCode.Parameters.ParamValues['UserId'] := UserID;
  qry_AuthorityCode.Open;
  qry_AuthorityCode.Delete;

  tvSecurity.Selected.Delete;
end;

procedure Tfrm_Security.itmDeleteRoleClick(Sender: TObject);
Var
  RoleID   :Integer;
begin
  RoleID := StrtoInt(copy(tvSecurity.Selected.Text, 1, pos(' -', tvSecurity.Selected.Text)-1));

  pnlEditRole.Visible := True;
  lvSecurityDetails.Visible := False;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM LAuthRts WHERE RoleId = :RoleId');
  qry_SQL.Parameters.ParamValues['RoleId'] := RoleId;
  qry_SQL.ExecSQL;
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM RCAuthRts WHERE RoleId = :RoleId');
  qry_SQL.Parameters.ParamValues['RoleId'] := RoleId;
  qry_SQL.ExecSQL;
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM IndexUAuthRts WHERE RoleId = :RoleId');
  qry_SQL.Parameters.ParamValues['RoleId'] := RoleId;
  qry_SQL.ExecSQL;
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM RolesRts WHERE RoleId = :RoleId');
  qry_SQL.Parameters.ParamValues['RoleId'] := RoleId;
  qry_SQL.ExecSQL;

  qry_Roles.Close;
  qry_Roles.SQL.Clear;
  qry_Roles.SQL.Add('SELECT * FROM Roles WHERE RoleId = :RoleId ORDER BY RoleID');
  qry_Roles.Parameters.ParamValues['RoleId'] := RoleId;
  qry_Roles.Open;
  qry_Roles.Delete;

  tvSecurity.Selected.Delete;
end;

procedure Tfrm_Security.itmDeleteUserClick(Sender: TObject);
Var
  UserID   :String;
begin
  UserID := copy(tvSecurity.Selected.Text, 1, pos(' -', tvSecurity.Selected.Text)-1);

  pnlEditUser.Visible := True;
  lvSecurityDetails.Visible := False;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM LAuthRts WHERE UserId = :UserID');
  qry_SQL.Parameters.ParamValues['UserId'] := UserID;
  qry_SQL.ExecSQL;
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM RCAuthRts WHERE UserId = :UserID');
  qry_SQL.Parameters.ParamValues['UserId'] := UserID;
  qry_SQL.ExecSQL;
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM IndexUAuthRts WHERE UserId = :UserID');
  qry_SQL.Parameters.ParamValues['UserId'] := UserID;
  qry_SQL.ExecSQL;
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('DELETE FROM RolesRts WHERE UserId = :UserID');
  qry_SQL.Parameters.ParamValues['UserId'] := UserID;
  qry_SQL.ExecSQL;

  qry_AuthorityCode.Close;
  qry_AuthorityCode.SQL.Clear;
  qry_AuthorityCode.SQL.Add('SELECT * FROM AuthCodes WHERE UserId = :UserId ORDER BY UserID');
  qry_AuthorityCode.Parameters.ParamValues['UserId'] := UserID;
  qry_AuthorityCode.Open;
  qry_AuthorityCode.Delete;

  tvSecurity.Selected.Delete;
end;

procedure Tfrm_Security.lvSecurityDetailsDblClick(Sender: TObject);
Var
  UserId   :String;
  J        :Integer;
begin
  if lvSecurityDetails.SelCount > 0 then
    begin
      UserId := lvSecurityDetails.Selected.Caption;
    //-----
      For J := 0 to tvSecurity.Items.Count -1 Do
        begin
          If (tvSecurity.Items.item[j].Level = 1)AND
             (tvSecurity.Items.Item[J].Text = UserID) Then
             begin
               tvSecurity.Items.Item[J].Selected := true;
               tvSecurityChange(tvSecurity, tvSecurity.Items.Item[J]);
               break;
             end;
        end;
    end;
end;

procedure Tfrm_Security.BuildSecurityTree();
Var
  tnCatagory :TTreeNode;
  tnUser :TTreeNode;
  TempStr    :String;
begin
  tvSecurity.Items.Clear;
//---------------Add Users-----------------------------------------
  tnCatagory := tvSecurity.Items.Add(Nil, 'Users');
  tnCatagory.ImageIndex := 0;
  tnCatagory.SelectedIndex := 0;
//------------
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  If frm_Console.AccessSysAdmin Then
    begin
      qry_SQL.SQL.Add('SELECT a.UserId, a.Name, a.Surname, a.UserType FROM AuthCodes a WHERE a.UserType IN (''S'', ''A'') ORDER BY a.UserID');
    end
  else
    begin
      qry_SQL.SQL.Add('SELECT');
      qry_SQL.SQL.Add('	a.UserId, a.Name, a.Surname, a.UserType');
      qry_SQL.SQL.Add('FROM');
      qry_SQL.SQL.Add('	AuthCodes a');
      qry_SQL.SQL.Add('	INNER JOIN  RolesRts ra ON a.UserId = ra.UserId');
      qry_SQL.SQL.Add('	INNER JOIN  RolesRts rb ON ra.RoleId = rb.RoleId');
      qry_SQL.SQL.Add('	INNER JOIN  AuthCodes b ON rb.UserId = b.UserId');
      qry_SQL.SQL.Add('WHERE');
      qry_SQL.SQL.Add('	b.UserId = :UserId AND');
      qry_SQL.SQL.Add('	a.UserType IN (''S'', ''A'')');
      qry_SQL.SQL.Add('UNION');
      qry_SQL.SQL.Add('SELECT');
      qry_SQL.SQL.Add('	a.UserId, a.Name, a.Surname, a.UserType');
      qry_SQL.SQL.Add('FROM');
      qry_SQL.SQL.Add('	AuthCodes a');
      qry_SQL.SQL.Add('WHERE a.SysAdmin = 0 AND a.UserId NOT IN (SELECT UserId FROM RolesRts) AND');
      qry_SQL.SQL.Add('	a.UserType IN (''S'', ''A'')');
      qry_SQL.SQL.Add('ORDER BY a.UserID');
      qry_SQL.Parameters.ParamByName('UserId').Value := User;
    end;
  qry_SQL.Open;
  qry_SQL.First;
  While not qry_SQL.EOF Do
    begin
      TempStr := trim(qry_SQL.FieldbyName('NAME').AsString) + ' ' + trim(qry_SQL.FieldbyName('SURNAME').AsString);
      TempStr := trim(qry_SQL.FieldbyName('USERID').AsString) + ' - ' + trim(TempStr);

      tnUser := tvSecurity.Items.AddChild(tnCatagory, TempStr);
      if qry_SQL.FieldbyName('UserType').asString  = 'S' then
        begin
          tnUser.ImageIndex := 1;
          tnUser.SelectedIndex := 1;
        end
      else
        begin
          tnUser.ImageIndex := 4;
          tnUser.SelectedIndex := 4;
        end;
      qry_SQL.Next;
    end;
  qry_SQL.Close;
//---------------Add Roles-----------------------------------------
  If frm_Console.AccessSysAdmin Then
    begin
      tnCatagory := tvSecurity.Items.Add(Nil, 'Roles');
      tnCatagory.ImageIndex := 0;
      tnCatagory.SelectedIndex := 0;
    //------------
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      If frm_Console.AccessSysAdmin Then
        begin
          qry_SQL.SQL.Add('SELECT RoleId, Role FROM Roles ORDER BY RoleId');
        end
      else
        begin
          qry_SQL.SQL.Add('SELECT');
          qry_SQL.SQL.Add('	r.RoleId,');
          qry_SQL.SQL.Add('	r.Role');
          qry_SQL.SQL.Add('FROM');
          qry_SQL.SQL.Add('	Roles r');
          qry_SQL.SQL.Add('	INNER JOIN RolesRts rt ON r.RoleId = rt.RoleId');
          qry_SQL.SQL.Add('WHERE');
          qry_SQL.SQL.Add('	rt.UserId = :UserId');
          qry_SQL.SQL.Add('UNION');
          qry_SQL.SQL.Add('SELECT');
          qry_SQL.SQL.Add('	a.RoleId,');
          qry_SQL.SQL.Add('	a.Role');
          qry_SQL.SQL.Add('FROM');
          qry_SQL.SQL.Add('	Roles a');
          qry_SQL.SQL.Add('WHERE a.RoleId NOT IN (SELECT RoleId FROM RolesRts)');
          qry_SQL.SQL.Add('ORDER BY');
          qry_SQL.SQL.Add('	r.RoleId');
          qry_SQL.Parameters.ParamByName('UserId').Value := User;
        end;
      qry_SQL.Open;
      qry_SQL.First;
      While not qry_SQL.EOF Do
        begin
          TempStr := trim(qry_SQL.FieldbyName('ROLEID').AsString) + ' - '+ trim(qry_SQL.FieldbyName('ROLE').AsString);

          tnUser := tvSecurity.Items.AddChild(tnCatagory, TempStr);
          tnUser.ImageIndex := 2;
          tnUser.SelectedIndex := 2;
          qry_SQL.Next;
        end;
      qry_SQL.Close;
    end;
  //---------------Add Image Centre Groups-----------------------------------------
  If frm_Console.AccessSysAdmin Then
    begin
      tnCatagory := tvSecurity.Items.Add(Nil, 'Image Centre Groups');
      tnCatagory.ImageIndex := 0;
      tnCatagory.SelectedIndex := 0;
    //------------
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      If frm_Console.AccessSysAdmin Then
        begin
          qry_SQL.SQL.Add('SELECT GroupId, ImageCentreGroup FROM ImageCentreGroups ORDER BY GroupId');
        end
      else
        begin
          qry_SQL.SQL.Add('SELECT');
          qry_SQL.SQL.Add('	r.GroupId,');
          qry_SQL.SQL.Add('	r.ImageCentreGroup');
          qry_SQL.SQL.Add('FROM');
          qry_SQL.SQL.Add('	ImageCentreGroups r');
          qry_SQL.SQL.Add('	INNER JOIN ImageCentreRts rt ON r.GroupId = rt.GroupId');
          qry_SQL.SQL.Add('WHERE');
          qry_SQL.SQL.Add('	rt.UserId = :UserId');
          qry_SQL.SQL.Add('UNION');
          qry_SQL.SQL.Add('SELECT');
          qry_SQL.SQL.Add('	a.GroupId,');
          qry_SQL.SQL.Add('	a.ImageCentreGroup');
          qry_SQL.SQL.Add('FROM');
          qry_SQL.SQL.Add('	ImageCentreGroups a');
          qry_SQL.SQL.Add('WHERE a.GroupId NOT IN (SELECT GroupId FROM ImageCentreRts)');
          qry_SQL.SQL.Add('ORDER BY');
          qry_SQL.SQL.Add('	r.GroupId');
          qry_SQL.Parameters.ParamByName('UserId').Value := User;
        end;
      qry_SQL.Open;
      qry_SQL.First;
      While not qry_SQL.EOF Do
        begin
          TempStr := trim(qry_SQL.FieldbyName('GroupId').AsString) + ' - '+ trim(qry_SQL.FieldbyName('ImageCentreGroup').AsString);

          tnUser := tvSecurity.Items.AddChild(tnCatagory, TempStr);
          tnUser.ImageIndex := 2;
          tnUser.SelectedIndex := 2;
          qry_SQL.Next;
        end;
      qry_SQL.Close;
    end;
//---------------Add Requesters-----------------------------------------
  tnCatagory := tvSecurity.Items.Add(Nil, 'Requesters');
  tnCatagory.ImageIndex := 0;
  tnCatagory.SelectedIndex := 0;
//------------
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT a.UserId, a.Name, a.Surname FROM AuthCodes a WHERE a.UserType = ''R'' ORDER BY a.UserID');
  qry_SQL.Open;
  qry_SQL.First;
  While not qry_SQL.EOF Do
    begin
      TempStr := trim(qry_SQL.FieldbyName('NAME').AsString) + ' ' + trim(qry_SQL.FieldbyName('SURNAME').AsString);
      TempStr := trim(qry_SQL.FieldbyName('USERID').AsString) + ' - ' + trim(TempStr);

      tnUser := tvSecurity.Items.AddChild(tnCatagory, TempStr);
      tnUser.ImageIndex := 3;
      tnUser.SelectedIndex := 3;
      qry_SQL.Next;
    end;
  qry_SQL.Close;
end;

procedure Tfrm_Security.RefreshSecurityTree(TreeNode :TTreeNode);
Var
  tnUser    :TTreeNode;
  TempStr   :String;
begin
  if (TreeNode.Level = 0) then
    begin
      If TreeNode.Text = 'Users' Then
        begin
          TreeNode.DeleteChildren;

          qry_SQL.Close;
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          If frm_Console.AccessSysAdmin Then
            begin
              qry_SQL.SQL.Add('SELECT a.UserId, a.Name, a.Surname, a.UserType FROM AuthCodes a WHERE a.UserType IN (''S'', ''A'') ORDER BY a.UserID');
            end
          else
            begin
              qry_SQL.SQL.Add('SELECT');
              qry_SQL.SQL.Add('	a.UserId, a.Name, a.Surname, a.UserType');
              qry_SQL.SQL.Add('FROM');
              qry_SQL.SQL.Add('	AuthCodes a');
              qry_SQL.SQL.Add('	INNER JOIN  RolesRts ra ON a.UserId = ra.UserId');
              qry_SQL.SQL.Add('	INNER JOIN  RolesRts rb ON ra.RoleId = rb.RoleId');
              qry_SQL.SQL.Add('	INNER JOIN  AuthCodes b ON rb.UserId = b.UserId');
              qry_SQL.SQL.Add('WHERE');
              qry_SQL.SQL.Add('	b.UserId = :UserId AND');
              qry_SQL.SQL.Add('	a.UserType IN (''S'', ''A'')');
              qry_SQL.SQL.Add('UNION');
              qry_SQL.SQL.Add('SELECT');
              qry_SQL.SQL.Add('	a.UserId, a.Name, a.Surname, a.UserType');
              qry_SQL.SQL.Add('FROM');
              qry_SQL.SQL.Add('	AuthCodes a');
              qry_SQL.SQL.Add('WHERE a.SysAdmin = 0 AND a.UserId NOT IN (SELECT UserId FROM RolesRts) AND');
              qry_SQL.SQL.Add('	a.UserType IN (''S'', ''A'')');
              qry_SQL.SQL.Add('ORDER BY a.UserID');
              qry_SQL.Parameters.ParamByName('UserId').Value := User;
            end;
          qry_SQL.Open;
          qry_SQL.First;
          While not qry_SQL.EOF Do
            begin
              TempStr := trim(qry_SQL.FieldbyName('NAME').AsString) + ' ' + trim(qry_SQL.FieldbyName('SURNAME').AsString);
              TempStr := trim(qry_SQL.FieldbyName('USERID').AsString) + ' - ' + trim(TempStr);

              tnUser := tvSecurity.Items.AddChild(TreeNode, TempStr);
              if qry_SQL.FieldbyName('UserType').asString  = 'S' then
                begin
                  tnUser.ImageIndex := 1;
                  tnUser.SelectedIndex := 1;
                end
              else
                begin
                  tnUser.ImageIndex := 4;
                  tnUser.SelectedIndex := 4;
                end;
              qry_SQL.Next;
            end;
          qry_SQL.Close;
          TreeNode.Selected := true;
          TreeNode.Expanded := true;
          tvSecurityChange(tvSecurity, TreeNode);
        end
      else If TreeNode.Text = 'Requesters' Then
        begin
          TreeNode.DeleteChildren;

          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT a.UserId, a.Name, a.Surname FROM AuthCodes a WHERE a.UserType = ''R'' ORDER BY a.UserID');
          qry_SQL.Open;
          qry_SQL.First;
          While not qry_SQL.EOF Do
            begin
              TempStr := trim(qry_SQL.FieldbyName('NAME').AsString) + ' ' + trim(qry_SQL.FieldbyName('SURNAME').AsString);
              TempStr := trim(qry_SQL.FieldbyName('USERID').AsString) + ' - ' + trim(TempStr);

              tnUser := tvSecurity.Items.AddChild(TreeNode, TempStr);
              tnUser.ImageIndex := 1;
              tnUser.SelectedIndex := 1;
              qry_SQL.Next;
            end;
          qry_SQL.Close;
          TreeNode.Selected := true;
          TreeNode.Expanded := true;
          tvSecurityChange(tvSecurity, TreeNode);
        end
      else If TreeNode.Text = 'Roles' Then
        begin
          TreeNode.DeleteChildren;

          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT RoleId, Role FROM Roles ORDER BY RoleID');
          qry_SQL.Open;
          qry_SQL.First;
          While not qry_SQL.EOF Do
            begin
              TempStr := trim(qry_SQL.FieldbyName('ROLEID').AsString) + ' - '+ trim(qry_SQL.FieldbyName('ROLE').AsString);

              tnUser := tvSecurity.Items.AddChild(TreeNode, TempStr);
              tnUser.ImageIndex := 2;
              tnUser.SelectedIndex := 2;
              qry_SQL.Next;
            end;
          qry_SQL.Close;
          TreeNode.Selected := true;
          TreeNode.Expanded := true;
          tvSecurityChange(tvSecurity, TreeNode);
        end
      else If TreeNode.Text = 'Image Centre Groups' Then
        begin
          TreeNode.DeleteChildren;

          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT GroupId, ImageCentreGroup FROM ImageCentreGroups ORDER BY GroupId');
          qry_SQL.Open;
          qry_SQL.First;
          While not qry_SQL.EOF Do
            begin
              TempStr := trim(qry_SQL.FieldbyName('GroupId').AsString) + ' - '+ trim(qry_SQL.FieldbyName('ImageCentreGroup').AsString);

              tnUser := tvSecurity.Items.AddChild(TreeNode, TempStr);
              tnUser.ImageIndex := 2;
              tnUser.SelectedIndex := 2;
              qry_SQL.Next;
            end;
          qry_SQL.Close;
          TreeNode.Selected := true;
          TreeNode.Expanded := true;
          tvSecurityChange(tvSecurity, TreeNode);
        end;
    end
  else if (TreeNode.Level = 1) then
    begin
      If TreeNode.Parent.Text = 'Users' Then
        begin
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT a.UserId, a.Name, a.Surname FROM AuthCodes a WHERE a.UserId = :UserId ORDER BY a.UserID');
          qry_SQL.Parameters.ParamValues['UserId'] := copy(TreeNode.Text, 1, pos(' -', TreeNode.Text));
          qry_SQL.Open;
          if not qry_SQL.IsEmpty then
            begin
              TempStr := trim(qry_SQL.FieldbyName('NAME').AsString) + ' ' + trim(qry_SQL.FieldbyName('SURNAME').AsString);
              TempStr := trim(qry_SQL.FieldbyName('USERID').AsString) + ' - ' + trim(TempStr);

              TreeNode.Text := TempStr;
            end;
        end
      else If TreeNode.Parent.Text = 'Requesters' Then
        begin
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT a.UserId, a.Name, a.Surname FROM AuthCodes a WHERE a.UserId = :UserId ORDER BY UserID');
          qry_SQL.Parameters.ParamValues['UserId'] := copy(TreeNode.Text, 1, pos(' -', TreeNode.Text));
          qry_SQL.Open;
          if not qry_SQL.IsEmpty then
            begin
              TempStr := trim(qry_SQL.FieldbyName('NAME').AsString) + ' ' + trim(qry_SQL.FieldbyName('SURNAME').AsString);
              TempStr := trim(qry_SQL.FieldbyName('USERID').AsString) + ' - ' + trim(TempStr);

              TreeNode.Text := TempStr;
            end;
        end
      else If TreeNode.Parent.Text = 'Roles' Then
        begin
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT RoleId, Role FROM Roles WHERE RoleId = :Role ORDER BY Role');
          qry_SQL.Parameters.ParamValues['Role'] := copy(TreeNode.Text, 1, pos(' -', TreeNode.Text)-1);
          qry_SQL.Open;
          if not qry_SQL.IsEmpty then
            begin
              TempStr := trim(qry_SQL.FieldbyName('RoleId').AsString) + ' - ' + trim(qry_SQL.FieldbyName('Role').AsString);

              TreeNode.Text := TempStr;
            end;
        end
      else If TreeNode.Parent.Text = 'Image Centre Groups' Then
        begin
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT GroupId, ImageCentreGroup FROM ImageCentreGroups WHERE GroupId = :GroupId ORDER BY GroupId');
          qry_SQL.Parameters.ParamValues['GroupId'] := copy(TreeNode.Text, 1, pos(' -', TreeNode.Text)-1);
          qry_SQL.Open;
          if not qry_SQL.IsEmpty then
            begin
              TempStr := trim(qry_SQL.FieldbyName('GroupId').AsString) + ' - ' + trim(qry_SQL.FieldbyName('ImageCentreGroup').AsString);

              TreeNode.Text := TempStr;
            end;
        end;
    end;
end;

end.
