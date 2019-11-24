unit ChangeDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, ADODB;

type
  Tfrm_ChangeDet = class(TForm)
    Panel3: TPanel;
    Image3: TImage;
    Label22: TLabel;
    Label23: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edt_Name: TEdit;
    edt_Surname: TEdit;
    edt_Tel: TEdit;
    edt_eMail: TEdit;
    mem_Addr: TMemo;
    btn_UpdateInfo: TBitBtn;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edt_OldPassw: TEdit;
    edt_NewPassw: TEdit;
    edt_ConfirmPassw: TEdit;
    Bevel1: TBevel;
    btn_ResetPassw: TBitBtn;
    qry_SQL: TADOQuery;
    btn_Close: TBitBtn;
    procedure edt_NameChange(Sender: TObject);
    procedure edt_OldPasswChange(Sender: TObject);
    procedure btn_UpdateInfoClick(Sender: TObject);
    procedure btn_ResetPasswClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
    PKUserID  :String;
  public
    { Public declarations }
    function Execute(UserID :String):Integer;
  end;

var
  frm_ChangeDet: Tfrm_ChangeDet;

implementation

Uses MetroFilerDataModule;

{$R *.dfm}

function Tfrm_ChangeDet.Execute(UserID :String):Integer;
begin
  PKUserID := UserID;
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT Surname, Name, Telephone, Address, eMail FROM AuthCodes WHERE UserID = '+QuotedStr(UserID));
  qry_SQL.Open;
  edt_Name.Text := trim(qry_SQL.FieldbyName('Name').AsString);
  edt_Surname.Text := trim(qry_SQL.FieldbyName('Surname').AsString);
  edt_Tel.Text := trim(qry_SQL.FieldbyName('Telephone').AsString);
  edt_eMail.Text := trim(qry_SQL.FieldbyName('eMail').AsString);
  mem_Addr.Text := trim(qry_SQL.FieldbyName('Address').AsString);
  qry_SQL.Close;
  edt_OldPassw.Text := '';
  edt_NewPassw.Text := '';
  edt_ConfirmPassw.Text := '';
  btn_ResetPassw.Enabled := False;
  btn_UpdateInfo.Enabled := False;
  Result := ShowModal;
end;

procedure Tfrm_ChangeDet.edt_NameChange(Sender: TObject);
begin
  If (edt_Name.Text <> '')AND
     (edt_SurName.Text <> '')AND
     (edt_Tel.Text <> '')AND
     (edt_eMail.Text <> '')AND
     (mem_Addr.Text <> '')Then
    btn_UpdateInfo.Enabled := True
  else btn_UpdateInfo.Enabled := False;
end;

procedure Tfrm_ChangeDet.edt_OldPasswChange(Sender: TObject);
begin
  If (edt_OldPassw.Text <> '')AND
     (edt_NewPassw.Text <> '')AND
     (edt_ConfirmPassw.Text <> '')Then
    btn_ResetPassw.Enabled := True
  else btn_ResetPassw.Enabled := False;
end;

procedure Tfrm_ChangeDet.btn_UpdateInfoClick(Sender: TObject);
begin
  qry_SQL.close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('UPDATE AuthCodes SET');
  qry_SQL.SQL.Add('   Surname = '+QuotedStr(edt_Surname.Text)+',');
  qry_SQL.SQL.Add('   Name = '+QuotedStr(edt_Name.Text)+',');
  qry_SQL.SQL.Add('   Telephone = '+QuotedStr(edt_Tel.Text)+',');
  qry_SQL.SQL.Add('   eMail = '+QuotedStr(edt_eMail.Text)+',');
  qry_SQL.SQL.Add('   Address = '+QuotedStr(mem_Addr.Text));
  qry_SQL.SQL.Add('WHERE UserId = '+QuotedStr(PKUserID));
  qry_SQL.ExecSQL;
  Messagedlg('Your Information has been updated.', mtInformation, [mbOK], 0);
  btn_UpdateInfo.Enabled := false;
end;

procedure Tfrm_ChangeDet.btn_ResetPasswClick(Sender: TObject);
Var
  OldPassw   :String;
begin
  qry_SQL.close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT Passw FROM AuthCodes');
  qry_SQL.SQL.Add('WHERE UserId = '+QuotedStr(PKUserID));
  qry_SQL.Open;
  OldPassw := qry_SQL.FieldbyName('Passw').AsString;
  If dm_Metrofiler.DecryptPassw(OldPassw) <> edt_OldPassw.Text Then
    begin
      Messagedlg('Old Password is incorrect.', mtInformation, [mbOK], 0);
      exit;
    end;

//-----
  if edt_NewPassw.Text <> edt_ConfirmPassw.Text Then
    begin
      Messagedlg('The Passwords you typed do not match. Please type the New Password in Both Fields.', mtInformation, [mbOK], 0);
      exit;
    end;
//------
  qry_SQL.close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('UPDATE AuthCodes SET');
  qry_SQL.SQL.Add('   Passw = '+QuotedStr(dm_Metrofiler.EncryptPassw(edt_NewPassw.Text)));
  qry_SQL.SQL.Add('WHERE UserId = '+QuotedStr(PKUserID));
  qry_SQL.ExecSQL;
  Messagedlg('Your Password has been reset.', mtInformation, [mbOK], 0);
  edt_OldPassw.Text := '';
  edt_NewPassw.Text := '';
  edt_ConfirmPassw.Text := '';
  btn_ResetPassw.Enabled := false;
end;

procedure Tfrm_ChangeDet.btn_CloseClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
