object frm_COOLSearchSpecific: Tfrm_COOLSearchSpecific
  Left = 242
  Top = 48
  Caption = 'Specific Query Search'
  ClientHeight = 568
  ClientWidth = 760
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
  object Label1: TLabel
    Left = 115
    Top = 16
    Width = 65
    Height = 26
    Caption = 'Field Description'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 192
    Top = 16
    Width = 52
    Height = 26
    Alignment = taCenter
    Caption = 'Grouping Order'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 399
    Top = 16
    Width = 51
    Height = 26
    Caption = 'Field Contents'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label8: TLabel
    Left = 330
    Top = 16
    Width = 49
    Height = 26
    Alignment = taCenter
    Caption = 'Collapse Group'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label9: TLabel
    Left = 263
    Top = 16
    Width = 32
    Height = 26
    Alignment = taCenter
    Caption = 'Sort Order'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 40
    Top = 48
    Width = 712
    Height = 105
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label4: TLabel
      Left = 4
      Top = 8
      Width = 150
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Branch :'
    end
    object Label5: TLabel
      Left = 4
      Top = 32
      Width = 150
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Department :'
    end
    object Label6: TLabel
      Left = 4
      Top = 56
      Width = 150
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Record Type :'
    end
    object lbl_RecordCat: TLabel
      Left = 4
      Top = 80
      Width = 150
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Record Category :'
    end
    object Shape1: TShape
      Left = 158
      Top = 4
      Width = 1
      Height = 96
    end
    object Shape3: TShape
      Left = 200
      Top = 4
      Width = 1
      Height = 96
    end
    object Shape5: TShape
      Left = 345
      Top = 5
      Width = 1
      Height = 96
    end
    object Shape7: TShape
      Left = 287
      Top = 5
      Width = 1
      Height = 96
    end
    object edt_DeptGroup: TEdit
      Left = 165
      Top = 28
      Width = 29
      Height = 21
      TabOrder = 7
      OnChange = edt_BranchGroupChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_RecordTypeGroup: TEdit
      Left = 165
      Top = 52
      Width = 29
      Height = 21
      TabOrder = 14
      OnChange = edt_BranchGroupChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_RecordCatGroup: TEdit
      Left = 165
      Top = 76
      Width = 29
      Height = 21
      TabOrder = 20
      OnChange = edt_BranchGroupChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_BranchGroup: TEdit
      Left = 165
      Top = 4
      Width = 29
      Height = 21
      TabOrder = 0
      OnChange = edt_BranchGroupChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_Branch: TEdit
      Left = 359
      Top = 5
      Width = 41
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object btn_SelBranch: TButton
      Left = 682
      Top = 6
      Width = 19
      Height = 19
      Hint = 'Select Branch'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btn_SelBranchClick
    end
    object edt_BranchName: TEdit
      Left = 401
      Top = 5
      Width = 279
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
    object edt_Dept: TEdit
      Left = 359
      Top = 28
      Width = 41
      Height = 21
      ReadOnly = True
      TabOrder = 11
    end
    object edt_DeptName: TEdit
      Left = 401
      Top = 28
      Width = 279
      Height = 21
      ReadOnly = True
      TabOrder = 12
    end
    object btn_SelDept: TButton
      Left = 682
      Top = 30
      Width = 19
      Height = 19
      Hint = 'Select Department'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = btn_SelDeptClick
    end
    object edt_RecordType: TEdit
      Left = 359
      Top = 52
      Width = 321
      Height = 21
      ReadOnly = True
      TabOrder = 18
      OnChange = edt_RecordTypeChange
    end
    object btn_SelRType: TButton
      Left = 682
      Top = 54
      Width = 19
      Height = 19
      Hint = 'Select Record Type'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      OnClick = btn_SelRTypeClick
    end
    object cb_RecordCat: TComboBox
      Left = 359
      Top = 77
      Width = 321
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      Sorted = True
      TabOrder = 24
    end
    object chk_DeptCollapse: TCheckBox
      Left = 310
      Top = 28
      Width = 19
      Height = 21
      TabOrder = 10
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object chk_RecordTypeCollapse: TCheckBox
      Left = 310
      Top = 52
      Width = 19
      Height = 21
      TabOrder = 17
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object chk_RecordCatCollapse: TCheckBox
      Left = 310
      Top = 76
      Width = 19
      Height = 21
      TabOrder = 23
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object chk_BranchCollapse: TCheckBox
      Left = 310
      Top = 4
      Width = 19
      Height = 21
      TabOrder = 3
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_DeptSort: TEdit
      Left = 205
      Top = 28
      Width = 29
      Height = 21
      TabOrder = 8
      OnChange = edt_BranchSortChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_RecordTypeSort: TEdit
      Left = 205
      Top = 52
      Width = 29
      Height = 21
      TabOrder = 15
      OnChange = edt_BranchSortChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_RecordCatSort: TEdit
      Left = 205
      Top = 76
      Width = 29
      Height = 21
      TabOrder = 21
      OnChange = edt_BranchSortChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_BranchSort: TEdit
      Left = 205
      Top = 4
      Width = 29
      Height = 21
      TabOrder = 1
      OnChange = edt_BranchSortChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object cb_BranchSortOpt: TComboBox
      Left = 234
      Top = 4
      Width = 50
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'Asc'
      Items.Strings = (
        'Asc'
        'Desc')
    end
    object cb_DeptSortOpt: TComboBox
      Left = 234
      Top = 28
      Width = 50
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 9
      Text = 'Asc'
      Items.Strings = (
        'Asc'
        'Desc')
    end
    object cb_RecordTypeSortOpt: TComboBox
      Left = 234
      Top = 52
      Width = 50
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 16
      Text = 'Asc'
      Items.Strings = (
        'Asc'
        'Desc')
    end
    object cb_RecordCatSortOpt: TComboBox
      Left = 234
      Top = 76
      Width = 50
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 22
      Text = 'Asc'
      Items.Strings = (
        'Asc'
        'Desc')
    end
  end
  object btn_OK: TButton
    Left = 231
    Top = 521
    Width = 75
    Height = 25
    Caption = '&Search'
    Default = True
    TabOrder = 1
    OnClick = btn_OKClick
  end
  object btn_Cancel: TButton
    Left = 311
    Top = 521
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btn_CancelClick
  end
  object btn_Clear: TButton
    Left = 391
    Top = 521
    Width = 75
    Height = 25
    Caption = 'Cl&ear'
    TabOrder = 3
    OnClick = btn_ClearClick
  end
  object btn_Help: TButton
    Left = 471
    Top = 521
    Width = 75
    Height = 25
    Caption = '&Help'
    TabOrder = 4
  end
  object chk_Partial: TCheckBox
    Left = 569
    Top = 525
    Width = 125
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Use Partial Searching'
    TabOrder = 5
  end
  object sb_Details: TScrollBox
    Left = 40
    Top = 159
    Width = 712
    Height = 356
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 6
  end
  object qry_RecCat: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 16
    Top = 160
  end
  object qry_RecordType: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 16
    Top = 224
  end
  object qry_Lookup: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 16
    Top = 192
  end
end
