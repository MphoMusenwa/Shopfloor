object fram_AuditLocItems: Tfram_AuditLocItems
  Left = 0
  Top = 0
  Width = 882
  Height = 449
  TabOrder = 0
  TabStop = True
  object Splitter1: TSplitter
    Left = 249
    Top = 57
    Width = 6
    Height = 392
    Beveled = True
    ExplicitTop = 37
    ExplicitHeight = 412
  end
  object Splitter2: TSplitter
    Left = 513
    Top = 57
    Width = 6
    Height = 392
    Beveled = True
    ExplicitLeft = 257
    ExplicitTop = 37
    ExplicitHeight = 412
  end
  object Panel4: TPanel
    Left = 519
    Top = 57
    Width = 363
    Height = 392
    Align = alClient
    Caption = 'Panel4'
    TabOrder = 3
    DesignSize = (
      363
      392)
    object Label1: TLabel
      Left = 6
      Top = 6
      Width = 80
      Height = 16
      Caption = 'Differences'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lst_ErrorsAud: TListBox
      Left = 6
      Top = 26
      Width = 348
      Height = 295
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      ScrollWidth = 500
      TabOrder = 0
    end
    object btn_PrintErrorAud: TBitBtn
      Left = 20
      Top = 358
      Width = 193
      Height = 25
      Anchors = [akLeft, akBottom]
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
      Left = 19
      Top = 327
      Width = 193
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Clear List'
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
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 249
    Height = 392
    Align = alLeft
    TabOrder = 1
    DesignSize = (
      249
      392)
    object Label35: TLabel
      Left = 11
      Top = 6
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
    object lst_BatchAud: TListBox
      Left = 8
      Top = 26
      Width = 233
      Height = 295
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      ScrollWidth = 500
      TabOrder = 0
    end
    object btn_LanchScannAud: TBitBtn
      Left = 35
      Top = 327
      Width = 179
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Launch Scanner Software'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
    object btn_RefreshRecords: TBitBtn
      Left = 35
      Top = 358
      Width = 179
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Audit Location'
      TabOrder = 2
      OnClick = btn_RefreshRecordsClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000520B0000520B00000000000000000000FF00FF2173B5
        636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF2173B5218CEF2173B5636B73FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BDFF
        218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF31A5FF52BDFF218CEF2173B5636B73FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        31A5FF52BDFF218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BDFF218CEF5A6B73FF
        00FFD5B9B4D6ADA5D6ADA5D6ADA5D5B9B4FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF31A5FF31A5FF4A4239B69B8BF0E2C0F0DBACF0D6A7FEF4CCECD8
        C2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBB9F88F3
        E3B6FCF3D1EACD9DDEB27EFEF9D0FDF7D2F5E6C2D6ADA5FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFD5B9B4EFE1B5FAEDBDFFF1C1F0D5A1FEF4C3FFF7C5FFFA
        C7FDF8D2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5EFE3B6FB
        ECBEFDEFBFD69F65ECCC98FFF4C4FFF7C5FFF9C7EEE2BBD6ADA5FF00FFFF00FF
        FF00FFFF00FFFF00FFD6ADA5EDE1B4F6E9BEFCF1D3F9EAC2CE8E52E1B47CFFF4
        C3FFF6C5F6E9C2CBAF9CFF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5EBDEB2F2
        E6BBDBAC81F7E7C5D9A46DBC6929FFF2C2FEF2C2EFE1BBD2B3A3FF00FFFF00FF
        FF00FFFF00FFFF00FFD5B9B4E4D8B0EDE1B6CA8A4FB65E1CB75F1EC88447FAEC
        BDF5E9BAD6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5EA
        DFBCE4CEA1DCB885DEBA87EAD4A4EFE3B5F5E7BCD5B9B4FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5E0D4B5EADEB4EBDEB1E8DBB1D6AD
        A5D5B9B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFD5B9B4D6ADA5D6ADA5D9B7A3FF00FFFF00FFFF00FFFF00FF}
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 882
    Height = 57
    Align = alTop
    TabOrder = 0
    DesignSize = (
      882
      57)
    object Label33: TLabel
      Left = 537
      Top = 11
      Width = 43
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Location '
    end
    object Label77: TLabel
      Left = 33
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
    object Label31: TLabel
      Left = 3
      Top = 6
      Width = 80
      Height = 13
      Caption = 'Type of Location'
    end
    object edt_Location: TEdit
      Left = 585
      Top = 8
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    object btn_ClearLocation: TBitBtn
      Left = 707
      Top = 5
      Width = 129
      Height = 25
      Anchors = [akTop, akRight]
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
      TabOrder = 1
      OnChange = edt_AuditWHouseChange
      OnKeyDown = edt_AuditWHouseKeyDown
    end
    object btn_AuditWHouse: TButton
      Left = 126
      Top = 26
      Width = 19
      Height = 20
      Hint = 'Select Filing Area'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btn_AuditWHouseClick
    end
    object cb_LocSize: TComboBox
      Left = 89
      Top = 3
      Width = 112
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        '6 Digit Loc'
        '7 Digit Loc')
    end
  end
  object Panel3: TPanel
    Left = 255
    Top = 57
    Width = 258
    Height = 392
    Align = alLeft
    TabOrder = 2
    DesignSize = (
      258
      392)
    object Label42: TLabel
      Left = 6
      Top = 6
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
    object btn_ProcessAud: TBitBtn
      Left = 49
      Top = 327
      Width = 153
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Update Location'
      Enabled = False
      TabOrder = 0
      OnClick = btn_ProcessAudClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
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
    object btn_ClearAud: TBitBtn
      Left = 49
      Top = 358
      Width = 153
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Clear List'
      TabOrder = 1
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
    object lst_ExistingRecs: TListBox
      Left = 6
      Top = 26
      Width = 241
      Height = 295
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      ScrollWidth = 500
      TabOrder = 2
    end
  end
  object qry_SQL: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    CommandTimeout = 36000
    Parameters = <>
    Left = 536
    Top = 176
  end
  object qry_SecureScan: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 566
    Top = 176
  end
  object PrintDialog: TPrintDialog
    Left = 626
    Top = 176
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'text|*.txt'
    Left = 596
    Top = 176
  end
  object qry_Items: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 536
    Top = 207
  end
  object qry_ItemsFind: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 566
    Top = 207
  end
  object qry_Location: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 596
    Top = 207
  end
end
