unit Email;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, Menus;

type
  Tfrm_Email = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Btn_Out: TRadioButton;
    btn_Close: TBitBtn;
    Nav_Mail: TDBNavigator;
    btn_Send: TBitBtn;
    QRY_MAIL: TQuery;
    MailSource: TDataSource;
    Panel4: TPanel;
    Label7: TLabel;
    edit_Subject: TDBEdit;
    LBox_Subject: TDBLookupListBox;
    Panel5: TPanel;
    Label2: TLabel;
    From_Box: TDBEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Label3: TLabel;
    Edit_Date: TDBEdit;
    Label4: TLabel;
    Edit_Time: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Status_Box: TDBEdit;
    Label8: TLabel;
    Edit_Message: TDBMemo;
    Panel11: TPanel;
    btn_In: TRadioButton;
    btn_New: TRadioButton;
    btn_Sent: TRadioButton;
    grp_BoxRFile: TGroupBox;
    dis_FileNo: TDBText;
    rad_ReqFile: TRadioButton;
    rad_RemoveQ: TRadioButton;
    btn_Process: TBitBtn;
    Qry_Add: TQuery;
    QRY_MAILTran_No: TAutoIncField;
    QRY_MAILMfrom: TStringField;
    QRY_MAILMTo: TStringField;
    QRY_MAILMDate: TDateField;
    QRY_MAILMTime: TStringField;
    QRY_MAILMessge: TStringField;
    QRY_MAILStatus: TStringField;
    QRY_MAILMFileNumber: TStringField;
    QRY_MAILSubject: TStringField;
    lbl_RecNo: TLabel;
    tbl_Record: TTable;
    tbl_Up: TTable;
    tbl_Pick: TTable;
    Panel12: TPanel;
    Label9: TLabel;
    dts_Deliver: TDataSource;
    tbl_Deliver: TTable;
    editDeliverMethod: TDBLookupComboBox;
    To_Box: TDBLookupComboBox;
    dts_To: TDataSource;
    tbl_To: TTable;
    procedure Nav_MailClick(Sender: TObject; Button: TNavigateBtn);
    procedure Btn_InClick(Sender: TObject);
    procedure Btn_OutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_SendClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_NewClick(Sender: TObject);
    procedure LBox_SubjectClick(Sender: TObject);
    procedure QRY_MAILBeforePost(DataSet: TDataSet);
    procedure QRY_MAILAfterCancel(DataSet: TDataSet);
    procedure QRY_MAILAfterPost(DataSet: TDataSet);
    procedure btn_SentClick(Sender: TObject);
    procedure btn_ProcessClick(Sender: TObject);
  private
    { Private declarations }
    procedure To_box_update;
    procedure Update_All;
  public
    { Public declarations }
  end;

var
  frm_Email  : Tfrm_Email;
  Nw        :Boolean;

implementation

Uses main;

{$R *.DFM}


procedure Tfrm_Email.Update_All;
Begin
  qry_mail.Close;
  qry_mail.open;
End;

PROCEDURE Tfrm_Email.To_Box_Update;
Begin
  From_Box.Text := User;
(*
  To_Box.Items.Clear;
  qry_Add.Sql.Clear;
  qry_Add.Sql.Add('SELECT * FROM AUTHORITY_CODE');
  qry_Add.Open;
  qry_Add.first;
  While not qry_Add.EOF Do
    Begin
      To_Box.Items.Add(qry_Add.FieldByName('Authority_Code').AsString);
      qry_Add.Next;
    End;
  qry_Add.Close;
  To_Box.Style := csDropDownList;
  To_Box.Readonly := False;
*)
End;

procedure Tfrm_Email.Nav_MailClick(Sender: TObject;
  Button: TNavigateBtn);
Var
  Tel,T     :LongInt;
  Flag      :Boolean;
  New       :String[50];
begin
     if (qry_Mail.FieldByName('MFileNumber').AsString > '')
        then
        begin
        btn_Process.Enabled := true;
        rad_RemoveQ.Enabled := true;
        rad_ReqFile.Enabled := true;
        grp_BoxRFile.Enabled := true;
        lbl_RecNo.Enabled := true;
        editDeliverMethod.Enabled := true;
        end
        else
        begin
        btn_Process.Enabled := false;
        rad_RemoveQ.Enabled := false;
        rad_ReqFile.Enabled := false;
        grp_BoxRFile.Enabled := false;
        lbl_RecNo.Enabled := false;
        editDeliverMethod.Enabled := false;
        end;
  If Button = nbPrior Then
    Begin
      Nw := False;
      If (qry_Mail.FieldByName('Status').AsString = 'N')and
        (User = qry_Mail.Fields[2].AsString) Then
           Begin
             qry_Mail.Edit;
             Status_Box.Text := 'I';
             qry_Mail.Post;
           End;
    End;
  If Button = nbNext  Then
    Begin
      Nw := False;
      If (qry_Mail.FieldByName('Status').AsString = 'N')and
        (User = qry_Mail.Fields[2].AsString) Then
           Begin
             qry_Mail.Edit;
             Status_Box.Text := 'I';
             qry_Mail.Post;
           End;
    End;
  If Button = nbInsert Then
    Begin
      qry_mail.Cancel;
      btn_Out.Checked := True;
      qry_mail.Insert;
      Nw := True;
      To_Box_Update;
      Tel := 0;
      Status_Box.Text := 'O';
    End;
  If Button = nbDelete Then
    Begin
      Nw := False;
      If (qry_Mail.FieldByName('Status').AsString = 'N')and
        (User = qry_Mail.Fields[2].AsString) Then
           Begin
             qry_Mail.Edit;
             Status_Box.Text := 'I';
             qry_Mail.Post;
           End;
    End;
  If Button = nbEdit Then
    Begin
      Nw := False;
      To_Box_Update;
    End;
  If Button = nbPost Then
    Begin
      qry_Mail.Close;
      qry_mail.Open;
      Nw := False;
    End;

end;

procedure Tfrm_Email.Btn_InClick(Sender: TObject);
begin
  qry_mail.Sql.Clear;
  qry_mail.Sql.Add('SELECT * FROM USERMAIL WHERE (MTO = :ID AND STATUS = "I")');
  qry_mail.Params[0].AsString := User;
  qry_mail.Open;
  qry_mail.First;
     if (qry_Mail.FieldByName('MFileNumber').AsString > '')
        then
        begin
        btn_Process.Enabled := true;
        rad_RemoveQ.Enabled := true;
        rad_ReqFile.Enabled := true;
        grp_BoxRFile.Enabled := true;
        lbl_RecNo.Enabled := true;
        editDeliverMethod.Enabled := true;
        end
        else
        begin
        btn_Process.Enabled := false;
        rad_RemoveQ.Enabled := false;
        rad_ReqFile.Enabled := false;
        grp_BoxRFile.Enabled := false;
        lbl_RecNo.Enabled := false;
        editDeliverMethod.Enabled := false;
        end;

end;

procedure Tfrm_Email.Btn_OutClick(Sender: TObject);
begin
  qry_mail.Close;
  qry_mail.Sql.Clear;
  qry_mail.Sql.Add('SELECT * FROM USERMAIL WHERE(MFROM = :ID AND STATUS = "O")');
  qry_mail.Params[0].AsString := User;
  qry_mail.Open;
  qry_mail.First;
   if (qry_Mail.FieldByName('MFileNumber').AsString > '')
        then
        begin
        btn_Process.Enabled := true;
        rad_RemoveQ.Enabled := true;
        rad_ReqFile.Enabled := true;
        grp_BoxRFile.Enabled := true;
        lbl_RecNo.Enabled := true;
        editDeliverMethod.Enabled := true;
        end
        else
        begin
        btn_Process.Enabled := false;
        rad_RemoveQ.Enabled := false;
        rad_ReqFile.Enabled := false;
        grp_BoxRFile.Enabled := false;
        lbl_RecNo.Enabled := false;
        editDeliverMethod.Enabled := false;
        end;
  end;

procedure Tfrm_Email.FormCreate(Sender: TObject);
begin
     tbl_deliver.Active := true;
     tbl_To.Active := true;
 btn_New.Checked := True;
 btn_NewClick(Sender);
END;

procedure Tfrm_Email.btn_SendClick(Sender: TObject);
Var
 TTo,TFrom,TMessge,TSubject    :String;

begin
  iF status_Box.text = 'O' then
    Begin
      Nw := True;
      TFrom  := qry_mail.Fields[1].AsString;
      TTo  := qry_mail.Fields[2].AsString;
      TMessge  := qry_mail.Fields[5].AsString;
      TSubject  := qry_mail.Fields[8].AsString;
      qry_Mail.Edit;
      Status_Box.Text := 'S';
      qry_Mail.Post;
      qry_mail.Insert;
      qry_mail.Fields[1].AsString := TFrom;
      qry_mail.Fields[2].AsString := TTo;
      qry_mail.FieldByName('Status').AsString := 'N';
      qry_mail.Fields[5].AsString := TMessge;
      qry_mail.Fields[8].AsString := TSubject;
      qry_mail.Post;
      Nw := False;
      Update_All;
    end;
  iF status_Box.text = 'S'then
    Begin
      Nw := True;
      TFrom  := qry_mail.Fields[1].AsString;
      TTo  := qry_mail.Fields[2].AsString;
      TMessge  := qry_mail.Fields[5].AsString;
      TSubject  := qry_mail.Fields[6].AsString;
      qry_mail.Insert;
      qry_mail.Fields[1].AsString := TFrom;
      qry_mail.Fields[2].AsString := TTo;
      qry_mail.FieldByName('Status').AsString := 'N';
      qry_mail.Fields[5].AsString := TMessge;
      qry_mail.Fields[8].AsString := TSubject;
      qry_mail.Post;
      Nw := False;
      Update_All;
    end
end;


procedure Tfrm_Email.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qry_mail.Close;
   qry_add.Close;
   tbl_Deliver.Active := false;
   tbl_To.Active := false;
   frm_console.btn_Mail.Enabled := True;
   Action := caFree;
end;

procedure Tfrm_Email.btn_CloseClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Email.btn_NewClick(Sender: TObject);
begin
  qry_mail.close;
  qry_mail.Sql.Clear;
  qry_mail.Sql.Add('SELECT * FROM USERMAIL WHERE (MTO = :ID AND STATUS = "N")');
  qry_mail.Params[0].AsString := User;
  qry_mail.Open;
  qry_mail.First;
   if (qry_Mail.FieldByName('MFileNumber').AsString > '')
        then
        begin
        btn_Process.Enabled := true;
        rad_RemoveQ.Enabled := true;
        rad_ReqFile.Enabled := true;
        grp_BoxRFile.Enabled := true;
        lbl_RecNo.Enabled := true;
        editDeliverMethod.Enabled := true;
        end
        else
        begin
        btn_Process.Enabled := false;
        rad_RemoveQ.Enabled := false;
        rad_ReqFile.Enabled := false;
        grp_BoxRFile.Enabled := false;
        lbl_RecNo.Enabled := false;
        editDeliverMethod.Enabled := false;
        end;
  Nw := False;
  If (qry_Mail.FieldByName('Status').AsString = 'N')and
   (User = qry_Mail.Fields[2].AsString) Then
     Begin
       qry_Mail.Edit;
       Status_Box.Text := 'I';
       qry_Mail.Post;
     End;
end;

procedure Tfrm_Email.LBox_SubjectClick(Sender: TObject);
begin
   if (qry_Mail.FieldByName('MFileNumber').AsString > '')
        then
        begin
        btn_Process.Enabled := true;
        rad_RemoveQ.Enabled := true;
        rad_ReqFile.Enabled := true;
        grp_BoxRFile.Enabled := true;
        lbl_RecNo.Enabled := true;
        editDeliverMethod.Enabled := true;
        end
        else
        begin
        btn_Process.Enabled := false;
        rad_RemoveQ.Enabled := false;
        rad_ReqFile.Enabled := false;
        grp_BoxRFile.Enabled := false;
        lbl_RecNo.Enabled := false;
        editDeliverMethod.Enabled := false;
        end;
//----------------------->>>>
  Nw := False;
  If (qry_Mail.FieldByName('Status').AsString = 'N')and
    (User = qry_Mail.Fields[2].AsString) Then
       Begin
         qry_Mail.Edit;
         Status_Box.Text := 'I';
         qry_Mail.Post;
       End;
end;

procedure Tfrm_Email.qry_MAILBeforePost(DataSet: TDataSet);
begin
  If Nw = True Then
    Begin
      qry_mail.Fields[3].Value := Date;
      qry_mail.Fields[4].AsString := TimetoStr(Time);
    End;
end;

procedure Tfrm_Email.qry_MAILAfterCancel(DataSet: TDataSet);
begin
(* To_Box.Style := csDropDown;
 To_Box.Readonly := True;
 *)
end;

procedure Tfrm_Email.qry_MAILAfterPost(DataSet: TDataSet);
begin
(* To_Box.Style := csDropDown;
 To_Box.Readonly := True;
 *)
end;


procedure Tfrm_Email.btn_SentClick(Sender: TObject);
begin
  qry_mail.Sql.Clear;
  qry_mail.Sql.Add('SELECT * FROM USERMAIL WHERE(MFROM = :ID AND STATUS = "S")');
  qry_mail.Params[0].AsString := User;
  qry_mail.Open;
  qry_mail.First;
end;




procedure Tfrm_Email.btn_ProcessClick(Sender: TObject);
var
bcode :string;
i :integer;
mtx_no :integer;
mtx :integer;
mloc :string;
mware :string;
LocateSuccess :Boolean;
SearchOptions: TlocateOptions;
muser,mfile :string;
mMessage :string;
begin
if (rad_RemoveQ.Checked = false) and (rad_ReqFile.Checked = false)
then begin
    MessageDlg('Select to request the file or to remove your user from the file requester que!',mtError,[mbOK],0);
    exit;
end;

if (rad_RemoveQ.Checked = true)
then begin
  bcode := qry_Mail.FieldByName('MFileNumber').AsString;
  tbl_Record.Active := false;
  tbl_Record.TableName := 'FILES.DB';
  tbl_Record.Active := true;
  //-->
  SearchOptions := [loCaseInsensitive];
  LocateSuccess := tbl_Record.Locate('FileNumber',bcode,SearchOptions);
  if LocateSuccess = TRUE
  then begin
//--------------------------------------
//need to change the requester Queu
//--------------------------------------
tbl_Record.Edit;
tbl_Record['Reserve1'] := tbl_Record.FieldByName('Reserve2').AsString;
tbl_Record['ResDate1'] := tbl_Record.FieldByName('ResDate2').Value;
tbl_Record['Reserve2'] := tbl_Record.FieldByName('Reserve3').AsString;
tbl_Record['ResDate2'] := tbl_Record.FieldByName('ResDate3').Value;
tbl_Record['Reserve3'] := '';
tbl_Record['ResDate3'] := Null;
tbl_Record.Post;
//Update the Message
qry_Mail.Edit;
qry_Mail.Fields[7].Text := '';  //reset filenumber to prevent double requests
mMessage := qry_Mail.Fields[5].Text;
qry_Mail.Fields[5].Text := mMessage + '>>>==> The System has removed you from the requester queue.';
qry_Mail.Post;
btn_Process.Enabled := false;
rad_RemoveQ.Enabled := false;
rad_ReqFile.Enabled := false;
grp_BoxRFile.Enabled := false;
lbl_RecNo.Enabled := false;
editDeliverMethod.Enabled := false;
MessageDlg('User Removed from the requester Queue.',mtInformation,[mbOK],0);
end;
exit;
end;
//else this is a request file
//--------------------------------------
if length(editDeliverMethod.Text) = 0
then begin
    MessageDlg('Select a Delivery Method!!',mtError,[mbOK],0);
    exit;
end;
//create pick entry
//get transaction no ex company database
tbl_Up.Active := false;
tbl_Up.Exclusive := true;
tbl_Up.Active := true;
tbl_Up.First;
mtx_no := 0;
mtx_no := tbl_Up.FieldByName('NextPick').AsInteger;
if mtx_no = 0
   then mtx_no := 1;
mtx := 0;
mtx := mtx_no + 1;
tbl_Up.Edit;
tbl_Up['NextPick'] := mtx;
tbl_Up.Post;
tbl_Up.Active := false;
tbl_Up.Exclusive := false;
//-------
tbl_Pick.Active := true;
tbl_Pick.Insert;
tbl_Pick['Tx_No'] := mtx_no;
tbl_Pick['Requester'] := to_Box.Text;
tbl_Pick['Deliver'] := editDeliverMethod.Text;
tbl_Pick['TxDate'] := date;
tbl_Pick['TxTime'] := time;
tbl_Pick['UserId'] := User;
tbl_Pick['Type'] := 'RR';
tbl_Pick['TypeDesc'] := 'Retrieval';
tbl_Pick['Status'] := 'O';
tbl_Pick.Post;
tbl_Pick.Active := false;
//-------
//mtx_no
//--------
  bcode := qry_Mail.FieldByName('MFileNumber').AsString;
  tbl_Record.Active := false;
  tbl_Record.TableName := 'FILES.DB';
  tbl_Record.Active := true;
//-------------------------------------
//-------------------------------------
  SearchOptions := [loCaseInsensitive];
  LocateSuccess := tbl_Record.Locate('FileNumber',bcode,SearchOptions);
  if LocateSuccess = TRUE
  then begin
  if tbl_Record['IssueStatus'] <> 'IN' then
     begin
     tbl_Record.Edit;
     if length(tbl_Record.FieldByName('Reserve1').AsString) = 0 then
        tbl_Record['Reserve1'] := User else
     if length(tbl_Record.FieldByName('Reserve2').AsString) = 0 then
        tbl_Record['Reserve2'] := User else
     if length(tbl_Record.FieldByName('Reserve3').AsString) = 0 then
        tbl_Record['Reserve3'] := User;
     muser := tbl_Record.FieldByName('IssuedTo').AsString;
     mfile := tbl_Record['FileNumber'];
     MessageDlg('File Number ' + mfile + ' - has been withdrawn by: ' + muser + ' on the ' +  tbl_Record.FieldByName('IssuedOn').AsString + ', the System has reserved the File again for you',mtInformation,[mbOK],0);
     tbl_Record.Post;
     exit;
    end;
//-----------------------------------------------
//need to flag that the file has been requested
//-----------------------------------------------
tbl_Record.Edit;
//tbl_Record['IssueStatus'] := 'REQ';            //Requested
tbl_Record['Reserve1'] := tbl_Record.FieldByName('Reserve2').AsString;
tbl_Record['Reserve2'] := tbl_Record.FieldByName('Reserve3').AsString;
tbl_Record['Reserve3'] := '';
tbl_Record.Post;
//--------------------------------------
  mloc := tbl_Record['locno'];
  mware := tbl_Record['warehouse'];
  tbl_Record.Active := false;
  tbl_Record.TableName := 'LOCATION.DB';
  tbl_Record.Active := true;
  SearchOptions := [loCaseInsensitive];
  LocateSuccess := tbl_Record.Locate('Warehouse;LocNo',VarArrayOf([mware,mloc]),SearchOptions);
  if LocateSuccess = TRUE
  then begin
  tbl_Pick.Active := false;
  tbl_Pick.TableName := 'PICKD.DB';
  tbl_Pick.Active := true;
tbl_Pick.Insert;
tbl_Pick['Tx_No'] := mtx_no;
tbl_Pick['Barcode'] := bcode;
tbl_Pick['warehouse'] := mware;
tbl_Pick['row'] := tbl_Record['rownum'];
tbl_Pick['level'] := tbl_Record['levelnum'];
tbl_Pick['bay'] := tbl_Record['bay'];
tbl_Pick['locno'] := mloc;
tbl_Pick.Post;
tbl_Pick.Active := false;
tbl_Record.Active := false;
end;               //if locate a success in location
                    //if locate a success in box
//-----------------------------
end;
qry_Mail.Edit;
qry_Mail.Fields[7].Text := '';  //reset filenumber to prevent double requests
mMessage := qry_Mail.Fields[5].Text;
qry_Mail.Fields[5].Text := mMessage + '>>>==> The System has requested the file for you.';
qry_Mail.Post;
btn_Process.Enabled := false;
rad_RemoveQ.Enabled := false;
rad_ReqFile.Enabled := false;
grp_BoxRFile.Enabled := false;
lbl_RecNo.Enabled := false;
editDeliverMethod.Enabled := false;

MessageDlg('Pick list created',mtInformation,[mbOK],0);
//if list box has entries
end;

end.
