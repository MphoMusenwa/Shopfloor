object frm_edtBarcodeRange: Tfrm_edtBarcodeRange
  Left = 0
  Top = 0
  Caption = 'frm_edtBarcodeRange'
  ClientHeight = 272
  ClientWidth = 635
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
    Width = 635
    Height = 29
    ButtonHeight = 24
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 0
      Width = 75
      Height = 24
      Caption = 'Save'
      Default = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object ToolButton2: TToolButton
      Left = 83
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object BitBtn2: TBitBtn
      Left = 91
      Top = 0
      Width = 75
      Height = 24
      TabOrder = 1
      Kind = bkAbort
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 635
    Height = 243
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object Label9: TLabel
      Left = 40
      Top = 20
      Width = 34
      Height = 13
      Caption = 'Branch'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl_Branch: TLabel
      Left = 148
      Top = 21
      Width = 261
      Height = 13
      AutoSize = False
      Caption = '---'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label40: TLabel
      Left = 19
      Top = 43
      Width = 55
      Height = 13
      Caption = 'Department'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl_Dept: TLabel
      Left = 148
      Top = 44
      Width = 261
      Height = 13
      AutoSize = False
      Caption = '---'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 12
      Top = 66
      Width = 62
      Height = 13
      Caption = 'Record Type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 90
      Width = 58
      Height = 13
      Caption = 'From Range'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 26
      Top = 113
      Width = 48
      Height = 13
      Caption = 'To Range'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 48
      Top = 137
      Width = 26
      Height = 13
      Caption = 'Suffix'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edt_Branch: TEdit
      Left = 80
      Top = 17
      Width = 41
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object btn_SelBranch: TButton
      Left = 122
      Top = 17
      Width = 20
      Height = 20
      Hint = 'Select Branch'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btn_SelBranchClick
    end
    object edt_Dept: TEdit
      Left = 80
      Top = 40
      Width = 41
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object btn_SelDept: TButton
      Left = 122
      Top = 39
      Width = 20
      Height = 20
      Hint = 'Select Department'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btn_SelDeptClick
    end
    object edt_RType: TEdit
      Left = 80
      Top = 63
      Width = 244
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object btn_SelRecordType: TButton
      Left = 325
      Top = 63
      Width = 20
      Height = 20
      Hint = 'Select Record Type'
      Caption = '>>'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btn_SelRecordTypeClick
    end
    object chk_AutoGenSuffix: TCheckBox
      Left = 12
      Top = 173
      Width = 150
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Auto Generate Suffix'
      TabOrder = 6
    end
    object chk_AutoGenBarcode: TCheckBox
      Left = 12
      Top = 196
      Width = 150
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Auto Generate Barcode'
      TabOrder = 7
    end
    object edt_FromRange: TEdit
      Left = 80
      Top = 86
      Width = 175
      Height = 21
      TabOrder = 8
      Text = '0'
    end
    object edt_ToRange: TEdit
      Left = 80
      Top = 110
      Width = 175
      Height = 21
      TabOrder = 9
      Text = '0'
    end
    object edt_Suffix: TEdit
      Left = 80
      Top = 134
      Width = 76
      Height = 21
      TabOrder = 10
      Text = 'Edit1'
    end
    object rgrp_Type: TRadioGroup
      Left = 416
      Top = 6
      Width = 185
      Height = 105
      Caption = 'Type of Range'
      Items.Strings = (
        'Container'
        'File'
        'Item')
      TabOrder = 11
    end
  end
end
