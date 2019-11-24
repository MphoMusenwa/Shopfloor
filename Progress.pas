unit Progress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons;

type
  Tfrm_Progress = class(TForm)
    Panel1: TPanel;
    ProgressBar: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    btn_Cancel: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cancelled :Boolean;
    procedure Prog(Perc :Integer);
  end;

var
  frm_Progress: Tfrm_Progress;

implementation

{$R *.dfm}

procedure Tfrm_Progress.FormShow(Sender: TObject);
begin
  Cancelled := False;
  ProgressBar.Position := 0;
  ProgressBar.Min := 0;
  ProgressBar.Max := 100;
end;

procedure Tfrm_Progress.Prog(Perc :Integer);
begin
  ProgressBar.Position := Perc;
  Application.ProcessMessages;
end;



procedure Tfrm_Progress.btn_CancelClick(Sender: TObject);
begin
  Cancelled := True;
  Application.ProcessMessages;
end;

end.

