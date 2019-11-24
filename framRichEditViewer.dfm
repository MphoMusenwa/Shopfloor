object fram_RTFViewer: Tfram_RTFViewer
  Left = 0
  Top = 0
  Width = 649
  Height = 482
  TabOrder = 0
  TabStop = True
  DesignSize = (
    649
    482)
  object pnl_Cover: TPanel
    Left = 386
    Top = 2
    Width = 263
    Height = 22
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 649
    Height = 482
    Align = alClient
    TabOrder = 1
    object re: TRichEdit
      Left = 1
      Top = 1
      Width = 647
      Height = 480
      Align = alClient
      Lines.Strings = (
        're')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
    end
  end
  object qry_eRecordImages: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 240
    Top = 96
  end
end
