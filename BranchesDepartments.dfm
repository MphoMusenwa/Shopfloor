object frm_BranchesDepartments: Tfrm_BranchesDepartments
  Left = 0
  Top = 0
  Caption = 'Branches and Departments'
  ClientHeight = 712
  ClientWidth = 916
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_Top: TPanel
    Left = 0
    Top = 0
    Width = 916
    Height = 33
    HelpContext = 11
    Align = alTop
    TabOrder = 0
    object btn_Close: TSpeedButton
      Left = 5
      Top = 6
      Width = 73
      Height = 23
      Caption = 'Close'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000320B0000320B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF096EB0096EB0086098FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF096EB0096EB01479B814
        79B8086098FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        096EB0096EB01680BF157DBC147AB91479B8086098394A6B394A6B394A6B394A
        6B394A6B394A6BFF00FFFF00FFFF00FF096EB01886C41783C11680BF157DBC14
        7CBA0860983D5B81085A8E085A8E085A8E085A8E394A6BFF00FFFF00FFFF00FF
        096EB01989C71886C41783C11680BF157FBD0860980F49340F47320F46320F45
        31104531394A6BFF00FFFF00FFFF00FF096EB01A8CCA1989C71886C41783C116
        82C0086098164D38164A36154935164633154431394A6BFF00FFFF00FFFF00FF
        096EB01B90CD1A8CCA1989C71886C41785C30860981C7A5B1C7C5E1D7D601E78
        5B1E7257394A6BFF00FFFF00FFFF00FF096EB01B93CF1B90CD22A6E221A2DE18
        88C60860981F83601E79581E6E4F1D6245205E43394A6BFF00FFFF00FFFF00FF
        096EB01C96D21B93CF22A6E2FFFFFF198BC80860985A7662798370959484AF9C
        8ABB9887394A6BFF00FFFF00FFFF00FF096EB01E9AD61C96D21B93CF1B91CE1A
        8ECB086098F0BAA4F0B297F1BFA8F0BFA8F1BFA9394A6BFF00FFFF00FFFF00FF
        096EB01F9EDA1E9AD61C96D21C94D11B91CE086098F0B79EF2BFA9F4E0D7F2C6
        AEF1A581394A6BFF00FFFF00FFFF00FF096EB021A2DE1F9EDA1E9AD61D98D41C
        94D1086098EE7B45F0A27DF1A986EF7D45F08956394A6BFF00FFFF00FFFF00FF
        096EB022A6E221A2DE1F9EDA1E9CD81D98D4086098ED733BEC6F34EB6F33EC6E
        32EE8655394A6BFF00FFFF00FFFF00FF096EB0096EB022A6E221A2DE20A0DC1E
        9CD8086098E96F3CE65F24E76731EE9D7BED946D394A6BFF00FFFF00FFFF00FF
        FF00FFFF00FF096EB0096EB021A4E020A0DC086098394A6B394A6B394A6B394A
        6B394A6B394A6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF096EB009
        6EB0086098FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Transparent = False
      OnClick = btn_CloseClick
    end
    object nav: TDBNavigator
      Left = 87
      Top = 6
      Width = 234
      Height = 23
      HelpContext = 11
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Flat = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = navClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 33
    Width = 916
    Height = 679
    ActivePage = TabSheet1
    Align = alClient
    HotTrack = True
    Style = tsFlatButtons
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Branches'
      object Splitter3: TSplitter
        Left = 289
        Top = 0
        Width = 8
        Height = 648
        Beveled = True
        ExplicitLeft = 0
        ExplicitTop = -61
        ExplicitHeight = 579
      end
      object grd_Branches: TDBGrid
        Left = 0
        Top = 0
        Width = 289
        Height = 648
        Align = alLeft
        DataSource = dts_Branches
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
            FieldName = 'Branch'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Name'
            Visible = True
          end>
      end
      object ScrollBox1: TScrollBox
        Left = 297
        Top = 0
        Width = 611
        Height = 648
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 1
        object Label4: TLabel
          Left = 24
          Top = 16
          Width = 65
          Height = 13
          Caption = 'Branch Code:'
        end
        object Label5: TLabel
          Left = 58
          Top = 38
          Width = 31
          Height = 13
          Caption = 'Name:'
        end
        object Label6: TLabel
          Left = 7
          Top = 63
          Width = 85
          Height = 13
          Caption = 'Delivery Address:'
        end
        object Label7: TLabel
          Left = 49
          Top = 202
          Width = 42
          Height = 13
          Caption = 'Contact:'
        end
        object Label8: TLabel
          Left = 35
          Top = 154
          Width = 54
          Height = 13
          Caption = 'Telephone:'
        end
        object Label9: TLabel
          Left = 69
          Top = 178
          Width = 22
          Height = 13
          Caption = 'Fax:'
        end
        object Label2: TLabel
          Left = 33
          Top = 240
          Width = 56
          Height = 26
          Alignment = taRightJustify
          Caption = 'Alternative Code:'
          WordWrap = True
        end
        object editBranchCode: TDBEdit
          Left = 98
          Top = 13
          Width = 121
          Height = 21
          DataField = 'Branch'
          DataSource = dts_Branches
          TabOrder = 0
        end
        object editBranchName: TDBEdit
          Left = 98
          Top = 36
          Width = 313
          Height = 21
          DataField = 'Name'
          DataSource = dts_Branches
          TabOrder = 1
        end
        object editBranchDelAddr: TDBMemo
          Left = 98
          Top = 60
          Width = 231
          Height = 89
          DataField = 'Delivery_Address'
          DataSource = dts_Branches
          ScrollBars = ssVertical
          TabOrder = 2
        end
        object editBranchCont: TDBEdit
          Left = 98
          Top = 199
          Width = 373
          Height = 21
          DataField = 'Contact'
          DataSource = dts_Branches
          TabOrder = 6
        end
        object editBranchTel: TDBEdit
          Left = 98
          Top = 151
          Width = 121
          Height = 21
          DataField = 'Telephone'
          DataSource = dts_Branches
          TabOrder = 3
        end
        object editBranchFax: TDBEdit
          Left = 98
          Top = 175
          Width = 121
          Height = 21
          DataField = 'Fax'
          DataSource = dts_Branches
          TabOrder = 4
        end
        object editBranchStatus: TDBCheckBox
          Left = 280
          Top = 173
          Width = 97
          Height = 17
          Caption = 'Do Not Use'
          DataField = 'Status'
          DataSource = dts_Branches
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBEdit3: TDBEdit
          Left = 98
          Top = 237
          Width = 121
          Height = 21
          DataField = 'AltMOPSCode'
          DataSource = dts_Branches
          TabOrder = 7
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Departments'
      ImageIndex = 1
      object Splitter4: TSplitter
        Left = 289
        Top = 0
        Width = 8
        Height = 648
        Beveled = True
        ExplicitHeight = 532
      end
      object grd_Dept: TDBGrid
        Left = 0
        Top = 0
        Width = 289
        Height = 648
        Align = alLeft
        DataSource = dts_Department
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
            FieldName = 'Department'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Name'
            Visible = True
          end>
      end
      object ScrollBox2: TScrollBox
        Left = 297
        Top = 0
        Width = 611
        Height = 648
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 1
        object lbl_DeptsDepartment: TLabel
          Left = 19
          Top = 19
          Width = 85
          Height = 13
          Caption = 'Department Code'
        end
        object lbl_DeptsDeliverAddr: TLabel
          Left = 23
          Top = 140
          Width = 81
          Height = 13
          Caption = 'Delivery Address'
        end
        object lbl_DeptsTel: TLabel
          Left = 51
          Top = 231
          Width = 50
          Height = 13
          Caption = 'Telephone'
        end
        object lbl_DeptsFax: TLabel
          Left = 85
          Top = 256
          Width = 18
          Height = 13
          Caption = 'Fax'
        end
        object lbl_DeptsContact: TLabel
          Left = 65
          Top = 64
          Width = 38
          Height = 13
          Caption = 'Contact'
        end
        object lbl_DeptsName: TLabel
          Left = 74
          Top = 42
          Width = 27
          Height = 13
          Caption = 'Name'
        end
        object Label3: TLabel
          Left = 45
          Top = 293
          Width = 56
          Height = 26
          Alignment = taRightJustify
          Caption = 'Alternative Code:'
          WordWrap = True
        end
        object edt_DeptsDepartment: TDBEdit
          Left = 110
          Top = 15
          Width = 57
          Height = 21
          HelpContext = 11
          DataField = 'DEPARTMENT'
          DataSource = dts_Department
          TabOrder = 0
        end
        object edt_DeptsTelephone: TDBEdit
          Left = 110
          Top = 227
          Width = 89
          Height = 21
          HelpContext = 11
          DataField = 'TELEPHONE'
          DataSource = dts_Department
          TabOrder = 4
        end
        object edt_DeptsFax: TDBEdit
          Left = 110
          Top = 251
          Width = 89
          Height = 21
          HelpContext = 11
          DataField = 'FAX'
          DataSource = dts_Department
          TabOrder = 5
        end
        object mem_DeptsContact: TDBMemo
          Left = 110
          Top = 61
          Width = 241
          Height = 73
          HelpContext = 11
          DataField = 'CONTACT'
          DataSource = dts_Department
          ScrollBars = ssVertical
          TabOrder = 2
          WordWrap = False
        end
        object mem_DeptsDeliveryAddress: TDBMemo
          Left = 110
          Top = 136
          Width = 241
          Height = 89
          HelpContext = 11
          DataField = 'DELIVERY_ADDRESS'
          DataSource = dts_Department
          ScrollBars = ssVertical
          TabOrder = 3
          WordWrap = False
        end
        object edt_DeptsName: TDBEdit
          Left = 110
          Top = 38
          Width = 313
          Height = 21
          HelpContext = 11
          DataField = 'NAME'
          DataSource = dts_Department
          TabOrder = 1
        end
        object chk_DeptsStatus: TDBCheckBox
          Left = 213
          Top = 253
          Width = 217
          Height = 17
          HelpContext = 11
          Caption = 'DO NOT USE - (Department Inactive)'
          DataField = 'Status'
          DataSource = dts_Department
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBEdit4: TDBEdit
          Left = 110
          Top = 290
          Width = 121
          Height = 21
          DataField = 'AltMOPSDept'
          DataSource = dts_Department
          TabOrder = 7
        end
      end
    end
  end
  object dts_Branches: TDataSource
    AutoEdit = False
    DataSet = qry_BranchMain
    Left = 367
    Top = 3
  end
  object qry_BranchMain: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    AfterInsert = qry_BranchMainAfterInsert
    Parameters = <>
    SQL.Strings = (
      'select * from branches where code = :CO order by Branch')
    Left = 335
    Top = 3
  end
  object qry_DeptMain: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    AfterInsert = qry_DeptMainAfterInsert
    Parameters = <>
    SQL.Strings = (
      
        'select * from departments where (Branch = :BrCode)and(Code = :CC' +
        'ode) order by Department')
    Left = 427
    Top = 1
  end
  object dts_Department: TDataSource
    AutoEdit = False
    DataSet = qry_DeptMain
    Left = 459
    Top = 1
  end
end
