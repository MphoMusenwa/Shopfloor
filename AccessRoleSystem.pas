//Last AccessRight = 53 - Actions
// Open - 31, 32, 35, 33, 34
unit AccessRoleSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, ComCtrls, ToolWin, DB, ADODB,
  DBCtrls;

type
  Tfrm_AccessRoleSystem = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    btn_Cancel: TBitBtn;
    lbl_Role: TLabel;
    lbl_RoleID: TLabel;
    Bevel1: TBevel;
    qry_Roles: TADOQuery;
    qry_Access: TADOQuery;
    GroupBox1: TGroupBox;
    grp_Gen: TGroupBox;
    chk_Register: TCheckBox;
    chk_Security: TCheckBox;
    chk_RecordTypes: TCheckBox;
    chk_RecordCat: TCheckBox;
    chk_RetMatrix: TCheckBox;
    chk_BulkImport: TCheckBox;
    grp_eRec: TGroupBox;
    chk_eRecords: TCheckBox;
    chk_ePending: TCheckBox;
    chk_ImageClerk: TCheckBox;
    chk_DeleteeRec: TCheckBox;
    chk_eRecDataMan: TCheckBox;
    grp_Doc: TGroupBox;
    chk_DataCapture: TCheckBox;
    act_Filing: TCheckBox;
    chk_DCDelete: TCheckBox;
    chk_FileDef: TCheckBox;
    chk_Delivery: TCheckBox;
    chk_Requester: TCheckBox;
    chk_Requisition: TCheckBox;
    chk_Rec: TCheckBox;
    chk_DCInUse: TCheckBox;
    chk_FilePos: TCheckBox;
    chk_ContTypes: TCheckBox;
    chk_Reports: TCheckBox;
    chk_ReqClerk: TCheckBox;
    chk_TransView: TCheckBox;
    chk_PickSlipDel: TCheckBox;
    chk_ItemDefs: TCheckBox;
    chk_LocViewing: TCheckBox;
    chk_ExportOffSite: TCheckBox;
    grp_Web: TGroupBox;
    chk_MetrofileriRep: TCheckBox;
    chk_MetrotrackAccess: TCheckBox;
    grp_Ware: TGroupBox;
    chk_3dContainers: TCheckBox;
    chk_ChngeOffSiteRecordCont: TCheckBox;
    chk_BulkCapture: TCheckBox;
    CheckBox4: TCheckBox;
    chk_BulkImportPurge: TCheckBox;
    chk_DataManager: TCheckBox;
    CheckBox6: TCheckBox;
    chk_BulkExport: TCheckBox;
    chk_LauncheRecords: TCheckBox;
    chkChangeBarcode: TCheckBox;
    CheckBox2: TCheckBox;
    grp_COOL: TGroupBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox5: TCheckBox;
    procedure btn_SelectClick(Sender: TObject);
  private
    { Private declarations }
    mRoleId   :Integer;
    procedure DisplayAccess;
  public
    { Public declarations }
    function Execute(RoleId :Integer):Integer;
  end;

var
  frm_AccessRoleSystem: Tfrm_AccessRoleSystem;

implementation

Uses Main, AccessUserSystem, MetrofilerDataModule;

{$R *.dfm}

procedure Tfrm_AccessRoleSystem.btn_SelectClick(Sender: TObject);
Var
   A            :Integer;
   chk          :TCheckBox;
begin
  Screen.Cursor := crHourglass;
//---------------Delete---------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('DELETE FROM AuthRts WHERE RoleId = :RoleId');
  qry_Access.Parameters.ParamByName('RoleId').Value := mRoleId;
  qry_Access.ExecSQL;
//---------------Add---------------------
  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('INSERT INTO AuthRts(RoleId, Access)');
  qry_Access.SQL.Add('VALUES(:RoleId, :Access)');
  qry_Access.Parameters.ParamByName('RoleId').Value := mRoleId;

  For A := 0 to frm_AccessRoleSystem.ComponentCount-1 do
    If (frm_AccessRoleSystem.Components[A] Is TcheckBox) Then
      begin
        chk := frm_AccessRoleSystem.Components[A] AS TCheckBox;
        If (chk.Checked) AND (chk.Tag <> 0) Then
          begin
            qry_Access.Parameters.ParamByName('Access').Value := chk.Tag;
            qry_Access.ExecSQL;
          end;
      end;
  //---------------------------
  Screen.Cursor := crDefault;
  MessageDlg('Access right(s) granted as specified', mtInformation, [mbOK], 0);
  dm_Metrofiler.ClearCache;
  ModalResult := mrOK;
end;

procedure Tfrm_AccessRoleSystem.DisplayAccess;
Var
   J, A         :Integer;
   chk          :TCheckBox;
begin
  For A := 0 to frm_AccessRoleSystem.ComponentCount-1 do
    If (frm_AccessRoleSystem.Components[A] Is TcheckBox) Then
      begin
        chk := frm_AccessRoleSystem.Components[A] AS TcheckBox;
        chk.Checked := False;
      end;

  qry_Access.Close;
  qry_Access.SQL.Clear;
  qry_Access.SQL.Add('SELECT [Access] FROM AuthRts WHERE RoleId = :RoleId');
  qry_Access.Parameters.ParamByName('RoleId').Value := mRoleId;
  qry_Access.Open;
  qry_Access.First;
  While not qry_Access.EOF do
    begin
      J := qry_Access.FieldbyName('Access').AsInteger;

      For A := 0 to frm_AccessRoleSystem.ComponentCount-1 do
        If (frm_AccessRoleSystem.Components[A] Is TcheckBox) Then
          begin
            chk := frm_AccessRoleSystem.Components[A] AS TCheckBox;
            If chk.Tag = J Then
              chk.Checked := True;
          end;
      qry_Access.Next;
    end;
end;

function Tfrm_AccessRoleSystem.Execute(RoleId :Integer):Integer;
Var
  TempStr   :String;
begin
  mRoleId := RoleId;

  qry_Roles.Close;
  qry_Roles.SQL.Clear;
  qry_Roles.SQL.Add('SELECT RoleId, Role FROM Roles WHERE RoleId = :Role');
  qry_Roles.Parameters.ParamValues['Role'] := RoleId;
  qry_Roles.Open;

  TempStr := trim(qry_Roles.FieldbyName('ROLEID').AsString) + ' - ' + trim(qry_Roles.FieldbyName('ROLE').AsString);
  lbl_RoleId.Caption := TempStr;

  grp_Ware.Visible := False;
  grp_Web.Visible := False;
  grp_Doc.Visible := False;
  grp_COOL.Visible := False;
  grp_eRec.Visible := False;
  grp_Gen.Visible := False;

  chk_RecordCat.Enabled := False;
  chk_RetMatrix.Enabled := False;

  chk_eRecords.Visible := False;
  chk_eRecDataMan.Visible := False;
  chk_BulkCapture.Visible := False;
  chk_LauncheRecords.Visible := False;
  chk_ImageClerk.Visible := False;
  chk_BulkExport.Visible := False;
  chk_DeleteeRec.Visible := False;
  chk_ePending.Visible := False;

  If (frm_Console.fWareMan = 1)or(frm_Console.fEntMan = 1) Then
    begin
      grp_Gen.Visible := True;
      grp_Doc.Visible := True;
      grp_Ware.Visible := True;
      chk_RetMatrix.Enabled := True;
    end;
  If (frm_Console.fDocMan = 1)or(frm_Console.fEntMan = 1) Then
    begin
      grp_Gen.Visible := True;
      grp_Doc.Visible := True;
      chk_RetMatrix.Enabled := True;
    end;
  If (frm_Console.feRecMan = 1)or(frm_Console.fEntMan = 1)or(frm_Console.fImgMan = 1) Then
    begin
      grp_Gen.Visible := True;
      grp_eRec.Visible := True;
      chk_RecordCat.Enabled := True;

      chk_eRecords.Visible := True;
      chk_eRecDataMan.Visible := True;
      chk_LauncheRecords.Visible := True;
      chk_DeleteeRec.Visible := True;

      If (frm_Console.feRecMan = 1)or(frm_Console.fEntMan = 1) Then
        begin
          chk_ImageClerk.Visible := True;
          chk_ePending.Visible := True;
        end;
    end;
  If (frm_Console.feRecBulkCapture = 1) Then
    begin
      grp_Gen.Visible := True;
      grp_eRec.Visible := True;
      chk_RecordCat.Enabled := True;

      chk_BulkCapture.Visible := True;
      chk_BulkExport.Visible := True;
    end;
  If (frm_Console.fWebMan = 1)or(frm_Console.fEntMan = 1) Then
    begin
      grp_Web.Visible := True;
    end;
 { If (frm_Console.fCoolMan = 1)or(frm_Console.fEntMan = 1) Then
    begin
      grp_Gen.Visible := True;
      grp_eRec.Visible := True;
      chk_RecordCat.Enabled := True;

      grp_COOL.Visible := True;
    end;}


  DisplayAccess;

  Result := ShowModal;
end;


end.
