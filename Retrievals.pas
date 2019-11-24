//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit Retrievals;

interface

uses
  SysUtils, Dialogs,Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Mask, Grids, ExtCtrls,
  Buttons, ComCtrls, Tabnotbk, printers, ToolWin, Qrctrls, quickrpt, WinSpool,
  INIFiles, Variants, ImgList,ShellAPI, ADODB, DateUtils;

type
  Tfrm_Retrievals = class(TForm)
    PrintDialog: TPrintDialog;
    PrintDialog1: TPrintDialog;
    SaveFile: TSaveDialog;
    qry_Container: TADOQuery;
    qry_GetAutoInc: TADOQuery;
    qry_Info: TADOQuery;
    pg_ReqClerk: TPageControl;
    TabSheet1: TTabSheet;
    Panel5: TPanel;
    grid_Pick: TDBGrid;
    Panel6: TPanel;
    ScrollBox1: TScrollBox;
    Label6: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    editType: TDBEdit;
    nav_Pickd: TDBNavigator;
    grid_Pickd: TDBGrid;
    btn_PrintPickingSlip: TBitBtn;
    btn_PrintDelSlip: TBitBtn;
    editFilingMethod: TDBEdit;
    edt_Barcode: TEdit;
    btn_ProcessPick: TBitBtn;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    btn_Process: TBitBtn;
    btn_RAddList: TBitBtn;
    btn_SendPickList: TBitBtn;
    btn_ClearPickList: TBitBtn;
    editItemNo: TEdit;
    lb_Pick: TListBox;
    TabSheet3: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet6: TTabSheet;
    rep_DeliverySlip: TQuickRep;
    QRBand1: TQRBand;
    QRLabel17: TQRLabel;
    QRSysData4: TQRSysData;
    QRBand2: TQRBand;
    QRSysData5: TQRSysData;
    QRLabel18: TQRLabel;
    QRSysData6: TQRSysData;
    QRShape3: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRBand3: TQRBand;
    QRLabel25: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    lbl_DelHInfo1: TQRLabel;
    QRBand4: TQRBand;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRShape4: TQRShape;
    QRBand5: TQRBand;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    lbl_DelHInfo2: TQRLabel;
    Bevel2: TBevel;
    edt_FindPick: TEdit;
    btn_FindPick: TBitBtn;
    Panel1: TPanel;
    Label30: TLabel;
    lbl_Branch: TLabel;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    Label40: TLabel;
    lbl_Dept: TLabel;
    edt_Dept: TEdit;
    btn_SelDept: TButton;
    btn_SearchContainer: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Timer_RefreshPick: TTimer;
    qry_Access: TADOQuery;
    qry_Items: TADOQuery;
    QRSubDetail1: TQRSubDetail;
    QRBand6: TQRBand;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    qry_UpdPrTextFields: TADOQuery;
    chk_SplitWHPick: TCheckBox;
    chk_PrItemsDelNote: TCheckBox;
    lbl_DelHInfo3: TQRLabel;
    lbl_DelHInfo4: TQRLabel;
    Panel3: TPanel;
    cb_Stat: TComboBox;
    Label3: TLabel;
    qry_Delete: TADOQuery;
    qry_SQL: TADOQuery;
    TabSheet5: TTabSheet;
    ImageList1: TImageList;
    qry_Gen: TADOQuery;
    Label2: TLabel;
    editFileNo: TEdit;
    Label22: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label25: TLabel;
    btn_MAddList: TBitBtn;
    btn_MatchItems: TBitBtn;
    btn_MClearItems: TBitBtn;
    editMItemNo: TEdit;
    lb_MatchItems: TListBox;
    editMFileNo: TEdit;
    BitBtn5: TBitBtn;
    TabSheet7: TTabSheet;
    qry_PrintPickList: TADOQuery;
    rep_PickingSlip: TQuickRep;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    grp_Warehouse: TQRGroup;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData3: TQRSysData;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    chk_UnPrinted: TCheckBox;
    chk_Range: TCheckBox;
    edt_From: TEdit;
    edt_To: TEdit;
    Label17: TLabel;
    mem_FileList: TMemo;
    QRLabel1: TQRLabel;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    qry_Upd: TADOQuery;
    QRSubDetail2: TQRSubDetail;
    QRLabel32: TQRLabel;
    QRDBText31: TQRDBText;
    qry_GetLoc: TADOQuery;
    QRDBText32: TQRDBText;
    QRLabel33: TQRLabel;
    Panel4: TPanel;
    btn_Close: TSpeedButton;
    nav_Pick: TDBNavigator;
    btn_Cancel: TSpeedButton;
    qry_DelNoteRType: TADOQuery;
    lbl_NewPicks: TLabel;
    qry_ReqeMail: TADOQuery;
    QRLabel22: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qry_PrPickd: TADOQuery;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    lbl_DelInfo3: TQRDBText;
    lbl_DelInfo4: TQRDBText;
    QRLabel8: TQRLabel;
    lbl_DeliveryNoteTot: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel37: TQRLabel;
    QRShape9: TQRShape;
    QRLabel38: TQRLabel;
    QRShape10: TQRShape;
    lblMatched: TQRLabel;
    QRLabel48: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel49: TQRLabel;
    lbl_PickSlipTot: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText42: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel47: TQRLabel;
    QRSysData1: TQRSysData;
    lbl_DateTo: TLabel;
    lbl_DateRange: TLabel;
    date_From: TDateTimePicker;
    date_To: TDateTimePicker;
    btn_Refresh: TSpeedButton;
    TabSheet4: TTabSheet;
    Panel7: TPanel;
    Label4: TLabel;
    lbl_BranchNF: TLabel;
    Label7: TLabel;
    lbl_DeptNF: TLabel;
    edt_BranchNF: TEdit;
    btn_BranchNF: TButton;
    edt_DeptNF: TEdit;
    btn_DeptNF: TButton;
    Panel8: TPanel;
    Label5: TLabel;
    cb_FilerRequesterNF: TComboBox;
    Panel9: TPanel;
    ScrollBox2: TScrollBox;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Bevel1: TBevel;
    DBEdit1: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    DBEdit2: TDBEdit;
    edt_BarcodeNF: TEdit;
    BitBtn8: TBitBtn;
    edt_FindPickNF: TEdit;
    btn_FindPickNF: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    Panel10: TPanel;
    grid_PickNF: TDBGrid;
    btn_FlagasNotFound: TBitBtn;
    qry_ReSerial: TADOQuery;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    chk_DelNotesNoRePrints2: TCheckBox;
    chk_DelNotesNoRePrints: TCheckBox;
    qry_PrintDelNote: TADOQuery;
    lbl_DelNoteCompany: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_ProcessPickClick(Sender: TObject);
    procedure ntb_ReqClerkChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure btn_ProcessClick(Sender: TObject);
    procedure btn_RAddListClick(Sender: TObject);
    procedure btn_ClearPickListClick(Sender: TObject);
    procedure btn_SendPickListClick(Sender: TObject);
    procedure btn_PrintPickingSlipClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btn_PrintDelSlipClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure pg_ReqClerkChange(Sender: TObject);
    procedure btn_FindPickClick(Sender: TObject);
    procedure edt_FindPickKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_BranchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_BranchChange(Sender: TObject);
    procedure edt_DeptChange(Sender: TObject);
    procedure edt_DeptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_RefreshClick(Sender: TObject);
    procedure btn_SearchContainerClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Timer_RefreshPickTimer(Sender: TObject);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure date_ToChange(Sender: TObject);
    procedure cb_StatChange(Sender: TObject);
    procedure btn_MAddListClick(Sender: TObject);
    procedure btn_MClearItemsClick(Sender: TObject);
    procedure btn_MatchItemsClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure edt_BarcodeKeyPress(Sender: TObject; var Key: Char);
    procedure grid_PickDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure lblMatchedPrint(sender: TObject; var Value: string);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure date_FromChange(Sender: TObject);
    procedure btn_BranchNFClick(Sender: TObject);
    procedure edt_BranchNFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_DeptNFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_DeptNFClick(Sender: TObject);
    procedure edt_BranchNFChange(Sender: TObject);
    procedure edt_DeptNFChange(Sender: TObject);
    procedure cb_FilerRequesterNFChange(Sender: TObject);
    procedure grid_PickNFDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn_FindPickNFClick(Sender: TObject);
    procedure edt_FindPickNFKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_FlagasNotFoundClick(Sender: TObject);
    procedure editMItemNoKeyPress(Sender: TObject; var Key: Char);
    procedure editItemNoKeyPress(Sender: TObject; var Key: Char);
  private
    { private declarations }
    LastPickListNo   :Integer;
    procedure ViewPickEntries;
    procedure ViewPickEntriesNF;
    function PrintDeliveryNote(Tx_No :Integer):Boolean;
    function eMailDeliveryNote(Tx_No :Integer):Boolean;
  public
    { public declarations }
    procedure ExportCSV;
  end;
var
  frm_Retrievals: Tfrm_Retrievals;
  ActTime :TDateTime;

implementation

uses main, DataModReq, SelContainer, SelBranch,
  SelDept, SelOffSiteBoxDetails, SelPickDet, SelRType, MetrofilerDataModule;

{$R *.DFM}

procedure Tfrm_Retrievals.FormCreate(Sender: TObject);
begin
date_From.Date := Now-7;
date_To.Date := Now;
btn_cancel.Visible := frm_Console.AccessRight(21);

qry_SQL.Close;
qry_SQL.SQL.Clear;
qry_SQL.SQL.Add('SELECT NoPrintPrevDeliveredDelNote FROM Company');
qry_SQL.Open;
chk_DelNotesNoRePrints.Checked := (qry_SQL.FieldByName('NoPrintPrevDeliveredDelNote').AsInteger = 1);
chk_DelNotesNoRePrints2.Checked := (qry_SQL.FieldByName('NoPrintPrevDeliveredDelNote').AsInteger = 1);
qry_SQL.Close;

With DatModReq do
begin
  ViewPickEntries;
end;
pg_ReqClerk.ActivePage := Tabsheet1;
Tabsheet6.TabVisible := False;
timer_RefreshPick.Interval := frm_Console.FilRef;
end;

procedure Tfrm_Retrievals.grid_PickDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If Column.FieldName = 'SLA' Then
    begin
      if DatModREq.qry_Pick.FieldByName('SLAn').AsInteger > 80 then
        begin
          grid_Pick.Canvas.Font.Color:=clWhite;
          grid_Pick.Canvas.Brush.Color:=clRed;
        end
      else if DatModREq.qry_Pick.FieldByName('SLAn').AsInteger > 60 then
        begin
          grid_Pick.Canvas.Font.Color:=clBlack;
          grid_Pick.Canvas.Brush.Color:=$00245BFF;
        end
      else
      if DatModREq.qry_Pick.FieldByName('SLAn').AsInteger > 40 then
        begin
          grid_Pick.Canvas.Font.Color:=clBlack;
          grid_Pick.Canvas.Brush.Color:=$005EAEFF;
        end
      else
      if DatModREq.qry_Pick.FieldByName('SLAn').AsInteger > 20 then
        begin
          grid_Pick.Canvas.Font.Color:=clBlack;
          grid_Pick.Canvas.Brush.Color:=$00AEFFFF;
        end
      else
        begin
          grid_Pick.Canvas.Font.Color:=clBlack;
          grid_Pick.Canvas.Brush.Color:= $00FFFFD2;
        end;
      grid_Pick.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure Tfrm_Retrievals.grid_PickNFDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If Column.FieldName = 'SLA' Then
    begin
      if DatModREq.qry_Pick.FieldByName('SLAn').AsInteger > 80 then
        begin
          grid_PickNF.Canvas.Font.Color:=clWhite;
          grid_PickNF.Canvas.Brush.Color:=clRed;
        end
      else if DatModREq.qry_Pick.FieldByName('SLAn').AsInteger > 60 then
        begin
          grid_PickNF.Canvas.Font.Color:=clBlack;
          grid_PickNF.Canvas.Brush.Color:=$00245BFF;
        end
      else
      if DatModREq.qry_Pick.FieldByName('SLAn').AsInteger > 40 then
        begin
          grid_PickNF.Canvas.Font.Color:=clBlack;
          grid_PickNF.Canvas.Brush.Color:=$005EAEFF;
        end
      else
      if DatModREq.qry_Pick.FieldByName('SLAn').AsInteger > 20 then
        begin
          grid_PickNF.Canvas.Font.Color:=clBlack;
          grid_PickNF.Canvas.Brush.Color:=$00AEFFFF;
        end
      else
        begin
          grid_PickNF.Canvas.Font.Color:=clBlack;
          grid_PickNF.Canvas.Brush.Color:= $00FFFFD2;
        end;
      grid_PickNF.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure Tfrm_Retrievals.lblMatchedPrint(sender: TObject; var Value: string);
begin
  Value := qry_PrPickd.FieldByName('Matched').AsString;
end;

procedure Tfrm_Retrievals.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
  DatModReq.qry_Pick.Close;
  DatModReq.qry_Pickd.Close;
  frm_Console.act_Retrievals.Enabled := True;
  Action := caFree;
end;

procedure Tfrm_Retrievals.ExportCSV;
var
CSVFile :TextFile;
mfile :string;
begin
With DatModReq do
begin
if SaveFile.Execute then
mfile := SaveFile.FileName;
AssignFile(CSVFile,mfile);
ReWrite(CSVFile);
qry_Container.First;
Write(CSVFile,'"Filenumber",');
Write(CSVFile,'"BoxNumber",');
Write(CSVFile,'"Text1",');
Write(CSVFile,'"Text2",');
Write(CSVFile,'"Text3",');
Write(CSVFile,'"Text4",');
Write(CSVFile,'"Text5",');
Write(CSVFile,'"Text6",');
Write(CSVFile,'"Date1",');
Write(CSVFile,'"Date2",');
Write(CSVFile,'"Number1",');
Write(CSVFile,'"Number2"');
Writeln(CSVFile);
qry_Container.First;
while not qry_Container.EOF do
begin
{      for i := 0 to qry_Container.FieldCount -1 do
      begin
          if not first  then Write(CSVFile,',')
          else first := false;
          if qry_Container.Fields[i].DataType = ftString then
             Write(CSVFile,'"' + qry_Container.Fields[i].AsString + '"')
          else
          if qry_Container.Fields[i].DataType = ftFloat then
              Write(CSVFile,FloatToStrF(qry_Container.Fields[i].AsFloat,ffFixed,9,2))
          else
          if qry_Container.Fields[i].DataType = ftCurrency then
              Write(CSVFile,FloatToStrF(qry_Container.Fields[i].AsFloat,ffFixed,9,2))
          else
              Write(CSVFile,qry_Container.Fields[i].AsString);
}
     qry_Gen.Close;
     qry_Gen.Parameters.ParamByName('mFIle').Value := trim(qry_Container.FieldByName('RecordNo').AsString);
     qry_Gen.Open;
     if qry_Gen.RecordCount > 0 then
     begin
        Write(CSVFile,'"' + trim(qry_Container.FieldByName('RecordNo').AsString) + '",');
        Write(CSVFile,'"' + trim(qry_Container.FieldByName('Container').AsString) + '",');
        Write(CSVFile,'"' + trim(qry_Gen.FieldByName('Text1').AsString) + '",');
        Write(CSVFile,'"' + trim(qry_Gen.FieldByName('Text2').AsString) + '",');
        Write(CSVFile,'"' + trim(qry_Gen.FieldByName('Text3').AsString) + '",');
        Write(CSVFile,'"' + trim(qry_Gen.FieldByName('Text4').AsString) + '",');
        Write(CSVFile,'"' + trim(qry_Gen.FieldByName('Text5').AsString) + '",');
        Write(CSVFile,'"' + trim(qry_Gen.FieldByName('Text6').AsString) + '",');
        if (qry_Gen.FieldByName('Date1').Value > null) then
                Write(CSVFile,'"' + DateToStr(qry_Gen.FieldByName('Date1').AsDateTime) + '",')
        else
                Write(CSVFile,'"",');
        if (qry_Gen.FieldByName('Date2').Value > null) then
           Write(CSVFile,'"' + DateToStr(qry_Gen.FieldByName('Date2').AsDateTime) + '",')
        else
                Write(CSVFile,'"",');
        Write(CSVFile,'"' + IntToStr(qry_Gen.FieldByName('Number1').AsInteger) + '",');
        Write(CSVFile,'"' + IntToStr(qry_Gen.FieldByName('Number2').AsInteger) + '"');
        Writeln(CSVFile);
     end;
     qry_Container.Next;
end;
CloseFile(CSVFile);
qry_Container.First;         //return Table to the first record
end;
end;


procedure Tfrm_Retrievals.btn_ProcessPickClick(Sender: TObject);

var
  J                     :Integer;
  OffSiteContainer      :String;
  FindFlag              :Boolean;
  mContainerNo          :String;
  mRecordNo             :String;
  mItemNo               :String;
  ScannedBarcode        :String;
  Comments              :String;
  MatchedResult         :String;
begin
  lbl_NewPicks.Visible := false;
  btn_ProcessPick.Enabled := False;
  Screen.Cursor := crHourglass;
  With DatModReq do
    begin
      If pg_ReqClerk.ActivePage = Tabsheet1 Then
        begin
          ScannedBarcode := trim(edt_Barcode.Text);
        end
      else if pg_ReqClerk.ActivePage = Tabsheet4 Then
        begin
          ScannedBarcode := trim(edt_BarcodeNF.Text);
        end;

      try
        If (ScannedBarcode = '')Then
          begin
            MessageDlg('Please scan a Barcode first!',mtInformation,[mbOK],0);
            exit;
          end;
        FindFlag := False;
//===============Autofind feature===============================================
//--------If not Selected------------------
        If (UpperCase(Trim(qry_Pickd.FieldByName('TrType').AsString)) = 'CON')AND
           (UpperCase(ScannedBarcode) = UpperCase(Trim(qry_Pickd.FieldByName('Container').AsString))) Then
          FindFlag := True;
        If (UpperCase(Trim(qry_Pickd.FieldByName('TrType').AsString)) = 'RECORD')AND
           (UpperCase(ScannedBarcode) = UpperCase(Trim(qry_Pickd.FieldByName('Barcode').AsString))) Then
          FindFlag := True;
        If (UpperCase(Trim(qry_Pickd.FieldByName('TrType').AsString)) = 'ITEM')AND
           (UpperCase(ScannedBarcode) = UpperCase(Trim(qry_Pickd.FieldByName('Itemnumber').AsString))) Then
          FindFlag := True;
//-------Try a locate------------------------
        If not FindFlag Then
          begin
            If (UpperCase(Trim(qry_Pickd.FieldByName('TrType').AsString)) = 'CON') Then
              begin
                If qry_Pickd.Locate('Container', ScannedBarcode, []) Then
                  FindFlag := True;
              end
            else if (UpperCase(Trim(qry_Pickd.FieldByName('TrType').AsString)) = 'RECORD') Then
              begin
                If qry_Pickd.Locate('Barcode', ScannedBarcode, []) Then
                  FindFlag := True;
              end
            else if (UpperCase(Trim(qry_Pickd.FieldByName('TrType').AsString)) = 'ITEM') Then
              begin
                If qry_Pickd.Locate('Itemnumber', ScannedBarcode, []) Then
                  FindFlag := True;
              end
          end;
//--------If not matched then search for it (latest)-------
        If not FindFlag Then
          begin
            If frm_Console.PickSlipAutoLocate = 1 Then
              begin
                qry_SQL.Close;
                qry_SQL.SQL.Clear;
                qry_SQL.SQL.Add('SELECT b.Tx_No, b.TrType, b.Container, b.Barcode, b.Itemnumber FROM Pick a, Pickd b');
                qry_SQL.SQL.Add('WHERE a.Tx_No = b.Tx_No AND a.Status <> ''C''');
                qry_SQL.SQL.Add('AND a.Branch IN (');

                qry_SQL.SQL.Add('SELECT');
                qry_SQL.SQL.Add('	b.Branch');
                qry_SQL.SQL.Add('FROM');
                qry_SQL.SQL.Add('	Branches b');
                qry_SQL.SQL.Add('WHERE');
                qry_SQL.SQL.Add('	ISNULL(b.Status, 0) <> 1');
                if not frm_Console.AccessSysAdmin then
                  begin
                    qry_SQL.SQL.Add('	AND (');
                    qry_SQL.SQL.Add('');
                    qry_SQL.SQL.Add('(Branch IN (SELECT a.Branch FROM IndexUAuthRts a WHERE a.UserId = '+QuotedStr(User)+'))');
                    qry_SQL.SQL.Add('OR');
                    qry_SQL.SQL.Add('(Branch IN (SELECT a.Branch FROM IndexUAuthRts a INNER JOIN RolesRts r ON a.RoleId = r.RoleId WHERE r.UserId = '+QuotedStr(User)+'))');
                    qry_SQL.SQL.Add(')');
                  end;

                qry_SQL.SQL.Add(')');
                qry_SQL.SQL.Add('AND a.Department IN (');

                qry_SQL.SQL.Add('SELECT');
                qry_SQL.SQL.Add('	d.Department');
                qry_SQL.SQL.Add('FROM');
                qry_SQL.SQL.Add('	Departments d');
                qry_SQL.SQL.Add('	INNER JOIN Branches b ON d.Branch = b.Branch');
                qry_SQL.SQL.Add('WHERE');
                qry_SQL.SQL.Add('	ISNULL(b.Status, 0) <> 1 AND');
                qry_SQL.SQL.Add('	ISNULL(d.Status, 0) <> 1 AND');
                qry_SQL.SQL.Add('	b.Branch = a.Branch');

                if not frm_Console.AccessSysAdmin then
                  begin
                    qry_SQL.SQL.Add('	AND (');
                    qry_SQL.SQL.Add('');
                    qry_SQL.SQL.Add('(d.Department IN (SELECT a.Department FROM IndexUAuthRts a WHERE a.Branch = b.Branch AND a.UserId = '+QuotedStr(User)+'))');
                    qry_SQL.SQL.Add('OR');
                    qry_SQL.SQL.Add('(d.Department IN (SELECT a.Department FROM IndexUAuthRts a INNER JOIN RolesRts r ON a.RoleId = r.RoleId WHERE a.Branch = b.Branch AND r.UserId = '+QuotedStr(User)+'))');
                    qry_SQL.SQL.Add(')');
                  end;

                qry_SQL.SQL.Add(')');
                If length(edt_Branch.Text) > 0 Then
                  begin
                    qry_SQL.SQL.Add('AND (a.BRANCH = :BR)');
                    qry_SQL.Parameters.ParamByName('BR').Value := edt_Branch.Text;
                  end;
                If length(edt_Dept.Text) > 0 Then
                  begin
                    qry_SQL.SQL.Add('AND (a.DEPARTMENT = :DPT)');
                    qry_SQL.Parameters.ParamByName('DPT').Value := edt_Dept.Text;
                  end;
                qry_SQL.SQL.Add('AND b.Matched = 0');
                qry_SQL.SQL.Add('AND ((b.TrType = ''CON'')AND(b.Container = '+QuotedStr(ScannedBarcode)+')OR');
                qry_SQL.SQL.Add('     (b.TrType = ''RECORD'')AND(b.Barcode = '+QuotedStr(ScannedBarcode)+')OR');
                qry_SQL.SQL.Add('     (b.TrType = ''ITEM'')AND(b.Itemnumber = '+QuotedStr(ScannedBarcode)+'))');
                qry_SQL.SQL.Add('ORDER BY a.Tx_No, b.ItemNo');
                qry_SQL.Open;

                If qry_SQL.IsEmpty Then
                  begin
                    MessageDlg('No Details found to match!',mtInformation,[mbOK],0);
                    exit;
                  end;

                mContainerNo := trim(qry_SQL.FieldbyName('Container').asString);
                mRecordNo := trim(qry_SQL.FieldbyName('Barcode').asString);
                mItemNo := trim(qry_SQL.FieldbyName('Itemnumber').asString);

                If not qry_Pick.Locate('Tx_No',  qry_SQL.FieldbyName('TX_NO').AsInteger, []) Then
                  begin
                    MessageDlg('No Details found to match!',mtInformation,[mbOK],0);
                    exit;
                  end;

                If (trim(mContainerNo) <> '')and
                   (trim(mRecordNo) <> '')and
                   (trim(mItemNo) <> '')Then
                  begin
                    FindFlag := qry_Pickd.Locate('Container;Barcode;Itemnumber', VarArrayOF([trim(mContainerNo),
                                                                                          trim(mRecordNo),
                                                                                          trim(mItemNo)]), []);
                  end
                else If (trim(mContainerNo) = '')and
                        (trim(mRecordNo) <> '')and
                        (trim(mItemNo) <> '')Then
                  begin
                    FindFlag := qry_Pickd.Locate('Container;Barcode;Itemnumber', VarArrayOF([NULL,
                                                                                          trim(mRecordNo),
                                                                                          trim(mItemNo)]), []);
                  end
                else If (trim(mContainerNo) <> '')and
                        (trim(mRecordNo) <> '')and
                        (trim(mItemNo) = '')Then
                  begin
                    FindFlag := qry_Pickd.Locate('Container;Barcode;Itemnumber', VarArrayOF([trim(mContainerNo),
                                                                                          trim(mRecordNo),
                                                                                          NULL]), []);
                  end
                else If (trim(mContainerNo) = '')and
                        (trim(mRecordNo) <> '')and
                        (trim(mItemNo) = '')Then
                  begin
                    FindFlag := qry_Pickd.Locate('Container;Barcode;Itemnumber', VarArrayOF([NULL,
                                                                                          trim(mRecordNo),
                                                                                          NULL]), []);
                  end
                else If (trim(mContainerNo) <> '')and
                        (trim(mRecordNo) = '')and
                        (trim(mItemNo) = '')Then
                  begin
                    FindFlag := qry_Pickd.Locate('Container;Barcode;Itemnumber', VarArrayOF([trim(mContainerNo),
                                                                                          NULL,
                                                                                          NULL]), []);
                  end
                else If (trim(mContainerNo) <> '')and
                        (trim(mRecordNo) <> '')and
                        (trim(mItemNo) = '')Then
                  begin
                    FindFlag := qry_Pickd.Locate('Container;Barcode;Itemnumber', VarArrayOF([NULL,
                                                                                          NULL,
                                                                                          trim(mItemNo)]), []);
                  end
                else If (trim(mContainerNo) = '')and
                        (trim(mRecordNo) = '')and
                        (trim(mItemNo) <> '')Then
                  begin
                    FindFlag := qry_Pickd.Locate('Itemnumber', trim(mItemNo), []);
                  end;
              end;
          end;
//==============================================================================

        If not FindFlag Then
          begin
            MessageDlg('No Details found to match!',mtInformation,[mbOK],0);
            exit;
          end;

        If qry_Pick.FieldbyName('Type').asString = 'IM' Then
          begin
            MessageDlg('Picking List cannot be Matched here. Use the Match Items Tab.',mtInformation,[mbOK],0);
            exit;
          end;

        If trim(qry_Pick.FieldbyName('Status').asString) = 'C' Then
          begin
            MessageDlg('Picking List Cancelled',mtInformation,[mbOK],0);
            exit;
          end;

        If not qry_Pick.FieldbyName('Printed').asBoolean Then
          begin
            MessageDlg('First Print the Picking Slip.',mtInformation,[mbOK],0);
            exit;
          end;

        If qry_Pickd.FieldbyName('Matched').asinteger <> 0 Then
          begin
            MessageDlg('Already Processed.',mtInformation,[mbOK],0);
            exit;
          end;

        If pg_ReqClerk.ActivePage = Tabsheet1 Then
          begin
            If qry_Pick.FieldByName('DeliveryNotePrinted').AsBoolean Then
              begin
                MessageDlg('Delivery Note already Printed. Please use the Not Found tab to process this entry!',mtInformation,[mbOK],0);
                exit;
              end;
          end;

        mContainerNo := trim(qry_Pickd.FieldbyName('Container').asString);
        mRecordNo := trim(qry_Pickd.FieldbyName('Barcode').asString);
        mItemNo := trim(qry_Pickd.FieldbyName('Itemnumber').asString);


//============================Verify the Location===============================
        If trim(qry_Pickd.FieldByName('Warehouse').AsString) > '' Then
          begin
            qry_CheckLoc.Close;
            qry_CheckLoc.SQL.Clear;
            qry_CheckLoc.SQL.Add('SELECT LocNo FROM Location WHERE Warehouse = :mWare AND LocNo = :mLoc');
            qry_CheckLoc.Parameters.ParamByName('mWare').Value := trim(qry_Pickd.FieldByName('Warehouse').asString);
            qry_CheckLoc.Parameters.ParamByName('mLoc').Value := trim(qry_Pickd.FieldByName('LocNo').asString);
            qry_CheckLoc.Open;
            if qry_CheckLoc.isEmpty then
              begin
                MessageDlg('Location invalid',mtInformation,[mbOK],0);
                exit;
              end;
          end;
//==========================Verify Container====================================
        IF length(mContainerNo) > 0 then
          begin
            qry_Container.Close;
            qry_Container.SQL.Clear;
            qry_Container.SQL.Add('SELECT Container, IssueStatus FROM Containers WHERE (Container = :CO)');
            qry_Container.Parameters.ParamByName('CO').Value := mContainerNo;
            qry_Container.Open;
            IF qry_Container.IsEmpty Then
              begin
                Messagedlg('Container not found!!',mtInformation,[mbOK],0);
                exit;
              end;
            If (trim(qry_Container.FieldByName('IssueStatus').asString) <> 'IN') and
               (trim(qry_Container.FieldByName('IssueStatus').asString) <> 'MIN') and //check that file is indeed in ---->
               (trim(qry_Container.FieldByName('IssueStatus').asString) <> 'REQ') Then
              begin
                MessageDlg('Container Status is not -IN-',mtInformation,[mbOK],0);
                exit;
              end;
          end;
        If (trim(qry_Pick.FieldByName('Type').asString) = 'OS')Then
          begin
            qry_VerContContents.Close;
            qry_VerContContents.SQL.Clear;
            qry_VerContContents.SQL.Add('SELECT COUNT(*) Tot FROM FILES where (ISSUESTATUS = ''OUT'')and(ContainerNo = :CO)and(Code = :CC)');
            qry_VerContContents.Parameters.ParamByName('CO').Value := mContainerNo;
            qry_VerContContents.Parameters.ParamByName('CC').Value := CompsCode;
            qry_VerContContents.Open;
            If qry_VerContContents.FieldbyName('Tot').asInteger > 0 Then
              If Messagedlg('The Container contained Files with a status -OUT-. Do you still want to send the container Off-Site??', mtConfirmation ,[mbYes, mbNo], 0) = mrNo Then
                begin
                  Messagedlg('User Abort!!', mtInformation,[mbOK], 0);
                  exit;
                end;
//==========================UPDATE Container====================================
            frm_SelOffSiteBoxDetails.Branch := trim(qry_Pick.FieldByName('BRANCH').AsString);
            frm_SelOffSiteBoxDetails.Department := trim(qry_Pick.FieldByName('DEPARTMENT').AsString);
            IF not(frm_SelOffSiteBoxDetails.ShowModal = mrOK) Then
              begin
                MessageDlg('Process Aborted!!',mtInformation,[mbOK],0);
                exit;
              end;

            OffSiteContainer := frm_SelOffSiteBoxDetails.edt_Container.Text;
            qry_UpdContainer.Close;
            qry_UpdContainer.SQL.Clear;
            qry_UpdContainer.SQL.Add('SELECT Container FROM Containers Where Container = :CN');
            qry_UpdContainer.Parameters.ParamByName('CN').Value := OffSiteContainer;
            qry_UpdContainer.Open;
            If qry_UpdContainer.IsEmpty Then
              begin
                qry_GenIns.Close;
                qry_GenIns.SQL.Clear;
                qry_GenIns.SQL.Add('INSERT INTO Containers (Container, Boxnumber, IssueStatus, FileType, ContType, Code, Branch, Department, Text1, Text2, Text3, Text4, Text5, Text6, Text7, Text8, Text9, Text10, Date1, Date2, Date3, Number1, Number2,');
                qry_GenIns.SQL.Add('                        IssuedTo, IssuedOn, IssuedUserID, ReturnedOn, ItTxNo, Warehouse, LocNo, UpdatedBy, UpdatedOn)');
                qry_GenIns.SQL.Add('VALUES(:Container, :Boxnumber, :IssueStatus, :FileType, :ContType, :Code, :Branch, :Department, :Text1, :Text2, :Text3, :Text4, :Text5, :Text6, :Text7, :Text8, :Text9, :Text10, :Date1, :Date2, :Date3, :Number1, :Number2,');
                qry_GenIns.SQL.Add('       :IssuedTo, GetDate(), :IssuedUserID, NULL, NULL, NULL, NULL, '+QuotedStr(User)+', GETDATE())');
                qry_GenIns.Parameters.ParamByName('Container').Value := OffSiteContainer;
                qry_GenIns.Parameters.ParamByName('Boxnumber').Value := frm_SelOffSiteBoxDetails.edt_Boxnumber.Text;
                qry_GenIns.Parameters.ParamByName('IssueStatus').Value := 'REQ';
                qry_GenIns.Parameters.ParamByName('FileType').Value := frm_SelOffSiteBoxDetails.edt_RecordType.Text;
                qry_GenIns.Parameters.ParamByName('ContTYpe').Value := frm_SelOffSiteBoxDetails.cb_ContType.Text;
                qry_GenIns.Parameters.ParamByName('Code').Value := CompsCode;
                qry_GenIns.Parameters.ParamByName('Branch').Value := frm_SelOffSiteBoxDetails.Branch;
                qry_GenIns.Parameters.ParamByName('Department').Value := frm_SelOffSiteBoxDetails.Department;
                For J := 1 to 10 Do
                  begin
                    If trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Text'+InttoStr(J))).Text) <> '' Then
                      qry_GenIns.Parameters.ParamByName('Text'+InttoStr(J)).Value := trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Text'+InttoStr(J))).Text)
                    else
                      begin
                        qry_GenIns.Parameters.ParamByName('Text'+InttoStr(J)).DataType := ftString;
                        qry_GenIns.Parameters.ParamByName('Text'+InttoStr(J)).Value := Null;
                      end;
                  end;

                For J := 1 to 3 Do
                  begin
                    If trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Date'+InttoStr(J))).Text) <> '' Then
                      qry_GenIns.Parameters.ParamByName('Date'+InttoStr(J)).Value := StrtoDate(trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Date'+InttoStr(J))).Text))
                    else
                      begin
                        qry_GenIns.Parameters.ParamByName('Date'+InttoStr(J)).DataType := ftDateTime;
                        qry_GenIns.Parameters.ParamByName('Date'+InttoStr(J)).Value := Null;
                      end;
                  end;
                For J := 1 to 2 Do
                  begin
                    If trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Number'+InttoStr(J))).Text) <> '' Then
                      qry_GenIns.Parameters.ParamByName('Number'+InttoStr(J)).Value := StrtoInt(trim(TEdit(frm_SelOffSiteBoxDetails.FindComponent('edt_Number'+InttoStr(J))).Text))
                    else
                      begin
                        qry_GenIns.Parameters.ParamByName('Number'+InttoStr(J)).DataType := ftInteger;
                        qry_GenIns.Parameters.ParamByName('Number'+InttoStr(J)).Value := Null;
                      end;

                  end;
                qry_GenIns.Parameters.ParamByName('IssuedUserID').Value := User;
                qry_GenIns.Parameters.ParamByName('IssuedTo').Value := trim(FirstName+' '+Surname);

                qry_GenIns.ExecSQL;
              end;
          end;
//==============================================================================
//===================All Checks complete if here then process===================
//==============================================================================
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('DECLARE @Result varchar(255)');
        qry_SQL.SQL.Add('EXECUTE [dbo].[ap_MatchPickEntry] ');
        qry_SQL.SQL.Add('   :ItemNo');
        qry_SQL.SQL.Add('  ,:Tx_No');
        qry_SQL.SQL.Add('  ,:UserId');
        qry_SQL.SQL.Add('  ,:OffSiteContainer');
        qry_SQL.SQL.Add('  ,:System');
        qry_SQL.SQL.Add('  ,@Result OUTPUT');
        qry_SQL.SQL.Add('SELECT @Result AS REsult');
        qry_SQL.Parameters.ParamByName('ItemNo').value := qry_PickD.FieldByName('ItemNo').asInteger;
        qry_SQL.Parameters.ParamByName('Tx_No').value := qry_PickD.FieldByName('Tx_No').asInteger;
        qry_SQL.Parameters.ParamByName('UserId').value := User;
        qry_SQL.Parameters.ParamByName('OffSiteContainer').value := OffSiteContainer;
        qry_SQL.Parameters.ParamByName('System').value := 'Metrofiler';
        qry_SQL.Open;
        MatchedResult := qry_SQL.FieldByName('Result').asString;
        If MatchedResult <> 'OK' Then
          begin
            Messagedlg(MatchedResult, mtInformation, [mbOK], 0);
            exit;
          end;
//------------Containers--------------------------------
        If trim(mContainerNo) <> '' Then
          begin
            If trim(mRecordNo) = '' Then
              begin
                dm_Metrofiler.PrintContReqSlip(mContainerNo, trim(qry_Pick.FieldbyName('REQUESTER').asString));
              end;
          end;
      finally
        qry_CheckLoc.Close;
        qry_Container.Close;
        qry_VerContContents.Close;
        qry_CheckFile.Close;
        qry_Items.Close;
        qry_UpdContainer.Close;
        qry_UpdLocation2.Close;
        qry_SetFilesOffSite.Close;
        qry_SQL.Close;
        qry_GenIns.Close;

        qry_Pickd.Close;
        qry_Pickd.Open;
        Screen.Cursor := crDefault;
        If pg_ReqClerk.ActivePage = Tabsheet1 Then
          begin
            edt_Barcode.Text := '';
            edt_Barcode.SetFocus;
          end
        else if pg_ReqClerk.ActivePage = Tabsheet4 Then
          begin
            edt_BarcodeNF.Text := '';
            edt_BarcodeNF.SetFocus;
          end;
        btn_ProcessPick.Enabled := True;
      end;
  end; //With DatModReq do
end;
//==============================================================================

procedure Tfrm_Retrievals.ntb_ReqClerkChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
end;
//Scan in item number and the system then retrieves the File number for you!!!!
procedure Tfrm_Retrievals.btn_ProcessClick(Sender: TObject);
begin
  With DatModReq do
    begin
      qry_Items.Close;
      qry_Items.SQL.Clear;
      qry_Items.SQL.Add('select FileNumber from items where ItemNumber = '+QuotedStr(editItemNo.Text));
      qry_Items.Open;
       if not qry_Items.isEmpty then
         editFileNo.Text := trim(qry_Items.FieldByName('FileNumber').asString)
       else MessageDlg('Item Number not matched to a File number',mtInformation,[mbOK],0);
      qry_Items.Close;
    end;
 end;

procedure Tfrm_Retrievals.btn_RAddListClick(Sender: TObject);
var
  fbcode                  :String;
  ibcode                  :String;
  tbcode                  :String;
  i                       :Integer;
begin
  With DatModReq do
    begin
      fbcode := trim(editFileNo.Text);
      ibcode := trim(editItemNo.Text);
//-------
      If (fbcode = '')or(ibcode = '') Then
        begin
          MessageDlg('Filenumber and Itemnumber must be completed!', mtWarning, [mbOK], 0);
          exit;
        end;
//------Validate the Filenumber------------
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT Filenumber, IssueStatus FROM files WHERE Filenumber = '+QuotedStr(fbCode));
      qry_SQL.Open;
      If qry_SQL.IsEmpty Then
        begin
          qry_SQL.Close;
          MessageDlg('Filenumber not found!!', mtWarning, [mbOK], 0);
          exit;
        end;
      If (trim(qry_SQL.FieldByName('ISSUESTATUS').asString) <> 'IN')AND
         (trim(qry_SQL.FieldByName('ISSUESTATUS').asString) <> 'INUSE')AND
         (trim(qry_SQL.FieldByName('ISSUESTATUS').asString) <> 'INUSEI')AND
         (trim(qry_SQL.FieldByName('ISSUESTATUS').asString) <> 'MI')Then
        begin
          qry_SQL.Close;
          MessageDlg('Filenumber has Invalid Status!!', mtWarning, [mbOK], 0);
          exit;
        end;
      qry_SQL.Close;
//------Validate the Itemnumber------------
      For i := 0 to lb_Pick.Items.Count-1 Do
        begin
          tbcode := copy(lb_Pick.Items.Strings[i], pos('--->', lb_Pick.Items.Strings[i])+4, length(lb_Pick.Items.Strings[i]));
          If trim(UpperCase(ibcode)) = trim(UpperCase(tbcode)) Then
            begin
              qry_SQL.Close;
              MessageDlg('ItemNumber already added!!', mtWarning, [mbOK], 0);
              exit;
            end;
        end;

      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT Itemnumber, Status FROM Items WHERE Itemnumber = '+QuotedStr(ibCode));
      qry_SQL.Open;
      If qry_SQL.IsEmpty Then
        begin
          qry_SQL.Close;
          MessageDlg('ItemNumber not found!!', mtWarning, [mbOK], 0);
          exit;
        end;
      If (trim(qry_SQL.FieldByName('STATUS').asString) <> 'L')AND
         (trim(qry_SQL.FieldByName('STATUS').asString) <> 'R')AND
         (trim(qry_SQL.FieldByName('STATUS').asString) <> 'P')Then
        begin
          qry_SQL.Close;
          MessageDlg('ItemNumber has Invalid Status!!', mtWarning, [mbOK], 0);
          exit;
        end;
      qry_SQL.Close;
      lb_Pick.Items.Add(editFileNo.Text + '--->' + editItemNo.Text);
      editItemNo.Text := '';
      editFileNo.Text := '';
      editFileNo.SetFocus;
    end;
end;

procedure Tfrm_Retrievals.btn_ClearPickListClick(Sender: TObject);
begin
if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
   lb_Pick.Clear;
end;

procedure Tfrm_Retrievals.btn_SendPickListClick(Sender: TObject);
var
  fbcode                  :string;
  ibcode                  :string;
  i                       :integer;
  tx_no                   :integer;
  mloc                    :string;
  mware                   :string;
  mFilingMethod           :string;
  mRecNo                  :integer;
  FileList                :TStringList;
  Branch, Dept   :String;
begin
  With DatModReq do
    begin
      If lb_Pick.Items.Count = 0 Then
        begin
          MessageDlg('No List created', mtWarning, [mbOK], 0);
          exit;
        end;
//----------------
      FileList := TStringList.Create;
      try
//---------------First Verify again---------------------------------------------
        for i := 0 to lb_Pick.Items.Count-1 do
          begin
            fbcode := copy(lb_Pick.Items.Strings[i], 1, pos('--->', lb_Pick.Items.Strings[i])-1);
            ibcode := copy(lb_Pick.Items.Strings[i], pos('--->', lb_Pick.Items.Strings[i])+4, length(lb_Pick.Items.Strings[i]));
//-------
            If (fbcode = '')or(ibcode = '') Then
              begin
                MessageDlg('Filenumber and Itemnumber must be completed!', mtWarning, [mbOK], 0);
                exit;
              end;
//------Validate the Filenumber------------
            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('SELECT * FROM files WHERE Filenumber = '+QuotedStr(fbCode));
            qry_SQL.Open;
            If qry_SQL.IsEmpty Then
              begin
                qry_SQL.Close;
                MessageDlg('Filenumber not found!!', mtWarning, [mbOK], 0);
                exit;
              end;
            If (trim(qry_SQL.FieldByName('ISSUESTATUS').asString) <> 'IN')AND
               (trim(qry_SQL.FieldByName('ISSUESTATUS').asString) <> 'MI')Then
              begin
                qry_SQL.Close;
                MessageDlg('Filenumber has Invalid Status!!', mtWarning, [mbOK], 0);
                exit;
              end;
            Branch := trim(qry_SQL.FieldByName('BRANCH').asString);
            Dept := trim(qry_SQL.FieldByName('DEPARTMENT').asString);
            qry_SQL.Close;
//------Validate the Itemnumber------------
            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('SELECT * FROM Items WHERE Itemnumber = '+QuotedStr(ibCode));
            qry_SQL.Open;
            If qry_SQL.IsEmpty Then
              begin
                qry_SQL.Close;
                MessageDlg('ItemNumber not found!!', mtWarning, [mbOK], 0);
                exit;
              end;
            If (trim(qry_SQL.FieldByName('STATUS').asString) <> 'L')AND
               (trim(qry_SQL.FieldByName('STATUS').asString) <> 'R')AND
               (trim(qry_SQL.FieldByName('STATUS').asString) <> 'P')Then
              begin
                qry_SQL.Close;
                MessageDlg('ItemNumber has Invalid Status!!', mtWarning, [mbOK], 0);
                exit;
              end;
            qry_SQL.Close;
          end;
//----------------Create PickList Header----------------------------------------
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('SET NOCOUNT On');
        qry_SQL.SQL.Add('DECLARE @Tx_No int');
        qry_SQL.SQL.Add('EXEC [dbo].[GenPickTxNo] :Branch,:Department,:UserID,:Requester,:RequesterUserID,:Type,:TypeDesc,:DeliveryType,:DeliveryAddress,Comments,@Tx_No OUTPUT');
        qry_SQL.SQL.Add('SET NOCOUNT Off');
        qry_SQL.SQL.Add('SELECT @Tx_No AS Tx_No');
//----
        qry_SQL.Parameters.ParamByName('Branch').Value := Branch;
        qry_SQL.Parameters.ParamByName('Department').Value := Dept;
        qry_SQL.Parameters.ParamByName('UserID').Value := User;
        qry_SQL.Parameters.ParamByName('Requester').Value := trim(FirstName+' '+Surname);
        qry_SQL.Parameters.ParamByName('RequesterUserID').Value := User;
        qry_SQL.Parameters.ParamByName('Type').Value := 'IM';
        qry_SQL.Parameters.ParamByName('TypeDesc').Value := 'Items/Match';
        qry_SQL.Parameters.ParamByName('DeliveryType').Value := 'Filing Clerk';
        qry_SQL.Parameters.ParamByName('DeliveryAddress').Value := '';
        qry_SQL.Open;
        Tx_no := qry_SQL.Fields[0].AsInteger;
        qry_SQL.Close;
//-----------------Add Record Numbers-------------------------------------------
        FileList.Clear;
        for i := 0 to lb_Pick.Items.Count-1 do
          begin
            fbcode := copy(lb_Pick.Items.Strings[i], 1, pos('--->', lb_Pick.Items.Strings[i])-1);
            If FileList.IndexOf(fbcode) = -1 Then
              FileList.Append(fbCode);
          end;

        for i := 0 to FileList.Count-1 do
          begin
            fbcode := FileList.Strings[i];

            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('SELECT * FROM files WHERE Filenumber = '+QuotedStr(fbCode));
            qry_SQL.Open;
            mloc := trim(qry_SQL.FieldByName('locno').asString);
            mware := trim(qry_SQL.FieldByName('warehouse').asString);
            mFilingMethod := trim(qry_SQL.FieldByName('FilingMethod').asString);
            mRecNo := qry_SQL.FieldByName('RecordNo').AsInteger;
            qry_SQL.Close;
         //---
            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('INSERT INTO PickD (Tx_No, Barcode, Warehouse, Row, LevelNum, Bay, LocNo, RecordNo, FilingMethod, TrType, Matched)');
            qry_SQL.SQL.Add('VALUES(:Tx_No, :Barcode, :Warehouse, :Row, :LevelNum, :Bay, :LocNo, :RecordNo, :FilingMethod, ''RECORD'', 0)');
         //---
            qry_GetLoc.Close;
            qry_GetLoc.SQL.Clear;
            qry_GetLoc.SQL.Add('SELECT * FROM Location');
            qry_GetLoc.SQL.Add('WHERE Warehouse = '+QuotedStr(mware));
            qry_GetLoc.SQL.Add('AND LocNo = '+QuotedStr(mloc));
            qry_GetLoc.Open;
         //---
            qry_SQL.Parameters.ParamByName('Tx_No').Value := Tx_No;
            qry_SQL.Parameters.ParamByName('Barcode').Value := fbCode;
            qry_SQL.Parameters.ParamByName('Warehouse').Value := mWare;
            qry_SQL.Parameters.ParamByName('Row').Value := trim(qry_GetLoc.FieldByName('rownum').asString);
            qry_SQL.Parameters.ParamByName('LevelNum').Value := qry_GetLoc.FieldByName('levelnum').asInteger;
            qry_SQL.Parameters.ParamByName('Bay').Value := qry_GetLoc.FieldByName('bay').asInteger;
            qry_SQL.Parameters.ParamByName('LocNo').Value := mLoc;
            qry_SQL.Parameters.ParamByName('RecordNo').Value := mRecNo;
            qry_SQL.Parameters.ParamByName('FilingMethod').Value := mFilingMethod;
            qry_SQL.ExecSQL;

            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('Update Files SET IssueStatus = ''FREQ'',');
            qry_SQL.SQL.Add('ItTxNo = '+InttoStr(tx_no)+',');
            qry_SQL.SQL.Add('IssuedOn = GetDate(),');
            qry_SQL.SQL.Add('IssuedUserID = ''FClerk'',');
            qry_SQL.SQL.Add('IssuedTo = ''FilingClerk'',');
            qry_SQL.SQL.Add('UpdatedBy = '+QuotedStr(User)+',');
            qry_SQL.SQL.Add('UpdatedOn = GETDATE()');
            qry_SQL.SQL.Add('WHERE Filenumber = '+QuotedStr(fbCode));
            qry_SQL.ExecSQL;
         end;
//-----------------Now Add Items------------------------------------------------
        for i := 0 to lb_Pick.Items.Count-1 do
          begin
            fbcode := copy(lb_Pick.Items.Strings[i], 1, pos('--->', lb_Pick.Items.Strings[i])-1);
            ibcode := copy(lb_Pick.Items.Strings[i], pos('--->', lb_Pick.Items.Strings[i])+4, length(lb_Pick.Items.Strings[i]));

            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('SELECT * FROM Items WHERE Itemnumber = '+QuotedStr(ibCode));
            qry_SQL.Open;
            mloc := trim(qry_SQL.FieldByName('locno').asString);
            mware := trim(qry_SQL.FieldByName('warehouse').asString);
            mRecNo := qry_SQL.FieldByName('RecordNo').AsInteger;
            qry_SQL.Close;
         //---
            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('INSERT INTO PickD (Tx_No, Barcode, ItemNumber, Warehouse, Row, LevelNum, Bay, LocNo, RecordNo, FilingMethod, TrType, Matched)');
            qry_SQL.SQL.Add('VALUES(:Tx_No, :Barcode, :ItemNumber, :Warehouse, :Row, :LevelNum, :Bay, :LocNo, :RecordNo, :FilingMethod, ''ITEM'', 0)');
         //---
            qry_GetLoc.Close;
            qry_GetLoc.SQL.Clear;
            qry_GetLoc.SQL.Add('SELECT * FROM Location');
            qry_GetLoc.SQL.Add('WHERE Warehouse = '+QuotedStr(mware));
            qry_GetLoc.SQL.Add('AND LocNo = '+QuotedStr(mloc));
            qry_GetLoc.Open;
         //---
            qry_SQL.Parameters.ParamByName('Tx_No').Value := Tx_No;
            qry_SQL.Parameters.ParamByName('Barcode').Value := fbCode;
            qry_SQL.Parameters.ParamByName('Itemnumber').Value := ibCode;
            qry_SQL.Parameters.ParamByName('Warehouse').Value := mWare;
            qry_SQL.Parameters.ParamByName('Row').Value := trim(qry_GetLoc.FieldByName('rownum').asString);
            qry_SQL.Parameters.ParamByName('LevelNum').Value := qry_GetLoc.FieldByName('levelnum').asInteger;
            qry_SQL.Parameters.ParamByName('Bay').Value := qry_GetLoc.FieldByName('bay').asInteger;
            qry_SQL.Parameters.ParamByName('LocNo').Value := mLoc;
            qry_SQL.Parameters.ParamByName('RecordNo').Value := mRecNo;
            qry_SQL.Parameters.ParamByName('FilingMethod').Value := '';
            qry_SQL.ExecSQL;
          end;
       MessageDlg('Picking List created',mtInformation,[mbOK],0);
       lb_Pick.Items.Clear;
    finally
      FileList.Free;
      qry_SQL.Close;
    end;
   end;    //With DatModReq do}
end;

procedure Tfrm_Retrievals.btn_PrintPickingSlipClick(Sender: TObject);
Var
  TxKey, PickingSlipPrintQty   :Integer;
  PickNos                      :String;
begin
  lbl_NewPicks.Visible := false;
//------------
  qry_PrintPickList.Close;
  qry_PrintPickList.SQL.Clear;
  qry_PrintPickList.SQL.Add('DECLARE	@Info1 varchar(50),');
  qry_PrintPickList.SQL.Add('		      @SQL nvarchar(max)');
  qry_PrintPickList.SQL.Add('');
  qry_PrintPickList.SQL.Add('SELECT ');
  qry_PrintPickList.SQL.Add('	@Info1 = RTRIM(ISNULL(PickText1, ''''))');
  qry_PrintPickList.SQL.Add('FROM ');
  qry_PrintPickList.SQL.Add('	Company');
  qry_PrintPickList.SQL.Add('');
  qry_PrintPickList.SQL.Add('SELECT @SQL = N''');
  qry_PrintPickList.SQL.Add('SELECT');
  qry_PrintPickList.SQL.Add('	p.Tx_No,');
  qry_PrintPickList.SQL.Add('	(SELECT COUNT(*) FROM Items i WHERE i.Filenumber = d.Barcode) AS TotItems,');
  qry_PrintPickList.SQL.Add('	p.TxDate,p.Requester, p.UserId, p.Deliver, p.TypeDesc,p.CostCentre,p.InternalDept,p.DeliveryAddress,p.Comments,');
  qry_PrintPickList.SQL.Add('	d.Warehouse, d.LocNo, d.RecordNo, d.Container, d.Barcode, d.Itemnumber, d.FilingMethod,''');
  qry_PrintPickList.SQL.Add('IF @Info1 <> ''''');
  qry_PrintPickList.SQL.Add('SELECT @SQL = @SQL + N''');
  qry_PrintPickList.SQL.Add('	''''Info1'''' = ');
  qry_PrintPickList.SQL.Add('      CASE ');
  qry_PrintPickList.SQL.Add('         WHEN d.TrType = ''''CONTAINER'''' THEN (SELECT ''+@Info1+'' FROM Containers WHERE Container = d.Container)');
  qry_PrintPickList.SQL.Add('         WHEN d.TrType = ''''RECORD'''' THEN (SELECT ''+@Info1+'' FROM Files WHERE Filenumber = d.Barcode)');
  qry_PrintPickList.SQL.Add('         WHEN d.TrType = ''''ITEM'''' THEN (SELECT ''+@Info1+'' FROM Items WHERE Itemnumber = d.Itemnumber)');
  qry_PrintPickList.SQL.Add('         ELSE NULL');
  qry_PrintPickList.SQL.Add('      END,''');
  qry_PrintPickList.SQL.Add('ELSE SELECT @SQL = @SQL + N''NULL AS ''''Info1'''',''');
  qry_PrintPickList.SQL.Add('');
  qry_PrintPickList.SQL.Add('SELECT @SQL = @SQL + N''');
  qry_PrintPickList.SQL.Add('	''''RecordType'''' = ');
  qry_PrintPickList.SQL.Add('      CASE ');
  qry_PrintPickList.SQL.Add('         WHEN d.TrType = ''''CONTAINER'''' THEN (SELECT FileType FROM Containers WHERE Container = d.Container)');
  qry_PrintPickList.SQL.Add('         WHEN d.TrType = ''''RECORD'''' THEN (SELECT FileType FROM Files WHERE Filenumber = d.Barcode)');
  qry_PrintPickList.SQL.Add('         WHEN d.TrType = ''''ITEM'''' THEN (SELECT FileType FROM Items WHERE Itemnumber = d.Itemnumber)');
  qry_PrintPickList.SQL.Add('         ELSE NULL');
  qry_PrintPickList.SQL.Add('      END,''');
  qry_PrintPickList.SQL.Add('SELECT @SQL = @SQL + N''');
  qry_PrintPickList.SQL.Add('	''''Matched'''' = ');
  qry_PrintPickList.SQL.Add('      CASE ');
  qry_PrintPickList.SQL.Add('         WHEN d.Matched = 1 THEN ''''Found''''');
  qry_PrintPickList.SQL.Add('         ELSE''''Not Found''''');
  qry_PrintPickList.SQL.Add('      END');
  qry_PrintPickList.SQL.Add('FROM');
  qry_PrintPickList.SQL.Add('	Pick p, Pickd d');
  qry_PrintPickList.SQL.Add('	WHERE p.Tx_No = d.Tx_No');
  If (chk_UnPrinted.Checked)or(chk_Range.Checked) Then
    begin
      DatModReq.qry_Pick.First;
      DatModReq.qry_Pick.DisableControls;
      PickNos := '';
      While not DatModReq.qry_Pick.EOF Do
        begin
          PickNos := PickNos + DatModReq.qry_Pick.FieldbyName('TX_NO').AsString + ',';
          DatModReq.qry_Pick.Next;
        end;
      DatModReq.qry_Pick.First;
      DatModReq.qry_Pick.EnableControls;

      Delete(PickNos, length(PickNos), 1);

      If chk_UnPrinted.Checked Then
        qry_PrintPickList.SQL.Add('AND p.Printed = 0');
      If chk_Range.Checked Then
        qry_PrintPickList.SQL.Add('AND p.Tx_No BETWEEN '+edt_From.Text+' AND '+edt_To.Text);
        qry_PrintPickList.SQL.Add('AND p.Tx_No IN ('+PickNos+')');
    end
  else qry_PrintPickList.SQL.Add('AND p.Tx_No = '+InttoStr(DatModReq.qry_Pick.FieldbyName('TX_NO').asInteger));
  qry_PrintPickList.SQL.Add('ORDER BY p.Tx_No,d.WareHouse,d.Row,d.Bay,d.LevelNum,d.container,d.barcode,d.itemnumber');
  qry_PrintPickList.SQL.Add('''');
  qry_PrintPickList.SQL.Add('');
  qry_PrintPickList.SQL.Add('EXEC (@SQL)');
  qry_PrintPickList.Open;

  If chk_SplitWHPick.Checked Then
    begin
      grp_Warehouse.ForceNewPage := True;
      grp_Warehouse.ReprintOnNewPage := True;
    end
  else
    begin
      grp_Warehouse.ForceNewPage := False;
      grp_Warehouse.ReprintOnNewPage := True;
    end;
  If PrintDialog.Execute Then
    begin
      qry_PrintPickList.First;
      While not qry_PrintPickList.EOF Do
        begin
          qry_SQL.Close;
          qry_SQL.SQL.Text := 'UPDATE Pick SET Printed = 1, PrintedDateTime = GETDATE() WHERE Tx_No = '+InttoStr(qry_PrintPickList.FieldbyName('TX_NO').asInteger);
          qry_SQL.ExecSQL;
          qry_PrintPickList.nEXT;
        end;

      qry_SQL.Close;
      qry_SQL.SQL.Text := 'SELECT PickingSlipPrintQty FROM Company';
      qry_SQL.Open;
      PickingSlipPrintQty := qry_SQL.Fields[0].AsInteger;
      qry_SQL.Close;

      qry_PrintPickList.First;
      rep_PickingSlip.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
      rep_PickingSlip.Prepare;
      rep_PickingSlip.PrinterSettings.Copies := PickingSlipPrintQty;
      rep_PickingSlip.Print;

      Timer_RefreshPick.Enabled := false;
      try
        TxKey := DatModReq.qry_Pick.FieldbyName('TX_NO').asInteger;
        DatModReq.qry_Pick.Close;
        DatModReq.qry_Pick.Open;
        DatModReq.qry_Pick.Locate('TX_NO', TxKey, []);
      finally
        Timer_RefreshPick.Enabled := true;
      end;
    end;
end;

procedure Tfrm_Retrievals.BitBtn4Click(Sender: TObject);
var
  PageNum         :string;
  Ctr,x,PHeight,LineSpace :integer;
  Nr                      :String[50];
begin
With DatModReq do
begin
  x := 0;
  Ctr := 1;
  if PrintDialog.Execute then
   begin
     Printer.BeginDoc;
     PHeight := Printer.PageHeight;
     LineSpace :=Pheight DIV 60;
     PageNum := IntToStr(Printer.PageNumber);
     PRinter.Canvas.Font.Name := 'Arial'; 
     Printer.Canvas.Font.Size := 10;
     Printer.Canvas.TextOut(0,x,'Metro File Items not Filed at : ' + DateToStr(date)+ ' ' + TimeToStr(Time));
     x := x + LineSpace;
     Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------');
     x := x + LineSpace;
     x := x + LineSpace;
     x := x + LineSpace;
     x := x + LineSpace;
     x := x + LineSpace;
     Printer.Canvas.TextOut(0,x,'File No');
     Printer.Canvas.TextOut(800,x,'Item No');
     Printer.Canvas.TextOut(1600,x,'Status');
     x := x + LineSpace;
     Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------');
     x := x + LineSpace;
     qry_notfiled.First;
     while Not(qry_notfiled.EOF) do
       begin
         If trim(qry_notfiled.FieldByName('FileNumber').asString) <> Nr Then
           Printer.Canvas.TextOut(0,x,trim(qry_notfiled.FieldByName('FileNumber').asString));
         Nr := trim(qry_notfiled.FieldByName('FileNumber').asString);
         Printer.Canvas.TextOut(800,x,trim(qry_notfiled.FieldByName('ItemNumber').asString));
         Printer.Canvas.TextOut(1600,x,trim(qry_notfiled.FieldByName('Status').asString));
         x := x + LineSpace;
         if Ctr > 59 then
           begin
             Printer.NewPage;
             x:= 0;
             Ctr := 0;
             PageNum := IntToStr(Printer.PageNumber);
           end;  //If Then
          qry_notfiled.Next;
       end;  //While Do
   end; // If Then
   Printer.EndDoc;
end;    //With DatModReq do
end;  //PrinDialog


procedure Tfrm_Retrievals.btn_PrintDelSlipClick(Sender: TObject);
var
  pCh                                           :PChar;
  seMail,sSubject,sBody,sStr, FileType, sField  :String;
  j, TxKey                                      :Integer;
  ReqUserID, eMailField                         :String;
  DelNoteQty                                    :Integer;
begin
  Timer_RefreshPick.Enabled := false;
  lbl_NewPicks.Visible := false;
  try
    If DatModReq.qry_Pick.IsEmpty Then exit;

    If not DatModReq.qry_Pick.FieldbyName('Printed').asBoolean Then
      begin
        qry_SQL.Close;
        MessageDlg('Please first print the picking list!!', mtWarning, [mbOK], 0);
        exit;
      end;

    TxKey := DatModReq.qry_Pick.FieldbyName('TX_NO').asInteger;

    If not PrintDeliveryNote(TxKey) Then
      exit;

    if (frm_Console.ReqNotify = 1)then
      eMailDeliveryNote(TxKey);
  finally
    Timer_RefreshPick.Enabled := true;
  end;
end;

procedure Tfrm_Retrievals.btn_BranchNFClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_BranchNF.Text := trim(frm_SelBranch.qry_Branch.FieldbyName('Branch').asString);
      lbl_BranchNF.Caption := trim(frm_SelBranch.qry_Branch.FieldbyName('Name').asString);
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_Retrievals.btn_CancelClick(Sender: TObject);
Var
  TxNo    :Integer;
begin
  If MessageDlg('Are you sure you wish to delete this Picking List?', mtConfirmation,[mbYes,mbNo],0) = mrNo Then
    Exit;
//-----
  Timer_RefreshPick.Enabled := False;
  TxNo := DatModReq.qry_Pick.FieldbyName('TX_NO').asInteger;
  Screen.Cursor := crHourglass;
  try
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT COUNT(*) FROM PickD WHERE Tx_No = :Tx_No');
    qry_SQL.SQL.Add('AND Matched <> 0');
    qry_SQL.Parameters.ParamByName('TX_NO').Value := TxNo;
    qry_SQL.Open;
    If qry_SQL.Fields[0].AsInteger > 0 Then
      begin
        MessageDlg('This Picking Slip has already been Processed and cannot be deleted.', mtInformation, [mbOK], 0);
        exit;
      end;
//----Files
    qry_Delete.Close;
    qry_Delete.SQL.Clear;
    qry_Delete.SQL.Add('UPDATE Containers SET IssueStatus = ''IN'', IssuedUserID = NULL, IssuedTo = NULL, IssuedOn = NULL, ReturnedOn = GETDATE(), UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
    qry_Delete.SQL.Add('WHERE Container IN (SELECT Container FROM PickD WHERE Tx_No = :Tx_No)');
    qry_Delete.Parameters.ParamByName('TX_NO').Value := TxNo;
    qry_Delete.ExecSQL;
//----Files
    qry_Delete.Close;
    qry_Delete.SQL.Clear;
    qry_Delete.SQL.Add('UPDATE files SET IssueStatus = ''IN'', IssuedUserID = NULL, IssuedTo = NULL, IssuedOn = NULL, ReturnedOn = GETDATE(), UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
    qry_Delete.SQL.Add('WHERE Filenumber IN (SELECT Barcode FROM PickD WHERE Tx_No = :Tx_No)');
    qry_Delete.Parameters.ParamByName('TX_NO').Value := TxNo;
    qry_Delete.ExecSQL;
//----Items
    qry_Delete.Close;
    qry_Delete.SQL.Clear;
    qry_Delete.SQL.Add('UPDATE Items SET Status = CASE LocNo WHEN NULL THEN ''I'' WHEN '''' THEN ''I'' ELSE ''L'' END, IssuedUserID = NULL, IssuedTo = NULL, IssuedOn = NULL, ReturnedOn = GETDATE(), UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
    qry_Delete.SQL.Add('WHERE Itemnumber IN (SELECT Itemnumber FROM PickD WHERE Tx_No = :Tx_No)');
    qry_Delete.Parameters.ParamByName('TX_NO').Value := TxNo;
    qry_Delete.ExecSQL;
//----Delete Picking Slip Entries
    qry_Delete.Close;
    qry_Delete.SQL.Clear;
    qry_Delete.SQL.Add('DELETE FROM PickD WHERE Tx_No = :Tx_No');
    qry_Delete.Parameters.ParamByName('TX_NO').Value := TxNo;
    qry_Delete.ExecSQL;
//----Delete Picking Slip
    qry_Delete.Close;
    qry_Delete.SQL.Clear;
    qry_Delete.SQL.Add('DELETE FROM Pick WHERE Tx_No = :Tx_No');
    qry_Delete.Parameters.ParamByName('TX_NO').Value := TxNo;
    qry_Delete.ExecSQL;
  finally
    Screen.Cursor := crDefault;
    qry_SQL.Close;
    Timer_RefreshPick.Enabled := True;
    btn_RefreshClick(Self);
  end;
end;

procedure Tfrm_Retrievals.pg_ReqClerkChange(Sender: TObject);
begin
  With DatModReq do
    begin
      If pg_ReqClerk.ActivePage = Tabsheet1 Then
        begin
          ViewPickEntries;
          qry_NotFiled.Close;
     //------
          nav_Pick.Enabled := true;
          nav_Pick.DataSource := dts_Pick;
          btn_Refresh.Enabled := True;
          btn_Cancel.Enabled := true;
        end
      else if pg_ReqClerk.ActivePage = Tabsheet2 Then
        begin
          qry_NotFiled.Close;
     //------
          nav_Pick.Enabled := false;
          btn_Refresh.Enabled := false;
          btn_Cancel.Enabled := false;
        end
      else if pg_ReqClerk.ActivePage = Tabsheet3 Then
        begin
          qry_NotFiled.Open;
     //------
          nav_Pick.Enabled := true;
          nav_Pick.DataSource := DatModReq.dts_NotFiled;
          btn_Refresh.Enabled := false;
          btn_Cancel.Enabled := false;
        end
      else if pg_ReqClerk.ActivePage = Tabsheet4 Then
        begin
          ViewPickEntriesNF;
          qry_NotFiled.Close;
     //------
          nav_Pick.Enabled := true;
          nav_Pick.DataSource := dts_Pick;
          btn_Refresh.Enabled := True;
          btn_Cancel.Enabled := true;
        end
      else if pg_ReqClerk.ActivePage = Tabsheet5 Then
        begin
          qry_NotFiled.Close;
     //------
          nav_Pick.Enabled := false;
          btn_Refresh.Enabled := false;
          btn_Cancel.Enabled := false;
       end;
    end;
end;

procedure Tfrm_Retrievals.btn_FindPickClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    DatModReq.qry_Pick.Close;
    DatModReq.qry_Pick.SQL.Clear;
    DatModReq.qry_Pick.SQL.Add('EXEC [ap_ListRetrievals]');
    DatModReq.qry_Pick.SQL.Add('    :FromDate,');
    DatModReq.qry_Pick.SQL.Add('    :ToDate,');
    DatModReq.qry_Pick.SQL.Add('    :Branch,');
    DatModReq.qry_Pick.SQL.Add('    :Department,');
    DatModReq.qry_Pick.SQL.Add('    :Status,');
    DatModReq.qry_Pick.SQL.Add('    :UserId,');
    DatModReq.qry_Pick.SQL.Add('    :Tx_No,');
    DatModReq.qry_Pick.SQL.Add('    0');
    DatModReq.qry_Pick.Parameters.ParamByName('FromDate').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('ToDate').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('UserId').Value := User;
    DatModReq.qry_Pick.Parameters.ParamByName('Branch').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('Department').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('Status').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('Tx_No').Value := StrtoInt(edt_FindPick.Text);

    DatModReq.ShowOnlyUnmatched := False;
    If cb_Stat.ItemIndex = 0 Then
      DatModReq.qry_Pick.Parameters.ParamByName('Status').Value := 0
    else if cb_Stat.ItemIndex = 1 Then
      DatModReq.qry_Pick.Parameters.ParamByName('Status').Value := 2;
    DatModReq.qry_Pick.Open;

    DatModReq.qry_Pick.AfterScroll := nil;
    frm_Console.AutoSizeExistingColumns(grid_Pick);
    DatModReq.qry_Pick.AfterScroll := DatModReq.qry_PickAfterScroll;
    LastPickListNo := DatModReq.qry_Pick.FieldbyName('Tx_No').asInteger;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Retrievals.btn_FindPickNFClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    DatModReq.qry_Pick.Close;
    DatModReq.qry_Pick.SQL.Clear;
    DatModReq.qry_Pick.SQL.Add('EXEC [ap_ListRetrievals]');
    DatModReq.qry_Pick.SQL.Add('    :FromDate,');
    DatModReq.qry_Pick.SQL.Add('    :ToDate,');
    DatModReq.qry_Pick.SQL.Add('    :Branch,');
    DatModReq.qry_Pick.SQL.Add('    :Department,');
    DatModReq.qry_Pick.SQL.Add('    :Status,');
    DatModReq.qry_Pick.SQL.Add('    :UserId,');
    DatModReq.qry_Pick.SQL.Add('    :Tx_No,');
    DatModReq.qry_Pick.SQL.Add('    0');
    DatModReq.qry_Pick.Parameters.ParamByName('FromDate').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('ToDate').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('UserId').Value := User;
    DatModReq.qry_Pick.Parameters.ParamByName('Branch').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('Department').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('Status').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('Tx_No').Value := StrtoInt(edt_FindPickNF.Text);

    DatModReq.ShowOnlyUnmatched := True;
    DatModReq.qry_Pick.Parameters.ParamByName('Status').Value := 1;
    DatModReq.qry_Pick.Open;

    DatModReq.qry_Pick.AfterScroll := nil;
    frm_Console.AutoSizeExistingColumns(grid_Pick);
    DatModReq.qry_Pick.AfterScroll := DatModReq.qry_PickAfterScroll;
    LastPickListNo := DatModReq.qry_Pick.FieldbyName('Tx_No').asInteger;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Retrievals.btn_FlagasNotFoundClick(Sender: TObject);
Var
  Barcode    :String;
begin
  With DatModReq Do
    begin
        If qry_Pickd.IsEmpty Then
          begin
            Messagedlg('Nothing to FLAG as NOT FOUND!', mtInformation, [mbOK], 0);
            exit;
          end;
        If qry_Pickd.FieldbyName('Matched').AsInteger <> 0 Then
          begin
            Messagedlg('This entry has already been Matched or Flagged as not found!', mtInformation, [mbOK], 0);
            exit;
          end;

        If (UpperCase(Trim(qry_Pickd.FieldByName('TrType').AsString)) = 'CON') Then
          begin
            Barcode := trim(qry_Pickd.FieldByName('Container').asString);
            If Messagedlg('Are you sure you want to Flag the Container '+Barcode+' as NOT FOUND?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
              exit;
            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('UPDATE Containers SET IssueStatus = ''NF'', Warehouse = NULL, LocNo = NULL, RecordNo = NULL, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE() WHERE Container = :Container');
            qry_SQL.Parameters.ParamByName('Container').Value := Barcode;
            qry_SQL.ExecSQL;

            qry_PickD.Edit;
            qry_PickD['Matched'] := 3;
            qry_PickD.Post;
          end;
        If (UpperCase(Trim(qry_Pickd.FieldByName('TrType').AsString)) = 'RECORD')Then
          begin
            Barcode := trim(qry_Pickd.FieldByName('Barcode').asString);
            If Messagedlg('Are you sure you want to Flag the File '+Barcode+' as NOT FOUND?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
              exit;

            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('UPDATE Files SET IssueStatus = ''NF'', Warehouse = NULL, LocNo = NULL, RecordNo = NULL, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE() WHERE Filenumber = :Filenumber');
            qry_SQL.Parameters.ParamByName('Filenumber').Value := Barcode;
            qry_SQL.ExecSQL;

            qry_PickD.Edit;
            qry_PickD['Matched'] := 3;
            qry_PickD.Post;
          end;
        If (UpperCase(Trim(qry_Pickd.FieldByName('TrType').AsString)) = 'ITEM')Then
          begin
            Barcode := trim(qry_Pickd.FieldByName('ItemNumber').asString);
            If Messagedlg('Are you sure you want to Flag the Item '+Barcode+' as NOT FOUND?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
              exit;

            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('UPDATE Items SET Status = ''NF'', Warehouse = NULL, LocNo = NULL, RecordNo = NULL, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE() WHERE Itemnumber = :Itemnumber');
            qry_SQL.Parameters.ParamByName('Itemnumber').Value := Barcode;
            qry_SQL.ExecSQL;

            qry_PickD.Edit;
            qry_PickD['Matched'] := 3;
            qry_PickD.Post;
          end;
    end;
end;

procedure Tfrm_Retrievals.edt_FindPickKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Ord(Key) = 13 Then
   btn_FindPickClick(self);
end;

procedure Tfrm_Retrievals.edt_FindPickNFKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Ord(Key) = 13 Then
   btn_FindPickNFClick(Self);
end;

procedure Tfrm_Retrievals.edt_BranchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_Dept.Text := '';
      lbl_Dept.Caption := 'ALL';
      edt_Branch.Text := '';
      lbl_Branch.Caption := 'ALL';
    end;
  abort;
end;

procedure Tfrm_Retrievals.edt_BranchNFChange(Sender: TObject);
begin
  ViewPickEntriesNF;
end;

procedure Tfrm_Retrievals.edt_BranchNFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_DeptNF.Text := '';
      lbl_DeptNF.Caption := 'ALL';
      edt_BranchNF.Text := '';
      lbl_BranchNF.Caption := 'ALL';
    end;
  abort;
end;

procedure Tfrm_Retrievals.edt_BranchChange(Sender: TObject);
begin
  ViewPickEntries;
end;

procedure Tfrm_Retrievals.ViewPickEntries;
begin
  Screen.Cursor := crHourglass;
  try
    DatModReq.qry_Pick.Close;
    DatModReq.qry_Pick.SQL.Clear;
    DatModReq.qry_Pick.SQL.Add('EXEC [ap_ListRetrievals]');
    DatModReq.qry_Pick.SQL.Add('    :FromDate,');
    DatModReq.qry_Pick.SQL.Add('    :ToDate,');
    DatModReq.qry_Pick.SQL.Add('    :Branch,');
    DatModReq.qry_Pick.SQL.Add('    :Department,');
    DatModReq.qry_Pick.SQL.Add('    :Status,');
    DatModReq.qry_Pick.SQL.Add('    :UserId,');
    DatModReq.qry_Pick.SQL.Add('    0,');
    DatModReq.qry_Pick.SQL.Add('    0');
    DatModReq.qry_Pick.Parameters.ParamByName('FromDate').Value := StartofTheDay(date_From.DateTime);
    DatModReq.qry_Pick.Parameters.ParamByName('ToDate').Value := EndofTheDay(date_To.DateTime)+EncodeTime(23,59,59,00);
    DatModReq.qry_Pick.Parameters.ParamByName('UserId').Value := User;
    DatModReq.qry_Pick.Parameters.ParamByName('Branch').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('Department').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('Status').Value := NULL;

    If length(edt_Branch.Text) > 0 Then
      DatModReq.qry_Pick.Parameters.ParamByName('Branch').Value := edt_Branch.Text;
    If length(edt_Dept.Text) > 0 Then
      DatModReq.qry_Pick.Parameters.ParamByName('Department').Value := edt_Dept.Text;

    DatModReq.ShowOnlyUnmatched := False;
    If cb_Stat.ItemIndex = 0 Then
      DatModReq.qry_Pick.Parameters.ParamByName('Status').Value := 0
    else if cb_Stat.ItemIndex = 1 Then
      DatModReq.qry_Pick.Parameters.ParamByName('Status').Value := 2;

    DatModReq.qry_Pick.Open;
    DatModReq.qry_Pick.AfterScroll := nil;
    frm_Console.AutoSizeExistingColumns(grid_Pick);
    DatModReq.qry_Pick.AfterScroll := DatModReq.qry_PickAfterScroll;
    LastPickListNo := DatModReq.qry_Pick.FieldbyName('Tx_No').asInteger;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Retrievals.ViewPickEntriesNF;
begin
  Screen.Cursor := crHourglass;
  try
//-----------------------------Build the Requester------------------------------
  {  qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT DISTINCT');
    qry_SQL.SQL.Add('   h.Requester');
    qry_SQL.SQL.Add('FROM');
    qry_SQL.SQL.Add('   Pick h');
    qry_SQL.SQL.Add('   INNER JOIN Pickd d ON h.Tx_No = d.Tx_No');
    qry_SQL.SQL.Add('   INNER JOIN Branches b ON h.Branch = b.Branch');
    qry_SQL.SQL.Add('   INNER JOIN Departments dp ON h.Branch = dp.Branch AND h.Department = dp.Department');
    qry_SQL.SQL.Add('WHERE');
    qry_SQL.SQL.Add('   b.Status <> 1 AND dp.Status <> 1');
    qry_SQL.SQL.Add('	  AND(');
    qry_SQL.SQL.Add('	  		h.Printed = 1');
    qry_SQL.SQL.Add('	  		AND h.DeliveryNotePrinted = 1');
    qry_SQL.SQL.Add('	  		AND h.Tx_No IN (SELECT Tx_No FROM PickD WHERE Matched = 0)');
    qry_SQL.SQL.Add('	  		)');
    If length(edt_Branch.Text) > 0 Then
      begin
        qry_SQL.SQL.Add('   AND h.Branch = :Branch');
        qry_SQL.Parameters.ParamByName('Branch').Value := edt_BranchNF.Text;
      end;
    If length(edt_Dept.Text) > 0 Then
      begin
        qry_SQL.SQL.Add('   AND h.Department = :Department');
        qry_SQL.Parameters.ParamByName('Department').Value := edt_DeptNF.Text;
      end;
    qry_SQL.SQL.Add('ORDER BY');
    qry_SQL.SQL.Add('   h.REquester');
    qry_SQL.Open;
    qry_SQL.First;
    While not qry_SQL.EOF Do
      begin

        qry_SQL.Next;
      end;


     }
//-----------------------------Build the Requester------------------------------
    DatModReq.qry_Pick.Close;
    DatModReq.qry_Pick.SQL.Clear;
    DatModReq.qry_Pick.SQL.Add('EXEC [ap_ListRetrievals]');
    DatModReq.qry_Pick.SQL.Add('    :FromDate,');
    DatModReq.qry_Pick.SQL.Add('    :ToDate,');
    DatModReq.qry_Pick.SQL.Add('    :Branch,');
    DatModReq.qry_Pick.SQL.Add('    :Department,');
    DatModReq.qry_Pick.SQL.Add('    :Status,');
    DatModReq.qry_Pick.SQL.Add('    :UserId,');
    DatModReq.qry_Pick.SQL.Add('    0,');
    DatModReq.qry_Pick.SQL.Add('    0');
    DatModReq.qry_Pick.Parameters.ParamByName('FromDate').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('ToDate').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('UserId').Value := User;
    DatModReq.qry_Pick.Parameters.ParamByName('Branch').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('Department').Value := NULL;
    DatModReq.qry_Pick.Parameters.ParamByName('Status').Value := 1;
    DatModReq.ShowOnlyUnmatched := True;

    If length(edt_Branch.Text) > 0 Then
      DatModReq.qry_Pick.Parameters.ParamByName('Branch').Value := edt_BranchNF.Text;
    If length(edt_Dept.Text) > 0 Then
      DatModReq.qry_Pick.Parameters.ParamByName('Department').Value := edt_DeptNF.Text;

    DatModReq.qry_Pick.Open;
    DatModReq.qry_Pick.AfterScroll := nil;
    frm_Console.AutoSizeExistingColumns(grid_PickNF);
    DatModReq.qry_Pick.AfterScroll := DatModReq.qry_PickAfterScroll;
    LastPickListNo := DatModReq.qry_Pick.FieldbyName('Tx_No').asInteger;
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure Tfrm_Retrievals.edt_DeptChange(Sender: TObject);
begin
  ViewPickEntries;
end;

procedure Tfrm_Retrievals.edt_DeptKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_Dept.Text := '';
      lbl_Dept.Caption := 'ALL';
    end;
  abort;
end;

procedure Tfrm_Retrievals.edt_DeptNFChange(Sender: TObject);
begin
  ViewPickEntriesNF;
end;

procedure Tfrm_Retrievals.edt_DeptNFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 8 Then
    begin
      edt_DeptNF.Text := '';
      lbl_DeptNF.Caption := 'ALL';
    end;
  Abort;
end;

procedure Tfrm_Retrievals.btn_SelBranchClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_Branch.Text := trim(frm_SelBranch.qry_Branch.FieldbyName('Branch').asString);
      lbl_Branch.Caption := trim(frm_SelBranch.qry_Branch.FieldbyName('Name').asString);
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Tfrm_Retrievals.btn_SelDeptClick(Sender: TObject);
begin
  If length(edt_Branch.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_Branch.Text, User) = mrOK Then
    begin
      edt_Dept.Text := trim(frm_SelDept.qry_Dept.FieldbyName('Department').asString);
      lbl_Dept.Caption := trim(frm_SelDept.qry_Dept.FieldbyName('Name').asString);
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_Retrievals.btn_RefreshClick(Sender: TObject);
Var
  PickKey    :Integer;
begin
  Screen.Cursor := crHourglass;
  Timer_RefreshPick.Enabled := False;
  try
    PickKey := DatModReq.qry_Pick.FieldbyName('Tx_No').asInteger;
    DatModReq.qry_Pick.Close;
    DatModReq.qry_Pick.Open;
    LastPickListNo := DatModReq.qry_Pick.FieldbyName('Tx_No').asInteger;
    DatModReq.qry_Pick.Locate('Tx_No', PickKey, []);
  finally
    Timer_RefreshPick.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Retrievals.btn_SearchContainerClick(Sender: TObject);
Var
  Container    :String;
  PickListNo   :Integer;
begin
  if InputQuery('Enter Container No. to find', 'Container :', Container) then
    begin
      try
        frm_SelPickDet.qry_Search.Close;
        frm_SelPickDet.qry_Search.SQL.Clear;
        frm_SelPickDet.qry_Search.SQL.Add('SELECT a.Tx_No, b.Container, b.Barcode, b.ItemNumber, a.Requester, a.TxDate, a.TypeDesc, a.Branch, a.Department, a.Status');
        frm_SelPickDet.qry_Search.SQL.Add('FROM PICK a,  PICKd b');
        frm_SelPickDet.qry_Search.SQL.Add('WHERE a.Tx_No = b.Tx_No');
        frm_SelPickDet.qry_Search.SQL.Add('AND b.Container = :CN');
        frm_SelPickDet.qry_Search.SQL.Add('ORDER BY a.Tx_No DESC');
        frm_SelPickDet.qry_Search.Parameters.ParamByName('CN').Value := Container;
        frm_SelPickDet.qry_Search.Open;
        If frm_SelPickDet.qry_Search.IsEmpty Then
          begin
            Messagedlg('No Results found!!', mtInformation, [mbOK], 0);
            exit;
          end;
        If frm_SelPickDet.ShowModal = mrOK Then
          begin
            PickListNo := frm_SelPickDet.qry_Search.FieldbyName('Tx_No').asInteger;
            DatModReq.qry_Pick.Close;
            DatModReq.qry_Pick.Open;
            If not DatModReq.qry_Pick.Locate('Tx_No', PickListNo, []) Then
              begin
                Messagedlg('Picking Slip not found!!', mtInformation, [mbOK], 0);
                exit;
              end;
          end;
      finally
        frm_SelPickDet.qry_Search.Close;
      end;
    end;
end;

procedure Tfrm_Retrievals.BitBtn1Click(Sender: TObject);
Var
  RecordNo    :String;
  PickListNo   :Integer;
begin
  if InputQuery('Enter File Barcode to find', 'Barcode :', RecordNo) then
    begin
      try
        frm_SelPickDet.qry_Search.Close;
        frm_SelPickDet.qry_Search.SQL.Clear;
        frm_SelPickDet.qry_Search.SQL.Add('SELECT a.Tx_No, b.Container, b.Barcode, b.ItemNumber, a.Requester, a.TxDate, a.TypeDesc, a.Branch, a.Department, a.Status');
        frm_SelPickDet.qry_Search.SQL.Add('FROM PICK a,  PICKd b');
        frm_SelPickDet.qry_Search.SQL.Add('WHERE a.Tx_No = b.Tx_No');
        frm_SelPickDet.qry_Search.SQL.Add('AND b.Barcode = :RN');
        frm_SelPickDet.qry_Search.SQL.Add('ORDER BY a.Tx_No DESC');
        frm_SelPickDet.qry_Search.Parameters.ParamByName('RN').Value := RecordNo;
        frm_SelPickDet.qry_Search.Open;
        If frm_SelPickDet.qry_Search.IsEmpty Then
          begin
            Messagedlg('No Results found!!', mtInformation, [mbOK], 0);
            exit;
          end;
        If frm_SelPickDet.ShowModal = mrOK Then
          begin
            PickListNo := frm_SelPickDet.qry_Search.FieldbyName('Tx_No').asInteger;
            DatModReq.qry_Pick.Close;
            DatModReq.qry_Pick.Open;
            If not DatModReq.qry_Pick.Locate('Tx_No', PickListNo, []) Then
              begin
                Messagedlg('Picking Slip not found!!', mtInformation, [mbOK], 0);
                exit;
              end;
          end;
      finally
        frm_SelPickDet.qry_Search.Close;
      end;
    end;
end;

procedure Tfrm_Retrievals.BitBtn2Click(Sender: TObject);
Var
  ItemNo    :String;
  PickListNo   :Integer;
begin
  if InputQuery('Enter Item Barcode to find', 'Barcode :', ItemNo) then
    begin
      try
        frm_SelPickDet.qry_Search.Close;
        frm_SelPickDet.qry_Search.SQL.Clear;
        frm_SelPickDet.qry_Search.SQL.Add('SELECT a.Tx_No, b.Container, b.Barcode, b.ItemNumber, a.Requester, a.TxDate, a.TypeDesc, a.Branch, a.Department, a.Status');
        frm_SelPickDet.qry_Search.SQL.Add('FROM PICK a,  PICKd b');
        frm_SelPickDet.qry_Search.SQL.Add('WHERE a.Tx_No = b.Tx_No');
        frm_SelPickDet.qry_Search.SQL.Add('AND b.Itemnumber = :IN');
        frm_SelPickDet.qry_Search.SQL.Add('ORDER BY a.Tx_No DESC');
        frm_SelPickDet.qry_Search.Parameters.ParamByName('IN').Value := ItemNo;
        frm_SelPickDet.qry_Search.Open;
        If frm_SelPickDet.qry_Search.IsEmpty Then
          begin
            Messagedlg('No Results found!!', mtInformation, [mbOK], 0);
            exit;
          end;
        If frm_SelPickDet.ShowModal = mrOK Then
          begin
            PickListNo := frm_SelPickDet.qry_Search.FieldbyName('Tx_No').asInteger;
            DatModReq.qry_Pick.Close;
            DatModReq.qry_Pick.Open;
            If not DatModReq.qry_Pick.Locate('Tx_No', PickListNo, []) Then
              begin
                Messagedlg('Picking Slip not found!!', mtInformation, [mbOK], 0);
                exit;
              end;
          end;
      finally
        frm_SelPickDet.qry_Search.Close;
      end;
    end;
end;

procedure Tfrm_Retrievals.Timer_RefreshPickTimer(Sender: TObject);
Var
  Present: TDateTime;
  Hour, NowMin, ActMin, Sec, MSec: Word;
  PickKey    :Integer;
begin
  exit;
  Cursor := crHourglass;
  btn_Refresh.Enabled := false;
  Timer_RefreshPick.Enabled := False;
  Present:= Now;
  DecodeTime(Present, Hour, NowMin, Sec, MSec);
  DecodeTime(ActTime, Hour, ActMin, Sec, MSec);
  try
        PickKey := DatModReq.qry_Pick.FieldbyName('Tx_No').asInteger;
        DatModReq.qry_Pick.DisableControls;
        DatModReq.qry_Pick.Last;
        LastPickListNo := DatModReq.qry_Pick.FieldbyName('Tx_No').asInteger;
        DatModReq.qry_Pick.Close;
        DatModReq.qry_Pick.Open;
        If DatModReq.qry_Pick.FieldbyName('Tx_No').asInteger > LastPickListNo Then
          begin
            DatModReq.qry_Pick.Locate('Tx_No', PickKey, []);
            SysUtils.Beep;
            lbl_NewPicks.Visible := true;
          end
        else
          DatModReq.qry_Pick.Locate('Tx_No', PickKey, []);
      finally
        Timer_RefreshPick.Enabled := True;
        DatModReq.qry_Pick.EnableControls;
        btn_Refresh.Enabled := True;
        Cursor := crDefault;
      end;
end;

procedure Tfrm_Retrievals.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If chk_PrItemsDelNote.Checked Then
    begin
      If (trim(DatModReq.qry_Pickd.FieldByName('BARCODE').asString) <> '')and(trim(qry_PrPickd.FieldByName('ITEMNUMBER').asString) = '') Then
        begin
          qry_Items.Close;
          qry_Items.SQL.clear;
          qry_Items.SQL.Add('SELECT * FROM Items WHERE Filenumber = '+QuotedStr(trim(qry_PrPickd.FieldByName('BARCODE').asString)));
          qry_Items.Open;
        end
      else qry_Items.Close;
    end
  else qry_Items.Close;
end;

procedure Tfrm_Retrievals.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qry_UpdPrTextFields.Close;
  qry_UpdPrTextFields.SQL.Text := 'SELECT COUNT(*) FROM PickD WHERE Tx_No = :Tx';
  qry_UpdPrTextFields.Parameters.ParamValues['Tx'] := qry_PrintPickList.FieldByName('Tx_No').AsInteger;
  qry_UpdPrTextFields.Open;
  lbl_PickSlipTot.Caption := qry_UpdPrTextFields.Fields[0].AsString;
  qry_UpdPrTextFields.Close;
end;

procedure Tfrm_Retrievals.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If (qry_PrintPickList.FieldByName('TotItems').asInteger <> 0) Then
    begin
      qry_Items.Close;
      qry_Items.SQL.clear;
      qry_Items.SQL.Add('SELECT * FROM Items');
      qry_Items.SQL.Add('WHERE Filenumber = '+QuotedStr(trim(qry_PrintPickList.FieldByName('BARCODE').asString)));
      qry_Items.SQL.Add('AND Status IN (''P'',''L'', ''IU'')');
      qry_Items.Open;
    end
  else qry_Items.Close;
end;

procedure Tfrm_Retrievals.date_FromChange(Sender: TObject);
begin
  ViewPickEntries;
end;

procedure Tfrm_Retrievals.date_ToChange(Sender: TObject);
begin
  ViewPickEntries;
end;

procedure Tfrm_Retrievals.cb_FilerRequesterNFChange(Sender: TObject);
begin
  ViewPickEntriesNF;
end;

procedure Tfrm_Retrievals.cb_StatChange(Sender: TObject);
begin
  If cb_Stat.ItemIndex = 0 Then
    begin
      lbl_DateRange.Visible := False;
      date_From.Visible := False;
      lbl_DateTo.Visible := False;
      date_To.Visible := False;
    end
  else If cb_Stat.ItemIndex = 1 Then
    begin
      lbl_DateRange.Visible := True;
      date_From.Visible := True;
      lbl_DateTo.Visible := True;
      date_To.Visible := True;
    end
  else
    begin
      lbl_DateRange.Visible := True;
      date_From.Visible := True;
      lbl_DateTo.Visible := True;
      date_To.Visible := True;
    end;
  ViewPickEntries;
end;

procedure Tfrm_Retrievals.btn_MAddListClick(Sender: TObject);
var
  fbcode                  :String;
  ibcode                  :String;
  tbcode                  :String;
  i                       :Integer;
begin
  With DatModReq do
    begin
      fbcode := trim(editMFileNo.Text);
      ibcode := trim(editMItemNo.Text);
//-------
      If (fbcode = '')or(ibcode = '') Then
        begin
          MessageDlg('Filenumber and Itemnumber must be completed!', mtWarning, [mbOK], 0);
          exit;
        end;
//========Determine Type i.e. INUSE don't need a Picking Slip===================
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT * FROM Items WHERE Itemnumber = '+QuotedStr(ibCode));
      qry_SQL.Open;
      If (trim(qry_SQL.FieldbyName('STATUS').asString) = 'IU')OR
         (trim(qry_SQL.FieldbyName('STATUS').asString) = 'IUI')Then
        begin
//------Validate the Filenumber------------
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT * FROM files WHERE Filenumber = '+QuotedStr(fbCode));
          qry_SQL.Open;
          If qry_SQL.IsEmpty Then
            begin
              qry_SQL.Close;
              MessageDlg('Filenumber not found!!', mtWarning, [mbOK], 0);
              exit;
            end;
          If (trim(qry_SQL.FieldbyName('ISSUESTATUS').asString) <> 'INUSE')AND
             (trim(qry_SQL.FieldbyName('ISSUESTATUS').asString) <> 'INUSEI')Then
            begin
              qry_SQL.Close;
              MessageDlg('This Item has a status of In-Use. The File does not have a Status of In-Use!!', mtWarning, [mbOK], 0);
              exit;
            end;

          For i := 0 to lb_MatchItems.Items.Count-1 Do
            begin
              tbcode := copy(lb_MatchItems.Items.Strings[i], pos('--->', lb_MatchItems.Items.Strings[i])+4, length(lb_MatchItems.Items.Strings[i]));
              If pos(ibcode, tbcode) > 0 Then
                begin
                  qry_SQL.Close;
                  MessageDlg('ItemNumber already added!!', mtWarning, [mbOK], 0);
                  exit;
                end;
            end;
          lb_MatchItems.Items.Add(editMFileNo.Text + '--->' + editMItemNo.Text);
          editMFileNo.Text := '';
          editMItemNo.Text := '';
          editMFileNo.SetFocus;
        end
      else
        begin
//------Validate the Filenumber------------
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT * FROM files WHERE Filenumber = '+QuotedStr(fbCode));
          qry_SQL.Open;
          If qry_SQL.IsEmpty Then
            begin
              qry_SQL.Close;
              MessageDlg('Filenumber not found!!', mtWarning, [mbOK], 0);
              exit;
            end;
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT * FROM Pick p, Pickd d');
          qry_SQL.SQL.Add('WHERE p.TX_NO = d.TX_NO');
          qry_SQL.SQL.Add('AND p.Type = ''IM''');
          qry_SQL.SQL.Add('AND d.Barcode = '+QuotedStr(fbCode));
          qry_SQL.SQL.Add('AND d.TrType = ''RECORD''');
          qry_SQL.SQL.Add('ORDER BY p.TX_NO DESC');
          qry_SQL.Open;
          If qry_SQL.IsEmpty Then
            begin
              qry_SQL.Close;
              MessageDlg('No Picking List Exists for this File!!', mtWarning, [mbOK], 0);
              exit;
            end;
          If qry_SQL.FieldbyName('Matched').AsInteger = 1 Then
            begin
              qry_SQL.Close;
              MessageDlg('File Barcode has allready been matched!!', mtWarning, [mbOK], 0);
              exit;
            end;
          If qry_SQL.FieldbyName('Printed').AsBoolean = False Then
            begin
              qry_SQL.Close;
              MessageDlg('Please first print the picking list!!', mtWarning, [mbOK], 0);
              exit;
            end;
          qry_SQL.Close;
//------Validate the Itemnumber------------
          For i := 0 to lb_MatchItems.Items.Count-1 Do
            begin
              tbcode := copy(lb_MatchItems.Items.Strings[i], pos('--->', lb_MatchItems.Items.Strings[i])+4, length(lb_MatchItems.Items.Strings[i]));
              If pos(ibcode, tbcode) > 0 Then
                begin
                  qry_SQL.Close;
                  MessageDlg('ItemNumber already added!!', mtWarning, [mbOK], 0);
                  exit;
                end;
            end;

          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT * FROM Items WHERE Itemnumber = '+QuotedStr(ibCode));
          qry_SQL.Open;
          If qry_SQL.IsEmpty Then
            begin
              qry_SQL.Close;
              MessageDlg('ItemNumber not found!!', mtWarning, [mbOK], 0);
              exit;
            end;
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT * FROM Pick p, Pickd d');
          qry_SQL.SQL.Add('WHERE p.TX_NO = d.TX_NO');
          qry_SQL.SQL.Add('AND p.Type = ''IM''');
          qry_SQL.SQL.Add('AND d.Itemnumber = '+QuotedStr(ibCode));
          qry_SQL.SQL.Add('AND d.Barcode = '+QuotedStr(fbCode));
          qry_SQL.SQL.Add('AND d.TrType = ''ITEM''');
          qry_SQL.SQL.Add('ORDER BY p.TX_NO DESC');
          qry_SQL.Open;
          If qry_SQL.IsEmpty Then
            begin
              qry_SQL.Close;
              MessageDlg('No Picking List Exists for this Itemnumber!!', mtWarning, [mbOK], 0);
              exit;
            end;
          If qry_SQL.FieldbyName('Matched').AsInteger = 1 Then
            begin
              qry_SQL.Close;
              MessageDlg('ItemNumber has allready been matched!!', mtWarning, [mbOK], 0);
              exit;
            end;
//----------------
          qry_SQL.Close;
          lb_MatchItems.Items.Add(editMFileNo.Text + '--->' + editMItemNo.Text);
          editMFileNo.Text := '';
          editMItemNo.Text := '';
          editMFileNo.SetFocus;
        end;
    end;
end;

procedure Tfrm_Retrievals.btn_MClearItemsClick(Sender: TObject);
begin
if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
   lb_MatchItems.Clear;
end;

procedure Tfrm_Retrievals.btn_MatchItemsClick(Sender: TObject);
var
  fbcode                  :String;
  ibcode                  :String;
  i, ItemNo               :Integer;
  mTxNo            :Integer;
  mloc                    :String;
  mware                   :String;
  FileList                :TStringList;
begin
  With DatModReq do
    begin
      If lb_MatchItems.Items.Count = 0 Then
        begin
          MessageDlg('No List created', mtwARNING, [mbOK], 0);
          exit;
        end;
//----------------
      FileList := TStringList.Create;
      try
//---------------First Verify again---------------------------------------------
        for i := 0 to lb_MatchItems.Items.Count-1 do
          begin
            fbcode := copy(lb_MatchItems.Items.Strings[i], 1, pos('--->', lb_MatchItems.Items.Strings[i])-1);
            ibcode := copy(lb_MatchItems.Items.Strings[i], pos('--->', lb_MatchItems.Items.Strings[i])+4, length(lb_MatchItems.Items.Strings[i]));

            If (fbcode = '')or(ibcode = '') Then
              begin
                MessageDlg('Filenumber and Itemnumber must be completed!', mtWarning, [mbOK], 0);
                exit;
              end;
//------Validate the Filenumber----------
            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('SELECT * FROM files WHERE Filenumber = '+QuotedStr(fbCode));
            qry_SQL.Open;
            If qry_SQL.IsEmpty Then
              begin
                qry_SQL.Close;
                MessageDlg('Filenumber not found!!', mtWarning, [mbOK], 0);
                exit;
              end;
//------Validate the Itemnumber------------
            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('SELECT * FROM Items WHERE Itemnumber = '+QuotedStr(ibCode));
            qry_SQL.Open;
            If qry_SQL.IsEmpty Then
              begin
                qry_SQL.Close;
                MessageDlg('ItemNumber not found!!', mtWarning, [mbOK], 0);
                exit;
              end;
//-------If not a INUSE Match verify the Picking Sklip details
            If (trim(qry_SQL.FieldbyName('STATUS').asString) <> 'IU')AND
               (trim(qry_SQL.FieldbyName('STATUS').asString) <> 'IUI')Then
              begin
                qry_SQL.Close;
                qry_SQL.SQL.Clear;
                qry_SQL.SQL.Add('SELECT * FROM Pick p, Pickd d');
                qry_SQL.SQL.Add('WHERE p.TX_NO = d.TX_NO');
                qry_SQL.SQL.Add('AND p.Type = ''IM''');
                qry_SQL.SQL.Add('AND d.Itemnumber = '+QuotedStr(ibCode));
                qry_SQL.SQL.Add('ORDER BY p.TX_NO DESC');
                qry_SQL.Open;
                If qry_SQL.IsEmpty Then
                  begin
                    qry_SQL.Close;
                    MessageDlg('No Picking List Exists for this Itemnumber!!', mtWarning, [mbOK], 0);
                    exit;
                  end;
                If qry_SQL.FieldbyName('Matched').AsInteger = 1 Then
                  begin
                    qry_SQL.Close;
                    MessageDlg('ItemNumber has allready been matched!!', mtWarning, [mbOK], 0);
                    exit;
                  end;
              end;
          end;
//-----------------Match Items------------------------------------------------
        FileList.Clear;
        For i := 0 to lb_MatchItems.Items.Count-1 Do
          begin
            fbcode := copy(lb_MatchItems.Items.Strings[i], 1, pos('--->', lb_MatchItems.Items.Strings[i])-1);
            ibcode := copy(lb_MatchItems.Items.Strings[i], pos('--->', lb_MatchItems.Items.Strings[i])+4, length(lb_MatchItems.Items.Strings[i]));

            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('SELECT * FROM Items WHERE Itemnumber = '+QuotedStr(ibCode));
            qry_SQL.Open;
            If (trim(qry_SQL.FieldbyName('STATUS').asString) = 'IU')OR
               (trim(qry_SQL.FieldbyName('STATUS').asString) = 'IUI')Then
              begin
                qry_SQL.Close;
                qry_SQL.SQL.Clear;
                qry_SQL.SQL.Add('UPDATE Items SET Filenumber = '+QuotedStr(fbcode)+', Status = ''I'', Warehouse = NULL, LocNo = NULL, RecordNo = NULL, IssuedTo = NULL, IssuedOn = NULL, ReturnedOn = GETDATE(), IssuedUserID = NULL, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
                qry_SQL.SQL.Add('WHERE Itemnumber = '+QuotedStr(ibCode));
                qry_SQL.ExecSQL;
              end
            else
              begin
                mloc := trim(qry_SQL.FieldByName('locno').asString);
                mware := trim(qry_SQL.FieldByName('warehouse').asString);
             //---
                If FileList.IndexOf(fbcode) = -1 Then
                  FileList.Append(fbCode);
             //---
                qry_SQL.Close;
                qry_SQL.SQL.Clear;
                qry_SQL.SQL.Add('SELECT * FROM Pick p, Pickd d');
                qry_SQL.SQL.Add('WHERE p.TX_NO = d.TX_NO');
                qry_SQL.SQL.Add('AND p.Type = ''IM''');
                qry_SQL.SQL.Add('AND d.Itemnumber = '+QuotedStr(ibCode));
                qry_SQL.SQL.Add('ORDER BY p.TX_NO DESC');
                qry_SQL.Open;
                ItemNo := qry_SQL.FieldbyName('ItemNo').AsInteger;
             //-----
                qry_SQL.Close;
                qry_SQL.SQL.Clear;
                qry_SQL.SQL.Add('UPDATE Items SET Filenumber = '+QuotedStr(fbcode)+', Status = ''I'', Warehouse = NULL, LocNo = NULL, RecordNo = NULL, IssuedTo = NULL, IssuedOn = NULL, ReturnedOn = GETDATE(), IssuedUserID = NULL, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
                qry_SQL.SQL.Add('WHERE Itemnumber = '+QuotedStr(ibCode));
                qry_SQL.SQL.Add('UPDATE PickD SET Matched = 1');
                qry_SQL.SQL.Add('WHERE ItemNo = '+InttoStr(ItemNo));
                qry_SQL.ExecSQL;
             //---
              end;
          end;
//-----------------Match Record Numbers for non INUSE Entries-------------------
        for i := 0 to FileList.Count-1 do
          begin
            fbcode := FileList.Strings[i];

            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('SELECT MAX(Tx_No) AS "TX_NO" FROM pickd WHERE Matched = 0 AND TrType = ''RECORD'' AND Barcode = '+QuotedStr(fbCode));
            qry_SQL.Open;
            mTxNo := qry_SQL.FieldbyName('TX_NO').asInteger;

            qry_SQL.Close;
            qry_SQL.SQL.Clear;
            qry_SQL.SQL.Add('IF NOT EXISTS(SELECT * FROM PickD WHERE Tx_No = '+InttoStr(mTxNo)+' AND Matched = 0 AND TrType = ''ITEM'' AND Barcode = '+QuotedStr(fbcode)+')');
            qry_SQL.SQL.Add(' BEGIN');
            qry_SQL.SQL.Add('  UPDATE Files SET IssueStatus = ''RI'', Warehouse = NULL, LocNo = NULL, RecordNo = NULL,');
            qry_SQL.SQL.Add('  ReturnedOn = null,');
            qry_SQL.SQL.Add('  IssuedUserID = '+QuotedStr(user)+',');
            qry_SQL.SQL.Add('  IssuedTo = '+QuotedStr(trim(FirstName + ' ' + Surname))+',');
            qry_SQL.SQL.Add('  IssuedOn = GetDate(),');
            qry_SQL.SQL.Add('  ItTxNo = 0, UpdatedBy = '+QuotedStr(User)+',UpdatedOn = GETDATE()');
            qry_SQL.SQL.Add('  WHERE Filenumber = '+QuotedStr(fbcode));
            qry_SQL.SQL.Add('UPDATE PickD SET Matched = 1');
            qry_SQL.SQL.Add('WHERE Tx_No = '+InttoStr(mTxNo));
            qry_SQL.SQL.Add('AND Matched = 0 AND TrType = ''RECORD'' AND Barcode = '+QuotedStr(fbCode));
            qry_SQL.SQL.Add('UPDATE Pick SET DeliveryNotePrinted = 1');
            qry_SQL.SQL.Add('WHERE Tx_No = '+InttoStr(mTxNo));
            qry_SQL.SQL.Add('END');
            qry_SQL.ExecSQL;
          end;

        MessageDlg('Matched',mtInformation,[mbOK],0);
        lb_MatchItems.Clear;
    finally
      FileList.Free;
      qry_SQL.Close;
    end;
   end;    //With DatModReq do}
//=====================
end;

procedure Tfrm_Retrievals.BitBtn5Click(Sender: TObject);
begin
  With DatModReq do
    begin
      qry_Items.Close;
      qry_Items.SQL.Clear;
      qry_Items.SQL.Add('select FileNumber from items where ItemNumber = '+QuotedStr(editItemNo.Text));
      qry_Items.Open;
       if not qry_Items.isEmpty then
         editMFileNo.Text := trim(qry_Items.FieldByName('FileNumber').asString)
       else MessageDlg('Item Number not matched to a File number',mtInformation,[mbOK],0);
      qry_Items.Close;
    end;
end;



procedure Tfrm_Retrievals.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Retrievals.btn_DeptNFClick(Sender: TObject);
begin
  If length(edt_BranchNF.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_BranchNF.Text, User) = mrOK Then
    begin
      edt_DeptNF.Text := trim(frm_SelDept.qry_Dept.FieldbyName('Department').asString);
      lbl_DeptNF.Caption := trim(frm_SelDept.qry_Dept.FieldbyName('Name').asString);
    end;
  frm_SelDept.qry_Dept.Close;
end;

procedure Tfrm_Retrievals.editItemNoKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = 13 then
    begin
      btn_RAddListClick(Self);
      Abort;
    end;
end;

procedure Tfrm_Retrievals.editMItemNoKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = 13 then
    begin
      btn_MAddListClick(Self);
      Abort;
    end;
end;

procedure Tfrm_Retrievals.edt_BarcodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Ord(Key) = 13 Then
    begin
      btn_ProcessPickClick(btn_ProcessPick);
      Abort;
    end;
end;

function Tfrm_Retrievals.PrintDeliveryNote(Tx_No :Integer):Boolean;
Var
  DelNoteQty  : Integer;
begin
  Result := False;
  Screen.Cursor := crHourglass;
  try
//---------------------------------Header---------------------------------------
    qry_PrintDelNote.Close;
    qry_PrintDelNote.SQL.Clear;
    qry_PrintDelNote.SQL.Add('EXEC [ap_ListRetrievals]');
    qry_PrintDelNote.SQL.Add('    :FromDate,');
    qry_PrintDelNote.SQL.Add('    :ToDate,');
    qry_PrintDelNote.SQL.Add('    :Branch,');
    qry_PrintDelNote.SQL.Add('    :Department,');
    qry_PrintDelNote.SQL.Add('    :Status,');
    qry_PrintDelNote.SQL.Add('    :UserId,');
    qry_PrintDelNote.SQL.Add('    :Tx_No,');
    qry_PrintDelNote.SQL.Add('    0');
    qry_PrintDelNote.Parameters.ParamByName('FromDate').Value := NULL;
    qry_PrintDelNote.Parameters.ParamByName('ToDate').Value := NULL;
    qry_PrintDelNote.Parameters.ParamByName('UserId').Value := User;
    qry_PrintDelNote.Parameters.ParamByName('Branch').Value := NULL;
    qry_PrintDelNote.Parameters.ParamByName('Department').Value := NULL;
    qry_PrintDelNote.Parameters.ParamByName('Status').Value := NULL;
    qry_PrintDelNote.Parameters.ParamByName('Tx_No').Value := Tx_No;
    qry_PrintDelNote.Open;


    qry_UpdPrTextFields.Close;
    qry_UpdPrTextFields.SQL.Text := 'SELECT PrText1, PrText2, PrText3, PrText4 FROM Company WHERE CompanyCode = :CD';
    qry_UpdPrTextFields.Parameters.ParamByName('CD').Value := CompsCode;
    qry_UpdPrTextFields.Open;
    If trim(qry_UpdPrTextFields.FieldbyName('PrText1').asString) <> '' Then
      lbl_DelHInfo1.Caption := trim(qry_UpdPrTextFields.FieldbyName('PrText1').asString)
    else lbl_DelHInfo1.Caption := '';
    If trim(qry_UpdPrTextFields.FieldbyName('PrText2').asString) <> '' Then
      lbl_DelHInfo2.Caption := trim(qry_UpdPrTextFields.FieldbyName('PrText2').asString)
    else lbl_DelHInfo2.Caption := '';
    If trim(qry_UpdPrTextFields.FieldbyName('PrText3').asString) <> '' Then
      lbl_DelHInfo3.Caption := trim(qry_UpdPrTextFields.FieldbyName('PrText3').asString)
    else lbl_DelHInfo3.Caption := '';
    If trim(qry_UpdPrTextFields.FieldbyName('PrText4').asString) <> '' Then
      lbl_DelHInfo4.Caption := trim(qry_UpdPrTextFields.FieldbyName('PrText4').asString)
    else lbl_DelHInfo4.Caption := '';
//------------
    If (trim(qry_UpdPrTextFields.FieldbyName('PrText3').asString) = '')and(trim(qry_UpdPrTextFields.FieldbyName('PrText4').asString) = '') Then
      begin
        QRBand3.Size.Height := 0.198;
        QRBand4.Size.Height := 0.188;
        QRShape4.Size.Top := 0.177;
        lbl_DelInfo3.Enabled := False;
        lbl_DelInfo4.Enabled := False;
      end
    else
      begin
        QRBand3.Size.Height := 0.417;
        QRBand4.Size.Height := 0.385;
        QRShape4.Size.Top := 0.354;
        lbl_DelInfo3.Enabled := True;
        lbl_DelInfo4.Enabled := True;
      end;
    qry_UpdPrTextFields.Close;
    qry_UpdPrTextFields.SQL.Text := 'SELECT COUNT(*) FROM PickD WHERE Tx_No = :Tx';
    qry_UpdPrTextFields.Parameters.ParamValues['Tx'] := Tx_No;
    qry_UpdPrTextFields.Open;
    lbl_DeliveryNoteTot.Caption := qry_UpdPrTextFields.Fields[0].AsString;
    qry_UpdPrTextFields.Close;

    qry_PrPickd.Close;
    qry_PrPickd.SQL.Clear;
    qry_PrPickd.SQL.Add('DECLARE	@Info1 varchar(50),');
    qry_PrPickd.SQL.Add('		@Info2 varchar(50),');
    qry_PrPickd.SQL.Add('		@Info3 varchar(50),');
    qry_PrPickd.SQL.Add('		@Info4 varchar(50),');
    qry_PrPickd.SQL.Add('		@SQL nvarchar(4000)');
    qry_PrPickd.SQL.Add('');
    qry_PrPickd.SQL.Add('SELECT ');
    qry_PrPickd.SQL.Add('	@Info1 = RTRIM(ISNULL(PrText1, '''')), ');
    qry_PrPickd.SQL.Add('	@Info2 = RTRIM(ISNULL(PrText2, '''')), ');
    qry_PrPickd.SQL.Add('	@Info3 = RTRIM(ISNULL(PrText3, '''')), ');
    qry_PrPickd.SQL.Add('	@Info4 = RTRIM(ISNULL(PrText4, '''')) ');
    qry_PrPickd.SQL.Add('FROM ');
    qry_PrPickd.SQL.Add('	Company');
    qry_PrPickd.SQL.Add('');
    qry_PrPickd.SQL.Add('SELECT @SQL = N''');
    qry_PrPickd.SQL.Add('SELECT');
    qry_PrPickd.SQL.Add('	d.ItemNo,');
    qry_PrPickd.SQL.Add('	d.Tx_No,');
    qry_PrPickd.SQL.Add('	d.Barcode,');
    qry_PrPickd.SQL.Add('	d.Warehouse,');
    qry_PrPickd.SQL.Add('	d.Row,');
    qry_PrPickd.SQL.Add('	d.LevelNum,');
    qry_PrPickd.SQL.Add('	d.Bay,');
    qry_PrPickd.SQL.Add('	d.LocNo,');
    qry_PrPickd.SQL.Add('	d.RecordNo,');
    qry_PrPickd.SQL.Add('	d.ItemNumber,');
    qry_PrPickd.SQL.Add('	d.FilingMethod,');
    qry_PrPickd.SQL.Add('	d.TrType,');
    qry_PrPickd.SQL.Add('	p.DeliveryNotePrinted,');
    qry_PrPickd.SQL.Add('	d.Container,''');
    qry_PrPickd.SQL.Add('');
    qry_PrPickd.SQL.Add('IF @Info1 <> ''''');
    qry_PrPickd.SQL.Add('SELECT @SQL = @SQL + N''');
    qry_PrPickd.SQL.Add('	''''Info1'''' = ');
    qry_PrPickd.SQL.Add('      CASE ');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''CONTAINER'''' THEN (SELECT ''+@Info1+'' FROM Containers WHERE Container = d.Container)');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''RECORD'''' THEN (SELECT ''+@Info1+'' FROM Files WHERE Filenumber = d.Barcode)');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''ITEM'''' THEN (SELECT ''+@Info1+'' FROM Items WHERE Itemnumber = d.Itemnumber)');
    qry_PrPickd.SQL.Add('         ELSE NULL');
    qry_PrPickd.SQL.Add('      END,''');
    qry_PrPickd.SQL.Add('ELSE SELECT @SQL = @SQL + N''NULL AS ''''Info1'''',''');
    qry_PrPickd.SQL.Add('IF @Info2 <> ''''');
    qry_PrPickd.SQL.Add('SELECT @SQL = @SQL + N''');
    qry_PrPickd.SQL.Add('	''''Info2'''' = ');
    qry_PrPickd.SQL.Add('      CASE ');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''CONTAINER'''' THEN (SELECT ''+@Info2+'' FROM Containers WHERE Container = d.Container)');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''RECORD'''' THEN (SELECT ''+@Info2+'' FROM Files WHERE Filenumber = d.Barcode)');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''ITEM'''' THEN (SELECT ''+@Info2+'' FROM Items WHERE Itemnumber = d.Itemnumber)');
    qry_PrPickd.SQL.Add('         ELSE NULL');
    qry_PrPickd.SQL.Add('      END,''');
    qry_PrPickd.SQL.Add('ELSE SELECT @SQL = @SQL + N''NULL AS ''''Info2'''',''');
    qry_PrPickd.SQL.Add('IF @Info3 <> ''''');
    qry_PrPickd.SQL.Add('SELECT @SQL = @SQL + N''');
    qry_PrPickd.SQL.Add('	''''Info3'''' = ');
    qry_PrPickd.SQL.Add('      CASE ');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''CONTAINER'''' THEN (SELECT ''+@Info3+'' FROM Containers WHERE Container = d.Container)');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''RECORD'''' THEN (SELECT ''+@Info3+'' FROM Files WHERE Filenumber = d.Barcode)');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''ITEM'''' THEN (SELECT ''+@Info3+'' FROM Items WHERE Itemnumber = d.Itemnumber)');
    qry_PrPickd.SQL.Add('         ELSE NULL');
    qry_PrPickd.SQL.Add('      END,''');
    qry_PrPickd.SQL.Add('ELSE SELECT @SQL = @SQL + N''NULL AS ''''Info3'''',''');
    qry_PrPickd.SQL.Add('IF @Info4 <> ''''');
    qry_PrPickd.SQL.Add('SELECT @SQL = @SQL + N''');
    qry_PrPickd.SQL.Add('	''''Info4'''' = ');
    qry_PrPickd.SQL.Add('      CASE ');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''CONTAINER'''' THEN (SELECT ''+@Info4+'' FROM Containers WHERE Container = d.Container)');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''RECORD'''' THEN (SELECT ''+@Info4+'' FROM Files WHERE Filenumber = d.Barcode)');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''ITEM'''' THEN (SELECT ''+@Info4+'' FROM Items WHERE Itemnumber = d.Itemnumber)');
    qry_PrPickd.SQL.Add('         ELSE NULL');
    qry_PrPickd.SQL.Add('      END,''');
    qry_PrPickd.SQL.Add('ELSE SELECT @SQL = @SQL + N''NULL AS ''''Info4'''',''');
    qry_PrPickd.SQL.Add('');
    qry_PrPickd.SQL.Add('SELECT @SQL = @SQL + N''');
    qry_PrPickd.SQL.Add('	''''RecordType'''' = ');
    qry_PrPickd.SQL.Add('      CASE ');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''CONTAINER'''' THEN (SELECT FileType FROM Containers WHERE Container = d.Container)');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''RECORD'''' THEN (SELECT FileType FROM Files WHERE Filenumber = d.Barcode)');
    qry_PrPickd.SQL.Add('         WHEN d.TrType = ''''ITEM'''' THEN (SELECT FileType FROM Items WHERE Itemnumber = d.Itemnumber)');
    qry_PrPickd.SQL.Add('         ELSE NULL');
    qry_PrPickd.SQL.Add('      END,''');
    qry_PrPickd.SQL.Add('SELECT @SQL = @SQL + N''');
    qry_PrPickd.SQL.Add('	''''Matched'''' = ');
    qry_PrPickd.SQL.Add('      CASE ');
    qry_PrPickd.SQL.Add('         WHEN d.Matched = 0 THEN ''''Un-Matched''''');
    qry_PrPickd.SQL.Add('         WHEN d.Matched = 1 THEN ''''Found''''');
    qry_PrPickd.SQL.Add('         WHEN d.Matched = 2 THEN ''''Prev. Delivered''''');
    qry_PrPickd.SQL.Add('         WHEN d.Matched = 3 THEN ''''Not Found''''');
    qry_PrPickd.SQL.Add('      END');
    qry_PrPickd.SQL.Add('FROM');
    qry_PrPickd.SQL.Add('	Pickd d INNER JOIN Pick p ON d.Tx_No = p.Tx_No');
    qry_PrPickd.SQL.Add('WHERE d.Tx_No = '+InttoStr(Tx_No));
    If ((chk_DelNotesNoRePrints.Checked)AND(pg_ReqClerk.ActivePage = TabSheet1))OR
       ((chk_DelNotesNoRePrints2.Checked)AND(pg_ReqClerk.ActivePage = TabSheet4))Then
      qry_PrPickd.SQL.Add('	AND d.Matched <> 2');
    qry_PrPickd.SQL.Add('ORDER BY d.ItemNo');
    qry_PrPickd.SQL.Add('''');
    qry_PrPickd.SQL.Add('');
    qry_PrPickd.SQL.Add('EXEC (@SQL)');
    qry_PrPickd.Open;

    If not PrintDialog.Execute Then
      exit;

    qry_SQL.Close;
    qry_SQL.SQL.Text := 'SELECT Name, DelNotePrintQty FROM Company';
    qry_SQL.Open;
    DelNoteQty := qry_SQL.FieldByName('DelNotePrintQty').AsInteger;
    lbl_DelNoteCompany.Caption := qry_SQL.FieldByName('Name').AsString;
    qry_SQL.Close;

    rep_DeliverySlip.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
    rep_DeliverySlip.Prepare;
    rep_DeliverySlip.PrinterSettings.Copies := DelNoteQty;
    rep_DeliverySlip.Print;

    qry_SQL.Close;
    qry_SQL.SQL.Text := 'UPDATE Pick SET DeliveryNotePrinted = 1, DeliveryNotePrintedDateTime = GETDATE() WHERE Tx_No = :Tx_No';
    qry_SQL.Parameters.ParamValues['Tx_No'] := Tx_No;
    qry_SQL.ExecSQL;

    qry_SQL.Close;
    qry_SQL.SQL.Text := 'UPDATE Pickd SET Matched = 2 WHERE Matched = 1 AND Tx_No = :Tx_No';
    qry_SQL.Parameters.ParamValues['Tx_No'] := Tx_No;
    qry_SQL.ExecSQL;

    Result := true;
  finally
    qry_PrintDelNote.Close;
    qry_PrPickd.Close;
    Screen.Cursor := crDefault;
  end;
end;

function Tfrm_Retrievals.eMailDeliveryNote(Tx_No :Integer):Boolean;
var
  pCh                                           :PChar;
  seMail,sSubject,sBody,sStr, FileType, sField  :String;
  j, TxKey                                      :Integer;
  ReqUserID, eMailField                         :String;
  DelNoteQty                                    :Integer;
begin
  qry_DelNoteRType.Close;
  qry_DelNoteRType.SQL.Clear;
  qry_DelNoteRType.SQL.Add('SET NOCOUNT On');
  qry_DelNoteRType.SQL.Add('');
  qry_DelNoteRType.SQL.Add('DECLARE @Result TABLE (Barcode varchar(20),');
  qry_DelNoteRType.SQL.Add('					   TrType varchar(7),');
  qry_DelNoteRType.SQL.Add('					   RecordType varchar(50), Matched int)');
  qry_DelNoteRType.SQL.Add('');
  qry_DelNoteRType.SQL.Add('INSERT INTO @Result (Barcode, TrType, RecordType, mATCHED)');
  qry_DelNoteRType.SQL.Add('SELECT');
  qry_DelNoteRType.SQL.Add('		"Barcode" = CASE TrType');
  qry_DelNoteRType.SQL.Add('			WHEN ''RECORD'' THEN p.Barcode');
  qry_DelNoteRType.SQL.Add('			WHEN ''ITEM'' THEN p.Itemnumber');
  qry_DelNoteRType.SQL.Add('			WHEN ''CON'' THEN p.Container');
  qry_DelNoteRType.SQL.Add('		END,');
  qry_DelNoteRType.SQL.Add('		TrType,');
  qry_DelNoteRType.SQL.Add('		"RecordType" = CASE TrType');
  qry_DelNoteRType.SQL.Add('			WHEN ''RECORD'' THEN (SELECT f.FileType FROM Files f WHERE f.Filenumber = p.Barcode)');
  qry_DelNoteRType.SQL.Add('			WHEN ''ITEM'' THEN (SELECT f.FileType FROM Items f WHERE f.Itemnumber = p.Itemnumber)');
  qry_DelNoteRType.SQL.Add('			WHEN ''CON'' THEN (SELECT f.FileType FROM ContainerS f WHERE f.Container = p.Container)');
  qry_DelNoteRType.SQL.Add('			ELSE NULL');
  qry_DelNoteRType.SQL.Add('		END, Matched');
  qry_DelNoteRType.SQL.Add('FROM');
  qry_DelNoteRType.SQL.Add('	pickd p');
  qry_DelNoteRType.SQL.Add('WHERE');
  qry_DelNoteRType.SQL.Add('	p.tx_no = :Tx_No AND p.Matched <> 0');
  qry_DelNoteRType.SQL.Add('');
  qry_DelNoteRType.SQL.Add('SET NOCOUNT Off');
  qry_DelNoteRType.SQL.Add('');
  qry_DelNoteRType.SQL.Add('SELECT RecordType, TrType, Barcode, Matched');
  qry_DelNoteRType.SQL.Add('FROM @Result');
  qry_DelNoteRType.SQL.Add('ORDER BY RecordType, Barcode');
  qry_DelNoteRType.Parameters.ParamValues['Tx_No'] := Tx_No;
  qry_DelNoteRType.Open;
  If qry_DelNoteRType.IsEmpty Then
    exit;

	qry_ReqeMail.Close;
	qry_ReqeMail.SQL.Clear;
	qry_ReqeMail.SQL.Add('SELECT RequesterUserID FROM Pick WHERE Tx_No = :Tx_No');
	qry_ReqeMail.Parameters.ParamValues['Tx_No'] := Tx_No;
	qry_ReqeMail.Open;
	ReqUserID := trim(qry_ReqeMail.FieldbyName('RequesterUserID').AsString);
	If ReqUserID <> '' Then
	  begin
		  qry_ReqeMail.Close;
		  qry_ReqeMail.SQL.Clear;
		  qry_ReqeMail.SQL.Add('SELECT UserID, EMail FROM AuthCodes WHERE UserId = :UserId');
		  qry_ReqeMail.Parameters.ParamValues['UserId'] := ReqUserID;
		  qry_ReqeMail.Open;
		  seMail := trim(qry_ReqeMail.FieldByname('eMail').asString);
	  end;
	qry_ReqeMail.Close;
	if trim(seMail) <> '' then
	  begin
		  qry_SQL.Close;
		  qry_SQL.SQL.Clear;
		  qry_SQL.SQL.Add('SELECT Tx_No, TxDate, Requester, Deliver, TypeDesc FROM Pick WHERE Tx_No = :Tx_No');
		  qry_SQL.Parameters.ParamValues['Tx_No'] := Tx_No;
		  qry_SQL.Open;
	//-----------Subject--------------------------
		  sSubject := 'MetroFiler Delivery No '+ trim(qry_SQL.FieldByName('Tx_No').asString)+' has been printed';
	//-----------Header Body--------------------------
		  sBody := 'Transaction Date:%20'+trim(qry_SQL.FieldByName('TxDate').asString)+'%0D%0A'+
			      	 'Requester:%20'+trim(qry_SQL.FieldByName('Requester').asString)+'%0D%0A'+
				       'Deliver To:%20'+trim(qry_SQL.FieldByName('Deliver').asString)+'%0D%0A'+
				       'Type:%20'+trim(qry_SQL.FieldByName('TypeDesc').asString)+'%0D%0A%0D%0A';
	//-----------Details Body--------------------------
		  sBody := sBody + 'Details:%0D%0A';

		  FileType := '"$%£$%^£"!%$';

		  qry_DelNoteRType.First;
		  While not qry_DelNoteRType.EOF Do
		    begin
	//---------------------------------------------
			    If FileType <> trim(qry_DelNoteRType.FieldbyName('RECORDTYPE').AsString) Then
			      begin
							FileType := trim(qry_DelNoteRType.FieldbyName('RECORDTYPE').AsString);
							sBody := sBody + '---------------------------------------------------------------------------------------------------%0D%0A';
							sBody := sBody + 'RecordType:%20'+FileType+'%0D%0A';
							sBody := sBody + '---------------------------------------------------------------------------------------------------%0D%0A';
							sBody := sBody + 'Barcode,%20';

							qry_UpdPrTextFields.Close;
							qry_UpdPrTextFields.SQL.Clear;
							qry_UpdPrTextFields.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(FileType));
							qry_UpdPrTextFields.Open;
							eMailField := trim(qry_UpdPrTextFields.FieldbyName('eMailField').asString);
							If eMailField <> '' Then
							  begin

					        For J := 1 to 15 Do
					          If eMailField = trim(qry_UpdPrTextFields.FieldbyName('Col'+InttoStr(J)).asString) Then
						          begin
						            sBody := sBody + trim(qry_UpdPrTextFields.FieldbyName('eMailField').asString) + ',%20';
						            Break;
						          end;
				        end;
				      qry_UpdPrTextFields.Close;

				      sBody := sBody + 'Matched%0D%0A';
              sBody := sBody + '---------------------------------------------------------------------------------------------------%0D%0A';
			      end;
	//---------------------------------------------
			    sBody := sBody + trim(qry_DelNoteRType.FieldbyName('BARCODE').AsString) + ',%20';

			qry_UpdPrTextFields.Close;
			qry_UpdPrTextFields.SQL.Clear;
			qry_UpdPrTextFields.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = '+QuotedStr(FileType));
			qry_UpdPrTextFields.Open;
			eMailField := trim(qry_UpdPrTextFields.FieldbyName('eMailField').asString);
			If eMailField <> '' Then
			  begin
				For J := 1 to 10 Do
				  If eMailField = trim(qry_UpdPrTextFields.FieldbyName('Col'+InttoStr(J)).asString) Then
					begin
					  sField := 'Text'+InttoStr(J);
					  Break;
					end;
				For J := 11 to 13 Do
				  If eMailField = trim(qry_UpdPrTextFields.FieldbyName('Col'+InttoStr(J)).asString) Then
					begin
					  sField := 'Date'+InttoStr(J-10);
					  Break;
					end;
				For J := 14 to 15 Do
				  If eMailField = trim(qry_UpdPrTextFields.FieldbyName('Col'+InttoStr(J)).asString) Then
					begin
					  sField := 'Number'+InttoStr(J-13);
					  Break;
					end;
			  end;
			qry_UpdPrTextFields.Close;

			If sField <> '' Then
			  begin
				If trim(qry_DelNoteRType.FieldbyName('TrType').asString) = 'RECORD' Then
				  begin
					qry_SQL.Close;
					qry_SQL.SQL.Clear;
					qry_SQL.SQL.Add('SELECT ['+sField+'] FROM Files WHERE Filenumber = '+QuotedStr(trim(qry_DelNoteRType.FieldbyName('Barcode').asString)));
					qry_SQL.Open;
				  end;
				If trim(qry_DelNoteRType.FieldbyName('TrType').asString) = 'ITEM' Then
				  begin
					qry_SQL.Close;
					qry_SQL.SQL.Clear;
					qry_SQL.SQL.Add('SELECT ['+sField+'] FROM Items WHERE Itemnumber = '+QuotedStr(trim(qry_DelNoteRType.FieldbyName('Barcode').asString)));
					qry_SQL.Open;
				  end;
				If trim(qry_DelNoteRType.FieldbyName('TrType').asString) = 'CON' Then
				  begin
					qry_SQL.Close;
					qry_SQL.SQL.Clear;
					qry_SQL.SQL.Add('SELECT ['+sField+'] FROM Containers WHERE Container = '+QuotedStr(trim(qry_DelNoteRType.FieldbyName('Barcode').asString)));
					qry_SQL.Open;
				  end;

				sBody := sBody + qry_SQL.Fields[0].asString + ',%20';
			  end;

			if qry_DelNoteRType.FieldbyName('Matched').asInteger = 0 Then
			  sBody := sBody + 'Not found %0D%0A'
			else sBody := sBody + '%0D%0A';

			qry_DelNoteRType.Next;
		  end;
		sStr := 'mailto:'+seMail+'?subject='+sSubject+'&body='+sBody;

		pCh := PChar(sStr);

		ShellExecute(0, 'open', pCh, nil, nil, SW_SHOWNORMAL);
	  end;  //test if email address is valid
end;

end.

