//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit Receiving;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables, Printers, ADODB;

type
  Tfrm_Receiving = class(TForm)
    pnl_Top: TPanel;
    Panel1: TPanel;
    lbl_03: TLabel;
    edt_Barcode: TEdit;
    btn_SingleProcess: TBitBtn;
    Panel2: TPanel;
    GroupBox11: TGroupBox;
    lst_Succ: TListBox;
    GroupBox15: TGroupBox;
    lst_Err: TListBox;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    Panel4: TPanel;
    BitBtn4: TBitBtn;
    qry_SQL: TADOQuery;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    PrintDialog: TPrintDialog;
    qry_IU: TADOQuery;
    btn_Close: TSpeedButton;
    qry_CheckType: TADOQuery;
    qry_GetBarcodeDetails: TADOQuery;
    procedure btn_SingleProcessClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edt_BarcodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Receiving: Tfrm_Receiving;

implementation

uses main, MetrofilerDatamodule;

{$R *.dfm}

procedure Tfrm_Receiving.btn_SingleProcessClick(Sender: TObject);
Var
  ScannedBarcode               :String;
  Stat                         :String;
begin
  ScannedBarcode := trim(edt_Barcode.Text);
  If ScannedBarcode = '' Then
    begin
      Messagedlg('Please scan a valid Barcode!!', mtWarning, [mbOK], 0);
      edt_Barcode.SetFocus;
      exit;
    end;
  try
//============Check Barcode=====================================================
    qry_GetBarcodeDetails.Close;
    qry_GetBarcodeDetails.Parameters.ParamByName('Barcode').Value := ScannedBarcode;
    qry_GetBarcodeDetails.Open;

    If qry_GetBarcodeDetails.IsEmpty Then
      begin
        lst_Err.Items.Append('Barcode '+ScannedBarcode+' not found.');
        MessageDlg('Barcode '+ScannedBarcode+' not found.', mtInformation, [mbOK], 0);
        exit;
      end;
  //-----
    If UpperCase(qry_GetBarcodeDetails.Fields[0].FieldName) = 'CONTAINER' Then
      begin
        If ((qry_GetBarcodeDetails.FieldByName('IssueStatus').AsString = 'MIN') or (qry_GetBarcodeDetails.FieldByName('IssueStatus').AsString = 'MET')) then
          begin
            If MessageDlg('Container "'+ScannedBarcode+'" is flagged for off-site storage!! Would you like to Reinstate this Container?',mtConfirmation,[mbYes, mbNo],0) = mrNo Then
              begin
                lst_Err.Items.Append('Container "'+ScannedBarcode+'" Off-Site');
                MessageDlg('Container "'+ScannedBarcode+'" is flagged for off-site storage!!',mtError,[mbOK],0);
                exit;
              end;
          end;
//===========================================================================
        If (qry_GetBarcodeDetails.FieldByName('IssueStatus').AsString = 'PW') then
          begin
            If MessageDlg('Container "'+ScannedBarcode+'" permanently withdrawn!! Would you like to Reinstate this Container?',mtConfirmation,[mbYes, mbNo],0) = mrNo Then
              begin
                lst_Err.Items.Append('Container "'+ScannedBarcode+'" permanently withdrawn');
                MessageDlg('Container "'+ScannedBarcode+'" has been permanently withdrawn!!',mtError,[mbOK],0);
                exit;
              end;
          end;
//===========================================================================
        If (qry_GetBarcodeDetails.FieldByName('IssueStatus').AsString = 'DES') then
          begin
            If MessageDlg('Container "'+ScannedBarcode+'" destroyed!! Would you like to Reinstate this Container?',mtConfirmation,[mbYes, mbNo],0) = mrNo Then
              begin
                lst_Err.Items.Append('Container "'+ScannedBarcode+'" destroyed');
                MessageDlg('Container "'+ScannedBarcode+'" has been destroyed!!',mtError,[mbOK],0);
                exit;
              end;
          end;
//===========================================================================
        If qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'IN' Then
          begin
            lst_Err.Items.Append('Container "'+ScannedBarcode+'" Already Returned');
            Messagedlg('Container "'+ScannedBarcode+'" Already Returned!!', mtWarning, [mbOK], 0);
            exit;
          end;
//===========================================================================
        If qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'REC' Then
          begin
            lst_Err.Items.Append('Container "'+ScannedBarcode+'" Already Received');
            Messagedlg('Container "'+ScannedBarcode+'" Already Received!!', mtWarning, [mbOK], 0);
            exit;
          end;
//===========================================================================
        If (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'OUT')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'PW')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'DES')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'MET')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'MIN')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'NF')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> '')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'INUSE')THEN
          begin
            lst_Err.Items.Append('Invalid Status to receive Container "'+ScannedBarcode+'"');
            Messagedlg('Invalid Status to receive Container "'+ScannedBarcode+'"', mtWarning, [mbOK], 0);
            exit;
          end;
//-------
        if ((qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'OUT')OR
            (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'INUSE'))AND
            (frm_Console.TrackandTraceActive = 1) Then
          begin
            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('SELECT ReqNo FROM RequisitionQue WHERE Completed = 0 AND Barcode = :Barcode');
            qry_SQL.Parameters.ParamByName('Barcode').Value := ScannedBarcode;
            qry_SQL.Open;
            if not qry_SQL.IsEmpty then
              begin
                lst_Err.Items.Append('Container "'+ScannedBarcode+'" has not reached all Track and Trace destinations yet.');
                Messagedlg('Container "'+ScannedBarcode+'" has not reached all Track and Trace destinations yet.', mtWarning, [mbOK], 0);
                exit;
              end;
          end
        else
          begin
            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('UPDATE RequisitionQue SET Completed = 1 WHERE Barcode = :Barcode');
            qry_SQL.Parameters.ParamByName('Barcode').Value := ScannedBarcode;
            qry_SQL.ExecSQL;
          end;
//-------
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('UPDATE Containers SET IssueStatus = :IssueStatus, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE() WHERE Container = :Container');
        qry_SQL.Parameters.ParamByName('IssueStatus').Value := 'REC';
        qry_SQL.Parameters.ParamByName('Container').Value := ScannedBarcode;
        qry_SQL.ExecSQL;
//-------
        lst_Succ.Items.Append('Container "'+ScannedBarcode+'" Received');
      end;
    If UpperCase(qry_GetBarcodeDetails.Fields[0].FieldName) = 'FILENUMBER' Then
      begin
        If ((qry_GetBarcodeDetails.FieldByName('IssueStatus').AsString = 'MIN') or (qry_GetBarcodeDetails.FieldByName('IssueStatus').AsString = 'MET')) then
          begin
            If MessageDlg('File "'+ScannedBarcode+'" Off-Site. Would you like to Reinstate this File?',mtConfirmation,[mbYes, mbNo],0) = mrNo Then
              begin
                lst_Err.Items.Append('File "'+ScannedBarcode+'" Off-Site');
                MessageDlg('File "'+ScannedBarcode+'" is flagged for off-site storage!!',mtError,[mbOK],0);
                exit;
              end;
          end;
//===========================================================================
        If (qry_GetBarcodeDetails.FieldByName('IssueStatus').AsString = 'PW') then
          begin
            If MessageDlg('File "'+ScannedBarcode+'" permanently withdrawn. Would you like to Reinstate this File?',mtConfirmation,[mbYes, mbNo],0) = mrNo Then
              begin
                lst_Err.Items.Append('File "'+ScannedBarcode+'" permanently withdrawn');
                MessageDlg('File "'+ScannedBarcode+'" has been permanently withdrawn!!',mtError,[mbOK],0);
                exit;
              end;
          end;
//===========================================================================
        If (qry_GetBarcodeDetails.FieldByName('IssueStatus').AsString = 'DES') then
          begin
            If MessageDlg('File "'+ScannedBarcode+'" destroyed. Would you like to Reinstate this File?',mtConfirmation,[mbYes, mbNo],0) = mrNo Then
              begin
                lst_Err.Items.Append('File "'+ScannedBarcode+'" destroyed');
                MessageDlg('File "'+ScannedBarcode+'" has been destroyed!!',mtError,[mbOK],0);
                exit;
              end;
          end;
//===========================================================================
        If qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'IN' Then
          begin
            lst_Err.Items.Append('File "'+ScannedBarcode+'" Already Returned');
            Messagedlg('File "'+ScannedBarcode+'" Already Returned!!', mtWarning, [mbOK], 0);
            exit;
          end;
//===========================================================================
        If qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'REC' Then
          begin
            lst_Err.Items.Append('File "'+ScannedBarcode+'" Already Received');
            Messagedlg('File "'+ScannedBarcode+'" Already Received!!', mtWarning, [mbOK], 0);
            exit;
          end;
   {     If (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'INUSE')OR
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'INUSEI')Then
          begin
            qry_IU.Close;
            qry_IU.SQL.Clear;
            qry_IU.SQL.Add('SELECT Itemnumber FROM Items WHERE Filenumber = :Filenumber AND Status IN (''IU'', ''IUI'')');
            qry_IU.Parameters.ParamByName('Filenumber').Value := ScannedBarcode;
            qry_IU.Open;
            If not qry_IU.IsEmpty Then
              begin
                qry_IU.Close;
                lst_Err.Items.Append('INUSE File "'+ScannedBarcode+'" has Items with Status INUSE.');
                Messagedlg('INUSE File "'+ScannedBarcode+'" has Items with Status INUSE.', mtWarning, [mbOK], 0);
                exit;
              end;
            qry_IU.Close;
          end;}
//===========================================================================
        If (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'OUT')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'OUTI')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'RI')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'PW')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'INUSE')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'INUSEI')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'MIN')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'MET')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'DES')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'NF')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'FOUT')THEN
          begin
            lst_Err.Items.Append('Invalid Status to receive File "'+ScannedBarcode+'"');
            Messagedlg('Invalid Status to receive File "'+ScannedBarcode+'"', mtWarning, [mbOK], 0);
            exit;
          end;
//-------
        Stat := qry_GetBarcodeDetails.FieldbyName('ISSUESTATUS').AsString;
//-------
        if ((qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'OUTI')OR
            (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'OUT')OR
            (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'INUSE')OR
            (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'INUSEI'))AND
            (frm_Console.TrackandTraceActive = 1) Then
          begin
            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('SELECT ReqNo FROM RequisitionQue WHERE Completed = 0 AND Barcode = :Barcode');
            qry_SQL.Parameters.ParamByName('Barcode').Value := ScannedBarcode;
            qry_SQL.Open;
            if not qry_SQL.IsEmpty then
              begin
                lst_Err.Items.Append('File "'+ScannedBarcode+'" has not reached all Track and Trace destinations yet.');
                Messagedlg('File "'+ScannedBarcode+'" has not reached all Track and Trace destinations yet.', mtWarning, [mbOK], 0);
                exit;
              end;
          end
        else
          begin
            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('UPDATE RequisitionQue SET Completed = 1 WHERE Barcode = :Barcode AND Completed = 0');
            qry_SQL.Parameters.ParamByName('Barcode').Value := ScannedBarcode;
            qry_SQL.ExecSQL;
          end;
//-------
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('UPDATE Files SET IssueStatus = :IssueStatus, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE() WHERE Filenumber = :Filenumber');
        If Stat = 'FOUT' Then
          qry_SQL.Parameters.ParamByName('IssueStatus').Value := 'FREC'
        else qry_SQL.Parameters.ParamByName('IssueStatus').Value := 'REC';
        qry_SQL.Parameters.ParamByName('Filenumber').Value := ScannedBarcode;
        qry_SQL.ExecSQL;
        lst_Succ.Items.Append('File "'+ScannedBarcode+'" Received');
      end;
    If UpperCase(qry_GetBarcodeDetails.Fields[0].FieldName) = 'ITEMNUMBER' Then
      begin
        If qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'PW' Then
          begin
            If MessageDlg('Item "'+ScannedBarcode+'" permanently withdrawn. Would you like to Reinstate this Item?',mtConfirmation,[mbYes, mbNo],0) = mrNo Then
              begin
                lst_Err.Items.Append('Item "'+ScannedBarcode+'" permanently withdrawn');
                Messagedlg('Item "'+ScannedBarcode+'" permanently withdrawn!!', mtWarning, [mbOK], 0);
                exit;
              end;
          end;
        If qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'DS' Then
          begin
            If MessageDlg('Item "'+ScannedBarcode+'" destroyed. Would you like to Reinstate this Item?',mtConfirmation,[mbYes, mbNo],0) = mrNo Then
              begin
                lst_Err.Items.Append('Item "'+ScannedBarcode+'" Destroyed');
                Messagedlg('Item "'+ScannedBarcode+'" Destroyed!!', mtWarning, [mbOK], 0);
                exit;
              end;
          end;
//===========================================================================
        If qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'I' Then
          begin
            lst_Err.Items.Append('Item "'+ScannedBarcode+'" Already Returned');
            Messagedlg('Item "'+ScannedBarcode+'" Already Returned!!', mtWarning, [mbOK], 0);
            exit;
          end;
//===========================================================================
        If qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'R' Then
          begin
            lst_Err.Items.Append('Item "'+ScannedBarcode+'" Already Received');
            Messagedlg('Item "'+ScannedBarcode+'" Already Received!!', mtWarning, [mbOK], 0);
            exit;
          end;
//===========================================================================
        If (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'O')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'OI')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'PW')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'DS')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'IU')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'IUI')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'MET')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'NF')AND
           (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString <> 'P')Then
          begin
            lst_Err.Items.Append('Invalid Status to receive Item "'+ScannedBarcode+'"');
            Messagedlg('Invalid Status to receive Item "'+ScannedBarcode+'"', mtWarning, [mbOK], 0);
            exit;
          end;
//-------
        if ((qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'OI')OR
            (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'O')OR
            (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'IU')OR
            (qry_GetBarcodeDetails.FieldbyName('IssueStatus').AsString = 'IUI'))AND
            (frm_Console.TrackandTraceActive = 1) Then
          begin
            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('SELECT ReqNo FROM RequisitionQue WHERE Completed = 0 AND Barcode = :Barcode');
            qry_SQL.Parameters.ParamByName('Barcode').Value := ScannedBarcode;
            qry_SQL.Open;
            if not qry_SQL.IsEmpty then
              begin
                lst_Err.Items.Append('Item "'+ScannedBarcode+'" has not reached all Track and Trace destinations yet.');
                Messagedlg('Item "'+ScannedBarcode+'" has not reached all Track and Trace destinations yet.', mtWarning, [mbOK], 0);
                exit;
              end;
          end
        else
          begin
            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('UPDATE RequisitionQue SET Completed = 1 WHERE Barcode = :Barcode AND Completed = 0');
            qry_SQL.Parameters.ParamByName('Barcode').Value := ScannedBarcode;
            qry_SQL.ExecSQL;
          end;
//-------
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('UPDATE Items SET Status = :Status, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE() WHERE Itemnumber = :Itemnumber');
        qry_SQL.Parameters.ParamByName('Status').Value := 'R';
        qry_SQL.Parameters.ParamByName('Itemnumber').Value := ScannedBarcode;
        qry_SQL.ExecSQL;
        lst_Succ.Items.Append('Item "'+ScannedBarcode+'" Received');
      end;
  finally
    qry_SQL.Close;
    qry_GetBarcodeDetails.Close;
    edt_Barcode.Text := '';
    edt_Barcode.SetFocus;
  end;
end;

procedure Tfrm_Receiving.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    lst_Succ.Clear;
end;

procedure Tfrm_Receiving.BitBtn4Click(Sender: TObject);
begin
  if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    lst_Err.Clear;
end;

procedure Tfrm_Receiving.BitBtn1Click(Sender: TObject);
Var
  PageNum :string;
  Ctr,x,PHeight,LineSpace :integer;
  ListTot,J               :integer;
begin
  x := 0;
  Ctr := 1;
  if PrintDialog.Execute then
    begin
      Printer.BeginDoc;
      PHeight := Printer.PageHeight;
      LineSpace :=PHeight DIV 60;
      PageNum := IntToStr(Printer.PageNumber);
      //----------
      Printer.Canvas.TextOut(0,x,'Success List');
      x := x + LineSpace;
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'Date: ' + DateToStr(date) + ' Time: ' + DateToStr(Time));
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------------------------');
      x := x + LineSpace;
      x := x + LineSpace;
      ListTot := lst_Succ.Items.Count;
      For J := 0 to ListTot-1 Do
        begin
          Printer.Canvas.TextOut(0,x,lst_Succ.Items.Strings[J]);
          Ctr := Ctr + 1;    //No of lines printed
          x := x + LineSpace;
          if Ctr > 59 then
            begin
              Printer.NewPage;
              x:= 0;
              Ctr := 0;
              PageNum := IntToStr(Printer.PageNumber);
            end;
        end;
      Printer.EndDoc;
    end;           //PrintDialog.Execute
end;

procedure Tfrm_Receiving.BitBtn2Click(Sender: TObject);
Var
  PageNum :string;
  Ctr,x,PHeight,LineSpace :integer;
  ListTot,J               :integer;
begin
  x := 0;
  Ctr := 1;
  if PrintDialog.Execute then
    begin
      Printer.BeginDoc;
      PHeight := Printer.PageHeight;
      LineSpace :=PHeight DIV 60;
      PageNum := IntToStr(Printer.PageNumber);
      //----------
      Printer.Canvas.TextOut(0,x,'Error List');
      x := x + LineSpace;
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'Date: ' + DateToStr(date) + ' Time: ' + DateToStr(Time));
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------------------------');
      x := x + LineSpace;
      x := x + LineSpace;
      ListTot := lst_Err.Items.Count;
      For J := 0 to ListTot-1 Do
        begin
          Printer.Canvas.TextOut(0,x,lst_Err.Items.Strings[J]);
          Ctr := Ctr + 1;    //No of lines printed
          x := x + LineSpace;
          if Ctr > 59 then
            begin
              Printer.NewPage;
              x:= 0;
              Ctr := 0;
              PageNum := IntToStr(Printer.PageNumber);
            end;
        end;
      Printer.EndDoc;
    end;           //PrintDialog.Execute
end;

procedure Tfrm_Receiving.edt_BarcodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    btn_SingleProcessClick(Self);
end;

procedure Tfrm_Receiving.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_SQL.Close;
  qry_GetBarcodeDetails.Close;
  frm_Console.act_Rec.Enabled := True;
  Action := caFree;
end;

procedure Tfrm_Receiving.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

end.

