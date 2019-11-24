object fram_ViewLocationFilesItems: Tfram_ViewLocationFilesItems
  Left = 0
  Top = 0
  Width = 724
  Height = 424
  TabOrder = 0
  TabStop = True
  object Splitter2: TSplitter
    Left = 0
    Top = 227
    Width = 724
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ExplicitLeft = -225
    ExplicitTop = 194
    ExplicitWidth = 949
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 724
    Height = 34
    Align = alTop
    TabOrder = 0
    object Label4: TLabel
      Left = 445
      Top = 10
      Width = 40
      Height = 13
      Caption = 'Location'
    end
    object Label3: TLabel
      Left = 10
      Top = 11
      Width = 50
      Height = 13
      Caption = 'Filing Area'
    end
    object lbl_RWHouseViewRec: TLabel
      Left = 138
      Top = 11
      Width = 295
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
    object editLoc: TEdit
      Left = 490
      Top = 6
      Width = 137
      Height = 21
      TabOrder = 0
    end
    object btn_GenQry: TBitBtn
      Left = 630
      Top = 4
      Width = 81
      Height = 25
      Caption = 'View'
      TabOrder = 1
      OnClick = btn_GenQryClick
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
    object edt_RWHouseViewRec: TEdit
      Left = 64
      Top = 8
      Width = 50
      Height = 21
      ReadOnly = True
      TabOrder = 2
      OnChange = edt_RWHouseViewRecChange
    end
    object Button2: TButton
      Left = 115
      Top = 8
      Width = 19
      Height = 20
      Hint = 'Select Filing Area'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object pnl_ViewLocFiles: TPanel
    Left = 0
    Top = 34
    Width = 724
    Height = 193
    Align = alTop
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 25
      Width = 722
      Height = 167
      Align = alClient
      DataSource = dts_BrowseFiles
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'FileNumber'
          Title.Caption = 'File Number'
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
          FieldName = 'RecordNo'
          Title.Caption = 'Position'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IssueStatus'
          Title.Caption = 'Status'
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 722
      Height = 24
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 1
      object Label6: TLabel
        Left = 4
        Top = 5
        Width = 58
        Height = 13
        Caption = 'Files Found:'
      end
      object editRecordsFound: TEdit
        Left = 83
        Top = 1
        Width = 104
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object pnl_ViewLocItems: TPanel
    Left = 0
    Top = 230
    Width = 724
    Height = 194
    Align = alClient
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 722
      Height = 24
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label78: TLabel
        Left = 4
        Top = 5
        Width = 64
        Height = 13
        Caption = 'Items Found:'
      end
      object editItemsFound: TEdit
        Left = 83
        Top = 1
        Width = 104
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
    end
    object DBGrid3: TDBGrid
      Left = 1
      Top = 25
      Width = 722
      Height = 168
      Align = alClient
      DataSource = dts_BrowseItems
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Itemnumber'
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
          FieldName = 'RecordNo'
          Title.Caption = 'Position'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Status'
          Visible = True
        end>
    end
  end
  object dts_BrowseItems: TDataSource
    DataSet = qry_BrowseItems
    Left = 17
    Top = 123
  end
  object qry_BrowseItems: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 17
    Top = 156
  end
  object qry_BrowseFiles: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 49
    Top = 156
  end
  object dts_BrowseFiles: TDataSource
    DataSet = qry_BrowseFiles
    Left = 49
    Top = 123
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
    Left = 81
    Top = 156
  end
end
