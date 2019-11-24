object frm_SelPickDet: Tfrm_SelPickDet
  Left = 241
  Top = 119
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Search for Picking Details'
  ClientHeight = 348
  ClientWidth = 761
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 761
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btn_Select: TBitBtn
      Left = 8
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Select'
      Default = True
      ModalResult = 1
      TabOrder = 0
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
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object BitBtn1: TBitBtn
      Left = 91
      Top = 2
      Width = 75
      Height = 22
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
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
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object DBNavigator1: TDBNavigator
      Left = 174
      Top = 2
      Width = 200
      Height = 22
      DataSource = dts_Search
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 29
    Width = 761
    Height = 319
    Align = alClient
    DataSource = dts_Search
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Tx_No'
        Title.Caption = 'Picking List No.'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TxDate'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TypeDesc'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Requester'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Branch'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Department'
        Title.Caption = 'Dept'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Container'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Barcode'
        Title.Caption = 'File'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ItemNumber'
        Title.Caption = 'Item'
        Visible = True
      end>
  end
  object dts_Search: TDataSource
    DataSet = qry_Search
    Left = 264
    Top = 104
  end
  object qry_Search: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    SQL.Strings = (
      
        'SELECT a.Tx_No, b.Container, b.Barcode, b.ItemNumber, a.Requeste' +
        'r, a.TxDate, a.TypeDesc, a.Branch, a.Department, a.Status '
      'FROM PICK a,  PICKd b '
      'WHERE a.Tx_No = b.Tx_No'
      'AND b.Container = '#39'SK100C'#39
      'ORDER BY a.Tx_No DESC')
    Left = 296
    Top = 152
  end
end
