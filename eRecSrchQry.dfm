object frm_SearcheRecordsCross: Tfrm_SearcheRecordsCross
  Left = 261
  Top = 192
  Caption = 'Cross Query Search'
  ClientHeight = 281
  ClientWidth = 690
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 17
    Width = 665
    Height = 57
    Caption = 'Type Your Query String Here'
    TabOrder = 0
    DesignSize = (
      665
      57)
    object edt_QueryStr: TEdit
      Left = 10
      Top = 22
      Width = 641
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 17
    Top = 77
    Width = 665
    Height = 161
    Caption = 'Would You Like To Limit Your Search'
    TabOrder = 1
    object Label4: TLabel
      Left = 66
      Top = 64
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Branch :'
    end
    object Label5: TLabel
      Left = 45
      Top = 88
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Department :'
    end
    object Label6: TLabel
      Left = 38
      Top = 112
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Record Type :'
    end
    object lbl_RecordCat: TLabel
      Left = 20
      Top = 136
      Width = 86
      Height = 13
      Alignment = taRightJustify
      Caption = 'Record Category :'
    end
    object Shape1: TShape
      Left = 110
      Top = 60
      Width = 1
      Height = 96
    end
    object Shape3: TShape
      Left = 152
      Top = 60
      Width = 1
      Height = 96
    end
    object Shape5: TShape
      Left = 297
      Top = 61
      Width = 1
      Height = 96
    end
    object Shape7: TShape
      Left = 239
      Top = 61
      Width = 1
      Height = 96
    end
    object Label1: TLabel
      Left = 26
      Top = 20
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
      Left = 103
      Top = 20
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
      Left = 310
      Top = 20
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
      Left = 241
      Top = 20
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
      Left = 174
      Top = 20
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
    object lbl_Branch: TLabel
      Left = 374
      Top = 64
      Width = 261
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
    object lbl_Dept: TLabel
      Left = 374
      Top = 88
      Width = 261
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
    object edt_DeptGroup: TEdit
      Left = 117
      Top = 84
      Width = 29
      Height = 21
      TabOrder = 6
      OnChange = edt_BranchGroupChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_RecordTypeGroup: TEdit
      Left = 117
      Top = 108
      Width = 29
      Height = 21
      TabOrder = 12
      OnChange = edt_BranchGroupChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_RecordCatGroup: TEdit
      Left = 117
      Top = 132
      Width = 29
      Height = 21
      TabOrder = 18
      OnChange = edt_BranchGroupChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_BranchGroup: TEdit
      Left = 117
      Top = 60
      Width = 29
      Height = 21
      TabOrder = 0
      OnChange = edt_BranchGroupChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_Branch: TEdit
      Left = 311
      Top = 61
      Width = 41
      Height = 21
      ReadOnly = True
      TabOrder = 4
      OnChange = edt_BranchChange
      OnKeyDown = edt_BranchKeyDown
    end
    object btn_SelBranch: TButton
      Left = 352
      Top = 61
      Width = 19
      Height = 19
      Hint = 'Select Branch'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btn_SelBranchClick
    end
    object edt_Dept: TEdit
      Left = 311
      Top = 84
      Width = 41
      Height = 21
      ReadOnly = True
      TabOrder = 10
      OnChange = edt_DeptChange
      OnKeyDown = edt_DeptKeyDown
    end
    object btn_SelDept: TButton
      Left = 352
      Top = 84
      Width = 19
      Height = 19
      Hint = 'Select Department'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = btn_SelDeptClick
    end
    object edt_RecordType: TEdit
      Left = 311
      Top = 108
      Width = 321
      Height = 21
      ReadOnly = True
      TabOrder = 16
      OnChange = edt_RecordTypeChange
      OnKeyDown = edt_RecordTypeKeyDown
    end
    object btn_SelRType: TButton
      Left = 634
      Top = 110
      Width = 19
      Height = 19
      Hint = 'Select Record Type'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnClick = btn_SelRTypeClick
    end
    object cb_RecordCat: TComboBox
      Left = 311
      Top = 133
      Width = 321
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      Sorted = True
      TabOrder = 22
    end
    object chk_DeptCollapse: TCheckBox
      Left = 262
      Top = 84
      Width = 19
      Height = 21
      TabOrder = 9
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object chk_RecordTypeCollapse: TCheckBox
      Left = 262
      Top = 108
      Width = 19
      Height = 21
      TabOrder = 15
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object chk_RecordCatCollapse: TCheckBox
      Left = 262
      Top = 132
      Width = 19
      Height = 21
      TabOrder = 21
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object chk_BranchCollapse: TCheckBox
      Left = 262
      Top = 60
      Width = 19
      Height = 21
      TabOrder = 3
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_DeptSort: TEdit
      Left = 157
      Top = 84
      Width = 29
      Height = 21
      TabOrder = 7
      OnChange = edt_BranchSortChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_RecordTypeSort: TEdit
      Left = 157
      Top = 108
      Width = 29
      Height = 21
      TabOrder = 13
      OnChange = edt_BranchSortChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_RecordCatSort: TEdit
      Left = 157
      Top = 132
      Width = 29
      Height = 21
      TabOrder = 19
      OnChange = edt_BranchSortChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object edt_BranchSort: TEdit
      Left = 157
      Top = 60
      Width = 29
      Height = 21
      TabOrder = 1
      OnChange = edt_BranchSortChange
      OnKeyPress = edt_BranchGroupKeyPress
    end
    object cb_BranchSortOpt: TComboBox
      Left = 186
      Top = 60
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
      Left = 186
      Top = 84
      Width = 50
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 8
      Text = 'Asc'
      Items.Strings = (
        'Asc'
        'Desc')
    end
    object cb_RecordTypeSortOpt: TComboBox
      Left = 186
      Top = 108
      Width = 50
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 14
      Text = 'Asc'
      Items.Strings = (
        'Asc'
        'Desc')
    end
    object cb_RecordCatSortOpt: TComboBox
      Left = 186
      Top = 132
      Width = 50
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 20
      Text = 'Asc'
      Items.Strings = (
        'Asc'
        'Desc')
    end
  end
  object btn_OK: TButton
    Left = 222
    Top = 247
    Width = 75
    Height = 25
    Caption = '&Search'
    Default = True
    TabOrder = 2
    OnClick = btn_OKClick
  end
  object btn_Cancel: TButton
    Left = 302
    Top = 247
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btn_CancelClick
  end
  object btn_Clear: TButton
    Left = 382
    Top = 247
    Width = 75
    Height = 25
    Caption = 'Cl&ear'
    TabOrder = 4
    OnClick = btn_ClearClick
  end
  object btn_Help: TButton
    Left = 462
    Top = 247
    Width = 75
    Height = 25
    Caption = '&Help'
    TabOrder = 5
  end
  object chk_Partial: TCheckBox
    Left = 553
    Top = 251
    Width = 125
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Use Partial Searching'
    TabOrder = 6
  end
  object qry_RecordType: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 448
    Top = 64
  end
  object qry_RecCat: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 480
    Top = 64
  end
end
