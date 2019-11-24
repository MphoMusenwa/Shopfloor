object fram_MoveLocations: Tfram_MoveLocations
  Left = 0
  Top = 0
  Width = 822
  Height = 693
  TabOrder = 0
  TabStop = True
  object mem_Status: TMemo
    Left = 0
    Top = 179
    Width = 822
    Height = 514
    Align = alClient
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 138
    Width = 822
    Height = 41
    Align = alTop
    TabOrder = 1
    object btn_Move: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Move'
      TabOrder = 0
      OnClick = btn_MoveClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 822
    Height = 138
    Align = alTop
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 273
      Height = 136
      Align = alLeft
      Caption = 'Source'
      TabOrder = 0
      object pg_Source: TPageControl
        Left = 2
        Top = 15
        Width = 269
        Height = 119
        ActivePage = TabSheet1
        Align = alClient
        Style = tsButtons
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'Filing Area'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label2: TLabel
            Left = 18
            Top = 18
            Width = 50
            Height = 13
            Caption = 'Filing Area'
          end
          object lbl_05: TLabel
            Left = 23
            Top = 48
            Width = 43
            Height = 13
            Caption = 'Location '
          end
          object lbl_FWHouse: TLabel
            Left = 143
            Top = 18
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
          object edt_FLoc: TEdit
            Left = 83
            Top = 44
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edt_FWHouse: TEdit
            Left = 83
            Top = 16
            Width = 36
            Height = 21
            ReadOnly = True
            TabOrder = 1
          end
          object Button2: TButton
            Left = 120
            Top = 17
            Width = 19
            Height = 19
            Hint = 'Select Filing Area'
            Caption = '>>'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = Button2Click
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Proxy Location'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label5: TLabel
            Left = 15
            Top = 24
            Width = 43
            Height = 13
            Caption = 'Location '
          end
          object edt_SourceProxy: TEdit
            Left = 75
            Top = 20
            Width = 121
            Height = 21
            TabOrder = 0
          end
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 274
      Top = 1
      Width = 547
      Height = 136
      Align = alClient
      Caption = 'Destination'
      TabOrder = 1
      object pg_Destination: TPageControl
        Left = 2
        Top = 15
        Width = 543
        Height = 119
        ActivePage = TabSheet3
        Align = alClient
        Style = tsButtons
        TabOrder = 0
        object TabSheet3: TTabSheet
          Caption = 'Filing Area'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label1: TLabel
            Left = 3
            Top = 18
            Width = 50
            Height = 13
            Caption = 'Filing Area'
          end
          object Label3: TLabel
            Left = 8
            Top = 48
            Width = 43
            Height = 13
            Caption = 'Location '
          end
          object lbl_TWHouse: TLabel
            Left = 128
            Top = 18
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
          object edt_TLoc: TEdit
            Left = 68
            Top = 44
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edt_TWHouse: TEdit
            Left = 68
            Top = 16
            Width = 36
            Height = 21
            ReadOnly = True
            TabOrder = 1
          end
          object Button3: TButton
            Left = 105
            Top = 16
            Width = 19
            Height = 19
            Hint = 'Select Filing Area'
            Caption = '>>'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = Button3Click
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Proxy Location'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label4: TLabel
            Left = 15
            Top = 24
            Width = 43
            Height = 13
            Caption = 'Location '
          end
          object edt_DestProxy: TEdit
            Left = 75
            Top = 20
            Width = 121
            Height = 21
            TabOrder = 0
          end
        end
      end
    end
  end
  object qry_SQL: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 440
    Top = 416
  end
  object qry_Loc: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 496
    Top = 416
  end
  object qry_Files: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 528
    Top = 416
  end
  object qry_ReSer: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 560
    Top = 416
  end
  object qry_Items: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 528
    Top = 384
  end
end
