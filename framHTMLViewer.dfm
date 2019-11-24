object fram_HTMLViewer: Tfram_HTMLViewer
  Left = 0
  Top = 0
  Width = 649
  Height = 482
  TabOrder = 0
  TabStop = True
  DesignSize = (
    649
    482)
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 649
    Height = 482
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    object WebBrowser1: TWebBrowser
      Left = 1
      Top = 1
      Width = 647
      Height = 480
      TabStop = False
      Align = alClient
      TabOrder = 0
      ControlData = {
        4C000000DF4200009C3100000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E12620A000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object pnl_Cover: TPanel
    Left = 386
    Top = 2
    Width = 263
    Height = 22
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 0
  end
  object qry_eRecordImages: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 240
    Top = 96
  end
end
