//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit ChangeOffSiteRecsCont;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ToolWin, DB, DBTables, ADODB, ExtCtrls;

type
  Tfrm_changeOffSiteRecsCont = class(TForm)
    Label1: TLabel;
    edt_RecordNumber: TEdit;
    Label2: TLabel;
    lbl_Container: TLabel;
    Label4: TLabel;
    edt_NewContainer: TEdit;
    Button1: TButton;
    qry_SQL: TADOQuery;
    qry_Record: TADOQuery;
    qry_Container: TADOQuery;
    pnl_Top: TPanel;
    btn_Close: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure edt_RecordNumberChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_changeOffSiteRecsCont: Tfrm_changeOffSiteRecsCont;

implementation

uses main, MetrofilerDataModule;

{$R *.dfm}

procedure Tfrm_changeOffSiteRecsCont.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_changeOffSiteRecsCont.edt_RecordNumberChange(
  Sender: TObject);
begin
  qry_Record.Close;
  qry_Record.SQL.Clear;
  qry_Record.SQL.Add('SELECT filenumber, ContainerNo, IssueStatus FROM files WHERE Filenumber = '+QuotedStr(edt_RecordNumber.Text));
  qry_Record.Open;
  If qry_Record.IsEmpty Then
    begin
      qry_Record.Close;
      lbl_Container.Caption := 'Record not found!!';
    end
  else
    begin
      If qry_Record.FieldbyName('IssueStatus').asString <> 'MET' Then
        begin
          qry_Record.Close;
          lbl_Container.Caption := 'Record not Off-Site!!';
        end
      else lbl_Container.Caption := qry_Record.FieldbyName('ContainerNo').asString;
    end;
end;

procedure Tfrm_changeOffSiteRecsCont.Button1Click(Sender: TObject);
begin
  If qry_Record.IsEmpty Then
    begin
      ShowMessage('Invalid Record Details!!');
      exit;
    end;
//------
  qry_Container.Close;
  qry_Container.SQL.Clear;
  qry_Container.SQL.Add('SELECT * FROM Containers WHERE Container = '+QuotedStr(edt_NewContainer.Text));
  qry_Container.Open;
  If qry_Container.IsEmpty Then
    begin
      ShowMessage('New Container not found!!');
      exit;
    end;
  If qry_Container.FieldbyName('IssueStatus').asString <> 'MET' Then
    begin
      Showmessage('New Container not Off-Site!!');
      exit;
    end;
//-----
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('UPDATE Files SET ContainerNo = '+QuotedStr(edt_NewContainer.Text)+', UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE() WHERE Filenumber = '+QuotedStr(qry_Record.FieldbyName('Filenumber').asString));
  qry_SQL.ExecSQL;
  ShowMessage('Finished!!');
  edt_RecordNumber.Text := '';
  qry_Container.Close;
  qry_Record.Close;
  lbl_Container.Caption := '...';
  edt_NewContainer.Text := '';
end;

procedure Tfrm_changeOffSiteRecsCont.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_Console.act_ChangeOffSiteCont.Enabled := True;
  Action := caFree;
end;

end.
