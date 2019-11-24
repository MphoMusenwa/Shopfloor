unit framAuditLocItems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Printers, ExtCtrls;

type
  Tfram_AuditLocItems = class(TFrame)
    qry_SQL: TADOQuery;
    qry_SecureScan: TADOQuery;
    PrintDialog: TPrintDialog;
    OpenDialog: TOpenDialog;
    qry_Items: TADOQuery;
    qry_ItemsFind: TADOQuery;
    qry_Location: TADOQuery;
    Panel1: TPanel;
    Label33: TLabel;
    edt_Location: TEdit;
    btn_ClearLocation: TBitBtn;
    Label77: TLabel;
    lbl_AuditWHouse: TLabel;
    edt_AuditWHouse: TEdit;
    btn_AuditWHouse: TButton;
    Panel2: TPanel;
    Label35: TLabel;
    lst_BatchAud: TListBox;
    btn_LanchScannAud: TBitBtn;
    Splitter1: TSplitter;
    Panel3: TPanel;
    btn_RefreshRecords: TBitBtn;
    Label42: TLabel;
    btn_ProcessAud: TBitBtn;
    btn_ClearAud: TBitBtn;
    lst_ExistingRecs: TListBox;
    Splitter2: TSplitter;
    Panel4: TPanel;
    Label1: TLabel;
    lst_ErrorsAud: TListBox;
    btn_PrintErrorAud: TBitBtn;
    btn_ClearErrorsAud: TBitBtn;
    Label31: TLabel;
    cb_LocSize: TComboBox;
    procedure edt_AuditWHouseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_AuditWHouseClick(Sender: TObject);
    procedure btn_RefreshRecordsClick(Sender: TObject);
    procedure btn_ClearLocationClick(Sender: TObject);
    procedure btn_LanchScannAudClick(Sender: TObject);
    procedure btn_ProcessAudClick(Sender: TObject);
    procedure btn_ClearAudClick(Sender: TObject);
    procedure btn_ClearErrorsAudClick(Sender: TObject);
    procedure btn_PrintErrorAudClick(Sender: TObject);
    procedure edt_AuditWHouseChange(Sender: TObject);
  private
    { Private declarations }
    function ItemExist(lstBox :TListBox;mItem :string): Boolean;
  public
    { Public declarations }
  end;

implementation

uses SelWHouse, MetrofilerDataModule, Main;

{$R *.dfm}

function Tfram_AuditLocItems.ItemExist(lstBox :TListBox;mItem :string): Boolean;
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
      if pos(trim(mItem),lstBox.Items[i]) > 0 then
        begin
          Result := true;
          exit;
        end;
    end;
end;

procedure Tfram_AuditLocItems.btn_AuditWHouseClick(Sender: TObject);
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

procedure Tfram_AuditLocItems.btn_ClearAudClick(Sender: TObject);
begin
if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
        lst_ExistingRecs.Clear;
        lst_BatchAud.Clear;
        end;
end;

procedure Tfram_AuditLocItems.btn_ClearErrorsAudClick(Sender: TObject);
begin
if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        lst_ErrorsAud.Clear;
end;

procedure Tfram_AuditLocItems.btn_ClearLocationClick(Sender: TObject);
Var
  Warehouse, Location   :String;
begin
  If trim(edt_AuditWHouse.Text) = '' Then
    begin
      MessageDlg('Please select a Filing Area.', mtInformation, [mbOK], 0);
      exit;
    end;
  If trim(edt_Location.Text) = '' Then
    begin
      MessageDlg('Please enter a Location.', mtInformation, [mbOK], 0);
      exit;
    end;
//--------
  Warehouse := edt_AuditWHouse.Text;
  Location := edt_Location.Text;
//--------
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT COUNT(*) FROM Location');
  qry_SQL.SQL.Add('WHERE Locno = :LocNo');
  qry_SQL.SQL.Add('AND Warehouse = :Warehouse');
  qry_SQL.Parameters.ParamByName('Locno').Value := Location;
  qry_SQL.Parameters.ParamByName('Warehouse').Value := Warehouse;
  qry_SQL.Open;
  If qry_SQL.Fields[0].AsInteger = 0 Then
    begin
      qry_SQL.Close;
      MessageDlg('Location is invalid. Please enter a valid Location', mtInformation, [mbOK], 0);
      exit;
    end;
  qry_SQL.Close;
//==============================================================================
  if MessageDLG('Are you sure you wish to clear this location??',mtWarning,[mbYES,mbNo],0) = mrNo then
    exit;

  Screen.Cursor := crHourglass;
  try
    dm_Metrofiler.InsAudit('Clear Location', 0, 0, '', edt_Location.Text+' in warehouse: '+edt_AuditWHouse.Text, 0);
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('UPDATE Items SET Warehouse = NULL, LocNo = NULL, RecordNo = NULL, Status = ''AUD''');
    qry_SQL.SQL.Add('WHERE Locno = :Locno');
    qry_SQL.SQL.Add('AND Warehouse = :Warehouse');
    qry_SQL.Parameters.ParamByName('Locno').Value := Location;
    qry_SQL.Parameters.ParamByName('Warehouse').Value := Warehouse;
    qry_SQL.ExecSQL;
  finally
    Screen.Cursor := crDefault;
  end;
  MessageDlg('Location Cleared.',mtInformation,[mbOK],0);
end;

procedure Tfram_AuditLocItems.btn_LanchScannAudClick(Sender: TObject);
var
  Filename       :String;
  I   :Cardinal;
  mpos             :integer;
  mchars           :integer;
  mloc             :string;
  mbarcode         :string;
  TempStr          :string;
  F                :TextFile;
begin
  btn_ProcessAud.Enabled := false;
  lst_BatchAud.Items.Clear;
  lst_ExistingRecs.Items.Clear;
  lst_ErrorsAud.Items.Clear;
//------------
  qry_SecureScan.Close;
  qry_SecureScan.SQl.Clear;
  qry_SecureScan.Sql.Add('SELECT * FROM AuthCodes WHERE USERID = '+QuotedStr(User));
  qry_SecureScan.Open;
  Filename := qry_SecureScan.FieldbyName('ScanEXE').AsString;
  qry_SecureScan.Close;
  dm_Metrofiler.ShellExecAndWait(FileName, '', SW_MAXIMIZE, I);
//-------------
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
            lst_BatchAud.Items.Add(mloc + ' --->' + mbarcode);
          end;
      finally
        CloseFile(F);
      end;
    end;
end;

procedure Tfram_AuditLocItems.btn_PrintErrorAudClick(Sender: TObject);
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

procedure Tfram_AuditLocItems.btn_ProcessAudClick(Sender: TObject);
var
  i,t,mlen          :integer;
  mchars,mpos     :integer;
  mItemBcode       :string;
  Warehouse          :String;
  mLocNo                 :String;
  TempTableXML           :String;
begin
  Screen.Cursor := crHourglass;
  Warehouse := edt_AuditWHouse.Text;
  TempTableXML := '<Audits>';
  try
    t := 0;
    for i := 0 to lst_BatchAud.Items.Count - 1 do
      begin
        mpos := Pos('>',lst_BatchAud.Items[i]);
        mchars := mpos - 5;                   // _---> get position
        mLocNo := Copy(lst_BatchAud.Items[i],1,mchars);
//-------
        mchars := (length(lst_BatchAud.Items[i]) - mpos);
        Inc(mpos);
        mItemBcode := Copy(lst_BatchAud.Items[i],mpos,mchars);
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
        TempTableXML := TempTableXML + '<Audit';
        //----------TrxNo------------------
        TempTableXML := TempTableXML + ' TrxNo="'+InttoStr(t)+'"';
        //----------Barcode------------------
        TempTableXML := TempTableXML + ' Barcode="'+mItemBcode+'"';
        //----------Warehouse------------------
        TempTableXML := TempTableXML + ' Warehouse="'+Warehouse+'"';
        //----------LocNo------------------
        TempTableXML := TempTableXML + ' LocNo="'+mLocNo+'"';
        //----------Footer------------------
        TempTableXML := TempTableXML + ' />';
      end;
    TempTableXML := TempTableXML + '</Audits>';
//-----------Now Process Temp Table---------------------------------------------
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('EXEC [ap_ProcessAuditLocationItems] :TableName, :UserId');
    qry_SQL.Parameters.ParamValues['TableName'] := TempTableXML;
    qry_SQL.Parameters.ParamValues['UserID'] := User;
    qry_SQL.ExecSQL;
    MessageDlg('Location updated.',mtInformation,[mbOK],0);
    lst_ExistingRecs.Items.Clear;
    lst_ErrorsAud.Items.Clear;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfram_AuditLocItems.btn_RefreshRecordsClick(Sender: TObject);
Var
  Warehouse, Location   :String;
  ErrorFlag        :Boolean;
  mStr :string;
  mChars,i,mPos, mlen :integer;
  mLocNo,mItemBCode :string;
  LocList            :TStringList;
  Locations          :String;
begin
Screen.Cursor := crHourglass;
btn_ProcessAud.Enabled := false;
ErrorFlag := false;
try
  lst_ExistingRecs.Items.Clear;
  lst_ErrorsAud.Items.Clear;
//------------
  If trim(edt_AuditWHouse.Text) = '' Then
    begin
      MessageDlg('Please select a Filing Area.', mtInformation, [mbOK], 0);
      exit;
    end;
  if lst_BatchAud.Items.Count = 0 then
    begin
      MessageDlg('Please import Audit file first.',mtInformation,[mbOK],0);
      exit;
    end;
//--------
  Warehouse := edt_AuditWHouse.Text;
//--------Verify Locations------------------------------------------------------
  LocList := TStringList.Create;
  try
    LocList.Clear;
    Locations := '';
    For i := 0 to lst_BatchAud.Items.Count-1 Do
      begin
        mpos := Pos('>',lst_BatchAud.Items[i]);
        mchars := mpos - 5;                   //  get position
        mLocNo := Copy(lst_BatchAud.Items[i],1,mchars);
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
//-----------
        If LocList.IndexOf(mLocNo) = -1 Then
          begin
            LocList.Append(mLocNo);
            Locations := Locations + QuotedStr(mLocNo)+',';
          end;
      end;
    If Locations <> '' Then
      Delete(Locations, length(Locations), 1); // Last Comma
//---
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT COUNT(*) FROM Location');
    qry_SQL.SQL.Add('WHERE Locno = :LocNo');
    qry_SQL.SQL.Add('AND Warehouse = :Warehouse');
    For i := 0 to LocList.Count-1 Do
      begin
        qry_SQL.Close;
        qry_SQL.Parameters.ParamByName('Locno').Value := LocList.Strings[I];
        qry_SQL.Parameters.ParamByName('Warehouse').Value := Warehouse;
        qry_SQL.Open;
        If qry_SQL.Fields[0].AsInteger = 0 Then
          begin
            qry_SQL.Close;
            MessageDlg('Location is invalid. Please only scan valid Locations.', mtInformation, [mbOK], 0);
            exit;
          end;
      end;
    qry_SQL.Close;
  finally
    LocList.Free;
  end;
//-------------Check Items in Location against List-----------------------------
  qry_Items.Close;
  qry_Items.SQL.Clear;
  qry_Items.SQL.Add('SELECT Itemnumber, Recordno, LocNo, Status');
  qry_Items.SQL.Add('FROM Items');
  qry_Items.SQL.Add('WHERE Warehouse = :mware');
  qry_Items.SQL.Add('AND LocNo IN ('+Locations+')');
  qry_Items.SQL.Add('ORDER BY LocNo, Recordno');
  qry_Items.Parameters.ParamByName('mware').Value := edt_AuditWHouse.Text;
  qry_Items.Open;
  qry_Items.First;
  While not qry_Items.EOF do
    begin
      mStr := qry_Items.FieldByName('LocNo').AsString + '/' + IntToStr(qry_Items.FieldByName('RecordNo').AsInteger) + ' * ' + trim(qry_Items.FieldByName('Itemnumber').AsString);

      If not ItemExist(lst_BatchAud, qry_Items.FieldByName('Itemnumber').AsString) Then
        begin
          lst_ErrorsAud.Items.Add(trim(qry_Items.FieldByName('Itemnumber').AsString) + ' -> Item in Location ' + qry_Items.FieldByName('LocNo').AsString + '/' + IntToStr(qry_Items.FieldByName('RecordNo').AsInteger) + ' but not Scanned.');
          mStr := mStr + ' -> Not Scanned';
        end
      else mStr := mStr + ' -> Matched';

      lst_ExistingRecs.Items.Add(mStr);
      qry_Items.Next;
    end;
  qry_Items.Close;
//-------------Check List against Items in Location----------------
  qry_Items.Close;
  qry_Items.SQL.Clear;
  qry_Items.SQL.Add('SELECT Itemnumber, Warehouse, LocNo, Recordno, Status');
  qry_Items.SQL.Add('FROM Items');
  qry_Items.SQL.Add('WHERE Itemnumber IN (');
  For i := 0 to lst_BatchAud.Items.Count-1 Do
    begin
      mpos := Pos('>',lst_BatchAud.Items[i]);
      mchars := mpos - 5;                   // _---> get position
      mLocNo := Copy(lst_BatchAud.Items[i],1,mchars);
//-----------------
      mchars := (length(lst_BatchAud.Items[i]) - mpos);
      Inc(mpos);
      mItemBcode := Trim(Copy(lst_BatchAud.Items[i],mpos,mchars));
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
//-----------------
      qry_Items.SQL.Add(QuotedStr(mItemBcode)+',');
    end;
  qry_Items.SQL.Add('''@#$@#$@#$@#$@#$'')');
  qry_Items.Open;
//------------
  for i := 0 to lst_BatchAud.Items.Count-1 do
    begin
      mpos := Pos('>',lst_BatchAud.Items[i]);
      mchars := mpos - 5;                   // _---> get position
      mLocNo := Copy(lst_BatchAud.Items[i],1,mchars);
//-----------------
      mchars := (length(lst_BatchAud.Items[i]) - mpos);
      Inc(mpos);
      mItemBcode := Trim(Copy(lst_BatchAud.Items[i],mpos,mchars));
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
//------------
      If not qry_Items.Locate('Itemnumber', mItemBcode, []) Then
        begin
          lst_ErrorsAud.Items.Add(mItemBCode + ' -> Item not defined in system.');
          Continue;
        end;
//------------
      If (trim(qry_Items.FieldByName('Warehouse').AsString) = '')AND
         (trim(qry_Items.FieldByName('LocNo').AsString) = '')Then
        begin
          lst_ErrorsAud.Items.Add(mItemBCode + ' -> Item not in a Location. ');
          Continue;
        end;
      If (trim(qry_Items.FieldByName('Warehouse').AsString) <> trim(Warehouse))OR
         (trim(qry_Items.FieldByName('LocNo').AsString) <> trim(mLocNo))Then
        begin
          lst_ErrorsAud.Items.Add(mItemBCode + ' -> Item in different Location ' + qry_Items.FieldByName('LocNo').AsString + '/' + IntToStr(qry_Items.FieldByName('RecordNo').AsInteger) + '.');
          Continue;
        end;
//------------
    end;
//---------------------------------<>
finally
  qry_Items.Close;
  qry_SQL.Close;
  btn_ProcessAud.Enabled := not(ErrorFlag);
  Screen.Cursor := crDefault;
end;
end;

procedure Tfram_AuditLocItems.edt_AuditWHouseChange(Sender: TObject);
begin
  btn_ProcessAud.Enabled := false;
  lst_BatchAud.Items.Clear;
  lst_ExistingRecs.Items.Clear;
  lst_ErrorsAud.Items.Clear;
  edt_Location.Text := '';
end;

procedure Tfram_AuditLocItems.edt_AuditWHouseKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_AuditWHouse.Text := '';
      lbl_AuditWHouse.Caption := '---';
    end;
end;

end.
