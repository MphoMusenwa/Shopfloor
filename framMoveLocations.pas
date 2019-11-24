unit framMoveLocations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB, ADODB;

type
  Tfram_MoveLocations = class(TFrame)
    mem_Status: TMemo;
    Panel2: TPanel;
    btn_Move: TButton;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    pg_Source: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    lbl_05: TLabel;
    lbl_FWHouse: TLabel;
    edt_FLoc: TEdit;
    edt_FWHouse: TEdit;
    Button2: TButton;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    edt_SourceProxy: TEdit;
    GroupBox2: TGroupBox;
    pg_Destination: TPageControl;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    lbl_TWHouse: TLabel;
    edt_TLoc: TEdit;
    edt_TWHouse: TEdit;
    Button3: TButton;
    TabSheet4: TTabSheet;
    Label4: TLabel;
    edt_DestProxy: TEdit;
    qry_SQL: TADOQuery;
    qry_Loc: TADOQuery;
    qry_Files: TADOQuery;
    qry_ReSer: TADOQuery;
    qry_Items: TADOQuery;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btn_MoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses SelWHouse, Main;

{$R *.dfm}

procedure Tfram_MoveLocations.btn_MoveClick(Sender: TObject);
Var
  ReseRial   :Boolean;
  ErrorFlag :Boolean;
begin
  ReseRial := false;
  try
    Screen.Cursor := crHourglass;
    mem_Status.Lines.Clear;
    mem_Status.Lines.Append(TimetoStr(Now)+'===> Checking if Source Location exist');
    Application.ProcessMessages;
    If pg_Source.ActivePageIndex = 0 Then
      begin
        qry_Loc.Close;
        qry_Loc.SQL.Clear;
        qry_Loc.SQL.Add('SELECT * FROM Location WHERE (warehouse = '+QuotedStr(edt_FWHouse.Text)+')AND(LocNo = '+QuotedStr(edt_FLoc.Text)+')');
        qry_Loc.Open;
      end
    else
      begin
        qry_Loc.Close;
        qry_Loc.SQL.Clear;
        qry_Loc.SQL.Add('SELECT * FROM ProxyLoc WHERE LocationId = '+QuotedStr(edt_SourceProxy.Text));
        qry_Loc.Open;
      end;
    If qry_Loc.IsEmpty Then
      begin
        qry_Loc.Close;
        mem_Status.Lines.Append(TimetoStr(Now)+'===> Source Location is not valid.');
        exit;
      end;
    qry_Loc.Close;

    mem_Status.Lines.Append(TimetoStr(Now)+'===> Checking if Destination Location exist');
    Application.ProcessMessages;
    If pg_Destination.ActivePageIndex = 0 Then
      begin
        qry_Loc.Close;
        qry_Loc.SQL.Clear;
        qry_Loc.SQL.Add('SELECT * FROM Location WHERE (warehouse = '+QuotedStr(edt_TWHouse.Text)+')AND(LocNo = '+QuotedStr(edt_TLoc.Text)+')');
        qry_Loc.Open;
      end
    else
      begin
        qry_Loc.Close;
        qry_Loc.SQL.Clear;
        qry_Loc.SQL.Add('SELECT * FROM ProxyLoc WHERE LocationId = '+QuotedStr(edt_DestProxy.Text));
        qry_Loc.Open;
      end;
    If qry_Loc.IsEmpty Then
      begin
        qry_Loc.Close;
        mem_Status.Lines.Append(TimetoStr(Now)+'===> Destination Location is not valid.');
        exit;
      end;
    qry_Loc.Close;

    mem_Status.Lines.Append(TimetoStr(Now)+'===> Verifying Destination Location contents');
    Application.ProcessMessages;
    If pg_Destination.ActivePageIndex = 0 Then
      begin
        qry_Files.Close;
        qry_Files.SQL.Clear;
        qry_Files.SQL.Add('SELECT Filenumber, IssueStatus FROM Files');
        qry_Files.SQL.Add('WHERE Warehouse = '+QuotedStr(edt_TWHouse.Text)+' AND LocNo = '+QuotedStr(edt_TLoc.Text));
        qry_Files.Open;

        qry_Items.Close;
        qry_Items.SQL.Clear;
        qry_Items.SQL.Add('SELECT Itemnumber, Status AS IssueStatus FROM Items');
        qry_Items.SQL.Add('WHERE Warehouse = '+QuotedStr(edt_TWHouse.Text)+' AND LocNo = '+QuotedStr(edt_TLoc.Text));
        qry_Items.Open;
      end
    else
      begin
        qry_Files.Close;
        qry_Files.SQL.Clear;
        qry_Files.SQL.Add('SELECT Filenumber, IssueStatus FROM Files');
        qry_Files.SQL.Add('WHERE LocNo = '+QuotedStr(edt_DestProxy.Text));
        qry_Files.SQL.Add('AND IssueStatus IN (''OUTI'', ''INUSEI'')');
        qry_Files.Open;

        qry_Items.Close;
        qry_Items.SQL.Clear;
        qry_Items.SQL.Add('SELECT Itemnumber, Status AS IssueStatus FROM Items');
        qry_Items.SQL.Add('WHERE LocNo = '+QuotedStr(edt_DestProxy.Text));
        qry_Items.SQL.Add('AND Status IN (''OI'', ''IUI'')');
        qry_Items.Open;
      end;

    If (not qry_Files.IsEmpty)or(not qry_Items.IsEmpty) Then
      begin
        qry_Loc.Close;
        mem_Status.Lines.Append(TimetoStr(Now)+'===> Destination Location contains Files / Items. Distination has to be empty.');
        exit;
      end;

    mem_Status.Lines.Append(TimetoStr(Now)+'===> Verifying Source Location contents');
    Application.ProcessMessages;
    If pg_Source.ActivePageIndex = 0 Then
      begin
        qry_Files.Close;
        qry_Files.SQL.Clear;
        qry_Files.SQL.Add('SELECT Filenumber, IssueStatus FROM Files');
        qry_Files.SQL.Add('WHERE Warehouse = '+QuotedStr(edt_FWHouse.Text)+' AND LocNo = '+QuotedStr(edt_FLoc.Text));
        qry_Files.SQL.Add('AND IssueStatus IN (''IN'', ''REQ'', ''RI'')');
        qry_Files.Open;

        qry_Items.Close;
        qry_Items.SQL.Clear;
        qry_Items.SQL.Add('SELECT Itemnumber, Status AS IssueStatus FROM Items');
        qry_Items.SQL.Add('WHERE Warehouse = '+QuotedStr(edt_FWHouse.Text)+' AND LocNo = '+QuotedStr(edt_FLoc.Text));
        qry_Items.SQL.Add('AND Status IN (''L'', ''RQ'')');
        qry_Items.Open;
      end
    else
      begin
        qry_Files.Close;
        qry_Files.SQL.Clear;
        qry_Files.SQL.Add('SELECT Filenumber, IssueStatus FROM Files');
        qry_Files.SQL.Add('WHERE LocNo = '+QuotedStr(edt_SourceProxy.Text));
        qry_Files.SQL.Add('AND IssueStatus IN (''OUTI'', ''INUSEI'')');
        qry_Files.Open;

        qry_Items.Close;
        qry_Items.SQL.Clear;
        qry_Items.SQL.Add('SELECT Itemnumber, Status AS IssueStatus FROM Items');
        qry_Items.SQL.Add('WHERE LocNo = '+QuotedStr(edt_SourceProxy.Text));
        qry_Items.SQL.Add('AND Status IN (''OI'', ''IUI'')');
        qry_Items.Open;
      end;

    If qry_Files.IsEmpty and qry_Items.IsEmpty Then
      begin
        qry_Loc.Close;
        mem_Status.Lines.Append(TimetoStr(Now)+'===> Source Location contains no Files / Items.');
        exit;
      end;

    ErrorFlag := false;
    qry_Files.First;
    While not qry_Files.EOF Do
      begin
        Application.ProcessMessages;

        If qry_Files.FieldByName('IssueStatus').AsString <> 'IN' Then
          begin
            ErrorFlag := true;
            mem_Status.Lines.Append(TimetoStr(Now)+'===> Filenumber '+qry_Files.FieldByName('Filenumber').asString+' has in invalid Status of '+qry_Files.FieldByName('IssueStatus').asString+'.');
          end;

        qry_Files.Next;
      end;

    qry_Items.First;
    While not qry_Items.EOF Do
      begin
        Application.ProcessMessages;

        If qry_Items.FieldByName('IssueStatus').AsString <> 'L' Then
          begin
            ErrorFlag := true;
            mem_Status.Lines.Append(TimetoStr(Now)+'===> Itemnumber '+qry_Items.FieldByName('Itemnumber').asString+' has in invalid Status of '+qry_Items.FieldByName('IssueStatus').asString+'.');
          end;

        qry_Items.Next;
      end;

    If ErrorFlag Then
      exit;


//==================================Move Files==================================
    qry_Files.First;
    While not qry_Files.EOF Do
      begin
        mem_Status.Lines.Append(TimetoStr(Now)+'===> Moving Filenumber '+qry_Files.FieldByName('Filenumber').asString+'.');
        Application.ProcessMessages;

        If (qry_Files.FieldByName('IssueStatus').AsString = 'IN') OR
           (qry_Files.FieldByName('IssueStatus').AsString = 'OUTI') OR
           (qry_Files.FieldByName('IssueStatus').AsString = 'INUSEI') Then
          begin
            If pg_Destination.ActivePageIndex = 0 Then
              begin
                qry_SQL.Close;
                qry_SQL.SQL.Clear;
                qry_SQL.SQL.Add('UPDATE Files SET');
                qry_SQL.SQL.Add('  Warehouse = :Warehouse,');
                qry_SQL.SQL.Add('  LocNo = :LocNo,');
                qry_SQL.SQL.Add('  IssueStatus = ''IN'',');
                qry_SQL.SQL.Add('  IssuedTo = NULL,');
                qry_SQL.SQL.Add('  IssuedUserID = NULL,');
                qry_SQL.SQL.Add('  ItTxNo = NULL,');
                qry_SQL.SQL.Add('  ReturnedOn = NULL, UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE()');
                qry_SQL.SQL.Add('WHERE Filenumber = :Filenumber');
                qry_SQL.Parameters.ParamValues['Warehouse'] := edt_TWHouse.Text;
                qry_SQL.Parameters.ParamValues['LocNo'] := edt_TLoc.Text;
                qry_SQL.Parameters.ParamValues['Filenumber'] := qry_Files.FieldByName('Filenumber').AsString;
                qry_SQL.ExecSQL;
              end
            else
              begin
                qry_SQL.Close;
                qry_SQL.SQL.Clear;
                qry_SQL.SQL.Add('UPDATE Files SET');
                qry_SQL.SQL.Add('  Warehouse = NULL,');
                qry_SQL.SQL.Add('  LocNo = :LocNo,');
                qry_SQL.SQL.Add('  IssueStatus = ''OUTI'',');
                qry_SQL.SQL.Add('  IssuedTo = NULL,');
                qry_SQL.SQL.Add('  IssuedUserID = NULL,');
                qry_SQL.SQL.Add('  ItTxNo = NULL,');
                qry_SQL.SQL.Add('  ReturnedOn = NULL, UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE()');
                qry_SQL.SQL.Add('WHERE Filenumber = :Filenumber');
                qry_SQL.Parameters.ParamValues['LocNo'] := edt_DestProxy.Text;
                qry_SQL.Parameters.ParamValues['Filenumber'] := qry_Files.FieldByName('Filenumber').AsString;
                qry_SQL.ExecSQL;
              end;
          end;
        qry_Files.Next;
      end;
//==================================Move Items==================================
    qry_Items.First;
    While not qry_Items.EOF Do
      begin
        mem_Status.Lines.Append(TimetoStr(Now)+'===> Moving Itemnumber '+qry_Items.FieldByName('Itemnumber').asString+'.');
        Application.ProcessMessages;

        If (qry_Items.FieldByName('IssueStatus').AsString = 'L') OR
           (qry_Items.FieldByName('IssueStatus').AsString = 'OI') OR
           (qry_Items.FieldByName('IssueStatus').AsString = 'IUI') Then
          begin
            If pg_Destination.ActivePageIndex = 0 Then
              begin
                qry_SQL.Close;
                qry_SQL.SQL.Clear;
                qry_SQL.SQL.Add('UPDATE Items SET');
                qry_SQL.SQL.Add('  Warehouse = :Warehouse,');
                qry_SQL.SQL.Add('  LocNo = :LocNo,');
                qry_SQL.SQL.Add('  Status = ''L'',');
                qry_SQL.SQL.Add('  IssuedTo = NULL,');
                qry_SQL.SQL.Add('  IssuedUserID = NULL,');
                qry_SQL.SQL.Add('  ItTxNo = NULL,');
                qry_SQL.SQL.Add('  ReturnedOn = NULL, UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE()');
                qry_SQL.SQL.Add('WHERE Itemnumber = :Itemnumber');
                qry_SQL.Parameters.ParamValues['Warehouse'] := edt_TWHouse.Text;
                qry_SQL.Parameters.ParamValues['LocNo'] := edt_TLoc.Text;
                qry_SQL.Parameters.ParamValues['Itemnumber'] := qry_Items.FieldByName('Itemnumber').AsString;
                qry_SQL.ExecSQL;
              end
            else
              begin
                qry_SQL.Close;
                qry_SQL.SQL.Clear;
                qry_SQL.SQL.Add('UPDATE Items SET');
                qry_SQL.SQL.Add('  Warehouse = NULL,');
                qry_SQL.SQL.Add('  LocNo = :LocNo,');
                qry_SQL.SQL.Add('  Status = ''OI'',');
                qry_SQL.SQL.Add('  IssuedTo = NULL,');
                qry_SQL.SQL.Add('  IssuedUserID = NULL,');
                qry_SQL.SQL.Add('  ItTxNo = NULL,');
                qry_SQL.SQL.Add('  ReturnedOn = NULL, UpdatedBy = '+QuotedStr(User)+', UpdatedOn = GETDATE()');
                qry_SQL.SQL.Add('WHERE Itemnumber = :Itemnumber');
                qry_SQL.Parameters.ParamValues['LocNo'] := edt_DestProxy.Text;
                qry_SQL.Parameters.ParamValues['Itemnumber'] := qry_Items.FieldByName('Itemnumber').AsString;
                qry_SQL.ExecSQL;
              end;
          end;
        qry_Items.Next;
      end;
//-----
    If pg_Source.ActivePageIndex = 0 Then
      begin
        mem_Status.Lines.Append(TimetoStr(Now)+'===> Reserializing Source Location');
        Application.ProcessMessages;
        qry_ReSer.Close;
        qry_ReSer.SQL.Clear;
        qry_ReSer.SQL.Add('EXEC Met_ReSerial '+QuotedStr(edt_FLoc.Text)+', '+QuotedStr(edt_FWHouse.Text));
        qry_ReSer.ExecSQL;
      end;
//-----
    If pg_Destination.ActivePageIndex = 0 Then
      begin
        mem_Status.Lines.Append(TimetoStr(Now)+'===> Reserializing Destination Location');
        Application.ProcessMessages;
        qry_ReSer.Close;
        qry_ReSer.SQL.Clear;
        qry_ReSer.SQL.Add('EXEC Met_ReSerial '+QuotedStr(edt_TLoc.Text)+', '+QuotedStr(edt_TWHouse.Text));
        qry_ReSer.ExecSQL;
      end;
    mem_Status.Lines.Append(TimetoStr(Now)+'===> Finished');
    Application.ProcessMessages;
    Screen.Cursor := crDefault;
    mem_Status.Lines.Append(TimetoStr(Now)+'===> Files/Items moved successfully.');
  finally
    Screen.Cursor := crDefault;
    qry_ReSer.Close;
    qry_loc.Close;
    qry_Files.Close;
  end;
end;

procedure Tfram_MoveLocations.Button2Click(Sender: TObject);
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

procedure Tfram_MoveLocations.Button3Click(Sender: TObject);
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

end.
