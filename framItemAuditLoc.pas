//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit framItemAuditLoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, Printers, ADODB;

type
  TframItemsAuditLoc = class(TFrame)
    Label33: TLabel;
    Label77: TLabel;
    lbl_AuditWHouse: TLabel;
    GroupBox7: TGroupBox;
    lst_ErrorsAud: TListBox;
    btn_PrintErrorAud: TBitBtn;
    btn_ClearErrorsAud: TBitBtn;
    GroupBox6: TGroupBox;
    Label35: TLabel;
    Label42: TLabel;
    lst_BatchAud: TListBox;
    btn_ProcessAud: TBitBtn;
    btn_ClearAud: TBitBtn;
    btn_LanchScannAud: TBitBtn;
    lst_ExistingRecs: TListBox;
    edt_Location: TEdit;
    btn_RefreshRecords: TBitBtn;
    btn_ClearLocation: TBitBtn;
    edt_AuditWHouse: TEdit;
    btn_AuditWHouse: TButton;
    qry_Location: TADOQuery;
    qry_ItemsFind: TADOQuery;
    Qry_Items: TADOQuery;
    qry_SecureScan: TADOQuery;
    OpenDialog: TOpenDialog;
    PrintDialog: TPrintDialog;
    qry_GenSQL: TADOQuery;
    procedure btn_AuditWHouseClick(Sender: TObject);
    procedure btn_RefreshRecordsClick(Sender: TObject);
    procedure btn_ClearLocationClick(Sender: TObject);
    procedure btn_LanchScannAudClick(Sender: TObject);
    procedure btn_ProcessAudClick(Sender: TObject);
    procedure btn_ClearAudClick(Sender: TObject);
    procedure btn_ClearErrorsAudClick(Sender: TObject);
    procedure btn_PrintErrorAudClick(Sender: TObject);
  private
    { Private declarations }
    function ItemExist(lstBox :TListBox;mFile :string): Boolean;
    procedure ImportScanner;
  public
    { Public declarations }
  end;

implementation

uses SelWHouse, Main, DataModCap, MetrofilerDataModule;

{$R *.dfm}

procedure TframItemsAuditLoc.btn_AuditWHouseClick(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  frm_SelWHouse.Flag3D := 0;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_AuditWHouse.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_AuditWHouse.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure TframItemsAuditLoc.btn_RefreshRecordsClick(Sender: TObject);
var
  mStr,mItem :string;
  mChars,i,mPos :integer;
  mLocNo,mItemBCode :string;
begin
  if lst_BatchAud.Items.Count = 0 then
    begin                                 //Check that an Audit file has been imported
      MessageDlg('Please import Audit file first.',mtError,[mbOK],0);
      exit;
    end;
  if length(edt_Location.Text) = 0 then
    begin                                 //Check that an Audit file has been imported
      MessageDlg('Please enter a Location.',mtError,[mbOK],0);
      exit;
    end;
//-------------
  qry_Location.Close;
  qry_Location.SQL.Clear;
  qry_Location.SQL.Add('select * from location where LocNo = :mLoc and warehouse = :mware');
  qry_Location.Parameters.ParamByName('mLoc').Value := edt_Location.Text;
  qry_Location.Parameters.ParamByName('mWare').Value := edt_AuditWHouse.Text;
  qry_Location.Open;
  if qry_Location.isEmpty then
    begin
      MessageDlg('Invalid Location.',mtError,[mbOK],0);
      qry_Location.Close;
      exit;
    end;
  qry_Location.Close;
//--------------
  lst_ExistingRecs.Clear;
  lst_ErrorsAud.Clear;
//-----Retrieve Files----------\\
  qry_Items.Close;
  qry_Items.SQl.Clear;
  qry_Items.SQl.Add('SELECT * FROM Items WHERE LocNo = :LocNo AND Warehouse = :mware');
  qry_Items.Parameters.ParamByName('locno').Value := edt_Location.Text;
  qry_Items.Parameters.ParamByName('mware').Value := edt_AuditWHouse.Text;
  qry_Items.Open;
  if qry_Items.isEmpty then
    MessageDlg('No Items found in location',mtWarning,[mbOK],0);
//-----------------------------\\
  qry_Items.First;
  While not qry_Items.EOF do
    begin
      mItem := qry_Items.FieldByName('ItemNumber').AsString;
      mStr := IntToStr(qry_Items.FieldByName('RecordNo').AsInteger) + ' * ' + mItem;

      If (qry_Items.FieldByName('STATUS').asString <> 'L')AND
         (qry_Items.FieldByName('STATUS').asString <> 'AU') Then
        begin
          lst_ErrorsAud.Items.Add('Error => ' +qry_Items.FieldbyName('ITEMNUMBER').AsString+ ' Invalid Status '+qry_Items.FieldbyName('STATUS').AsString+'..');
          mStr := mStr + ' Error: Invalid Status '+qry_Items.FieldbyName('STATUS').AsString;
        end
      else
        begin
          if not ItemExist(lst_BatchAud,mItem) then
            begin
              lst_ErrorsAud.Items.Add('Error => '+mItem+' In Location but not Import File');
              mStr := mStr + ' Error: Not in import List';
            end
          else
            begin
              mStr := mStr + ' Matched';
            end;
        end;
      lst_ExistingRecs.Items.Add(mStr);
      qry_Items.Next;
    end;    //enddo
//----------------------------------------------->>
//----------------------------------------------->>
//----------------------------------------------->>
//---------------------------------<>
  for i := 0 to lst_BatchAud.Items.Count-1 do
    begin
      mpos := Pos('>',lst_BatchAud.Items[i]);
      mchars := mpos - 5;                   // _---> get position
      mLocNo := Copy(lst_BatchAud.Items[i],1,mchars);
//-----------------
      mchars := (length(lst_BatchAud.Items[i]) - mpos);
      Inc(mpos);
      mItemBcode := Trim(Copy(lst_BatchAud.Items[i],mpos,mchars));
//Check if in Database
//------------
      qry_ItemsFind.Close;
      qry_ItemsFind.SQl.Clear;
      qry_ItemsFind.SQl.Add('SELECT * FROM Items WHERE Itemnumber = :mItem');
      qry_ItemsFind.Parameters.ParamByName('mItem').Value := mItemBCode;
      qry_ItemsFind.Open;
      if not qry_ItemsFind.isEmpty then
        begin
          If (qry_ItemsFind.FieldByName('STATUS').asString <> 'L')AND
             (qry_ItemsFind.FieldByName('STATUS').asString <> 'AU') Then
            begin
              lst_ErrorsAud.Items.Add('Error => ' +qry_ItemsFind.FieldbyName('ITEMNUMBER').AsString+ ' Invalid Status '+qry_ItemsFind.FieldbyName('STATUS').AsString+'..');
            end
          else
            begin
              if (trim(qry_ItemsFind.FieldByName('LocNo').AsString) <> trim(edt_Location.Text))or
                 (trim(qry_ItemsFind.FieldByName('warehouse').AsString) <> trim(edt_AuditWHouse.Text))Then
                begin
                  lst_ErrorsAud.Items.Add('Error => '+mItemBCode + ' in Import file but Filed in '+qry_ItemsFind.FieldByName('Warehouse').AsString+'-'+qry_ItemsFind.FieldByName('LocNo').AsString);
                end;
            end;
        end
      else lst_ErrorsAud.Items.Add('Error => ' + mItemBCode + ' Not defined in system..');
    end;    //next
//---------------------------------<>
  qry_ItemsFind.Close;
  qry_Items.Close;
  Screen.Cursor := crDefault;
end;

function TframItemsAuditLoc.ItemExist(lstBox :TListBox;mFile :string): Boolean;
Var
  nItems :integer;
  i :integer;
begin
  Result := false;
  nItems := lstBox.Items.Count;
  if nItems = 0 then
    exit;
  for i := 0 to nItems - 1 do
    begin
      if pos(trim(mFile),lstBox.Items[i]) > 0 then
        begin
          Result := true;
          exit;
        end;
    end;
end;

procedure TframItemsAuditLoc.btn_ClearLocationClick(Sender: TObject);
var
  mItem :string;
  ErrorFlag        :Boolean;
begin
  if MessageDLG('Are you sure you wish to clear this location??',mtWarning,[mbYES,mbNo],0) = mrNo then
    exit;
//======================First Verify All========================================
  ErrorFlag := False;
  lst_ErrorsAud.Clear;
  qry_Items.Close;
  qry_Items.SQl.Clear;
  qry_Items.SQl.Add('SELECT * FROM Items WHERE LocNo = :LocNo AND Warehouse = :mware');
  qry_Items.Parameters.ParamByName('locno').Value := edt_Location.Text;
  qry_Items.Parameters.ParamByName('mware').Value := edt_AuditWHouse.Text;
  qry_Items.Open;
  If qry_Items.IsEmpty Then
    begin
      lst_ErrorsAud.Items.Add('Error => No Matching Items found in location found.');
      ErrorFlag := True;
    end;
  qry_Items.First;
  While not qry_Items.EOF Do
    begin
      If (qry_Items.FieldByName('STATUS').asString <> 'L')AND
         (qry_Items.FieldByName('STATUS').asString <> 'AU') Then
        begin
          lst_ErrorsAud.Items.Add('Error => ' +qry_Items.FieldbyName('ITEMNUMBER').AsString+ ' Invalid Status '+qry_Items.FieldbyName('STATUS').AsString+'..');
          ErrorFlag := True;
        end;
      qry_Items.Next;
    end;
  qry_ItemsFind.Close;
  qry_Items.Close;
//---------
  If ErrorFlag Then
    begin
      Messagedlg('Errors were encountered. Cannot continute with Clear Location.', mtInformation, [mbOK], 0);
      exit;
    end;
//===================================
  dm_Metrofiler.InsAudit('Clear Location', 0, 0, '', edt_Location.Text+' in warehouse: '+edt_AuditWHouse.Text, 0);
  qry_Items.Close;
  qry_Items.SQl.Clear;
  qry_Items.SQl.Add('SELECT * FROM Items WHERE LocNo = :LocNo AND Warehouse = :mware');
  qry_Items.Parameters.ParamByName('locno').Value := edt_Location.Text;
  qry_Items.Parameters.ParamByName('mware').Value := edt_AuditWHouse.Text;
  qry_Items.Open;
//---------------------------------<>
//Reset Location Numbers for all Items
//---------------------------------<>
  while not qry_Items.EOF do
    begin
      mItem := qry_Items.FieldByName('ItemNumber').AsString;
      lst_ErrorsAud.Items.Add(mItem + ' Removed from location: '+ edt_AuditWHouse.Text + '=>' + edt_Location.Text);
      qry_Items.Edit;
      qry_Items['RecordNo'] := 0;
      qry_Items['Status'] := 'AU';
      qry_Items.Post;
      qry_Items.Next;
    end;    //enddo
  qry_Items.Active := false;
  MessageDlg('Location Cleared.',mtInformation,[mbOK],0);
end;

procedure TframItemsAuditLoc.btn_LanchScannAudClick(Sender: TObject);
var
 Filename       :String;
 I              :Cardinal;
begin
  qry_SecureScan.Close;
  qry_SecureScan.SQl.Clear;
  qry_SecureScan.Sql.Add('SELECT * FROM AuthCodes WHERE USERID = '+QuotedStr(User));
  qry_SecureScan.Open;
  Filename := qry_SecureScan.FieldbyName('ScanEXE').AsString;
  qry_SecureScan.Close;
  dm_Metrofiler.ShellExecAndWait(FileName, '', SW_MAXIMIZE, I);
//-------------
  ImportScanner;
end;

procedure TframItemsAuditLoc.ImportScanner;
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
            lst_BatchAud.Items.Add(mloc + ' --->' + mbarcode)
          end;
      finally
        CloseFile(F);
      end;
    end;
end;


procedure TframItemsAuditLoc.btn_ProcessAudClick(Sender: TObject);
var
  i :integer;
  mRecno,mchars,mpos :integer;
  mItem,mItemBcode :string;
  ErrorFlag        :Boolean;
  ExtraLocReserial    :TStringList;
  mWarehouse, mLocNo   :String;
begin
//=============================First Verify all=================================
//Check that there are scanned entries
  lst_ErrorsAud.Clear;
  If lst_BatchAud.Items.Count = 0 Then
    begin
      Messagedlg('No Import Items!!', mtInformation, [mbOK], 0);
      exit;
    end;
//Work through import file
  ErrorFlag := False;
//-----Retrieve Files----------\\
  qry_Items.Close;
  qry_Items.SQl.Clear;
  qry_Items.SQl.Add('SELECT * FROM Items WHERE LocNo = :LocNo AND Warehouse = :mware');
  qry_Items.Parameters.ParamByName('locno').Value := edt_Location.Text;
  qry_Items.Parameters.ParamByName('mware').Value := edt_AuditWHouse.Text;
  qry_Items.Open;
  qry_Items.First;
  While not qry_Items.EOF Do
    begin
      If (qry_Items.FieldByName('STATUS').asString <> 'L')AND
         (qry_Items.FieldByName('STATUS').asString <> 'AU') Then
        begin
          lst_ErrorsAud.Items.Add('Error => ' + qry_Items.FieldByName('ITEMNUMBER').asString + ' Invalid Status '+qry_Items.FieldbyName('STATUS').AsString+'..');
          ErrorFlag := True;
        end;
      qry_Items.Next;
    end;
//--------------------------
  If not ErrorFlag Then
    begin
      for i := 0 to lst_BatchAud.Items.Count - 1 do
        begin
          mpos := Pos('>',lst_BatchAud.Items[i]);
//-----------------
          mchars := (length(lst_BatchAud.Items[i]) - mpos);
          Inc(mpos);
          mItemBCode := Trim(Copy(lst_BatchAud.Items[i],mpos,mchars));
//-------------------------
//Find File
//-------------------------
          qry_ItemsFind.Close;
          qry_ItemsFind.SQl.Clear;
          qry_ItemsFind.SQl.Add('SELECT * FROM Items WHERE Itemnumber = :mItem');
          qry_ItemsFind.Parameters.ParamByName('mItem').Value := mItemBCode;
          qry_ItemsFind.Open;
          if qry_ItemsFind.isEmpty  then
            begin
              lst_ErrorsAud.Items.Add('Error => ' + mItemBCode + ' Not defined in system..');
              ErrorFlag := True;
            end;
          If (qry_ItemsFind.FieldByName('STATUS').asString <> 'L')AND
             (qry_ItemsFind.FieldByName('STATUS').asString <> 'AU') Then
            begin
              lst_ErrorsAud.Items.Add('Error => ' + mItemBCode + ' Invalid Status '+qry_ItemsFind.FieldbyName('STATUS').AsString+'..');
              ErrorFlag := True;
            end;
        end;
    end;
  qry_ItemsFind.Close;
  qry_Items.Close;
  If ErrorFlag Then
    begin
      Messagedlg('Errors were encountered. Cannot continute with Audit.', mtInformation, [mbOK], 0);
      exit;
    end;
//==============================================================================
//==============================================================================
//==============================================================================
  dm_Metrofiler.InsAudit('Audit Location', 0, 0, '', edt_Location.Text+' in warehouse: '+edt_AuditWHouse.Text, 0);
//---------------------------------<>
//---------------------------------<>
//Reset Position Numbers for all files
//---------------------------------<>
  qry_GenSQL.Close;
  qry_GenSQL.SQL.Clear;
  qry_GenSQL.SQL.Add('UPDATE Items SET');
  qry_GenSQL.SQL.Add('Status = ''AU''');
  qry_GenSQL.SQL.Add('WHERE locno = :locno AND warehouse = :mware');
  qry_GenSQL.Parameters.ParamByName('locno').Value := edt_Location.Text;
  qry_GenSQL.Parameters.ParamByName('mware').Value := edt_AuditWHouse.Text;
  qry_GenSQL.ExecSQL;
//----------These are sepperate because of Transaction generation
  qry_GenSQL.Close;
  qry_GenSQL.SQL.Clear;
  qry_GenSQL.SQL.Add('update Items SET');
  qry_GenSQL.SQL.Add('RecordNo = 0');
  qry_GenSQL.SQL.Add('WHERE locno = :locno AND warehouse = :mware ');
  qry_GenSQL.Parameters.ParamByName('locno').Value := edt_Location.Text;
  qry_GenSQL.Parameters.ParamByName('mware').Value := edt_AuditWHouse.Text;
  qry_GenSQL.ExecSQL;
//--------------------
//Work through import file
//--------------------
  ExtraLocReserial := TStringList.Create;
  try
    mRecNo := 0;
    for i := 0 to lst_BatchAud.Items.Count - 1 do
      begin
        Inc(mRecNo);                 //Increment the counter
//-----------------
        mpos := Pos('>',lst_BatchAud.Items[i]);
//-----------------
        mchars := (length(lst_BatchAud.Items[i]) - mpos);
        Inc(mpos);
        mItemBCode := Trim(Copy(lst_BatchAud.Items[i],mpos,mchars));
//-----------------Check if not in a different location, if so then that location needs to be reserialized
        qry_GenSQL.Close;
        qry_GenSQL.SQL.Clear;
        qry_GenSQL.SQL.Add('SELECT Itemnumber, Warehouse, LocNo FROM Items');
        qry_GenSQL.SQL.Add('WHERE Itemnumber = '+QuotedStr(trim(mItemBCode)));
        qry_GenSQL.Open;
        if (UpperCase(trim(qry_GenSQL.FieldByName('Warehouse').AsString)) <> UpperCase(trim(edt_AuditWHouse.Text)))OR
           (UpperCase(trim(qry_GenSQL.FieldByName('LocNo').AsString)) <> UpperCase(trim(edt_Location.Text)))Then
          begin
            if ExtraLocReserial.IndexOf(trim(qry_GenSQL.FieldByName('Warehouse').AsString)+'=>'+trim(qry_GenSQL.FieldByName('LocNo').AsString)) = -1 then
              ExtraLocReserial.Add(trim(qry_GenSQL.FieldByName('Warehouse').AsString)+'=>'+trim(qry_GenSQL.FieldByName('LocNo').AsString));
          end;
//---------------------------
        qry_GenSQL.Close;
        qry_GenSQL.SQL.Clear;
        qry_GenSQL.SQL.Add('UPDATE Items SET');
        qry_GenSQL.SQL.Add('Status = ''AU''');
        qry_GenSQL.SQL.Add('WHERE Itemnumber = '+QuotedStr(trim(mItemBCode)));
        qry_GenSQL.ExecSQL;

        qry_GenSQL.Close;
        qry_GenSQL.SQL.Clear;
        qry_GenSQL.SQL.Add('UPDATE Items SET');
        qry_GenSQL.SQL.Add('Status = ''L'',');
        qry_GenSQL.SQL.Add('Warehouse ='+QuotedStr(trim(edt_AuditWHouse.Text))+',');
        qry_GenSQL.SQL.Add('RecordNo ='+InttoStr(mRecNo)+',');
        qry_GenSQL.SQL.Add('LocNo ='+QuotedStr(trim(edt_Location.Text))+',');
        qry_GenSQL.SQL.Add('IssuedOn = NULL, IssuedUserID = NULL, IssuedTo = NULL');
        qry_GenSQL.SQL.Add('WHERE Itemnumber = '+QuotedStr(trim(mItemBCode)));
        qry_GenSQL.ExecSQL;
//---------------------
        lst_ErrorsAud.Items.Add(mItemBCode + ' Updated..');
      end;
//------------
    qry_ItemsFind.Active := false;
//---------Reserialize extra locations------------------
    For i := 0 to  ExtraLocReserial.Count-1 Do
      begin
        mLocNo := ExtraLocReserial.Strings[i];
        mWarehouse := copy(mLocNo, 1, pos('=>', mLocNo)-1);
        mLocNo := copy(mLocNo, pos('=>', mLocNo)+2, length(mLocNo));
        //---------Check if there are files in this location, if so then reserial
        qry_Items.Close;
        qry_Items.SQl.Clear;
        qry_Items.SQl.Add('SELECT * FROM Items WHERE LocNo = :LocNo AND Warehouse = :mware');
        qry_Items.Parameters.ParamByName('locno').Value := mLocNo;
        qry_Items.Parameters.ParamByName('mware').Value := mWarehouse;
        qry_Items.Open;
        If not qry_Items.IsEmpty Then
          begin
            qry_GenSQL.Close;
            qry_GenSQL.SQL.Clear;
            qry_GenSQL.SQL.Add('EXEC Met_ReSerial '+QuotedStr(mLocNo)+', '+QuotedStr(mWarehouse));
            qry_GenSQL.ExecSQL;
          end;
      end;
  finally
    ExtraLocReserial.free;
  end;
//--------------------------------------------
//--------------------------------------------
//--------------------------------------------
  lst_ExistingRecs.Clear;
//Go To First Matching RecordgOT
  qry_Items.Close;
  qry_Items.SQl.Clear;
  qry_Items.SQl.Add('SELECT * FROM Items WHERE LocNo = :LocNo AND Warehouse = :mware');
  qry_Items.Parameters.ParamByName('locno').Value := edt_Location.Text;
  qry_Items.Parameters.ParamByName('mware').Value := edt_AuditWHouse.Text;
  qry_Items.Open;
  if qry_Items.isEmpty then
    begin
      MessageDlg('Transaction Error,No Matching filing area/location found.',mtError,[mbOK],0);
      exit;
    end;
//---------------------------------<>
  while not qry_Items.EOF do
    begin
      mItem := qry_Items.FieldByName('ITEMNUMBER').AsString;
      if qry_Items.FieldByName('RecordNo').AsInteger = 0  then
        lst_ErrorsAud.Items.Add('Warning: '+ mItem + ' Is Not Filed Anywhere..');
      qry_Items.Next;
    end;    //enddo
//---------------------------------<>
//Tidy Up and leave
  qry_Items.Active := false;
//---------------------------------<>
  Screen.Cursor := crDefault;
  MessageDlg('Batch Audit Processing complete',mtInformation,[mbOK],0);
end;

procedure TframItemsAuditLoc.btn_ClearAudClick(Sender: TObject);
begin
if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
        lst_ExistingRecs.Clear;
        lst_BatchAud.Clear;
        end;
end;

procedure TframItemsAuditLoc.btn_ClearErrorsAudClick(Sender: TObject);
begin
if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        lst_ErrorsAud.Clear;

end;

procedure TframItemsAuditLoc.btn_PrintErrorAudClick(Sender: TObject);
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
      Printer.Canvas.TextOut(0,x,'Location: ' + trim(edt_AuditWHouse.Text) + '==> ' + trim(edt_Location.Text));
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------------------------');
      x := x + LineSpace;
      x := x + LineSpace;
      ListTot := lst_ErrorsAud.Items.Count;
      For J := 0 to ListTot-1 Do
        begin
          Printer.Canvas.TextOut(0,x,lst_ErrorsAud.Items.Strings[J]);
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
