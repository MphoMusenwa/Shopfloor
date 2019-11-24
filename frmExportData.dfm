object frm_ExportData: Tfrm_ExportData
  Left = 110
  Top = 192
  Caption = 'Export Captured Data'
  ClientHeight = 399
  ClientWidth = 803
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 336
    Top = 184
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 803
    Height = 31
    ButtonHeight = 32
    Caption = 'ToolBar'
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      Enabled = False
      Style = tbsSeparator
    end
    object btn_Close: TSpeedButton
      Left = 8
      Top = 0
      Width = 73
      Height = 32
      Hint = 'Close this window'
      Caption = '&Close'
      Flat = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
      Transparent = False
      OnClick = btn_CloseClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 31
    Width = 803
    Height = 368
    ActivePage = TabSheet2
    Align = alClient
    HotTrack = True
    Style = tsFlatButtons
    TabOrder = 1
    object TabSheet2: TTabSheet
      Caption = 'Batches Ready for Export'
      ImageIndex = 1
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 795
        Height = 50
        Align = alTop
        TabOrder = 0
        object btn_ViewFileLinks: TSpeedButton
          Left = 696
          Top = 6
          Width = 45
          Height = 37
          Hint = 'View Image FileLinks'
          Flat = True
          Glyph.Data = {
            36080000424D3608000000000000360400002800000020000000200000000100
            0800000000000004000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            030303030303030303030303030303030303030303030303030303030303A400
            000000000000000000000000000000000000000000490303030303030303A407
            0707070707A449A4A449A4A4A452070707070707075B0303030303030303A407
            0EF7070707070707070707070707070707070707075B0303030303030303A407
            F7F7070707070707070707070707070707070707075B0303030303030303A407
            49929292929292929292929292929292929292A4075B0303030303030303A407
            4940404040404040404040404040404040FF40A4075B0303030303030303A407
            4940405B5B5B5B5B5B5B5B5B5B494040404040A4075B0303030303030303A407
            4940409AFFEAFFEAFFEAFFEAFF494040404040A4075B0303030303030303A407
            494040F7FFFFFFFFFFFFFFFFFF494040404040A4075B0303030303030303A407
            4940405AFF02FF02FF02FF02FF494040404040A4075B0303030303030303A407
            494040F7FFFFFFFFFFFFFFFFFF494040404040A4075B0303030303030303A407
            49404055FFF9FFF9FFF9FFF9FF494040404040A4075B0303030303030303A407
            494040F7FFFFFFFFFFFFFFFFFF494040404040A4075B0303030303030303A407
            49404092FFFCFFFCFFFCFFFCFF494040404040A4075B0303030303030303A407
            4940405B5B5BF7F7F7F75B5B5B494040404040A407520303030303030303A407
            4940405B5B5B5B5B5B5B5B5B5B4940FFFFFF40A407520303030303030303A407
            49404040404040404040404040404040404040A407520303030303030303A407
            49404040404040404040404040404040404040A407520303030303030303A407
            49F7019B52F75252F75252F7529BF7F752F7525207520303030303030303A407
            070707070707070707070707070707070707070707A40303030303030303A4A4
            A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A403030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303}
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_ViewFileLinksClick
        end
        object btn_Export: TSpeedButton
          Left = 747
          Top = 7
          Width = 45
          Height = 37
          Hint = 'Export Captured data for this Batch'
          Flat = True
          Glyph.Data = {
            36080000424D3608000000000000360400002800000020000000200000000100
            0800000000000004000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            030303030303FCFCFCFC07070707070707070707FCFCFCFCFC00030303030303
            0303030303FCFCFCFCFC07070404070707070707FCFCFCFCFCFC030303030303
            0303030303FCFCFCFCFC07070404070707070707FCFCFCFCFCFC030303030303
            0303030303FCFCFCFCFC07070404070707070707FCFCFCFCFCFC030303030303
            0303030303FCFCFCFCFC07070404070707070707FCFCFCFCFCFC030303030303
            0303030300FCFCFCFCFC07070707070707070707FCFCFCFCFCFC030303030303
            030303030000FCFCFCFCFC0707070707070707FCFCFCFCFCFCFC030303030303
            0303030300A400FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC030300000000
            0000000000A4A400FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC030300A4A4A4
            A4A4A4A4A4A4A4A400FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC030300A4A4A4
            A4A4A4A4A4A4A4A4A40007070707070707070707070707FCFCFC030300A4A4A4
            A4A4A4A4A4A4A4A400FFFFFFFFFFFFFFFFFFFFFFFFFFFF07FCFC030300A4A4A4
            0707070707A4A400A4FFFFFFFFFFFFFFFFFFFFFFFFFFFF07FCFC030300A4A4A4
            0703030307A400FCA4FFFFFFFFFFFFFFFFFFFFFFFFFFFF07FCFC030300A4A4A4
            070303030700FCFCA4FFFFFFFFFFFFFFFFFFFFFFFFFFFF07FCFC030300A4A4A4
            0703030300FCFCFCA4FFFFFFFFFFFFFFFFFFFFFFFFFFFF07FCFC030300A4A4A4
            0703030303FCFCFCA4FFFFFFFFFFFFFFFFFFFFFFFFFFFF07FCFC030300A4A4A4
            0703030303FCFCFCA4FFFFFFFFFFFFFFFFFFFFFFFFFFFF07FCFC030300A4A4A4
            0703030303FCFCFCA4FFFFFFFFFFFFFFFFFFFFFFFFFFFF07FCFC030300A4A4A4
            0703030303FCFCFCA4FFFFFFFFFFFFFFFFFFFFFFFFFFFF07FCFC030300A4A4A4
            0703030303FCFCFCA4070707070707070707070707070707FCFC030300A4A4A4
            0703030303030303030303030303030303030303030303030303000000000000
            0000000000000000000000000000030303030303030303030303FF0707070707
            0707070707070707070707070700030303030303030303030303FF07F9F90707
            0707070707070707070707070700030303030303030303030303FF0707070707
            0707070707070707070707070700030303030303030303030303FF0700000000
            0000000000000000000000000700030303030303030303030303FF0707070707
            0707070707070707070707070700030303030303030303030303FF0707070707
            0707070707070707070707070700030303030303030303030303FF0707070707
            0707070707070707070707070700030303030303030303030303FF0707070707
            0707070707070707070707070700030303030303030303030303FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00030303030303030303030303}
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_ExportClick
        end
        object Bevel3: TBevel
          Left = 1
          Top = 2
          Width = 168
          Height = 45
        end
        object Bevel1: TBevel
          Left = 176
          Top = 2
          Width = 409
          Height = 45
        end
        object Label15: TLabel
          Left = 275
          Top = 8
          Width = 30
          Height = 13
          Caption = 'Code'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_GetCoCode: TSpeedButton
          Left = 364
          Top = 5
          Width = 17
          Height = 21
          Caption = '>>'
          Flat = True
          OnClick = btn_GetCoCodeClick
        end
        object btn_GetDept: TSpeedButton
          Left = 471
          Top = 5
          Width = 18
          Height = 22
          Caption = '>>'
          Flat = True
          OnClick = btn_GetDeptClick
        end
        object Label16: TLabel
          Left = 396
          Top = 9
          Width = 28
          Height = 13
          Caption = 'Dept'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 5
          Top = 8
          Width = 50
          Height = 13
          Caption = 'BatchNo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_FindJobNo: TSpeedButton
          Left = 131
          Top = 4
          Width = 35
          Height = 23
          Hint = 'Find Job Request'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
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
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_FindJobNoClick
        end
        object btn_Filter: TSpeedButton
          Left = 495
          Top = 5
          Width = 85
          Height = 22
          Caption = 'Apply Filter'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333FFFFFFFFFFFFF3344444444444443337777777777777F334CCCCCCCCCC
            C43337777777777777F33444881B188444333777F3737337773333308881FF70
            33333337F3373337F3333330888BF770333333373F33F337333333330881F703
            3333333373F73F7333333333308B703333333333373F77333333333333080333
            3333333333777FF333333333301F103333333333377777FF3333333301B1F103
            333333337737777FF3333330881BFB7033333337F3737F77F333333088881F70
            333333F7F3337777FFF334448888888444333777FFFFFFF777F334CCCCCCCCCC
            C43337777777777777F334444444444444333777777777777733}
          NumGlyphs = 2
          OnClick = btn_FilterClick
        end
        object btn_ProcNotes: TSpeedButton
          Left = 591
          Top = 13
          Width = 98
          Height = 24
          Hint = 'Comments/Notes regarding the pack'
          Caption = '&Process Notes'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_ProcNotesClick
        end
        object rgrp_Filter: TRadioGroup
          Left = 182
          Top = 3
          Width = 84
          Height = 44
          Caption = 'Show'
          ItemIndex = 0
          Items.Strings = (
            'Open'
            'Exp Compl')
          TabOrder = 0
        end
        object edt_Code: TEdit
          Left = 309
          Top = 5
          Width = 57
          Height = 21
          TabOrder = 1
        end
        object edt_Dept: TEdit
          Left = 428
          Top = 5
          Width = 43
          Height = 21
          TabOrder = 2
        end
        object edt_FindBatchNo: TEdit
          Left = 56
          Top = 5
          Width = 76
          Height = 21
          TabOrder = 3
        end
      end
      object img: TTiffXViewWeb
        Left = 168
        Top = 128
        Width = 792
        Height = 480
        ParentFont = False
        TabOrder = 2
        OnCreate = imgCreate
        ControlData = {
          545046300D545469666658566965775765620C54696666585669657757656204
          4C65667403A80003546F700380000557696474680318030648656967687403E0
          010D416374697665436F6E74726F6C070C50616765436F6E74726F6C31074361
          7074696F6E0603696D6705436F6C6F720709636C42746E466163650C466F6E74
          2E43686172736574070F44454641554C545F434841525345540A466F6E742E43
          6F6C6F72070C636C57696E646F77546578740B466F6E742E48656967687402F5
          09466F6E742E4E616D65060D4D532053616E732053657269660A466F6E742E53
          74796C650B000E4F6C644372656174654F72646572080D506978656C73506572
          496E636802600A54657874486569676874020D0000}
      end
      object grd_ExportData: TDBGrid
        Left = 0
        Top = 50
        Width = 795
        Height = 287
        Align = alClient
        DataSource = dts_BatchImages
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = grd_ExportDataDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'BatchNo'
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descr'
            Title.Caption = 'Description'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RecordType'
            Title.Caption = 'Record Type'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JobNo'
            Title.Caption = 'Job Number'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Code'
            Title.Caption = 'CustomerCode'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Department'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TotalImages'
            Title.Caption = 'Total Images'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TotalCapturedImages'
            Title.Caption = 'Total Files Captured'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TotalOutstanding'
            Title.Caption = 'Total Outstanding'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ExpCompl'
            Title.Caption = 'Exp Compl'
            Visible = True
          end>
      end
      object pnl_Processing: TPanel
        Left = 207
        Top = 104
        Width = 346
        Height = 121
        TabOrder = 3
        Visible = False
        object Label2: TLabel
          Left = 125
          Top = 31
          Width = 88
          Height = 13
          Caption = 'Processing............'
        end
      end
      object fileList: TListBox
        Left = 576
        Top = 128
        Width = 216
        Height = 97
        ItemHeight = 13
        Sorted = True
        TabOrder = 4
        Visible = False
      end
      object listMergeSplit: TListBox
        Left = 40
        Top = 203
        Width = 711
        Height = 97
        ItemHeight = 13
        TabOrder = 5
        Visible = False
      end
      object mem_CSVList: TMemo
        Left = 40
        Top = 145
        Width = 585
        Height = 89
        Lines.Strings = (
          'mem_CSVList')
        ScrollBars = ssBoth
        TabOrder = 6
        Visible = False
      end
    end
  end
  object ProgressBar: TProgressBar
    Left = 249
    Top = 238
    Width = 274
    Height = 17
    TabOrder = 2
    Visible = False
  end
  object qry_BatchImages: TADOQuery
    Connection = frm_Main.ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = qry_BatchImagesCalcFields
    CommandTimeout = 600
    Parameters = <>
    SQL.Strings = (
      'SELECT '#9's.JobNo,'
      '         s.Code,'
      '         s.Department,'
      '         s.NonMOPS,'
      #9'        b.BatchNo,'
      #9'        b.Descr,'
      '          b.ExpCompl'
      'FROM Batches b, PackRequest s')
    Left = 368
    object qry_BatchImagesJobNo: TStringField
      FieldName = 'JobNo'
      FixedChar = True
      Size = 15
    end
    object qry_BatchImagesCode: TStringField
      FieldName = 'Code'
      FixedChar = True
      Size = 7
    end
    object qry_BatchImagesDepartment: TStringField
      FieldName = 'Department'
      FixedChar = True
      Size = 2
    end
    object qry_BatchImagesNonMOPS: TSmallintField
      FieldName = 'NonMOPS'
    end
    object qry_BatchImagesBatchNo: TStringField
      FieldName = 'BatchNo'
      FixedChar = True
      Size = 15
    end
    object qry_BatchImagesRecordType: TStringField
      FieldName = 'RecordType'
      Size = 30
    end
    object qry_BatchImagesDescr: TStringField
      FieldName = 'Descr'
      Size = 50
    end
    object qry_BatchImagesExpCompl: TSmallintField
      FieldName = 'ExpCompl'
    end
    object qry_BatchImagesTotalImages: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TotalImages'
      Calculated = True
    end
    object qry_BatchImagesTotalCapturedImages: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TotalCapturedImages'
      Calculated = True
    end
    object qry_BatchImagesTotalOutstanding: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TotalOutstanding'
      Calculated = True
    end
  end
  object dts_BatchImages: TDataSource
    DataSet = qry_BatchImages
    Left = 368
    Top = 32
  end
  object qry_Files: TADOQuery
    Connection = frm_Main.ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 600
    Parameters = <>
    SQL.Strings = (
      'SELECT BatchNo, JobNo, DateAlloc'
      'FROM BATCHALLOCRES'
      'WHERE Operator = '#39'STEVE'#39
      'AND Region = '#39'JHB'#39
      'AND ResAction = '#39'Catalogue'#39)
    Left = 400
  end
  object qry_SQL: TADOQuery
    Connection = frm_Main.ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 600
    Parameters = <>
    SQL.Strings = (
      'SELECT BatchNo, JobNo, DateAlloc'
      'FROM BATCHALLOCRES'
      'WHERE Operator = '#39'STEVE'#39
      'AND Region = '#39'JHB'#39
      'AND ResAction = '#39'Catalogue'#39)
    Left = 432
  end
  object qry_ExpDefs: TADOQuery
    Connection = frm_Main.ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 600
    Parameters = <>
    SQL.Strings = (
      'SELECT BatchNo, JobNo, DateAlloc'
      'FROM BATCHALLOCRES'
      'WHERE Operator = '#39'STEVE'#39
      'AND Region = '#39'JHB'#39
      'AND ResAction = '#39'Catalogue'#39)
    Left = 464
  end
  object qry_Image: TADOQuery
    Connection = frm_Main.ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 600
    Parameters = <>
    SQL.Strings = (
      'SELECT ImageData FROM ImagingFiles')
    Left = 496
  end
  object sdlg_Export: TSaveDialog
    DefaultExt = 'csv'
    Filter = 'csv|*.csv'
    Left = 332
    Top = 2
  end
  object qry_Calc: TADOQuery
    Connection = frm_Main.ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 600
    Parameters = <>
    SQL.Strings = (
      'SELECT BatchNo, JobNo, DateAlloc'
      'FROM BATCHALLOCRES'
      'WHERE Operator = '#39'STEVE'#39
      'AND Region = '#39'JHB'#39
      'AND ResAction = '#39'Catalogue'#39)
    Left = 528
  end
  object qry_MergeFiles: TADOQuery
    Connection = frm_Main.ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 600
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 568
    Top = 16
  end
  object qry_UpdImage: TADOQuery
    Connection = frm_Main.ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 600
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 592
    Top = 24
  end
  object qry_UpdFilePath: TADOQuery
    Connection = frm_Main.ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 600
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 616
    Top = 8
  end
end
