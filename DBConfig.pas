unit DBConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, ADODB;

type
  Tfrm_DatabaseConfig = class(TForm)
    Panel3: TPanel;
    Image3: TImage;
    Label22: TLabel;
    Label23: TLabel;
    btn_Cancel: TBitBtn;
    edt_ConnectionString: TEdit;
    btnSave: TBitBtn;
    procedure edt_ConnectionStringChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute():Integer;
  end;

var
  frm_DatabaseConfig: Tfrm_DatabaseConfig;

implementation

{$R *.dfm}

function Tfrm_DatabaseConfig.Execute():Integer;
begin
  edt_ConnectionString.PasswordChar := '*';
  Result := ShowModal;
end;


procedure Tfrm_DatabaseConfig.btnSaveClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_DatabaseConfig.btn_CancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrm_DatabaseConfig.edt_ConnectionStringChange(Sender: TObject);
begin
  if edt_ConnectionString.Text = '' Then
    begin
      edt_ConnectionString.PasswordChar := #0;
    end;
end;

end.
