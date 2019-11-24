unit ContainerComments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, DBCtrls, DB, ADODB;

type
  Tfrm_ContainerComments = class(TForm)
    Panel1: TPanel;
    mem_Notes: TDBMemo;
    dts_Comments: TDataSource;
    qry_Comments: TADOQuery;
    DBNavigator1: TDBNavigator;
    btn_Close: TSpeedButton;
    function Execute(Container :string):Integer;
    procedure btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ContainerComments: Tfrm_ContainerComments;

implementation

uses MAIN, MetrofilerDataModule;

{$R *.dfm}

function Tfrm_ContainerComments.Execute(Container :string):Integer;
begin
  Caption := 'Container Number: '+Container;
  qry_Comments.Close;
  qry_Comments.SQL.Clear;
  qry_Comments.SQL.Add('SELECT Container, Comments FROM Containers');
  qry_Comments.SQL.Add('WHERE Container = '+QuotedStr(trim(Container)));
  qry_Comments.Open;
  Execute := ShowModal;
  qry_Comments.Close;
end;

procedure Tfrm_ContainerComments.btn_CloseClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
