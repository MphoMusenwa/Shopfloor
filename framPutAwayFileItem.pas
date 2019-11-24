//============================================================\\
//===Platform: Windows
//===Development Tool:  Borland® Developer Studio Enterprise
//===Database Connectivity:  ADO
//============================================================\\
unit framPutAwayFileItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Printers, DB, DBTables, ADODB, ExtCtrls;

type
  Tfram_PutAwayFileItem = class(TFrame)
    PrintDialog: TPrintDialog;
    OpenDialog: TOpenDialog;
    qry_SQL: TADOQuery;
    qry_SecureScan: TADOQuery;
    Panel1: TPanel;
    lbl_05: TLabel;
    lbl_03: TLabel;
    edt_LocNo: TEdit;
    edt_Barcode: TEdit;
    btn_AddToBatchList: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    lbl_WHouse: TLabel;
    Label31: TLabel;
    edt_WHouse: TEdit;
    btn_GetWHouse: TButton;
    cb_LocSize: TComboBox;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    lb_Batch: TListBox;
    btn_ProcessBatch: TBitBtn;
    btn_ClearBatch: TBitBtn;
    btn_LaunchScanner: TBitBtn;
    btn_PrintBatch: TBitBtn;
    GroupBox5: TGroupBox;
    lb_Sucess: TListBox;
    btn_PrintSucess: TBitBtn;
    btn_ClearSucess: TBitBtn;
    GroupBox14: TGroupBox;
    lb_Error: TListBox;
    btn_PrintError: TBitBtn;
    btn_ClearError: TBitBtn;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    procedure btn_PrintErrorClick(Sender: TObject);
    procedure btn_ClearErrorClick(Sender: TObject);
    procedure btn_PrintSucessClick(Sender: TObject);
    procedure btn_ClearSucessClick(Sender: TObject);
    procedure btn_ClearBatchClick(Sender: TObject);
    procedure btn_LaunchScannerClick(Sender: TObject);
    procedure btn_ProcessBatchClick(Sender: TObject);
    procedure edt_WHouseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_GetWHouseClick(Sender: TObject);
    procedure btn_AddToBatchListClick(Sender: TObject);
    procedure lb_BatchClick(Sender: TObject);
    procedure lb_SucessClick(Sender: TObject);
    procedure lb_ErrorClick(Sender: TObject);
    procedure btn_PrintBatchClick(Sender: TObject);
    procedure edt_BarcodeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure ImportScanner(ImpAud :Boolean); //True = Audit
    procedure PrintList(lb_Print :TListBox; Title  :String);
  public
    { Public declarations }
  end;

implementation

uses DataModCap, main, SelWHouse, MetrofilerDataModule;

{$R *.dfm}

procedure Tfram_PutAwayFileItem.btn_PrintBatchClick(Sender: TObject);
begin
  PrintList(lb_Batch, 'Putaway List');
end;

procedure Tfram_PutAwayFileItem.btn_PrintErrorClick(Sender: TObject);
begin
  PrintList(lb_Error, 'Putaway Error List');
end;

procedure Tfram_PutAwayFileItem.btn_ClearErrorClick(Sender: TObject);
begin
  If MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
    lb_Error.Items.Clear
end;

procedure Tfram_PutAwayFileItem.btn_PrintSucessClick(Sender: TObject);
begin
  PrintList(lb_Sucess, 'Putaway Success List');
end;

procedure Tfram_PutAwayFileItem.btn_ClearSucessClick(Sender: TObject);
begin
  If MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
    lb_Sucess.Items.Clear
end;

procedure Tfram_PutAwayFileItem.btn_ClearBatchClick(Sender: TObject);
begin
  If MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
    lb_Batch.Items.Clear
end;

procedure Tfram_PutAwayFileItem.btn_LaunchScannerClick(Sender: TObject);
var
 Filename       :String;
 I              :Cardinal;
begin
  qry_SecureScan.Active := False;
  qry_SecureScan.SQl.Clear;
  qry_SecureScan.Sql.Add('SELECT * FROM AuthCodes WHERE USERID = :ID');
  qry_SecureScan.Parameters.ParamByName('ID').Value := ftString;
  qry_SecureScan.Parameters.ParamByName('ID').Value := User;
  qry_SecureScan.Active := True;
  Filename := qry_SecureScan.FieldbyName('ScanEXE').AsString;
  qry_SecureScan.Active := False;
  dm_Metrofiler.ShellExecAndWait(FileName, '', SW_MAXIMIZE, I);
//-------------
  ImportScanner(false);
end;

procedure Tfram_PutAwayFileItem.btn_ProcessBatchClick(Sender: TObject);
var
  i, t, mlen           :integer;
  mchars,mpos          :integer;
  mLocNo,mFileBcode    :string;
  Warehouse            :String;
  TempTableXML         :String;
begin
  If (length(edt_WHouse.Text) = 0) Then
    begin
      MessageDlg('Please select a Filing Area to use for the Batch put away',mtInformation,[mbOK],0);
      exit;
    end;
  Screen.Cursor := crHourglass;
  Warehouse := edt_WHouse.Text;
  TempTableXML := '<PutAways>';
  try
    t := 0;
    for i := 0 to lb_Batch.Items.Count - 1 do
      begin
        mpos := Pos('>',lb_Batch.Items[i]);
        mchars := mpos - 5;                   // _---> get position
        mLocNo := Copy(lb_Batch.Items[i],1,mchars);
//-------
        mchars := (length(lb_Batch.Items[i]) - mpos);
        Inc(mpos);
        mFileBcode := Copy(lb_Batch.Items[i],mpos,mchars);
//-------
        If cb_LocSize.ItemIndex = 1 Then //7 digits
          begin
            mlen := length(trim(mLocNo));    //length of scanned location
            mpos := mlen - 7;                           //row + bay + level = 7
            If mPos < 0 Then                           //row + bay + level = 7
              mPos := 0;
            mLocNo := copy(trim(mLocNo),(mpos+1),7);
          end
        else If cb_LocSize.ItemIndex = 0 Then
          begin
            mlen := length(trim(mLocNo));    //length of scanned location
            mpos := mlen - 6;                           //row + bay + level = 6
            mLocNo := Copy(trim(mLocNo),(mpos+1),6);
          end
        else If cb_LocSize.ItemIndex = 2 Then
          begin
            mlen := length(trim(mLocNo));    //length of scanned location
            mpos := mlen - 7;                           //row + bay + level = 7
            If mPos < 0 Then                           //row + bay + level = 7
              mPos := 0;
            mLocNo := Copy(trim(mLocNo),(mpos+1),7);
          end;
//-------

        //----------Header------------------
        Inc(t);
        TempTableXML := TempTableXML + '<PutAway';
        //----------TrxNo------------------
        TempTableXML := TempTableXML + ' TrxNo="'+InttoStr(t)+'"';
        //----------Barcode------------------
        TempTableXML := TempTableXML + ' Barcode="'+mFileBcode+'"';
        //----------Warehouse------------------
        TempTableXML := TempTableXML + ' Warehouse="'+Warehouse+'"';
        //----------LocNo------------------
        TempTableXML := TempTableXML + ' LocNo="'+mLocNo+'"';
        //----------Footer------------------
        TempTableXML := TempTableXML + ' />';
      end;
    TempTableXML := TempTableXML + '</PutAways>';
//-------Process Temp Table and retrieve Results--------------------------------
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('EXEC [ap_ProcessBatchPutawaysFilesItems] :TableName, :UserId');
    qry_SQL.Parameters.ParamValues['TableName'] := TempTableXML;
    qry_SQL.Parameters.ParamValues['UserID'] := User;
    qry_SQL.Open;
//------------Now append result to lists----------------------------------------
    qry_SQL.First;
    While not qry_SQL.EOF Do
      begin
        If qry_SQL.FieldByName('TxResult').AsString <> 'OK' Then
          lb_Error.Items.Append(qry_SQL.FieldByName('TxResult').AsString)
        else
          lb_Sucess.Items.Append(qry_SQL.FieldByName('Barcode').AsString+' -> Location '+qry_SQL.FieldByName('Warehouse').AsString+'/ '+qry_SQL.FieldByName('LocNo').AsString+'.');
        qry_SQL.Next;
      end;
    MessageDlg('Batch processing complete',mtInformation,[mbOK],0);
  finally
    Screen.Cursor := crDefault;
    qry_SQL.Close;
  end;
end;

procedure Tfram_PutAwayFileItem.edt_BarcodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  If ord(Key) = 13 Then
    begin
      btn_AddToBatchListClick(Self);
      edt_Barcode.Text := '';
      edt_Barcode.SetFocus;
      abort;
    end;
end;

procedure Tfram_PutAwayFileItem.edt_WHouseKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_WHouse.Text := '';
      lbl_WHouse.Caption := '---';
    end;
end;

procedure Tfram_PutAwayFileItem.btn_GetWHouseClick(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  frm_SelWHouse.Flag3D := 0;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_WHouse.Text := trim(frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString);
      lbl_WHouse.Caption := trim(frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString);
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfram_PutAwayFileItem.btn_AddToBatchListClick(Sender: TObject);
var
  J   :Integer;
  mBarcode, mLocation   :String;
  ExistFlag    :Boolean;
begin
  If edt_WHouse.Text = '' Then
    begin
      Messagedlg('Please select a Filing Area.', mtInformation, [mbOK], 0);
      exit;
    end;
  If edt_LocNo.Text = '' Then
    begin
      Messagedlg('Please enter a Location.', mtInformation, [mbOK], 0);
      exit;
    end;
  If edt_Barcode.Text = '' Then
    begin
      Messagedlg('Please scan/enter a Barcode.', mtInformation, [mbOK], 0);
      exit;
    end;

  mBarcode := trim(UpperCase(edt_Barcode.Text));
  mLocation := trim(UpperCase(edt_LocNo.Text));
  ExistFlag := False;
  For J := 0 to lb_Batch.Items.Count-1 Do
    begin

      If mBarcode = lb_Batch.Items.Strings[J] Then
        begin
          Messagedlg('Cannot add Barcode '+mBarcode+' to List. It''s been scanned twice.', mtInformation, [mbOK], 0);
          ExistFlag := True;
          Break;
        end;
    end;
  If not ExistFlag Then
    begin
      lb_Batch.Items.Add(mLocation + ' --->' + mBarcode);
    end;
  edt_Barcode.Text := '';
  edt_Barcode.SetFocus;
end;

procedure Tfram_PutAwayFileItem.ImportScanner(ImpAud :Boolean);
var
  mpos             :integer;
  mchars           :integer;
  mloc             :string;
  mbarcode         :string;
  TempStr          :string;
  F                :TextFile;
begin
  If OpenDialog.Execute Then
    begin
      AssignFile(F,OpenDialog.FileName);
      try
        Reset(F);
        While Not Eof(F) do
          begin
            Readln(F,TempStr);
            mpos := Pos(',',TempStr);
            mchars := mpos - 1;                   //get position of '
            mloc := Copy(TempStr,1,mchars);
            MLOC := trim(mloc);
     //-----------------
            mchars := (length(TempStr) - mpos);
            Inc(mpos,1);
            mbarcode := Copy(TempStr,mpos,mchars);
            lb_Batch.Items.Add(mloc + ' --->' + mbarcode);
          end;
      finally
        CloseFile(F);
      end;
    end;
end;

procedure Tfram_PutAwayFileItem.lb_BatchClick(Sender: TObject);
Var
  B, S, E     :Integer;
  Barcode     :String;
begin
  For S := 0 to lb_Sucess.Items.Count-1 Do
    lb_Sucess.Selected[S] := False;

  For E := 0 to lb_Error.Items.Count-1 Do
    lb_Error.Selected[E] := False;
//---------
  For B := 0 to lb_Batch.Items.Count-1 Do
    begin
      If lb_Batch.Selected[B] Then
        begin
          Barcode := lb_Batch.Items.Strings[B];
          Barcode := trim(copy(Barcode, pos('--->', Barcode)+4, 1000));
          For S := 0 to lb_Sucess.Items.Count-1 Do
            begin
              If copy(lb_Sucess.Items.Strings[S], 1, pos(' ->', lb_Sucess.Items.Strings[S])-1) = Barcode Then
                lb_Sucess.Selected[S] := True;
            end;
          For E := 0 to lb_Error.Items.Count-1 Do
            begin
              If copy(lb_Error.Items.Strings[E], 1, pos(' ->', lb_Error.Items.Strings[E])-1) = Barcode Then
                lb_Error.Selected[E] := True;
            end;
        end;
    end;
end;

procedure Tfram_PutAwayFileItem.lb_ErrorClick(Sender: TObject);
Var
  B, S, E     :Integer;
  Barcode     :String;
begin
  For B := 0 to lb_Batch.Items.Count-1 Do
    lb_Batch.Selected[B] := False;

  For S := 0 to lb_Sucess.Items.Count-1 Do
    lb_Sucess.Selected[S] := False;
//---------
  For E := 0 to lb_Error.Items.Count-1 Do
    begin
      If lb_Error.Selected[E] Then
        begin
          For B := 0 to lb_Batch.Items.Count-1 Do
            begin
              Barcode := lb_Batch.Items.Strings[B];
              Barcode := trim(copy(Barcode, pos('--->', Barcode)+4, 1000));

              If copy(lb_Error.Items.Strings[E], 1, pos(' ->', lb_Error.Items.Strings[E])-1) = Barcode Then
                lb_Batch.Selected[B] := True;
            end;
        end;
    end;
end;

procedure Tfram_PutAwayFileItem.lb_SucessClick(Sender: TObject);
Var
  B, S, E     :Integer;
  Barcode     :String;
begin
  For B := 0 to lb_Batch.Items.Count-1 Do
    lb_Batch.Selected[B] := False;

  For E := 0 to lb_Error.Items.Count-1 Do
    lb_Error.Selected[E] := False;
//---------
  For S := 0 to lb_Sucess.Items.Count-1 Do
    begin
      If lb_Sucess.Selected[S] Then
        begin
          For B := 0 to lb_Batch.Items.Count-1 Do
            begin
              Barcode := lb_Batch.Items.Strings[B];
              Barcode := trim(copy(Barcode, pos('--->', Barcode)+4, 1000));

              If copy(lb_Sucess.Items.Strings[S], 1, pos(' ->', lb_Sucess.Items.Strings[S])-1) = Barcode Then
                lb_Batch.Selected[B] := True;
            end;
        end;
    end;
end;


procedure Tfram_PutAwayFileItem.PrintList(lb_Print :TListBox; Title  :String);
Var
  PageNum                 :string;
  Ctr,x,PHeight,LineSpace :integer;
  J                       :integer;
  PrintOnlySelected       :Boolean;
begin
  x := 0;
  Ctr := 0;
  if PrintDialog.Execute then
    begin
      Printer.BeginDoc;
      PHeight := Printer.PageHeight;
      LineSpace :=PHeight DIV 60;
      PageNum := IntToStr(Printer.PageNumber);
      //----------
      Printer.Canvas.TextOut(0,x, Title);
      x := x + LineSpace;
      x := x + LineSpace;
      Ctr := Ctr + 2;
      Printer.Canvas.TextOut(0,x,'Date: ' + DateToStr(date) + ' Time: ' + DateToStr(Time));
      x := x + LineSpace;
      Ctr := Ctr + 1;
      Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------------------------');
      x := x + LineSpace;
      x := x + LineSpace;
      Ctr := Ctr + 2;

      If lb_Print.SelCount = 0 Then
        PrintOnlySelected := false
      else PrintOnlySelected := (Messagedlg('Do you only want to print selected Items? Select [NO] to print everything.', mtConfirmation, [mbYes, mbNo], 0) = mrYes);

      For J := 0 to lb_Print.Items.Count-1 Do
        begin
          If (PrintOnlySelected = false)OR((PrintOnlySelected)AND(lb_Print.Selected[J])) Then
            Printer.Canvas.TextOut(0,x,lb_Print.Items.Strings[J]);
          x := x + LineSpace;
          Ctr := Ctr + 1;
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

end.
