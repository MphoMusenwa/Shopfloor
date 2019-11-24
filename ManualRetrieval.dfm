object frm_ManualRetrieval: Tfrm_ManualRetrieval
  Left = 230
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Manual Retrieval'
  ClientHeight = 108
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 136
    Height = 13
    Caption = 'Please select the Requester:'
  end
  object cb_ReqName: TComboBox
    Left = 16
    Top = 32
    Width = 241
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object btn_OK: TButton
    Left = 24
    Top = 64
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btn_Cancel: TButton
    Left = 112
    Top = 64
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object cb_ReqUserID: TComboBox
    Left = 9
    Top = 95
    Width = 263
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
end
