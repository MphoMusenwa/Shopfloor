unit frmExportData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, ToolWin, DB, ADODB, Grids, DBGrids, DBCtrls,
  StdCtrls, ExtCtrls, OleCtrls, DirDlg,
  TiffXViewWebProj1_TLB;

type
  Tfrm_ExportData = class(TForm)
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    btn_Close: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Panel6: TPanel;
    btn_ViewFileLinks: TSpeedButton;
    grd_ExportData: TDBGrid;
    btn_Export: TSpeedButton;
    qry_BatchImages: TADOQuery;
    dts_BatchImages: TDataSource;
    qry_Files: TADOQuery;
    qry_SQL: TADOQuery;
    qry_ExpDefs: TADOQuery;
    qry_Image: TADOQuery;
    sdlg_Export: TSaveDialog;
    Bevel3: TBevel;
    Bevel1: TBevel;
    Label15: TLabel;
    btn_GetCoCode: TSpeedButton;
    btn_GetDept: TSpeedButton;
    Label16: TLabel;
    Label5: TLabel;
    btn_FindJobNo: TSpeedButton;
    btn_Filter: TSpeedButton;
    rgrp_Filter: TRadioGroup;
    edt_Code: TEdit;
    edt_Dept: TEdit;
    edt_FindBatchNo: TEdit;
    qry_BatchImagesJobNo: TStringField;
    qry_BatchImagesCode: TStringField;
    qry_BatchImagesDepartment: TStringField;
    qry_BatchImagesNonMOPS: TSmallintField;
    qry_BatchImagesBatchNo: TStringField;
    qry_BatchImagesDescr: TStringField;
    qry_BatchImagesExpCompl: TSmallintField;
    qry_BatchImagesTotalImages: TIntegerField;
    qry_BatchImagesTotalCapturedImages: TIntegerField;
    qry_BatchImagesTotalOutstanding: TIntegerField;
    qry_Calc: TADOQuery;
    qry_BatchImagesRecordType: TStringField;
    qry_MergeFiles: TADOQuery;
    qry_UpdImage: TADOQuery;
    qry_UpdFilePath: TADOQuery;
    btn_ProcNotes: TSpeedButton;
    img: TTiffXViewWeb;
    ProgressBar: TProgressBar;
    pnl_Processing: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    fileList: TListBox;
    listMergeSplit: TListBox;
    mem_CSVList: TMemo;
    procedure imgCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_ViewFileLinksClick(Sender: TObject);
    procedure btn_ExportClick(Sender: TObject);
    procedure grd_ExportDataDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn_FilterClick(Sender: TObject);
    procedure btn_FindJobNoClick(Sender: TObject);
    procedure btn_GetCoCodeClick(Sender: TObject);
    procedure btn_GetDeptClick(Sender: TObject);
    procedure qry_BatchImagesCalcFields(DataSet: TDataSet);
    procedure btn_ProcNotesClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExportCSV(Filename, Qualifier, Delimiter, RenImageTo :String;  ADODataset: TADOQuery; pdfConv :Boolean);
    procedure ExportKodak(BatchNo, ExportPath :String;  ADODataset: TADOQuery);
    procedure ExportImages(BatchNo, ExportPath, RenImageTo,csvFileName :String;  ADODataset: TADOQuery; pdfConv,SplitImages :Boolean);
    function CreateFolder(Folder :String):Boolean;
    Procedure AddImage(sPath,sFileName,sImageName :String);
    Procedure mergeSplitImages(sFileName: String);
  public
    { Public declarations }
    procedure GenAlchemyFile(BatchNo, ExportPath, DocTitle :String;  ADODataset,ExpDefs: TADOQuery; pdfConv :Boolean);
  end;

var
  frm_ExportData: Tfrm_ExportData;

implementation

uses MAIN, ImageFileLinks, Getcomp, GetDeptNonMops, ConfirmBatchExport,
  ViewProcNotes;

{$R *.dfm}

procedure Tfrm_ExportData.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ExportData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_BatchImages.Close;
  frm_Main.itm_ExportDatatofile.Enabled := True;
  Action := caFree;
end;

procedure Tfrm_ExportData.FormCreate(Sender: TObject);
begin
  btn_FilterClick(Self);
end;

procedure Tfrm_ExportData.btn_ViewFileLinksClick(Sender: TObject);
begin
  If qry_BatchImages.IsEmpty Then
    exit;
  frm_ImageFileLinks.btn_Clear.Visible := False;
  frm_ImageFileLinks.nav.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,nbDelete];
  If qry_BatchImages.FieldbyName('NonMOPS').AsInteger = 1 Then
    frm_ImageFileLinks.Execute(True, trim(qry_BatchImages.FieldbyName('BatchNo').AsString))
  else frm_ImageFileLinks.Execute(False, trim(qry_BatchImages.FieldbyName('BatchNo').AsString));
  frm_ImageFileLinks.qry_FileLinks.Close;
end;

procedure Tfrm_ExportData.btn_ExportClick(Sender: TObject);
Var
  StringList,MergeList    :TStringList;
  i, j,z,MergeCnt,nCount           :integer;
  SQLText,SQLMergeList,SQLMergeText  :String;
  ExportedPath, DBADescr  :String;
  StartDate, EndDate      :TDateTime;
  NewImage,OldImage,sPath :string;
  sFileName,fileNames :string;
  dBaseImages,PDFConvFlag,ImgComboFlag,SplitImages :boolean;
  sPos :integer;
  sTempImgDir :String;
begin
  StringList := TStringList.Create;
  MergeList := TStringList.Create;
  try
  StartDate := frm_Main.GetServTimeNow;
//---------------------------Verify that Capture has completed------------------   
  If (qry_BatchImages.FieldbyName('TotalCapturedImages').asInteger = 0)or
     (qry_BatchImages.FieldbyName('TotalImages').asInteger = 0)or
     (qry_BatchImages.FieldbyName('TotalCapturedImages').asInteger < qry_BatchImages.FieldbyName('TotalImages').asInteger) Then
    begin
      MessageDlg('Cannot Export this batch. Capture not completed.', mtInformation, [mbOk], 0);
      exit;
    end;
//---------------------------Verify that Capture has completed------------------
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT * FROM NonMOPSCustomersIndexDefs');
    qry_SQL.SQL.Add('WHERE CustomerCode = '+QuotedStr(Trim(qry_BatchImages.FieldbyName('CODE').AsString)));
    qry_SQL.SQL.Add('AND DepartmentCode = '+QuotedStr(Trim(qry_BatchImages.FieldbyName('DEPARTMENT').AsString)));
    qry_SQL.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionId));
    qry_SQL.SQL.Add('AND RecordType = '+QuotedStr(Trim(qry_BatchImages.FieldbyName('RECORDTYPE').AsString)));
    qry_SQL.Open;
    If qry_SQL.IsEmpty Then
      begin
        Messagedlg('Indexing setup not completed for Customer "'+Trim(qry_BatchImages.FieldbyName('CODE').AsString)+'/'+Trim(qry_BatchImages.FieldbyName('DEPARTMENT').AsString)+'" and RecordType "'+Trim(qry_BatchImages.FieldbyName('RECORDTYPE').AsString)+'"!!', mtInformation, [mbOK], 0);
        exit;
      end;
    qry_ExpDefs.Close;
    qry_ExpDefs.SQL.Clear;
    qry_ExpDefs.SQL.Add('SELECT * FROM ExportDefs');
    qry_ExpDefs.SQL.Add('WHERE Code = '+QuotedStr(Trim(qry_BatchImages.FieldbyName('CODE').AsString)));
    qry_ExpDefs.SQL.Add('AND Department = '+QuotedStr(Trim(qry_BatchImages.FieldbyName('DEPARTMENT').AsString)));
    qry_ExpDefs.SQL.Add('AND RecordType = '+QuotedStr(Trim(qry_BatchImages.FieldbyName('RECORDTYPE').AsString)));
    qry_ExpDefs.Open;
    If qry_ExpDefs.IsEmpty Then
      begin
        Messagedlg('Export Format not completed for Customer "'+Trim(qry_BatchImages.FieldbyName('DEPARTMENT').AsString)+'/'+Trim(qry_BatchImages.FieldbyName('DEPARTMENT').AsString)+'" and RecordType "'+Trim(qry_BatchImages.FieldbyName('RECORDTYPE').AsString)+'"!!', mtInformation, [mbOK], 0);
        exit;
      end;

//------------------------------------------------------------------------------
//Moved Here - 13032007
//------------------------------------------------------------------------------
    If frm_ConfirmBatchExport.ShowModal = mrCancel Then
      exit;
    if frm_ConfirmBatchExport.chk_ConvertPDF.Checked then
      PDFConvFlag := true
    else
      PDFConvFlag := false;
    if frm_ConfirmBatchExport.chk_SplitTiffs.Checked then
      SplitImages := true
    else
      SplitImages := false;

//------------------------------------------------------------------------------
//Need to Lock the Application
//------------------------------------------------------------------------------
  frm_Exportdata.Enabled := false;
  cursor := crHourGlass;
  Application.ModalStarted;
  pnl_Processing.Visible := true;
//------------------------------------------------------------------------------
//13032007
//What about images stored in the dBase??
//------------------------------------------------------------------------------
//Test if Images are in dbase, if so, then export to temp dir
      qry_UpdImage.Close;
      qry_UpdImage.SQL.Clear;
      qry_UpdImage.SQL.Add('SELECT count(*) Recs from NonMopsFiles');
      qry_UpdImage.SQL.Add('where BatchNo = '+QuotedStr(trim(qry_BatchImages.FieldbyName('BATCHNO').AsString)));
      qry_UpdImage.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionID));
      qry_UpdImage.SQL.Add('AND ImageData is Not Null');
      qry_UpdImage.Open;
      dBaseImages := false;
      if qry_UpdImage.FieldByname('Recs').AsInteger > 0 then
      begin
          qry_UpdImage.Close;
          qry_UpdImage.SQL.Clear;
          qry_UpdImage.SQL.Add('SELECT ImageData,FileNameLink from NonMopsFiles');
          qry_UpdImage.SQL.Add('where BatchNo = '+QuotedStr(trim(qry_BatchImages.FieldbyName('BATCHNO').AsString)));
          qry_UpdImage.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionID));
          qry_UpdImage.SQL.Add('AND ImageData is Not Null');
          qry_UpdImage.Open;
          dBaseImages := true;
          sPath := 'c:\TempImg\';
          If not DirectoryExists(sPath) Then
            If not CreateFolder(sPath) Then
            begin
              raise Exception.Create('Cannot create Folder "'+sPath+'".');
              qry_UpdImage.Close;
              cursor := crDefault;
              Application.ModalFinished;
              frm_Exportdata.Enabled := true;
              pnl_Processing.Visible := false;
              exit;
            end;
            qry_UpdImage.First;
            while not qry_UpdImage.EOF do   //extract to temp dir, work from here
            begin
            if qry_UpdImage.FieldByName('ImageData').Value <> Null then
              TBlobField(qry_UpdImage.FieldbyName('ImageData')).SaveToFile(sPath+extractfilename(qry_UpdImage.FieldByname('FilenameLink').AsString));
              qry_UpdImage.Next;
            end;
      end;
      qry_UpdImage.Close;
{
Files to be merged
}
if qry_ExpDefs.FieldByName('ImgCombo').AsInteger > 0 then
begin
    ImgComboFlag := true;
    MergeCnt := 0;
    SQLMergeList := '';
      For J := 1 to 16 Do
        begin
    //--------------------------------------------------
    //Is it a Merge Flag
    //--------------------------------------------------
              For I := 1 to 15 Do
                begin
                  If (I >= 1)and(I <= 10) Then
                    If trim(qry_SQL.FieldByName('TEXT'+InttoStr(I)).AsString) = trim(qry_ExpDefs.FieldByName('POS'+InttoStr(J)).AsString) Then
                      If trim(qry_ExpDefs.FieldByName('POS'+InttoStr(J)).AsString) <> '' Then
                      begin
                        SQLMergeList := SQLMergeList + 'TEXT'+InttoStr(I)+',';
                        MergeList.Add( 'TEXT'+InttoStr(I));
                        Inc(MergeCnt);
                      end;
                  If (I >= 11)and(I <= 13) Then
                    If trim(qry_SQL.FieldByName('DATE'+InttoStr(I-10)).AsString) = trim(qry_ExpDefs.FieldByName('POS'+InttoStr(J)).AsString) Then
                      If trim(qry_ExpDefs.FieldByName('POS'+InttoStr(J)).AsString) <> '' Then
                      begin
                        SQLMergeList := SQLMergeList + 'DATE'+InttoStr(I-10)+',';
//                        MergeList.Add( 'Date'+InttoStr(I));
                        MergeList.Add( 'Date'+InttoStr(I-10));
                        Inc(MergeCnt);
                      end;
                  If (I >= 14)and(I <= 15) Then
                    If trim(qry_SQL.FieldByName('Numeric'+InttoStr(I-13)).AsString) = trim(qry_ExpDefs.FieldByName('POS'+InttoStr(J)).AsString) Then
                      If trim(qry_ExpDefs.FieldByName('POS'+InttoStr(J)).AsString) <> '' Then
                      begin
                        SQLMergeList := SQLMergeList + 'NUMBER'+InttoStr(I-13)+',';
//                        MergeList.Add( 'Number'+InttoStr(I));
                        MergeList.Add( 'Number'+InttoStr(I-13));       //19062008
                        Inc(MergeCnt);
                      end;
                end;  //i = 1 to 15
          end;   //for j 1 to 16
//Must be Grouped on Folder, ie cannot merge accross folders
//24072007
//-----------------------
//Clear Any Other Setting from previous run
            qry_UpdImage.Close;
            qry_UpdImage.SQL.Clear;
            qry_UpdImage.SQL.Add('Update NonMopsFiles set CompFileNameLink = NULL,MergeImage = 0 where');
            qry_UpdImage.SQL.Add('BatchNo = '+QuotedStr(trim(qry_BatchImages.FieldbyName('BATCHNO').AsString)));
            qry_UpdImage.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionID));
            qry_UpdImage.SQL.Add('AND Captured = 1');
            qry_UpdImage.ExecSQL;
//-----------------------
        SQLMergeList := SQLMergeList;
        SQLMergeText := 'SELECT '+SQLMergeList+ 'ImgFolder, Count(*)'#10#13;
        SQLMergeText := SQLMergeText + 'FROM NonMOPSFiles'+ #10#13;
        SQLMergeText := SQLMergeText + 'WHERE BatchNo = '+QuotedStr(trim(qry_BatchImages.FieldbyName('BATCHNO').AsString))+ #10#13;
        SQLMergeText := SQLMergeText + 'AND Region = '+QuotedStr(frm_Main.sRegionID)+ #10#13;
        SQLMergeText := SQLMergeText + 'AND Captured = 1'+ #10#13;
        SQLMergeText := SQLMergeText + 'GROUP BY '+ COPY(SQLMergeList,1,length(trim(SQLMergeList))-1) +',ImgFolder having count(*) > 1';
        qry_MergeFiles.Close;
        qry_MergeFiles.SQL.Clear;
        qry_MergeFiles.SQL.Text := SQLMergeText;
        qry_MergeFiles.Open;    //LIST TO BE MERGED
        if NOT qry_MergeFiles.IsEmpty then
        nCount := 1;
        ProgressBar.Visible := true;
        Progressbar.Max:= qry_MergeFiles.RecordCount;
        Progressbar.Step:= 1;
        ProgressBar.Min:= 0;
        ProgressBar.Position:= 0;
        ProgressBar.Show;
        While not qry_MergeFiles.EOF do
          begin
            //MergeImage
            //Update
            qry_UpdImage.Close;
            qry_UpdImage.SQL.Clear;
            qry_UpdImage.SQL.Add('Update NonMopsFiles set MergeImage = '+IntToStr(nCount)+' where');
            for z := 0 to MergeCnt-1 do
            begin
                if z = 0 then
                begin
                  If Pos('NUMBER',UPPERCASE(MergeList[z])) > 0 then
                    qry_UpdImage.SQL.Add(MergeList[z]+' = '+ qry_MergeFiles.FieldList[z].AsString)
                  else
                    if Pos('TEXT',UPPERCASE(MergeList[z])) > 0  then
                      qry_UpdImage.SQL.Add('isNull('+MergeList[z]+','''') = '+ QuotedStr(Trim(qry_MergeFiles.FieldList[z].AsString)))
                    else
                      qry_UpdImage.SQL.Add(MergeList[z]+' = '+ QuotedStr(Trim(qry_MergeFiles.FieldList[z].AsString)));
                end
                else
                  If Pos('NUMBER',UPPERCASE(MergeList[z])) > 0 then
                    qry_UpdImage.SQL.Add('And '+MergeList[z]+' = '+ qry_MergeFiles.FieldList[z].AsString)
                  else
                    if Pos('TEXT',UPPERCASE(MergeList[z])) > 0  then
                      qry_UpdImage.SQL.Add('And isNull(' + MergeList[z]+','''') = '+ QuotedStr(Trim(qry_MergeFiles.FieldList[z].AsString)))
                    else
                      qry_UpdImage.SQL.Add('And ' + MergeList[z]+' = '+ QuotedStr(Trim(qry_MergeFiles.FieldList[z].AsString)));
            end;
            qry_UpdImage.SQL.Add('and BatchNo = '+QuotedStr(trim(qry_BatchImages.FieldbyName('BATCHNO').AsString)));
            qry_UpdImage.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionID));
            qry_UpdImage.SQL.Add('AND ImgFolder  = '+QuotedStr(trim(qry_MergeFiles.FieldByname('ImgFolder').AsString)));  //24072007
            qry_UpdImage.SQL.Add('AND Captured = 1');
            qry_UpdImage.ExecSQL;
            Inc(nCount);
            ProgressBar.StepIt;
            qry_MergeFiles.Next;    //NEXT SET TO MERGE
          end;
          ProgressBar.Visible := False;
        qry_MergeFiles.Close;
        //----------------------------------------------------------------------
        //Now Merge Images
        //----------------------------------------------------------------------
        for z  := 1 to nCount-1 do
        begin
            qry_UpdImage.Close;
            qry_UpdImage.SQL.Clear;
            qry_UpdImage.SQL.Add('SELECT filenumber,filenamelink,CapDate,ImageData from NonMOPSFiles');
            qry_UpdImage.SQL.Add('where BatchNo = '+QuotedStr(trim(qry_BatchImages.FieldbyName('BATCHNO').AsString)));
            qry_UpdImage.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionID));
            qry_UpdImage.SQL.Add('AND MergeImage = '+IntToStr(z));
            qry_UpdImage.SQL.Add('AND Captured = 1 order by filenamelink'); //order by CapDate');  17072008
            qry_UpdImage.Open;
            //NewImage
            //OldImage
            //Path
//------------------------------------------------------------------------------
//What if Image is stored in the table????
//Extract and write to local dir, flag as such, when
//export function is called, check for this flag and
//use the local file instead of the database file
//------------------------------------------------------------------------------
            if not qry_UpdImage.IsEmpty then
            begin
              qry_UpdImage.First;
              fileNames := trim(qry_UpdImage.FieldByname('FilenameLink').AsString);  //1st File
              sPath := ExtractFilePath(qry_UpdImage.FieldByname('FilenameLink').AsString);
              if dBaseImages then   //ie images in dbase
              begin
                    sPath := 'c:\TempImg\';
                    fileNames := sPath+ExtractFileName(fileNames);  //Change FirstFile
              end;
              qry_UpdImage.First;
//------------------------------------------------------------------------------
//14032007
//------------------------------------------------------------------------------
//If Image in dbase, place in Temp Folder and Process From There
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
              If frm_ConfirmBatchExport.chk_ConvertPDF.Checked Then
              begin
//                     sFileName :=  'com'+ copy(trim(qry_UpdImage.FieldByname('FilenameLink').AsString),length(sPath)+1,255);
                     sFileName :=  'com'+ trim(extractFileName(qry_UpdImage.FieldByname('FilenameLink').AsString));
                     if pos('.pdf',sFileName) = 0 then
                     begin
                        sPos := pos('.',sFileName);
                        if sPos > 0 then
                        begin
                            sFileName := copy(sFileName,1,sPos-1);
                            sFileName := sFileName+'.pdf';
                        end;
                     end; //if not already a pdf
                     sFileName :=  sPath+sFileName;
              end
              else        //Change only in export directory
//                    sFileName :=  sPath+'com'+ copy(trim(qry_UpdImage.FieldByname('FilenameLink').AsString),length(sPath)+1,255);
                    sFileName :=  sPath+'com'+ trim(extractFileName(qry_UpdImage.FieldByname('FilenameLink').AsString));

//------------------------------------------------------------------------------
              qry_UpdFilePath.Close;
              qry_UpdFilePath.SQL.Clear;
              qry_UpdFilePath.SQL.Add('update NonMOPSFiles');
              qry_UpdFilePath.SQL.Add('set CompFileNameLink = '+QuotedStr(sFileName));  //New Compound File
              qry_UpdFilePath.SQL.Add('where Region = '+QuotedStr(frm_Main.sRegionID));
              qry_UpdFilePath.SQL.Add('AND FileNumber = '+qry_UpdImage.FieldByname('FileNumber').AsString);
              qry_UpdFilePath.SQL.Add('AND Captured = 1');
              qry_UpdFilePath.ExecSQL;
              //--
              qry_UpdImage.Next;  //we have processed 1st one
//------------------------------------------------------------------------------
              while Not qry_UpdImage.EOF do
              begin
                Application.ProcessMessages;
//                fileNames := fileNames+';'+qry_UpdImage.FieldByname('FilenameLink').AsString;
                fileNames := fileNames+';'+sPath+trim(extractFileName(qry_UpdImage.FieldByname('FilenameLink').AsString));
                qry_UpdImage.Next;
              end;   //while not eof
//------------------------------------------------------------------------------
//Generate Compound Tiff/PDf depending on selection
//------------------------------------------------------------------------------
    If frm_ConfirmBatchExport.chk_ConvertPDF.Checked Then
//          img.CombineSingleTiffsintoPDF(Filenames, sFilename)
          img.MergeTiffsIntoPDF(Filenames, sFilename)
    else
//              img.CombineSingleTiffs(Filenames, sFilename);
          img.MergeTiffs(Filenames, sFilename);
//------------------------------------------------------------------------------
            end; //if not empty
            qry_UpdImage.Close;;
        end;
end;    //If MergeFiles Selected

//else   //convert any files not merged to pdf if flag is set -- 24072007
//------------------------------------------------------------------------------
//14032007
//If Convert to PDF selected, convert tiffs to pdf
//and Write to the Image Location Directory
//When Exporting, Copy converted images from here
//------------------------------------------------------------------------------
{}
    If frm_ConfirmBatchExport.chk_ConvertPDF.Checked Then
    begin
        qry_UpdImage.Close;
        qry_UpdImage.SQL.Clear;
        qry_UpdImage.SQL.Add('SELECT filenumber,filenamelink,CapDate from NonMOPSFiles');
        qry_UpdImage.SQL.Add('where BatchNo = '+QuotedStr(trim(qry_BatchImages.FieldbyName('BATCHNO').AsString)));
        qry_UpdImage.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionID));
//        qry_UpdImage.SQL.Add('AND MergeImage = 0');   //re-instated 24072007
//        qry_UpdImage.SQL.Add('AND Captured = 1 order by CapDate');
        qry_UpdImage.Open;
        if not qry_UpdImage.IsEmpty then
        begin
            //If Extracted from dBase then Use Temp Path, else
            //use path
              sPath := ExtractFilePath(qry_UpdImage.FieldByname('FilenameLink').AsString);
              if dBaseImages then   //ie images in dbase
                    sPath := 'c:\TempImg\';
//          sPath := ExtractFilePath(qry_UpdImage.FieldByname('FilenameLink').AsString);
//          fileNames := trim(qry_UpdImage.FieldByname('FilenameLink').AsString);  //1st File
          fileNames := sPath+trim(extractFileName(qry_UpdImage.FieldByname('FilenameLink').AsString));  //1st File
          qry_UpdImage.Next;
          while Not qry_UpdImage.EOF do
          begin
                 Application.ProcessMessages;
//                  fileNames := fileNames+';'+trim(qry_UpdImage.FieldByname('FilenameLink').AsString);

              if NOT dBaseImages then   //ie images in dbase
                  sPath := ExtractFilePath(qry_UpdImage.FieldByname('FilenameLink').AsString);
                  fileNames := fileNames+';'+sPath+trim(extractFileName(qry_UpdImage.FieldByname('FilenameLink').AsString));
                  qry_UpdImage.Next;
          end;   //while not eof
          qry_UpdImage.Close;
          img.ConvertTiffstoPDF(Filenames);
        end;
    end;
{}
 //-----------------------------------------------------------------------------
//------------------------------------------------------------------------------
//End Change 13032007
//------------------------------------------------------------------------------
//==========First build dataset to export
    Application.ProcessMessages;
    StringList.Clear;
    For i := 1 to 15 Do
      begin
        Application.ProcessMessages;
        If (qry_SQL.FieldByName('Pos'+InttoStr(i)).AsInteger = i)Then        //ie, is field 4 exp
          begin
            If (I >= 1)and(I <= 10) Then
              begin
                If (trim(qry_SQL.FieldByName('Text'+InttoStr(i)).AsString) <> '') Then
                  StringList.Append('Text'+InttoStr(i)+'==>'+trim(qry_SQL.FieldByName('Text'+InttoStr(i)).AsString));
              end;
            If (I >= 11)and(I <= 13) Then
              begin
                If (trim(qry_SQL.FieldByName('Date'+InttoStr(i-10)).AsString) <> '') Then
                  StringList.Append('Date'+InttoStr(i-10)+'==>'+trim(qry_SQL.FieldByName('Date'+InttoStr(i-10)).AsString));
              end;
            If (I >= 14)and(I <= 15) Then
              begin
                If (trim(qry_SQL.FieldByName('Numeric'+InttoStr(i-13)).AsString) <> '') Then
                  StringList.Append('Number'+InttoStr(i-13)+'==>'+trim(qry_SQL.FieldByName('Numeric'+InttoStr(i-13)).AsString));
              end;
          end;
      end;
  SQLText := 'SELECT ';
  For J := 1 to 16 Do
    begin
      Application.ProcessMessages;
      If trim(qry_ExpDefs.FieldByName('POS'+InttoStr(J)).AsString) = '{Filename}' Then
        begin
          if ImgComboFlag then
              SQLText := SQLText + 'case when MergeImage > 0 then CompFileNameLink'+#13+
                  'else FileNameLink'+#13+'end as FileNameLink,'
          else
              SQLText := SQLText + 'FileNameLink, '        //13032007
        end
      else
        begin
          For I := 1 to 15 Do
            begin
              If (I >= 1)and(I <= 10) Then
                If trim(qry_SQL.FieldByName('TEXT'+InttoStr(I)).AsString) = trim(qry_ExpDefs.FieldByName('POS'+InttoStr(J)).AsString) Then
                  If trim(qry_ExpDefs.FieldByName('POS'+InttoStr(J)).AsString) <> '' Then
                    SQLText := SQLText + 'TEXT'+InttoStr(I)+' AS '+QuotedStr(trim(qry_SQL.FieldByName('TEXT'+InttoStr(I)).AsString))+',';
              If (I >= 11)and(I <= 13) Then
                If trim(qry_SQL.FieldByName('DATE'+InttoStr(I-10)).AsString) = trim(qry_ExpDefs.FieldByName('POS'+InttoStr(J)).AsString) Then
                  If trim(qry_ExpDefs.FieldByName('POS'+InttoStr(J)).AsString) <> '' Then
                    SQLText := SQLText + 'DATE'+InttoStr(I-10)+' AS '+QuotedStr(trim(qry_SQL.FieldByName('DATE'+InttoStr(I-10)).AsString))+',';
              If (I >= 14)and(I <= 15) Then
                If trim(qry_SQL.FieldByName('Numeric'+InttoStr(I-13)).AsString) = trim(qry_ExpDefs.FieldByName('POS'+InttoStr(J)).AsString) Then
                  If trim(qry_ExpDefs.FieldByName('POS'+InttoStr(J)).AsString) <> '' Then
                    SQLText := SQLText + 'NUMBER'+InttoStr(I-13)+' AS '+QuotedStr(trim(qry_SQL.FieldByName('NUMERIC'+InttoStr(I-13)).AsString))+',';
              end;
          end;
      end;
    SQLText := SQLText + ' ImgFolder';//,ImageData';
    SQLText := SQLText + #10#13;
    SQLText := SQLText + 'FROM NonMOPSFiles'+ #10#13;
    SQLText := SQLText + 'WHERE BatchNo = '+QuotedStr(trim(qry_BatchImages.FieldbyName('BATCHNO').AsString))+ #10#13;
    SQLText := SQLText + 'AND Region = '+QuotedStr(frm_Main.sRegionID)+ #10#13;
    SQLText := SQLText + 'AND Captured = 1'+ #10#13;
    if ImgComboFlag then
      SQLText := SQLText + 'and (mergeimage = 0 or CompFileNameLink is not null)'+ #10#13;
//    SQLText := SQLText + 'Order By  CapDate'+ #10#13;    //16032007
    SQLText := SQLText + 'Order By  FileNameLink '+ #10#13; //17072008
    qry_Files.Close;
    qry_Files.SQL.Clear;
    qry_Files.SQL.Text := SQLText;
    qry_Files.Open;
//------------------------------------------------------------------------------
//    If not frm_ConfirmBatchExport.ShowModal = mrOK Then
//      exit;
//------------------------------------------------------------------------------
    //-----
    If frm_ConfirmBatchExport.rbtn_BatchNo.Checked Then
      sdlg_Export.FileName := TRIM(qry_BatchImages.FieldbyName('BATCHNO').AsString)
    else If frm_ConfirmBatchExport.rbtn_Descr.Checked Then
      sdlg_Export.FileName := TRIM(qry_BatchImages.FieldbyName('DESCR').AsString);
    //-----
    ExportedPath := trim(qry_ExpDefs.FieldbyName('ExportPath').AsString);
    If copy(ExportedPath, length(ExportedPath), 1) <> '\' Then
      ExportedPath := ExportedPath + '\';
    //-----
//------------------------------------------------------------------------------
//14032007
//Create Export Folder for the batch if selected
//------------------------------------------------------------------------------

    If frm_ConfirmBatchExport.chk_BatchFolder.Checked Then
    begin
        If not CreateFolder(ExportedPath+trim(sdlg_Export.FileName)) Then
        begin
           raise Exception.Create('Cannot create Folder "'+ExportedPath+trim(sdlg_Export.FileName));
           cursor := crDefault;
           Application.ModalFinished;
           frm_Exportdata.Enabled := true;
           pnl_Processing.Visible := false;
           exit;
        end
        else
          ExportedPath := ExportedPath+trim(sdlg_Export.FileName)+'\';
    end;
 //----------------------------------------------------------------------

    sdlg_Export.initialdir := ExportedPath;
    If not sdlg_Export.Execute Then
      exit;
    ExportedPath := ExtractFilePath(sdlg_Export.Filename);
    if fileExists(sdlg_Export.FileName) then
      if MessageDLG('File Exists, do you wish to overwrite?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      begin
          ProgressBar.Visible := false;
          pnl_Processing.Visible := false;
          Application.ModalFinished;
          frm_Exportdata.Enabled := true;
          cursor := crDefault;
          exit;
      end;
    //----------------------------
    //Do Export
    //----------------------------
    If trim(qry_ExpDefs.FieldByName('ExportDefault').AsString) = 'Custom' Then
      begin
        ExportCSV(sdlg_Export.FileName,
                  trim(qry_ExpDefs.FieldbyName('Qualifier').AsString),
                  trim(qry_ExpDefs.FieldbyName('Delimiter').AsString),
                  trim(qry_ExpDefs.FieldbyName('RenImageTo').AsString),
                  qry_Files,PDFConvFlag);
        If qry_ExpDefs.FieldbyName('CopyImages').asBoolean Then
          ExportImages(TRIM(qry_BatchImages.FieldbyName('BATCHNO').AsString),
                  ExportedPath,
                  trim(qry_ExpDefs.FieldbyName('RenImageTo').AsString),sdlg_Export.FileName,
                  qry_Files,PDFConvFlag,SplitImages);
      end
    else If trim(qry_ExpDefs.FieldByName('ExportDefault').AsString) = 'Alchemy' Then
      begin
        ExportCSV(sdlg_Export.FileName,
                  '',
                  ',',
                  '',
                  qry_Files,PDFConvFlag);
        If qry_ExpDefs.FieldbyName('CreateAlcHeader').asBoolean Then
          GenAlchemyFile(trim(qry_BatchImages.FieldbyName('BATCHNO').AsString),
                         ExportedPath,
                         trim(qry_ExpDefs.FieldbyName('DocTitle').AsString),
                         qry_Files,qry_ExpDefs,PDFConvFlag);
      end    //Alchemy
    else If trim(qry_ExpDefs.FieldByName('ExportDefault').AsString) = 'Kodak MVCS' Then
      begin
        ExportKodak(TRIM(qry_BatchImages.FieldbyName('BATCHNO').AsString),
                    ExportedPath,
                    qry_Files);
        ExportImages(TRIM(qry_BatchImages.FieldbyName('BATCHNO').AsString),
                     ExportedPath,
                     '',sdlg_Export.FileName,
                     qry_Files,PDFConvFlag,SplitImages);
      end;
    //----------------------------
    //End of Export
    //----------------------------
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('UPDATE Batches SET');
    qry_SQL.SQL.Add('    ExpCompl = 1,');
    qry_SQL.SQL.Add('    ExpOperator = '+QuotedStr(frm_Main.sOperator)+',');
    qry_SQL.SQL.Add('    ExpDateTime = GetDate()');
    qry_SQL.SQL.Add('WHERE BatchNo = '+QuotedStr(qry_BatchImages.FieldbyName('BatchNo').asString));
    qry_SQL.SQL.Add('AND JobNo = '+QuotedStr(qry_BatchImages.FieldbyName('JobNo').asString));
    qry_SQL.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionId));
    qry_SQL.ExecSQL;
//-------
    EndDate := frm_Main.GetServTimeNow;
//-------
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT ActionDescr FROM Actions WHERE [SysType] = ''A''');
    qry_SQL.Open;
    DBADescr := trim(qry_SQL.FieldbyName('ActionDescr').AsString);
//-------
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('SELECT * FROM BatchAllocRes');
    qry_SQL.SQL.Add('WHERE JobNo = '+QuotedStr(qry_BatchImages.FieldbyName('JobNo').AsString));
    qry_SQL.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionId));
    qry_SQL.SQL.Add('AND BatchNo = '+QuotedStr(qry_BatchImages.FieldbyName('BatchNo').AsString));
    qry_SQL.SQL.Add('AND ActType = ''A''');
    qry_SQL.Open;
    If qry_SQL.IsEmpty Then
      begin
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('INSERT INTO BatchAllocRes (Operator, BatchNo, JobNo, Region, DateAlloc, ResAction, ActType, Startdate, EndDate, Completed)');
        qry_SQL.SQL.Add('VALUES (:Operator, :BatchNo, :JobNo, :Region, GetDate(), :ResAction, :ActType, :Startdate, :EndDate, 1)');
        qry_SQL.Parameters.ParamValues['Operator'] := frm_Main.sOperator;
        qry_SQL.Parameters.ParamValues['BatchNo'] := trim(qry_BatchImages.FieldbyName('BatchNo').AsString);
        qry_SQL.Parameters.ParamValues['JobNo'] := trim(qry_BatchImages.FieldbyName('JobNo').AsString);
        qry_SQL.Parameters.ParamValues['Region'] := frm_Main.sRegionId;
        qry_SQL.Parameters.ParamValues['ResAction'] := DBADescr;
        qry_SQL.Parameters.ParamValues['ActType'] := 'A';
        qry_SQL.Parameters.ParamValues['StartDate'] := StartDate;
        qry_SQL.Parameters.ParamValues['EndDate'] := EndDate;
        qry_SQL.ExecSQL;
      end
    else
      begin
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('UPDATE BatchAllocRes SET');
        qry_SQL.SQL.Add('  Operator = :Operator,');
        qry_SQL.SQL.Add('  StartDate = :StartDate,');
        qry_SQL.SQL.Add('  EndDate = :EndDate');
        qry_SQL.SQL.Add('WHERE JobNo = '+QuotedStr(qry_BatchImages.FieldbyName('JobNo').AsString));
        qry_SQL.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionId));
        qry_SQL.SQL.Add('AND BatchNo = '+QuotedStr(qry_BatchImages.FieldbyName('BatchNo').AsString));
        qry_SQL.SQL.Add('AND ActType = ''A''');
        qry_SQL.Parameters.ParamValues['Operator'] := frm_Main.sOperator;
        qry_SQL.Parameters.ParamValues['StartDate'] := StartDate;
        qry_SQL.Parameters.ParamValues['EndDate'] := EndDate;
        qry_SQL.ExecSQL;
      end;
//-------
    frm_Main.CompleteBatchDBA(qry_BatchImages.FieldbyName('BatchNo').asString,
                              qry_BatchImages.FieldbyName('JobNo').asString,
                              frm_Main.sRegionId);
//-------
//Remove TempDir if it was created
//-------
If  DirectoryExists('c:\TempImg\') Then
    RemoveDir('c:\TempImg\');
//-------
    cursor := crDefault;
    Application.ModalFinished;
    frm_Exportdata.Enabled := true;
    ProgressBar.Visible := false;
    pnl_Processing.Visible := false;
    Messagedlg('Finished exporting!!', mtInformation, [mbOK], 0);
    btn_FilterClick(Self);
  finally
    qry_SQL.Close;
    qry_ExpDefs.Close;
    cursor := crDefault;
    ProgressBar.Visible := false;
    pnl_Processing.Visible := false;
    Application.ModalFinished;
    frm_Exportdata.Enabled := true;
  end;
end;

procedure Tfrm_ExportData.ExportCSV(Filename, Qualifier, Delimiter, RenImageTo :String;  ADODataset: TADOQuery; pdfConv :Boolean);
var
  CSVFile :TextFile;
  sPos,i  :integer;
  TempStr :String;
  ImageName  :String;
  Folder     :String;
  ExportPath :String;
begin
//  sFileName := ExportPath+Filename+'.CSV';
  ExportPath := ExtractFilePath(Filename);

  AssignFile(CSVFile, FileName);
  ReWrite(CSVFile);
//-----Details-----------
  With ADODataset Do
    begin
      First;
      DisableControls;
      While not EOF Do
        begin
          Application.ProcessMessages;
          TempStr  := '';
          For i := 0 to ADODataset.FieldCount-1 Do
            begin
              If (Fields[i].DataType = ftString) Then
                begin
                //-------------------------------------------------------------->>
                  If Fields[i].FieldName = 'FileNameLink' Then
                    begin
                      ImageName := trim(Fields[i].AsString);
//                      if Fields.FieldByName('ImageData').Value <> '' then  //ie out of dbase, so extracted to temp imagefile
//                          Folder :=  'c:\tempimg\'
//                      else
                          Folder :=  ExtractFilePath(ImageName);
                      ImageName := ExtractFileName(ImageName);
//------------------------------------------------------------------------------
//14032007 -- if pdf flag, then rename filename to .pdf
//Assumption is that the conversion has taken place
//------------------------------------------------------------------------------
                      if pdfConv then
                      begin
                       if pos('.pdf',Imagename) = 0 then
                       begin
                          sPos := pos('.',ImageName);
                          if sPos > 0 then
                          begin
                              ImageName := copy(ImageName,1,sPos-1);
                              ImageName := ImageName+'.pdf';
                          end;
                       end; //if not already a pdf
                      end;
//------------------------------------------------------------------------------
                      If RenImageTo <> '' Then
                        begin
                          ImageName := FieldbyName(RenImageTo).AsString+ExtractFileExt(ImageName);
                          TempStr := TempStr + Qualifier+ExportPath+ImageName+Qualifier+Delimiter;
                        end
                      else
                        begin
//                          TempStr := TempStr + Qualifier+Folder+ImageName+Qualifier+Delimiter;
//------------------------------------------------------------------------------
//11082008 -- Get Export Path Correct
                          TempStr := TempStr + Qualifier+ExportPath+ImageName+Qualifier+Delimiter;
//------------------------------------------------------------------------------
                        end;
                    end
                    else
                    if (uppercase(Fields[i].FieldName)  <> 'IMGFOLDER')
//                    AND (uppercase(Fields[i].FieldName)  <> 'IMAGEDATA')
                    Then //Treat as normal  04042005
                      TempStr := TempStr + Qualifier+Fields[i].AsString+Qualifier+Delimiter
                end  //IF Fields[i].DataType = ftString) Then
                //-------------------------------------------------------------->>
              else
//              IF (uppercase(Fields[i].FieldName)  <> 'IMAGEDATA') THEN
                TempStr := TempStr + Fields[i].AsString+Delimiter;
            end;
          System.Delete(TempStr, length(TempStr), 1);
          Writeln(CSVFile,TempStr);
          Next;
        end;
      First;
      EnableControls;
    end;
  CloseFile(CSVFile);
end;

procedure Tfrm_ExportData.ExportKodak(BatchNo, ExportPath :String;  ADODataset: TADOQuery);
var
  CSVFile :TextFile;
  i  :integer;
  FileName :string;
  TempStr :String;
  ImageName  :String;
begin
  FileName := ExportPath+'Index.dat';
  AssignFile(CSVFile, FileName);
  ReWrite(CSVFile);
//-----Details-----------
  With ADODataset Do
    begin
      First;
      DisableControls;
      While not EOF Do
        begin
          Application.ProcessMessages;
          TempStr  := '"I04t";"01";';
          ImageName := ExtractFilePath(trim(FieldbyName('FileNameLink').AsString));
          TempStr  := TempStr + '"'+ImageName+'";"0000000001";';
          For i := 0 to FieldCount-1 Do
            begin
              If Fields[i].FieldName <> 'FileNameLink' Then
                TempStr := TempStr + '"'+Fields[i].AsString+'";'
            end;
          System.Delete(TempStr, length(TempStr), 1);
          Writeln(CSVFile,TempStr);
          Next;
        end;
      First;
      EnableControls;
    end;
  CloseFile(CSVFile);
end;
//-----------------------------------
//Convert to PDF if Flag is set
//-----------------------------------
procedure Tfrm_ExportData.ExportImages(BatchNo, ExportPath, RenImageTo,csvFileName :String;  ADODataset: TADOQuery;pdfConv,SplitImages :Boolean);
function GetTempDir :String;
Var
  a    :array[0..255] of Char;
begin
  IF GetTempPath(sizeof(a), a) <> 0 Then
    begin
      Result := StrPas(a);
      If copy(Result, length(Result), 1) <> '\' Then
        Result := Result + '\';
    end
  else Result := 'Error';
end;

var
  TmpFileName   :String;
  ImagePath     :String;
  ImageName     :String;
  RenImageName  :String;
  OrigFileName  :String;
  CT,CI         :TVarData;
  Source, Destination:TStream;
  sPos,TotalPages    :Integer;
  sTemp,sTempPath :String;
  i,sRecs :integer;
  CSVFile :TextFile;
begin
fileList.Items.Clear;                 //Clear SplitImage list
sTempPath := 'c:\TempImg\';
  CT.VType := varSmallInt;
  CI.VType := varSmallInt;
  CT.VSmallInt := 6;       //6
  CI.VSmallInt := 1024;    //4096
//------
  With ADODataset Do
    begin
    sRecs := AdoDataset.RecordCount;
//========================First Delete all the files that will be created=======
//========================This because of append to images======================
      First;
      DisableControls;
      ProgressBar.Visible := true;
      Progressbar.Max:= sRecs;
      Progressbar.Step:= 1;
      ProgressBar.Min:= 0;
      ProgressBar.Position:= 0;
      ProgressBar.Show;
      While not EOF Do
        begin
          Application.ProcessMessages;
          ImageName := '';  //11072007
//--------------
//24072007
{
          If trim(FieldbyName('ImgFolder').asString) <> '' Then
            begin
              ImagePath := trim(FieldbyName('ImgFolder').asString);
              If copy(ImagePath, length(ImagePath), 1) <> '\' Then
                ImagePath := ImagePath + '\';
            end
          else
}
          ImagePath := ExportPath;
//--------------
          ImageName := ExtractFileName(trim(FieldbyName('FileNameLink').AsString));
//------------------------------------------------------------------------------
//14032007 -- if pdf flag, then rename filename to .pdf
//Assumption is that the conversion has taken place
//------------------------------------------------------------------------------
                      if pdfConv then
                      begin
                       if pos('.pdf',Imagename) = 0 then
                       begin
                          sPos := pos('.',ImageName);
                          if sPos > 0 then
                          begin
                              ImageName := copy(ImageName,1,sPos-1);
                              ImageName := ImageName+'.pdf';
                          end;
                       end; //if not already a pdf
                      end;
//------------------------------------------------------------------------------

//-----------
          If RenImageTo <> '' Then
            begin
              ImageName := trim(ADODataset.FieldbyName(RenImageTo).AsString)+ExtractFileExt(ImageName);
            end;
            //--------------
          ImageName := ImagePath+ImageName;
//--------------
          If FileExists(ImageName) Then
            DeleteFile(ImageName);
//------------
//------------------------------------------------------------------------------
          ProgressBar.StepIt;
          Application.ProcessMessages;
          Next;
        end;
//-=============================================================================
//========================NowExport=============================================
      First;
      DisableControls;
      ProgressBar.Visible := true;
      Progressbar.Max:= sRecs;
      Progressbar.Step:= 1;
      ProgressBar.Min:= 0;
      ProgressBar.Position:= 0;
      ProgressBar.Show;
      While not EOF Do
        begin
          Application.ProcessMessages;
           ImageName := '';
//--------------
{
          If trim(FieldbyName('ImgFolder').asString) <> '' Then         //ie, image is in a folder
            begin
              ImagePath := trim(FieldbyName('ImgFolder').asString);
              If copy(ImagePath, length(ImagePath), 1) <> '\' Then
                ImagePath := ImagePath + '\';
            end
            else
}
            ImagePath := ExportPath;
//--------------
            ImageName := ExtractFileName(trim(FieldbyName('FileNameLink').AsString));
//------------------------------------------------------------------------------
//14032007 -- if pdf flag, then rename filename to .pdf
//Assumption is that the conversion has taken place
//------------------------------------------------------------------------------
            if pdfConv then
            begin
             if pos('.pdf',Imagename) = 0 then
             begin
                sPos := pos('.',ImageName);
                if sPos > 0 then
                begin
                    ImageName := copy(ImageName,1,sPos-1);
                    ImageName := ImageName+'.pdf';
                end;
             end; //if not already a pdf
            end;
//------------------------------------------------------------------------------
//This is Causing the Problem
//ReNamed, so cannot get the Source
//------------------------------------------------------------------------------
{
            If RenImageTo <> '' Then
            begin
              RenImageName := ADODataset.FieldbyName(RenImageTo).AsString+ExtractFileExt(ImageName);
            end;
}            

//------------------------------------------------------------------------------
//Create Extract folder if it does not exist
//------------------------------------------------------------------------------
          ImageName := ImagePath+ImageName;
          If not DirectoryExists(ExtractFilePAth(ImageName)) Then
            If not CreateFolder(ExtractFilePAth(ImageName)) Then
              raise Exception.Create('Cannot create Folder "'+ExtractFilePAth(ImageName)+'".');
//------------------------------------------------------------------------------
          qry_Image.Close;
          qry_Image.SQL.Clear;
          qry_Image.SQL.Add('SELECT ImageData FROM NonMOPSFiles');
          qry_Image.SQL.Add('WHERE BatchNo = '+QuotedStr(trim(BatchNo)));
          qry_Image.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionId));
          qry_Image.SQL.Add('AND FilenameLink = '+QuotedStr(trim(FieldbyName('FileNameLink').AsString)));
          qry_Image.Open;
//------------------------------------------------------------------------------
//ie, image stored in dbase, needs to be converted/merged as required
//Converted/Merged images now stored in c:\
//Converted/Processed Images will now be in
//c:\TempImg
//sTempPath := 'c:\TempImg\';

//------------------------------------------------------------------------------
          If qry_Image.FieldbyName('ImageData').Value <> '' Then    //
            begin
              If (not FileExists(ImageName))or       //if the file does not exist in destination or filename is tiff, then copy over
                 ((UpperCase(ExtractFileExt(ImageName)) <> '.TIF')AND(UpperCase(ExtractFileExt(ImageName)) <> '.TIFF'))Then
                begin
//                  TBlobField(qry_Image.FieldbyName('ImageData')).SaveToFile(ImageName);
//Exists in Temp imageDirectory
//03042007

                    if FileExists(sTempPath+extractFileName(ImageName)) then   //test that the source file exists, copy if true
                    begin
                              Source := TFileStream.Create(sTempPath+extractFileName(ImageName), fmOpenRead);
                              try
                              //------------------------------
                              //09072007
                              //------------------------------
                                If RenImageTo <> '' Then
                                begin
                                  ImageName := ADODataset.FieldbyName(RenImageTo).AsString+ExtractFileExt(ImageName);
                                end;
                              //------------------------------
                                Destination := TFileStream.Create(ImageName, fmCreate);
                                try
                                  Destination.CopyFrom(Source,Source.Size);
                                finally
                                  Destination.Free;
                                end;
                                  if splitImages and (pos('.TIF',uppercase(imageName))>0) then        //01072008
                                  begin
                                      img.SplitCompoundTiff(ImageName);
                                      origFileName := ImageName;
                                      if FileExists(ImageName) then
                                          DeleteFile(ImageName);
                                  end;
                              finally
                                Source.Free
                              end;
                    end;

                end   //(not FileExists(ImageName))or
              else      //Exists in Dir, so add to the existing file
                begin
{ 14052007
                  TmpFileName := GetTempDir+ExtractFileName(ImageName);
                  TBlobField(qry_Image.FieldbyName('ImageData')).SaveToFile(TmpFileName);
                  ImgAdmin.Image := TmpFileName;
                  If ImgAdmin.VerifyImage(0) Then
                    begin
                      TotalPages := ImgAdmin.PageCount;
                      ImgAdmin.Image := ImageName;
                      ImgAdmin.Append(TmpFileName, 1, TotalPages);
                    end;
                  ImgAdmin.Image := '';
                  DeleteFile(TmpFileName);
14052007}
                  TmpFileName := GetTempDir+ExtractFileName(ImageName);
                  TBlobField(qry_Image.FieldbyName('ImageData')).SaveToFile(TmpFileName); //extract to dir as temp
                  sTemp := ImageName+','+TmpFileName;
                  Img.MergeTiffs(sTemp,ImageName);
                  DeleteFile(TmpFileName);
//-------------------------14052007---------------------------------------------
              end;  //if file not exists or is not tiff/tif
          end     //if Image is in DBase
//------------------------------------------------------------------------------
          else
//------------------------------------------------------------------------------
//Assumption Image is in the Export Directory,
//So copy over to new folder if flag is set
//------------------------------------------------------------------------------
          begin
{
              If (not FileExists(ImageName)) or      //Does the file exist in the Source, or is  the ext diff
              If (not FileExists(ImageName)) or      //Does the file exist in the Source, or is  the ext diff
                 ((UpperCase(ExtractFileExt(ImageName)) <> '.TIF')AND(UpperCase(ExtractFileExt(ImageName)) <> '.TIFF'))Then
}

              If (not FileExists(ImageName)) or      //Does the file exist in the Source, or is  the ext diff
                  (not FileExists(ImageName)) or      //Does the file exist in the Source, or is  the ext diff
                 ((UpperCase(ExtractFileExt(ImageName)) <> '.TIF')AND(UpperCase(ExtractFileExt(ImageName)) <> '.TIFF'))
                 Then
                begin
                  if pdfConv then
                  begin
                    TmpFileName  := trim(FieldbyName('FileNameLink').AsString);
                    if pos('.TIFF',uppercase(TmpFileName)) > 0 then
                      tmpFileName := StringReplace(TmpFileName,'.tiff','.pdf',[rfReplaceAll, rfIgnoreCase])
                    else
                      if pos('.TIF',uppercase(TmpFileName)) > 0 then
                        tmpFileName := StringReplace(TmpFileName,'.tif','.pdf',[rfReplaceAll, rfIgnoreCase]);
//------------------------------------------------------
                    if FileExists(tmpFileName) then   //test that the source file exists, copy if true
                    begin
                              Source := TFileStream.Create(TmpFileName, fmOpenRead);
                              try
                              //------------------------------
                              //09072007
                              //------------------------------
                                If RenImageTo <> '' Then
                                begin
                                  ImageName := ADODataset.FieldbyName(RenImageTo).AsString+ExtractFileExt(ImageName);
                                end;
                              //------------------------------

                                Destination := TFileStream.Create(ImageName, fmCreate);
                                try
                                  Destination.CopyFrom(Source,Source.Size);
                                finally
                                  Destination.Free;
                                end;
                                  if splitImages and (pos('.TIF',uppercase(imageName))>0) then        //01072008
                                  begin
                                      img.SplitCompoundTiff(ImageName);
                                      origFileName := ImageName;
                                      if FileExists(ImageName) then
                                          DeleteFile(ImageName);
                                  end;
                              finally
                                Source.Free
                              end;
                    end;
                    //------------------------------------------------------

                  end     //Not PdfConvert, so use stored source filelink
                  else
                  begin
                  //What if it has been combined, it cant use the old file, must use the new
                  //compond file name
                    Source := TFileStream.Create(trim(FieldbyName('FileNameLink').AsString), fmOpenRead);
//------------------------------------------------------------------------------

                    try
                      //------------------------------
                      //09072007
                      //------------------------------
                        If RenImageTo <> '' Then
                        begin
                          ImageName := trim(ADODataset.FieldbyName(RenImageTo).AsString)+ExtractFileExt(ImageName);
                        end;
                      //------------------------------
                      Destination := TFileStream.Create(ImageName, fmCreate);
                      try
                        Destination.CopyFrom(Source,Source.Size);
                      finally
                        Destination.Free;
                      end;
                        if splitImages and (pos('.TIF',uppercase(imageName))>0) then        //01072008
                        begin
                            img.SplitCompoundTiff(ImageName);
                            origFileName := ImageName;
                            if FileExists(ImageName) then
                                DeleteFile(ImageName);
                        end;
                    finally
                      Source.Free
                    end;
                  end;   //PDF Convert Check
//------------------------------------------->>
                end
//------------------------------------------------------------------------------
//???
//------------------------------------------------------------------------------
              else
                begin
{ 14052007
                  TmpFileName := trim(FieldbyName('FileNameLink').AsString);
                  ImgAdmin.Image := TmpFileName;
                  If ImgAdmin.VerifyImage(0) Then
                    begin
                      TotalPages := ImgAdmin.PageCount;

                      ImgAdmin.Image := ImageName;
                      ImgAdmin.Append(TmpFileName, 1, TotalPages);
                    end;
                  ImgAdmin.Image := '';
14052007 }
                  TmpFileName := trim(FieldbyName('FileNameLink').AsString);
                  sTemp := ImageName+','+TmpFileName;
//                  Img.MergeTiffs(sTemp,ImageName);    //24072007
//-------------------------14052007---------------------------------------------
                end;
            end;
//------------------------------------------------------------------------------
          ProgressBar.StepIt;
          Application.ProcessMessages;
//------------------------------------------------------------------------------
//Re-Build Image File
//------------------------------------------------------------------------------
          if splitImages then
            AddImage(exportPath,csvFileName,origFileName);
          Next;
        end;
//-=============================================================================
      First;
      ProgressBar.Visible := False;
      EnableControls;
    end;
  qry_Image.Close;
//------------------------------------------------
//07072008
//------------------------------------------------
//If splitImages, then Re-Build CSV FIle
if splitImages then
begin
{
  AssignFile(CSVFile, exportPath+'test.txt');
  ReWrite(CSVFile);
  for i := 0 to fileList.Items.Count - 1 do
      Writeln(CSVFile,fileList.Items[i]);
  CloseFile(CSVFile);
}
  mergeSplitImages(csvFileName);
end;
//------------------------------------------------
end;
//------------------------------------------------------------------------------
//Live Version dated 11052007
//------------------------------------------------------------------------------
{

procedure Tfrm_ExportData.ExportImages(BatchNo, ExportPath, RenImageTo :String;  ADODataset: TADOQuery);
function GetTempDir :String;
Var
  a    :array[0..255] of Char;
begin
  IF GetTempPath(sizeof(a), a) <> 0 Then
    begin
      Result := StrPas(a);
      If copy(Result, length(Result), 1) <> '\' Then
        Result := Result + '\';
    end
  else Result := 'Error';
end;


var
  TmpFileName   :String;
  ImagePath     :String;
  ImageName     :String;
  CT,CI         :TVarData;
  Source, Destination:TStream;
  TotalPages    :Integer;

begin
  CT.VType := varSmallInt;
  CI.VType := varSmallInt;
  CT.VSmallInt := 6;       //6
  CI.VSmallInt := 1024;    //4096
//------
  With ADODataset Do
    begin
//========================First Delete all the files that will be created=======
//========================This because of append to images======================
      First;
      DisableControls;
      While not EOF Do
        begin
//--------------
          If trim(FieldbyName('ImgFolder').asString) <> '' Then
            begin
              ImagePath := trim(FieldbyName('ImgFolder').asString);
              If copy(ImagePath, length(ImagePath), 1) <> '\' Then
                ImagePath := ImagePath + '\';
            end
          else ImagePath := ExportPath;
//--------------
          ImageName := ExtractFileName(trim(FieldbyName('FileNameLink').AsString));
//-----------
          If RenImageTo <> '' Then
            begin
              ImageName := ADODataset.FieldbyName(RenImageTo).AsString+ExtractFileExt(ImageName);
            end;
            //--------------
          ImageName := ImagePath+ImageName;
//--------------
          If FileExists(ImageName) Then
            DeleteFile(ImageName);
//------------
          Next;
        end;
//-=============================================================================
//========================NowExport=============================================
      First;
      DisableControls;
      While not EOF Do
        begin
//--------------
          If trim(FieldbyName('ImgFolder').asString) <> '' Then
            begin
              ImagePath := trim(FieldbyName('ImgFolder').asString);
              If copy(ImagePath, length(ImagePath), 1) <> '\' Then
                ImagePath := ImagePath + '\';
            end
          else ImagePath := ExportPath;
//--------------
          ImageName := ExtractFileName(trim(FieldbyName('FileNameLink').AsString));
//-----------
          If RenImageTo <> '' Then
            begin
              ImageName := ADODataset.FieldbyName(RenImageTo).AsString+ExtractFileExt(ImageName);
            end;
            //--------------
          ImageName := ImagePath+ImageName;
//--------------
          If not DirectoryExists(ExtractFilePAth(ImageName)) Then
            If not CreateFolder(ExtractFilePAth(ImageName)) Then
              raise Exception.Create('Cannot create Folder "'+ExtractFilePAth(ImageName)+'".');
//--------------
          qry_Image.Close;
          qry_Image.SQL.Clear;
          qry_Image.SQL.Add('SELECT ImageData FROM NonMOPSFiles');
          qry_Image.SQL.Add('WHERE BatchNo = '+QuotedStr(trim(BatchNo)));
          qry_Image.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionId));
          qry_Image.SQL.Add('AND FilenameLink = '+QuotedStr(trim(FieldbyName('FileNameLink').AsString)));
          qry_Image.Open;
//------------
          If qry_Image.FieldbyName('ImageData').Value <> '' Then
            begin
              If (not FileExists(ImageName))or
                 ((UpperCase(ExtractFileExt(ImageName)) <> '.TIF')AND(UpperCase(ExtractFileExt(ImageName)) <> '.TIFF'))Then
                begin
                  TBlobField(qry_Image.FieldbyName('ImageData')).SaveToFile(ImageName);
                end
              else
                begin
                  TmpFileName := GetTempDir+ExtractFileName(ImageName);
                  TBlobField(qry_Image.FieldbyName('ImageData')).SaveToFile(TmpFileName);
                  ImgAdmin.Image := TmpFileName;
                  If ImgAdmin.VerifyImage(0) Then
                    begin
                      TotalPages := ImgAdmin.PageCount;

                      ImgAdmin.Image := ImageName;
                      ImgAdmin.Append(TmpFileName, 1, TotalPages);
                    end;

                  ImgAdmin.Image := '';

                  DeleteFile(TmpFileName);
                end;
            end
          else
            begin
              If (not FileExists(ImageName)) or
                 ((UpperCase(ExtractFileExt(ImageName)) <> '.TIF')AND(UpperCase(ExtractFileExt(ImageName)) <> '.TIFF'))Then
                begin
                  Source := TFileStream.Create(trim(FieldbyName('FileNameLink').AsString), fmOpenRead);
                  try
                    Destination := TFileStream.Create(ImageName, fmCreate);
                    try
                      Destination.CopyFrom(Source,Source.Size);
                    finally
                      Destination.Free;
                    end;
                  finally
                    Source.Free
                  end;
                end
              else
                begin
                  TmpFileName := trim(FieldbyName('FileNameLink').AsString);
                  ImgAdmin.Image := TmpFileName;
                  If ImgAdmin.VerifyImage(0) Then
                    begin
                      TotalPages := ImgAdmin.PageCount;

                      ImgAdmin.Image := ImageName;
                      ImgAdmin.Append(TmpFileName, 1, TotalPages);
                    end;

                  ImgAdmin.Image := '';
                end;
            end;
//------------
          Next;
        end;
//-=============================================================================
      First;
      EnableControls;
    end;
  qry_Image.Close;
end;

}

procedure Tfrm_ExportData.GenAlchemyFile(BatchNo, ExportPath, DocTitle :String;  ADODataset,ExpDefs: TADOQuery;pdfConv :Boolean);
var
  AlchFile :TextFile;
  sTemp,FileName :string;
  i,z             :Integer;
  DocIndex,sIndex   :Integer;
  NoOptions :Boolean;
begin
  DocIndex := 0;
  if pos('.DEF',uppercase(ExportPath)) = 0  then
    FileName := ExportPath+'.DEF'
  else
    FileName := ExportPath;

  AssignFile(AlchFile, FileName);

{ -- Pre Revisions, 01062007 --------->>
  TRY
    Rewrite(AlchFile);
    Writeln(AlchFile, '// DEF File Created by MetroProcessing, '+DateTimetoStr(Now));
    Writeln(AlchFile, '// Copyright (c) 2003');
    Writeln(AlchFile, '// Metrofile');
    Writeln(AlchFile, 'debug = on');
    Writeln(AlchFile, 'Line_Delimiter = ","');
    Writeln(AlchFile, 'Record_Delimiter("\r\n",Between)');
    With ADODataset Do
      begin
        If DocTitle <> '' Then
          DocIndex := Fields.IndexOf(FieldbyName(DocTitle));
        For i := 0 to FieldCount-1 Do
          begin
            If Fields[i].FieldName = 'FileNameLink' Then
              Writeln(AlchFile, 'Field(File, Lines('+InttoStr(i+1)+'))')
            else Writeln(AlchFile, 'Field("'+Fields[i].FieldName+'", Lines('+InttoStr(i+1)+'))');
            If DocTitle <> '' Then
              If DocIndex <> -1 Then
                Writeln(AlchFile, 'Field("Document Title", Lines('+InttoStr(DocIndex)+'))')
          end;
      end;
    finally
      CloseFile(AlchFile);
    end;

exit;
}
//---------------------------------------
//Revised ExportDefs File, 05062007
//ExpDefs is  the ExportDefs DataSet
//---------------------------------------
TRY
With ExpDefs do
begin
  for i  := 1 to 16 do    //Test If Any Options Selected
    begin
      if (FieldByname('AlchTrim'+IntToStr(i)).AsBoolean) or
         (length(trim(FieldByname('AlchPref'+IntToStr(i)).AsString))  > 0)
        then
        begin
          NoOptions := True;
          break;          //ie an option found so exit with options = true
        end
        else
          NoOptions := false;

    end;
end;

    Rewrite(AlchFile);
    Writeln(AlchFile, '// DEF File Created by MetroProcessing, '+DateTimetoStr(Now));
    Writeln(AlchFile, '// Copyright (c) 2003');
    Writeln(AlchFile, '// Metrofile');
    Writeln(AlchFile, '');
    Writeln(AlchFile, 'debug = on');
    Writeln(AlchFile, 'Line_Delimiter = ","');
    Writeln(AlchFile, 'Record_Delimiter("\r\n",Between)');
    Writeln(AlchFile, '');
//-----------------------

    With ADODataset Do
      begin
        If DocTitle <> '' Then
          DocIndex := Fields.IndexOf(FieldbyName(DocTitle));
        For z := 1 to 16 Do      //what about additional columns
          begin
          if length(Trim(ExpDefs.FieldByname('AlchCap'+IntToStr(Z)).AsString)) = 0 then
            break; //end of processing
            if uppercase(Trim(ExpDefs.FieldByname('AlchCap'+IntToStr(Z)).AsString)) = '{FILENAME}' then
                i := Fields.IndexOf(FieldbyName('FileNameLink'))
             else
              i := Fields.IndexOf(FieldbyName(Trim(ExpDefs.FieldByname('AlchCap'+IntToStr(Z)).AsString)));
            If Fields[i].FieldName <> 'ImgFolder' then
            begin
            //FileNameLink -- {FileName} etc
//------------------------------------------------------------------------------
                  If Fields[i].FieldName = 'FileNameLink' Then
                  begin
                    sTemp := '';
//                    Writeln(AlchFile, 'Field(File, Lines('+InttoStr(i+1)+'))')
                    if (not ExpDefs.FieldByname('AlchTrim'+IntToStr(z)).AsBoolean) then  //No Trim
                       sTemp := 'Field(File, Columns('+InttoStr(i+1)+',End),Lines('+InttoStr(i+1)+'))'
                    else
                    begin
                       sTemp := 'Field(File, Columns('+InttoStr(i+1)+',End),Lines('+InttoStr(i+1)+'),';
                       Writeln(AlchFile, sTemp);
                       sTemp := 'Trim_ws = Bounding)';
                    end;
                    Writeln(AlchFile, sTemp);
                  end
                  else
//---------->>
                    if not NoOptions then      //No Options Selected
                    begin
//                      Writeln(AlchFile, 'Field("'+Fields[i].FieldName+'", Lines('+InttoStr(i+1)+'))')
//                      Writeln(AlchFile, 'Field("'+Trim(ExpDefs.FieldByname('AlchFld'+IntToStr(i+1)).AsString)+'", Lines('+InttoStr(i+1)+'))')
                      sIndex := Fields.IndexOf(FieldbyName(Trim(ExpDefs.FieldByname('AlchCap'+IntToStr(z)).AsString)));
                      Writeln(AlchFile, 'Field("'+Trim(ExpDefs.FieldByname('AlchFld'+IntToStr(z)).AsString)+'", Lines('+InttoStr(sIndex)+'))')
                    end
                    else
                    begin   //Apply options
                      sIndex := Fields.IndexOf(FieldbyName(Trim(ExpDefs.FieldByname('AlchCap'+IntToStr(z)).AsString)));
                      sTemp := '';
                      if (not ExpDefs.FieldByname('AlchTrim'+IntToStr(z)).AsBoolean) then  //No Trim
                      begin
                        if (length(Trim(ExpDefs.FieldByname('AlchPref'+IntToStr(z)).AsString)) > 0) then   //ie prefix, no trim
                        begin
                          sTemp := '';
                          sTemp := 'Field("'+Fields[i].FieldName+'", Lines('+InttoStr(sIndex)+'),';
                          Writeln(AlchFile, sTemp);
                          sTemp := 'Prefix_Field = "'+Trim(ExpDefs.FieldByname('AlchPref'+IntToStr(z)).AsString)+'")';
                        end
                        else
                          sTemp := 'Field("'+Trim(ExpDefs.FieldByname('AlchFld'+IntToStr(z)).AsString)+'", Lines('+InttoStr(sIndex)+')';
                      end
                      else    //Trimming, Selected
//------------------------------
                      begin
                        if (length(Trim(ExpDefs.FieldByname('AlchPref'+IntToStr(z)).AsString)) > 0) then   //ie prefix, and trim
                        begin
                          sTemp := '';
                          sTemp := 'Field("'+Trim(ExpDefs.FieldByname('AlchFld'+IntToStr(z)).AsString)+'", Lines('+InttoStr(sIndex)+'),';
                          Writeln(AlchFile, sTemp);
                          sTemp := 'Prefix_Field = "'+Trim(ExpDefs.FieldByname('AlchPref'+IntToStr(z)).AsString)+'",';
                          Writeln(AlchFile, sTemp);
                          sTemp := 'Trim_ws = Bounding)';
                        end
                        else    //No Prefix, with trim
                        begin
//                          sTemp := 'Field("'+Fields[i].FieldName+'", Lines('+InttoStr(i+1)+'),';
                          sTemp := 'Field("'+Trim(ExpDefs.FieldByname('AlchFld'+IntToStr(z)).AsString)+'", Lines('+InttoStr(sIndex)+'),';
                          Writeln(AlchFile, sTemp);
                          sTemp := 'Trim_ws = Bounding)';
                        end;
                      end;
//--------------------------------
                      Writeln(AlchFile,sTemp);
                    end;
//---------->>
                  //-----------------------------------------------------
                  If DocTitle <> '' Then
                    If DocIndex <> -1 Then
                      Writeln(AlchFile, 'Field("Document Title", Lines('+InttoStr(DocIndex)+'))')
            end;  //not ImgFolder
          end;      //fieldcount
//Check SubFolder Options
//Check Create New Folder
  for i  := 1 to 16 do    //Test Create New Folder (Can Be Only One
  begin
      if (ExpDefs.FieldByname('AlchNF'+IntToStr(i)).AsBoolean) then
      begin
         sIndex := Fields.IndexOf(FieldbyName(Trim(ExpDefs.FieldByname('AlchCap'+IntToStr(i)).AsString)));
        if (not ExpDefs.FieldByname('AlchTrim'+IntToStr(i)).AsBoolean) then
          sTemp := 'Field(Folder,Lines('+InttoStr(sIndex)+'))'
        else
        begin
          sTemp := '';
          sTemp := 'Field(Folder,Lines('+InttoStr(sIndex)+'),';
          Writeln(AlchFile,sTemp);
          sTemp := 'Trim_ws = Bounding)';
        end;
        Writeln(AlchFile,sTemp);
        break;  //Can only be One
      end;
  end;
//Check Create Sub Folder
  for i  := 1 to 16 do    //Test Create New Folder (Can Be Only One)
  begin
      if (ExpDefs.FieldByname('AlchNSF'+IntToStr(i)).AsBoolean) then
      begin
         sIndex := Fields.IndexOf(FieldbyName(Trim(ExpDefs.FieldByname('AlchCap'+IntToStr(i)).AsString)));
        if (not ExpDefs.FieldByname('AlchTrim'+IntToStr(i)).AsBoolean) then
          sTemp := 'Field(SubFolder,Lines('+InttoStr(sIndex)+'))'
        else
        begin
          sTemp := '';
          sTemp := 'Field(SubFolder,Lines('+InttoStr(sIndex)+'),';
          Writeln(AlchFile,sTemp);
          sTemp := 'Trim_ws = Bounding)';
        end;
        Writeln(AlchFile,sTemp);
        break;  //Can only be One
      end;
  end;
end;      //with AdoDataSet
    finally
      CloseFile(AlchFile);
    end;
end;

function Tfrm_ExportData.CreateFolder(Folder :String):Boolean;
Var
  TempStr     :String;
  CrFolder    :String;
  FolList     :TStringList;
  J           :Integer;
begin
  FolList     := TStringList.Create;
  FolList.Clear;

  If copy(Folder, length(Folder), 1) = '\' Then
    Delete(Folder, length(Folder), 1);

  TempStr := Folder;

  For J := length(Folder) downto 1 Do
    begin
      If Folder[J] = '\' Then
        begin
          FolList.Append(TempStr);
          Delete(TempStr, J, 255);
        end;
    end;
  If TempStr <> '' Then
    FolList.Append(TempStr);

  Result := True;
  For J := FolList.Count-1 Downto 0 Do
    begin
      CrFolder := FolList.Strings[J];
      If not DirectoryExists(CrFolder) Then
        If Not CreateDir(CrFolder) Then
          Result := False;
    end;
end;



procedure Tfrm_ExportData.grd_ExportDataDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const
  // the integer value will return according to the boolean
  // value sent into this array
  CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,
                   DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  If TDBGrid(Sender).DataSource.DataSet.IsEmpty Then
    exit;
  If Column.Field = Nil Then
    exit;
  if Column.Field.Fieldname = 'ExpCompl' Then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    If Column.Field.asInteger = 1 Then
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle,
                       Rect,
                       DFC_BUTTON,
                       CtrlState[True])
    else
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle,
                       Rect,
                       DFC_BUTTON,
                       CtrlState[False])
  end;
end;

procedure Tfrm_ExportData.imgCreate(Sender: TObject);
begin
  img.SetVersionNo[frm_Main.sImageVersion];
end;

procedure Tfrm_ExportData.btn_FilterClick(Sender: TObject);
begin
{
  qry_BatchImages.Close;
  qry_BatchImages.SQL.Clear;
  qry_BatchImages.SQL.Add('SELECT 	s.JobNo,');
  qry_BatchImages.SQL.Add('         s.Code,');
  qry_BatchImages.SQL.Add('         s.Department,');
  qry_BatchImages.SQL.Add('         s.NonMOPS,');
  qry_BatchImages.SQL.Add('	        b.BatchNo,');
  qry_BatchImages.SQL.Add('	        b.Descr,');
  qry_BatchImages.SQL.Add('	        b.RecordType,');
  qry_BatchImages.SQL.Add('         b.ExpCompl');
  qry_BatchImages.SQL.Add('FROM Batches b, PackRequest s');
  qry_BatchImages.SQL.Add('WHERE s.JobNo = b.JobNo AND s.Region = b.Region');
  qry_BatchImages.SQL.Add('AND s.Region = '+QuotedStr(frm_Main.sRegionId));
  qry_BatchImages.SQL.Add('AND s.NonMOPS = 1');
  If edt_Code.Text <> '' Then
    qry_BatchImages.SQL.Add('AND s.Code = '+QuotedStr(edt_Code.Text));
  If edt_Dept.Text <> '' Then
    qry_BatchImages.SQL.Add('AND s.Department = '+QuotedStr(edt_Dept.Text));
  If rgrp_Filter.ItemIndex = 0 Then
    qry_BatchImages.SQL.Add('AND b.ExpCompl = 0')
  else qry_BatchImages.SQL.Add('AND b.ExpCompl = 1');
//------------------------------------------------------------
//Guy Change - 29032007
//------------------------------------------------------------
//--New Addition to call
  qry_BatchImages.SQL.Add('AND b.BatchNo in (SELECT BatchNo FROM NonMopsFiles f WHERE f.Region = s.Region)');
  qry_BatchImages.SQL.Add('AND b.BatchNo not in (SELECT BatchNo FROM NonMopsFiles f WHERE f.Region = s.Region and f.Captured = 0)');
//--New Addition to call
//------------------------------------------------------------
  qry_BatchImages.SQL.Add('ORDER BY s.CreateDate');
}
{end DEBUG-----}
qry_BatchImages.Close;
qry_BatchImages.SQL.Clear;
qry_BatchImages.SQL.Add('SELECT 	s.JobNo,');
qry_BatchImages.SQL.Add('s.Code,');
qry_BatchImages.SQL.Add('s.Department,');
qry_BatchImages.SQL.Add('s.NonMOPS,');
qry_BatchImages.SQL.Add('b.BatchNo,');
qry_BatchImages.SQL.Add('b.Descr,');
qry_BatchImages.SQL.Add('b.RecordType,');
qry_BatchImages.SQL.Add('b.ExpCompl');
qry_BatchImages.SQL.Add('FROM Batches b JOIN PackRequest s ON S.JOBNO = B.JOBNO AND S.REGION = B.REGION');
qry_BatchImages.SQL.Add('JOIN BATCHPROCESSES BP ON BP.BATCHNO = B.BATCHNO AND BP.SYSTYPE = ''D'' AND BP.COMPLETED = 1');
qry_BatchImages.SQL.Add('WHERE');
qry_BatchImages.SQL.Add('s.NonMOPS = 1');
  If edt_Code.Text <> '' Then
    qry_BatchImages.SQL.Add('AND s.Code = '+QuotedStr(edt_Code.Text));
  If edt_Dept.Text <> '' Then
    qry_BatchImages.SQL.Add('AND s.Department = '+QuotedStr(edt_Dept.Text));
  If rgrp_Filter.ItemIndex = 0 Then
    qry_BatchImages.SQL.Add('AND b.ExpCompl = 0')
  else qry_BatchImages.SQL.Add('AND b.ExpCompl = 1');
qry_BatchImages.SQL.Add('AND b.BatchNo in (SELECT BatchNo FROM NonMopsFiles f WHERE f.Region = s.Region)');
qry_BatchImages.SQL.Add('AND b.BatchNo not in (SELECT BatchNo FROM NonMopsFiles f WHERE f.Region = s.Region and f.Captured = 0)');
qry_BatchImages.SQL.Add('ORDER BY s.CreateDate');
{-----------}
//------------------------------------------------------------
  qry_BatchImages.Open;
  frm_Main.AutoSizeExistingColumns(grd_ExportData);
end;

procedure Tfrm_ExportData.btn_FindJobNoClick(Sender: TObject);
begin
  If not qry_BatchImages.Locate('BatchNo', edt_FindBatchNo.Text, [loCaseInsensitive]) Then
      MessageDLG('BatchNo not found.', mtInformation,[mbOK], 0);
end;

procedure Tfrm_ExportData.btn_GetCoCodeClick(Sender: TObject);
begin
  edt_Code.Text := '';
  edt_Dept.Text := '';
  if frm_GetCompany.Execute(False, True) = mrOK then
    begin
      edt_Code.Text := frm_GetCompany.CompanyCode;
      edt_Dept.SetFocus;
    end;
end;

procedure Tfrm_ExportData.btn_GetDeptClick(Sender: TObject);
begin
  If frm_GetDeptNM.Execute(edt_Code.Text) = mrOK Then
    begin
      edt_Dept.Text := frm_GetDeptNM.DeptCode;
    end;
end;

procedure Tfrm_ExportData.qry_BatchImagesCalcFields(DataSet: TDataSet);
begin
  try
    qry_Calc.Close;
    qry_Calc.SQL.Clear;
    qry_Calc.SQL.Add('SELECT COUNT(*) FROM NonMOPSFiles');
    qry_Calc.SQL.Add('WHERE BatchNo = '+QuotedStr(Dataset.FieldbyName('BATCHNO').AsString));
    qry_Calc.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionId));
    qry_Calc.Open;
    Dataset['TotalImages'] := qry_Calc.Fields[0].AsInteger;
    qry_Calc.Close;
    qry_Calc.SQL.Clear;
    qry_Calc.SQL.Add('SELECT COUNT(*) FROM NonMOPSFiles');
    qry_Calc.SQL.Add('WHERE BatchNo = '+QuotedStr(Dataset.FieldbyName('BATCHNO').AsString));
    qry_Calc.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionId));
    qry_Calc.SQL.Add('AND Captured = 1');
    qry_Calc.Open;
    Dataset['TotalCapturedImages'] := qry_Calc.Fields[0].AsInteger;
    qry_Calc.Close;
    qry_Calc.SQL.Clear;
    qry_Calc.SQL.Add('SELECT COUNT(*) FROM NonMOPSFiles');
    qry_Calc.SQL.Add('WHERE BatchNo = '+QuotedStr(Dataset.FieldbyName('BATCHNO').AsString));
    qry_Calc.SQL.Add('AND Region = '+QuotedStr(frm_Main.sRegionId));
    qry_Calc.SQL.Add('AND Captured = 0');
    qry_Calc.Open;
    Dataset['TotalOutstanding'] := qry_Calc.Fields[0].AsInteger;
  finally
    qry_Calc.Close;
  end;
end;

procedure Tfrm_ExportData.btn_ProcNotesClick(Sender: TObject);
begin
  frm_ViewProcNotes.Execute(qry_BatchImages.FieldByname('JobNo').AsString);
end;

//sImageName is the ImageName that has been split
//sPath is the Destination Path
//sFileName is the .csv export fileName
Procedure Tfrm_ExportData.AddImage(sPath,sFileName,sImageName :String);
  var
  Rec: TSearchRec;
  sFileMain :string;
  i,imgCount :integer;
begin
sFileMain := copy(sImageName,1,pos('.',sImageName)-1)+'_*.tif*';
  if FindFirst(sFileMain, faAnyFile,Rec) = 0 then
  repeat
     FileList.Items.Add(sImageName+','+Rec.Name);
  until FindNext(Rec) <> 0;
  FindClose(Rec);
end;
Procedure Tfrm_ExportData.mergeSplitImages(sFileName :String);
  var
  sFileMain :string;
  i,zT,imgCount,nPos :integer;
  sTemp,sSrchStr,sString1,sString2,sTemp2 :String;
  CSVFile :TextFile;
begin
//Load csvFile
//MergeImages
 mem_CSVList.Lines.Clear;
 listMergeSplit.Items.Clear;  //Temp Item List that must be added
 mem_CSVList.Lines.LoadFromFile(sFileName);
 if  mem_CSVList.Lines.Count = 0 then
    exit;       //Nothing to Do
//extractfilename(
for I := 0 to fileList.Count - 1 do      //Loop Through FileList
begin
  sSrchStr := extractfilename(copy(fileList.Items[i],1,pos(',',filelist.Items[i])-1));
  for zT := 0 to mem_CSVList.Lines.Count - 1 do
  begin
    npos := pos(sSrchStr,mem_CSVList.Lines[zT]);
    sTemp := '';
    sTemp := mem_CSVList.Lines[zT];  //Original DataLine
    if  nPos > 0 then  //Found
    begin
       if pos('##>>',mem_CSVList.Lines[zT]) = 0 then  //
         sString1 := copy(sTemp,1,npos-1)
       else
         sString1 := copy(sTemp,5,npos-5);
       sTemp2 := copy(sTemp,npos,500);
       sString2 := extractfilename(copy(fileList.Items[i],pos(',',fileList.Items[i])+1,500));
       if copy(sTemp2,pos(',',sTemp2)-1,1) = '"' then   //String enclosed in "
         sTemp2 := copy(sTemp2,pos(',',sTemp2)-1,500)
       else
         sTemp2 := copy(sTemp2,pos(',',sTemp2),500);
       sTemp := sString1+sString2+sTemp2;
       listMergeSplit.Items.Add(sTemp);
       if pos('##>>',mem_CSVList.Lines[zT]) = 0 then   //dont flag if already flagged
           mem_CSVList.Lines[zT] := '##>>'+mem_CSVList.Lines[zT];
    end;
  end;
end;
//Create New CSV File
  AssignFile(CSVFile,sFileName);
  ReWrite(CSVFile);
  for zT:= 0 to mem_CSVList.Lines.Count - 1 do
  begin
       if pos('##>>',mem_CSVList.Lines[zT]) = 0 then      //ie Exclude merged images
          WriteLn(CSVFile,mem_CSVList.Lines[zT]);
  end;
  //Now Add Split Images
  for zT := 0 to listMergeSplit.Items.Count - 1 do
          WriteLn(CSVFile,listMergeSplit.Items[zT]);
//-------------------------------------
  CloseFile(CSVFile);
end;
end.

{

}
