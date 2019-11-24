object fram_SelDepartment: Tfram_SelDepartment
  Left = 0
  Top = 0
  Width = 344
  Height = 31
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  TabStop = True
  object lbl_Dept: TLabel
    Left = 71
    Top = 7
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
  object edt_Dept: TEdit
    Left = 3
    Top = 4
    Width = 41
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object btn_SelDept: TButton
    Left = 45
    Top = 5
    Width = 20
    Height = 20
    Hint = 'Select Department'
    Caption = '>>'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btn_SelDeptClick
  end
end
