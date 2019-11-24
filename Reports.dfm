object frm_Reports: Tfrm_Reports
  Left = 0
  Top = 0
  Caption = 'Reports'
  ClientHeight = 375
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 30
    Align = alTop
    TabOrder = 0
    object btn_Close: TSpeedButton
      Left = 5
      Top = 4
      Width = 77
      Height = 22
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
  object Panel1: TPanel
    Left = 0
    Top = 30
    Width = 792
    Height = 345
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 198
      Height = 13
      Align = alTop
      Caption = 'Please select the Report you wish to View'
    end
    object Splitter1: TSplitter
      Left = 289
      Top = 14
      Width = 7
      Height = 330
      Beveled = True
      ExplicitLeft = 249
      ExplicitTop = 20
      ExplicitHeight = 324
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 14
      Width = 288
      Height = 330
      Align = alLeft
      DataSource = dts_Reports
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ReportName'
          Title.Caption = 'Report Name'
          Width = 245
          Visible = True
        end>
    end
    object pnl_Parameters: TPanel
      Left = 296
      Top = 14
      Width = 495
      Height = 330
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object btn_Preview: TSpeedButton
        Left = 335
        Top = 142
        Width = 98
        Height = 25
        Caption = 'Preview'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000520B0000520B00000000000000000000FF00FFFF00FF
          AEAEAE999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C
          9E999C9E999C9EFF00FFFF00FFFF00FF636B73F7F7F7F4F4F4F2F2F2EFEFEFED
          EDEDEAEAEAE8E8E8E2E2E2DDDDDDD7D7D7D2D2D29C9FA1FF00FFFF00FF636B73
          3775AB636B73F7F7F7F4F4F4F2F2F2EFEFEFEDEDEDEAEAEAE8E8E8E2E2E2DDDD
          DDD7D7D79C9FA1FF00FFFF00FF31A5FF5ABDFF2F76B3636B73F7F7F7F4F4F4F2
          F2F2EFEFEFEDEDEDEAEAEAE8E8E8E2E2E2DDDDDD9C9FA1FF00FFFF00FFFF00FF
          31A5FF5ABDFF2F76B3F7F7F7F7F7F7F4F4F4F2F2F2EFEFEFEDEDEDEAEAEAE8E8
          E8E2E2E29C9FA1FF00FFFF00FFFF00FFAEAEAE31A5FF4A4239E5DAD5DCC3B1CC
          A79DD3B6A3DDC5BAE5DAD5EDEDEDEAEAEAE8E8E89C9FA1FF00FFFF00FFFF00FF
          AEAEAEFFFFFFE5DAD5AD9383E7D6AAF8E8B5F3E4B2E7D4AECCA79DE9E9E9EDED
          EDEAEAEA9C9FA1FF00FFFF00FFFF00FFAEAEAEFFFFFFD7B9B2ECDDADF9E8B6FF
          EFBBFFF1BCFEF0BBECDEADD3BAB4F0F0F0EDEDED9C9FA1FF00FFFF00FFFF00FF
          AEAEAEFFFFFFCCA79DEBDCACF9E8B6FEEDBBFFF0BCFFF1BDFBEBB7CCA79DF3F3
          F3F0F0F09C9FA1FF00FFFF00FFFF00FFAEAEAEFFFFFFD7B9B2E2D4A7F4E5B7FB
          EEC8FCEBBAFCECB9F0E0B0D7B9B2F5F5F5EAEAEA9C9FA1FF00FFFF00FFFF00FF
          AEAEAEFFFFFFE7D5D5DBC8A9EEE1BAF6E9C2F5E5B4EDDEAED7BE9EDFCAC3E2E2
          E2DDDDDD9C9FA1FF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFCCA79DD8C3AEDD
          C9A6DFCAA6DABEA2D4B6AEEBEBEB9C9FA19C9FA19C9FA1FF00FFFF00FFFF00FF
          AEAEAEFFFFFFFFFFFFFFFFFFE7D5D5D7B9B2D7B9B2DDCEC7FFFFFFA8A9AAFFFF
          FFE6E6E69C9FA1FF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFA8A9AAE6E6E69B9D9DFF00FFFF00FFFF00FFFF00FF
          AEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A9AA9B9D
          9DFF00FFFF00FFFF00FFFF00FFFF00FFAEAEAE9B9B9C9B9B9C9B9B9C9B9B9C9B
          9B9C9B9B9C9B9B9C9B9B9C9C9FA1FF00FFFF00FFFF00FFFF00FF}
        OnClick = btn_PreviewClick
      end
      object pnl_Branch: TPanel
        Left = 6
        Top = 6
        Width = 427
        Height = 28
        TabOrder = 0
        object Label9: TLabel
          Left = 4
          Top = 6
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
          Left = 141
          Top = 6
          Width = 280
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
        object edt_Branch: TEdit
          Left = 73
          Top = 3
          Width = 41
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object btn_SelBranch: TButton
          Left = 115
          Top = 4
          Width = 20
          Height = 20
          Hint = 'Select Branch'
          Caption = '>>'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btn_SelBranchClick
        end
      end
      object pnl_Department: TPanel
        Left = 6
        Top = 40
        Width = 427
        Height = 28
        TabOrder = 1
        object Label40: TLabel
          Left = 4
          Top = 6
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
          Left = 141
          Top = 6
          Width = 280
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
        object edt_Dept: TEdit
          Left = 73
          Top = 3
          Width = 41
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object btn_SelDept: TButton
          Left = 115
          Top = 4
          Width = 20
          Height = 20
          Hint = 'Select Department'
          Caption = '>>'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btn_SelDeptClick
        end
      end
      object pnl_RecordType: TPanel
        Left = 6
        Top = 74
        Width = 427
        Height = 28
        TabOrder = 2
        object Label2: TLabel
          Left = 4
          Top = 6
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
        object btn_SelRecordType: TButton
          Left = 257
          Top = 4
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
          TabOrder = 0
          OnClick = btn_SelRecordTypeClick
        end
        object edt_RType: TEdit
          Left = 73
          Top = 3
          Width = 183
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
      end
      object pnl_FilingArea: TPanel
        Left = 6
        Top = 108
        Width = 427
        Height = 28
        TabOrder = 3
        object Label41: TLabel
          Left = 5
          Top = 6
          Width = 49
          Height = 13
          Caption = 'Filing Area'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_WHouse: TLabel
          Left = 141
          Top = 6
          Width = 280
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
        object edt_WHouse: TEdit
          Left = 74
          Top = 3
          Width = 40
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object btn_SelWHouse: TButton
          Left = 115
          Top = 4
          Width = 20
          Height = 20
          Hint = 'Select Filing Area'
          Caption = '>>'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btn_SelWHouseClick
        end
      end
      object DBMemo1: TDBMemo
        Left = 1
        Top = 240
        Width = 493
        Height = 89
        Align = alBottom
        DataField = 'ReportDescription'
        DataSource = dts_Reports
        TabOrder = 4
      end
    end
  end
  object dts_Reports: TDataSource
    AutoEdit = False
    DataSet = qry_Reports
    Left = 304
    Top = 216
  end
  object qry_Reports: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    LockType = ltReadOnly
    AfterScroll = qry_ReportsAfterScroll
    Parameters = <>
    Left = 368
    Top = 224
  end
  object sp_Report: TADOStoredProc
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 336
    Top = 224
  end
end
