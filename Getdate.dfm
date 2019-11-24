object frm_GetDate: Tfrm_GetDate
  Left = 373
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Select Date'
  ClientHeight = 187
  ClientWidth = 178
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
  object mCal: TMonthCalendar
    Left = 0
    Top = -4
    Width = 176
    Height = 153
    AutoSize = True
    Date = 38628.417120405090000000
    TabOrder = 0
  end
  object Button1: TButton
    Left = 2
    Top = 158
    Width = 79
    Height = 25
    Caption = 'Select'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 85
    Top = 158
    Width = 79
    Height = 25
    Cancel = True
    Caption = 'Abort'
    ModalResult = 3
    TabOrder = 2
  end
end
