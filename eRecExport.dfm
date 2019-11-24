object frm_eRecExport: Tfrm_eRecExport
  Left = 0
  Top = 0
  Caption = 'eRecords Export'
  ClientHeight = 514
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter3: TSplitter
    Left = 297
    Top = 30
    Width = 6
    Height = 484
    Beveled = True
    ExplicitLeft = 304
    ExplicitTop = 20
    ExplicitHeight = 319
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 891
    Height = 30
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -38
    ExplicitWidth = 673
    object btn_Close: TSpeedButton
      Left = 5
      Top = 3
      Width = 73
      Height = 23
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
  object Panel8: TPanel
    Left = 0
    Top = 30
    Width = 297
    Height = 484
    Align = alLeft
    TabOrder = 1
    ExplicitLeft = 1
    ExplicitTop = 32
    ExplicitHeight = 309
    object Label10: TLabel
      Left = 37
      Top = 31
      Width = 74
      Height = 13
      Caption = 'Bulk Import No.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 8
      Top = 288
      Width = 8
      Height = 13
      Caption = '='
    end
    object cb_BulkImportNo: TComboBox
      Left = 117
      Top = 27
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 0
      OnChange = cb_BulkImportNoChange
    end
    object btn_ExportBulkImport: TButton
      Left = 171
      Top = 87
      Width = 75
      Height = 25
      Caption = 'Export'
      Enabled = False
      TabOrder = 1
      OnClick = btn_ExportBulkImportClick
    end
    object btn_SelectBulkImport: TButton
      Left = 53
      Top = 87
      Width = 74
      Height = 25
      Caption = 'Show'
      Enabled = False
      TabOrder = 2
      OnClick = btn_SelectBulkImportClick
    end
  end
  object Panel10: TPanel
    Left = 303
    Top = 30
    Width = 588
    Height = 484
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    ExplicitLeft = 272
    ExplicitTop = 20
    ExplicitWidth = 363
    ExplicitHeight = 319
    object Label21: TLabel
      Left = 1
      Top = 1
      Width = 60
      Height = 13
      Align = alTop
      Caption = 'Result Set'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 14
      Width = 586
      Height = 469
      Align = alClient
      DataSource = DTS_BulkData
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object qry_BulkData: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 424
    Top = 33
  end
  object DTS_BulkData: TDataSource
    AutoEdit = False
    DataSet = qry_BulkData
    Left = 425
    Top = 70
  end
  object qry_SQL: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 456
    Top = 33
  end
  object qry_Export: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 536
    Top = 113
  end
  object qry_GetImage: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 584
    Top = 113
  end
  object qry_IndexDefs: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 624
    Top = 113
  end
end
