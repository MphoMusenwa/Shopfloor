unit eRecordsCommentAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, ToolWin;

type
  Tfrm_eRecordsCommentAdd = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    BitBtn1: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    lbl_Date: TLabel;
    Label2: TLabel;
    lbl_User: TLabel;
    Label3: TLabel;
    mem_Comment: TMemo;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    meRecNo   :Integer;
  public
    { Public declarations }
    function Execute(eRecNo :Integer):Integer;
  end;

var
  frm_eRecordsCommentAdd: Tfrm_eRecordsCommentAdd;

implementation

Uses Main;

{$R *.dfm}

procedure Tfrm_eRecordsCommentAdd.BitBtn1Click(Sender: TObject);
begin
  If trim(mem_Comment.Text) = '' Then
    begin
      Messagedlg('Please enter a comment first!', mtInformation, [mbOK], 0);
      exit;
    end;
  ModalResult := mrOK;
end;

function Tfrm_eRecordsCommentAdd.Execute(eRecNo :Integer):Integer;
begin
  lbl_Date.Caption := DateTimetoStr(Now);
  lbl_User.Caption := trim(FirstName + ' ' + Surname);
  mem_Comment.Text := '';
  Result := ShowModal;
end;

end.
