object frm_IndexDefsRelations: Tfrm_IndexDefsRelations
  Left = 230
  Top = 114
  Caption = 'Index Definition Relationships'
  ClientHeight = 466
  ClientWidth = 862
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
  object pnl_Top: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 32
    HelpContext = 12
    Align = alTop
    TabOrder = 0
    object btn_Close: TSpeedButton
      Left = 5
      Top = 3
      Width = 73
      Height = 25
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
      OnClick = btn_CloseClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 32
    Width = 862
    Height = 434
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Files / Items'
      object lbl_RightAccess: TLabel
        Left = 9
        Top = 101
        Width = 193
        Height = 33
        AutoSize = False
        Caption = 'Access denied to RecordType(s)'
      end
      object Label4: TLabel
        Left = 376
        Top = 100
        Width = 193
        Height = 33
        AutoSize = False
        Caption = 'Access granted to RecordType(s)'
      end
      object btn_SelectAll: TButton
        Left = 342
        Top = 203
        Width = 25
        Height = 17
        HelpContext = 11
        Caption = '>>'
        Enabled = False
        TabOrder = 0
        OnClick = btn_SelectAllClick
      end
      object btn_Deselect: TButton
        Left = 342
        Top = 232
        Width = 25
        Height = 17
        HelpContext = 11
        Caption = '<'
        Enabled = False
        TabOrder = 1
        OnClick = btn_DeselectClick
      end
      object btn_DeselectAll: TButton
        Left = 342
        Top = 262
        Width = 25
        Height = 17
        HelpContext = 11
        Caption = '<<'
        Enabled = False
        TabOrder = 2
        OnClick = btn_DeselectAllClick
      end
      object btn_Create: TBitBtn
        Left = 600
        Top = 63
        Width = 100
        Height = 25
        Hint = 'Create Access Rights in Metrofile Database'
        HelpContext = 11
        Caption = '&Update'
        Enabled = False
        TabOrder = 3
        OnClick = btn_CreateClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000330B0000330B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF086CAE086CAE086CAEFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1084CE4ABDFF4ABD
          FF1084CE086CAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF1084CE4ABDFF299CEF8CF7FF4ABDFF086CAEFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1084CE4ABDFF299CEF8CF7FF1084
          CE8CF7FF086CAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1084CE10
          84CE4ABDFF299CEF8CF7FF1084CE8CF7FF086CAEFF00FFFF00FFFF00FFFF00FF
          1395E71084CE1084CE1084CE4ABDFF4ABDFF299CEF8CF7FF1084CE8CF7FF086C
          AEFF00FFFF00FFFF00FFFF00FF1084CE4ABDFF4ABDFF4ABDFF4ABDFF299CEF29
          9CEF8CF7FF1084CE8CF7FF086CAEFF00FFFF00FFFF00FFFF00FF1395E74ABDFF
          71F8FF71F8FF71F8FF71F8FF71F8FF71F8FF1084CE8CF7FF086CAEFF00FFFF00
          FFFF00FFFF00FFFF00FF1084CE71F8FF95FBFF93FBFF91FBFF8EFAFF8BFAFF71
          F8FF71F8FF086CAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1084CE9CFCFF
          99FBFF96FBFF93FBFF91FBFF8EFAFF8BFAFF71F8FF086CAEFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF1084CE9FFCFF9CFCFF299CEF96FBFF93FBFF91FBFF8E
          FAFF71F8FF086CAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1084CEA2FCFF
          ADCEE74ABDFF1084CE96FBFF93FBFF91FBFF71F8FF086CAEFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF1395E7A5FDFFA2FCFFADCEE79CFCFF99FBFF96FBFF93
          FBFF71F8FF1084CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1084CE
          A5FDFFA2FCFF9FFCFF9CFCFF99FBFF71F8FF086CAEFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF1395E71084CE1084CE1084CE1084CE10
          84CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object Panel1: TPanel
        Left = 9
        Top = 4
        Width = 368
        Height = 34
        BevelOuter = bvLowered
        TabOrder = 4
        object Label5: TLabel
          Left = 9
          Top = 10
          Width = 50
          Height = 13
          Caption = 'Item Type:'
        end
      end
      object btn_Select: TButton
        Left = 342
        Top = 173
        Width = 25
        Height = 17
        HelpContext = 11
        Caption = '>'
        Enabled = False
        TabOrder = 5
        OnClick = btn_SelectClick
      end
      object sgrd_Denied: TStringGrid
        Left = 10
        Top = 133
        Width = 323
        Height = 169
        ColCount = 1
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 2
        TabOrder = 6
        ColWidths = (
          296)
      end
      object sgrd_Granted: TStringGrid
        Left = 375
        Top = 133
        Width = 323
        Height = 169
        ColCount = 1
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 2
        TabOrder = 7
        ColWidths = (
          296)
      end
      object cb_ItemType: TComboBox
        Left = 74
        Top = 10
        Width = 295
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 8
        OnChange = cb_ItemTypeChange
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'eRecords / Record Categories'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 9
        Top = 102
        Width = 193
        Height = 33
        AutoSize = False
        Caption = 'Access denied to Record Category'
      end
      object Label2: TLabel
        Left = 376
        Top = 101
        Width = 193
        Height = 33
        AutoSize = False
        Caption = 'Access granted to Record Category'
      end
      object btn_SelectAllRCat: TButton
        Left = 342
        Top = 204
        Width = 25
        Height = 17
        HelpContext = 11
        Caption = '>>'
        Enabled = False
        TabOrder = 0
        OnClick = btn_SelectAllRCatClick
      end
      object btn_DeSelectRCat: TButton
        Left = 342
        Top = 233
        Width = 25
        Height = 17
        HelpContext = 11
        Caption = '<'
        Enabled = False
        TabOrder = 1
        OnClick = btn_DeSelectRCatClick
      end
      object btn_DeSelectAllRCat: TButton
        Left = 342
        Top = 263
        Width = 25
        Height = 17
        HelpContext = 11
        Caption = '<<'
        Enabled = False
        TabOrder = 2
        OnClick = btn_DeSelectAllRCatClick
      end
      object Panel2: TPanel
        Left = 9
        Top = 7
        Width = 368
        Height = 34
        BevelOuter = bvLowered
        TabOrder = 3
        object Label3: TLabel
          Left = 9
          Top = 10
          Width = 65
          Height = 13
          Caption = 'Record Type:'
        end
      end
      object btn_SelectRCat: TButton
        Left = 342
        Top = 174
        Width = 25
        Height = 17
        HelpContext = 11
        Caption = '>'
        Enabled = False
        TabOrder = 4
        OnClick = btn_SelectRCatClick
      end
      object sgrd_DeniedRCat: TStringGrid
        Left = 10
        Top = 134
        Width = 323
        Height = 169
        ColCount = 1
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 2
        TabOrder = 5
        ColWidths = (
          295)
      end
      object sgrd_GrantedRCat: TStringGrid
        Left = 375
        Top = 134
        Width = 323
        Height = 169
        ColCount = 1
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 2
        TabOrder = 6
        ColWidths = (
          294)
      end
      object cb_RecordType: TComboBox
        Left = 88
        Top = 13
        Width = 279
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 7
        OnChange = cb_RecordTypeChange
      end
      object btn_SaveRightsRCat: TBitBtn
        Left = 600
        Top = 63
        Width = 100
        Height = 25
        Hint = 'Create Access Rights in Metrofile Database'
        HelpContext = 11
        Caption = '&Update'
        Enabled = False
        TabOrder = 8
        OnClick = btn_SaveRightsRCatClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000330B0000330B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF086CAE086CAE086CAEFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1084CE4ABDFF4ABD
          FF1084CE086CAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF1084CE4ABDFF299CEF8CF7FF4ABDFF086CAEFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1084CE4ABDFF299CEF8CF7FF1084
          CE8CF7FF086CAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1084CE10
          84CE4ABDFF299CEF8CF7FF1084CE8CF7FF086CAEFF00FFFF00FFFF00FFFF00FF
          1395E71084CE1084CE1084CE4ABDFF4ABDFF299CEF8CF7FF1084CE8CF7FF086C
          AEFF00FFFF00FFFF00FFFF00FF1084CE4ABDFF4ABDFF4ABDFF4ABDFF299CEF29
          9CEF8CF7FF1084CE8CF7FF086CAEFF00FFFF00FFFF00FFFF00FF1395E74ABDFF
          71F8FF71F8FF71F8FF71F8FF71F8FF71F8FF1084CE8CF7FF086CAEFF00FFFF00
          FFFF00FFFF00FFFF00FF1084CE71F8FF95FBFF93FBFF91FBFF8EFAFF8BFAFF71
          F8FF71F8FF086CAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1084CE9CFCFF
          99FBFF96FBFF93FBFF91FBFF8EFAFF8BFAFF71F8FF086CAEFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF1084CE9FFCFF9CFCFF299CEF96FBFF93FBFF91FBFF8E
          FAFF71F8FF086CAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1084CEA2FCFF
          ADCEE74ABDFF1084CE96FBFF93FBFF91FBFF71F8FF086CAEFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF1395E7A5FDFFA2FCFFADCEE79CFCFF99FBFF96FBFF93
          FBFF71F8FF1084CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1084CE
          A5FDFFA2FCFF9FFCFF9CFCFF99FBFF71F8FF086CAEFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF1395E71084CE1084CE1084CE1084CE10
          84CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
    end
  end
  object qry_SQL: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 524
    Top = 63
  end
end
