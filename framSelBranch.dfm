object fram_SelBranch: Tfram_SelBranch
  Left = 0
  Top = 0
  Width = 304
  Height = 29
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  TabStop = True
  object lbl_Branch: TLabel
    Left = 70
    Top = 8
    Width = 165
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
  object edt_Branch: TEdit
    Left = 3
    Top = 4
    Width = 41
    Height = 21
    ReadOnly = True
    TabOrder = 0
    OnChange = edt_BranchChange
  end
  object btn_SelBranch: TButton
    Left = 45
    Top = 4
    Width = 20
    Height = 20
    Hint = 'Select Branch'
    Caption = '>>'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btn_SelBranchClick
  end
end
