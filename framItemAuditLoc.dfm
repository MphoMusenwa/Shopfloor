object framItemsAuditLoc: TframItemsAuditLoc
  Left = 0
  Top = 0
  Width = 739
  Height = 414
  TabOrder = 0
  TabStop = True
  object Label33: TLabel
    Left = 23
    Top = 59
    Width = 43
    Height = 13
    Caption = 'Location '
  end
  object Label77: TLabel
    Left = 18
    Top = 28
    Width = 50
    Height = 13
    Caption = 'Filing Area'
  end
  object lbl_AuditWHouse: TLabel
    Left = 149
    Top = 28
    Width = 125
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
  object GroupBox7: TGroupBox
    Left = 448
    Top = 88
    Width = 281
    Height = 308
    Caption = 'Transaction Results'
    TabOrder = 0
    object lst_ErrorsAud: TListBox
      Left = 8
      Top = 43
      Width = 263
      Height = 201
      ItemHeight = 13
      TabOrder = 0
    end
    object btn_PrintErrorAud: TBitBtn
      Left = 43
      Top = 274
      Width = 193
      Height = 25
      Caption = 'Print List'
      TabOrder = 1
      OnClick = btn_PrintErrorAudClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000830F0000830F00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A99B9B9B9B
        9B9B9B9B9B9B9B9B9B9B9B9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA6A8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF737373696969656563929391FFFFFFAF
        AFAFAFAFAFAFAFAFFFFFFF7B7B754F4F4F545454545454FF00FFFF00FF737373
        93979793979775777590918EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B755B5C
        5C787B7B606161545454FF00FF737373939797ADB5B56667665F5F5F77777777
        77777777777777777171715A5A586869697F8282707171545454FF00FF737373
        ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5A2A8A86AA4
        7708B518767878565757FF00FF737373D2D2D2988D91997C809A797BAA8186AA
        7F86AA7E86AD828AA77F859D7C7F8B7D7A5E9063787A7A575858FF00FF737373
        D2D2D2855A62956B6D8A6969896D6D876B6B866A6A886E6D8A706F8D6A699363
        6A9C6C819397975C5D5DFF00FF737373D2D2D26F4952583F415F4C4C74696972
        67677166667166667166665E424254393C8A72749397976C6D6DFF00FF737373
        ADB5B57E686A757272A6A8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9B6E5F
        61988989ADB5B56C6D6DFF00FFFF00FF7373738E81818F8485A6A8A9FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9B9B9B8473748F85856C6D6DFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA6A8A9FFFFFFFFFFFFFFFFFFA6A8A99B9B9B9B9B9BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A9FFFFFFFF
        FFFFFFFFFFA6A8A9FFFFFF9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA6A8A9FFFFFFFCFCFCFFFFFFA6A8A99B9B9BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A99B9B9B9B
        9B9B9B9B9B9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object btn_ClearErrorsAud: TBitBtn
      Left = 42
      Top = 247
      Width = 193
      Height = 25
      Caption = 'Clear List'
      Default = True
      ModalResult = 1
      TabOrder = 2
      OnClick = btn_ClearErrorsAudClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300001E0F00001E0F00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFB5948CA36625A36625A36625A36625A36625A3
        6625A36625FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543
        E59E69BD7B4ABD7B4ABD7B4ABD7B4ABD7B4AE59E69A36625FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFDF8543EEB78EBD7B4ABD7B4ABD7B4ABD7B4ABD
        7B4AEEB78EB57329A36625FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543
        EEB78EF0C2A0F0C2A0F0C2A0F0C2A0F0C2A0EEB78EB57329B57329A36625FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543E49961E49961E49961E49961E4
        9961E49961DF8543B57329B573294770B3FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFDF8543E49961E49961E49961E49961E49961E49961DF8543B573297B94
        C64770B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543E49961E49961E4
        9961E49961E49961E49961DF85437B94C67B94C64770B3FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF698BC395ADD49BB5D99BB5D99BB5D99BB5D995ADD47F9C
        CB7B94C64770B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF698BC395
        ADD49BB5D99BB5D99BB5D99BB5D995ADD47F9CCB4770B3FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF698BC395ADD49BB5D99BB5D99BB5D99BB5
        D995ADD44770B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF698BC3698BC3698BC3698BC3698BC3698BC3698BC3FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object GroupBox6: TGroupBox
    Left = 8
    Top = 88
    Width = 433
    Height = 308
    Caption = 'Import Items'
    TabOrder = 1
    object Label35: TLabel
      Left = 24
      Top = 25
      Width = 85
      Height = 16
      Caption = 'Import Items'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label42: TLabel
      Left = 194
      Top = 24
      Width = 96
      Height = 16
      Caption = 'Existing Items'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lst_BatchAud: TListBox
      Left = 14
      Top = 45
      Width = 155
      Height = 200
      ItemHeight = 13
      TabOrder = 0
    end
    object btn_ProcessAud: TBitBtn
      Left = 246
      Top = 247
      Width = 153
      Height = 25
      Caption = 'Update Location'
      TabOrder = 1
      OnClick = btn_ProcessAudClick
      Kind = bkOK
    end
    object btn_ClearAud: TBitBtn
      Left = 246
      Top = 274
      Width = 153
      Height = 25
      Caption = 'Clear List'
      Default = True
      ModalResult = 1
      TabOrder = 3
      OnClick = btn_ClearAudClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300001E0F00001E0F00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFB5948CA36625A36625A36625A36625A36625A3
        6625A36625FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543
        E59E69BD7B4ABD7B4ABD7B4ABD7B4ABD7B4AE59E69A36625FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFDF8543EEB78EBD7B4ABD7B4ABD7B4ABD7B4ABD
        7B4AEEB78EB57329A36625FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543
        EEB78EF0C2A0F0C2A0F0C2A0F0C2A0F0C2A0EEB78EB57329B57329A36625FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543E49961E49961E49961E49961E4
        9961E49961DF8543B57329B573294770B3FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFDF8543E49961E49961E49961E49961E49961E49961DF8543B573297B94
        C64770B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543E49961E49961E4
        9961E49961E49961E49961DF85437B94C67B94C64770B3FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF698BC395ADD49BB5D99BB5D99BB5D99BB5D995ADD47F9C
        CB7B94C64770B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF698BC395
        ADD49BB5D99BB5D99BB5D99BB5D995ADD47F9CCB4770B3FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF698BC395ADD49BB5D99BB5D99BB5D99BB5
        D995ADD44770B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF698BC3698BC3698BC3698BC3698BC3698BC3698BC3FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object btn_LanchScannAud: TBitBtn
      Left = 14
      Top = 250
      Width = 163
      Height = 25
      Caption = 'Launch Scanner Software'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btn_LanchScannAudClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF63313163313163313163313163313163313163313163
        3131FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD68400FFFFDE
        FFE7B5FF9C00D68400CE6300CE6300633131A24F22A24F22A24F22A24F22A24F
        22A24F22A24F22A24F22FF00FFD68400D68400D68400D68400D68400633131DE
        9C84E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7A24F22FF00FFD68400
        FFFFFF6331316331319C9C9C633131DE9C84E7E7E7EFBD7BEFBD7BEFEFEEC9C9
        C9C9C9C9E7E7E7A24F22FF00FFD68400FFFFFFFF9C00D684009C9C9C633131DE
        9C84E7E7E7F7D6B5DE9C39F3F3F2EFEFEEEBEBEAE7E7E7A24F22FF00FFFF00FF
        D68400E7E7E7C6C6C6633131D6C6BDDE9C84E7E7E7EFBD7BEFBD7BF7F7F6C9C9
        C9C9C9C9E7E7E7A24F22FF00FFFF00FFC9762BD68400633131FEFEFDF7E7DEDE
        9C84E7E7E7F7D6B5DE9C39FAFAF9F7F7F6F3F3F2E7E7E7A24F22FF00FFFF00FF
        D68400E7E7E7633131633131D6C6BDDE9C84E7E7E7EFBD7BEFBD7BFEFEFDC9C9
        C9C9C9C9E7E7E7A24F22FF00FFD68400FFFFFFFF9C006331319C9C9C633131DE
        9C84E7E7E7F7D6B5DE9C39FEFEFDFEFEFDFCFCFBE7E7E7A24F22FF00FFD68400
        FFFFFFE7E7E7C6C6C69C9C9C633131DE9C84E7E7E7EFBD7BEFBD7BFEFEFDC9C9
        C9C9C9C9E7E7E7A24F22FF00FF633131633131633131633131633131633131DE
        9C84E7E7E7F7D6B5DE9C39FEFEFDFEFEFDFEFEFDE7E7E7A24F22D68400FFFFDE
        FFE7B5FF9C00D68400CE6300CE6300633131E7E7E7E7E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7A24F22D68400D68400D68400D68400D68400D68400D6840063
        3131D06F01D06F01D06F01D06F01D06F01D06F01D06F01A24F22FF00FFFF00FF
        CE6300ED9733ED9733ED9733ED9733ED9733ED9733F6CA9AED9733F6CA9AED97
        33306DF97F7488CE6300FF00FFFF00FFFF00FFDA7B0DDA7B0DDA7B0DDA7B0DDA
        7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DFF00FF}
    end
    object lst_ExistingRecs: TListBox
      Left = 184
      Top = 45
      Width = 241
      Height = 200
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object edt_Location: TEdit
    Left = 88
    Top = 55
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btn_RefreshRecords: TBitBtn
    Left = 218
    Top = 42
    Width = 129
    Height = 25
    Caption = 'Audit Location'
    TabOrder = 3
    OnClick = btn_RefreshRecordsClick
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
  object btn_ClearLocation: TBitBtn
    Left = 352
    Top = 42
    Width = 129
    Height = 25
    Caption = 'Clear Location'
    TabOrder = 4
    OnClick = btn_ClearLocationClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      180000000000000300001E0F00001E0F00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFB5948CA36625A36625A36625A36625A36625A3
      6625A36625FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543
      E59E69BD7B4ABD7B4ABD7B4ABD7B4ABD7B4AE59E69A36625FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFDF8543EEB78EBD7B4ABD7B4ABD7B4ABD7B4ABD
      7B4AEEB78EB57329A36625FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543
      EEB78EF0C2A0F0C2A0F0C2A0F0C2A0F0C2A0EEB78EB57329B57329A36625FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543E49961E49961E49961E49961E4
      9961E49961DF8543B57329B573294770B3FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFDF8543E49961E49961E49961E49961E49961E49961DF8543B573297B94
      C64770B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543E49961E49961E4
      9961E49961E49961E49961DF85437B94C67B94C64770B3FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF698BC395ADD49BB5D99BB5D99BB5D99BB5D995ADD47F9C
      CB7B94C64770B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF698BC395
      ADD49BB5D99BB5D99BB5D99BB5D995ADD47F9CCB4770B3FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF698BC395ADD49BB5D99BB5D99BB5D99BB5
      D995ADD44770B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF698BC3698BC3698BC3698BC3698BC3698BC3698BC3FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object edt_AuditWHouse: TEdit
    Left = 89
    Top = 26
    Width = 36
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object btn_AuditWHouse: TButton
    Left = 126
    Top = 26
    Width = 19
    Height = 14
    Hint = 'Select Filing Area'
    Caption = '>>'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btn_AuditWHouseClick
  end
  object qry_Location: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 509
    Top = 12
  end
  object qry_ItemsFind: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    SQL.Strings = (
      'select * from files where filenumber = :mfile and code = :cc')
    Left = 544
    Top = 16
  end
  object Qry_Items: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    SQL.Strings = (
      'select filenumber,recordno,LocNo,Issuestatus'
      'from files'
      'where locno = :locno'
      'and warehouse = :mware'
      'and Code = :CC'
      'order by recordno'
      ' '
      ' ')
    Left = 579
    Top = 14
  end
  object qry_SecureScan: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 656
    Top = 16
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'text|*.txt'
    Left = 692
    Top = 14
  end
  object PrintDialog: TPrintDialog
    Left = 692
    Top = 46
  end
  object qry_GenSQL: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 472
    Top = 24
  end
end