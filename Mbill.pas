unit Mbill;

interface

uses
  Windows, Messages, WinTypes,WinProcs,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, DB, DBTables, DBCtrls,ExtCtrls, Grids,
 DBGrids, Tabnotbk,Printers, Qrctrls, quickrpt;

type
  Tfrm_MBill = class(TForm)
    dts_Tarrif: TDataSource;
    pnl_Top: TPanel;
    btn_ReqReturn: TBitBtn;
    nav_Grid: TDBNavigator;
    ntb_Tarrif: TTabbedNotebook;
    DBGrid1: TDBGrid;
    btn_GenInv: TBitBtn;
    DBGrid2: TDBGrid;
    dts_Minv: TDataSource;
    tbl_Minv: TTable;
    dts_Period: TDataSource;
    tbl_Period: TTable;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    edit_From: TDBText;
    edit_To: TDBText;
    edit_GetPeriod: TDBLookupComboBox;
    dts_Trans: TDataSource;
    tbl_MCharge: TTable;
    PrintDialog: TPrintDialog;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    Rbtn_Detail: TRadioButton;
    Rbtn_Sum: TRadioButton;
    btn_Print: TBitBtn;
    GroupBox2: TGroupBox;
    Edit_GetDepart: TComboBox;
    BitBtn1: TBitBtn;
    qry_Files: TQuery;
    SaveFile: TSaveDialog;
    qry_Trans: TQuery;
    Panel5: TPanel;
    Rep1: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
     procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_ReqReturnClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ntb_TarrifChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure btn_GenInvClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure Edit_GetDepartEnter(Sender: TObject);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure BitBtn1Click(Sender: TObject);
    procedure tbl_MinvAfterPost(DataSet: TDataSet);
    procedure tbl_MChargeAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExportCSV(TheTable :TTable);
  end;

var
  frm_MBill: Tfrm_MBill;
  Cur_Dept   :String[50];
implementation

uses main;
{$R *.DFM}
procedure Tfrm_MBill.FormCreate(Sender: TObject);
begin
  Top   := 0;
  Left  := 0;
  Width := 467;
  Height:= 250;
  ntb_Tarrif.PageIndex := 0;
  nav_Grid.DataSource := dts_Tarrif;
  tbl_MCharge.Active := true;
 end;

procedure Tfrm_MBill.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
  iResult : Integer;
begin
  if dts_Tarrif.State in [dsEdit,dsInsert] then
  begin
    iResult := MessageDlg('Do you want to save your changes?', mtInformation,
                          [mbYes,mbNo,mbAbort], 0);
    if iResult = mrAbort then
    begin
      Action := caNone;
      tbl_Minv.Active := false;
      tbl_MCharge.Active := false;
      Exit;
    end;

    if iResult = mrYes then
      tbl_MCharge.Post
    else
      tbl_MCharge.Cancel;                         //discard changes
  end;

  tbl_Minv.Active := false;
  tbl_MCharge.Active := false;

  Action := caFree;
  frm_Console.act_BillingMet.Enabled := true;
end;



procedure Tfrm_MBill.btn_ReqReturnClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_MBill.BitBtn2Click(Sender: TObject);
begin
MessageDlg('Error System Is Off-Line',mtError,[mbOK],0);
end;

procedure Tfrm_MBill.ntb_TarrifChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
    if (dts_Tarrif.State = dsEdit) then
        begin
                AllowChange := false;
                exit;
        end;
    if (dts_Minv.State = dsEdit) then
        begin
                AllowChange := false;
                exit;
        end;

case NewTab of
     0 : begin
      tbl_Minv.Active := false;
      tbl_Period.Active := false;
      tbl_MCharge.Active := true;
      nav_Grid.DataSource := dts_Tarrif;
         end;
     1 : begin
//       tbl_MCharge.Active := false;
       tbl_Period.Active := true;
       tbl_Minv.Active := true;
       nav_Grid.VisibleButtons :=[nbFirst,nbPrior,nbNext,nbInsert,nbDelete,nbLast];
       nav_Grid.DataSource := dts_Minv;
       end;

end;   //case tab check
AllowChange := true;
end;

procedure Tfrm_MBill.btn_GenInvClick(Sender: TObject);
var
LocateSuccess :Boolean;
SearchOptions: TlocateOptions;
mcount :integer;
mval :real;
begin
Screen.Cursor := crHourglass;
tbl_Minv.Active := false;
tbl_Minv.Exclusive := true;
tbl_Minv.Active := true;
tbl_Minv.EmptyTable;
(*
tbl_Trans.Active := true;
//tbl_Trans.SetRange([edit_From.Field],[edit_From.Field]);
with tbl_Trans do
begin
EditRangeStart; { Set the beginning key }
       FieldByName('TDate').AsDateTime := edit_From.Field.AsDateTime;         //edt_CompsCode.Text;
EditRangeEnd; { Set the ending key }
       FieldByName('TDate').AsDateTime := edit_To.Field.AsDateTime;         //edt_CompsCode.Text;
ApplyRange; { Tell the dataset to establish the range }
end;
*)
qry_Trans.Active := false;
qry_Trans.SQL.Clear;
qry_Trans.SQL.Add('select * from transa where tdate >= :mfr');
qry_Trans.SQL.Add('and tdate <= :mto');
qry_Trans.Parambyname('mfr').AsDateTime := edit_From.Field.AsDateTime;
qry_Trans.Parambyname('mto').AsDateTime := edit_To.Field.AsDateTime;
qry_Trans.Active := true;
qry_Trans.First;

qry_Trans.First;
while Not(qry_Trans.EOF) do
  begin
 SearchOptions := [loCaseInsensitive];
 LocateSuccess := tbl_MCharge.Locate('Type',qry_Trans.FieldByName('Transaction_Type').AsString,SearchOptions);
 if LocateSuccess = TRUE
 then begin
  If (Edit_GetDepart.Text = qry_Trans.FieldByName('Dept_Name').AsString)or(length(Edit_GetDepart.Text) =0) Then
    Begin
      tbl_Minv.Insert;
      tbl_Minv['TDate'] := qry_Trans.FieldByName('TDate').AsDateTime;
      tbl_Minv['TxType'] := qry_Trans.FieldByName('Transaction_Type').AsString;
      tbl_Minv['FileNumber'] := qry_Trans.FieldByName('FileNumber').AsString;
      tbl_Minv['UserId'] := qry_Trans.FieldByName('UserId').AsString;
      tbl_Minv['Warehouse'] := qry_Trans.FieldByName('Warehouse').AsString;
      tbl_Minv['Department'] := qry_Trans.FieldByName('Department').AsString;
      tbl_Minv['Cost'] := qry_Trans.FieldByName('Box').AsString;
      tbl_Minv['Total Cost'] := qry_Trans.FieldByName('Box').AsString;
      tbl_Minv['Dept_Name'] := qry_Trans.FieldByName('Dept_name').AsString;
      tbl_Minv.Post;
    end;
  end;                          //locate success check
  qry_Trans.Next;
  end;
//---------------------------
//------------------------------------------------------
//Add entry for all those files with status 'IN'
//------------------------------------------------------
//Calculate no of Files currently in the system
//------------------------------------------------------
qry_Files.SQL.Clear;
if (length(Edit_GetDepart.Text) > 0 ) then
begin
qry_Files.SQL.Add('select filenumber from files where issuestatus = "IN" and dept_name = :dept');
qry_Files.Params[0].AsString := Edit_GetDepart.Text;
end
else
qry_Files.SQL.Add('select filenumber from files where issuestatus = "IN"');
qry_Files.Active := true;
mcount := qry_Files.RecordCount;
qry_Files.Active := false;
//------------------->>
if mcount > 0 then
begin
 SearchOptions := [loCaseInsensitive];
 LocateSuccess := tbl_MCharge.Locate('Type','IN',SearchOptions);
 if LocateSuccess = TRUE
 then begin
      tbl_Minv.Insert;
      tbl_Minv['TDate'] := Date;
      tbl_Minv['TxType'] := 'IN';
      tbl_Minv['FileNumber'] := 'All';
      tbl_Minv['UserId'] := 'System';
      tbl_Minv['Warehouse'] := 'All';
      tbl_Minv['Department'] := '--';
      tbl_Minv['Cost'] := tbl_MCharge.FieldByName('Box').AsString;
      mval := mcount * tbl_MCharge.FieldByName('Box').AsCurrency;
      tbl_Minv['Total Cost'] := mval;
      if (length(Edit_GetDepart.Text) > 0) then
            tbl_Minv['Dept_Name'] := Edit_GetDepart.Text
      else
            tbl_Minv['Dept_Name'] := 'All';
      tbl_Minv.Post;
  end;                          //locate success check
end;                            //if mcount > 0
//------------------------------------------------------
tbl_Minv.Active := false;
tbl_Minv.Exclusive := false;
tbl_Minv.Active := true;
Screen.Cursor := crDefault;
end;

procedure Tfrm_MBill.btn_PrintClick(Sender: TObject);
var
 PageNum :string;
 Ctr,x,PHeight,LineSpace :integer;
 Cur_Dept   :String[50];
 Totaal     :real;
 Tot        :Currency;
 Flag       :Boolean;

begin
If Rbtn_Detail.Checked = True Then
  BEGIN
    //  Calculate Total Cost;
    Tot := 0;
    tbl_MInv.First;
    While not tbl_MInv.EOF Do
      begin
        Tot := Tot + tbl_MInv.fieldbyname('COST').asCurrency;
        tbl_MInv.Next;
      end;
    tbl_MInv.Last;
    tbl_MInv.edit;
    tbl_MInv.fieldbyname('TOTALCOST').asCurrency := Tot;
    tbl_MInv.Post;
    // Finished Calculating
    Rep1.Print;
  end;
If Rbtn_Sum.Checked = True Then
  Begin
    x := 0;
    Ctr := 1;
    if PrintDialog.Execute then
      begin
        Printer.BeginDoc;
        PHeight := Printer.PageHeight;
        LineSpace :=PHeight DIV 60;
        PageNum := IntToStr(Printer.PageNumber);
        //----------
        Printer.Canvas.TextOut(0,x,'Metro File Summarised Billing');
        x := x + LineSpace;
//        Printer.Canvas.TextOut(0,x,'Date: ' + DateToStr(date) + ' Time: ' + DateToStr(Time));
        x := x + LineSpace;
        Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------------------------');
        x := x + LineSpace;
        x := x + LineSpace;
        Printer.Canvas.TextOut(0,x,'Department');
        Printer.Canvas.TextOut(700,x,'Cost');
        Ctr := Ctr + 1;    //No of lines printed
        x := x + LineSpace;
        Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------------------------');
        Ctr := Ctr + 1;    //No of lines printed
        x := x + LineSpace;
        Cur_Dept := '';
        Flag:= False;
        Totaal := 0;
        tbl_Minv.First;
        while Not(tbl_Minv.EOF) do
          begin
            If Cur_Dept <> tbl_Minv.FieldByName('Dept_Name').AsString Then
              Begin
                If (Flag = True)Then
                  Begin
                    Printer.Canvas.TextOut(700,X,Currtostr(Totaal));
                    x := x + LineSpace;
                  End;
                Printer.Canvas.TextOut(0,x,tbl_Minv.FieldByName('Dept_Name').AsString);
              End;
            Totaal := Totaal + tbl_Minv.FieldByName('Cost').AsCurrency;
            Ctr := Ctr + 1;    //No of lines printed
            if Ctr > 59 then
              begin
                Printer.NewPage;
                x:= 0;
                Ctr := 0;
                PageNum := IntToStr(Printer.PageNumber);
              end;
            Flag := True;
            tbl_Minv.Next;
            Cur_Dept := tbl_Minv.FieldByName('Dept_Name').AsString;
          end;      //do while !eof
        If (Flag = True)AND(Tbl_Minv.eof = True) Then
          Begin
            Printer.Canvas.TextOut(700,X,Currtostrf(Totaal,ffCurrency,2));
          End;
        Printer.EndDoc;
      end;           //PrintDialog.Execute
    //----------
  end;
end;        //end of procedure

procedure Tfrm_MBill.Edit_GetDepartEnter(Sender: TObject);
var
 T  : Integer;
 Ad        :Boolean;
begin
  Ad := false;
  Edit_GetDepart.Items.Clear;
(*
  tbl_trans.Active := True;
  tbl_Trans.First;
*)
qry_Trans.Active := false;
qry_Trans.SQL.Clear;
qry_Trans.SQL.Add('select * from transa');
qry_Trans.Active := true;
qry_Trans.First;
  While Not qry_Trans.eof Do
    Begin
      For T := 0 to edit_GetDepart.Items.Count -1 Do
        Begin
          If qry_Trans.FieldByName('Dept_Name').AsString = edit_GetDepart.Items[T] Then
            Ad := True;
        End;
      If Ad = False Then
        edit_GetDepart.Items.Add(qry_Trans.FieldByName('Dept_Name').AsString)
       Else Ad := False;
      qry_trans.Next;
    End;
  qry_Trans.Active := False;
end;


procedure Tfrm_MBill.QRDBText1Print(sender: TObject; var Value: String);
begin
  If Cur_Dept <> QRDBText1.Caption Then
    QRDBText1.enabled := False
  Else begin
         Cur_Dept := QRDBText1.Caption;
         QRDBText1.enabled := True;
       end;
end;

procedure Tfrm_MBill.ExportCSV(TheTable: TTable);
var
CSVFile :TextFile;
first :Boolean;
i  :integer;
mfile :string;
begin
if SaveFile.Execute then
mfile := SaveFile.FileName;
AssignFile(CSVFile,mfile);
ReWrite(CSVFile);
first := true;
for i := 0 to TheTable.FieldCount -1 do begin
    if not first then Write(CSVFile,',')
    else first  := false;
    Write(CSVFile,TheTable.Fields[i].FieldName);
end;
Writeln(CSVFile);
TheTable.First;
while not TheTable.EOF do
begin
      first := true;
      for i := 0 to TheTable.FieldCount -1 do
      begin
          if not first  then Write(CSVFile,',')
          else first := false;
          if TheTable.Fields[i].DataType = ftString then
             Write(CSVFile,'"' + TheTable.Fields[i].AsString + '"')
          else
          if TheTable.Fields[i].DataType = ftFloat then
              Write(CSVFile,FloatToStrF(TheTable.Fields[i].AsFloat,ffFixed,9,2))
          else
          if TheTable.Fields[i].DataType = ftCurrency then
              Write(CSVFile,FloatToStrF(TheTable.Fields[i].AsFloat,ffFixed,9,2))
          else
              Write(CSVFile,TheTable.Fields[i].AsString);

      end;
       Writeln(CSVFile);
       TheTable.Next;
end;
CloseFile(CSVFile);
TheTable.First;         //return Table to the first record
//TheTable.Active := False;            //Assume table active when called, so leave that way
end;




procedure Tfrm_MBill.BitBtn1Click(Sender: TObject);
begin
Screen.Cursor := crHourGlass;
ExportCSV(tbl_Minv);           //found in ibill
Screen.Cursor := crDefault;
MessageDlg('The .CSV file has been created successfully.',mtInformation,[mbOK],0);
end;


procedure Tfrm_MBill.tbl_MinvAfterPost(DataSet: TDataSet);
begin
tbl_MInv.Close;
tbl_MInv.Open;
end;

procedure Tfrm_MBill.tbl_MChargeAfterPost(DataSet: TDataSet);
begin
tbl_MCharge.Close;
tbl_MCharge.Open;
end;

end.
