//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit SelContainer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ToolWin, Db, DBTables, ADODB;

type
  Tfrm_SelOffsiteContainer = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    edt_Container: TEdit;
    qry_SelContainer: TADOQuery;
    ToolButton2: TToolButton;
    BitBtn2: TBitBtn;
    qry_Add: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ContainerNo   :String[20];
  end;

var
  frm_SelOffsiteContainer: Tfrm_SelOffsiteContainer;

implementation

USES MetrofilerDataModule;

{$R *.DFM}

procedure Tfrm_SelOffsiteContainer.BitBtn1Click(Sender: TObject);
begin
  With qry_SelContainer Do
    begin
      If length(edt_Container.Text) = 0 Then
        begin
          Showmessage('Please enter a Container to go Offsite!!');
          exit;
        end;
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM CONTAINERS WHERE CONTAINER = '+QuotedStr(edt_Container.Text));
      Open;
      If isEmpty Then
        begin
          ContainerNo := edt_Container.Text;
          ModalResult := mrOK;
          exit;
        end;
      If (FieldbyName('ISSUESTATUS').asString <> 'OUT')and
         (FieldbyName('ISSUESTATUS').asString <> '')and
         (FieldbyName('ISSUESTATUS').asString <> 'MIN')and
         (FieldbyName('ISSUESTATUS').asString <> 'MET')and
         (FieldbyName('ISSUESTATUS').asString <> 'IN')Then
        begin
          Showmessage('Container is not available for Offsite selection, please select a valid Container!!');
          Close;
          exit;
        end;
      ContainerNo := FieldbyName('CONTAINER').asString;
      Close;
      ModalResult := mrOK;
    end;
end;

end.
