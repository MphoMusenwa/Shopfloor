object frm_DataMan: Tfrm_DataMan
  Left = 215
  Top = 80
  Caption = 'Data Manager'
  ClientHeight = 531
  ClientWidth = 1002
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1002
    Height = 30
    Align = alTop
    TabOrder = 0
    object btn_Close: TSpeedButton
      Left = 5
      Top = 3
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
  end
  inline fram_DataManager1: Tfram_DataManager
    Left = 0
    Top = 30
    Width = 1002
    Height = 501
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = True
    ExplicitTop = 30
    ExplicitWidth = 1002
    ExplicitHeight = 501
    inherited PageControl1: TPageControl
      Width = 1002
      Height = 501
      ExplicitWidth = 1002
      ExplicitHeight = 501
      inherited TabSheet1: TTabSheet
        ExplicitWidth = 994
        ExplicitHeight = 467
        inherited Splitter1: TSplitter
          Height = 467
          ExplicitHeight = 467
        end
        inherited Panel1: TPanel
          Height = 467
          ExplicitHeight = 467
        end
        inherited Panel3: TPanel
          Width = 579
          Height = 467
          ExplicitWidth = 579
          ExplicitHeight = 467
          inherited Label6: TLabel
            Width = 577
          end
          inherited grd_FindReplace: TDBGrid
            Width = 577
            Height = 452
          end
        end
      end
      inherited TabSheet4: TTabSheet
        ExplicitTop = 27
        ExplicitHeight = 580
        inherited Panel11: TPanel
          Height = 580
          ExplicitHeight = 580
        end
        inherited Panel13: TPanel
          Height = 580
          ExplicitHeight = 580
          inherited grd_Retention: TDBGrid
            Height = 565
          end
        end
      end
    end
  end
end
