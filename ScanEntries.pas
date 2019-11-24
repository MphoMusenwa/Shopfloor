//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit ScanEntries;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, ToolWin;

type
  Tfrm_ScanEntries = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    BitBtn1: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn2: TBitBtn;
    lbl_Type: TLabel;
    edt_Scan: TEdit;
    Bevel1: TBevel;
    lbl_Input: TLabel;
    edt_Input: TEdit;
    Bevel2: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ScanEntries: Tfrm_ScanEntries;

implementation

{$R *.DFM}


end.
