//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit SelFromToDate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ToolWin;

type
  Tfrm_SelFromToDates = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    BitBtn1: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    date_From: TDateTimePicker;
    date_To: TDateTimePicker;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_SelFromToDates: Tfrm_SelFromToDates;

implementation

{$R *.DFM}

procedure Tfrm_SelFromToDates.FormShow(Sender: TObject);
begin
  date_From.Date := Now-7;
  date_To.Date := Now;
end;

end.
