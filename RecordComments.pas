unit RecordComments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, DBCtrls, DB, ADODB;

type
  Tfrm_RecordComments = class(TForm)
    Panel1: TPanel;
    mem_Notes: TDBMemo;
    dts_Comments: TDataSource;
    qry_Comments: TADOQuery;
    DBNavigator1: TDBNavigator;
    btn_Close: TSpeedButton;
    function Execute(Filenumber :string):Integer;
    procedure btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_RecordComments: Tfrm_RecordComments;

implementation

uses MAIN, MetrofilerDataModule;

{$R *.dfm}

function Tfrm_RecordComments.Execute(Filenumber :string):Integer;
begin
  Caption := 'Barcode Number: '+Filenumber;
  qry_Comments.Close;
  qry_Comments.SQL.Clear;
  qry_Comments.SQL.Add('SELECT Filenumber, Comments FROM Files');
  qry_Comments.SQL.Add('WHERE Filenumber = '+QuotedStr(trim(filenumber)));
  qry_Comments.Open;
  Execute := ShowModal;
  qry_Comments.Close;
end;

procedure Tfrm_RecordComments.btn_CloseClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
