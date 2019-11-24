object frm_DataVer: Tfrm_DataVer
  Left = 240
  Top = 110
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Validation! Please enter Backwards!'
  ClientHeight = 341
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object edt_Value: TEdit
    Left = 0
    Top = 0
    Width = 536
    Height = 341
    Align = alClient
    TabOrder = 0
    Text = 'edt_Value'
    OnKeyUp = edt_ValueKeyUp
    ExplicitLeft = 145
    ExplicitTop = 124
    ExplicitWidth = 258
    ExplicitHeight = 21
  end
end
