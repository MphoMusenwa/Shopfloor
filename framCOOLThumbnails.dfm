object fram_COOLThumbnails: Tfram_COOLThumbnails
  Left = 0
  Top = 0
  Width = 574
  Height = 417
  TabOrder = 0
  TabStop = True
  object ImageEnViewPrint: TImageEnView
    Left = 26
    Top = 67
    Width = 123
    Height = 128
    Cursor = crDefault
    ParentCtl3D = False
    ZoomFilter = rfFastLinear
    EnableInteractionHints = True
    TabOrder = 3
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 30
    Width = 574
    Height = 0
    AutoSize = True
    ButtonHeight = 30
    ButtonWidth = 31
    TabOrder = 0
    Transparent = False
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
  end
  object pnl_ThumbSize: TPanel
    Left = 0
    Top = 0
    Width = 574
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lbl_ThumbSize: TLabel
      Left = 3
      Top = 8
      Width = 58
      Height = 13
      Caption = 'Thumb Size:'
    end
    object cb_ThumbSize: TComboBox
      Left = 67
      Top = 3
      Width = 81
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = '200x200'
      OnChange = cb_ThumbSizeChange
      Items.Strings = (
        '200x200'
        '300x300'
        '600x600')
    end
  end
  object ImageViewer: TImageEnView
    Left = 168
    Top = 67
    Width = 153
    Height = 128
    Cursor = crArrow
    ParentCtl3D = False
    ZoomFilter = rfFastLinear
    EnableInteractionHints = True
    TabOrder = 4
  end
  object ImageViewerPages: TImageEnMView
    Left = 0
    Top = 30
    Width = 574
    Height = 387
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    ParentCtl3D = False
    StoreType = ietThumb
    ThumbWidth = 200
    ThumbHeight = 200
    HorizBorder = 2
    VertBorder = 2
    OnImageSelect = ImageViewerPagesImageSelect
    MouseInteract = [mmiScroll, mmiSelect]
    GridWidth = -1
    SelectionWidth = 3
    SelectionColor = clRed
    TransitionDuration = 10
    Style = iemsFlat
    SelectionStyle = iessACD
    ThumbnailsBorderColor = clBlack
    WallPaperStyle = iewoTile
    FlatScrollBars = True
    Align = alClient
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
  end
  object qry_Image: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Top = 96
  end
  object qry_Thumb: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 32
    Top = 96
  end
  object PrintDialog1: TPrintDialog
    Left = 64
    Top = 96
  end
  object qry_COOLLabels: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 164
    Top = 47
  end
  object qry_COOLBackground: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 132
    Top = 47
  end
  object qry_COOLData: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 196
    Top = 47
  end
  object qry_SQL: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 228
    Top = 47
  end
end
