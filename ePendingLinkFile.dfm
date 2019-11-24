object frm_ePendingLinkFile: Tfrm_ePendingLinkFile
  Left = 217
  Top = 61
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Enter File to Find'
  ClientHeight = 552
  ClientWidth = 688
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
  object Splitter1: TSplitter
    Left = 0
    Top = 377
    Width = 688
    Height = 5
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 377
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 61
      Top = 104
      Width = 16
      Height = 13
      Caption = 'File'
    end
    object Label2: TLabel
      Left = 22
      Top = 140
      Width = 43
      Height = 22
      Caption = 'OR...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label29: TLabel
      Left = 44
      Top = 46
      Width = 33
      Height = 13
      Caption = 'Branch'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 22
      Top = 71
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
    object Label32: TLabel
      Left = 15
      Top = 175
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
    object lbl_RBranchSrc: TLabel
      Left = 148
      Top = 49
      Width = 268
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
    object lbl_RDeptSrc: TLabel
      Left = 147
      Top = 69
      Width = 268
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
    object lbl_DataType: TLabel
      Left = 11
      Top = 202
      Width = 121
      Height = 13
      Caption = 'Record Type Details:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btn_OK: TBitBtn
      Left = 8
      Top = 8
      Width = 97
      Height = 29
      Caption = 'Select'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btn_OKClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
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
    object BitBtn2: TBitBtn
      Left = 112
      Top = 8
      Width = 105
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Kind = bkCancel
    end
    object edt_Filenumber: TEdit
      Left = 80
      Top = 101
      Width = 306
      Height = 21
      TabOrder = 2
    end
    object btn_RBranchCap: TButton
      Left = 121
      Top = 42
      Width = 19
      Height = 15
      Hint = 'Select Branch'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btn_RBranchCapClick
    end
    object btn_RDeptCap: TButton
      Left = 121
      Top = 69
      Width = 19
      Height = 14
      Hint = 'Select Department'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btn_RDeptCapClick
    end
    object btn_RRTypeCap: TButton
      Left = 367
      Top = 172
      Width = 19
      Height = 14
      Hint = 'Select Record Type'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btn_RRTypeCapClick
    end
    object edt_RBranchCap: TEdit
      Left = 80
      Top = 43
      Width = 40
      Height = 21
      ReadOnly = True
      TabOrder = 6
    end
    object edt_RDeptCap: TEdit
      Left = 80
      Top = 69
      Width = 40
      Height = 21
      ReadOnly = True
      TabOrder = 7
    end
    object edt_RRTypeCap: TEdit
      Left = 80
      Top = 173
      Width = 287
      Height = 21
      ReadOnly = True
      TabOrder = 8
      OnChange = edt_RRTypeCapChange
    end
    object btn_Search: TBitBtn
      Left = 399
      Top = 170
      Width = 104
      Height = 31
      Caption = 'Search'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
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
    object scrl_IndexInfoBox: TScrollBox
      Left = 6
      Top = 216
      Width = 667
      Height = 150
      BevelEdges = []
      TabOrder = 10
      object lbl_Col1: TLabel
        Left = 2
        Top = 10
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object lbl_Col2: TLabel
        Left = 2
        Top = 34
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object lbl_Col3: TLabel
        Left = 2
        Top = 58
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object lbl_Col4: TLabel
        Left = 2
        Top = 82
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object lbl_Col5: TLabel
        Left = 2
        Top = 106
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object lbl_Col6: TLabel
        Left = 2
        Top = 130
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object lbl_Col9: TLabel
        Left = 2
        Top = 202
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object lbl_Col10: TLabel
        Left = 2
        Top = 226
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object lbl_Col7: TLabel
        Left = 2
        Top = 154
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object lbl_Col8: TLabel
        Left = 2
        Top = 178
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object lbl_Col11: TLabel
        Left = 2
        Top = 250
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object lbl_Col14: TLabel
        Left = 2
        Top = 322
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object lbl_Col15: TLabel
        Left = 2
        Top = 346
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object lbl_Col12: TLabel
        Left = 2
        Top = 274
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object lbl_Col13: TLabel
        Left = 2
        Top = 298
        Width = 150
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Column :'
        Visible = False
      end
      object edt_Col1: TEdit
        Left = 158
        Top = 7
        Width = 123
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        Visible = False
      end
      object edt_Col2: TEdit
        Left = 158
        Top = 31
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 1
        Visible = False
      end
      object edt_Col3: TEdit
        Left = 158
        Top = 55
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
        Visible = False
      end
      object edt_Col4: TEdit
        Left = 158
        Top = 79
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 3
        Visible = False
      end
      object edt_Col5: TEdit
        Left = 158
        Top = 103
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 4
        Visible = False
      end
      object edt_Col6: TEdit
        Left = 158
        Top = 127
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 5
        Visible = False
      end
      object edt_Col7: TEdit
        Left = 158
        Top = 151
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 6
        Visible = False
      end
      object edt_Col8: TEdit
        Left = 158
        Top = 175
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 7
        Visible = False
      end
      object edt_Col9: TEdit
        Left = 158
        Top = 199
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 8
        Visible = False
      end
      object edt_Col10: TEdit
        Left = 158
        Top = 223
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 9
        Visible = False
      end
      object edt_Col11: TEdit
        Left = 158
        Top = 247
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 10
        Visible = False
      end
      object edt_Col12: TEdit
        Left = 158
        Top = 271
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 11
        Visible = False
      end
      object edt_Col13: TEdit
        Left = 158
        Top = 295
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 12
        Visible = False
      end
      object edt_Col14: TEdit
        Left = 158
        Top = 319
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 13
        Visible = False
      end
      object edt_Col15: TEdit
        Left = 158
        Top = 343
        Width = 121
        Height = 21
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 14
        Visible = False
      end
    end
    object btn_SearchBarcode: TBitBtn
      Left = 399
      Top = 96
      Width = 104
      Height = 31
      Caption = 'Search'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = btn_SearchBarcodeClick
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 382
    Width = 688
    Height = 170
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    DesignSize = (
      688
      170)
    object Label47: TLabel
      Left = 4
      Top = 1
      Width = 60
      Height = 13
      Caption = 'Result Set'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ResultGrid: TDBGrid
      Left = 2
      Top = 17
      Width = 678
      Height = 153
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dts_Records
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object qry_RecordType: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 544
    Top = 16
  end
  object qry_Records: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 576
    Top = 16
  end
  object dts_Records: TDataSource
    AutoEdit = False
    DataSet = qry_Records
    Left = 576
    Top = 48
  end
  object qry_SQL: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 608
    Top = 16
  end
  object qry_Det: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 512
    Top = 16
  end
end
