object fram_ViewLocationContainers: Tfram_ViewLocationContainers
  Left = 0
  Top = 0
  Width = 811
  Height = 430
  TabOrder = 0
  TabStop = True
  object Panel9: TPanel
    Left = 0
    Top = 0
    Width = 811
    Height = 79
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 443
      Top = 10
      Width = 21
      Height = 13
      Caption = 'Row'
    end
    object Label27: TLabel
      Left = 10
      Top = 11
      Width = 50
      Height = 13
      Caption = 'Filing Area'
    end
    object lbl_ViewLocWH3D: TLabel
      Left = 138
      Top = 11
      Width = 271
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
    object Label43: TLabel
      Left = 447
      Top = 33
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Caption = 'Bay'
    end
    object Label55: TLabel
      Left = 443
      Top = 55
      Width = 25
      Height = 13
      Caption = 'Level'
    end
    object btn_ViewLoc3D: TBitBtn
      Left = 550
      Top = 6
      Width = 81
      Height = 24
      Caption = 'View'
      TabOrder = 0
      OnClick = btn_ViewLoc3DClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object edt_ViewLocWH3D: TEdit
      Left = 64
      Top = 8
      Width = 50
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnKeyDown = edt_ViewLocWH3DKeyDown
    end
    object btn_ViewLocWH3D: TButton
      Left = 115
      Top = 8
      Width = 19
      Height = 20
      Hint = 'Select Filing Area'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btn_ViewLocWH3DClick
    end
    object edt_ViewRow3D: TEdit
      Left = 476
      Top = 6
      Width = 50
      Height = 21
      TabOrder = 3
    end
    object edt_ViewBay3D: TEdit
      Left = 476
      Top = 29
      Width = 50
      Height = 21
      TabOrder = 4
    end
    object edt_ViewLev3D: TEdit
      Left = 476
      Top = 51
      Width = 50
      Height = 21
      TabOrder = 5
    end
  end
  object Panel10: TPanel
    Left = 0
    Top = 79
    Width = 811
    Height = 24
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object Label31: TLabel
      Left = 4
      Top = 5
      Width = 89
      Height = 13
      Caption = 'Containers Found:'
    end
    object edt_ViewLocContainerCount: TEdit
      Left = 115
      Top = 1
      Width = 104
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
  object DBGrid4: TDBGrid
    Left = 0
    Top = 103
    Width = 811
    Height = 327
    Align = alClient
    DataSource = dts_BrowseContainers
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Container'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Warehouse'
        Title.Caption = 'Filing Area'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Locno'
        Title.Caption = 'Location'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Position_x'
        Title.Caption = 'Position X'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Position_y'
        Title.Caption = 'Position Y'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Position_z'
        Title.Caption = 'Position Z'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IssueStatus'
        Title.Caption = 'Status'
        Visible = True
      end>
  end
  object qry_SQL: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'nBarcode'
        Size = -1
        Value = Null
      end
      item
        Name = 'nDateTRet'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO History (Barcode, DateTRet)'
      'Values (:nBarcode, :nDateTRet)'
      '')
    Left = 492
    Top = 152
  end
  object dts_BrowseContainers: TDataSource
    AutoEdit = False
    DataSet = qry_BrowseContainers
    Left = 536
    Top = 208
  end
  object qry_BrowseContainers: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 521
    Top = 156
  end
end
