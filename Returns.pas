//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit Returns;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, TabNotBk, StdCtrls, Buttons, ExtCtrls, DB, DBTables,
  Grids, DBGrids, Mask, DBCtrls, ComCtrls,Printers, WinSpool,
  Variants, ADODB;

const
 cINIFile = 'METROFIL.INI';

type
  Tfrm_Returns = class(TForm)
    pnl_Top: TPanel;
    OpenDialog: TOpenDialog;
    PrintDialog: TPrintDialog;
    qry_Barcode: TADOQuery;
    qry_Location: TADOQuery;
    qry_SecureScan: TADOQuery;
    qry_Items: TADOQuery;
    sp_Reserial: TADOStoredProc;
    qry_Flagmail: TADOQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label75: TLabel;
    Label76: TLabel;
    BitBtn11: TBitBtn;
    edt_Con: TEdit;
    edt_RecNo: TEdit;
    BitBtn12: TBitBtn;
    GroupBox12: TGroupBox;
    lb_RecInContBatch: TListBox;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    qry_ContainersMain: TADOQuery;
    btn_GetOldContainer: TBitBtn;
    sp_StoreBox: TADOStoredProc;
    qry_InsertHist: TADOQuery;
    qry_InsertMail: TADOQuery;
    GroupBox2: TGroupBox;
    lb_RecInContSucc: TListBox;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox3: TGroupBox;
    lb_RecInContErr: TListBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    qry_DefLocLen: TADOQuery;
    BitBtn18: TBitBtn;
    qry_SQL: TADOQuery;
    btn_Close: TSpeedButton;
    Panel1: TPanel;
    lbl_03: TLabel;
    lbl_05: TLabel;
    Label41: TLabel;
    lbl_WHouse: TLabel;
    Label1: TLabel;
    edt_Barcode: TEdit;
    edt_Location: TEdit;
    btn_SingleProcess: TBitBtn;
    btn_AddToList: TBitBtn;
    edt_WHouse: TEdit;
    btn_SelWHouse: TButton;
    cb_LocType: TComboBox;
    mem_Reserial: TMemo;
    qry_CheckType: TADOQuery;
    qry_ReSerial: TADOQuery;
    GroupBox1: TGroupBox;
    lb_Batch: TListBox;
    btn_ProcessBatch: TBitBtn;
    btn_Clear: TBitBtn;
    btn_Scannerfile: TBitBtn;
    btn_PrintBatch: TBitBtn;
    GroupBox11: TGroupBox;
    lb_Sucess: TListBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox15: TGroupBox;
    lb_Error: TListBox;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_AddToListClick(Sender: TObject);
    procedure btn_SingleProcessClick(Sender: TObject);
    procedure btn_ProcessBatchClick(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
    procedure btn_ScannerfileClick(Sender: TObject);
    function ExecuteFile(const FileName, Params, DefaultDir: string;
         ShowCmd: Integer): THandle;
    procedure btn_PrintBatchClick(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure btn_GetOldContainerClick(Sender: TObject);
    procedure btn_SelWHouseClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private { Private declarations }
    DefLocLen  :Smallint;
    Is3DWarehouse :Boolean;
    procedure ReturnContainer(Container, WHouse :String; ShowErrorDlg:Boolean);
    procedure ReturnFile(Filenumber, WHouse, LocNo :String; ShowErrorDlg:Boolean);
    procedure ReturnItem(Itemnumber, WHouse, LocNo :String; ShowErrorDlg:Boolean);
    procedure PrintRecordwithDrawelSlip(PrinterIndx :Integer;Container, Warehouse, Location, RecordNo :String);
    procedure PrintList(ListBox :TListBox; Header :String);
  public
    { Public declarations }
  end;

var
  frm_Returns: Tfrm_Returns;

implementation

Uses  ShellAPI, main, ItemsOut, SelWHouse, DataModCap, MetrofilerDataModule;

{$R *.DFM}

procedure Tfrm_Returns.btn_CloseClick(Sender: TObject);
  begin
    Close;
  end;

procedure Tfrm_Returns.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  qry_DefLocLen.Close;
  qry_SecureScan.Close;
  frm_Console.act_Filing.Enabled := true;
  Action := caFree;
end;

procedure Tfrm_Returns.FormCreate(Sender: TObject);
begin
  qry_DefLocLen.Close;
  qry_DefLocLen.SQL.Text := 'SELECT DefLocLen FROM Company WHERE CompanyCode = :CD';
  qry_DefLocLen.Parameters.ParamByName('CD').Value := CompsCode;
  qry_DefLocLen.Open;
  DefLocLen := qry_DefLocLen.Fields[0].asInteger;
//-------
  qry_SecureScan.Close;
  qry_SecureScan.SQL.Clear;
  qry_SecureScan.SQL.Add ('SELECT * FROM AuthCodes WHERE USERID =  :ID');
  qry_SecureScan.Parameters.ParambyName('ID').Value := User;
  qry_SecureScan.Open;
//-------
  PageControl1.ActivePage := Tabsheet1;
  TabSheet2.TabVisible := (frm_Console.fEntMan = 1)or(frm_Console.fWareMan = 1);
end;

procedure Tfrm_Returns.FormResize(Sender: TObject);
begin
  GroupBox1.Height := Height - 193;
  GroupBox15.Height := Height - 193;
  GroupBox11.Height := Height - 193;
  GroupBox15.Height := Height - 193;

  GroupBox12.Height := Height - 180;
  GroupBox2.Height := Height - 180;
  GroupBox3.Height := Height - 180;
end;

procedure Tfrm_Returns.btn_SelWHouseClick(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  frm_SelWHouse.Flag3D := -1;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_WHouse.Text := trim(frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString);
      lbl_WHouse.Caption := trim(frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString);
      Is3DWarehouse := (frm_SelWHouse.qry_WHouse.FieldbyName('D3Flag').asInteger = 1);

      Case Is3DWarehouse of
        False :begin
                 lbl_05.Visible := True;
                 edt_Location.Visible := True;
                 lbl_03.Caption := 'File Barcode';
                 cb_LocType.Items.Clear;
                 cb_LocType.Items.Append('6 Digit Loc');
                 cb_LocType.Items.Append('7 Digit Loc');
                 cb_LocType.ItemIndex := DefLocLen;
               end;
        True :begin
                lbl_05.Visible := false;
                edt_Location.Visible := False;
                 lbl_03.Caption := 'Container Barcode';
                cb_LocType.Items.Clear;
                cb_LocType.Items.Append('12 Digit Loc');
                cb_LocType.Items.Append('13 Digit Loc');
                cb_LocType.ItemIndex := DefLocLen;
              end;
      end;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfrm_Returns.btn_AddToListClick(Sender: TObject);
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
  If edt_Location.Visible Then
  If edt_Location.Text = '' Then
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
  mLocation := trim(UpperCase(edt_Location.Text));
  ExistFlag := False;
  For J := 0 to lb_Batch.Items.Count-1 Do
    begin
      If pos(mBarcode, lb_Batch.Items.Strings[J]) > 0 Then
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

procedure Tfrm_Returns.btn_SingleProcessClick(Sender: TObject);
var
  mLocation,mFileArea              :string;
  mlen,mpos                        :integer;
  s                                :string;
  i                                :integer;

  IsFile, IsItem, IsContainer  :Boolean;
begin
  If edt_WHouse.Text = '' Then
    begin
      Messagedlg('Please select a Filing Area.', mtInformation, [mbOK], 0);
      exit;
    end;
  If edt_Location.Visible Then
  If edt_Location.Text = '' Then
    begin
      Messagedlg('Please enter a Location.', mtInformation, [mbOK], 0);
      exit;
    end;
  If edt_Barcode.Text = '' Then
    begin
      Messagedlg('Please scan/enter a Barcode.', mtInformation, [mbOK], 0);
      exit;
    end;
//============Analyse the filing area and the location==========================
  If cb_LocType.ItemIndex = 1 Then
    begin
      mlen := length(trim(edt_Location.Text));    //length of scanned location
      mpos := mlen - 7;                           //row + bay + level = 7
      If mPos < 0 Then                           //row + bay + level = 7
        mPos := 0;
      mFileArea := Copy(trim(edt_Location.Text),1,mpos);
      mLocation := Copy(trim(edt_Location.Text),(mpos+1),7);
    end
  else If cb_LocType.ItemIndex = 0 Then
    begin
      mlen := length(trim(edt_Location.Text));    //length of scanned location
      mpos := mlen - 6;                           //row + bay + level = 6
      mFileArea := Copy(trim(edt_Location.Text),1,mpos);
      mLocation := Copy(trim(edt_Location.Text),(mpos+1),6);
    end
  else If cb_LocType.ItemIndex = 2 Then
    begin
      mlen := length(trim(edt_Location.Text));    //length of scanned location
      mpos := mlen - 7;                           //row + bay + level = 7
      If mPos < 0 Then                           //row + bay + level = 7
        mPos := 0;
      mFileArea := Copy(trim(edt_Location.Text),1,mpos);
      mLocation := Copy(trim(edt_Location.Text),(mpos+1),7);
    end;
//============Check Barcode=====================================================
  IsContainer := False;
  IsFile := False;
  IsItem := False;
//-----
  qry_CheckType.Close;
  qry_CheckType.SQL.Clear;
  qry_CheckType.SQL.Add('IF EXISTS(SELECT * FROM Containers WHERE Container = '+QuotedStr(edt_Barcode.Text)+')');
  qry_CheckType.SQL.Add('SELECT ''Container'' AS [Type]');
  qry_CheckType.SQL.Add('ELSE IF EXISTS(SELECT * FROM Files WHERE Filenumber = '+QuotedStr(edt_Barcode.Text)+')');
  qry_CheckType.SQL.Add('SELECT ''File'' AS [Type]');
  qry_CheckType.SQL.Add('ELSE IF EXISTS(SELECT * FROM Items WHERE Itemnumber = '+QuotedStr(edt_Barcode.Text)+')');
  qry_CheckType.SQL.Add('SELECT ''Item'' AS [Type]');
  qry_CheckType.SQL.Add('ELSE');
  qry_CheckType.SQL.Add('SELECT '''' AS [Type]');
  qry_CheckType.Open;
  If qry_CheckType.Fields[0].AsString = 'Container' Then IsContainer := True;
  If qry_CheckType.Fields[0].AsString = 'File' Then IsFile := True;
  If qry_CheckType.Fields[0].AsString = 'Item' Then IsItem := True;
//-----
  qry_CheckType.Close;
  If (IsContainer = False)AND(IsItem = False)AND(IsFile = False) Then
    begin
      MessageDlg('Barcode '+edt_Barcode.Text+' not found.', mtInformation, [mbOK], 0);
      exit;
    end;
//-----
  mem_Reserial.Lines.Clear;
  dm_Metrofiler.PromptPrinter_for_PrintRecordwithDrawelSlip := True;
//-----
  If IsContainer Then
    ReturnContainer(edt_Barcode.Text, edt_WHouse.Text, True);
  If IsFile Then
    ReturnFile(edt_Barcode.Text, edt_WHouse.Text, edt_Location.Text, True);
  If IsItem Then
    ReturnItem(edt_Barcode.Text, edt_WHouse.Text, edt_Location.Text, True);
//------------------------------------------
//Reserialize
//------------------------------------------
  If mem_Reserial.Lines.Count > 0 Then
    begin
      For i := 0 to mem_Reserial.Lines.Count-1 Do
        begin
          s := trim(mem_Reserial.Lines.Strings[i]);
          If s = '' Then
            continue;
          mFileArea := copy(s, 1, pos('=>', s)-1);
          Delete(s, 1, pos('=>', s)+1);
          mLocation := s;
          qry_ReSerial.Close;
          qry_ReSerial.SQL.Clear;
          qry_ReSerial.SQL.Add('EXEC Met_ReSerial :mLocNo, :mWarehouse');
          qry_ReSerial.Parameters.ParamByName('mLocNo').Value := mLocation;
          qry_ReSerial.Parameters.ParamByName('mWarehouse').Value := mFileArea;
          qry_ReSerial.ExecSQL;
        end;
    end;
end;                          //end of Update file pos and transaction details

procedure Tfrm_Returns.btn_ProcessBatchClick(Sender: TObject);
var
  i                   :integer;
  mchars,mpos         :integer;
  mLocNo, mBarcode    :string;
  mLocation,mFileArea :string;
  mlen                :integer;
  s                   :string;

  IsFile, IsItem, IsContainer  :Boolean;
begin
  Screen.Cursor := crHourglass;
  try
    mem_Reserial.Lines.Clear;
//--------------------
    dm_Metrofiler.PromptPrinter_for_PrintRecordwithDrawelSlip := True;
//==============================================================================
    For i := 0 to lb_Batch.Items.Count - 1 Do
      begin
        mpos := Pos('>',lb_Batch.Items[i]);
        mchars := mpos - 5;                   // _---> get position
        mLocNo := Copy(lb_Batch.Items[i],1,mchars);
        mchars := (length(lb_Batch.Items[i]) - mpos);
        Inc(mpos);
        mBarcode := Copy(lb_Batch.Items[i],mpos,mchars);
//==============================================================================
        If cb_LocType.ItemIndex = 1 Then
          begin
            mlen := length(trim(mLocNo));    //length of scanned location
            mpos := mlen - 7;                           //row + bay + level = 7
            If mPos < 0 Then                           //row + bay + level = 7
              mPos := 0;
            mFileArea := Copy(trim(mLocNo),1,mpos);
            mLocation := Copy(trim(mLocNo),(mpos+1),7);
          end
        else If cb_LocType.ItemIndex = 0 Then
          begin
            mlen := length(trim(mLocNo));    //length of scanned location
            mpos := mlen - 6;                           //row + bay + level = 6
            mFileArea := Copy(trim(mLocNo),1,mpos);
            mLocation := Copy(trim(mLocNo),(mpos+1),6);
          end
        else If cb_LocType.ItemIndex = 2 Then
          begin
            mlen := length(trim(mLocNo));    //length of scanned location
            mpos := mlen - 7;                           //row + bay + level = 7
            If mPos < 0 Then                           //row + bay + level = 7
              mPos := 0;
            mFileArea := Copy(trim(mLocNo),1,mpos);
            mLocation := Copy(trim(mLocNo),(mpos+1),7);
          end;
//============Check Barcode=====================================================
        IsContainer := False;
        IsFile := False;
        IsItem := False;
      //-----
        qry_CheckType.Close;
        qry_CheckType.SQL.Clear;
        qry_CheckType.SQL.Add('IF EXISTS(SELECT * FROM Containers WHERE Container = '+QuotedStr(mBarcode)+')');
        qry_CheckType.SQL.Add('SELECT ''Container'' AS [Type]');
        qry_CheckType.SQL.Add('ELSE IF EXISTS(SELECT * FROM Files WHERE Filenumber = '+QuotedStr(mBarcode)+')');
        qry_CheckType.SQL.Add('SELECT ''File'' AS [Type]');
        qry_CheckType.SQL.Add('ELSE IF EXISTS(SELECT * FROM Items WHERE Itemnumber = '+QuotedStr(mBarcode)+')');
        qry_CheckType.SQL.Add('SELECT ''Item'' AS [Type]');
        qry_CheckType.SQL.Add('ELSE');
        qry_CheckType.SQL.Add('SELECT '''' AS [Type]');
        qry_CheckType.Open;
        If qry_CheckType.Fields[0].AsString = 'File' Then IsFile := True;
        If qry_CheckType.Fields[0].AsString = 'Item' Then IsItem := True;
      //-----
        qry_CheckType.Close;
        If (IsContainer = False)AND(IsItem = False)AND(IsFile = False) Then
          begin
            MessageDlg('Barcode '+edt_Barcode.Text+' not found.', mtInformation, [mbOK], 0);
            Continue;
          end;
      //-----
        If IsContainer Then
          ReturnContainer(mBarcode, edt_WHouse.Text, False);
        If IsFile Then
          ReturnFile(mBarcode, edt_WHouse.Text, mLocation, False);
        If IsItem Then
          ReturnItem(mBarcode, edt_WHouse.Text, mLocation, False);

        Sleep(100);
        Application.ProcessMessages;
      end;
//------------------------------------------
//Reserialize
//------------------------------------------
    If mem_Reserial.Lines.Count > 0 Then
      begin
        For i := 0 to mem_Reserial.Lines.Count-1 Do
          begin
            s := trim(mem_Reserial.Lines.Strings[i]);
            If s = '' Then
              continue;   
            mFileArea := copy(s, 1, pos('=>', s)-1);
            Delete(s, 1, pos('=>', s)+1);
            mLocation := s;
            qry_ReSerial.Close;
            qry_ReSerial.SQL.Clear;
            qry_ReSerial.SQL.Add('EXEC Met_ReSerial :mLocNo, :mWarehouse');
            qry_ReSerial.Parameters.ParamByName('mLocNo').Value := mLocation;
            qry_ReSerial.Parameters.ParamByName('mWarehouse').Value := mFileArea;
            qry_ReSerial.ExecSQL;
          end;
      end;
//==============================================================================
    MessageDlg('Batch Processing complete',mtInformation,[mbOK],0);
  finally
    Screen.Cursor := crDefault;
  end;
end;  

procedure Tfrm_Returns.btn_ClearClick(Sender: TObject);
begin
  if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    lb_Batch.Clear;
end;

procedure Tfrm_Returns.btn_ScannerfileClick(Sender: TObject);
var
  Filename      :String;
  I             :Cardinal;
  mpos          :integer;
  mchars        :integer;
  mfile         :string;
  mloc          :string;
  mbarcode      :string;
  TempStr       :string;
  F             :TextFile;
begin
   Filename := qry_SecureScan.FieldbyName('ScanEXE').AsString;
   dm_Metrofiler.ShellExecAndWait(FileName, '', SW_MAXIMIZE, I);
//----
   if OpenDialog.Execute then
     begin
       mfile := OpenDialog.FileName;
       AssignFile(F,mfile);
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
       CloseFile(F);
     end;
end;

function Tfrm_Returns.ExecuteFile(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): THandle;
var
  zFileName, zParams, zDir: array[0..79] of Char;
begin
  Result := ShellExecute(Application.MainForm.Handle, nil,
                         StrPCopy(zFileName, FileName), StrPCopy(zParams, Params),
                         StrPCopy(zDir, DefaultDir), ShowCmd);
end;



procedure Tfrm_Returns.btn_PrintBatchClick(Sender: TObject);
begin
  PrintList(lb_Batch,'Result/Error List');
end;

procedure Tfrm_Returns.PrintRecordwithDrawelSlip(PrinterIndx :Integer;Container, Warehouse, Location, RecordNo :String);
var
  x, LineSpace            :Integer;
begin
  x := 0;
  Printer.PrinterIndex := PrinterIndx;
  Printer.BeginDoc;
  Printer.Canvas.Font.Size := 10;
  Printer.Canvas.Font.PixelsPerInch := 300;
  LineSpace := Printer.PageHeight Div 60;
  Printer.Canvas.TextOut(0,x,'Metrofile File Return Label');
  x := x + LineSpace;
  Printer.Canvas.TextOut(0,x,'------------------------------------------------------');
  x := x + LineSpace;
  x := x + LineSpace;
  Printer.Canvas.TextOut(0,x,'Container:'+Container);
  x := x + LineSpace;
  Printer.Canvas.TextOut(0,x,'Warehouse:'+Warehouse);
  x := x + LineSpace;
  Printer.Canvas.TextOut(0,x,'Location:'+Location);
  x := x + LineSpace;
  Printer.Canvas.TextOut(0,x,'RecordNo:'+RecordNo);
  x := x + LineSpace;
  Printer.Canvas.TextOut(0,x,'------------------------------------------------------------------------');
  Printer.EndDoc;
end;



procedure Tfrm_Returns.BitBtn11Click(Sender: TObject);
begin
      try
//==================================Verify Record===============================
        qry_Barcode.Active := False;
        qry_Barcode.SQL.Clear;
        qry_Barcode.SQL.Add('SELECT * FROM Files WHERE FileNumber = :FO');
        qry_Barcode.Parameters.ParamByName('FO').Value := edt_RecNo.Text;
        qry_Barcode.Active := True;
        If qry_Barcode.IsEmpty Then
          begin
            ShowMessage('File not found!!');
            exit;
          end;
        If (qry_Barcode.FieldByName('ISSUESTATUS').asString <> 'REC')then
          begin
            MessageDlg('File must be received in order to return to a Container!!',mtError,[mbOK],0);
            exit;
          end;
//==================================Verify Container============================
        qry_ContainersMain.Active := False;
        qry_ContainersMain.SQL.Clear;
        qry_ContainersMain.SQL.Add('SELECT * FROM Containers WHERE Container = :CO');
        qry_ContainersMain.Parameters.ParamByName('CO').Value := edt_Con.Text;
        qry_ContainersMain.Active := True;
        If qry_ContainersMain.IsEmpty Then
          begin
            ShowMessage('Container not found!!');
            exit;
          end;
        If (qry_ContainersMain.FieldByName('ISSUESTATUS').asString = 'MET')Then
          begin
            ShowMessage('Container is OFF-SITE!!');
            exit;
          end;
        If (qry_ContainersMain.FieldByName('ISSUESTATUS').asString = 'REQ')Then
          begin
            ShowMessage('Container has been requested!!');
            exit;
          end;
//======================Check for Destruction Dates=============================
        If qry_Barcode.FieldByName('DESTRUCT').asDateTime > qry_ContainersMain.FieldByName('DESTRUCT').asDateTime Then
          begin
            qry_ContainersMain.Edit;
            qry_ContainersMain.FieldByName('DESTRUCT').Value := qry_Barcode.FieldByName('DESTRUCT').Value;
            qry_ContainersMain.Post;
          end;
//==============================================================================
        qry_Barcode.Edit;
        qry_Barcode.FieldByName('ISSUESTATUS').asString := 'CON';
        qry_Barcode['ItTxNo'] := Null;
        qry_Barcode.FieldByName('CONTAINERNO').asString := qry_ContainersMain.FieldbyName('CONTAINER').asString;
        qry_Barcode.Post;
        If qry_ContainersMain.FieldbyName('ISSUESTATUS').asString = 'IN' Then
          If PrintDialog.Execute Then
            PrintRecordwithDrawelSlip(Printer.PrinterIndex,
                                      qry_ContainersMain.FieldbyName('CONTAINER').asString,
                                      qry_ContainersMain.FieldbyName('WAREHOUSE').asString,
                                      qry_ContainersMain.FieldbyName('LOCNO').asString,
                                      qry_Barcode.FieldbyName('FILENUMBER').asString);
        MessageDlg('Transaction completed successfully',mtInformation,[mbOK],0);
        lb_RecInContSucc.Items.append('File '+edt_RecNo.Text+' ->Successful-> '+edt_Con.Text);
      finally
        qry_ContainersMain.Active := False;
        qry_Barcode.Active := False;
      end; 
end;


procedure Tfrm_Returns.BitBtn12Click(Sender: TObject);
begin
  lb_RecInContBatch.Items.Add(edt_RecNo.Text + ' ===>' + edt_Con.Text);
  edt_RecNo.Text := '';
end;

procedure Tfrm_Returns.BitBtn14Click(Sender: TObject);
begin
if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  lb_RecInContBatch.Items.Clear;
end;

procedure Tfrm_Returns.BitBtn15Click(Sender: TObject);
begin
  PrintList(lb_RecInContBatch, 'Records in Container "Returns"');
end;

procedure Tfrm_Returns.BitBtn13Click(Sender: TObject);
Var
  I            :Integer;
  Container    :String[20];
  RecordNo     :String[20];
  Flag         :Boolean;
  PrinterIndex :Integer;
begin
Flag := False;
PrinterIndex := -1;
For I := 0 to lb_RecInContBatch.Items.Count-1 Do
 begin
   RecordNo := trim(copy(lb_RecInContBatch.Items.Strings[I],1,pos(' ===>',lb_RecInContBatch.Items.Strings[I])-1));
   Container := trim(copy(lb_RecInContBatch.Items.Strings[I],
                         pos(' ===>',lb_RecInContBatch.Items.Strings[I])+5,
                         length(lb_RecInContBatch.Items.Strings[I])));
//==============================================================================
      try
//==================================Verify Record===============================
        qry_Barcode.Active := False;
        qry_Barcode.SQL.Clear;
        qry_Barcode.SQL.Add('SELECT * FROM Files WHERE FileNumber = :FO');
        qry_Barcode.Parameters.ParamByName('FO').Value := RecordNo;
        qry_Barcode.Active := True;
        If qry_Barcode.IsEmpty Then
          begin
            lb_RecInContErr.Items.append('File "'+RecordNo+'" not found!!');
            Continue;
          end;
        If (qry_Barcode.FieldByName('ISSUESTATUS').asString <> 'REC')then
          begin
            lb_RecInContErr.Items.append('File "'+RecordNo+'" must first be Receieved in order to return to a Container!!');
            Continue;
          end;
//==================================Verify Container============================
        qry_ContainersMain.Active := False;
        qry_ContainersMain.SQL.Clear;
        qry_ContainersMain.SQL.Add('SELECT * FROM Containers WHERE Container = :CO');
        qry_ContainersMain.Parameters.ParamByName('CO').Value := Container;
        qry_ContainersMain.Active := True;
        If qry_ContainersMain.IsEmpty Then
          begin
            lb_RecInContErr.Items.append('Container "'+Container+'" not found!!');
            Continue;
          end;
        If (qry_ContainersMain.FieldByName('ISSUESTATUS').asString = 'MET')Then
          begin
            lb_RecInContErr.Items.append('Container "'+Container+'" is OFF-SITE!!');
            Continue;
          end;
        If (qry_ContainersMain.FieldByName('ISSUESTATUS').asString = 'REQ')Then
          begin
            lb_RecInContErr.Items.append('Container "'+Container+'" has been reuested!!');
            Continue;
          end;
//======================Check for Destruction Dates=============================
        If qry_Barcode.FieldByName('DESTRUCT').asDateTime > qry_ContainersMain.FieldByName('DESTRUCT').asDateTime Then
          begin
            qry_ContainersMain.Edit;
            qry_ContainersMain.FieldByName('DESTRUCT').Value := qry_Barcode.FieldByName('DESTRUCT').Value;
            qry_ContainersMain.Post;
          end;
//==============================================================================
        qry_Barcode.Edit;
        qry_Barcode.FieldByName('ISSUESTATUS').asString := 'CON';
        qry_Barcode.FieldByName('CONTAINERNO').asString := qry_ContainersMain.FieldbyName('CONTAINER').asString;
        qry_Barcode.Post;

        If qry_ContainersMain.FieldbyName('ISSUESTATUS').asString = 'IN' Then
          begin
            If not Flag Then
              begin
                If PrintDialog.Execute Then
                  begin
                    PrinterIndex := Printer.PrinterIndex;
                    Flag := True;
                    PrintRecordwithDrawelSlip(PrinterIndex,
                                              qry_ContainersMain.FieldbyName('CONTAINER').asString,
                                              qry_ContainersMain.FieldbyName('WAREHOUSE').asString,
                                              qry_ContainersMain.FieldbyName('LOCNO').asString,
                                              qry_Barcode.FieldbyName('FILENUMBER').asString);
                  end;
              end
            else
              begin
                PrintRecordwithDrawelSlip(PrinterIndex,
                                          qry_ContainersMain.FieldbyName('CONTAINER').asString,
                                          qry_ContainersMain.FieldbyName('WAREHOUSE').asString,
                                          qry_ContainersMain.FieldbyName('LOCNO').asString,
                                          qry_Barcode.FieldbyName('FILENUMBER').asString);
              end;
          end;
        lb_RecInContSucc.Items.append('File '+RecordNo+' ->Successful-> '+Container+'');
      finally
        qry_ContainersMain.Active := False;
        qry_Barcode.Active := False;
      end;
 end;  
end;


procedure Tfrm_Returns.btn_GetOldContainerClick(Sender: TObject);
begin
  try
    edt_Con.Text := '';
    qry_Barcode.Close;
    qry_Barcode.SQL.Clear;
    qry_Barcode.SQL.Add('SELECT ISSUESTATUS, CONTAINERNO FROM Files WHERE FileNumber = :FN');
    qry_Barcode.Parameters.ParamByName('FN').Value := edt_RecNo.Text;
    qry_Barcode.Open;
    If qry_Barcode.IsEmpty Then
      begin
        Messagedlg('Record not found !!',mtError,[mbOK],0);
        exit;
      end;
    If length(qry_Barcode.FieldByName('CONTAINERNO').asString) = 0 Then
      begin
        Messagedlg('File shows no history of being in a Container!!',mtInformation,[mbOK],0);
        exit;
      end;
    qry_ContainersMain.close;
    qry_ContainersMain.SQL.Clear;
    qry_ContainersMain.SQL.Add('SELECT ISSUESTATUS FROM Containers WHERE Container = :CN');
    qry_ContainersMain.Parameters.ParamByName('CN').Value := qry_Barcode.FieldByName('CONTAINERNO').asString;
    qry_ContainersMain.Open;
    If qry_ContainersMain.IsEmpty Then
      begin
        Messagedlg('Container not found!!',mtError,[mbOK],0);
        exit;
      end;
    If qry_ContainersMain.FieldByName('ISSUESTATUS').asString = 'MET' Then
      begin
        Messagedlg('The previous Container is OFF-SITE!!',mtInformation,[mbOK],0);
        exit;
      end;
    If qry_ContainersMain.FieldByName('ISSUESTATUS').asString = 'REQ' Then
      begin
        Messagedlg('The previous Container has been requested!!',mtInformation,[mbOK],0);
        exit;
      end;
    edt_Con.Text := qry_Barcode.FieldbyName('CONTAINERNO').asString;
  finally
    qry_Barcode.Close;
    qry_ContainersMain.close;
  end;
end;


procedure Tfrm_Returns.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    lb_Sucess.Clear;
end;

procedure Tfrm_Returns.BitBtn10Click(Sender: TObject);
begin
  if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    lb_Error.Clear;
end;

procedure Tfrm_Returns.BitBtn2Click(Sender: TObject);
begin
  PrintList(lb_Sucess,'Success List');
end;

procedure Tfrm_Returns.BitBtn9Click(Sender: TObject);
begin
  PrintList(lb_Error,'Error List');
end;

procedure Tfrm_Returns.BitBtn4Click(Sender: TObject);
begin
if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  lb_RecInContSucc.Items.Clear;
end;

procedure Tfrm_Returns.BitBtn6Click(Sender: TObject);
begin
if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  lb_RecInContErr.Items.Clear;
end;

procedure Tfrm_Returns.BitBtn1Click(Sender: TObject);
begin
  PrintList(lb_RecInContSucc, 'Records in Container Success List');
end;

procedure Tfrm_Returns.BitBtn5Click(Sender: TObject);
begin
  PrintList(lb_RecInContErr,'Records in Container Error List');
end;

procedure Tfrm_Returns.BitBtn18Click(Sender: TObject);
var
  Filename       :String;
  I              :Cardinal;
  mpos           :integer;
  mchars         :integer;
  mfile          :string;
  mloc           :string;
  mbarcode       :string;
  TempStr        :string;
  F              :TextFile;
begin
  With DatmodCap do
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
      If OpenDialog.Execute Then
        begin
          mfile := OpenDialog.FileName;
          AssignFile(F,mfile);
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
              lb_RecInContBatch.Items.Add(mbarcode + ' ===>' + mloc);
            end;
          CloseFile(F);
        end;
   end;
end;


procedure Tfrm_Returns.ReturnContainer(Container, WHouse :String; ShowErrorDlg:Boolean);
var
  ErrorMessage :String;
  LocNo, s     :String;
  i            :Integer;
begin
  Screen.Cursor := crHourglass;
  try
    qry_Barcode.Close;
    qry_Barcode.SQL.Clear;
    qry_Barcode.SQL.Add('SELECT * FROM Containers WHERE Container = :mCont');
    qry_Barcode.Parameters.ParamByName('mCont').Value := Container;
    qry_Barcode.Open;
    if qry_Barcode.isEmpty then
      begin
        ErrorMessage := 'Container '+Container+' not found.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//==================Record found, location valid so continue====================
    if ((qry_Barcode.FieldByName('IssueStatus').AsString = 'MIN') or (qry_Barcode.FieldByName('IssueStatus').AsString = 'MET')) then
      begin
        ErrorMessage := 'Container '+Container+' is flagged for off-site storage';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//===========================================================================
    if (qry_Barcode.FieldByName('IssueStatus').AsString = 'PW') then
      begin
        ErrorMessage := 'Container '+Container+' has been permanently withdrawn.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//===========================================================================
    if (qry_Barcode.FieldByName('IssueStatus').AsString = 'DES') then
      begin
        ErrorMessage := 'Container '+Container+' has been destroyed.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//===========================================================================
    if (qry_Barcode.FieldByName('IssueStatus').AsString = 'IN')Then
      begin
        ErrorMessage := 'Container '+Container+' has already been put away.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//===========================================================================
    if (qry_Barcode.FieldByName('IssueStatus').AsString <> 'REC')Then
      begin
        ErrorMessage := 'Container '+Container+' not received yet.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//==============================================================================
    With SP_StoreBox Do
      begin
        Parameters.ParamByName('@Boxnumber').Value := Container;
        Parameters.ParamByName('@BoxType').Value := qry_Barcode.FieldByName('ContType').AsString;
        Parameters.ParamByName('@mWare').Value := WHouse;
        try
          ExecProc;
        except
          on E : Exception do
            begin
              s := E.Message;
              MessageDlg(s, mtError, [mbOK], 0);
            end;
        end;
      end;
//==============================================================================
    qry_Location.Close;
    qry_Location.SQL.Clear;
    qry_Location.SQL.Add('select * from location where warehouse = :mware and BoxNumber = :mBox');
    qry_Location.Parameters.ParambyName('mware').Value := WHouse;
    qry_Location.Parameters.ParambyName('mBox').Value := Container;
    qry_Location.Open;
    if qry_Location.isEmpty then
      begin
        ErrorMessage := 'Container '+Container+' allocated Location invalid.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
    LocNo := qry_Location.FieldByName('LocNo').AsString;           //Get the Allocated location
//====================Update the container details here=========================
    qry_Barcode.Edit;
    qry_Barcode['LocNo'] := LocNo;
    qry_Barcode['Warehouse'] := WHouse;
    qry_Barcode['IssueStatus'] := 'IN';
    qry_Barcode['IssuedOn'] := NULL;
    qry_Barcode['IssuedUserID'] := NULL;
    qry_Barcode['IssuedTo'] := NULL;
    qry_Barcode['ReturnedOn'] := dm_Metrofiler.GetServTimeNow;
    qry_Barcode.Post;
//==============================================================================
    dm_Metrofiler.PrintContReturnSlip(qry_Barcode.FieldbyName('Container').asString,
                                      qry_Barcode.FieldbyName('Warehouse').asString,
                                      qry_Barcode.FieldbyName('LocNo').asString);
//---------------------------
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('INSERT INTO History (Barcode, DateTRet)');
    qry_SQL.SQL.Add('Values (:nBarcode, :nDateTRet)');
    qry_SQL.Parameters.ParambyName('nBarcode').Value := Container;
    qry_SQL.Parameters.ParambyName('nDateTRet').Value := dm_Metrofiler.GetServTimeNow;
    qry_SQL.ExecSQL;
//------Audit Entry
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('INSERT INTO Audit (Comments) VALUES(:Comments)');
    qry_SQL.Parameters.ParambyNAme('COMMENTS').Value := 'Return Container: '+Container+' in location: ' +LocNo+' in warehouse: '+WHouse;
    qry_SQL.ExecSQL;
//------------------------------------------------------------------------------
    ErrorMessage := 'Container '+Container+' successfully put away into Warehouse '+WHouse+' Location '+LocNo+'.';
    lb_Sucess.Items.Append(ErrorMessage);
    If ShowErrorDlg Then
      MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
  finally
    qry_SQL.Close;
    qry_Barcode.Close;
    qry_Location.Close;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Returns.ReturnFile(Filenumber, WHouse, LocNo :String; ShowErrorDlg:Boolean);
var
  TempStr    :String;
  ErrorMessage :String;
begin
  Screen.Cursor := crHourglass;
  try
    qry_Location.Close;
    qry_Location.SQL.Clear;
    qry_Location.SQL.Add('SELECT LocNo FROM location WHERE warehouse = :mware AND LocNo = :mLoc');
    qry_Location.Parameters.ParambyName('mware').Value := WHouse;
    qry_Location.Parameters.ParambyName('mLoc').Value := LocNo;
    qry_Location.Open;
    if qry_Location.isEmpty then
      begin
        ErrorMessage := 'Warehouse '+WHouse+' / Location '+LocNo+' is invalid.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//---------------------------
//location ok get barcode
//---------------------------
    qry_Barcode.Close;
    qry_Barcode.SQL.Clear;
    qry_Barcode.SQL.Add('SELECT Filenumber, IssueStatus FROM Files WHERE Filenumber = :mFile');
    qry_Barcode.Parameters.ParamByName('mFile').Value := Filenumber;
    qry_Barcode.Open;
    if qry_Barcode.isEmpty then
      begin
        ErrorMessage := 'File '+Filenumber+' not found.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//==================Record found, location valid so continue====================
    if ((qry_Barcode.FieldByName('IssueStatus').AsString = 'MIN') or (qry_Barcode.FieldByName('IssueStatus').AsString = 'MET')) then
      begin
        ErrorMessage := 'File '+Filenumber+' is flagged for off-site storage';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//===========================================================================
    if (qry_Barcode.FieldByName('IssueStatus').AsString = 'PW') then
      begin
        ErrorMessage := 'File '+Filenumber+' has been permanently withdrawn.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//===========================================================================
    if (qry_Barcode.FieldByName('IssueStatus').AsString = 'DES') then
      begin
        ErrorMessage := 'File '+Filenumber+' has been destroyed.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//===========================================================================
    if (qry_Barcode.FieldByName('IssueStatus').AsString = 'IN')or
       (qry_Barcode.FieldByName('IssueStatus').AsString = 'MI')Then
      begin
        ErrorMessage := 'File '+Filenumber+' has already been put away.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//===========================================================================
    if (qry_Barcode.FieldByName('IssueStatus').AsString <> 'REC')AND
       (qry_Barcode.FieldByName('IssueStatus').AsString <> 'FREC')Then
      begin
        ErrorMessage := 'File '+Filenumber+' not received yet.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//==============================================================================
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('UPDATE Files SET');
    qry_SQL.SQL.Add('  RecordNo = 0,');
    qry_SQL.SQL.Add('  LocNo = :LocNo,');
    qry_SQL.SQL.Add('  Warehouse = :Warehouse,');
    qry_SQL.SQL.Add('  IssueStatus = ''IN'',');
    qry_SQL.SQL.Add('  IssuedUserID = NULL,');
    qry_SQL.SQL.Add('  IssuedTo = NULL,');
    qry_SQL.SQL.Add('  IssuedOn = NULL,');
    qry_SQL.SQL.Add('  ReturnedOn = GetDate()');
    qry_SQL.SQL.Add('WHERE Filenumber = :Filenumber');
//-------
    qry_SQL.SQL.Add('INSERT INTO History (Barcode, DateTRet)');
    qry_SQL.SQL.Add('Values (:nBarcode, GETDATE())');
//-------
    qry_SQL.SQL.Add('INSERT INTO Audit (Comments) VALUES(:Comments)');
//---------------------------
    qry_SQL.Parameters.ParamByName('LocNo').Value := LocNo;
    qry_SQL.Parameters.ParamByName('Warehouse').Value := WHouse;
    qry_SQL.Parameters.ParamByName('Filenumber').Value := Filenumber;
    qry_SQL.Parameters.ParambyName('nBarcode').Value := Filenumber;
    qry_SQL.Parameters.ParambyNAme('Comments').Value := 'Return File: '+Filenumber+' in location: ' +LocNo+' in warehouse: '+WHouse;
    qry_SQL.ExecSQL;
//------Add Location for Reserialize
    TempStr := WHouse+'=>'+LocNo;
    If mem_Reserial.Lines.IndexOf(TempStr) = -1 Then
      mem_Reserial.Lines.Append(TempStr);
//------------------------------------------------------------------------------
    ErrorMessage := 'File '+Filenumber+' successfully put away into Warehouse '+WHouse+' Location '+LocNo+'.';
    lb_Sucess.Items.Append(ErrorMessage);
    If ShowErrorDlg Then
      MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
  finally
    qry_SQL.Close;
    qry_Barcode.Close;
    qry_Location.Close;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Returns.ReturnItem(Itemnumber, WHouse, LocNo :String; ShowErrorDlg:Boolean);
var
  TempStr    :String;
  ErrorMessage :String;
begin
  Screen.Cursor := crHourglass;
  try
    qry_Location.Close;
    qry_Location.SQL.Clear;
    qry_Location.SQL.Add('SELECT * FROM location WHERE warehouse = :mware AND LocNo = :mLoc');
    qry_Location.Parameters.ParambyName('mware').Value := WHouse;
    qry_Location.Parameters.ParambyName('mLoc').Value := LocNo;
    qry_Location.Open;
    if qry_Location.isEmpty then
      begin
        ErrorMessage := 'Warehouse '+WHouse+' / Location '+LocNo+' is invalid.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//---------------------------
//location ok get barcode
//---------------------------
    qry_Barcode.Close;
    qry_Barcode.SQL.Clear;
    qry_Barcode.SQL.Add('SELECT * FROM Items WHERE Itemnumber = :mItem');
    qry_Barcode.Parameters.ParamByName('mItem').Value := Itemnumber;
    qry_Barcode.Open;
    if qry_Barcode.isEmpty then
      begin
        ErrorMessage := 'Item '+Itemnumber+' not found.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//==================Record found, location valid so continue====================
//===========================================================================
    if (qry_Barcode.FieldByName('Status').AsString = 'I')or
       (qry_Barcode.FieldByName('Status').AsString = 'L')Then
      begin
        ErrorMessage := 'Item '+Itemnumber+' has already been put away.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//===========================================================================
    if (qry_Barcode.FieldByName('Status').AsString <> 'R')AND
       (qry_Barcode.FieldByName('Status').AsString <> 'P')Then
      begin
        ErrorMessage := 'Item '+Itemnumber+' not received yet.';
        lb_Error.Items.Append(ErrorMessage);
        If ShowErrorDlg Then
          MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
        exit;
      end;
//==============================================================================
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('UPDATE Items SET');
    qry_SQL.SQL.Add('  RecordNo = 0,');
    qry_SQL.SQL.Add('  LocNo = :LocNo,');
    qry_SQL.SQL.Add('  Warehouse = :Warehouse,');
    qry_SQL.SQL.Add('  Status = ''L'',');
    qry_SQL.SQL.Add('  IssuedUserID = NULL,');
    qry_SQL.SQL.Add('  IssuedTo = NULL,');
    qry_SQL.SQL.Add('  IssuedOn = NULL,');
    qry_SQL.SQL.Add('  ReturnedOn = GETDATE()');
    qry_SQL.SQL.Add('WHERE Itemnumber = :Itemnumber');
    qry_SQL.Parameters.ParamByName('LocNo').Value := LocNo;
    qry_SQL.Parameters.ParamByName('Warehouse').Value := WHouse;
    qry_SQL.Parameters.ParamByName('Itemnumber').Value := Itemnumber;
    qry_SQL.ExecSQL;
//---------------------------
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('INSERT INTO History (Barcode, DateTRet)');
    qry_SQL.SQL.Add('Values (:nBarcode, :nDateTRet)');
    qry_SQL.Parameters.ParambyName('nBarcode').Value := Itemnumber;
    qry_SQL.Parameters.ParambyName('nDateTRet').Value := dm_Metrofiler.GetServTimeNow;
    qry_SQL.ExecSQL;
//------Audit Entry
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('INSERT INTO Audit (Comments) VALUES(:Comments)');
    qry_SQL.Parameters.ParambyNAme('COMMENTS').Value := 'Return Item: '+Itemnumber+' in location: ' +LocNo+' in warehouse: '+WHouse;
    qry_SQL.ExecSQL;
//------Add Location for Reserialize
    TempStr := WHouse+'=>'+LocNo;
    If mem_Reserial.Lines.IndexOf(TempStr) = -1 Then
      mem_Reserial.Lines.Append(TempStr);
//------------------------------------------------------------------------------
    ErrorMessage := 'Item '+Itemnumber+' successfully put away into Warehouse '+WHouse+' Location '+LocNo+'.';
    lb_Sucess.Items.Append(ErrorMessage);
    If ShowErrorDlg Then
      MessageDlg(ErrorMessage, mtInformation, [mbOK], 0);
  finally
    qry_SQL.Close;
    qry_Barcode.Close;
    qry_Location.Close;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Returns.PrintList(ListBox :TListBox; Header :String);
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
      Printer.Canvas.TextOut(0,x,Header);
      x := x + LineSpace;
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'Date: ' + DateToStr(date) + ' Time: ' + DateToStr(Time));
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------------------------');
      x := x + LineSpace;
      x := x + LineSpace;
      ListTot := ListBox.Items.Count;
      For J := 0 to ListTot-1 Do
        begin
          Printer.Canvas.TextOut(0,x,ListBox.Items.Strings[J]);
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

end.
