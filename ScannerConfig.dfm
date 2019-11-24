object frm_ScannerConfig: Tfrm_ScannerConfig
  Left = 0
  Top = 0
  Caption = 'Scanner Output Configuration'
  ClientHeight = 215
  ClientWidth = 240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 240
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 0
    ExplicitLeft = -220
    ExplicitWidth = 761
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btn_Select: TBitBtn
      Left = 8
      Top = 0
      Width = 75
      Height = 22
      TabOrder = 0
      Kind = bkOK
    end
    object ToolButton2: TToolButton
      Left = 83
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object BitBtn1: TBitBtn
      Left = 91
      Top = 0
      Width = 75
      Height = 22
      TabOrder = 1
      Kind = bkAbort
    end
  end
  object rgrp_OutputMode: TRadioGroup
    Left = 16
    Top = 35
    Width = 193
    Height = 78
    Caption = 'Output Mode'
    ItemIndex = 0
    Items.Strings = (
      'Multi Page'
      'Single Page')
    TabOrder = 1
    OnClick = rgrp_OutputModeClick
  end
  object rgrp_OutputFormat: TRadioGroup
    Left = 16
    Top = 119
    Width = 193
    Height = 82
    Caption = 'Output Format'
    ItemIndex = 0
    Items.Strings = (
      'TIF'
      'PDF')
    TabOrder = 2
  end
end
