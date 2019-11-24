//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit ItemsOut;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, checklst, Buttons, ComCtrls, ToolWin;

type
  Tfrm_ItemsOut = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Bookin: TBitBtn;
    chklb_Items: TCheckListBox;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ItemsOut: Tfrm_ItemsOut;

implementation

{$R *.DFM}

procedure Tfrm_ItemsOut.FormShow(Sender: TObject);
begin
  height := 433;
  width := 403;
end;

end.
