object fram_DataManager: Tfram_DataManager
  Left = 0
  Top = 0
  Width = 913
  Height = 611
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  TabStop = True
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 913
    Height = 611
    ActivePage = TabSheet1
    Align = alClient
    HotTrack = True
    Images = ImageList1
    Style = tsFlatButtons
    TabOrder = 0
    OnChanging = PageControl1Changing
    object TabSheet1: TTabSheet
      Caption = 'Find && Replace Data'
      object Splitter1: TSplitter
        Left = 408
        Top = 0
        Width = 7
        Height = 577
        Beveled = True
        ExplicitHeight = 500
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 408
        Height = 577
        Align = alLeft
        TabOrder = 0
        object Label29: TLabel
          Left = 37
          Top = 37
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
          Left = 15
          Top = 63
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
          Left = 8
          Top = 85
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
        object lbl_BranchR: TLabel
          Left = 138
          Top = 39
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
        object lbl_DeptR: TLabel
          Left = 138
          Top = 64
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
        object lbl_WorkR: TLabel
          Left = 12
          Top = 468
          Width = 9
          Height = 13
          Caption = '...'
        end
        object Label10: TLabel
          Left = 46
          Top = 13
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Default'
          Font.Style = []
          ParentFont = False
        end
        object btn_BranchR: TButton
          Left = 115
          Top = 34
          Width = 20
          Height = 20
          Hint = 'Select Branch'
          Caption = '>>'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btn_BranchRClick
        end
        object btn_DeptR: TButton
          Left = 115
          Top = 61
          Width = 20
          Height = 20
          Hint = 'Select Department'
          Caption = '>>'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btn_DeptRClick
        end
        object btn_RecordTypeR: TButton
          Left = 362
          Top = 83
          Width = 20
          Height = 20
          Hint = 'Select Record Type'
          Caption = '>>'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btn_RecordTypeRClick
        end
        object edt_BranchR: TEdit
          Left = 74
          Top = 34
          Width = 40
          Height = 21
          ReadOnly = True
          TabOrder = 3
          OnChange = edt_BranchRChange
        end
        object edt_DeptR: TEdit
          Left = 74
          Top = 60
          Width = 40
          Height = 21
          ReadOnly = True
          TabOrder = 4
          OnChange = edt_DeptRChange
        end
        object edt_RecordTypeR: TEdit
          Left = 74
          Top = 83
          Width = 287
          Height = 21
          ReadOnly = True
          TabOrder = 5
          OnChange = edt_RecordTypeRChange
        end
        object Panel2: TPanel
          Left = 12
          Top = 109
          Width = 385
          Height = 353
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BevelWidth = 2
          BiDiMode = bdLeftToRight
          Color = 9690708
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentBackground = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
          object Label2: TLabel
            Left = 30
            Top = 20
            Width = 32
            Height = 13
            Caption = 'Details'
          end
          object Label3: TLabel
            Left = 24
            Top = 246
            Width = 48
            Height = 13
            Caption = 'Replace'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
          object Bevel1: TBevel
            Left = 16
            Top = 239
            Width = 353
            Height = 9
            Shape = bsTopLine
          end
          object Label1: TLabel
            Left = 12
            Top = 269
            Width = 50
            Height = 13
            Caption = 'which field'
          end
          object Label9: TLabel
            Left = 44
            Top = 294
            Width = 19
            Height = 13
            Caption = 'with'
          end
          object Label5: TLabel
            Left = 11
            Top = 214
            Width = 182
            Height = 13
            Caption = 'Hint : Type <NULL> for BLANK values'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cb_ReplaceWhat: TComboBox
            Left = 67
            Top = 266
            Width = 291
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = cb_ReplaceWhatChange
          end
          object btn_ClearR: TButton
            Left = 192
            Top = 320
            Width = 75
            Height = 25
            Caption = 'Clear'
            TabOrder = 1
            OnClick = btn_ClearRClick
          end
          object btn_SelectR: TButton
            Left = 280
            Top = 208
            Width = 75
            Height = 25
            Caption = 'Select'
            TabOrder = 2
            OnClick = btn_SelectRClick
          end
          object btn_ReplaceR: TButton
            Left = 280
            Top = 320
            Width = 75
            Height = 25
            Caption = 'Replace All'
            Enabled = False
            TabOrder = 3
            OnClick = btn_ReplaceRClick
          end
          object cb_ReplaceWith: TComboBox
            Left = 67
            Top = 290
            Width = 291
            Height = 21
            ItemHeight = 13
            TabOrder = 4
          end
          object sgrd_ReplaceDet: TStringGrid
            Left = 66
            Top = 16
            Width = 288
            Height = 188
            ColCount = 2
            DefaultColWidth = 130
            DefaultRowHeight = 19
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
            TabOrder = 5
            OnKeyDown = sgrd_ReplaceDetKeyDown
            RowHeights = (
              19
              19
              19
              19
              19)
          end
        end
        object cb_TypeR: TComboBox
          Left = 74
          Top = 10
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 7
          Text = 'Containers'
          OnChange = cb_TypeRChange
          Items.Strings = (
            'Containers'
            'Files'
            'Items')
        end
      end
      object Panel3: TPanel
        Left = 415
        Top = 0
        Width = 490
        Height = 577
        Align = alClient
        Caption = 'Panel3'
        TabOrder = 1
        object Label6: TLabel
          Left = 1
          Top = 1
          Width = 488
          Height = 13
          Align = alTop
          Caption = 'Result Set'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 60
        end
        object grd_FindReplace: TDBGrid
          Left = 1
          Top = 14
          Width = 488
          Height = 562
          Align = alClient
          DataSource = dts_Data
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Re-Calculate Retention'
      ImageIndex = 2
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 408
        Height = 577
        Align = alLeft
        TabOrder = 0
        object Label12: TLabel
          Left = 37
          Top = 31
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
        object Label13: TLabel
          Left = 16
          Top = 56
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
        object Label15: TLabel
          Left = 9
          Top = 79
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
        object lbl_BranchT: TLabel
          Left = 138
          Top = 33
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
        object lbl_DeptT: TLabel
          Left = 138
          Top = 58
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
        object Label17: TLabel
          Left = 18
          Top = 324
          Width = 14
          Height = 13
          Caption = '0%'
        end
        object Label19: TLabel
          Left = 370
          Top = 324
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = '100%'
        end
        object Label4: TLabel
          Left = 46
          Top = 8
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Default'
          Font.Style = []
          ParentFont = False
        end
        object Panel12: TPanel
          Left = 16
          Top = 112
          Width = 385
          Height = 161
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BevelWidth = 2
          BiDiMode = bdLeftToRight
          Color = 15444562
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentBackground = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
          object btn_ClearT: TButton
            Left = 288
            Top = 44
            Width = 67
            Height = 25
            Caption = 'Clear'
            TabOrder = 0
            OnClick = btn_ClearTClick
          end
          object btn_SelectT: TButton
            Left = 207
            Top = 44
            Width = 75
            Height = 25
            Caption = 'Select'
            TabOrder = 1
            OnClick = btn_SelectTClick
          end
          object btn_ReplaceT: TButton
            Left = 236
            Top = 97
            Width = 119
            Height = 25
            Caption = 'Re-Calculate All'
            TabOrder = 2
            OnClick = btn_ReplaceTClick
          end
        end
        object btn_BranchT: TButton
          Left = 114
          Top = 27
          Width = 20
          Height = 20
          Hint = 'Select Branch'
          Caption = '>>'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btn_BranchTClick
        end
        object btn_DeptT: TButton
          Left = 114
          Top = 54
          Width = 20
          Height = 20
          Hint = 'Select Department'
          Caption = '>>'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btn_DeptTClick
        end
        object btn_RecordTypeT: TButton
          Left = 367
          Top = 77
          Width = 20
          Height = 20
          Hint = 'Select Record Type'
          Caption = '>>'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btn_RecordTypeTClick
        end
        object edt_BranchT: TEdit
          Left = 74
          Top = 28
          Width = 40
          Height = 21
          ReadOnly = True
          TabOrder = 3
        end
        object edt_DeptT: TEdit
          Left = 74
          Top = 54
          Width = 40
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
        object edt_RecordTypeT: TEdit
          Left = 74
          Top = 77
          Width = 287
          Height = 21
          ReadOnly = True
          TabOrder = 5
        end
        object pBar_Ret: TProgressBar
          Left = 18
          Top = 307
          Width = 380
          Height = 16
          TabOrder = 7
        end
        object cb_TypeT: TComboBox
          Left = 74
          Top = 5
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 8
          Text = 'Containers'
          OnChange = cb_TypeTChange
          Items.Strings = (
            'Containers'
            'Files')
        end
      end
      object Panel13: TPanel
        Left = 408
        Top = 0
        Width = 497
        Height = 577
        Align = alClient
        Caption = 'Panel3'
        TabOrder = 1
        object Label24: TLabel
          Left = 1
          Top = 1
          Width = 495
          Height = 13
          Align = alTop
          Caption = 'Result Set'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 60
        end
        object grd_Retention: TDBGrid
          Left = 1
          Top = 14
          Width = 495
          Height = 562
          Align = alClient
          DataSource = dts_Data
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
  end
  object ImageList1: TImageList
    Height = 18
    Width = 18
    Left = 872
    Top = 8
    Bitmap = {
      494C010103000400040012001200FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000480000001200000001002000000000004014
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A4A0A00040404000A4A0A0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A4A0A00040404000A4A0A00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0A0
      A000804040008040400080404000804040008040400080404000804040008040
      400040404000406060004080C00040406000A4A0A00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000040404000406060004080C00040406000A4A0A000000000000000
      00000000000000000000ABACAC00989B9C00989B9C00989B9C00989B9C00989B
      9C00989B9C00989B9C00989B9C00989B9C00989B9C00989B9C00989B9C00989B
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0A0
      A000F0FBFF00C0A0A000C0A0A000C0A0A000C0A0A000C0A0A000C0A0A0008080
      8000406080004080E00040A0E00040C0E0004060800000000000000000000000
      000000000000C0C0C00080606000404020004040200040402000404040004040
      400080808000406080004080E00040A0E00040C0E00040608000000000000000
      00000000000000000000ABACAC0065B9DF0067BCE30056B5E10065BCE3005AB7
      E1005EB9E1005AB6E10053B3DF005AB6E00045ADDC0057B4DF0056B0D900989B
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0A0
      A000F0FBFF00F0FBFF00FFFFFF00F0FBFF00A4A0A00080808000806060004060
      60004080A00040A0E00080C0E00080A0A000C0C0C00000000000000000000000
      000000000000A4A0A000F0CAA600FFFFFF00FFFFFF00A4A0A000808080008060
      6000406060004080A00040A0E00080C0E00080A0A000C0C0C000000000000000
      00000000000000000000ABACAC0061B7DE00FFFFFF005AB5DE00FFFFFF005AB5
      DE00FFFFFF00C0E1F0005AB5DE00FFFFFF005AB5DE00FFFFFF0052B1DC00989B
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0A0
      A000F0FBFF00F0FBFF00F0FBFF00A4A0A000C0A0A000C0C0C000C0C0A0008080
      80004060600080A0C00080A0C000A4A0A0000000000000000000000000000000
      0000C0C0C000C0808000FFFFFF00FFFFFF00A4A0A000C0A0A000C0C0C000C0C0
      A000808080004060600080A0C00080A0C000A4A0A00000000000000000000000
      00000000000000000000ABACAC005AB5DE005AB5DE005AB5DE005AB5DE005AB5
      DE005AB5DE005AB5DE00CE6B0000CE6B0000CE6B000050ABD60044ABDB00989B
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0A0
      A000F0FBFF00F0FBFF00C0C0C000C0C0C000FFFFFF00F0FBFF00F0CAA600F0CA
      A6008080800080606000C0C0C000000000000000000000000000000000000000
      0000C0C0C000C0A0A000F0FBFF00C0C0C000C0C0C000FFFFFF000040000040A0
      4000F0CAA6008080800080606000C0C0C0000000000000000000000000000000
      00000000000000000000ABACAC006ABCE100FFFFFF005AB5DE00FFFFFF005AB5
      DE00FFFFFF005AB5DE00CE6B0000FDEDE300CE6B0000FFFFFF0053B1DD00989B
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0A0
      A000F0FBFF00F0FBFF00A4A0A000F0FBFF00FFFFFF00FFFFFF00F0FBFF00F0CA
      A600C0C0A0008060600000000000000000000000000000000000000000000000
      0000C0A0A000C0DCC000C0DCC000A4A0A000F0FBFF00FFFFFF00C0C0A0000080
      2000C0C0A000C0C0A00080606000000000000000000000000000000000000000
      00000000000000000000ABACAC0062B8DF005AB5DE005AB5DE005AB5DE005AB5
      DE005AB5DE005AB5DE00C4630700CE6B0000CE6B00006AB2D30047ACDB00989B
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000A0E00000A0
      E00000A0E000F0FBFF0080A08000F0FBFF00F0FBFF00FFFFFF00FFFFFF00F0FB
      FF00F0CAA6008060600000000000000000000000000000000000000000000000
      0000C0808000F0FBFF00F0FBFF0080A08000F0FBFF00FFFFFF00408040000080
      2000F0CAA600F0CAA60080606000000000000000000000000000000000000000
      00000000000000000000ABACAC006DBFE300FFFFFF005AB5DE00FFFFFF005AB5
      DE00FFFFFF00BADCE9005AB5DE00FFFFFF005AB5DE00FFFFFF0051B1DD00989B
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000A0E00000FF
      FF0000C0E000F0FBFF0080C08000C0C0C000F0FBFF00F0FBFF00FFFFFF00FFFF
      FF00C0A0A000806060000000000000000000000000000000000000000000C0C0
      C000C0A0A000FFFFFF00FFFFFF0080C08000C0C0C0000060000000602000C0DC
      C000FFFFFF00C0A0A00080606000000000000000000000000000000000000000
      00000000000000000000ABACAC0063B8DE005AB5DE005AB5DE005AB5DE005AB5
      DE005AB5DE005AB5DE005AB5DE005AB5DE005AB5DE005AB5DE004AAEDC00989B
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000A0E00000C0
      E0000040A000F0FBFF000040200080C0A000C0C0C000F0FBFF00F0FBFF00C0C0
      A00080808000804040000000000000000000000000000000000000000000C0A0
      A000C0C0C000FFFFFF00FFFFFF00FFFFFF0080C0A000C0C0C000F0FBFF00F0FB
      FF00C0C0A00080808000C0808000806060000000000000000000000000000000
      00000000000000000000ABACAC00EEEEED00EEEEED00EEEEED00EEEEED00EEEE
      ED00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00989B
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      A000F0FBFF00F0FBFF00F0FBFF00F0FBFF00C0C0C000A4A0A000A4A0A000A4A0
      A000C0A0A000804040000000000000000000000000000000000000000000C080
      8000C0DCC000FFFFFF00FFFFFF00FFFFFF00F0FBFF00C0C0C000A4A0A000A4A0
      A000A4A0A000FFFFFF00C0C0A000806040000000000000000000000000000000
      00000000000000000000ABACAC00EEEEED002EC231002EC231002EC231002EC2
      31002EC231002CBC2E0029B52B0026AF280023A9250021A32200EEEEED00989B
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008060E0000020C0008080
      E0000020A000F0FBFF0040000000C0A02000C0600000F0FBFF00C0A0A0008040
      400080404000804040000000000000000000000000000000000000000000C080
      8000F0FBFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F0CAA600404040000000000000000000000000000000
      00000000000000000000ABACAC00EEEEED002EC231002EC231002EC231002EC2
      31002EC231002EC231002CBC2E0029B52B0026AF280023A92500EEEEED00989B
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000020C00000E0E000C0C0
      C0008080E000F0FBFF00C0A02000F0CAA600C0600000F0FBFF00C0A0A000C0C0
      C00080404000F0CAA6000000000000000000000000000000000000000000C080
      8000C0808000A4A0A00080808000A4A0A000A4A0A000A4A0A000A4A0A000A4A0
      A000C0808000C080800080606000404040000000000000000000000000000000
      00000000000000000000ABACAC00EEEEED00EEEEED00EEEEED00EEEEED00EEEE
      ED00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00989B
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000020C00000E0E00000E0
      E0000020C000F0FBFF00C0600000C0600000C0600000F0FBFF00C0A0A0008040
      4000C0C0C000000000000000000000000000000000000000000000000000C0A0
      A0008080800080806000C0A0A000C0DCC000F0FBFF00FFFFFF00FFFFFF00FFFF
      FF00F0FBFF00C0C0C000C0DCC000806060000000000000000000000000000000
      00000000000000000000ABACAC009B9B9B009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
      9B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008060E0000020C0000020
      C0008060E000F0CAA600F0CAA600F0CAA600C0C0C000C0C0C000C0C0A000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      000080808000C0808000C0C0C000F0FBFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0FBFF00C0C0C00080806000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A4A0A00080808000808080008080800080808000808080008080
      6000806040008060400000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000048000000120000000100010000000000D80000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFC0000000000FFF8FFFC
      7FFFFC0000000000E0007FF83C000C0000000000E00078003C000C0000000000
      E00078003C000C0000000000E000F0007C000C0000000000E001F000FC000C00
      00000000E003F001FC000C0000000000C003F001FC000C0000000000C003E001
      FC000C0000000000C003E000FC000C0000000000E003E000FC000C0000000000
      8003E000FC000C00000000008003E000FC000C00000000008007E000FC000C00
      00000000800FF001FFFFFC0000000000FFFFF803FFFFFC0000000000FFFFFFFF
      FFFFFC000000000000000000000000000000000000000000000000000000}
  end
  object qry_Data: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 336
    Top = 33
  end
  object qry_UpdRet: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 264
    Top = 33
  end
  object qry_SQL: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 36000
    Parameters = <>
    Left = 296
    Top = 33
  end
  object dts_Data: TDataSource
    AutoEdit = False
    DataSet = qry_Data
    Left = 337
    Top = 70
  end
  object qry_RecordType: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 376
    Top = 33
  end
end
