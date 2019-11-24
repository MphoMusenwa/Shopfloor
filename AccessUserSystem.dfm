object frm_AccessUserSystem: Tfrm_AccessUserSystem
  Left = 0
  Top = 0
  Caption = 'User System Access'
  ClientHeight = 582
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_User: TLabel
    Left = 22
    Top = 40
    Width = 64
    Height = 13
    Caption = 'System User:'
  end
  object lbl_UserID: TLabel
    Left = 92
    Top = 40
    Width = 75
    Height = 13
    Caption = 'System User:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 66
    Width = 537
    Height = 10
    Shape = bsTopLine
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 553
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btn_Select: TBitBtn
      Left = 8
      Top = 0
      Width = 75
      Height = 22
      Caption = 'Save'
      Default = True
      TabOrder = 0
      OnClick = btn_SelectClick
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
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object btn_Cancel: TBitBtn
      Left = 91
      Top = 0
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
  end
  object GroupBox1: TGroupBox
    Left = 22
    Top = 77
    Width = 505
    Height = 492
    Hint = 'Tick each menu item the user will be allowed to access'
    Caption = 'System Access Rights'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    object grp_Gen: TGroupBox
      Left = 2
      Top = 15
      Width = 501
      Height = 73
      Align = alTop
      Caption = 'General Administration'
      TabOrder = 0
      object chk_Register: TCheckBox
        Tag = 1
        Left = 8
        Top = 16
        Width = 201
        Height = 17
        Hint = 'Change Company Details && Register Server'
        TabStop = False
        Caption = 'System Support'
        TabOrder = 0
      end
      object chk_Security: TCheckBox
        Tag = 4
        Left = 8
        Top = 33
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Security'
        TabOrder = 1
      end
      object chk_RecordTypes: TCheckBox
        Tag = 2
        Left = 168
        Top = 16
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Index Definitions'
        TabOrder = 2
      end
      object chk_RecordCat: TCheckBox
        Tag = 5
        Left = 168
        Top = 33
        Width = 136
        Height = 18
        TabStop = False
        Caption = 'Record Categories'
        TabOrder = 3
      end
      object chk_RetMatrix: TCheckBox
        Tag = 3
        Left = 314
        Top = 16
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Retention Matrix'
        TabOrder = 4
      end
      object chk_BulkImport: TCheckBox
        Tag = 6
        Left = 314
        Top = 35
        Width = 145
        Height = 14
        Hint = 'Bulk Import'
        HelpType = htKeyword
        TabStop = False
        Caption = 'Bulk Import'
        TabOrder = 5
      end
      object CheckBox4: TCheckBox
        Tag = 42
        Left = 8
        Top = 50
        Width = 154
        Height = 17
        TabStop = False
        Caption = 'Branches and Departments'
        TabOrder = 6
      end
      object chk_BulkImportPurge: TCheckBox
        Tag = 43
        Left = 314
        Top = 53
        Width = 145
        Height = 14
        Hint = 'Bulk Import'
        HelpType = htKeyword
        TabStop = False
        Caption = 'Bulk Import Purge'
        TabOrder = 7
      end
      object CheckBox10: TCheckBox
        Tag = 53
        Left = 168
        Top = 50
        Width = 108
        Height = 17
        TabStop = False
        Caption = 'Actions'
        TabOrder = 8
      end
    end
    object grp_eRec: TGroupBox
      Left = 2
      Top = 88
      Width = 501
      Height = 72
      Align = alTop
      Caption = 'eRecord Manager'
      TabOrder = 1
      object chk_eRecords: TCheckBox
        Tag = 7
        Left = 8
        Top = 16
        Width = 198
        Height = 17
        Hint = 'Receiving'
        HelpType = htKeyword
        TabStop = False
        Caption = 'eRecords'
        TabOrder = 0
      end
      object chk_ePending: TCheckBox
        Tag = 12
        Left = 317
        Top = 34
        Width = 150
        Height = 14
        Hint = 'ePending'
        HelpType = htKeyword
        TabStop = False
        Caption = 'ePending'
        TabOrder = 1
      end
      object chk_ImageClerk: TCheckBox
        Tag = 11
        Left = 163
        Top = 34
        Width = 126
        Height = 17
        Hint = 'Image Clerk'
        HelpType = htKeyword
        TabStop = False
        Caption = 'Image Clerk/Centre'
        TabOrder = 2
      end
      object chk_DeleteeRec: TCheckBox
        Tag = 9
        Left = 316
        Top = 16
        Width = 117
        Height = 17
        TabStop = False
        Caption = 'Delete eRecords'
        TabOrder = 3
      end
      object chk_eRecDataMan: TCheckBox
        Tag = 10
        Left = 8
        Top = 34
        Width = 142
        Height = 17
        Hint = 'Image Clerk'
        HelpType = htKeyword
        TabStop = False
        Caption = 'eRecords Data Manager'
        TabOrder = 4
      end
      object chk_BulkCapture: TCheckBox
        Tag = 41
        Left = 8
        Top = 51
        Width = 120
        Height = 17
        Hint = 'Bulk Capture'
        HelpType = htKeyword
        TabStop = False
        Caption = 'Bulk-Capture'
        TabOrder = 5
      end
      object chk_BulkExport: TCheckBox
        Tag = 47
        Left = 163
        Top = 51
        Width = 120
        Height = 17
        Hint = 'Bulk Capture'
        HelpType = htKeyword
        TabStop = False
        Caption = 'Bulk-Export'
        TabOrder = 6
      end
      object chk_LauncheRecords: TCheckBox
        Tag = 8
        Left = 163
        Top = 16
        Width = 142
        Height = 17
        HelpType = htKeyword
        TabStop = False
        Caption = 'Launch/eMail eRecords'
        TabOrder = 7
      end
      object CheckBox7: TCheckBox
        Tag = 50
        Left = 316
        Top = 51
        Width = 120
        Height = 17
        HelpType = htKeyword
        TabStop = False
        Caption = 'Forwarding'
        TabOrder = 8
      end
    end
    object grp_Doc: TGroupBox
      Left = 2
      Top = 199
      Width = 501
      Height = 175
      Align = alTop
      Caption = 'Document Manager'
      TabOrder = 2
      object chk_DataCapture: TCheckBox
        Tag = 13
        Left = 8
        Top = 16
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Processing'
        TabOrder = 0
      end
      object chk_Filing: TCheckBox
        Tag = 16
        Left = 8
        Top = 32
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Filing'
        TabOrder = 1
      end
      object chk_DCDelete: TCheckBox
        Tag = 19
        Left = 8
        Top = 49
        Width = 129
        Height = 17
        Hint = 'MetroRep'
        TabStop = False
        Caption = 'Data Capture Deleting'
        TabOrder = 2
      end
      object chk_FileDef: TCheckBox
        Tag = 22
        Left = 8
        Top = 66
        Width = 120
        Height = 17
        TabStop = False
        Caption = 'File Area Definitions'
        TabOrder = 3
      end
      object chk_Delivery: TCheckBox
        Tag = 25
        Left = 8
        Top = 83
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Delivery Types'
        TabOrder = 4
      end
      object chk_Requester: TCheckBox
        Tag = 28
        Left = 8
        Top = 100
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Requesters'
        TabOrder = 5
      end
      object chk_Requisition: TCheckBox
        Tag = 14
        Left = 163
        Top = 16
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Requisitions'
        TabOrder = 6
      end
      object chk_Rec: TCheckBox
        Tag = 17
        Left = 163
        Top = 32
        Width = 140
        Height = 17
        Hint = 'Receiving'
        TabStop = False
        Caption = 'Receiving'
        TabOrder = 7
      end
      object chk_DCInUse: TCheckBox
        Tag = 20
        Left = 163
        Top = 49
        Width = 140
        Height = 17
        Hint = 'Receiving'
        TabStop = False
        Caption = 'DataCapture InUse Flag'
        TabOrder = 8
      end
      object chk_FilePos: TCheckBox
        Tag = 23
        Left = 163
        Top = 66
        Width = 113
        Height = 17
        TabStop = False
        Caption = 'File Area Positions'
        TabOrder = 9
      end
      object chk_ContTypes: TCheckBox
        Tag = 26
        Left = 163
        Top = 83
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Container Types'
        TabOrder = 10
      end
      object chk_Reports: TCheckBox
        Tag = 29
        Left = 163
        Top = 100
        Width = 78
        Height = 17
        Hint = 'MetroRep'
        TabStop = False
        Caption = 'Reports'
        TabOrder = 11
      end
      object chk_ReqClerk: TCheckBox
        Tag = 15
        Left = 316
        Top = 16
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Retrievals'
        TabOrder = 12
      end
      object chk_TransView: TCheckBox
        Tag = 18
        Left = 316
        Top = 32
        Width = 173
        Height = 17
        TabStop = False
        Caption = 'Transaction Viewer/Movement'
        TabOrder = 13
      end
      object chk_PickSlipDel: TCheckBox
        Tag = 21
        Left = 316
        Top = 49
        Width = 145
        Height = 17
        Hint = 'MetroRep'
        TabStop = False
        Caption = 'Picking Slips Deleting'
        TabOrder = 14
      end
      object chk_ItemDefs: TCheckBox
        Tag = 24
        Left = 316
        Top = 66
        Width = 148
        Height = 17
        Hint = 'Receiving'
        TabStop = False
        Caption = 'Item Definitions'
        TabOrder = 15
      end
      object chk_LocViewing: TCheckBox
        Tag = 27
        Left = 316
        Top = 83
        Width = 146
        Height = 17
        Hint = 'MetroRep'
        TabStop = False
        Caption = 'Location Viewing'
        TabOrder = 16
      end
      object chk_ExportOffSite: TCheckBox
        Tag = 30
        Left = 316
        Top = 100
        Width = 146
        Height = 17
        TabStop = False
        Caption = 'Export Off-Site'
        TabOrder = 17
      end
      object CheckBox3: TCheckBox
        Tag = 31
        Left = 8
        Top = 116
        Width = 142
        Height = 17
        TabStop = False
        Caption = 'Move Location Contents'
        TabOrder = 18
      end
      object chk_DataManager: TCheckBox
        Tag = 44
        Left = 163
        Top = 116
        Width = 142
        Height = 17
        TabStop = False
        Caption = 'Data Manager'
        TabOrder = 19
      end
      object CheckBox6: TCheckBox
        Tag = 46
        Left = 316
        Top = 116
        Width = 142
        Height = 17
        TabStop = False
        Caption = 'Proxy Locations'
        TabOrder = 20
      end
      object chkChangeBarcode: TCheckBox
        Tag = 48
        Left = 8
        Top = 132
        Width = 142
        Height = 17
        TabStop = False
        Caption = 'Change Barcode'
        TabOrder = 21
      end
      object CheckBox2: TCheckBox
        Tag = 49
        Left = 163
        Top = 131
        Width = 142
        Height = 17
        Hint = 'Add Requesters in Requisitions'
        TabStop = False
        Caption = 'Add Requester in Reqs'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 22
      end
      object CheckBox1: TCheckBox
        Tag = 36
        Left = 316
        Top = 132
        Width = 105
        Height = 17
        HelpType = htKeyword
        TabStop = False
        Caption = 'Manual Retrievals'
        TabOrder = 23
      end
      object CheckBox5: TCheckBox
        Tag = 45
        Left = 8
        Top = 149
        Width = 129
        Height = 17
        HelpType = htKeyword
        TabStop = False
        Caption = 'Web Proxy Requester'
        TabOrder = 24
      end
    end
    object grp_Web: TGroupBox
      Left = 2
      Top = 374
      Width = 501
      Height = 38
      Align = alTop
      Caption = 'Web Manager'
      TabOrder = 3
      object chk_MetrofileriRep: TCheckBox
        Tag = 38
        Left = 163
        Top = 16
        Width = 144
        Height = 17
        Hint = 'Receiving'
        TabStop = False
        Caption = 'MetroFiler web Reporting'
        TabOrder = 0
      end
      object chk_MetrotrackAccess: TCheckBox
        Tag = 37
        Left = 9
        Top = 16
        Width = 136
        Height = 17
        TabStop = False
        Caption = 'MetroFiler web Access'
        TabOrder = 1
      end
    end
    object grp_Ware: TGroupBox
      Left = 2
      Top = 412
      Width = 501
      Height = 39
      Align = alTop
      Caption = 'Warehouse Manager'
      TabOrder = 4
      object chk_3dContainers: TCheckBox
        Tag = 39
        Left = 8
        Top = 17
        Width = 182
        Height = 17
        TabStop = False
        Caption = '3D Record Types and Containers'
        TabOrder = 0
      end
      object chk_ChngeOffSiteRecordCont: TCheckBox
        Tag = 40
        Left = 195
        Top = 17
        Width = 198
        Height = 17
        Hint = 'Receiving'
        HelpType = htKeyword
        TabStop = False
        Caption = 'Change OffSite Record'#39's Container'
        TabOrder = 1
      end
    end
    object grp_COOL: TGroupBox
      Left = 2
      Top = 160
      Width = 501
      Height = 39
      Align = alTop
      Caption = 'COOL'
      TabOrder = 5
      object CheckBox8: TCheckBox
        Tag = 51
        Left = 8
        Top = 16
        Width = 198
        Height = 17
        Hint = 'Receiving'
        HelpType = htKeyword
        TabStop = False
        Caption = 'COOL'
        TabOrder = 0
      end
      object CheckBox9: TCheckBox
        Tag = 52
        Left = 163
        Top = 16
        Width = 142
        Height = 17
        HelpType = htKeyword
        TabStop = False
        Caption = 'Launch/eMail Docs'
        TabOrder = 1
      end
    end
  end
  object qry_AuthCodes: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    SQL.Strings = (
      'select * from branches where code = :CO order by Branch')
    Left = 249
    Top = 17
  end
  object qry_Access: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    SQL.Strings = (
      'select * from branches where code = :CO order by Branch')
    Left = 289
    Top = 17
  end
end
