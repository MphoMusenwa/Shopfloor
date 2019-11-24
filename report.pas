unit report;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, DBTables, Report;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Report1: TReport;
    Table1: TTable;
    btn_RunRep: TBitBtn;
    procedure btn_RunRepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btn_RunRepClick(Sender: TObject);
begin
Report1.Run;
end;

end.
