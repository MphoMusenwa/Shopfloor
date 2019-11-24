unit MoveDepartments;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ToolWin, DBTables, Db, ADODB, INIFiles, ExtCtrls,
  CheckLst;

type
  Tfrm_MoveLocation = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    btn_Move: TButton;
    mem_Status: TMemo;
    qry_Loc: TADOQuery;
    qry_Files: TADOQuery;
    qry_ReSer: TADOQuery;
    Panel1: TPanel;
    BitBtn1: TSpeedButton;
    Label40: TLabel;
    Label30: TLabel;
    lbl_FBranch: TLabel;
    lbl_FDepartment: TLabel;
    edt_FBranch: TEdit;
    btn_FBranch: TButton;
    edt_FDepartment: TEdit;
    btn_FDepartment: TButton;
    Label1: TLabel;
    Label2: TLabel;
    lbl_TBranch: TLabel;
    lbl_TDepartment: TLabel;
    edt_TBranch: TEdit;
    btn_TBranch: TButton;
    edt_TDepartment: TEdit;
    btn_TDepartment: TButton;
    CheckListBox1: TCheckListBox;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btn_MoveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_FBranchClick(Sender: TObject);
    procedure btn_TBranchClick(Sender: TObject);
    procedure btn_FDepartmentClick(Sender: TObject);
    procedure btn_TDepartmentClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_MoveLocation: Tfrm_MoveLocation;

implementation

uses SelWHouse, MetrofilerDataModule, Main;

{$R *.DFM}

procedure Tfrm_MoveLocation.Button2Click(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  frm_SelWHouse.Flag3D := 0;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_FWHouse.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_FWHouse.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfrm_MoveLocation.Button3Click(Sender: TObject);
begin
  frm_SelWHouse.Access := User;
  frm_SelWHouse.Flag3D := 0;
  frm_SelWHouse.qry_WHouse.Open;
  If frm_SelWHouse.ShowModal = mrOK Then
    begin
      edt_TWHouse.Text := frm_SelWHouse.qry_WHouse.FieldbyName('Warehouse').asString;
      lbl_TWHouse.Caption := frm_SelWHouse.qry_WHouse.FieldbyName('Name').asString;
    end;
  frm_SelWHouse.qry_WHouse.Close;
end;

procedure Tfrm_MoveLocation.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_MoveLocation.btn_FBranchClick(Sender: TObject);
begin
  frm_SelBranch.Access := User;
  frm_SelBranch.qry_Branch.Open;
  If frm_SelBranch.ShowModal = mrOK Then
    begin
      edt_FBranch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_FBranch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_MoveLocation.btn_FDepartmentClick(Sender: TObject);
begin
  If length(edt_FBranch.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  frm_SelDept.Access := User;
  frm_SelDept.BAccess := edt_FBranch.Text;
  frm_SelDept.qry_Dept.Open;
  If frm_SelDept.ShowModal = mrOK Then
    begin
      edt_FDepartment.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_FDepartment.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_MoveLocation.btn_MoveClick(Sender: TObject);
begin
//----Verify if Record Type is allocated to Department----------



  ReseRial := false;
  try
    mem_Status.Lines.Append(TimetoStr(Now)+'===> Checking if Source Location exist');
    Application.ProcessMessages;
    Screen.Cursor := crHourglass;
    qry_Loc.Close;
    qry_Loc.SQL.Clear;
    qry_Loc.SQL.Add('SELECT * FROM Location WHERE (warehouse = '+QuotedStr(edt_FWHouse.Text)+')AND(LocNo = '+QuotedStr(edt_FLoc.Text)+')');
    qry_Loc.Open;
    If qry_Loc.IsEmpty Then
      begin
        Screen.Cursor := crDefault;
        Messagedlg('Source Location is not valid!!', mtError, [mbOK], 0);
        exit;
      end;
    mem_Status.Lines.Append(TimetoStr(Now)+'===> Checking if Destination Location exist');
    Application.ProcessMessages;
    qry_Loc.Close;
    qry_Loc.SQL.Clear;
    qry_Loc.SQL.Add('SELECT * FROM Location WHERE (warehouse = '+QuotedStr(edt_TWHouse.Text)+')AND(LocNo = '+QuotedStr(edt_TLoc.Text)+')');
    qry_Loc.Open;
    If qry_Loc.IsEmpty Then
      begin
        Screen.Cursor := crDefault;
        Messagedlg('Destination Location is not valid!!', mtError, [mbOK], 0);
        exit;
      end;
    qry_Loc.Close;
//==================================Move Files==================================
    Screen.Cursor := crDefault;
    qry_Files.Close;
    qry_Files.SQL.Clear;
    qry_Files.SQL.Add('SELECT Count(*) FROM Files');
    qry_Files.SQL.Add('WHERE (Warehouse = '+QuotedStr(edt_FWHouse.Text)+')AND(LocNo = '+QuotedStr(edt_FLoc.Text)+')');
    qry_Files.Open;
    If qry_Files.Fields[0].AsInteger > 0 Then
      begin
        If Messagedlg('Are you sure you want to move '+trim(qry_Files.Fields[0].asString)+' Files in the Source Location??', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
          exit;

        mem_Status.Lines.Append(TimetoStr(Now)+'===> Moving Files to New Location');
        Application.ProcessMessages;
        Screen.Cursor := crHourglass;
        qry_Files.Close;
        qry_Files.SQL.Clear;
        qry_Files.SQL.Add('UPDATE FILES');
        qry_Files.SQL.Add('SET Warehouse = '+QuotedStr(edt_TWHouse.Text)+',');
        qry_Files.SQL.Add('    LocNo = '+QuotedStr(edt_TLoc.Text)+',');
        qry_Files.SQL.Add('    RecordNo = 0');
        qry_Files.SQL.Add('WHERE (Warehouse = '+QuotedStr(edt_FWHouse.Text)+')AND(LocNo = '+QuotedStr(edt_FLoc.Text)+')');
        qry_Files.ExecSQL;
        ReseRial := true;
      end;
//==================================Move Items==================================
    qry_Files.Close;
    qry_Files.SQL.Clear;
    qry_Files.SQL.Add('SELECT Count(*) FROM Items');
    qry_Files.SQL.Add('WHERE (Warehouse = '+QuotedStr(edt_FWHouse.Text)+')AND(LocNo = '+QuotedStr(edt_FLoc.Text)+')');
    qry_Files.Open;
    If qry_Files.Fields[0].AsInteger > 0 Then
      begin
        If Messagedlg('Are you sure you want to move '+trim(qry_Files.Fields[0].asString)+' Items in the Source Location??', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
          exit;
        mem_Status.Lines.Append(TimetoStr(Now)+'===> Moving Items to New Location');
        Application.ProcessMessages;
        Screen.Cursor := crHourglass;
        qry_Files.Close;
        qry_Files.SQL.Clear;
        qry_Files.SQL.Add('UPDATE Items');
        qry_Files.SQL.Add('SET Warehouse = '+QuotedStr(edt_TWHouse.Text)+',');
        qry_Files.SQL.Add('    LocNo = '+QuotedStr(edt_TLoc.Text)+',');
        qry_Files.SQL.Add('    RecordNo = 0');
        qry_Files.SQL.Add('WHERE (Warehouse = '+QuotedStr(edt_FWHouse.Text)+')AND(LocNo = '+QuotedStr(edt_FLoc.Text)+')');
        qry_Files.ExecSQL;
        ReseRial := true;
      end;
    If  ReseRial Then
      begin
//-----
        mem_Status.Lines.Append(TimetoStr(Now)+'===> Reserializing Source Location');
        Application.ProcessMessages;
        qry_ReSer.Close;
        qry_ReSer.SQL.Clear;
        qry_ReSer.SQL.Add('EXEC Met_ReSerial '+QuotedStr(edt_FLoc.Text)+', '+QuotedStr(edt_FWHouse.Text));
        qry_ReSer.ExecSQL;
//-----
        mem_Status.Lines.Append(TimetoStr(Now)+'===> Reserializing Destination Location');
        Application.ProcessMessages;
        qry_ReSer.Close;
        qry_ReSer.SQL.Clear;
        qry_ReSer.SQL.Add('EXEC Met_ReSerial '+QuotedStr(edt_TLoc.Text)+', '+QuotedStr(edt_TWHouse.Text));
        qry_ReSer.ExecSQL;
        mem_Status.Lines.Append(TimetoStr(Now)+'===> Finished');
        Application.ProcessMessages;
        Screen.Cursor := crDefault;
        Messagedlg('Files/Items moved successfully!!', mtInformation, [mbOK], 0);
      end;
  finally
    Screen.Cursor := crDefault;
    qry_ReSer.Close;
    qry_loc.Close;
    qry_Files.Close;
  end;
end;

procedure Tfrm_MoveLocation.btn_TBranchClick(Sender: TObject);
begin
  frm_SelBranch.Access := User;
  frm_SelBranch.qry_Branch.Open;
  If frm_SelBranch.ShowModal = mrOK Then
    begin
      edt_TBranch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_TBranch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_MoveLocation.btn_TDepartmentClick(Sender: TObject);
begin
  If length(edt_TBranch.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  frm_SelDept.Access := User;
  frm_SelDept.BAccess := edt_TBranch.Text;
  frm_SelDept.qry_Dept.Open;
  If frm_SelDept.ShowModal = mrOK Then
    begin
      edt_TDepartment.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_TDepartment.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_MoveLocation.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_Console.act_MoveLoc.Enabled := True;
  Action := caFree;
end;

end.
