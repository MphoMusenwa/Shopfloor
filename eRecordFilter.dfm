object frm_eRecordFullTextFilter: Tfrm_eRecordFullTextFilter
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'eRecord Full-Text Filter'
  ClientHeight = 406
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btn_OK: TButton
    Left = 22
    Top = 363
    Width = 75
    Height = 25
    Caption = '&Apply'
    Default = True
    TabOrder = 0
    OnClick = btn_OKClick
  end
  object btn_Cancel: TButton
    Left = 102
    Top = 363
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btn_CancelClick
  end
  object btn_Clear: TButton
    Left = 182
    Top = 363
    Width = 75
    Height = 25
    Caption = 'Cl&ear'
    TabOrder = 2
    OnClick = btn_ClearClick
  end
  object mem_Filters: TMemo
    Left = 8
    Top = 8
    Width = 521
    Height = 349
    Lines.Strings = (
      'mem_Filters')
    TabOrder = 3
  end
end
