unit repFilesInuseputawaynottracked;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, DB,
  DBTables, Mask, DBCtrls, QRCtrls, QuickRpt, Printers, ADODB, DateUtils;

type
  Tfrm_FilesInuseputawaynottracked = class(TForm)
    pnl_Top: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    date_From: TDateTimePicker;
    Label2: TLabel;
    date_To: TDateTimePicker;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    qry_Records: TADOQuery;
    dts_Records: TDataSource;
    Label9: TLabel;
    lbl_Branch: TLabel;
    Label40: TLabel;
    lbl_Dept: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    edt_Dept: TEdit;
    btn_SelDept: TButton;
    TabSheet2: TTabSheet;
    rep_PutAwwaybutNotTracked: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    btn_PrintDelSlip: TBitBtn;
    PrintDialog: TPrintDialog;
    btn_Close: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_PrintDelSlipClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_FilesInuseputawaynottracked: Tfrm_FilesInuseputawaynottracked;

implementation

uses main, SelBranch, SelDept,MetrofilerDataModule;

{$R *.dfm}

procedure Tfrm_FilesInuseputawaynottracked.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_FilesInuseputawaynottracked.FormCreate(Sender: TObject);
begin
  date_From.DateTime := Now-14;
  date_To.DateTime := Now;
  PageControl1.ActivePageIndex := 0;
end;

procedure Tfrm_FilesInuseputawaynottracked.BitBtn1Click(Sender: TObject);
begin
  If trim(edt_Branch.Text) = '' Then
    begin
      Messagedlg('Please select a Branch First!!', mtInformation, [mbOK], 0);
      exit;
    end;
  If trim(edt_Dept.Text) = '' Then
    begin
      Messagedlg('Please select a Department First!!', mtInformation, [mbOK], 0);
      exit;
    end;

  qry_Records.Close;
  qry_Records.SQL.Clear;
  qry_Records.SQL.Add('SELECT f.Filenumber AS "Record", f.Branch, f.Department, f.FileType AS "RecordType",');
  qry_Records.SQL.Add('       f.EntryDate AS "Date Captured",');
  qry_Records.SQL.Add('	f.IssueStatus AS "Current Status"');
  qry_Records.SQL.Add('FROM Files f');
  qry_Records.SQL.Add('WHERE f.Filenumber IN (SELECT t.Filenumber FROM Transa t WHERE t.Transaction_Type = ''RIU'')');
  qry_Records.SQL.Add('AND f.Filenumber NOT in (SELECT l.fILENUMBER');
  qry_Records.SQL.Add('	                 FROM METROTrackLog l');
  qry_Records.SQL.Add('                         WHERE l.TrackDate > (SELECT MAX(t.TDate) FROM Transa t WHERE t.Transaction_Type = ''RIU'' and t.Filenumber = l.Filenumber)');
  qry_Records.SQL.Add('  			AND l.IssueStatus = ''INUSE'')');
  qry_Records.SQL.Add('AND f.IssueStatus <> ''INUSE''');
  qry_Records.SQL.Add('AND f.EntryDate BETWEEN :mFrom AND :mTo');
  qry_Records.SQL.Add('AND f.Branch = '+QuotedStr(trim(edt_Branch.Text)));
  qry_Records.SQL.Add('AND f.Department = '+QuotedStr(trim(edt_Dept.Text)));
  qry_Records.SQL.Add('AND f.EntryDate BETWEEN :mFrom2 AND :mTo2');
  qry_Records.Parameters.ParamByName('mFrom').Value :=  StartOfTheDay(date_From.DateTime);
  qry_Records.Parameters.ParamByName('mTo').Value := EndofTheDay(date_To.DateTime);
  qry_Records.Parameters.ParamByName('mFrom2').Value := StartOfTheDay(date_From.DateTime);
  qry_Records.Parameters.ParamByName('mTo2').Value := EndofTheDay(date_To.DateTime);
  qry_Records.Open;
end;

procedure Tfrm_FilesInuseputawaynottracked.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_Records.Close;
  Action := caFree;
end;

procedure Tfrm_FilesInuseputawaynottracked.btn_SelBranchClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
      edt_Dept.Text := '';
      lbl_Dept.Caption := '---';
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_FilesInuseputawaynottracked.btn_SelDeptClick(Sender: TObject);
begin
  If length(edt_Branch.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_Branch.Text, User) = mrOK Then
    begin
      edt_Dept.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_Dept.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_FilesInuseputawaynottracked.btn_PrintDelSlipClick(Sender: TObject);
begin
  If not qry_Records.Active Then
    begin
      If trim(edt_Branch.Text) = '' Then
        begin
          Messagedlg('Please select a Branch First!!', mtInformation, [mbOK], 0);
          exit;
        end;
      If trim(edt_Dept.Text) = '' Then
        begin
          Messagedlg('Please select a Department First!!', mtInformation, [mbOK], 0);
          exit;
        end;

      qry_Records.Close;
      qry_Records.SQL.Clear;
      qry_Records.SQL.Add('SELECT f.Filenumber AS "Record", f.Branch, f.Department, f.FileType AS "RecordType",');
      qry_Records.SQL.Add('       f.EntryDate AS "Date Captured",');
      qry_Records.SQL.Add('	f.IssueStatus AS "Current Status"');
      qry_Records.SQL.Add('FROM Files f');
      qry_Records.SQL.Add('WHERE f.Filenumber IN (SELECT t.Filenumber FROM Transa t WHERE t.Transaction_Type = ''RIU'')');
      qry_Records.SQL.Add('AND f.Filenumber NOT in (SELECT l.fILENUMBER');
      qry_Records.SQL.Add('	                 FROM METROTrackLog l');
      qry_Records.SQL.Add('                         WHERE l.TrackDate > (SELECT MAX(t.TDate) FROM Transa t WHERE t.Transaction_Type = ''RIU'' and t.Filenumber = l.Filenumber)');
      qry_Records.SQL.Add('  			AND l.IssueStatus = ''INUSE'')');
      qry_Records.SQL.Add('AND f.IssueStatus <> ''INUSE''');
      qry_Records.SQL.Add('AND f.EntryDate BETWEEN :mFrom AND :mTo');
      qry_Records.SQL.Add('AND f.Branch = '+QuotedStr(trim(edt_Branch.Text)));
      qry_Records.SQL.Add('AND f.Department = '+QuotedStr(trim(edt_Dept.Text)));
      qry_Records.SQL.Add('AND f.EntryDate BETWEEN :mFrom2 AND :mTo2');
      qry_Records.Parameters.ParamByName('mFrom').Value :=  StartOfTheDay(date_From.DateTime);
      qry_Records.Parameters.ParamByName('mTo').Value := EndofTheDay(date_To.DateTime);
      qry_Records.Parameters.ParamByName('mFrom2').Value := StartOfTheDay(date_From.DateTime);
      qry_Records.Parameters.ParamByName('mTo2').Value := EndofTheDay(date_To.DateTime);
      qry_Records.Open;
    end;
  If PrintDialog.Execute Then                     
    begin
      rep_PutAwwaybutNotTracked.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
      rep_PutAwwaybutNotTracked.Print;
    end;
end;

end.
