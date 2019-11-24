object frm_ItemCoversheet: Tfrm_ItemCoversheet
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Item Coversheet'
  ClientHeight = 102
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object rep_RecordDetails: TQuickRep
    Left = 32
    Top = 91
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = qry_repRecordDetail
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRLOOPBAND1'
      'QRSTRINGSBAND2')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      76.200000000000000000
      2970.000000000000000000
      76.200000000000000000
      2100.000000000000000000
      76.200000000000000000
      76.200000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Inches
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    object TitleBand1: TQRBand
      Left = 29
      Top = 29
      Width = 736
      Height = 314
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        830.791666666666700000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRShape17: TQRShape
        Left = 9
        Top = 172
        Width = 719
        Height = 35
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          92.604166666666670000
          23.812500000000000000
          455.083333333333300000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 9
        Top = 274
        Width = 495
        Height = 35
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          92.604166666666670000
          23.812500000000000000
          724.958333333333300000
          1309.687500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 9
        Top = 240
        Width = 495
        Height = 35
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          92.604166666666670000
          23.812500000000000000
          635.000000000000000000
          1309.687500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 9
        Top = 126
        Width = 719
        Height = 47
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          124.354166666666700000
          23.812500000000000000
          333.375000000000000000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel19: TQRLabel
        Left = 8
        Top = 31
        Width = 94
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          82.020833333333330000
          248.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Item Coversheet'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText2: TQRDBText
        Left = 125
        Top = 129
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          330.729166666666700000
          341.312500000000000000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'Branch'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 125
        Top = 151
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          330.729166666666700000
          399.520833333333300000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'Department'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape3: TQRShape
        Left = 9
        Top = 99
        Width = 719
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.083333333333330000
          23.812500000000000000
          261.937500000000000000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel9: TQRLabel
        Left = 12
        Top = 105
        Width = 714
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          277.812500000000000000
          1889.125000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Classification Details'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel11: TQRLabel
        Left = 17
        Top = 129
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          341.312500000000000000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Branch Code'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 17
        Top = 151
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          399.520833333333300000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Dept Code'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 219
        Top = 129
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          579.437500000000000000
          341.312500000000000000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Branch Code'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 219
        Top = 151
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          579.437500000000000000
          399.520833333333300000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Dept Code'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape5: TQRShape
        Left = 114
        Top = 160
        Width = 1
        Height = 149
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          394.229166666666700000
          301.625000000000000000
          423.333333333333300000
          2.645833333333333000)
        Pen.Color = clGray
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 210
        Top = 126
        Width = 1
        Height = 46
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          121.708333333333300000
          555.625000000000000000
          333.375000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 330
        Top = 126
        Width = 1
        Height = 46
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          121.708333333333300000
          873.125000000000000000
          333.375000000000000000
          2.645833333333333000)
        Pen.Color = clGray
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText34: TQRDBText
        Left = 8
        Top = 8
        Width = 290
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          21.166666666666670000
          21.166666666666670000
          767.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'CompanyName'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRDBText35: TQRDBText
        Left = 342
        Top = 129
        Width = 376
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          904.875000000000000000
          341.312500000000000000
          994.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'BranchName'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText36: TQRDBText
        Left = 342
        Top = 151
        Width = 376
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          904.875000000000000000
          399.520833333333300000
          994.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'DeptName'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 17
        Top = 251
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          664.104166666666700000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Record Type'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape9: TQRShape
        Left = 503
        Top = 240
        Width = 129
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1330.854166666667000000
          635.000000000000000000
          341.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 503
        Top = 257
        Width = 129
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1330.854166666667000000
          679.979166666666700000
          341.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 631
        Top = 240
        Width = 97
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1669.520833333333000000
          635.000000000000000000
          256.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 631
        Top = 257
        Width = 97
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1669.520833333333000000
          679.979166666666700000
          256.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 503
        Top = 274
        Width = 129
        Height = 35
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          92.604166666666670000
          1330.854166666667000000
          724.958333333333300000
          341.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 631
        Top = 274
        Width = 97
        Height = 35
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          92.604166666666670000
          1669.520833333333000000
          724.958333333333300000
          256.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 17
        Top = 284
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          751.416666666666700000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Filing Method'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 510
        Top = 281
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1349.375000000000000000
          743.479166666666700000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Requested to be Filed'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 125
        Top = 251
        Width = 359
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          330.729166666666700000
          664.104166666666700000
          949.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'FileType'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 125
        Top = 284
        Width = 359
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          330.729166666666700000
          751.416666666666700000
          949.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'FilingMethod'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRImage1: TQRImage
        Left = 619
        Top = 5
        Width = 112
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          1637.770833333333000000
          13.229166666666670000
          296.333333333333300000)
        AutoSize = True
        Picture.Data = {
          07544269746D6170661E0000424D661E00000000000036000000280000007000
          0000170000000100180000000000301E00000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF7FCE7E4F4AF9EDC5E
          32BC3300A83905AB4E21B3957ED1D5CFEDFFFEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE2DEF25C3BB91F009F1A009D3100A83403A83302A82C00A516009C0D00
          985E40B9B9ADE1FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF6F3FBECE3F6E7DBF5FDFBFDFFFFFFFFFFFFFFFFFFFFFFFFFEFDFEEDE4F7
          EDE4F6EEE6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF8FCEDE5F6ECE4F7F1E9
          F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5A2DF9880D39B83D3CB
          BEEAFBF7FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7DCF4A693D9
          917BD1CBBCE9FFFFFFFFFFFFFFFFFFEEE8F7EDE4F7EDE7F7FCFBFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3B7E53F1DAD2500A03802AB1D009F1C
          009F4C24B2441AAF451BB0471BB0441AAF310FA73B15ABB9A7E0FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF3EDFAECE5F7EBE3F6F9F7FCFFFFFFFFFFFFFFFF
          FFFFFFFFFEFFFFF0EBF8ECE5F7EDE5F7F8F6FCFFFFFFFFFFFFFFFFFFFFFFFFF7
          EFFB9C85D59C86D4E7E0F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F4FDB09DDD
          9982D39078D0DFD6F0FFFFFFFFFFFFFFFFFF907BCF2C1BA51C0D9AE1E1F0FFFF
          FFFFFFFFFFFFFFFFFFFFEBE7F63F26AC3020A64523AEFDFAFEFFFFFFFFFFFFFF
          FFFFFFFFFFC4B7E53E2BAD2F1BA66A5AC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          7A70C63E2DAC3406A83000A83100A63A11AA3923AAA087D7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFB9A4E12214A23300A82600A2401CAFFFFFFFFFFFFFF9F5FC50
          39B4311DA74934B2D9CCEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2B5E5
          360FA93101A83100A82700A39789D3D0C7EBE6DFF4E2DAF2E2DBF2E2DBF2E2DB
          F2E3DBF3D9CFEEE7E0F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8275CA34
          19A83127A7BAABE1FFFFFFFFFFFFFFFFFFFFFFFFF4F0FB5F3CBA331FA83922AB
          B0A1DEFFFFFFFFFFFFFFFFFFCBBAE83C2CAC2E00A517009BAAA6DBFFFFFFFFFF
          FFFFFFFFFBF7FD6B4FBF3A27AB3304A83000A62E00A63C1BAB452FAEBEAFE4FF
          FFFF8D73CE2300A1070096DEDDF1FFFFFFFFFFFFFFFFFFFFFFFFEAE6F63405A8
          2800A33C0BACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2B4E63608AA2600A36349
          BBFFFFFFFFFFFFFFFFFFF4F0FA583CB82300A03400A82700A41C009F1D009F19
          009D13009A6A51C0FFFFFFFFFFFFFFFFFFFFFFFFF0E8F82911A33600A93803AA
          20009F19009CD8CFEDFFFFFFFBF8FD4718B02900A54116AED7CDEEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF9F7FC5B36B92C00A63000A74517AFE9E4F5FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7C66C62A00A52900A2B8A7E0FFFFFFFFFFFFFFFF
          FFFFFFFFF4F3FA562BB72B00A53000A7AF9BDCFFFFFFFFFFFFEBE6F65331B62C
          00A53C08AC19009C3D1CADF0EBF8FFFFFFE9E4F63F31AD2400A23400A82500A2
          1B009E1C009E18009C12009A846ACAFFFFFF9076D02900A30C0098DFDEF1FFFF
          FFFFFFFFFFFFFFFFFFFFEBE7F73A0BAB2D00A54112AEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFC5B6E53B0EAB2C00A4664EBDFFFFFFFFFFFFFFFFFF8468CA1E009F
          3803AA2B02A58C6CCECEC7E9C7BFE7D1CBEB9B84D35B32BAD4C8EBFFFFFFFFFF
          FFFFFFFFAC96DB3000A73906AA3C0EACAB98DCD6C9ECE2DAF1FFFFFFFAF9FC4C
          1DB32F00A6451BAFD8CEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA896D916009B
          3706AB2B00A4FCFDFDFFFFFFFFFFFFFFFFFFEDE8F7EAE3F6FFFFFFFFFFFFFFFF
          FFFFFFFFFCFBFDFDFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6BC830
          00A62D04A5BBAAE1FFFFFFFFFFFFFFFFFFFFFFFFF5F2FA5A32B83000A73404AA
          B09FDDFFFFFFFFFFFFD5CFED3C1BAD3703A93200A7947DD1C9BAE7FBFAFCFAF8
          FD6548BD2500A33603AA2D0DA69B83D4D2CBEBC7BEE7CDC5E88971CC5E3DBAF3
          F0FA9076D02900A30C0098DFDEF1FFFFFFFFFFFFFFFFFFFFFFFFEBE7F73A0BAB
          2D00A54112AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4B6E53B0EAB2C00A4664D
          BDFFFFFFFFFFFFF2EFF90F00993A04AA2D00A5AA96DAFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFAF9FDFAFAFCFFFFFFFFFFFFFFFFFFB09BDD3200A83000A76A4BC0
          FFFFFEFFFFFFFFFFFFFFFFFFFAF9FC4C1DB32F00A6451BAFD8CEEFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF2900A43503A91D009E9E88D6FFFFFFFFFFFFF0EAF8A7
          A4D9532EB64A23B29A87D3EBE6F6FFFFFFFFFFFFDED4F0806CC97F70C98C80CD
          E6E1F4FFFFFFFFFFFFFFFFFF7F6AC83000A62D04A5BAAAE1FFFFFFFFFFFFFFFF
          FFFFFFFFF5F2FA5A32B83000A73404AAB09EDDFFFFFFFFFFFFD8D4EF4321AF2F
          00A74D25B3EFECF8FFFFFFFFFFFFBCADE12B00A53400A82B08A5D2C6EAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFBF9FDFDFEFE9076D02900A30C0098DFDEF1FFFF
          FFFFFFFFFFFFFFFFFFFFEBE7F73A0BAB2D00A54112AEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFC4B6E53B0EAB2C00A4664DBDFFFFFFFFFFFFA289D71B009E2900A4
          7D65C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFB19CDD3101A83000A77854C5FEFDFEFFFFFFFFFFFFFFFFFFFAF9FC4C
          1DB32F00A6451BAFD8CEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000933804AA
          3B0FABF4F1F9FFFFFFFFFFFF7D6FC715009B2D00A62E00A61A009D5D37BBFFFF
          FFFFFFFFFBF8FD462DB013009A2300A2BCADE2FFFFFFFFFFFFFFFFFF7F6AC830
          00A62D04A5BAAAE1FFFFFFFFFFFFFFFFFFFFFFFFF5F2FA5A32B83000A73404AA
          B09EDDFFFFFFFFFFFFD8D4EF4321AF2A00A4623FBDFFFFFFFFFFFFFFFFFF7A66
          C62500A32D00A58E73CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF9076D02900A30C0098DFDEF1FFFFFFFFFFFFFFFFFFFFFFFFEBE7F73A0BAB
          2D00A54112AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4B6E53B0EAB2C00A4664D
          BDFFFFFFFFFFFF4025AD3701AA1C009EB4B3E0FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB19CDD3101A83100A77450C4
          FCFBFEFFFFFFFFFFFFFFFFFFFAF9FC4C1DB32F00A6451BAFD8CEEFFFFFFFFFFF
          FFFFFFFFFFFFFFBCA8E215009A2B00A5715BC3FCFBFDFFFFFFC9BEE83206A838
          04AA3E0CAD3E0BAD3E08AD0F0099D4CAECFFFFFFFFFFFF8E7ACE2A00A42E00A5
          9076CFFFFFFEFFFFFFFFFFFF7F6AC83000A62D04A5BAAAE1FFFFFFFFFFFFFFFF
          FFFFFFFFF5F2FA5A32B83000A73404AAB09EDDFFFFFFFFFFFFD8D4EF4321AF2B
          00A45D39BAFCFAFCFFFFFFFFFFFF4E26B42C00A53200A8CFC3EAFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9076D02900A30C0098DFDEF1FFFF
          FFFFFFFFFFFFFFFFFFFFEBE7F73A0BAB2D00A54112AEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFC4B6E53B0EAB2C00A4664DBDFFFFFFFFFFFF3B1DAB3803A93B07AC
          3202A72B00A32900A32900A32900A32900A32C00A42700A32300A2CCBFE8FFFF
          FFFFFFFFB19CDD3101A83100A77450C4FCFCFEFFFFFFFFFFFFFFFFFFFAF9FC4C
          1DB32F00A6451BAFD8CEEFFFFFFFFFFFFFFFFFFFFFFFFF8867CA2600A32B00A4
          876FCCFFFFFFFFFFFFB5A7E02C00A53C09AC3D0BAD3C0BAD400CAE1A009DA58F
          D8FFFFFFFFFFFFBCABE22200A02C00A5896ECDFFFFFFFFFFFFFFFFFF7F6AC830
          00A62D04A5BAAAE1FFFFFFFFFFFFFFFFFFFFFFFFF5F2FA5A32B83000A73404AA
          B09EDDFFFFFFFFFFFFD8D4EF4321AF2B00A45D39BAFCFAFDFFFFFFFDFDFF3C0B
          AC3300A83A08AB3000A72B00A42800A32900A32900A32900A32C00A42B00A42C
          00A69076D02900A30C0098DFDEF1FFFFFFFFFFFFFFFFFFFFFFFFEBE7F73A0BAB
          2D00A54011AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4B6E53B0EAB2C00A4664D
          BDFFFFFFFFFFFF371CAA3804AA3C09AD390AAB3307A93206A83206A83307A836
          07A93702A93500A93200A8D4C9EDFFFFFFFFFFFFB19CDD3101A83100A77450C4
          FCFCFEFFFFFFFFFFFFFFFFFFFAF9FC4C1DB32F00A6451BAFD8CEEFFFFFFFFFFF
          FFFFFFFFFFFFFF8F72CE2300A22900A4816BC8FFFFFFFFFFFFB7A9DF2B00A63B
          09AD3D0BAD3C0BAD400CAE17009CA58FD7FFFFFFFFFFFFAF9EDD2400A12B00A5
          896CCCFFFFFFFFFFFFFFFFFF7F6AC83000A62D04A5BAAAE1FFFFFFFFFFFFFFFF
          FFFFFFFFF5F2FA5A32B83000A73404AAB09EDDFFFFFFFFFFFFD8D4EF4321AF2B
          00A45D39BAFCFAFDFFFFFFFEFEFF3F0EAD3300A83C08AC3808AA3307A83206A8
          3206A83205A8390CAB3902A93A04AA3500A99076D02900A30C0097E2E2F3FFFF
          FFFFFFFFFFFFFFFFFFFFEBE7F7390BAB2D00A44619B0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFC8BCE73D11AC2C00A4664DBDFFFFFFFFFFFF4D30B23200A82F00A7
          8A72CDBFB3E4B6A9DFB7A9DFB9ADE1BFB1E23401A92E00A55433B6EFECF8FFFF
          FFFFFFFFB19CDD3101A83100A77450C4FCFCFEFFFFFFFFFFFFFFFFFFFAF9FC4C
          1DB32F00A6481EB0DBD1EFFFFFFFFFFFFFFFFFFFFFFFFFCFC1E91200993100A8
          6D50C0FBF9FDFFFFFFD6CCEE3511A93300A8400DAE3F0CAE3805AB16009BDFD6
          F2FFFFFFFFFFFF806BC82900A43000A79B82D4FFFFFFFFFFFFFFFFFF7F6AC830
          00A62D04A5BAAAE1FFFFFFFFFFFFFFFFFFFFFFFFF5F2FA5A32B83000A73404AA
          B09EDDFFFFFFFFFFFFD8D4EF4321AF2B00A45D39BAFCFAFDFFFFFFFFFFFF502E
          B42A00A43704AA9F88D5BDB1E2B6A9DFB7A9DFBAACE2AB9EDA1A009D3602A95A
          31B89076D02700A215009CCABFE8FFFFFFFFFFFFFFFFFFFFFFFFF3F1FA3D10AC
          3200A72800A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBAAE33704AA2D00A5664D
          BDFFFFFFFFFFFFA189D618009E1F00A0B4B3DFFFFFFFFFFFFFFFFFFFFFFFFFDD
          D0EF2500A22A00A56041BAF7F6FCFFFFFFFFFFFFB19BDD3101A83100A77450C4
          FCFCFEFFFFFFFFFFFFFFFFFFFAF9FC4C1DB33100A83A0AABD7CEEDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF0000840E0099070094E4E1F4FFFFFFFFFFFFAB9ADB11
          009A1D009E2100A10D0098967AD0FFFFFFFFFFFFF8F5FB532AB52F00A7390CAB
          C3B5E5FFFFFFFFFFFFFFFFFF7F6AC83000A62D04A5BAAAE1FFFFFFFFFFFFFFFF
          FFFFFFFFF5F2FA5A32B83000A73404AAB09EDDFFFFFFFFFFFFD8D4EF4321AF2B
          00A45D39BAFCFAFDFFFFFFFFFFFF8B75CD2700A22F00A7CBBDE9FFFFFFFFFFFF
          FFFFFFFFFFFFE4E5F30D00982400A28C72CD9076D02400A1410BAF15009AA58A
          D8FFFFFFFFFFFFFFFFFFA995DA2C00A63C0AAD2E00A63318A9C9BAE7FFFFFFFF
          FFFFFFFFFF8069C82700A33200A85C44B9FFFFFFFFFFFFFFFFFF1A009D2D00A6
          3705AAF4F2FAFFFFFFFFFFFFFFFFFF6D4AC02900A42D00A59D87D6FFFFFFFFFF
          FFFFFFFFBAA6E13402A82F00A77B59C7FFFFFFFFFFFFFFFFFFFFFFFFFAF9FC4B
          1DB33501A93604AA2B00A6AF9BDDFFFFFFFFFEFFFFFFFFFFFFFFBAA9E1BCABE1
          A892D9E5DEF3FFFFFFFFFFFFFFFFFFFCFFFE7B5BC66F4BC1E7E0F4FFFFFFFFFF
          FFFFFFFFB0A1DB2A00A53500AA4D24B3E3DCF3FFFFFFFFFFFFFFFFFF8571CA31
          00A62E06A6C5B6E5FFFFFFFFFFFFFFFFFFFFFFFFF5F2FA5A32B82F00A73404AA
          B09EDDFFFFFFFFFFFFD8D4EF4321AF2B00A45D39BAFCFAFDFFFFFFFFFFFFCEC0
          EA2900A32A00A34620B1FFFFFFFFFFFFFFFFFFFFFFFF3400A83400A815009CD7
          CFEE9177D12700A23B07AB3605AA0F00983C0FAB856FCA8771CB3001A63502AA
          3500A84618B02500A215009C582EB78974CC7052C12100A03F0AAD15009BA993
          DBFFFFFFFFFFFFFFFFFFA897D92700A22C00A63C0DACB0A0DCB7A5E06644BE28
          00A32B00A5593BB8F2F0F9FFFFFFBFB2E17564C46F4DC13804AA3703A95026B5
          8068C87F6EC9FFFFFFFFFFFFFBFAFC4D1DB33702A93A05AC2D00A515009B2D00
          A67253C3FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAA8E12A01A33805AB2900A3A18BD7
          FFFFFFFFFFFFC5BFE57362C45832B83704AA3602A96B49BF806BC9846FCBFFFF
          FFFFFFFFF5F3FA5C33B83100A73604AAB19FDDFFFFFFFFFFFFD8D4EF4321AF2B
          00A45D39BAFCFAFDFFFFFFFFFFFFFFFFFF816DC92600A32700A25229B5B39FDE
          B6A8E1461CB12B00A62700A1755BC3FFFFFF8167C90500952300A1AD99DC4324
          AE17009B0C00981C009F3100A81B009E512FB5EEE9F78061C82D07A50F009816
          009B2400A22C00A61E009F3F1FAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF937ED1
          2500A114009B2200A12900A217009C16009B4F31B3CEC2EAFFFFFFFFFFFF8370
          CA0000851E009F3B09AC3E0BAE2C00A40A009600008EC1B2E4FFFFFFF9F5FC36
          0FA914009B3F1EAD6D47C02600A217009C3911ABD2C6EBFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB19F
          DF380FAA3301A82500A2503AB4FFFCFFFFFFFFFFFFFF9087D00000852A00A43E
          0BAD3C09AC1C009E07009500008DC3B3E6FFFFFFF3EFF9481BAF15009B1C009F
          A693D9FFFFFFFFFFFFD8D4EF4321AF2B00A45D39BAFCFAFDFFFFFFFFFFFFFFFF
          FFFEFCFF786BC61D009F14009A2600A22400A21A009D1E00A05C3BB9E2D8F1FF
          FFFFB9ABE06E65C19685D1FFFFFFE3DAF29E8BD47A64C53804AB3C0DAC8172C9
          E0DFF2FFFFFFFFFFFFC2B8E58C80CE5229B53500A95B3BB89A8BD5ECE4F7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFCF9FDB3ADDF8172C93F0FAD3100A8674ABE8F
          89D0EBE2F5FFFFFFFFFFFFFFFFFFC0B6E47C73C67152C23804AA3803AA5128B5
          8A78CC7469C3BEAFE3FFFFFFFBF8FD8F7FCE7669C5ADABDBFFFEFFA59AD87E6D
          C72A00A49980D3FFFFFFFFFFFFFFFFFFC7B8E6957BD1A890D9A791D9A790D9A7
          90D9A790D9A992DA9C83D5685CBE2F00A73402A82800A43E21ACE9E2F5FFFFFF
          FFFFFFFFFFFFC9C2E77C73C65A35B93703AA3706AA6E4EC18D7CCD7167C3C2B3
          E4FFFFFFF8F6FC9881D27C6FC77F6FC8CDC3E9FFFFFFFFFFFFD8D4EF4321AF2B
          00A45D39BAFCFAFDFFFFFFFFFFFFFFFFFFFFFFFFF8F4FCA89ED9806CC83300A8
          3807A9684EBDA5A0D9ECE4F7FFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDFBFEE0D8F2E3DBF2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEB
          E5F6DED6F1F2ECF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE4DCF3DFD6F1F5F1FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFB7A3E03401A83000A77856C6FFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFFFFFFFFFFFFFFFFFFFFDCD2F0E9E3F6FEFFFEFFFFFFFFFFFF
          EAE1F54121AD0C00982600A43200A73000A62F00A63000A72F00A62C00A53802
          AB2100A14B27B3E0D9F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF836ECB31
          00A82E05A7C0B1E3FFFFFFFFFEFFFDFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFD8D4EF4321AF2B00A45D39BAFCFAFDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFFDFD7F1E1DAF2F6F3FBFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD97DC2B00A62E00A57450C4
          FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D84D4370EAB1D009F2C
          00A63300A93200A73000A62300A01E029F8F73CFFBFAFDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7C68C73000A62F06A6C3B4E4FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFCFAFDAE9ADAD9D0F0FFFFFFFFFFFFFFFFFFD8D4EF4321AF2B
          00A45D39BAFCFAFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFBBA6E13F30AD2600A36844BFFBFAFCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFAF8FCC8B9E76847BF4638B04A38B35E3FBAB09ADDF8F5
          FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8772CC29
          00A33200A86842BEFDFCFEFFFFFFFEFFFFFFFFFFFAF8FC5C48B915009A2800A4
          B9AEE0FFFFFFFFFFFFD8D4EF4321AF2B00A45D39BAFCFAFDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0DEB1A3DE
          FDFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFECE2F63114A72F00A62C00A56648BE7068C2DFD2
          F1FFFFFFCDC7E915009B4208AF2600A37A59C6FCFBFEFFFFFFDAD4EF4621B02E
          00A55F3BBBFDFBFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3
          B8E52500A214009B15009A000089977DD2FFFFFFF7F5FB5A32B90000912B06A4
          BFB2E4FFFFFFFFFFFFD0CAEA1C0A9E0000903B17ACF8F4FBFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE9F8BCB0E29075D08368CAD8D0
          EEFFFFFFFFFFFFF5F0FBCDCAE9E4E0F3FFFFFFFFFFFFFFFFFFF7F7FCD6D5EDD2
          CEECDBD7F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      end
      object QRLabel6: TQRLabel
        Left = 511
        Top = 259
        Width = 48
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1352.020833333333000000
          685.270833333333300000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date Filed'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 634
        Top = 258
        Width = 89
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1677.458333333333000000
          682.625000000000000000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'DateFiled'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 634
        Top = 281
        Width = 89
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1677.458333333333000000
          743.479166666666700000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'ItemFiler'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 16
        Top = 183
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          484.187500000000000000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Itemnumber'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText14: TQRDBText
        Left = 124
        Top = 183
        Width = 174
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          328.083333333333300000
          484.187500000000000000
          460.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'Itemnumber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 635
        Top = 241
        Width = 89
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1680.104166666667000000
          637.645833333333300000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'SentToFile'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 510
        Top = 241
        Width = 54
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1349.375000000000000000
          637.645833333333300000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sent to File'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape26: TQRShape
        Left = 9
        Top = 206
        Width = 719
        Height = 35
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          92.604166666666670000
          23.812500000000000000
          545.041666666666700000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 16
        Top = 217
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          574.145833333333300000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Filenumber'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 124
        Top = 217
        Width = 359
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          328.083333333333300000
          574.145833333333300000
          949.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'Filenumber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 287
        Top = 176
        Width = 432
        Height = 27
        Hint = 'Filenumber'
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          759.354166666666700000
          465.666666666666700000
          1143.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'Itemnumber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -35
        Font.Name = 'Free 3 of 9 Extended'
        Font.Style = []
        OnPrint = QRDBText8Print
        ParentFont = False
        Transparent = False
        WordWrap = False
        FontSize = 26
      end
      object QRDBText15: TQRDBText
        Left = 8
        Top = 54
        Width = 721
        Height = 28
        Hint = 'Filenumber'
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.083333333333330000
          21.166666666666670000
          142.875000000000000000
          1907.645833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'BarcodedInfo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -35
        Font.Name = 'Free 3 of 9 Extended'
        Font.Style = []
        OnPrint = QRDBBarcodePrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 26
      end
    end
    object ColumnHeaderBand2: TQRBand
      Left = 29
      Top = 343
      Width = 736
      Height = 48
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        127.000000000000000000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
      object QRShape2: TQRShape
        Left = 9
        Top = 0
        Width = 719
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.083333333333330000
          23.812500000000000000
          0.000000000000000000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel18: TQRLabel
        Left = 12
        Top = 5
        Width = 714
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          13.229166666666670000
          1889.125000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Classification Details'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape18: TQRShape
        Left = 9
        Top = 27
        Width = 719
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333330000
          23.812500000000000000
          71.437500000000000000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel21: TQRLabel
        Left = 249
        Top = 30
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          658.812500000000000000
          79.375000000000000000
          84.666666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 17
        Top = 30
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          79.375000000000000000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Header'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape19: TQRShape
        Left = 241
        Top = 27
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333300000
          637.645833333333300000
          71.437500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object DetailBand2: TQRBand
      Left = 29
      Top = 391
      Width = 736
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape20: TQRShape
        Left = 9
        Top = 0
        Width = 719
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          23.812500000000000000
          0.000000000000000000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape21: TQRShape
        Left = 241
        Top = 0
        Width = 1
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          637.645833333333300000
          0.000000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText9: TQRDBText
        Left = 18
        Top = 3
        Width = 216
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          47.625000000000000000
          7.937500000000000000
          571.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordDetail
        DataField = 'sHead'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 250
        Top = 3
        Width = 470
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          661.458333333333300000
          7.937500000000000000
          1243.541666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordDetail
        DataField = 'sDet'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object PageFooterBand1: TQRBand
      Left = 29
      Top = 606
      Width = 736
      Height = 95
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        251.354166666666700000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRShape22: TQRShape
        Left = 10
        Top = 73
        Width = 73
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          26.458333333333330000
          193.145833333333300000
          193.145833333333300000)
        Pen.Color = clGray
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape23: TQRShape
        Left = 82
        Top = 73
        Width = 354
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          216.958333333333300000
          193.145833333333300000
          936.625000000000000000)
        Pen.Color = clGray
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape24: TQRShape
        Left = 435
        Top = 73
        Width = 145
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1150.937500000000000000
          193.145833333333300000
          383.645833333333300000)
        Pen.Color = clGray
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape25: TQRShape
        Left = 579
        Top = 73
        Width = 153
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1531.937500000000000000
          193.145833333333300000
          404.812500000000000000)
        Pen.Color = clGray
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel23: TQRLabel
        Left = 20
        Top = 75
        Width = 44
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          52.916666666666670000
          198.437500000000000000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Operator'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object lbl_repRecordDetOperator: TQRLabel
        Left = 92
        Top = 75
        Width = 339
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          243.416666666666700000
          198.437500000000000000
          896.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Operator'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 469
        Top = 75
        Width = 84
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1240.895833333333000000
          198.437500000000000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date/Time Printed'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRSysData1: TQRSysData
        Left = 582
        Top = 75
        Width = 149
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1539.875000000000000000
          198.437500000000000000
          394.229166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 8
      end
      object QRDBText13: TQRDBText
        Left = 8
        Top = 6
        Width = 721
        Height = 27
        Hint = 'Filenumber'
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          21.166666666666670000
          15.875000000000000000
          1907.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'BarcodedInfo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -35
        Font.Name = 'Free 3 of 9 Extended'
        Font.Style = []
        OnPrint = QRDBBarcodePrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 26
      end
      object QRDBText12: TQRDBText
        Left = 8
        Top = 37
        Width = 721
        Height = 27
        Hint = 'Filenumber'
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          21.166666666666670000
          97.895833333333330000
          1907.645833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qry_repRecordHead
        DataField = 'BarcodedInfo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -35
        Font.Name = 'Free 3 of 9 Extended'
        Font.Style = []
        OnPrint = QRDBBarcodePrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 26
      end
    end
    object SummaryBand1: TQRBand
      Left = 29
      Top = 413
      Width = 736
      Height = 193
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        510.645833333333300000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRShape_Action: TQRShape
        Left = 9
        Top = 155
        Width = 719
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.083333333333330000
          23.812500000000000000
          410.104166666666700000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape_ActionTitle: TQRShape
        Left = 9
        Top = 128
        Width = 719
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.083333333333330000
          23.812500000000000000
          338.666666666666700000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrShape_History2: TQRShape
        Left = 9
        Top = 77
        Width = 719
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          23.812500000000000000
          203.729166666666700000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrShape_History3: TQRShape
        Left = 9
        Top = 100
        Width = 719
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          23.812500000000000000
          264.583333333333300000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrShape_History1: TQRShape
        Left = 9
        Top = 54
        Width = 719
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          23.812500000000000000
          142.875000000000000000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 9
        Top = 6
        Width = 719
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.083333333333330000
          23.812500000000000000
          15.875000000000000000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 12
        Top = 11
        Width = 714
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          29.104166666666670000
          1889.125000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'History'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape14: TQRShape
        Left = 9
        Top = 33
        Width = 719
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          23.812500000000000000
          87.312500000000000000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel4: TQRLabel
        Left = 12
        Top = 36
        Width = 46
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          31.750000000000000000
          95.250000000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 76
        Top = 36
        Width = 25
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          201.083333333333300000
          95.250000000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 212
        Top = 36
        Width = 68
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          560.916666666666700000
          95.250000000000000000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'From Status'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 286
        Top = 36
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          756.708333333333300000
          95.250000000000000000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'To Status'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel26: TQRLabel
        Left = 345
        Top = 36
        Width = 59
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          912.812500000000000000
          95.250000000000000000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Requester'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel27: TQRLabel
        Left = 565
        Top = 36
        Width = 64
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1494.895833333333000000
          95.250000000000000000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Warehouse'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel28: TQRLabel
        Left = 635
        Top = 36
        Width = 48
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1680.104166666667000000
          95.250000000000000000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Location'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_TrxType1: TQRLabel
        Left = 12
        Top = 59
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          31.750000000000000000
          156.104166666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_Date1: TQRLabel
        Left = 74
        Top = 59
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          195.791666666666700000
          156.104166666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_FrStat1: TQRLabel
        Left = 212
        Top = 59
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          560.916666666666700000
          156.104166666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_ToStat1: TQRLabel
        Left = 286
        Top = 59
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          756.708333333333300000
          156.104166666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_Requester1: TQRLabel
        Left = 345
        Top = 59
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          912.812500000000000000
          156.104166666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_Warehouse1: TQRLabel
        Left = 565
        Top = 59
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1494.895833333333000000
          156.104166666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_LocNo1: TQRLabel
        Left = 635
        Top = 59
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1680.104166666667000000
          156.104166666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_TrxType2: TQRLabel
        Left = 12
        Top = 82
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          31.750000000000000000
          216.958333333333300000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_Date2: TQRLabel
        Left = 74
        Top = 82
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          195.791666666666700000
          216.958333333333300000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_FrStat2: TQRLabel
        Left = 212
        Top = 82
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          560.916666666666700000
          216.958333333333300000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_ToStat2: TQRLabel
        Left = 286
        Top = 82
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          756.708333333333300000
          216.958333333333300000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_Requester2: TQRLabel
        Left = 345
        Top = 83
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          912.812500000000000000
          219.604166666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_Warehouse2: TQRLabel
        Left = 565
        Top = 82
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1494.895833333333000000
          216.958333333333300000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_LocNo2: TQRLabel
        Left = 635
        Top = 82
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1680.104166666667000000
          216.958333333333300000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_TrxType3: TQRLabel
        Left = 12
        Top = 105
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          31.750000000000000000
          277.812500000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_Date3: TQRLabel
        Left = 74
        Top = 105
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          195.791666666666700000
          277.812500000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_FrStat3: TQRLabel
        Left = 212
        Top = 105
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          560.916666666666700000
          277.812500000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_ToStat3: TQRLabel
        Left = 286
        Top = 105
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          756.708333333333300000
          277.812500000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_Requester3: TQRLabel
        Left = 345
        Top = 105
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          912.812500000000000000
          277.812500000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_Warehouse3: TQRLabel
        Left = 565
        Top = 105
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1494.895833333333000000
          277.812500000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_LocNo3: TQRLabel
        Left = 635
        Top = 105
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1680.104166666667000000
          277.812500000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TrxType'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlbl_ActionTitle: TQRLabel
        Left = 12
        Top = 133
        Width = 714
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          351.895833333333300000
          1889.125000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Action'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlbl_Action: TQRLabel
        Left = 12
        Top = 160
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          423.333333333333300000
          84.666666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Action'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 371
    Height = 102
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 982
    ExplicitHeight = 889
    object btn_PrintRecordDetails: TSpeedButton
      Left = 119
      Top = 60
      Width = 129
      Height = 25
      Caption = 'Print'
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        030303030303030303030303039B9B9B9B9A9A9A9A929292A40303EDE409EDED
        EDEDEDEDEDEDEDED920303EDEDF6FFFFF60909092828289A929B03EC08FFFFFF
        FFFFF609FA3E289B9A9203ECF6FFFFFFFFFFFFF6FAFA28A39B9203EC0707F5ED
        ECE4A4A39B9B9BA49B9A03EDFFFFFFFFFFFFFFFFFFF6F6E4A39B0307ECF5EDF5
        EDECE4A39B9BA3EDE49B030307F509FFFFFFFFF6F6ED9BF7F59B03030303F5FF
        F607070707089B9BEDED0303030309F6FFFFFFFFFFF6079BED07030303030307
        FFF60707070708A39B0703030303030308FFFFFFFFFFF6079B08030303030303
        0807070707070707070703030303030303030303030303030303}
      OnClick = btn_PrintRecordDetailsClick
    end
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 66
      Height = 13
      Caption = 'Select Action:'
    end
    object cb_Action: TComboBox
      Left = 88
      Top = 13
      Width = 249
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object qry_repRecordHead: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'mItem'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      
        '  i.Itemnumber,i.Filenumber, f.Code, f.Branch, f.Department , i.' +
        'FileType, i.FilingMethod,'
      #9'i.EntryDate,'
      #9'c.Name AS "CompanyName",'
      #9'b.Name AS "BranchName",'
      #9'd.Name AS "DeptName",'
      '  dbo.ap_GetCoversheetBacode(i.Itemnumber, 1) AS BarcodedInfo'
      'FROM'
      '  Items i'
      #9'INNER JOIN files f ON  i.Filenumber = f.Filenumber'
      '  INNER JOIN Company c ON f.Code = c.CompanyCode'
      
        '  INNER JOIN Branches b ON f.Branch = b.Branch AND f.Code = b.Co' +
        'de'
      
        '  INNER JOIN Departments d ON f.Branch = d.Branch AND f.Departme' +
        'nt = d.Department AND f.Code = d.Code'
      '  INNER JOIN IndexDefinitions ft ON i.FileType = ft.Description'
      'WHERE'
      '  i.Itemnumber = :mItem')
    Left = 304
    Top = 48
  end
  object qry_repRecordDetail: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'mItem'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE'
      '    @FileType varchar(50),'
      #9#9'@Itemnumber varchar(20),'
      #9#9'@Filenumber varchar(20),'
      #9#9'@SQLText nvarchar(1000),'
      #9#9'@Text1 varchar(50),'
      #9#9'@Text2 varchar(50),'
      #9#9'@Text3 varchar(50),'
      #9#9'@Text4 varchar(50),'
      #9#9'@Text5 varchar(50),'
      #9#9'@Text6 varchar(50),'
      #9#9'@Text7 varchar(50),'
      #9#9'@Text8 varchar(50),'
      #9#9'@Text9 varchar(50),'
      #9#9'@Text10 varchar(50),'
      #9#9'@Date1 varchar(50),'
      #9#9'@Date2 varchar(50),'
      #9#9'@Date3 varchar(50),'
      #9#9'@Number1 varchar(50),'
      #9#9'@Number2 varchar(50),'
      #9#9'@Col1 varchar(50),'
      #9#9'@Col2 varchar(50),'
      #9#9'@Col3 varchar(50),'
      #9#9'@Col4 varchar(50),'
      #9#9'@Col5 varchar(50),'
      #9#9'@Col6 varchar(50),'
      #9#9'@Col7 varchar(50),'
      #9#9'@Col8 varchar(50),'
      #9#9'@Col9 varchar(50),'
      #9#9'@Col10 varchar(50),'
      #9#9'@Col11 varchar(50),'
      #9#9'@Col12 varchar(50),'
      #9#9'@Col13 varchar(50),'
      #9#9'@Col14 varchar(50),'
      #9#9'@Col15 varchar(50)'
      ''
      'DECLARE @Output TABLE('
      #9'sHead varchar(50) NULL,'
      #9'sDet varchar(50) NULL)'
      '------'
      'SET @Itemnumber = :mItem'
      '------'
      'SELECT '
      #9'@Text1 = RTRIM(ISNULL(Text1, '#39#39')),'
      #9'@Text2 = RTRIM(ISNULL(Text2, '#39#39')),'
      #9'@Text3 = RTRIM(ISNULL(Text3, '#39#39')),'
      #9'@Text4 = RTRIM(ISNULL(Text4, '#39#39')),'
      #9'@Text5 = RTRIM(ISNULL(Text5, '#39#39')),'
      #9'@Text6 = RTRIM(ISNULL(Text6, '#39#39')),'
      #9'@Text7 = RTRIM(ISNULL(Text7, '#39#39')),'
      #9'@Text8 = RTRIM(ISNULL(Text8, '#39#39')),'
      #9'@Text9 = RTRIM(ISNULL(Text9, '#39#39')),'
      #9'@Text10 = RTRIM(ISNULL(Text10, '#39#39')),'
      #9'@Date1 = RTRIM(ISNULL(CONVERT(varchar, Date1, 103), '#39#39')),'
      #9'@Date2 = RTRIM(ISNULL(CONVERT(varchar, Date2, 103), '#39#39')),'
      #9'@Date3 = RTRIM(ISNULL(CONVERT(varchar, Date3, 103), '#39#39')),'
      #9'@Number1 = RTRIM(ISNULL(CONVERT(varchar, Number1), '#39#39')),'
      #9'@Number2 = RTRIM(ISNULL(CONVERT(varchar, Number2), '#39#39')),'
      #9'@FileType = FileType'
      'FROM '
      #9'Items'
      'WHERE'
      #9'Itemnumber = @Itemnumber'
      '------'
      'SELECT '
      #9'@Col1 = RTRIM(ISNULL(Col1, '#39#39')),'
      #9'@Col2 = RTRIM(ISNULL(Col2, '#39#39')),'
      #9'@Col3 = RTRIM(ISNULL(Col3, '#39#39')),'
      #9'@Col4 = RTRIM(ISNULL(Col4, '#39#39')),'
      #9'@Col5 = RTRIM(ISNULL(Col5, '#39#39')),'
      #9'@Col6 = RTRIM(ISNULL(Col6, '#39#39')),'
      #9'@Col7 = RTRIM(ISNULL(Col7, '#39#39')),'
      #9'@Col8 = RTRIM(ISNULL(Col8, '#39#39')),'
      #9'@Col9 = RTRIM(ISNULL(Col9, '#39#39')),'
      #9'@Col10 = RTRIM(ISNULL(Col10, '#39#39')),'
      #9'@Col11 = RTRIM(ISNULL(Col11, '#39#39')),'
      #9'@Col12 = RTRIM(ISNULL(Col12, '#39#39')),'
      #9'@Col13 = RTRIM(ISNULL(Col13, '#39#39')),'
      #9'@Col14 = RTRIM(ISNULL(Col14, '#39#39')),'
      #9'@Col15 = RTRIM(ISNULL(Col15, '#39#39'))'
      'FROM'
      #9'IndexDefinitions'
      'WHERE'
      #9'Description = @FileType'
      '---------------'
      'SET @SQLText = '#39#39
      '---------------'
      'IF @Col1 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col1, @Text1'
      'IF @Col2 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col2, @Text2'
      'IF @Col3 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col3, @Text3'
      'IF @Col4 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col4, @Text4'
      'IF @Col5 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col5, @Text5'
      'IF @Col6 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col6, @Text6'
      'IF @Col7 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col7, @Text7'
      'IF @Col8 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col8, @Text8'
      'IF @Col9 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col9, @Text9'
      'IF @Col10 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col10, @Text10'
      'IF @Col11 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col11, @Date1'
      'IF @Col12 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col12, @Date2'
      'IF @Col13 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col13, @Date3'
      'IF @Col14 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col14, @Number1'
      'IF @Col15 <> '#39#39
      #9'INSERT INTO @Output SELECT @Col15, @Number2'
      ''
      ''
      'SELECT * FROM @Output')
    Left = 272
    Top = 48
  end
  object qry_Transa: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 336
    Top = 48
  end
  object qry_Action: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 368
    Top = 48
  end
end
