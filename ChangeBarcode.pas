unit ChangeBarcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, DB, ADODB, ComCtrls;

type
  Tfrm_ChangeBarcode = class(TForm)
    pnl_Top: TPanel;
    btn_Close: TSpeedButton;
    mem_Result: TMemo;
    qry_SQL: TADOQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_Barcode: TEdit;
    edt_NewBarcode: TEdit;
    btn_SingleProcess: TBitBtn;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    edt_ItemBarcode: TEdit;
    edt_NewItemFileBarcode: TEdit;
    btn_ChangeItemFilenumber: TBitBtn;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SingleProcessClick(Sender: TObject);
    procedure btn_ChangeItemFilenumberClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ChangeBarcode: Tfrm_ChangeBarcode;

implementation

Uses main, MetrofilerDataModule;

{$R *.dfm}

procedure Tfrm_ChangeBarcode.btn_ChangeItemFilenumberClick(Sender: TObject);
Var
  J          :Integer;
  TempStr    :String;
  T          :Char;
  OldFilenumber  :String;
begin
  If trim(edt_ItemBarcode.Text) = '' Then
    begin
      Messagedlg('Please scan an item Barcode.', mtInformation, [mbOK], 0);
      exit;
    end;
  If trim(edt_NewItemFileBarcode.Text) = '' Then
    begin
      Messagedlg('Please scan a new File Barcode.', mtInformation, [mbOK], 0);
      exit;
    end;
//-------------------Validate Filenumber----------------------------------------
  TempStr := edt_NewItemFileBarcode.Text;

  For J := 1 to length(TempStr) Do
    begin
      T := TempStr[J];
      If NOT(T IN ['a'..'z','A'..'Z', '0'..'9']) Then
        begin
          Messagedlg('Invalid New Barcode.', mtInformation, [mbOK], 0);
          exit;
        end;
    end;
//------------------------------------------------------------------------------
  Screen.Cursor := crHourglass;
  try
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT Itemnumber, Status, Filenumber FROM Items WHERE Itemnumber = :Itemnumber');
    qry_SQL.Parameters.ParamValues['Itemnumber'] := edt_ItemBarcode.Text;
    qry_SQL.Open;
    If qry_SQL.IsEmpty Then
      begin
        Messagedlg('Invalid barcode ' + edt_ItemBarcode.Text + ' scanned.', mtInformation, [mbOK], 0);
        exit;
      end;
    If (qry_SQL.FieldByName('Status').AsString <> 'O')AND
       (qry_SQL.FieldByName('Status').AsString <> 'IU')AND
       (qry_SQL.FieldByName('Status').AsString <> 'OI')AND
       (qry_SQL.FieldByName('Status').AsString <> 'IUI')Then
      begin
        Messagedlg('Item must have a status of OUT to change its Filenumber.', mtInformation, [mbOK], 0);
        exit;
      end;
    OldFilenumber := qry_SQL.FieldByName('Filenumber').AsString;
//-----
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT Filenumber, IssueStatus FROM Files WHERE Filenumber = :Filenumber');
    qry_SQL.Parameters.ParamValues['Filenumber'] := edt_NewItemFileBarcode.Text;
    qry_SQL.Open;
    If qry_SQL.IsEmpty Then
      begin
        Messagedlg('Invalid File barcode ' + edt_NewItemFileBarcode.Text + ' scanned.', mtInformation, [mbOK], 0);
        exit;
      end;
    If (qry_SQL.FieldByName('IssueStatus').AsString = 'PW')Then
      begin
        Messagedlg('Cannot change filenumber. The Filenumber has been permanently withdrawn.', mtInformation, [mbOK], 0);
        exit;
      end;
    If (qry_SQL.FieldByName('IssueStatus').AsString = 'DES')Then
      begin
        Messagedlg('Cannot change filenumber. The Filenumber has been Destroyed.', mtInformation, [mbOK], 0);
        exit;
      end;
    If (qry_SQL.FieldByName('IssueStatus').AsString = 'MET')Then
      begin
        Messagedlg('Cannot change filenumber. The Filenumber has been booked Off-Site.', mtInformation, [mbOK], 0);
        exit;
      end;
//-------
    mem_Result.Lines.Clear;
    mem_Result.Lines.Add('Changing the Filenumber.');
    Application.ProcessMessages;
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('UPDATE Items SET Filenumber = :Filenumber, Status = ''I'', UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE() WHERE Itemnumber = :Itemnumber');
    qry_SQL.Parameters.ParamValues['Itemnumber'] := edt_ItemBarcode.Text;
    qry_SQL.Parameters.ParamValues['Filenumber'] := edt_NewItemFileBarcode.Text;
    qry_SQL.ExecSQL;
    dm_Metrofiler.InsAudit('Changed Item Filenumber', 0, 0, edt_ItemBarcode.Text, OldFilenumber + ' to ' + edt_NewItemFileBarcode.Text + '.', 0);
    mem_Result.Lines.Add('Successfully Changed Item ' + edt_ItemBarcode.Text + ', from '+OldFilenumber+' to new Filenumber ' + edt_NewItemFileBarcode.Text + '.');
    Application.ProcessMessages;
  finally
    qry_SQL.Close;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_ChangeBarcode.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ChangeBarcode.btn_SingleProcessClick(Sender: TObject);
Var
  J          :Integer;
  TempStr    :String;
  T          :Char;
begin
  If trim(edt_Barcode.Text) = '' Then
    begin
      Messagedlg('Please scan an existing Barcode.', mtInformation, [mbOK], 0);
      exit;
    end;
  If trim(edt_NewBarcode.Text) = '' Then
    begin
      Messagedlg('Please scan a new Barcode.', mtInformation, [mbOK], 0);
      exit;
    end;
//-------------------Validate Filenumber----------------------------------------
  TempStr := edt_NewBarcode.Text;

  For J := 1 to length(TempStr) Do
    begin
      T := TempStr[J];
      If NOT(T IN ['a'..'z','A'..'Z', '0'..'9']) Then
        begin
          Messagedlg('Invalid New Barcode.', mtInformation, [mbOK], 0);
          exit;
        end;
    end;
//------------------------------------------------------------------------------
  Screen.Cursor := crHourglass;
  try
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT COUNT(*) FROM Files WHERE Filenumber = :Filenumber');
    qry_SQL.Parameters.ParamValues['Filenumber'] := edt_Barcode.Text;
    qry_SQL.Open;
    If qry_SQL.Fields[0].AsInteger = 0 Then
      begin
        Messagedlg('Invalid barcode ' + edt_Barcode.Text + ' scanned.', mtInformation, [mbOK], 0);
        exit;
      end;
//-----
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT COUNT(*) FROM Files WHERE Filenumber = :Filenumber');
    qry_SQL.Parameters.ParamValues['Filenumber'] := edt_NewBarcode.Text;
    qry_SQL.Open;
    If qry_SQL.Fields[0].AsInteger > 0 Then
      begin
        Messagedlg('Barcode ' + edt_NewBarcode.Text + ' already exist in system.', mtInformation, [mbOK], 0);
        exit;
      end;
//-----
    mem_Result.Lines.Clear;
    mem_Result.Lines.Add('Changing the Barcode.');
    Application.ProcessMessages;
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('EXEC ap_ChangeFileBarcode :OldBarcode, :NewBarcode');
    qry_SQL.Parameters.ParamValues['OldBarcode'] := edt_Barcode.Text;
    qry_SQL.Parameters.ParamValues['NewBarcode'] := edt_NewBarcode.Text;
    qry_SQL.ExecSQL;
    dm_Metrofiler.InsAudit('Changed Barcode', 0, 0, '', edt_Barcode.Text + ' to ' + edt_NewBarcode.Text + '.', 0);
    mem_Result.Lines.Add('Successfully Changed Barcode ' + edt_Barcode.Text + ' to New Barcode ' + edt_NewBarcode.Text + '.');
    Application.ProcessMessages;
  finally
    qry_SQL.Close;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_ChangeBarcode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_Console.act_ChangeBarcode.Enabled := true;
  Action := caFree;
end;

end.
