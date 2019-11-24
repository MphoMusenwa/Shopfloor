//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit MRegister;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, DBCtrls, DB, DBTables, ExtCtrls, Buttons,
  ComCtrls, ADODB;

type
  Tfrm_Register = class(TForm)
    dts_Company: TDataSource;
    qry_Company: TADOQuery;
    pnl_Top: TPanel;
    btn_Close: TSpeedButton;
    FileNavigator: TDBNavigator;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edit_CompCode: TDBEdit;
    edt_CompanyName: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure qry_CompanyAfterPost(DataSet: TDataSet);
    procedure qry_CompanyAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Register: Tfrm_Register;

implementation

{$R *.DFM}

uses main, MetrofilerDatamodule;

procedure Tfrm_Register.FormCreate(Sender: TObject);
begin
  qry_Company.Open;
  If qry_Company.FieldByName('CompanyCode').AsString > '' then
     edit_CompCode.enabled := false
  else edit_CompCode.enabled := true;
end;

procedure Tfrm_Register.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Register.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
  qry_Company.Close;
  frm_Console.act_Register.Enabled := True;
  Action := caFree;
end;

procedure Tfrm_Register.qry_CompanyAfterPost(DataSet: TDataSet);
begin
  qry_Company.Close;
  qry_Company.Open;
end;

procedure Tfrm_Register.qry_CompanyAfterInsert(DataSet: TDataSet);
begin
  Dataset['UseBarcodeRanges'] := 0;
  Dataset['DefLocLen'] := 0;
  Dataset['PrText1'] := 'Text1';
  Dataset['PrText2'] := 'Text2';
  Dataset['PrText3'] := '';
  Dataset['PrText4'] := '';
end;

end.
