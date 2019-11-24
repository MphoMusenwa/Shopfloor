object frm_ContainerComments: Tfrm_ContainerComments
  Left = 193
  Top = 122
  Caption = 'Comments'
  ClientHeight = 341
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 33
    Align = alTop
    TabOrder = 0
    object btn_Close: TSpeedButton
      Left = 6
      Top = 5
      Width = 62
      Height = 24
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      Caption = '&Close'
      Flat = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
      OnClick = btn_CloseClick
    end
    object DBNavigator1: TDBNavigator
      Left = 78
      Top = 4
      Width = 222
      Height = 25
      DataSource = dts_Comments
      VisibleButtons = [nbEdit, nbPost, nbCancel]
      Flat = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object mem_Notes: TDBMemo
    Left = 0
    Top = 33
    Width = 536
    Height = 308
    HelpType = htKeyword
    Align = alClient
    DataField = 'Comments'
    DataSource = dts_Comments
    TabOrder = 1
  end
  object dts_Comments: TDataSource
    AutoEdit = False
    DataSet = qry_Comments
    Left = 32
    Top = 112
  end
  object qry_Comments: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 32
    Top = 80
  end
end
