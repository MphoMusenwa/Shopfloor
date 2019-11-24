unit Getcomp;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables, TabNotBk,
  ComCtrls;

type
  Tfrm_GetCompany = class(TForm)
    btn_Cancel: TBitBtn;
    btn_OK: TBitBtn;
    btn_Search: TBitBtn;
    dts_Company: TDataSource;
    dts_Search: TDataSource;
    edt_Code2: TEdit;
    edt_Code: TEdit;
    edt_Company: TEdit;
    grd_Company: TDBGrid;
    grd_CompanyResults: TDBGrid;
    lbl_Code: TLabel;
    lbl_CompCode: TLabel;
    lbl_Type: TLabel;
    ntb_Client: TTabbedNotebook;
    qry_CheckCode: TQuery;
    qry_Company: TQuery;
    qry_FindCompany: TQuery;
    procedure FormShow(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure dbgrid_DblClick(Sender: TObject);
    procedure dts_CompanyDataChange(Sender: TObject; Field: TField);
    procedure dts_SearchDataChange(Sender: TObject; Field: TField);
    procedure grd_CompanyColEnter(Sender: TObject);
    procedure grd_CompanyKeyPress(Sender: TObject; var Key: Char);
    procedure grd_CompanyResultsColEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CompanyCode : String;
    CompanyName : String;
  end;

var
  frm_GetCompany: Tfrm_GetCompany;

implementation

{$R *.DFM}

uses Main;

procedure Tfrm_GetCompany.btn_SearchClick(Sender: TObject);
begin
  qry_FindCompany.Active := false;
  qry_FindCompany.Params[0].AsString := edt_Company.Text + '%';
  qry_FindCompany.Active := true;
end;

procedure Tfrm_GetCompany.FormShow(Sender: TObject);
begin
  qry_Company.Active := FALSE; { refresh }
  qry_Company.Active := TRUE;
  ntb_Client.PageIndex := 0;
end;

procedure Tfrm_GetCompany.btn_OKClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  if (ntb_Client.PageIndex = 0) and (edt_Code.Text <> CompanyCode) then
  begin
    CompanyCode := edt_Code.Text;
    qry_CheckCode.Active := false;
    qry_CheckCode.Params[0].AsString := CompanyCode;
    qry_CheckCode.Active := true;
    if qry_CheckCode.EOF then
    begin
      Screen.Cursor := crDefault;
      ModalResult := mrNone;
      MessageDlg('Company was not found.',mtInformation,[mbOK],0);
      Exit;
    end;
    CompanyName := qry_CheckCode.Fields[0].AsString;
    qry_CheckCode.Active := false;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_GetCompany.btn_CancelClick(Sender: TObject);
begin
  CompanyCode := '';
  ModalResult := mrCancel;
end;

procedure Tfrm_GetCompany.dbgrid_DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrm_GetCompany.dts_SearchDataChange(Sender: TObject;
  Field: TField);
begin
   CompanyCode :=  qry_FindCompany.Fields[0].AsString;
   CompanyName :=  qry_FindCompany.Fields[1].AsString;
   edt_Code.Text := CompanyCode;
   edt_Code2.Text := CompanyCode;
end;

procedure Tfrm_GetCompany.dts_CompanyDataChange(Sender: TObject;
  Field: TField);
begin
   CompanyCode :=  qry_Company.Fields[0].AsString;
   CompanyName :=  qry_Company.Fields[1].AsString;
   edt_Code.Text := CompanyCode;
   edt_Code2.Text := CompanyCode;
end;

procedure Tfrm_GetCompany.grd_CompanyColEnter(Sender: TObject);
begin
   CompanyCode :=  qry_Company.Fields[0].AsString;
   CompanyName :=  qry_Company.Fields[1].AsString;
   edt_Code.Text  := CompanyCode;
   edt_Code2.Text := CompanyCode;
end;

procedure Tfrm_GetCompany.grd_CompanyResultsColEnter(Sender: TObject);
begin
   CompanyCode :=  qry_Company.Fields[0].AsString;
   CompanyName :=  qry_Company.Fields[1].AsString;
   edt_Code.Text  := CompanyCode;
   edt_Code2.Text := CompanyCode;
end;

procedure Tfrm_GetCompany.grd_CompanyKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key =  #13 then ModalResult := mrOK;
end;

end.