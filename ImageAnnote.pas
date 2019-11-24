unit ImageAnnote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, ToolWin, StdCtrls, ExtCtrls;

type
  Tfrm_ImageAnnote = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_OK: TSpeedButton;
    ToolButton2: TToolButton;
    btn_Cancel: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    cb_AnnotateTool: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    ColorDialog1: TColorDialog;
    btn_FillColor: TButton;
    btn_Color: TButton;
    Shape_FillColor: TShape;
    lbl_Color: TLabel;
    procedure btn_FillColorClick(Sender: TObject);
    procedure btn_ColorClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ImageAnnote: Tfrm_ImageAnnote;

implementation

{$R *.dfm}

procedure Tfrm_ImageAnnote.btn_FillColorClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    begin
      Shape_FillColor.Brush.Color := ColorDialog1.Color;
    end;
end;

procedure Tfrm_ImageAnnote.btn_ColorClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    begin
      lbl_Color.Font.Color := ColorDialog1.Color;
    end;
end;

procedure Tfrm_ImageAnnote.btn_OKClick(Sender: TObject);
begin
  MODALResult := mrOK;
end;

procedure Tfrm_ImageAnnote.btn_CancelClick(Sender: TObject);
begin
MODALResult := mrCancel;
end;

end.
