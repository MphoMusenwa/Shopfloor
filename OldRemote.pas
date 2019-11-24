unit OldRemote;

interface

uses
  Windows, Messages, WinTypes,WinProcs,SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs,StdCtrls, ComCtrls, Buttons, DB, DBTables, DBCtrls,ExtCtrls,
  Grids,DBGrids, Mask, Tabnotbk, Printers, FileCtrl;

type
  Tfrm_Remote = class(TForm)
    tbl_Up: TTable;
    tbl_Pick: TTable;
    ntb_Remote: TTabbedNotebook;
    Panel1: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    editBarcode: TEdit;
    btn_Search: TBitBtn;
    btn_Remote: TBitBtn;
    edtPickCancel: TBitBtn;
    ListBoxPick: TListBox;
    btn_SelectAll: TBitBtn;
    ResultGrid: TDBGrid;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    Panel5: TPanel;
    grid_Pick: TDBGrid;
    ScrollBox1: TScrollBox;
    Label9: TLabel;
    editRName: TEdit;
    BitBtn2: TBitBtn;
    nav_Pickd: TDBNavigator;
    grid_Pickd: TDBGrid;
    BitBtn5: TBitBtn;
    tbl_Remote: TTable;
    tbl_RemoteD: TTable;
    src_Remote: TDataSource;
    src_Remoted: TDataSource;
    qry_Remote: TQuery;
    qry_RemoteD: TQuery;
    PrintDialog: TPrintDialog;
    BitBtn3: TBitBtn;
    qry_Delslip: TQuery;
    qry_DelSlipP: TQuery;
    Panel2: TPanel;
    Label28: TLabel;
    NoRecs: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label30: TLabel;
    editRecordType: TDBLookupComboBox;
    edit_WareHouse: TDBLookupComboBox;
    edt_Department: TComboBox;
    edt_Branch: TComboBox;
    editWCode: TDBEdit;
    edt_rqstr: TDBLookupComboBox;
    dts_Requester: TDataSource;
    dts_Whouse: TDataSource;
    qry_Whouse: TQuery;
    dts_FileType: TDataSource;
    qry_FileType: TQuery;
    tbl_Requester: TTable;
    qry_Branch: TQuery;
    qry_FilesMain: TQuery;
    dts_Files: TDataSource;
    qry_Record: TQuery;
    ScrollBox2: TScrollBox;
    lbl_Text1: TLabel;
    lbl_Text2: TLabel;
    lbl_Text3: TLabel;
    lbl_Text4: TLabel;
    lbl_Text5: TLabel;
    lbl_Text6: TLabel;
    Field1: TLabel;
    field2: TLabel;
    field3: TLabel;
    field4: TLabel;
    field5: TLabel;
    field6: TLabel;
    field7: TLabel;
    field8: TLabel;
    lbl_Date1: TLabel;
    lbl_Date2: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    lbl_No1: TLabel;
    lbl_No2: TLabel;
    Label54: TLabel;
    field9: TLabel;
    field10: TLabel;
    edt_Text1: TEdit;
    edt_Text2: TEdit;
    edt_Text3: TEdit;
    edt_Text4: TEdit;
    edt_Text5: TEdit;
    edt_Text6: TEdit;
    edt_Date1: TMaskEdit;
    edt_Date2: TMaskEdit;
    edt_No1: TEdit;
    edt_No2: TEdit;
    qry_RecordType: TQuery;
    qry_FilesSearch: TQuery;
    dts_FilesSearch: TDataSource;
    qry_Dept: TQuery;
    dts_Browse: TDataSource;
    qry_BrowseOffSite: TQuery;
    btn_RemovePick: TBitBtn;
    qry_Container: TQuery;
    Panel3: TPanel;
    Label4: TLabel;
    edt_FileNo: TDBEdit;
    Label10: TLabel;
    edt_ListContainer: TDBEdit;
    Label11: TLabel;
    editCName: TEdit;
    DBNavigator2: TDBNavigator;
    DBGrid1: TDBGrid;
    Label12: TLabel;
     procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_ReqReturnClick(Sender: TObject);
    procedure ListBoxPickDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBoxPickDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure edtPickCancelClick(Sender: TObject);
    procedure btn_RemoteClick(Sender: TObject);
    procedure BuildBranch;
    procedure btn_SelectAllClick(Sender: TObject);
    procedure ntb_RemoteChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure editRecordTypeCloseUp(Sender: TObject);
    procedure edt_DepartmentChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure edt_BranchClick(Sender: TObject);
    procedure btn_RemovePickClick(Sender: TObject);

  private
    { Private declarations }
    mView :String;
    procedure BuildDept;
  public
    { Public declarations }
  end;

var
  frm_Remote: Tfrm_Remote;
  Tipe            :Integer;

implementation

uses main;

{$R *.DFM}

procedure Tfrm_Remote.FormCreate(Sender: TObject);
begin
//=====Don't display fields = no record type selected===========================
  lbl_Text1.Visible := false;
  edt_Text1.Visible := false;
  lbl_Text2.Visible := false;
  edt_Text2.Visible := false;
  lbl_Text3.Visible := false;
  edt_Text3.Visible := false;
  lbl_Text4.Visible := false;
  edt_Text4.Visible := false;
  lbl_Text6.Visible := false;
  edt_Text5.Visible := false;
  lbl_Text6.Visible := false;
  edt_Text6.Visible := false;
  lbl_Date1.Visible := false;
  edt_Date1.Visible := false;
  lbl_Date2.Visible := false;
  edt_Date2.Visible := false;
  lbl_No1.Visible := false;
  edt_No1.Visible := false;
  lbl_No2.Visible := false;
  edt_No2.Visible := false;
//=============================build the branch=================================
  qry_Branch.Active := false;
  qry_Branch.Params[0].AsString := User;
  qry_Branch.Active := true;
  BuildBranch;
  qry_Branch.Active := false;
//============================build the warehouse===============================
{  qry_WHouse.Active := false;
  qry_WHouse.Params[0].AsString := User;
  qry_WHouse.Active := true;
  qry_WHouse.First;}
//============================build the Requester===============================
  tbl_Requester.Active := True;
  tbl_Requester.First;
//==============================================================================
  Screen.Cursor := crDefault;
  ntb_Remote.PageIndex := 0;
end;

procedure Tfrm_Remote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_Branch.Active := false;
  qry_Dept.Active := false;
  qry_Whouse.Active := false;
  qry_FileType.Active := false;
  qry_FilesMain.Active := false;
  qry_Record.Active := false;
  qry_Remote.Active := false;
  qry_RemoteD.Active := false;
  qry_DelSlip.Active := false;
  qry_DelSlipP.Active := false;
  tbl_Remote.Active := false;
  tbl_RemoteD.Active := false;
  tbl_Requester.Active := false;
  tbl_Up.Active := false;
  tbl_Pick.Active := false;
  frm_Console.btn_Remote.Enabled := true;
  Action := caFree;
end;

procedure Tfrm_Remote.btn_ReqReturnClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Remote.ListBoxPickDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  Place :Integer;
  mname :string;
  matched :bool;
begin
if Source is TDBGrid then
  begin
//==============================================================================
//=================check that this is not a duplicate===========================
//==============================================================================
    mname := qry_FilesSearch.fieldbyname('FILENUMBER').asString;
    matched := false;
    if ListBoxPick.Items.Count > 0 then
      begin
        for x := 0 to ListBoxPick.Items.Count-1 do
          begin
            if ListBoxPick.Items[x] = mname then
              begin
                matched := true;
                break;
              end;
          end; //for next
      end; //listbox items > 0
    if matched = false then
      ListBoxPick.Items.Add(mname)
    else
      MessageDlg('File already added to picking list',mtError,[mbOK],0);
  end;
end;

procedure Tfrm_Remote.ListBoxPickDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Source is TDBGrid then
    Accept := true;
end;

procedure Tfrm_Remote.edtPickCancelClick(Sender: TObject);
begin
  if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    ListBoxPick.Items.Clear;
end;

procedure Tfrm_Remote.btn_RemoteClick(Sender: TObject);
var
  bcode           :string;
  i, mtx_no, mtx  :integer;
  mloc, mware     :string;
  LocateSuccess   :Boolean;
  SearchOptions   :TlocateOptions;
  muser,mfile     :string;
begin
  if length(edt_rqstr.Text) = 0 then
    begin
      MessageDlg('Select a Requester!!',mtError,[mbOK],0);
      exit;
    end;
  if listBoxPick.Items.Count = 0 then
    begin
      MessageDlg('No Picking Slip entries created',mtError,[mbOK],0);
      exit;
    end;
  if listBoxPick.Items.Count > 0 then
    begin
      tbl_Up.Active := false;
      tbl_Up.Exclusive := true;
      tbl_Up.Active := true;
      tbl_Up.First;
      mtx_no := 0;
      mtx_no := tbl_Up.FieldByName('NextPick').AsInteger;
      if mtx_no = 0 then
        mtx_no := 1;
      mtx := 0;
      mtx := mtx_no + 1;
      tbl_Up.Edit;
      tbl_Up['NextPick'] := mtx;
      tbl_Up.Post;
      tbl_Up.Active := false;
      tbl_Up.Exclusive := false;
      tbl_Pick.Active := true;
      tbl_Pick.Append;
      tbl_Pick['Tx_No'] := mtx_no;
      tbl_Pick['Requester'] := edt_rqstr.Text;
      tbl_Pick['TxDate'] := now;
      tbl_Pick['UserId'] := User;
      tbl_Pick['Status'] := 'O';
      tbl_Pick.Post;
      tbl_Pick.Active := false;
      for i := 0 to ListBoxPick.Items.Count-1 do
        begin
          qry_Record.Active := False;
          qry_Record.SQL.Clear;
          qry_Record.SQL.Add('SELECT * FROM FILES WHERE FILENUMBER = :FN');
          qry_Record.ParamByName('FN').DataType := ftString;
          qry_Record.ParamByName('FN').asSTring := ListBoxPick.Items[i];
          qry_Record.RequestLive := True;
          qry_Record.Active := True;
          If not qry_Record.IsEmpty Then
            begin
              if qry_Record['IssueStatus'] <> 'CON' then
                begin
                  muser := qry_Record.FieldByName('IssuedTo').AsString;
                  mfile := qry_Record['FileNumber'];
                  MessageDlg('Record Number ' + mfile + ' - is not in a Container.',mtInformation,[mbOK],0);
                  Continue;
                end;
//==============================================================================
//need to flag that the file has been requested
//==============================================================================
              qry_Container.Active := False;
              qry_Container.ParamByName('CO').asString := qry_Record.FieldbyName('CONTAINERNO').asString;
              qry_Container.Active := True;
              If not qry_Container.IsEmpty Then
                begin
                  if qry_Container['IssueStatus'] <> 'MET' then
                    begin
                      MessageDlg('Container ' + qry_Container['CONTAINER'] + ' - is not Offsite.',mtInformation,[mbOK],0);
                      Continue;
                    end;
                  tbl_Pick.Active := false;
                  tbl_Pick.TableName := 'RemoteD';
                  tbl_Pick.Active := true;
                  tbl_Pick.Append;
                  tbl_Pick['Tx_No'] := mtx_no;
                  tbl_Pick['Barcode'] := ListBoxPick.Items[i];
                  tbl_Pick['Container'] := qry_Container['CONTAINER'];
                  tbl_Pick.Post;
                  tbl_Pick.Active := false;
                  qry_Record.Active := false;
                  qry_Container.Active := false;
                end;
            end;
        end;
    end;
  MessageDlg('Record Requested from Off-Site Storage',mtInformation,[mbOK],0);
end;

procedure Tfrm_Remote.BuildBranch;
begin
  qry_Branch.First;
  if qry_Branch.EOF then
    begin
      MessageDlg('No Branch Rights have been granted to you!!',mtError,[mbOK],0);
      exit;
    end;
  while not( qry_Branch.EOF ) do
    begin
      edt_Branch.Items.Add(qry_Branch.FieldByName('Name').AsString);
      qry_Branch.Next;
    end;                //while ! eof()
end;

procedure Tfrm_Remote.BuildDept;
var
dcode :string;
begin
  qry_Dept.Active := false;
  qry_Dept.Params[0].AsString := User;
  qry_Dept.Params[1].AsString := edt_Branch.Text;
if qry_Dept.Params[1].AsString > '' then
begin
  qry_Dept.Active := true;
  qry_Dept.First;
  if qry_Dept.isEmpty then
  begin
//  MessageDlg('No Department rights have been granted to your user id',mtError,[mbOK],0);
  qry_Dept.Active := false;
  exit;
  end;
  edt_Department.Items.Clear;
  while not( qry_Dept.EOF ) do
  begin
      edt_Department.Items.Add(qry_Dept.FieldByName('DeptName').AsString);
      qry_Dept.Next;
  end;                //while ! eof()
  qry_Dept.Active := false;
end;    //Check for valid branch selection
end;

procedure Tfrm_Remote.btn_SelectAllClick(Sender: TObject);
var
  Place,x      :Integer;
  mname        :string;
  matched      :bool;

begin
  qry_FilesSearch.First;
  While not qry_FilesSearch.EOF Do
    begin
      mname := qry_FilesSearch.fieldbyname('FILENUMBER').asString;
      matched := false;
      if ListBoxPick.Items.Count > 0 then
        begin
          for x := 0 to ListBoxPick.Items.Count-1 do
            begin
              if ListBoxPick.Items[x] = mname then
                begin
                  matched := true;
                  break;
                end;
            end; //for next
        end; //listbox items > 0
     if matched = false then
       ListBoxPick.Items.Add(mname);
     qry_FilesSearch.Next;
    end;
end;





procedure Tfrm_Remote.ntb_RemoteChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
Var
  LocateSuccess :Boolean;
  TempItem      :TTreeNode;
begin
  If NewTab = 1 Then
    begin
      tbl_RemoteD.Active := False;
      tbl_Remote.Active := False;
      tbl_Remote.Active := True;
      tbl_RemoteD.Active := True;
    end;
  If NewTab = 2 Then
    begin
      qry_BrowseOffSite.Active := false;
      qry_BrowseOffSite.SQL.Clear;
      qry_BrowseOffSite.SQL.Add('SELECT * FROM Containers WHERE (IssueStatus = ''MET'')OR(IssueStatus = ''MIN'') ORDER BY Container');
      qry_BrowseOffSite.Active := True;
      qry_BrowseOffSite.First;
    end;
end;





procedure Tfrm_Remote.BitBtn2Click(Sender: TObject);
Var
  LocateSuccess    :Boolean;
begin
  If (edt_FileNo.Text = editRName.Text)and
     (edt_ListContainer.Text = editCName.Text)Then
    begin
      qry_Container.Active := False;
      qry_Container.ParamByName('CO').asString := editCName.Text;
      qry_Container.RequestLive := True;
      qry_Container.Active := True;
      If qry_Container.IsEmpty Then
        begin
          MessageDlg('Container not found !!',mtError,[mbOK],0);
          qry_Container.Active := False;
          exit;
        end;

      qry_Record.Active := False;
      qry_Record.SQL.Clear;
      qry_Record.SQL.Add('SELECT * FROM FILES WHERE FILENUMBER = :FN');
      qry_Record.ParamByName('FN').asSTring := edt_FileNo.Text;
      qry_Record.RequestLive := True;
      qry_Record.Active := True;
      If qry_Record.IsEmpty Then
        begin
          MessageDlg('Record not found !!',mtError,[mbOK],0);
          qry_Container.Active := False;
          qry_Record.Active := False;
          exit;
        end;

      qry_Container.edit;
      qry_Container.FieldByName('ISSUEDTO').AsString := tbl_Remote.fieldbyname('REQUESTER').AsString;
      qry_Container.FieldByName('ISSUEDON').Value := Date;
      qry_Container.FieldByName('IssueStatus').AsString := 'MIN';
      qry_Container.Post;



      qry_Record.edit;
      qry_Record.FieldByName('ISSUEDTO').AsString := tbl_Remote.fieldbyname('REQUESTER').AsString;
      qry_Record.FieldByName('ISSUEDON').Value := Date;
      qry_Record.FieldByName('IssueStatus').AsString := 'OUT';
      qry_Record.Post;
      tbl_RemoteD.Edit;
      tbl_RemoteD['Matched'] := 1;
      tbl_RemoteD.Post;
      MessageDlg('Record flagged as back from Metrofile',mtInformation,[mbOK],0);
    end;
end;



procedure Tfrm_Remote.BitBtn5Click(Sender: TObject);
var
  TempStr,PageNum         :string;
  Ctr,x,PHeight,LineSpace :integer;
  Flag                    :Boolean;
  Cur_Nr                  :Integer;

begin
Cur_Nr := tbl_remote.FieldbyName('TX_NO').asInteger;
Flag := False;
x := 0;
Ctr := 1;
if PrintDialog.Execute then
   begin
     Printer.BeginDoc;
     PHeight := Printer.PageHeight;
     LineSpace :=Pheight DIV 60;
     PageNum := IntToStr(Printer.PageNumber);
     Printer.Canvas.Font.Size := 10;
     Printer.Canvas.TextOut(0,x,'Metro File Request Slip');
     x := x + LineSpace;
     Printer.Canvas.TextOut(0,x,'Date:' + DateToStr(date));
     x := x + LineSpace;
     Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------');
     x := x + LineSpace;
     x := x + LineSpace;x := x + LineSpace;

     qry_Remote.Active := False;
     qry_Remote.SQL.Clear;
     qry_Remote.SQL.Add ('SELECT * FROM REMOTE WHERE TX_NO = :NO');
     qry_Remote.Params[0].DataType := ftInteger;
     qry_Remote.Params[0].asInteger := Cur_Nr;
     qry_Remote.Open;

     qry_RemoteD.Active := False;
     qry_RemoteD.SQL.Clear;
     qry_RemoteD.SQL.Add ('SELECT * FROM REMOTED WHERE TX_NO = :NO');
     qry_RemoteD.Params[0].DataType := ftInteger;
     qry_RemoteD.Params[0].asInteger := Cur_Nr;
     qry_RemoteD.Open;

     qry_Remote.First;

     while Not(qry_Remote.EOF) do
       begin
         If qry_Remote['Tx_No'] = Cur_Nr Then
           Begin
             Flag := True;
             Printer.Canvas.TextOut(0,x,'Picking Slip : ' + inttostr(qry_Remote.FieldByName('Tx_No').AsInteger));
             x := x + LineSpace;
             Printer.Canvas.TextOut(0,x,'Date / Time : ' + datetimetostr(Now));
             x := x + LineSpace;
             Printer.Canvas.TextOut(0,x,'Requester : ' + qry_Remote.FieldBYName('Requester').AsString);
             x := x + LineSpace;
             Printer.Canvas.TextOut(0,x,'User ID : ' + qry_Remote.FieldByName('UserID').AsString);
             x := x + LineSpace;
             Printer.Canvas.TextOut(0,x,'Deliver To : ' + qry_Remote.FieldByName('Deliver').AsString);
             x := x + LineSpace;
             Printer.Canvas.TextOut(0,x,'Type : ' + qry_Remote.FieldBYName('TypeDesc').AsString);
             x := x + LineSpace;Ctr := Ctr + 1;    //No of lines printed
             if Ctr > 59 then
               begin
                 Printer.NewPage;
                 x:= 0;
                 Ctr := 0;
                 PageNum := IntToStr(Printer.PageNumber);
               end;  //If Then
           end; //if Then
         qry_Remote.Next;
       end;         //While Do
     If Flag = True Then
       Begin
         x := x + LineSpace;
         x := x + LineSpace;
         x := x + LineSpace;
         Printer.Canvas.TextOut(0,x,'Container No');
         Printer.Canvas.TextOut(600,x,'Record No');
         Printer.Canvas.TextOut(1200,x,'Filing Method');
         Printer.Canvas.TextOut(1800,x,'Matched');
         x := x + LineSpace;
         Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------');
         x := x + LineSpace;
         qry_RemoteD.First;
         while Not(qry_RemoteD.EOF) do
           begin
             If qry_RemoteD.FieldByName('Tx_No').AsInteger = Cur_Nr Then
               Begin
                 Printer.Canvas.TextOut(0,x,qry_RemoteD.FieldByName('Container').AsString);
                 Printer.Canvas.TextOut(600,x,qry_RemoteD.FieldByName('Barcode').AsString);
                 Printer.Canvas.TextOut(1200,x,qry_RemoteD.FieldByName('FilingMethod').AsString);
                 If qry_RemoteD.FieldByName('Matched').AsInteger <> 1 Then
                  Printer.Canvas.TextOut(1800,x,'Not Found');
                 If qry_RemoteD.FieldByName('Matched').AsInteger = 1 Then
                  Printer.Canvas.TextOut(1800,x,'Found');
                 x := x + LineSpace;
                 if Ctr > 59 then
                   begin
                     Printer.NewPage;
                     x:= 0;
                     Ctr := 0;
                     PageNum := IntToStr(Printer.PageNumber);
                   end;  //If Then
               end; // If Then
             qry_RemoteD.Next;
           end;  //While Do
       end; // If Then
      Printer.EndDoc;
   end;  //PrinDialog
qry_RemoteD.Active := false;
qry_Remote.Active := false;
end;


procedure Tfrm_Remote.BitBtn3Click(Sender: TObject);
var
  TempStr,PageNum         :string;
  Ctr,x,PHeight,LineSpace :integer;
  Flag                    :Boolean;
  Cur_Nr                  :Integer;

begin
Cur_Nr := tbl_remote.FieldbyName('TX_NO').asInteger;
Flag := False;
x := 0;
Ctr := 1;
if PrintDialog.Execute then
   begin
     Printer.BeginDoc;
     PHeight := Printer.PageHeight;
     LineSpace :=Pheight DIV 60;
     PageNum := IntToStr(Printer.PageNumber);
     Printer.Canvas.Font.Size := 10;
     Printer.Canvas.TextOut(0,x,'Metro File Delivery Slip');
     x := x + LineSpace;
     Printer.Canvas.TextOut(0,x,'Date:' + DateToStr(date));
     x := x + LineSpace;
     Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------');
     x := x + LineSpace;
     x := x + LineSpace;x := x + LineSpace;

     qry_DelSlip.Active := False;
     qry_DelSlip.SQL.Clear;
     qry_DelSlip.SQL.Add ('SELECT * FROM REMOTE WHERE TX_NO = :NO');
     qry_DelSlip.Params[0].DataType := ftInteger;
     qry_DelSlip.Params[0].asInteger := Cur_Nr;
     qry_DelSlip.Open;

     qry_DelSlipP.Active := False;
     qry_DelSlipP.SQL.Clear;
     qry_DelSlipP.SQL.Add ('SELECT * FROM REMOTED WHERE TX_NO = :NO');
     qry_DelSlipP.Params[0].DataType := ftInteger;
     qry_DelSlipP.Params[0].asInteger := Cur_Nr;
     qry_DelSlipP.Open;

     qry_DelSlip.First;


     while Not(qry_DelSlip.EOF) do
       begin
         If qry_DelSlip['Tx_No'] = Cur_Nr Then
           Begin
             Flag := True;
             Printer.Canvas.TextOut(0,x,'Picking Slip : ' + inttostr(qry_DelSlip.FieldByName('Tx_No').AsInteger));
             x := x + LineSpace;
             Printer.Canvas.TextOut(0,x,'Date / Time : ' + datetimetostr(Now));
             x := x + LineSpace;
             Printer.Canvas.TextOut(0,x,'Requester : ' + qry_DelSlip.FieldBYName('Requester').AsString);
             x := x + LineSpace;
             Printer.Canvas.TextOut(0,x,'User ID : ' + qry_DelSlip.FieldByName('UserID').AsString);
             x := x + LineSpace;
             Printer.Canvas.TextOut(0,x,'Deliver To : ' + qry_DelSlip.FieldByName('Deliver').AsString);
             x := x + LineSpace;
             Printer.Canvas.TextOut(0,x,'Type : ' + qry_DelSlip.FieldBYName('TypeDesc').AsString);
             x := x + LineSpace;Ctr := Ctr + 1;    //No of lines printed
             if Ctr > 59 then
               begin
                 Printer.NewPage;
                 x:= 0;
                 Ctr := 0;
                 PageNum := IntToStr(Printer.PageNumber);
               end;  //If Then
           end; //if Then
         qry_DelSlip.Next;
       end;         //While Do
     If Flag = True Then
       Begin
         x := x + LineSpace;
         x := x + LineSpace;
         x := x + LineSpace;
         Printer.Canvas.TextOut(0,x,'Record No');
         x := x + LineSpace;
         Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------');
         x := x + LineSpace;
         qry_DelSlipP.First;
         while Not(qry_DelSlipP.EOF) do
           begin
             If qry_DelSlipP.FieldByName('Tx_No').AsInteger = Cur_Nr Then
               Begin
                 Printer.Canvas.TextOut(0,x,qry_DelSlipP.FieldByName('BarCode').AsString);
                 x := x + LineSpace;
                 if Ctr > 59 then
                   begin
                     Printer.NewPage;
                     x:= 0;
                     Ctr := 0;
                     PageNum := IntToStr(Printer.PageNumber);
                   end;  //If Then
               end; // If Then
             qry_DelSlipP.Next;
           end;  //While Do
       end; // If Then
      Printer.EndDoc;
   end;  //PrinDialog
qry_DelSlipP.Active := false;
qry_DelSlip.Active := false;
end;

procedure Tfrm_Remote.editRecordTypeCloseUp(Sender: TObject);
var
 mtitle :string;
 iInt,iDate,iStr,i,mtemp :integer;
 temp  :integer;
 arStr : Array[1..10,1..2] of String;
 arDate: Array[1..3,1..2] of String;
 arInt:  Array[1..2,1..2] of String;
 arCol : Array[0..10] of String;
begin
if length(editRecordType.Text) = 0 then
   exit;
iDate := 0;
iStr := 0;
iInt := 0;
//---------------------------------------------
    for i := 1 to 10 do arStr[i,2]  := 'N.A.';
    for i := 1 to 3  do arDate[i,2] := 'N.A.';
    for i := 1 to 2  do arInt[i,2] := 'N.A.';
//---------------------------------------------
   qry_RecordType.Active := false;
   qry_RecordType.SQL.Clear;
   qry_RecordType.SQL.Add('select col1,col2,col3,col4,col5,col6,col7,col8,col9,col10 from filetype where type = :mtype');
   qry_RecordType.Params[0].AsString := editRecordType.Text;
   qry_RecordType.Active := true;
   mView := 'SELECT ';
   i := 0;
   if length(qry_RecordType.FieldByName('Col1').AsString) > 0 then
      begin
      mView := mView + 'COL1 ' + qry_RecordType.FieldByName('Col1').AsString;
      arCol[i] := 'Col1';
      Inc(i);
      end;
   if length(qry_RecordType.FieldByName('Col2').AsString) > 0 then
      begin
      mView := mView + ',COL2 ' + qry_RecordType.FieldByName('Col2').AsString;
      arCol[i] := 'Col2';
      Inc(i);
      end;
   if length(qry_RecordType.FieldByName('Col3').AsString) > 0 then
      begin
      mView := mView + ',COL3 ' + qry_RecordType.FieldByName('Col3').AsString;
      arCol[i] := 'Col3';
      Inc(i);
      end;
   if length(qry_RecordType.FieldByName('Col4').AsString) > 0 then
      begin
      mView := mView + ',COL4 ' + qry_RecordType.FieldByName('Col4').AsString;
      arCol[i] := 'Col4';
      Inc(i);
      end;
   if length(qry_RecordType.FieldByName('Col5').AsString) > 0 then
      begin
      mView := mView + ',COL5 ' + qry_RecordType.FieldByName('Col5').AsString;
      arCol[i] := 'Col5';
      Inc(i);
      end;
   if length(qry_RecordType.FieldByName('Col6').AsString) > 0 then
      begin
      mView := mView + ',COL6 ' + qry_RecordType.FieldByName('Col6').AsString;
      arCol[i] := 'Col6';
      Inc(i);
      end;
   if length(qry_RecordType.FieldByName('Col7').AsString) > 0 then
      begin
      mView := mView + ',COL7 ' + qry_RecordType.FieldByName('Col7').AsString;
      arCol[i] := 'Col7';
      Inc(i);
      end;
   if length(qry_RecordType.FieldByName('Col8').AsString) > 0 then
      begin
      mView := mView + ',COL8 ' + qry_RecordType.FieldByName('Col8').AsString;
      arCol[i] := 'Col8';
      Inc(i);
      end;
   if length(qry_RecordType.FieldByName('Col9').AsString) > 0 then
      begin
      mView := mView + ',COL9 ' + qry_RecordType.FieldByName('Col9').AsString;
      arCol[i] := 'Col9';
      Inc(i);
      end;
   if length(qry_RecordType.FieldByName('Col10').AsString) > 0 then
      begin
      mView := mView + ',COL10 ' + qry_RecordType.FieldByName('Col10').AsString;
      arCol[i] := 'Col10';
      Inc(i);
      end;
   mView := mView + ' from filetype where type = :mtype';
   qry_RecordType.Active := false;
   qry_RecordType.SQL.Clear;
   qry_RecordType.SQL.Add(mView);
   qry_RecordType.Params[0].AsString := editRecordType.Text;
   qry_RecordType.Active := true;
//======================================================
//Build Array of fields and contents
//======================================================
//-----------------------------------------
    for i := 0 to qry_RecordType.FieldCount-1 do        //Only interested in the Description Fields
      begin
        if (arCol[i] = 'Col1') or            //Text Fields
           (arCol[i] = 'Col2') or
           (arCol[i] = 'Col3') or
           (arCol[i] = 'Col4') or
           (arCol[i] = 'Col5') or
           (arCol[i] = 'Col6') then
         begin
              Inc(iStr);
              arStr[iStr,1] := qry_RecordType.Fields[i].DisplayLabel;   //Contents
              arStr[iStr,2] := qry_RecordType.Fields[i].DisplayText;   //Contents
         end;
        if (arCol[i] = 'Col7') or
           (arCol[i] = 'Col8') then
            begin
              Inc(iDate);
              arDate[iDate,1] := qry_RecordType.Fields[i].DisplayLabel;
              arDate[iDate,2] := qry_RecordType.Fields[i].DisplayText;
            end;
        if (arCol[i] = 'Col9') or
           (arCol[i] = 'Col10') then
            begin
              Inc(iInt);
              arInt[iInt,1] := qry_RecordType.Fields[i].DisplayLabel;
              arInt[iInt,2] := qry_RecordType.Fields[i].DisplayText;
            end;
      end;
//======================================================
//Build ResultGrid and display Fields
//======================================================
    field1.Caption := arStr[1,1];
    lbl_Text1.Caption := arStr[1,2];
    if lbl_Text1.Caption <> 'N.A.' then
      begin
        lbl_Text1.Visible := true;
        edt_Text1.Visible := true;
      end;
    field2.Caption := arStr[2,1];
    lbl_Text2.Caption := arStr[2,2];
    if lbl_Text2.Caption <> 'N.A.' then
      begin
        lbl_Text2.Visible := true;
        edt_Text2.Visible := true;
      end;
    field3.Caption := arStr[3,1];
    lbl_Text3.Caption := arStr[3,2];
    if lbl_Text3.Caption <> 'N.A.' then
      begin
        lbl_Text3.Visible := true;
        edt_Text3.Visible := true;
      end;

    field4.Caption := arStr[4,1];
    lbl_Text4.Caption := arStr[4,2];
    if lbl_Text4.Caption <> 'N.A.' then
      begin
        lbl_Text4.Visible := true;
        edt_Text4.Visible := true;
      end;

    field5.Caption := arStr[5,1];
    lbl_Text5.Caption := arStr[5,2];
    if lbl_Text5.Caption <> 'N.A.' then
      begin
        lbl_Text5.Visible := true;
        edt_Text5.Visible := true;
      end;

    field6.Caption := arStr[6,1];
    lbl_Text6.Caption := arStr[6,2];
    if lbl_Text6.Caption <> 'N.A.' then
      begin
        lbl_Text6.Visible := true;
        edt_Text6.Visible := true;
      end;
//--------------------------------------->>
    field7.Caption := arDate[1,1];
    lbl_Date1.Caption := arDate[1,2];
    if lbl_Date1.Caption <> 'N.A.' then
      begin
        lbl_Date1.Visible := true;
        edt_Date1.Visible := true;
      end;
    field8.Caption := arDate[2,1];
    lbl_Date2.Caption := arDate[2,2];
    if lbl_Date2.Caption <> 'N.A.' then
      begin
        lbl_Date2.Visible := true;
        edt_Date2.Visible := true;
      end;
    field9.Caption := arInt[1,1];
    lbl_No1.Caption := arInt[1,2];
    if lbl_No1.Caption <> 'N.A.' then
      begin
        lbl_No1.Visible := true;
        edt_No1.Visible := true;
      end;
    field10.Caption := arInt[2,1];
    lbl_No2.Caption := arInt[2,2];
    if lbl_No2.Caption <> 'N.A.' then
      begin
        lbl_No2.Visible := true;
        edt_No2.Visible := true;
      end;
//-----------
end;

procedure Tfrm_Remote.edt_DepartmentChange(Sender: TObject);
begin
  IF edt_Department.Text > '' then
    begin
      qry_FileType.Active := false;
      qry_FileType.Params[0].AsString := edt_Department.Text;  //DEPT NAME
      qry_FileType.Active := true;
    end;
end;

procedure Tfrm_Remote.btn_SearchClick(Sender: TObject);
var
  SQLText        :String;
  Flag           :Boolean;
  J              :Integer;
  mViewStr       :String;
begin
//==============================================================================
//==============Check if certain fields contains values
//==============================================================================
  if (length(editRecordType.Text) = 0) Then
    begin
      MessageDlg('Please select the Record Type ',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
  if (length(edt_Department.Text) = 0) then
    begin
      MessageDlg('Please select the Department',mtError,[mbOK],0);
      Screen.Cursor := crDefault;
      exit;
    end;
//==============================================================================
//==============First Check if the user wants to search on a specific record
//==============================================================================
  If length(editBarcode.Text) > 0 Then
    begin
      Screen.Cursor := CrHourglass;
      qry_FilesSearch.Active := False;
      qry_FilesSearch.SQL.Clear;
      SQLText := 'SELECT * FROM FILES WHERE(FILETYPE = :FT)AND(DEPT_NAME = :DN)';
      IF length(edit_Warehouse.Text) > 0 Then
        SQLText := SQLText + 'AND(WAREHOUSE = :WH)';
      IF length(edt_Branch.Text) > 0 Then
        SQLText := SQLText + 'AND(BRANCH_NAME = :BN)';
      If length(editBarcode.Text) > 0 Then
        SQLText := SQLText + 'AND(FILENUMBER LIKE :FN)';
      qry_FilesSearch.SQL.Add(SQLText);
      qry_FilesSearch.ParamByName('FT').DataType := ftString;
      qry_FilesSearch.ParamByName('FT').asString := editRecordType.Text;
      qry_FilesSearch.ParamByName('DN').DataType := ftString;
      qry_FilesSearch.ParamByName('DN').asString := edt_Department.Text;
      IF length(edit_Warehouse.Text) > 0 Then
        begin
          qry_FilesSearch.ParamByName('WH').DataType := ftInteger;
          qry_FilesSearch.ParamByName('WH').AsString := editWCode.Text;
        end;
      IF length(edt_Branch.Text) > 0 Then
        begin
          qry_FilesSearch.ParamByName('BN').DataType := ftString;
          qry_FilesSearch.ParamByName('BN').asString := edt_Branch.Text;
        end;
      qry_FilesSearch.ParamByName('FN').DataType := ftString;
      qry_FilesSearch.ParamByName('FN').asString := editBarCode.Text + '';
      qry_FilesSearch.Active := True;
      ResultGrid.DataSource := dts_FilesSearch;
      DBNavigator1.DataSource := dts_FilesSearch;
      Screen.Cursor := CrDefault;
      EXIT;
    end;
//======================================Build SQL String========================
//Need to build the fields based on the record type selected
//==============================================================================
//  SQLText := 'SELECT * FROM FILES WHERE(FILETYPE = :FT)AND(DEPT_NAME = :DN)';
  mViewStr := 'SELECT a.FileNumber, a.IssueStatus, b.IssueStatus';
  IF (length(lbl_Text1.Caption) > 0) and (lbl_text1.Caption <> 'N.A.') Then
      mViewStr := mViewStr +' ,a.Text1 ' + lbl_Text1.Caption;
  IF (length(lbl_Text2.Caption) > 0) and (lbl_text2.Caption <> 'N.A.') Then
      mViewStr := mViewStr + ' ,a.Text2 ' + lbl_Text2.Caption;
  IF (length(lbl_Text3.Caption) > 0) and (lbl_text3.Caption <> 'N.A.') Then
      mViewStr := mViewStr + ' ,a.Text3 ' + lbl_Text3.Caption;
  IF (length(lbl_Text4.Caption) > 0) and (lbl_text4.Caption <> 'N.A.') Then
      mViewStr := mViewStr + ' ,a.Text4 ' + lbl_Text4.Caption;
  IF (length(lbl_Text5.Caption) > 0) and (lbl_text5.Caption <> 'N.A.') Then
      mViewStr := mViewStr + ' ,a.Text5 ' + lbl_Text5.Caption;
  IF (length(lbl_Text6.Caption) > 0) and (lbl_text6.Caption <> 'N.A.') Then
      mViewStr := mViewStr + ' ,a.Text6 ' + lbl_Text6.Caption;
  IF (lbl_date1.Caption > '') and (lbl_Date1.Caption <> 'N.A.')Then
      mViewStr := mViewStr + ' ,a.Date1 ' + lbl_Date1.Caption;
  IF (lbl_Date2.Caption > '') and (lbl_Date2.Caption <> 'N.A.') Then
      mViewStr := mViewStr + ' ,a.Date2 ' + lbl_Date2.Caption;
  IF (lbl_No1.Caption > '') and (lbl_No1.Caption <> 'N.A.') Then
      mViewStr := mViewStr + ' ,a.Number1 ' + lbl_No1.Caption;
  IF (lbl_No2.Caption > '') and (lbl_No2.Caption <> 'N.A.') Then
      mViewStr := mViewStr + ' ,a.Number2 ' + lbl_No2.Caption;
//--------------
  SQLText := mViewStr + ' FROM FILES a, CONTAINERS b WHERE(a.FILETYPE = :FT)AND(a.DEPT_NAME = :DN)AND(a.ISSUESTATUS = ''CON'')';
    IF length(edit_Warehouse.Text) > 0 Then
    SQLText := SQLText + 'AND(a.WAREHOUSE = :WH)';
  IF length(edt_Branch.Text) > 0 Then
    SQLText := SQLText + 'AND(a.BRANCH_NAME = :BN)';
  IF edt_Date1.Text > ' / / ' Then
    SQLText := SQLText + 'AND(a.DATE1 = :D1)';
  IF edt_Date2.Text > ' / / ' Then
    SQLText := SQLText + 'AND(a.DATE2 = :D2)';
  IF length(edt_Text1.Text) > 0 Then
    SQLText := SQLText + 'AND(a.TEXT1 LIKE :T1)';
  IF length(edt_Text2.Text) > 0 Then
    SQLText := SQLText + 'AND(a.TEXT2 LIKE :T2)';
  IF length(edt_Text3.Text) > 0 Then
    SQLText := SQLText + 'AND(a.TEXT3 LIKE :T3)';
  IF length(edt_Text4.Text) > 0 Then
    SQLText := SQLText + 'AND(a.TEXT4 LIKE :T4)';
  IF length(edt_Text5.Text) > 0 Then
    SQLText := SQLText + 'AND(a.TEXT5 LIKE :T5)';
  IF length(edt_Text6.Text) > 0 Then
    SQLText := SQLText + 'AND(a.TEXT6 LIKE :T6)';
  IF length(edt_No1.Text) > 0 Then
    SQLText := SQLText + 'AND(a.NUMBER1 = :N1)';
  IF length(edt_No2.Text) > 0 Then
    SQLText := SQLText + 'AND(a.NUMBER2 = :N2)';
//===============================Join===========================================
  SQLText := SQLText + 'AND(a.CONTAINERNO = b.CONTAINER)AND(b.IssueStatus = ''MET'')';
//==============================================================================
//==============================Build the Query=================================
//==============================================================================
  qry_FilesSearch.Active := False;
  qry_FilesSearch.SQL.Clear;
  qry_FilesSearch.SQL.Add(SQLText);
  qry_FilesSearch.ParamByName('FT').DataType := ftString;
  qry_FilesSearch.ParamByName('FT').asString := editRecordType.Text;
  qry_FilesSearch.ParamByName('DN').DataType := ftString;
  qry_FilesSearch.ParamByName('DN').asString := edt_Department.Text;
  IF length(edit_Warehouse.Text) > 0 Then
    begin
      qry_FilesSearch.ParamByName('WH').DataType := ftInteger;
      qry_FilesSearch.ParamByName('WH').AsString := editWCode.Text;
    end;
  IF length(edt_Branch.Text) > 0 Then
    begin
      qry_FilesSearch.ParamByName('BN').DataType := ftString;
      qry_FilesSearch.ParamByName('BN').asString := edt_Branch.Text;
    end;
//------------------------------------------------------------------------------
//Build Non - Essential Part of Query
//------------------------------------------------------------------------------
  IF length(edt_Text1.Text) > 0 Then
    begin
      qry_FilesSearch.ParamByName('T1').DataType := ftString;
      qry_FilesSearch.ParamByName('T1').asString := ''+edt_Text1.Text+'';
    end;
  IF length(edt_Text2.Text) > 0 Then
    begin
      qry_FilesSearch.ParamByName('T2').DataType := ftString;
      qry_FilesSearch.ParamByName('T2').asString := ''+edt_Text2.Text+'';
    end;
  IF length(edt_Text3.Text) > 0 Then
    begin
      qry_FilesSearch.ParamByName('T3').DataType := ftString;
      qry_FilesSearch.ParamByName('T3').asString := ''+edt_Text3.Text+'';
    end;
  IF length(edt_Text4.Text) > 0 Then
    begin
      qry_FilesSearch.ParamByName('T4').DataType := ftString;
      qry_FilesSearch.ParamByName('T4').asString := ''+edt_Text4.Text+'';
    end;
  IF length(edt_Text5.Text) > 0 Then
    begin
      qry_FilesSearch.ParamByName('T5').DataType := ftString;
      qry_FilesSearch.ParamByName('T5').asString := ''+edt_Text5.Text+'';
    end;
  IF length(edt_Text6.Text) > 0 Then
    begin
      qry_FilesSearch.ParamByName('T6').DataType := ftString;
      qry_FilesSearch.ParamByName('T6').asString := ''+edt_Text6.Text+'';
    end;
  IF edt_Date1.Text > ' / / ' Then
    begin
      qry_FilesSearch.ParamByName('D1').DataType := ftDateTime;
      qry_FilesSearch.ParamByName('D1').asDateTime := StrtoDate(edt_Date1.Text);
    end;
  IF edt_Date2.Text > ' / / ' Then
    begin
      qry_FilesSearch.ParamByName('D2').DataType := ftDateTime;
      qry_FilesSearch.ParamByName('D2').asDateTime := StrtoDate(edt_Date2.Text);
    end;
  IF edt_No1.Text > '' Then
    begin
      qry_FilesSearch.ParamByName('N1').DataType := ftInteger;
      qry_FilesSearch.ParamByName('N1').asInteger := StrtoInt(edt_No1.Text);
    end;
  IF edt_No2.Text > '' Then
    begin
      qry_FilesSearch.ParamByName('N2').DataType := ftInteger;
      qry_FilesSearch.ParamByName('N2').asInteger := StrtoInt(edt_No2.Text);
    end;
//--------
   Screen.Cursor := CrHourglass;
  qry_FilesSearch.Prepare;
  qry_FilesSearch.Active := True;
  ResultGrid.DataSource := dts_FilesSearch;
  DBNavigator1.DataSource := dts_FilesSearch;
  Screen.Cursor := CrDefault;
  if qry_FilesSearch.isEmpty then
     Begin
     MessageDLG('No records found',mtInformation,[mbOK],0);
     end
     else
         label28.Caption := 'Records Found: ' + IntToStr(qry_FilesSearch.RecordCount);

//======================================================================
end;



procedure Tfrm_Remote.edt_BranchClick(Sender: TObject);
begin
BuildDept;
end;




procedure Tfrm_Remote.btn_RemovePickClick(Sender: TObject);
begin
   ListBoxPick.Items.Delete(ListBoxPick.ItemIndex)
end;






end.

