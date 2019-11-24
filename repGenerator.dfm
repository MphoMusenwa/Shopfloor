object frm_RepGenerator: Tfrm_RepGenerator
  Left = 149
  Top = -13
  Caption = 'Reports'
  ClientHeight = 670
  ClientWidth = 781
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pg_Reports: TPageControl
    Left = 0
    Top = 35
    Width = 781
    Height = 635
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Criteria &1'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 0
        Width = 773
        Height = 604
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object Label1: TLabel
          Left = 115
          Top = 72
          Width = 65
          Height = 26
          Caption = 'Field Description'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label2: TLabel
          Left = 250
          Top = 72
          Width = 32
          Height = 26
          Alignment = taCenter
          Caption = 'Sort Order'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label3: TLabel
          Left = 368
          Top = 72
          Width = 51
          Height = 26
          Caption = 'Field Contents'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label8: TLabel
          Left = 304
          Top = 72
          Width = 42
          Height = 26
          Alignment = taCenter
          Caption = 'Display Field'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object btn_eRecords: TSpeedButton
          Left = 8
          Top = 8
          Width = 113
          Height = 23
          Caption = 'eRecords'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
            0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
            0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
            5555557FFFFF7755555555500000005555555577777775555555555555555555
            5555555555555555555555555555555555555555555555555555}
          Margin = 2
          NumGlyphs = 2
          OnClick = btn_eRecordsClick
        end
        object btn_Records: TSpeedButton
          Left = 8
          Top = 33
          Width = 113
          Height = 23
          Caption = 'Physical Records'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
            0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
            0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
            5555557FFFFF7755555555500000005555555577777775555555555555555555
            5555555555555555555555555555555555555555555555555555}
          Margin = 2
          NumGlyphs = 2
          OnClick = btn_RecordsClick
        end
        object Label10: TLabel
          Left = 197
          Top = 72
          Width = 42
          Height = 26
          Alignment = taCenter
          Caption = 'Column Order'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Panel1: TPanel
          Left = 40
          Top = 104
          Width = 697
          Height = 129
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Label4: TLabel
            Left = 4
            Top = 8
            Width = 150
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Branch :'
          end
          object Label5: TLabel
            Left = 4
            Top = 32
            Width = 150
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Department :'
          end
          object Label6: TLabel
            Left = 4
            Top = 56
            Width = 150
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Record Type :'
          end
          object lbl_RecordCatHead: TLabel
            Left = 4
            Top = 80
            Width = 150
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Record Category :'
          end
          object Shape1: TShape
            Left = 158
            Top = 4
            Width = 1
            Height = 120
          end
          object Shape5: TShape
            Left = 314
            Top = 4
            Width = 1
            Height = 120
          end
          object Shape3: TShape
            Left = 256
            Top = 4
            Width = 1
            Height = 120
          end
          object Label9: TLabel
            Left = 4
            Top = 104
            Width = 150
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Metrofile Barcode Number:'
          end
          object Shape7: TShape
            Left = 202
            Top = 4
            Width = 1
            Height = 120
          end
          object edt_Branch: TEdit
            Left = 328
            Top = 4
            Width = 41
            Height = 21
            ReadOnly = True
            TabOrder = 0
          end
          object btn_SelBranch: TButton
            Left = 651
            Top = 3
            Width = 19
            Height = 19
            Hint = 'Select Branch'
            Caption = '>>'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btn_SelBranchClick
          end
          object edt_BranchName: TEdit
            Left = 370
            Top = 4
            Width = 279
            Height = 21
            ReadOnly = True
            TabOrder = 2
          end
          object edt_Dept: TEdit
            Left = 328
            Top = 27
            Width = 41
            Height = 21
            ReadOnly = True
            TabOrder = 3
          end
          object edt_DeptName: TEdit
            Left = 370
            Top = 27
            Width = 279
            Height = 21
            ReadOnly = True
            TabOrder = 4
          end
          object btn_SelDept: TButton
            Left = 651
            Top = 27
            Width = 19
            Height = 19
            Hint = 'Select Department'
            Caption = '>>'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = btn_SelDeptClick
          end
          object edt_RecordType: TEdit
            Left = 328
            Top = 51
            Width = 321
            Height = 21
            ReadOnly = True
            TabOrder = 6
          end
          object btn_SelRType: TButton
            Left = 651
            Top = 51
            Width = 19
            Height = 19
            Hint = 'Select Record Type'
            Caption = '>>'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnClick = btn_SelRTypeClick
          end
          object cb_RecordCat: TComboBox
            Left = 328
            Top = 76
            Width = 321
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            Sorted = True
            TabOrder = 8
          end
          object cb_RecordNumber: TComboBox
            Left = 328
            Top = 100
            Width = 321
            Height = 21
            Style = csSimple
            ItemHeight = 0
            Sorted = True
            TabOrder = 9
          end
          object edt_DeptSort: TEdit
            Left = 213
            Top = 28
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 10
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_RecordTypeSort: TEdit
            Left = 213
            Top = 52
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 11
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_RecordCatSort: TEdit
            Left = 213
            Top = 76
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 12
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_BranchSort: TEdit
            Left = 213
            Top = 4
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 13
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_RecordNumberSort: TEdit
            Left = 213
            Top = 100
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 14
            OnKeyPress = edt_BranchSortKeyPress
          end
          object chk_DeptDisplay: TCheckBox
            Left = 279
            Top = 28
            Width = 19
            Height = 21
            TabOrder = 15
          end
          object chk_RecordTypeDisplay: TCheckBox
            Left = 279
            Top = 52
            Width = 19
            Height = 21
            TabOrder = 16
          end
          object chk_RecordCatDisplay: TCheckBox
            Left = 279
            Top = 76
            Width = 19
            Height = 21
            TabOrder = 17
          end
          object chk_BranchDisplay: TCheckBox
            Left = 279
            Top = 4
            Width = 19
            Height = 21
            TabOrder = 18
          end
          object chk_RecordNumberDisplay: TCheckBox
            Left = 279
            Top = 100
            Width = 19
            Height = 21
            Checked = True
            State = cbChecked
            TabOrder = 19
          end
          object edt_DeptOrder: TEdit
            Left = 164
            Top = 28
            Width = 29
            Height = 21
            TabOrder = 20
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_RecordTypeOrder: TEdit
            Left = 164
            Top = 52
            Width = 29
            Height = 21
            TabOrder = 21
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_RecordCatOrder: TEdit
            Left = 164
            Top = 76
            Width = 29
            Height = 21
            TabOrder = 22
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_BranchOrder: TEdit
            Left = 164
            Top = 4
            Width = 29
            Height = 21
            TabOrder = 23
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_RecordNumberOrder: TEdit
            Left = 164
            Top = 100
            Width = 29
            Height = 21
            TabOrder = 24
            OnKeyPress = edt_BranchOrderKeyPress
          end
        end
        object ScrollBox1: TScrollBox
          Left = -2
          Top = 237
          Width = 739
          Height = 363
          BorderStyle = bsNone
          TabOrder = 1
          DesignSize = (
            739
            363)
          object lbl_Col1: TLabel
            Left = 6
            Top = 10
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object lbl_Col2: TLabel
            Left = 6
            Top = 34
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object lbl_Col3: TLabel
            Left = 6
            Top = 58
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object lbl_Col4: TLabel
            Left = 6
            Top = 82
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object lbl_Col5: TLabel
            Left = 6
            Top = 106
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object lbl_Col6: TLabel
            Left = 6
            Top = 130
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object lbl_Col9: TLabel
            Left = 6
            Top = 202
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object lbl_Col10: TLabel
            Left = 6
            Top = 226
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object lbl_Col7: TLabel
            Left = 6
            Top = 154
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object lbl_Col8: TLabel
            Left = 6
            Top = 178
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object Shape2: TShape
            Left = 200
            Top = 3
            Width = 1
            Height = 356
            Anchors = [akLeft, akTop, akBottom]
          end
          object Shape4: TShape
            Left = 244
            Top = 3
            Width = 1
            Height = 356
            Anchors = [akLeft, akTop, akBottom]
          end
          object Shape6: TShape
            Left = 356
            Top = 3
            Width = 1
            Height = 356
            Anchors = [akLeft, akTop, akBottom]
          end
          object lbl_Col11: TLabel
            Left = 6
            Top = 250
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object lbl_Col14: TLabel
            Left = 6
            Top = 322
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object lbl_Col15: TLabel
            Left = 6
            Top = 346
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object lbl_Col12: TLabel
            Left = 6
            Top = 274
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object lbl_Col13: TLabel
            Left = 6
            Top = 298
            Width = 188
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Column :'
          end
          object btn_FrDate1: TSpeedButton
            Left = 465
            Top = 244
            Width = 26
            Height = 22
            Hint = 'Select Date'
            Flat = True
            Glyph.Data = {
              9E050000424D9E05000000000000360400002800000012000000120000000100
              0800000000006801000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              0303030303030303030303030000030303030303030303030303030303030303
              000003F792929292929292929292929292929203000003EDF5ECE409EDE409EC
              E4F5ECE4EDEC9203000003EDFFFFECFFFFECFFFFECF6F6ECF6079203000003ED
              FFFFEDFFFFECFFFFECF6F6ECF6079203000003F5F5ECE4ECECE4ECEC17161615
              ECEC9203000003F5FFFFECFFFFECFFFF5FFFFF16F6079203000003F5FFFFECFF
              FFECFFFFA7FFF616F6079203000003F5F5ECE4ECECE4ECECAFA75F17ECEC9203
              000003F5FFFFECFFFFECFFFFECFFFFECFF089A03000003F5FFFFECFFFFECFFFF
              ECFFFFECFFFF92030000030909090909ECECE3E3E3E3E3E2E2E2DA0300000309
              F6F6F6F6F6F609090909090909ECDA0300000309090909ECECE3E3E3E3E3E3DA
              E2DADA03000003F7FFF7FFF7FFA4FFA4FF9CFF9BFF5B0803000003FF49084908
              49F64907490849F64908F7030000030303030303030303030303030303030303
              0000}
            Transparent = False
            OnClick = btn_FrDate1Click
          end
          object lbl_btDate1: TLabel
            Left = 493
            Top = 247
            Width = 73
            Height = 13
            Caption = 'Between Dates'
          end
          object btn_ToDate1: TSpeedButton
            Left = 665
            Top = 244
            Width = 26
            Height = 22
            Hint = 'Select Date'
            Flat = True
            Glyph.Data = {
              9E050000424D9E05000000000000360400002800000012000000120000000100
              0800000000006801000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              0303030303030303030303030000030303030303030303030303030303030303
              000003F792929292929292929292929292929203000003EDF5ECE409EDE409EC
              E4F5ECE4EDEC9203000003EDFFFFECFFFFECFFFFECF6F6ECF6079203000003ED
              FFFFEDFFFFECFFFFECF6F6ECF6079203000003F5F5ECE4ECECE4ECEC17161615
              ECEC9203000003F5FFFFECFFFFECFFFF5FFFFF16F6079203000003F5FFFFECFF
              FFECFFFFA7FFF616F6079203000003F5F5ECE4ECECE4ECECAFA75F17ECEC9203
              000003F5FFFFECFFFFECFFFFECFFFFECFF089A03000003F5FFFFECFFFFECFFFF
              ECFFFFECFFFF92030000030909090909ECECE3E3E3E3E3E2E2E2DA0300000309
              F6F6F6F6F6F609090909090909ECDA0300000309090909ECECE3E3E3E3E3E3DA
              E2DADA03000003F7FFF7FFF7FFA4FFA4FF9CFF9BFF5B0803000003FF49084908
              49F64907490849F64908F7030000030303030303030303030303030303030303
              0000}
            Transparent = False
            OnClick = btn_ToDate1Click
          end
          object btn_FrDate2: TSpeedButton
            Left = 465
            Top = 268
            Width = 26
            Height = 23
            Hint = 'Select Date'
            Flat = True
            Glyph.Data = {
              9E050000424D9E05000000000000360400002800000012000000120000000100
              0800000000006801000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              0303030303030303030303030000030303030303030303030303030303030303
              000003F792929292929292929292929292929203000003EDF5ECE409EDE409EC
              E4F5ECE4EDEC9203000003EDFFFFECFFFFECFFFFECF6F6ECF6079203000003ED
              FFFFEDFFFFECFFFFECF6F6ECF6079203000003F5F5ECE4ECECE4ECEC17161615
              ECEC9203000003F5FFFFECFFFFECFFFF5FFFFF16F6079203000003F5FFFFECFF
              FFECFFFFA7FFF616F6079203000003F5F5ECE4ECECE4ECECAFA75F17ECEC9203
              000003F5FFFFECFFFFECFFFFECFFFFECFF089A03000003F5FFFFECFFFFECFFFF
              ECFFFFECFFFF92030000030909090909ECECE3E3E3E3E3E2E2E2DA0300000309
              F6F6F6F6F6F609090909090909ECDA0300000309090909ECECE3E3E3E3E3E3DA
              E2DADA03000003F7FFF7FFF7FFA4FFA4FF9CFF9BFF5B0803000003FF49084908
              49F64907490849F64908F7030000030303030303030303030303030303030303
              0000}
            Transparent = False
            OnClick = btn_FrDate2Click
          end
          object lbl_btDate2: TLabel
            Left = 493
            Top = 271
            Width = 73
            Height = 13
            Caption = 'Between Dates'
          end
          object btn_ToDate2: TSpeedButton
            Left = 665
            Top = 268
            Width = 26
            Height = 22
            Hint = 'Select Date'
            Flat = True
            Glyph.Data = {
              9E050000424D9E05000000000000360400002800000012000000120000000100
              0800000000006801000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              0303030303030303030303030000030303030303030303030303030303030303
              000003F792929292929292929292929292929203000003EDF5ECE409EDE409EC
              E4F5ECE4EDEC9203000003EDFFFFECFFFFECFFFFECF6F6ECF6079203000003ED
              FFFFEDFFFFECFFFFECF6F6ECF6079203000003F5F5ECE4ECECE4ECEC17161615
              ECEC9203000003F5FFFFECFFFFECFFFF5FFFFF16F6079203000003F5FFFFECFF
              FFECFFFFA7FFF616F6079203000003F5F5ECE4ECECE4ECECAFA75F17ECEC9203
              000003F5FFFFECFFFFECFFFFECFFFFECFF089A03000003F5FFFFECFFFFECFFFF
              ECFFFFECFFFF92030000030909090909ECECE3E3E3E3E3E2E2E2DA0300000309
              F6F6F6F6F6F609090909090909ECDA0300000309090909ECECE3E3E3E3E3E3DA
              E2DADA03000003F7FFF7FFF7FFA4FFA4FF9CFF9BFF5B0803000003FF49084908
              49F64907490849F64908F7030000030303030303030303030303030303030303
              0000}
            Transparent = False
            OnClick = btn_ToDate2Click
          end
          object btn_FrDate3: TSpeedButton
            Left = 465
            Top = 292
            Width = 26
            Height = 22
            Hint = 'Select Date'
            Flat = True
            Glyph.Data = {
              9E050000424D9E05000000000000360400002800000012000000120000000100
              0800000000006801000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              0303030303030303030303030000030303030303030303030303030303030303
              000003F792929292929292929292929292929203000003EDF5ECE409EDE409EC
              E4F5ECE4EDEC9203000003EDFFFFECFFFFECFFFFECF6F6ECF6079203000003ED
              FFFFEDFFFFECFFFFECF6F6ECF6079203000003F5F5ECE4ECECE4ECEC17161615
              ECEC9203000003F5FFFFECFFFFECFFFF5FFFFF16F6079203000003F5FFFFECFF
              FFECFFFFA7FFF616F6079203000003F5F5ECE4ECECE4ECECAFA75F17ECEC9203
              000003F5FFFFECFFFFECFFFFECFFFFECFF089A03000003F5FFFFECFFFFECFFFF
              ECFFFFECFFFF92030000030909090909ECECE3E3E3E3E3E2E2E2DA0300000309
              F6F6F6F6F6F609090909090909ECDA0300000309090909ECECE3E3E3E3E3E3DA
              E2DADA03000003F7FFF7FFF7FFA4FFA4FF9CFF9BFF5B0803000003FF49084908
              49F64907490849F64908F7030000030303030303030303030303030303030303
              0000}
            Transparent = False
            OnClick = btn_FrDate3Click
          end
          object lbl_btDate3: TLabel
            Left = 493
            Top = 295
            Width = 73
            Height = 13
            Caption = 'Between Dates'
          end
          object btn_ToDate3: TSpeedButton
            Left = 665
            Top = 292
            Width = 26
            Height = 22
            Hint = 'Select Date'
            Flat = True
            Glyph.Data = {
              9E050000424D9E05000000000000360400002800000012000000120000000100
              0800000000006801000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              0303030303030303030303030000030303030303030303030303030303030303
              000003F792929292929292929292929292929203000003EDF5ECE409EDE409EC
              E4F5ECE4EDEC9203000003EDFFFFECFFFFECFFFFECF6F6ECF6079203000003ED
              FFFFEDFFFFECFFFFECF6F6ECF6079203000003F5F5ECE4ECECE4ECEC17161615
              ECEC9203000003F5FFFFECFFFFECFFFF5FFFFF16F6079203000003F5FFFFECFF
              FFECFFFFA7FFF616F6079203000003F5F5ECE4ECECE4ECECAFA75F17ECEC9203
              000003F5FFFFECFFFFECFFFFECFFFFECFF089A03000003F5FFFFECFFFFECFFFF
              ECFFFFECFFFF92030000030909090909ECECE3E3E3E3E3E2E2E2DA0300000309
              F6F6F6F6F6F609090909090909ECDA0300000309090909ECECE3E3E3E3E3E3DA
              E2DADA03000003F7FFF7FFF7FFA4FFA4FF9CFF9BFF5B0803000003FF49084908
              49F64907490849F64908F7030000030303030303030303030303030303030303
              0000}
            Transparent = False
            OnClick = btn_ToDate3Click
          end
          object Shape8: TShape
            Left = 298
            Top = -1
            Width = 1
            Height = 356
            Anchors = [akLeft, akTop, akBottom]
          end
          object cb_Col1: TComboBox
            Tag = 1
            Left = 370
            Top = 4
            Width = 321
            Height = 21
            ItemHeight = 0
            Sorted = True
            TabOrder = 0
          end
          object cb_Col2: TComboBox
            Tag = 2
            Left = 370
            Top = 28
            Width = 321
            Height = 21
            ItemHeight = 0
            Sorted = True
            TabOrder = 1
          end
          object cb_Col3: TComboBox
            Tag = 3
            Left = 370
            Top = 52
            Width = 321
            Height = 21
            ItemHeight = 0
            Sorted = True
            TabOrder = 2
          end
          object cb_Col4: TComboBox
            Tag = 4
            Left = 370
            Top = 76
            Width = 321
            Height = 21
            ItemHeight = 0
            Sorted = True
            TabOrder = 3
          end
          object cb_Col5: TComboBox
            Tag = 5
            Left = 370
            Top = 100
            Width = 321
            Height = 21
            ItemHeight = 0
            Sorted = True
            TabOrder = 4
          end
          object cb_Col6: TComboBox
            Tag = 6
            Left = 370
            Top = 124
            Width = 321
            Height = 21
            ItemHeight = 0
            Sorted = True
            TabOrder = 5
          end
          object cb_Col7: TComboBox
            Tag = 7
            Left = 370
            Top = 148
            Width = 321
            Height = 21
            ItemHeight = 0
            Sorted = True
            TabOrder = 6
          end
          object cb_Col8: TComboBox
            Tag = 8
            Left = 370
            Top = 172
            Width = 321
            Height = 21
            ItemHeight = 0
            Sorted = True
            TabOrder = 7
          end
          object cb_Col9: TComboBox
            Tag = 9
            Left = 370
            Top = 196
            Width = 321
            Height = 21
            ItemHeight = 0
            Sorted = True
            TabOrder = 8
          end
          object cb_Col10: TComboBox
            Tag = 10
            Left = 370
            Top = 220
            Width = 321
            Height = 21
            ItemHeight = 0
            Sorted = True
            TabOrder = 9
          end
          object cb_Col14: TComboBox
            Tag = 14
            Left = 370
            Top = 316
            Width = 321
            Height = 21
            ItemHeight = 0
            Sorted = True
            TabOrder = 10
          end
          object cb_Col15: TComboBox
            Tag = 15
            Left = 370
            Top = 340
            Width = 321
            Height = 21
            ItemHeight = 0
            Sorted = True
            TabOrder = 11
          end
          object edt_FrDate1: TEdit
            Left = 370
            Top = 244
            Width = 96
            Height = 21
            TabOrder = 12
          end
          object edt_ToDate1: TEdit
            Left = 570
            Top = 244
            Width = 96
            Height = 21
            TabOrder = 13
          end
          object edt_FrDate2: TEdit
            Left = 370
            Top = 268
            Width = 96
            Height = 21
            TabOrder = 14
          end
          object edt_ToDate2: TEdit
            Left = 570
            Top = 268
            Width = 96
            Height = 21
            TabOrder = 15
          end
          object edt_FrDate3: TEdit
            Left = 370
            Top = 292
            Width = 96
            Height = 21
            TabOrder = 16
          end
          object edt_ToDate3: TEdit
            Left = 570
            Top = 292
            Width = 96
            Height = 21
            TabOrder = 17
          end
          object edt_ColSort1: TEdit
            Left = 255
            Top = 4
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 18
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_ColSort2: TEdit
            Left = 255
            Top = 28
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 19
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_ColSort3: TEdit
            Left = 255
            Top = 52
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 20
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_ColSort4: TEdit
            Left = 255
            Top = 76
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 21
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_ColSort5: TEdit
            Left = 255
            Top = 100
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 22
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_ColSort6: TEdit
            Left = 255
            Top = 124
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 23
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_ColSort7: TEdit
            Left = 255
            Top = 148
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 24
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_ColSort8: TEdit
            Left = 255
            Top = 172
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 25
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_ColSort9: TEdit
            Left = 255
            Top = 196
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 26
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_ColSort10: TEdit
            Left = 255
            Top = 220
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 27
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_ColSort11: TEdit
            Left = 255
            Top = 244
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 28
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_ColSort12: TEdit
            Left = 255
            Top = 268
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 29
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_ColSort13: TEdit
            Left = 255
            Top = 292
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 30
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_ColSort14: TEdit
            Left = 255
            Top = 316
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 31
            OnKeyPress = edt_BranchSortKeyPress
          end
          object edt_ColSort15: TEdit
            Left = 255
            Top = 340
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 32
            OnKeyPress = edt_BranchSortKeyPress
          end
          object chk_ColDisplay1: TCheckBox
            Left = 321
            Top = 4
            Width = 21
            Height = 21
            TabOrder = 33
          end
          object chk_ColDisplay2: TCheckBox
            Left = 321
            Top = 28
            Width = 21
            Height = 21
            TabOrder = 34
          end
          object chk_ColDisplay3: TCheckBox
            Left = 321
            Top = 52
            Width = 21
            Height = 21
            TabOrder = 35
          end
          object chk_ColDisplay4: TCheckBox
            Left = 321
            Top = 76
            Width = 21
            Height = 21
            TabOrder = 36
          end
          object chk_ColDisplay5: TCheckBox
            Left = 321
            Top = 100
            Width = 21
            Height = 21
            TabOrder = 37
          end
          object chk_ColDisplay6: TCheckBox
            Left = 321
            Top = 124
            Width = 21
            Height = 21
            TabOrder = 38
          end
          object chk_ColDisplay7: TCheckBox
            Left = 321
            Top = 148
            Width = 21
            Height = 21
            TabOrder = 39
          end
          object chk_ColDisplay8: TCheckBox
            Left = 321
            Top = 172
            Width = 21
            Height = 21
            TabOrder = 40
          end
          object chk_ColDisplay9: TCheckBox
            Left = 321
            Top = 196
            Width = 21
            Height = 21
            TabOrder = 41
          end
          object chk_ColDisplay10: TCheckBox
            Left = 321
            Top = 220
            Width = 21
            Height = 21
            TabOrder = 42
          end
          object chk_ColDisplay11: TCheckBox
            Left = 321
            Top = 244
            Width = 21
            Height = 21
            TabOrder = 43
          end
          object chk_ColDisplay12: TCheckBox
            Left = 321
            Top = 268
            Width = 21
            Height = 21
            TabOrder = 44
          end
          object chk_ColDisplay13: TCheckBox
            Left = 321
            Top = 292
            Width = 21
            Height = 21
            TabOrder = 45
          end
          object chk_ColDisplay14: TCheckBox
            Left = 321
            Top = 316
            Width = 21
            Height = 21
            TabOrder = 46
          end
          object chk_ColDisplay15: TCheckBox
            Left = 321
            Top = 334
            Width = 21
            Height = 21
            TabOrder = 47
          end
          object edt_ColOrder1: TEdit
            Left = 204
            Top = 4
            Width = 29
            Height = 21
            TabOrder = 48
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_ColOrder2: TEdit
            Left = 204
            Top = 28
            Width = 29
            Height = 21
            TabOrder = 49
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_ColOrder3: TEdit
            Left = 204
            Top = 52
            Width = 29
            Height = 21
            TabOrder = 50
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_ColOrder4: TEdit
            Left = 204
            Top = 76
            Width = 29
            Height = 21
            TabOrder = 51
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_ColOrder5: TEdit
            Left = 204
            Top = 100
            Width = 29
            Height = 21
            TabOrder = 52
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_ColOrder6: TEdit
            Left = 204
            Top = 124
            Width = 29
            Height = 21
            TabOrder = 53
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_ColOrder7: TEdit
            Left = 204
            Top = 148
            Width = 29
            Height = 21
            TabOrder = 54
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_ColOrder8: TEdit
            Left = 204
            Top = 172
            Width = 29
            Height = 21
            TabOrder = 55
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_ColOrder9: TEdit
            Left = 204
            Top = 196
            Width = 29
            Height = 21
            TabOrder = 56
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_ColOrder10: TEdit
            Left = 204
            Top = 220
            Width = 29
            Height = 21
            TabOrder = 57
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_ColOrder11: TEdit
            Left = 204
            Top = 244
            Width = 29
            Height = 21
            TabOrder = 58
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_ColOrder12: TEdit
            Left = 204
            Top = 268
            Width = 29
            Height = 21
            TabOrder = 59
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_ColOrder13: TEdit
            Left = 204
            Top = 292
            Width = 29
            Height = 21
            TabOrder = 60
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_ColOrder14: TEdit
            Left = 204
            Top = 316
            Width = 29
            Height = 21
            TabOrder = 61
            OnKeyPress = edt_BranchOrderKeyPress
          end
          object edt_ColOrder15: TEdit
            Left = 204
            Top = 340
            Width = 29
            Height = 21
            TabOrder = 62
            OnKeyPress = edt_BranchOrderKeyPress
          end
        end
        object btn_Clear: TButton
          Left = 180
          Top = 31
          Width = 75
          Height = 25
          Caption = 'Cl&ear'
          TabOrder = 2
          OnClick = btn_ClearClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Results &2'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grd_Results: TDBGrid
        Left = 0
        Top = 0
        Width = 773
        Height = 604
        Align = alClient
        DataSource = dts_eRecords
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 781
    Height = 35
    Align = alTop
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 5
      Top = 3
      Width = 60
      Height = 26
      Hint = 'Close eRecords'
      Caption = 'Close'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000320B0000320B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF096EB0096EB0086098FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF096EB0096EB01479B814
        79B8086098FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        096EB0096EB01680BF157DBC147AB91479B8086098394A6B394A6B394A6B394A
        6B394A6B394A6BFF00FFFF00FFFF00FF096EB01886C41783C11680BF157DBC14
        7CBA0860983D5B81085A8E085A8E085A8E085A8E394A6BFF00FFFF00FFFF00FF
        096EB01989C71886C41783C11680BF157FBD0860980F49340F47320F46320F45
        31104531394A6BFF00FFFF00FFFF00FF096EB01A8CCA1989C71886C41783C116
        82C0086098164D38164A36154935164633154431394A6BFF00FFFF00FFFF00FF
        096EB01B90CD1A8CCA1989C71886C41785C30860981C7A5B1C7C5E1D7D601E78
        5B1E7257394A6BFF00FFFF00FFFF00FF096EB01B93CF1B90CD22A6E221A2DE18
        88C60860981F83601E79581E6E4F1D6245205E43394A6BFF00FFFF00FFFF00FF
        096EB01C96D21B93CF22A6E2FFFFFF198BC80860985A7662798370959484AF9C
        8ABB9887394A6BFF00FFFF00FFFF00FF096EB01E9AD61C96D21B93CF1B91CE1A
        8ECB086098F0BAA4F0B297F1BFA8F0BFA8F1BFA9394A6BFF00FFFF00FFFF00FF
        096EB01F9EDA1E9AD61C96D21C94D11B91CE086098F0B79EF2BFA9F4E0D7F2C6
        AEF1A581394A6BFF00FFFF00FFFF00FF096EB021A2DE1F9EDA1E9AD61D98D41C
        94D1086098EE7B45F0A27DF1A986EF7D45F08956394A6BFF00FFFF00FFFF00FF
        096EB022A6E221A2DE1F9EDA1E9CD81D98D4086098ED733BEC6F34EB6F33EC6E
        32EE8655394A6BFF00FFFF00FFFF00FF096EB0096EB022A6E221A2DE20A0DC1E
        9CD8086098E96F3CE65F24E76731EE9D7BED946D394A6BFF00FFFF00FFFF00FF
        FF00FFFF00FF096EB0096EB021A4E020A0DC086098394A6B394A6B394A6B394A
        6B394A6B394A6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF096EB009
        6EB0086098FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Transparent = False
      OnClick = SpeedButton1Click
    end
    object btn_ExportFile: TSpeedButton
      Left = 73
      Top = 3
      Width = 104
      Height = 26
      Caption = 'Export to File'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
      Transparent = False
      OnClick = btn_ExportFileClick
    end
  end
  object qry_RecordType: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 512
    Top = 56
  end
  object qry_RecCat: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 544
    Top = 24
  end
  object qry_Lookup: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 514
    Top = 24
  end
  object qry_Records: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 544
    Top = 56
  end
  object qry_eRecords: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 576
    Top = 56
  end
  object dts_Records: TDataSource
    AutoEdit = False
    DataSet = qry_Records
    Left = 544
    Top = 85
  end
  object dts_eRecords: TDataSource
    AutoEdit = False
    DataSet = qry_eRecords
    Left = 576
    Top = 85
  end
  object SaveFile: TSaveDialog
    DefaultExt = '.CSV'
    Filter = 'csv|*.csv'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 512
    Top = 85
  end
end
