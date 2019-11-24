unit ScannerConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ToolWin, ExtCtrls;

type
  Tfrm_ScannerConfig = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btn_Select: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn1: TBitBtn;
    rgrp_OutputMode: TRadioGroup;
    rgrp_OutputFormat: TRadioGroup;
    procedure rgrp_OutputModeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute:Integer;
  end;

var
  frm_ScannerConfig: Tfrm_ScannerConfig;

implementation

{$R *.dfm}

function Tfrm_ScannerConfig.Execute:Integer;
begin
  rgrp_OutputMode.ItemIndex := 0;
  rgrp_OutputModeClick(Self);
  Result := ShowModal;
end;

procedure Tfrm_ScannerConfig.rgrp_OutputModeClick(Sender: TObject);
begin
  If rgrp_OutputMode.ItemIndex = 0 Then
    begin
      rgrp_OutputFormat.Items.Clear;
      rgrp_OutputFormat.Items.Add('TIF');
      rgrp_OutputFormat.Items.Add('PDF');
      rgrp_OutputFormat.ItemIndex := 0;
    end
  else
    begin
      rgrp_OutputFormat.Items.Clear;
      rgrp_OutputFormat.Items.Add('TIF');
      rgrp_OutputFormat.Items.Add('PDF');
      rgrp_OutputFormat.Items.Add('JPG');
      rgrp_OutputFormat.ItemIndex := 0;
    end;
end;

end.
