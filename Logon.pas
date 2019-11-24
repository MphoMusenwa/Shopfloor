//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit Logon;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons,Messages,WinTypes,Dialogs, DB, DBTables, ExtCtrls;

type
  TPasswordDlg = class(TForm)
    Panel1: TPanel;
    btn_OK: TBitBtn;
    btn_Abort: TBitBtn;
    Panel3: TPanel;
    Image3: TImage;
    img_Logo: TImage;
    Label7: TLabel;
    Label3: TLabel;
    cbAuthentication: TComboBox;
    Bevel1: TBevel;
    pnl_Credentials: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_Password: TEdit;
    edt_UserId: TEdit;
    procedure btn_OKClick(Sender: TObject);
    procedure cbAuthenticationChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  Count :integer;
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

uses main, About, MetrofilerDataModule;

{$R *.DFM}

procedure TPasswordDlg.btn_OKClick(Sender: TObject);
begin
  if cbAuthentication.ItemIndex = 1 then
    begin
      If edt_UserID.text = '' Then
        begin
          Messagedlg('Missing User Name.', mtWarning ,[mbOK], 0);
          edt_UserID.SetFocus;
          exit;
        end;
      If edt_Password.Text = '' Then
        begin
          Messagedlg('Missing Password.', mtWarning ,[mbOK], 0);
          edt_Password.SetFocus;
          exit;
        end;
    end;
  ModalResult := mrOK;
end;

procedure TPasswordDlg.cbAuthenticationChange(Sender: TObject);
begin
  if cbAuthentication.ItemIndex = 0 then
    begin
      pnl_Credentials.Enabled := false;
      edt_UserId.Color := clScrollbar;
      edt_UserId.Text := dm_Metrofiler.GetLoggedOnUser();
      edt_PassWord.Color := clScrollbar;
      edt_PassWord.Text := '';
     end
  else
    begin
      pnl_Credentials.Enabled := true;
      edt_UserId.Color := clWindow;
      edt_UserId.Text := '';
      edt_PassWord.Color := clWindow;
      edt_PassWord.Text := '';
      edt_UserId.SetFocus;
    end;
end;

end.

