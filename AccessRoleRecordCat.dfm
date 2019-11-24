object frm_AccessRoleRecordCat: Tfrm_AccessRoleRecordCat
  Left = 0
  Top = 0
  Caption = 'Role Record Category Access'
  ClientHeight = 562
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    474
    562)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_Role: TLabel
    Left = 22
    Top = 40
    Width = 63
    Height = 13
    Caption = 'System Role:'
  end
  object lbl_RoleID: TLabel
    Left = 92
    Top = 40
    Width = 71
    Height = 13
    Caption = 'System Role'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 6
    Top = 66
    Width = 463
    Height = 10
    Shape = bsTopLine
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 474
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
  object sgrd_Access: TStringGrid
    Left = 10
    Top = 78
    Width = 455
    Height = 474
    Anchors = [akLeft, akTop, akBottom]
    ColCount = 2
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnClick = sgrd_AccessClick
    OnDrawCell = sgrd_AccessDrawCell
    ColWidths = (
      84
      213)
  end
  object qry_Roles: TADOQuery
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
  object PopupMenu1: TPopupMenu
    Left = 240
    Top = 216
    object SelectAll1: TMenuItem
      Caption = 'Select All'
      OnClick = SelectAll1Click
    end
    object DeSelectAll1: TMenuItem
      Caption = 'De-Select All'
      OnClick = DeSelectAll1Click
    end
  end
end
