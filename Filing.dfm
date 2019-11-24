object frm_Filing: Tfrm_Filing
  Left = 0
  Top = 0
  Caption = 'Filing'
  ClientHeight = 500
  ClientWidth = 914
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
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_Top: TPanel
    Left = 0
    Top = 0
    Width = 914
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object btn_Close: TSpeedButton
      Left = 5
      Top = 3
      Width = 73
      Height = 25
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
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 32
    Width = 914
    Height = 468
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Put Away Files/Items'
      inline fram_PutAwayFileItem1: Tfram_PutAwayFileItem
        Left = 0
        Top = 0
        Width = 906
        Height = 437
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 906
        inherited Panel1: TPanel
          Width = 906
          ExplicitWidth = 906
        end
        inherited Panel2: TPanel
          Width = 906
          ExplicitWidth = 906
        end
        inherited Panel3: TPanel
          Width = 906
          ExplicitWidth = 906
          inherited GroupBox14: TGroupBox
            Width = 378
            ExplicitWidth = 378
            inherited lb_Error: TListBox
              Width = 318
              ExplicitWidth = 318
            end
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Put Away Containers'
      ImageIndex = 4
      inline fram_PutAwayContainers1: Tfram_PutAwayContainers
        Left = 0
        Top = 0
        Width = 906
        Height = 437
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 906
        inherited Panel2: TPanel
          Width = 906
          ExplicitWidth = 906
        end
        inherited Panel1: TPanel
          Width = 906
          ExplicitWidth = 906
        end
        inherited Panel3: TPanel
          Width = 906
          ExplicitWidth = 906
          inherited GroupBox14: TGroupBox
            Width = 378
            ExplicitWidth = 378
            inherited lb_Error: TListBox
              Width = 362
              ExplicitWidth = 362
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Put Files into Container'
      ImageIndex = 1
      inline fram_PutFilesintoContainer1: Tfram_PutFilesintoContainer
        Left = 0
        Top = 0
        Width = 906
        Height = 437
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 906
        ExplicitHeight = 437
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'View Location Files/Items'
      ImageIndex = 2
      inline fram_ViewLocationFilesItems1: Tfram_ViewLocationFilesItems
        Left = 0
        Top = 0
        Width = 906
        Height = 437
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 906
        ExplicitHeight = 437
        inherited Splitter2: TSplitter
          Width = 906
          ExplicitWidth = 906
        end
        inherited Panel5: TPanel
          Width = 906
          ExplicitWidth = 906
        end
        inherited pnl_ViewLocFiles: TPanel
          Width = 906
          ExplicitWidth = 906
          inherited DBGrid1: TDBGrid
            Width = 904
          end
          inherited Panel2: TPanel
            Width = 904
            ExplicitWidth = 904
          end
        end
        inherited pnl_ViewLocItems: TPanel
          Width = 906
          Height = 207
          ExplicitWidth = 906
          ExplicitHeight = 207
          inherited Panel3: TPanel
            Width = 904
            ExplicitWidth = 904
          end
          inherited DBGrid3: TDBGrid
            Width = 904
            Height = 181
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'View Location Containers'
      ImageIndex = 3
      inline fram_ViewLocationContainers1: Tfram_ViewLocationContainers
        Left = 0
        Top = 0
        Width = 906
        Height = 437
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 906
        ExplicitHeight = 437
        inherited Panel9: TPanel
          Width = 906
          ExplicitWidth = 906
        end
        inherited Panel10: TPanel
          Width = 906
          ExplicitWidth = 906
        end
        inherited DBGrid4: TDBGrid
          Width = 906
          Height = 334
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Audit Location Files'
      ImageIndex = 5
      inline fram_AuditLocFiles1: Tfram_AuditLocFiles
        Left = 0
        Top = 0
        Width = 906
        Height = 437
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 906
        ExplicitHeight = 437
        inherited Splitter1: TSplitter
          Height = 386
          ExplicitHeight = 386
        end
        inherited Splitter2: TSplitter
          Height = 386
          ExplicitHeight = 386
        end
        inherited Panel4: TPanel
          Width = 387
          Height = 386
          ExplicitWidth = 387
          ExplicitHeight = 386
          inherited lst_ErrorsAud: TListBox
            Width = 372
            Height = 289
            ExplicitWidth = 372
            ExplicitHeight = 289
          end
          inherited btn_PrintErrorAud: TBitBtn
            Top = 352
            ExplicitTop = 352
          end
          inherited btn_ClearErrorsAud: TBitBtn
            Top = 321
            ExplicitTop = 321
          end
        end
        inherited Panel2: TPanel
          Height = 386
          ExplicitHeight = 386
          inherited lst_BatchAud: TListBox
            Height = 289
            ExplicitHeight = 289
          end
          inherited btn_LanchScannAud: TBitBtn
            Top = 321
            ExplicitTop = 321
          end
          inherited btn_RefreshRecords: TBitBtn
            Top = 352
            ExplicitTop = 352
          end
        end
        inherited Panel1: TPanel
          Width = 906
          ExplicitWidth = 906
          inherited Label33: TLabel
            Left = 561
            ExplicitLeft = 561
          end
          inherited edt_Location: TEdit
            Left = 609
            ExplicitLeft = 609
          end
          inherited btn_ClearLocation: TBitBtn
            Left = 731
            ExplicitLeft = 731
          end
        end
        inherited Panel3: TPanel
          Height = 386
          ExplicitHeight = 386
          inherited btn_ProcessAud: TBitBtn
            Top = 321
            ExplicitTop = 321
          end
          inherited btn_ClearAud: TBitBtn
            Top = 352
            ExplicitTop = 352
          end
          inherited lst_ExistingRecs: TListBox
            Height = 289
            ExplicitHeight = 289
          end
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Audit Location Items'
      ImageIndex = 6
      inline fram_AuditLocItems1: Tfram_AuditLocItems
        Left = 0
        Top = 0
        Width = 906
        Height = 437
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 906
        ExplicitHeight = 437
        inherited Splitter1: TSplitter
          Height = 380
          ExplicitHeight = 400
        end
        inherited Splitter2: TSplitter
          Height = 380
          ExplicitHeight = 400
        end
        inherited Panel4: TPanel
          Width = 387
          Height = 380
          ExplicitWidth = 387
          ExplicitHeight = 380
          DesignSize = (
            387
            380)
          inherited lst_ErrorsAud: TListBox
            Width = 372
            Height = 283
            ExplicitWidth = 372
            ExplicitHeight = 283
          end
          inherited btn_PrintErrorAud: TBitBtn
            Top = 346
            ExplicitTop = 346
          end
          inherited btn_ClearErrorsAud: TBitBtn
            Top = 315
            ExplicitTop = 315
          end
        end
        inherited Panel2: TPanel
          Height = 380
          ExplicitHeight = 380
          DesignSize = (
            249
            380)
          inherited lst_BatchAud: TListBox
            Height = 283
            ExplicitHeight = 283
          end
          inherited btn_LanchScannAud: TBitBtn
            Top = 315
            ExplicitTop = 315
          end
          inherited btn_RefreshRecords: TBitBtn
            Top = 346
            ExplicitTop = 346
          end
        end
        inherited Panel1: TPanel
          Width = 906
          ExplicitWidth = 906
          DesignSize = (
            906
            57)
          inherited Label33: TLabel
            Left = 561
            ExplicitLeft = 561
          end
          inherited edt_Location: TEdit
            Left = 609
            ExplicitLeft = 609
          end
          inherited btn_ClearLocation: TBitBtn
            Left = 731
            ExplicitLeft = 731
          end
        end
        inherited Panel3: TPanel
          Height = 380
          ExplicitHeight = 380
          DesignSize = (
            258
            380)
          inherited btn_ProcessAud: TBitBtn
            Top = 315
            ExplicitTop = 315
          end
          inherited btn_ClearAud: TBitBtn
            Top = 346
            ExplicitTop = 346
          end
          inherited lst_ExistingRecs: TListBox
            Height = 283
            ExplicitHeight = 283
          end
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Move Location Contents'
      ImageIndex = 7
      inline fram_MoveLocations1: Tfram_MoveLocations
        Left = 0
        Top = 0
        Width = 906
        Height = 437
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 906
        ExplicitHeight = 437
        inherited mem_Status: TMemo
          Width = 906
          Height = 258
          ExplicitLeft = 0
          ExplicitTop = 179
          ExplicitWidth = 822
          ExplicitHeight = 514
        end
        inherited Panel2: TPanel
          Width = 906
          ExplicitLeft = 0
          ExplicitTop = 138
          ExplicitWidth = 906
        end
        inherited Panel3: TPanel
          Width = 906
          ExplicitTop = 0
          ExplicitWidth = 906
          inherited GroupBox2: TGroupBox
            Width = 631
            ExplicitWidth = 631
            inherited pg_Destination: TPageControl
              Width = 627
              ExplicitWidth = 627
              inherited TabSheet3: TTabSheet
                ExplicitWidth = 535
              end
            end
          end
        end
      end
    end
  end
  object qry_DefLocLen: TADOQuery
    Connection = dm_Metrofiler.ADOConnect_mFiler
    Parameters = <>
    Left = 80
  end
end
