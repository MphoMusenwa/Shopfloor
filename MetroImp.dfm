object frm_DataImpMatch: Tfrm_DataImpMatch
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Data Import Matching'
  ClientHeight = 689
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grd_DataImport: TDBGrid
    Left = 0
    Top = 29
    Width = 1024
    Height = 232
    Align = alTop
    DataSource = DTS_DataImport
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 261
    Width = 1024
    Height = 428
    Align = alClient
    TabOrder = 1
    DesignSize = (
      1024
      428)
    object Bevel2: TBevel
      Left = 793
      Top = 16
      Width = 207
      Height = 46
      Anchors = [akTop, akRight]
      ExplicitLeft = 653
    end
    object Label48: TLabel
      Left = 4
      Top = -1
      Width = 121
      Height = 13
      Caption = 'Record Type Details:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_RecordFound: TLabel
      Left = 821
      Top = 32
      Width = 76
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Records Found:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 681
    end
    object ScrollBox2: TScrollBox
      Left = 1
      Top = 1
      Width = 640
      Height = 426
      Align = alLeft
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      object lbl_Col1: TLabel
        Left = 2
        Top = 10
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object lbl_Col2: TLabel
        Left = 2
        Top = 34
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object lbl_Col3: TLabel
        Left = 2
        Top = 58
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object lbl_Col4: TLabel
        Left = 2
        Top = 82
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object lbl_Col5: TLabel
        Left = 2
        Top = 106
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object lbl_Col6: TLabel
        Left = 2
        Top = 130
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object lbl_Col9: TLabel
        Left = 2
        Top = 202
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object lbl_Col10: TLabel
        Left = 2
        Top = 226
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object lbl_Col7: TLabel
        Left = 2
        Top = 154
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object lbl_Col8: TLabel
        Left = 2
        Top = 178
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object lbl_Col11: TLabel
        Left = 2
        Top = 250
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object lbl_Col14: TLabel
        Left = 2
        Top = 322
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object lbl_Col15: TLabel
        Left = 2
        Top = 346
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object lbl_Col12: TLabel
        Left = 2
        Top = 274
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object lbl_Col13: TLabel
        Left = 2
        Top = 298
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
      end
      object edt_Col1: TEdit
        Left = 158
        Top = 7
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
      end
      object edt_Col2: TEdit
        Left = 158
        Top = 31
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 1
      end
      object edt_Col3: TEdit
        Left = 158
        Top = 55
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
      end
      object edt_Col4: TEdit
        Left = 158
        Top = 79
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 3
      end
      object edt_Col5: TEdit
        Left = 158
        Top = 103
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 4
      end
      object edt_Col6: TEdit
        Left = 158
        Top = 127
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 5
      end
      object edt_Col7: TEdit
        Left = 158
        Top = 151
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 6
      end
      object edt_Col8: TEdit
        Left = 158
        Top = 175
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 7
      end
      object edt_Col9: TEdit
        Left = 158
        Top = 199
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 8
      end
      object edt_Col10: TEdit
        Left = 158
        Top = 223
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 9
      end
      object edt_Col11: TEdit
        Left = 158
        Top = 247
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 10
      end
      object edt_Col12: TEdit
        Left = 158
        Top = 271
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 11
      end
      object edt_Col13: TEdit
        Left = 158
        Top = 295
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 12
      end
      object edt_Col14: TEdit
        Left = 158
        Top = 319
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 13
      end
      object edt_Col15: TEdit
        Left = 158
        Top = 343
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 14
      end
    end
    object btn_Search: TBitBtn
      Left = 834
      Top = 91
      Width = 125
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'Search'
      Default = True
      TabOrder = 1
      OnClick = btn_SearchClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000720B0000720B00000000000000000000FF00FFFF00FF
        636B73636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF3973A52173B51B5A8F636B73FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF3973A539A5FF218CEF2173B51B5A8F636B73FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4AB5FF5ABDFF42A5FF218CEF2173
        B51B5A8F636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BDFF
        5ABDFF42A5FF218CEF2173B51B5A8F636B73FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF31A5FF52BDFF5ABDFF42A5FF218CEF2173B51B5A8F636B73FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BDFF5ABDFF42A5FF218CEF21
        73B51B5A8F636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BD
        FF5ABDFF42A5FF218CEF4A4239636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF31A5FF52BDFF5ABDFFA59C8C8C8C8C4A4239FF00FFFF00FFC69C
        94B58C84CEA59CD6B5A5D6ADA5CE9C9CC69494FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF31A5FFAFAFAFA59C8C6B6B6B
        846B6BAD8C84E7D6BDF4EABBFAEEBEFDF1C1FFF3C2FFF4C4EFDEC6CEA59CFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFC3C3C34A4239CEA594F0E5B8F9ECBDFCF5DFFCF5DFFCF5DFFCF5DFFCF5DF
        FCF5DFFFF4C6D6B5A5D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFC6ADADCEA594FFEFBDF8ECBCFCF5DFFFF6C4FFF7C6FF
        F8C8FFF9C8FFFCC9FFFAC8FCF5DFFFF4C3C6A5A5FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8C8CEFDEB5F3E7B8FEF0C0FFF2
        C2FFF3C3FFF4C3FFF5C4FFF7C5FFF8C6FFFBC8FFFBC8FCF5DFF7EFDED6ADA5FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6B5A5E8DDB1
        F8EABCFDEFC0FFF0C1FFF1C1FFF2C2FFF3C3FFF5C4FFF6C5FFF8C6FFFAC7FFFB
        C8FFF6C6BDA594FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6
        ADA5E7CEADB55A18FAECBDFCEDBEFDEFBFB55A18B55A18B55A18B55A18FFF4C4
        FFF6C5B55A18B55A18FFF6C8D6C6ADD6ADA5FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFC79795EFD6B5E88A44B55A18B55A18B55A18B55A18B55A18FF
        F0C1FFF1C2B55A18B55A18FFF6C4FFF8C6B55A18E7D6BDBD9C8CFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFC79795EFD6B5ECDFB3E88A44FCF0CDE88A
        44FCF5DFB55A18B55A18B55A18FFF1C3B55A18FFF4C5FFF6C6FDF1C2E7D6BDBD
        9C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5E7CEADE6DAAF
        E88A44EFE3B6E88A44FCF5DFE88A44FCEDC0FDEEC1B55A18E88A44FFF3C3FDF0
        C0B55A18D6C6ADD6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFD6ADA5DED4ADEADEB3E88A44EFE3B6FCF0CDE88A44E88A44B55A18FCEEC0
        FDEFC0E88A44B55A18EFE4B7BD9C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFBD8C8CEFDEB5E2D8B3EBDFB6F3E6BAF5E7BAF6E8BBF7
        EABBF9EBBCFAECBDF8EABBF4E8B9EFE3B6EFDEC6D6ADA5FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC69C8CFCF0CDE3DAB9E8DD
        B5ECE0B5EEE2B5EFE3B6EFE2B5EEE2B5ECE1B4EADEB2FFEFC6BD9C8CFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        BD9C9CFCF0CDE0D9BCE1D8B4E2D7AFE2D7ADE0D5ABDFD4ABDDD3AAF7E7BDC69C
        94FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFC69C94D6BDA5F7E7BDFFEFBDFFEFBDFFEFBDF7E7BD
        E7C6ADC69494FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5C69C8CCE
        A59CCEA59CC69C94FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object chk_Partial: TCheckBox
      Left = 834
      Top = 144
      Width = 125
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Use Partial Searching'
      TabOrder = 2
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1024
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 2
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
      Caption = 'Select'
      Default = True
      TabOrder = 0
      OnClick = btn_SelectClick
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
      ImageIndex = 0
      Style = tbsSeparator
    end
    object BitBtn1: TBitBtn
      Left = 91
      Top = 0
      Width = 75
      Height = 22
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object ToolButton3: TToolButton
      Left = 166
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object DBNavigator1: TDBNavigator
      Left = 174
      Top = 0
      Width = 200
      Height = 22
      DataSource = DTS_DataImport
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object DTS_DataImport: TDataSource
    DataSet = qry_DataImport
    Left = 840
    Top = 72
  end
  object qry_DataImport: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 840
    Top = 40
  end
  object qry_SQL: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 809
    Top = 40
  end
end
