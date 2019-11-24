unit ImgCentre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, ImgList, ToolWin, ActnMan, ActnCtrls, StdActns,
  ActnList, XPStyleActnCtrls, ComCtrls, ExtCtrls, DB, ADODB, OleCtrls,
  IniFiles, framImageViewer, framHTMLViewer, StdCtrls, DBCtrls, Menus,
  framThumbnails, imageenio, Buttons, iemio, ieview, iemview,
  imageenview, iexBitmaps;

type
    PImgRec = ^TMyRec;
    TMyRec = record
      UserId   :String;
      TrxNo    :Integer;
      DocType  :String;
      DocName  :String;
    end;
    PUsrRec = ^TUsrRec;
    TUsrRec = record
      UserId   :String;
      Name     :String;
    end;

  Tfrm_ImageCentre = class(TForm)
    ImageList: TImageList;
    odlg_Pic: TOpenPictureDialog;
    qry_InBox: TADOQuery;
    qry_InBoxImages: TADOQuery;
    qry_UpdInBox: TADOQuery;
    qry_InsertImage: TADOQuery;
    dts_Images: TDataSource;
    qry_SQL: TADOQuery;
    ScrollBox1: TScrollBox;
    Splitter1: TSplitter;
    tvInBox: TTreeView;
    Panel1: TPanel;
    Splitter2: TSplitter;
    tvImages: TTreeView;
    pnl_ImgComment: TPanel;
    nav_ImageComments: TDBNavigator;
    db_Comments: TDBMemo;
    Panel2: TPanel;
    pm_Tree: TPopupMenu;
    DeleteImage1: TMenuItem;
    qry_eRecordImages: TADOQuery;
    Scroll_ImageViewer: TScrollBox;
    Panel3: TPanel;
    btn_Close: TSpeedButton;
    btn_SelFiles: TSpeedButton;
    btn_Scan: TSpeedButton;
    btn_ePending: TSpeedButton;
    btn_SelFolder: TSpeedButton;
    ImageList1: TImageList;
    chk_Preview: TCheckBox;
    ImageEnMView1: TImageEnMView;
    ImageEnView1: TImageEnView;
    RenameDocument1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BuildView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvInBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvImagesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvImagesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvInBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvImagesStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure act_ScanExecute(Sender: TObject);
    function GetTempDir :String;
    procedure tvImagesChange(Sender: TObject; Node: TTreeNode);
    procedure DeleteImage1Click(Sender: TObject);
    procedure tvInBoxChange(Sender: TObject; Node: TTreeNode);
    procedure KeyDownAbort(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SelFilesClick(Sender: TObject);
    procedure btn_ePendingClick(Sender: TObject);
    procedure btn_SelFolderClick(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
    procedure chk_PreviewClick(Sender: TObject);
    procedure RenameDocument1Click(Sender: TObject);
  private
    { Private declarations }
    CurrFileName    :String;
    SelectedUserId  :String;
    Procedure RefreshNode(Node : TTreeNode);
  public
    { Public declarations }
    procedure DisplayThumbnail(tImageNo  :Integer);
  end;

var
  frm_ImageCentre: Tfrm_ImageCentre;
  SourceNode :TTreeNode;

implementation

uses MetrofilerDataModule, main, eRecords, ePending, framRichEditViewer,
  AddImages, Progress, ScannerConfig;

{$R *.dfm}

procedure Tfrm_ImageCentre.FormCreate(Sender: TObject);
Var
  Node :TTreeNode;
begin
  BuildView;
  Node := tvImages.Items.GetFirstNode;
  If Node <> Nil Then
    Node.Selected := True;

  btn_ePending.Visible := frm_Console.AccessRight(12);
end;

procedure Tfrm_ImageCentre.BuildView;
var
  t    : String;
  Node :TTreeNode;
  UserDetPtr: PUsrRec;
begin
  tvInBox.Items.Clear;
//--------Add current User at the Top-------------------------------------------
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT');
  qry_SQL.SQL.Add('   COUNT(i.TrxNo) Tot');
  qry_SQL.SQL.Add('FROM');
  qry_SQL.SQL.Add('   eRecordImages i');
  qry_SQL.SQL.Add('WHERE');
  qry_SQL.SQL.Add('   i.UserID = :UserId AND');
  qry_SQL.SQL.Add('   (i.eRecNo IS NULL OR i.eRecNo = 0 OR i.RecStatus > 1)');
  qry_SQL.Parameters.ParamValues['UserId'] := User;
  qry_SQL.Open;

  New(UserDetPtr);
  UserDetPtr^.UserId := User;
  UserDetPtr^.Name := Trim(Firstname + ' ' + Surname);

  t :=  Trim(Firstname + ' ' + Surname) + ' ('+InttoStr(qry_SQL.FieldbyName('Tot').AsInteger)+')';
  Node := tvInBox.Items.AddObject(nil, t, UserDetPtr);
  Node.ImageIndex := 1;    //Display Image, Express Icon
  Node.SelectedIndex := 5;  //Selected Image
//--------
  If frm_Console.AccessImageCentreAdmin Then
    begin
      qry_InBox.Close;
      qry_InBox.SQL.Clear;
      qry_InBox.SQL.Add('SELECT');
      qry_InBox.SQL.Add('	*');
      qry_InBox.SQL.Add('FROM');
      qry_InBox.SQL.Add('	AuthCodes a');
      qry_InBox.SQL.Add('WHERE');
      qry_InBox.SQL.Add('	EXISTS (SELECT ');
      qry_InBox.SQL.Add('				b.UserId ');
      qry_InBox.SQL.Add('			FROM');
      qry_InBox.SQL.Add('				ImageCentreRts i ');
      qry_InBox.SQL.Add('				INNER JOIN AuthCodes b ON i.UserId = b.UserId');
      qry_InBox.SQL.Add('			WHERE ');
      qry_InBox.SQL.Add('				a.UserId = b.UserId AND');
      qry_InBox.SQL.Add('				EXISTS (SELECT ');
      qry_InBox.SQL.Add('							c.GroupId');
      qry_InBox.SQL.Add('						FROM ');
      qry_InBox.SQL.Add('							ImageCentreRts c');
      qry_InBox.SQL.Add('						WHERE');
      qry_InBox.SQL.Add('							c.GroupId = i.GroupId AND');
      qry_InBox.SQL.Add('							c.UserID = :UserId');
      qry_InBox.SQL.Add('						)');
      qry_InBox.SQL.Add('			) ORDER BY a.Name, a.Surname');
      qry_InBox.Parameters.ParamValues['UserId'] := User;
      qry_InBox.Open;

      qry_InBox.First;
      While not qry_InBox.EOF Do
        begin
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('SELECT');
          qry_SQL.SQL.Add('   COUNT(*) Tot');
          qry_SQL.SQL.Add('FROM');
          qry_SQL.SQL.Add('   eRecordImages i');
          qry_SQL.SQL.Add('WHERE');
          qry_SQL.SQL.Add('   i.UserID = '+QuotedStr(qry_Inbox.FieldByName('UserId').AsString)+' AND');
          qry_SQL.SQL.Add('   (ISNULL(i.eRecNo, 0) = 0 OR ISNULL(i.RecStatus, 0) > 1)');
          qry_SQL.Open;

          if (qry_Inbox.FieldByName('UserId').AsString <> User) then
            begin
              New(UserDetPtr);
              UserDetPtr^.UserId := qry_InBox.FieldbyName('USERID').AsString;
              UserDetPtr^.Name := trim(trim(qry_InBox.FieldbyName('NAME').AsString)+' '+trim(qry_InBox.FieldbyName('SURNAME').AsString));

              t := UserDetPtr^.Name+' ('+InttoStr(qry_SQL.FieldbyName('Tot').AsInteger)+')';
              Node := tvInBox.Items.AddObject(nil, t, UserDetPtr);
              Node.ImageIndex := 1;    //Display Image, Express Icon
              Node.SelectedIndex := 5;  //Selected Image
            end;

          qry_InBox.Next;
        end;
     end;
  qry_InBox.Close;
  qry_SQL.Close;

  Node := tvInbox.Items.GetFirstNode;
  If Node <> Nil Then
    Node.Selected := True;
  RefreshNode(Node);
end;

procedure Tfrm_ImageCentre.chk_PreviewClick(Sender: TObject);
begin
  If tvImages.SelectionCount = 1 then
    tvImagesChange(tvImages, tvImages.Selected)
  else tvImagesChange(tvImages, Nil);
end;

procedure Tfrm_ImageCentre.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_Console.act_ImgCentre.enabled := true;
  frm_Console.fImageCentre := Nil;
  Action := caFree;
end;

procedure Tfrm_ImageCentre.tvInBoxDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
    if Source is TTreeView then
      Accept := true
    else
      Accept := false;
end;

procedure Tfrm_ImageCentre.tvImagesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//    if button = mbRight then TTreeView(Sender).BeginDrag(true);
  TTreeView(Sender).BeginDrag(true);
end;

procedure Tfrm_ImageCentre.tvImagesMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//    if button = mbRight then TTreeView(Sender).EndDrag(True);
 TTreeView(Sender).EndDrag(True);
end;

Procedure Tfrm_ImageCentre.RefreshNode(Node : TTreeNode);
var
  mUserId, mName   :String;
  iCount           :Integer;
begin
  mUserId := PUsrRec(Node.Data)^.UserId;
  mName := PUsrRec(Node.Data)^.Name;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT');
  qry_SQL.SQL.Add('   COUNT(*) Tot');
  qry_SQL.SQL.Add('FROM');
  qry_SQL.SQL.Add('   eRecordImages i');
  qry_SQL.SQL.Add('WHERE');
  qry_SQL.SQL.Add('   i.UserID = :UserId AND');
  qry_SQL.SQL.Add('   (ISNULL(i.eRecNo, 0) = 0 OR ISNULL(i.RecStatus, 0) > 1)');
  qry_SQL.Parameters.ParamValues['UserId'] := mUserId;
  qry_SQL.Open;
  iCount := qry_SQL.FieldbyName('TOT').AsInteger;
  qry_SQL.Close;
  Node.Text := mName+' ('+InttoStr(iCount)+')';

  if Node.Selected then
    tvInBoxChange(tvInBox, Node);
end;

procedure Tfrm_ImageCentre.tvInBoxDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  mUserId,mDescr,sInBox :string;
  i,iCount :integer;
  TargetNode,SNode :TTreeNode;
begin
  Screen.Cursor := crHourglass;
  try
  SNode := tvInBox.Selected;
  TargetNode := tvInBox.GetNodeAt(X,Y);
  If TargetNode = Nil Then
    exit;
//------Get Userid
  sInBox := PUsrRec(TargetNode.Data)^.UserId;
//------Update
  If tvImages.SelectionCount > 0 Then
    begin
      for i := 0 to tvImages.SelectionCount -1 do
        begin
          qry_UpdInBox.Close;
          qry_UpdInBox.SQL.Clear;
          qry_UpdInBox.SQL.Add('UPDATE eRecordImages SET');
          qry_UpdInBox.SQL.Add('  UserId = '+QuotedStr(sInBox));
          qry_UpdInBox.SQL.Add('WHERE TrxNo = '+InttoStr(PImgRec(tvImages.Selections[i].Data)^.TrxNo));
          qry_UpdInBox.ExecSQL;
        end;
    end;
  RefreshNode(sNode);
  RefreshNode(TargetNode);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_ImageCentre.tvImagesStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  SourceNode := tvInBox.Selected;
end;

procedure Tfrm_ImageCentre.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ImageCentre.btn_ePendingClick(Sender: TObject);
begin
  frm_Console.eRecNo := 0;
  frm_Console.eRecImgNo := 0;

  If frm_Console.fePending <> Nil Then
    frm_Console.fePending.Free;

  frm_Console.fePending := Tfrm_ePending.Create(Self);

  frm_Console.fePending.LaunchedFrom := 'ImgCentre';
  frm_Console.fePending.grd_InBoxEnter(frm_Console.fePending.grd_InBox);
end;

procedure Tfrm_ImageCentre.btn_SelFilesClick(Sender: TObject);
Var
  J               :Integer;
  FileName        :String;
begin
  If not odlg_Pic.Execute Then
    exit;

  Screen.Cursor := crHourglass;
  frm_Progress.Show;
  try
    For J := 0 to odlg_Pic.Files.Count-1 Do
      begin
        frm_Progress.Prog(Round(((J+1)/odlg_Pic.Files.Count)*100));
        If frm_Progress.Cancelled Then
          break;
        Application.ProcessMessages;
        FileName := ExpandUNCFileName(odlg_Pic.Files.Strings[J]);
//--------------
        dm_Metrofiler.SaveERecToRepositry(0, FileName, SelectedUserId);
      end;
    Messagedlg('Imported '+InttoStr(odlg_Pic.Files.Count)+' eRecords.', mtInformation, [mbOK], 0);
  finally
    frm_Progress.Hide;
    RefreshNode(tvInbox.Selected);
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_ImageCentre.btn_SelFolderClick(Sender: TObject);
Var
  ListFileNames   :TStringList;
  J               :Integer;
  FileName        :String;
begin
  frm_AddImages.Caption := 'Add eRecords from Files.';
  frm_AddImages.chk_InclSub.Checked := False;
  frm_AddImages.edt_Folder.Text := '';
  If frm_AddImages.ShowModal = mrOK Then
    begin
      Screen.Cursor := crHourglass;
      frm_Progress.Show;
      ListFileNames   := TStringList.Create;
      ListFileNames.Clear;
      try
        frm_AddImages.GetImageFileNames(PChar(frm_AddImages.edt_Folder.Text), ListFileNames);
        For J := 0 to ListFileNames.Count-1 Do
          begin
            frm_Progress.Prog(Round(((J+1)/ListFileNames.Count)*100));
            If frm_Progress.Cancelled Then
              break;
            Application.ProcessMessages;
            FileName := ExpandUNCFileName(ListFileNames.Strings[J]);
//--------------
            dm_Metrofiler.SaveERecToRepositry(0, FileName, SelectedUserId);
          end;
        Messagedlg('Imported '+InttoStr(ListFileNames.Count)+' eRecords.', mtInformation, [mbOK], 0);
      finally
        ListFileNames.Clear;
        ListFileNames.Free;
        frm_Progress.Hide;
        RefreshNode(tvInbox.Selected);
        Screen.Cursor := crDefault;
      end;
    end;
end;

procedure Tfrm_ImageCentre.act_ScanExecute(Sender: TObject);
function GetTempFilename:String;
var
  D,M,Y,H,MM,S,MS      :Word;
  sFile                :String;
begin
  DecodeDate(Now, Y,M,D);
  DecodeTime(Now, H, MM, S, MS);
  sFile := dm_Metrofiler.GetTempDir;
  sFile := sFile + InttoStr(Y);
  sFile := sFile + dm_Metrofiler.LeftPad(M, 2, '0');
  sFile := sFile + dm_Metrofiler.LeftPad(D, 2, '0');
  sFile := sFile + dm_Metrofiler.LeftPad(H, 2, '0');
  sFile := sFile + dm_Metrofiler.LeftPad(MM, 2, '0');
  sFile := sFile + dm_Metrofiler.LeftPad(S, 2, '0');
  Result := sFile;
end;


var
  ini                  :TINIFile;
  Filename             :String;
  MFileName            :String;
  CFileName            :String;
  j, i, Tot            :Integer;
  CompressionType      :Integer;
begin
  ImageEnMView1.Clear;
  If frm_ScannerConfig.Execute <> mrOK Then
    exit;

  If frm_ScannerConfig.rgrp_OutputMode.ItemIndex = 0 Then //Multi
    begin
      ImageEnMView1.MIO.TWainParams.VisibleDialog := True;
      If not ImageEnMView1.MIO.Acquire() Then
        exit;
//================================TIF===========================================
      If frm_ScannerConfig.rgrp_OutputFormat.ItemIndex = 0 Then//tif
        begin
          For I := 0 to ImageEnMView1.MIO.ParamsCount-1 Do
            begin
//---------------First set optimum Compression----------------------------------
              If (ImageEnMView1.MIO.Params[I].SamplesPerPixel = 1)AND(ImageEnMView1.MIO.Params[I].BitsPerSample = 1) Then
                begin
                  ImageEnMView1.MIO.Params[I].TIFF_Compression := ioTIFF_G4FAX;
                end
              else
                begin
                  ImageEnMView1.MIO.Params[I].TIFF_Compression := ioTIFF_JPEG;
                  ImageEnMView1.MIO.Params[I].JPEG_Quality := 80;
                end;
            end;
          FileName := GetTempFilename;
          CFilename := Filename + '_' + dm_Metrofiler.LeftPad(1, 6, '0');
          CFileName := CFileName + '.TIF';
          try
            ImageEnMView1.MIO.SaveToFileTIFF(CFilename);
            dm_Metrofiler.SaveERecToRepositry(0, CFileName, SelectedUserId);
            RefreshNode(tvInbox.Selected);
          finally
            If FileExists(CFileName) Then    //Remove Temp Image
              DeleteFile(CFileName);
          end;
        end
//================================PDF===========================================
      else If frm_ScannerConfig.rgrp_OutputFormat.ItemIndex = 1 Then//PDF
        begin
          For I := 0 to ImageEnMView1.MIO.ParamsCount-1 Do
            begin
//---------------First set optimum Compression----------------------------------
              If (ImageEnMView1.MIO.Params[I].SamplesPerPixel = 1)AND(ImageEnMView1.MIO.Params[I].BitsPerSample = 1) Then
                begin
                  ImageEnMView1.MIO.Params[I].PDF_Compression := ioPDF_G4FAX;
                end
              else
                begin
                  ImageEnMView1.MIO.Params[I].PDF_Compression := ioPDF_JPEG;
                  ImageEnMView1.MIO.Params[I].JPEG_Quality := 80;
                end;
            end;
          FileName := GetTempFilename;
          CFilename := Filename + '_' + dm_Metrofiler.LeftPad(1, 6, '0');
          CFileName := CFileName + '.PDF';
          try
            ImageEnMView1.MIO.SaveToFilePDF(CFilename);
            dm_Metrofiler.SaveERecToRepositry(0, CFileName, SelectedUserId);
            RefreshNode(tvInbox.Selected);
          finally
            If FileExists(CFileName) Then    //Remove Temp Image
              DeleteFile(CFileName);
          end;
        end;
    end
  else If frm_ScannerConfig.rgrp_OutputMode.ItemIndex = 1 Then //Single
    begin
      ImageEnMView1.MIO.TWainParams.VisibleDialog := True;
      If not ImageEnMView1.MIO.Acquire() Then
        exit;
      For I := 0 to ImageEnMView1.MIO.ParamsCount-1 Do
        begin
//---------------First set optimum Compression----------------------------------
          If (ImageEnMView1.MIO.Params[I].SamplesPerPixel = 1)AND(ImageEnMView1.MIO.Params[I].BitsPerSample = 1) Then
            begin
              ImageEnMView1.MIO.Params[I].TIFF_Compression := ioTIFF_G4FAX;
            end
          else
            begin
              ImageEnMView1.MIO.Params[I].TIFF_Compression := ioTIFF_JPEG;
              ImageEnMView1.MIO.Params[I].JPEG_Quality := 80;
            end;
        end;
      FileName := GetTempFilename;
      MFileName := FileName + '_Temp';
      MFileName := MFileName + '.TIF';
      try
        Tot := ImageEnMView1.ImageCount;
        ImageEnMView1.MIO.SaveToFileTIFF(MFilename);
        ImageEnMView1.Clear;
//================================TIF===========================================
        If frm_ScannerConfig.rgrp_OutputFormat.ItemIndex = 0 Then//tif
          begin
            For I := 0 to Tot-1 Do
              begin
                ImageEnView1.IO.Params.ImageIndex := I;
                ImageEnView1.IO.LoadFromFile(MFilename);
//---------------Get Filename---------------------------------------------------
                CFilename := Filename + '_' + dm_Metrofiler.LeftPad(I + 1, 6, '0');
                CFilename := CFilename + '.TIF';
//---------------Save and Import------------------------------------------------
                try
                  ImageEnView1.IO.SaveToFileTIFF(CFilename);
                  dm_Metrofiler.SaveERecToRepositry(0, CFileName, SelectedUserId);
                finally
                  If FileExists(CFileName) Then    //Remove Temp Image
                    DeleteFile(CFileName);
                end;
              end;
          end
//================================PDF===========================================
        else if frm_ScannerConfig.rgrp_OutputFormat.ItemIndex = 1 Then//pdf
          begin
            For I := 0 to Tot-1 Do
              begin
                ImageEnView1.IO.Params.ImageIndex := I;
                ImageEnView1.IO.LoadFromFile(MFilename);
//---------------Get Filename---------------------------------------------------
                CFilename := Filename + '_' + dm_Metrofiler.LeftPad(I + 1, 6, '0');
                CFilename := CFilename + '.PDF';
//---------------Save and Import------------------------------------------------
                try
                  ImageEnView1.IO.SaveToFilePDF(CFilename);
                  dm_Metrofiler.SaveERecToRepositry(0, CFileName, SelectedUserId);
                finally
                  If FileExists(CFileName) Then    //Remove Temp Image
                    DeleteFile(CFileName);
                end;
              end;
          end
//================================JPG===========================================
        else if frm_ScannerConfig.rgrp_OutputFormat.ItemIndex = 2 Then//JPG
          begin
            For I := 0 to Tot-1 Do
              begin
                ImageEnView1.IO.Params.ImageIndex := I;
                ImageEnView1.IO.LoadFromFile(MFilename);
//---------------Get Filename---------------------------------------------------
                CFilename := Filename + '_' + dm_Metrofiler.LeftPad(I + 1, 6, '0');
                CFilename := CFilename + '.JPG';
//---------------Save and Import------------------------------------------------
                try
                  ImageEnView1.IO.SaveToFileJPEG(CFilename);
                  dm_Metrofiler.SaveERecToRepositry(0, CFileName, SelectedUserId);
                finally
                  If FileExists(CFileName) Then    //Remove Temp Image
                    DeleteFile(CFileName);
                end;
              end;
          end
      finally
        ImageEnView1.Clear;
        If FileExists(MFileName) Then    //Remove Temp Image
          DeleteFile(MFileName);
      end;
      RefreshNode(tvInbox.Selected);
    end;
end;

function Tfrm_ImageCentre.GetTempDir :String;
{$IFNDEF WIN32}
  const MAX_PATH = 144;
{$ENDIF}
Var
  a    :array[0..MAX_PATH] of char;
begin
  Result := 'c:\';
  exit;
  IF GetTempPath(sizeof(a), a) <> 0 Then
    Result := StrPas(a)
  else Result := 'Error';
end;

procedure Tfrm_ImageCentre.tvImagesChange(Sender: TObject;
  Node: TTreeNode);
Var
  DocType,Filename  :String;
  ImageNo,J :Integer;
  ComponentTot :Integer;
  ListTrxNos  :String;
  TreeNode  :TTreeNode;
begin
Screen.Cursor := crHourglass;
Enabled := False;
try
  If tvImages.SelectionCount = 1 Then
    begin
//==============================================================================
//=========Clear View===========================================================
//==============================================================================
      ComponentTot := Scroll_ImageViewer.ComponentCount;
      For J := ComponentTot-1 downto 0 Do
        begin
         If (Scroll_ImageViewer.Components[J] is TFrame) Then
           begin
             If Scroll_ImageViewer.Components[J] is Tfram_ImageViewer Then
               Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).FreeMemoryStream;
             Scroll_ImageViewer.Components[J].Free;
           end
         else If Scroll_ImageViewer.Components[J] is TPanel Then
           begin
             Scroll_ImageViewer.Components[J].Free;
           end;
        end;
//==============================================================================
//=======Add new rELEVANT vIEWERS===============================================
//==============================================================================
      If Node = Nil Then
        exit;

      if qry_InBoxImages.IsEmpty  then
        begin
          pnl_ImgComment.Caption := 'No Image Selected';
          nav_ImageComments.enabled := false;
          exit;
        end;

      ImageNo := PImgRec(Node.Data)^.TrxNo;
      pnl_ImgComment.Caption := trim(PImgRec(Node.Data)^.DocName);
      nav_ImageComments.enabled := true;

      IF qry_InBoxImages.Locate('TrxNo',ImageNo,[]) Then
        begin
          If chk_Preview.Checked Then
            begin
              Filename := trim(qry_InBoxImages.FieldbyName('DocName').asString);
              DocType := UpperCase(trim(ExtractFileExt(Filename)));
//==============================================================================
              If (DocType = '.TIF')OR
                 (DocType = '.TIFF')OR
                 (DocType = '.JPG')OR
                 (DocType = '.JPEG')OR
                 (DocType = '.PNG')OR
                 (DocType = '.PSD')OR
                 (DocType = '.PDF')OR
                 (DocType = '.BMP')Then
                begin
                  Tfram_ImageViewer.Create(Scroll_ImageViewer).Name := 'fram_ImageViewer1';
                  Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).Parent := Scroll_ImageViewer;
                  Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).Align := alClient;
                  If Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).GetDocuments('ImageCentre', qry_InBoxImages.FieldbyName('TrxNo').AsInteger) Then
                    begin
                      Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).Visible := True;

                      CurrFileName := Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).FileName;
                    end;
                end
{              else If (DocType = '.XLS')Then
                begin
                  Tfram_SpreadSheetViewer.Create(Scroll_ImageViewer).Name := 'fram_SpreadSheetViewer1';
                  Tfram_SpreadSheetViewer(Scroll_ImageViewer.FindComponent('fram_SpreadSheetViewer1')).Parent := Scroll_ImageViewer;
                  Tfram_SpreadSheetViewer(Scroll_ImageViewer.FindComponent('fram_SpreadSheetViewer1')).Align := alClient;
                  Tfram_SpreadSheetViewer(Scroll_ImageViewer.FindComponent('fram_SpreadSheetViewer1')).Visible := False;
                  If Tfram_SpreadSheetViewer(Scroll_ImageViewer.FindComponent('fram_SpreadSheetViewer1')).GetDocuments(qry_InBoxImages.FieldbyName('TrxNo').AsInteger) Then
                    begin
                      Tfram_SpreadSheetViewer(Scroll_ImageViewer.FindComponent('fram_SpreadSheetViewer1')).Visible := True;
                      CurrFileName := Tfram_SpreadSheetViewer(Scroll_ImageViewer.FindComponent('fram_SpreadSheetViewer1')).FileName;
                    end;
                end}
              else If (DocType = '.HTM')OR
                      (DocType = '.HTML')OR
                      (DocType = '.EML')Then
                begin
                  Tfram_HTMLViewer.Create(Scroll_ImageViewer).Name := 'fram_HTMLViewer1';
                  Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).Parent := Scroll_ImageViewer;
                  Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).Align := alClient;
                  Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).Visible := False;
                  If Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).GetDocuments('ImageCentre', qry_InBoxImages.FieldbyName('TrxNo').AsInteger) Then
                    begin
                      Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).Visible := True;
                      CurrFileName := Tfram_HTMLViewer(Scroll_ImageViewer.FindComponent('fram_HTMLViewer1')).FileName;
                    end;
                end
              else If (DocType = '.TXT')OR
                      (DocType = '.RTF')OR
                      (DocType = '.CSV')Then
                begin
                  Tfram_RTFViewer.Create(Scroll_ImageViewer).Name := 'fram_RTFViewer1';
                  Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).Parent := Scroll_ImageViewer;
                  Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).Align := alClient;
                  Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).Visible := False;
                  If Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).GetDocuments('ImageCentre', qry_InBoxImages.FieldbyName('TrxNo').AsInteger) Then
                    begin
                      Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).Visible := True;
                      CurrFileName := Tfram_RTFViewer(Scroll_ImageViewer.FindComponent('fram_RTFViewer1')).FileName;
                    end;
                end
              else
                begin
                  CurrFileName := dm_Metrofiler.ReadERecFromRepositry('ImageCentre', qry_InBoxImages.FieldbyName('TrxNo').AsInteger);
                end;
            end;
        end;
    end
  else  If tvImages.SelectionCount > 1 Then
    begin
      If chk_Preview.Checked Then
        begin
          ListTrxNos := '';
          For J := 0 to tvImages.SelectionCount-1 Do
            begin
              TreeNode := tvImages.Selections[J];

              ImageNo := PImgRec(TreeNode.Data)^.TrxNo;
              If ImageNo <> 0 Then
                ListTrxNos := ListTrxNos + InttoStr(ImageNo)+',';
            end;
          If ListTrxNos <> '' Then
            begin
              Delete(ListTrxNos, length(ListTrxNos), 1);

              If Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')) = Nil Then
                begin
                  Tfram_Thumbnails.Create(Scroll_ImageViewer).Name := 'fram_Thumbnails1';
                  Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).Parent := Scroll_ImageViewer;
                  Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).Align := alClient;
                  Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).aParentForm := frm_Console.fImageCentre;
                end;
              Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).Visible := True;
              Tfram_Thumbnails(Scroll_ImageViewer.FindComponent('fram_Thumbnails1')).GetDocuments('ImageCentre', ListTrxNos);
              CurrFileName := '';
            end;
        end
      else
        begin
          ComponentTot := Scroll_ImageViewer.ComponentCount;
          For J := ComponentTot-1 downto 0 Do
            begin
             If (Scroll_ImageViewer.Components[J] is TFrame) Then
               begin
                 If Scroll_ImageViewer.Components[J] is Tfram_ImageViewer Then
                   Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).FreeMemoryStream;
                 Scroll_ImageViewer.Components[J].Free;
               end
             else If Scroll_ImageViewer.Components[J] is TPanel Then
               begin
                 Scroll_ImageViewer.Components[J].Free;
               end;
            end;
        end;
    end;
finally
  Enabled := True;
  Screen.Cursor := crDefault;
end;
end;

procedure Tfrm_ImageCentre.DeleteImage1Click(Sender: TObject);
Var
  J, I   :Integer;
  Treenode   :TTreeNode;
  sTemp    :String;
  iOldCount, iNewCount  :Integer;
begin
  If tvImages.SelectionCount > 0 Then
    begin
      If Messagedlg('Are you sure you want to delete the selected images?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
        exit;
      For J := tvImages.SelectionCount-1 downto 0 Do
        begin
          TreeNode := tvImages.Selections[J];
          I := PImgRec(TreeNode.Data)^.TrxNo;
          dm_Metrofiler.DeleteERecFromRepositry(I, True);
          Treenode.Delete;
          Treenode := tvInBox.Selected;
          sTemp := trim(copy(Treenode.Text,pos('(',Treenode.Text)+1,255));
          sTemp := trim(copy(sTemp,1,pos(')',sTemp)-1));
          iOldCount := StrToIntDef(sTemp,0);
          iNewCount := iOldCount - 1;    //New Count

          IF iNewCount < 0 THEN
            iNewCount := 0;
          sTemp := Trim(Copy(Treenode.Text,1,pos('(',Treenode.Text)-1));
          sTemp := sTemp +' ('+IntToStr(iNewCount)+')';
          Treenode.Text := sTemp;
        end;
      tvImagesChange(tvImages, tvImages.Selected);
    end;
end;

procedure Tfrm_ImageCentre.tvInBoxChange(Sender: TObject; Node: TTreeNode);
var
  t,sUser :String;
  ComponentTot, j, TotalPages :integer;
  TreeNode :TTreeNode;
  ImageDetPtr: PImgRec;
  ImageIndex   :smallint;
  FileN   :String;
begin
  sUser := PUsrRec(tvInBox.Selected.Data)^.UserId;
  SelectedUserId := sUser;
  tvImages.Items.Clear;
  qry_InBoxImages.Close;
  qry_InBoxImages.SQL.Clear;
  qry_InBoxImages.SQL.Add('SELECT');
  qry_InBoxImages.SQL.Add('  TrxNo,');
  qry_InBoxImages.SQL.Add('  Docname,');
  qry_InBoxImages.SQL.Add('  UserId,');
  qry_InBoxImages.SQL.Add('  Imgcomment');
  qry_InBoxImages.SQL.Add('FROM');
  qry_InBoxImages.SQL.Add('  eRecordImages');
  qry_InBoxImages.SQL.Add('WHERE');
  qry_InBoxImages.SQL.Add('  UserId = '+QuotedStr(sUser)+' AND');
  qry_InBoxImages.SQL.Add('  (eRecNo IS NULL OR eRecNo = 0 OR RecStatus > 1)');
  qry_InBoxImages.SQL.Add('ORDER BY');
  qry_InBoxImages.SQL.Add('  TrxNo');
  qry_InBoxImages.Open;
  If qry_InBoxImages.IsEmpty Then
    begin
      nav_ImageComments.enabled := true;
      pnl_ImgComment.Caption := 'No Image Selected';
    end
  else
    begin
      While not qry_InBoxImages.Eof do
        begin
          New(ImageDetPtr);
          ImageDetPtr^.TrxNo := qry_InBoxImages.FieldByName('TrxNo').AsInteger;
          ImageDetPtr^.UserId := trim(qry_InBoxImages.FieldByName('UserId').AsString);
          ImageDetPtr^.DocType := Uppercase(ExtractFileExt(trim(qry_InBoxImages.FieldByName('DocName').AsString)));
          ImageDetPtr^.DocName := trim(qry_InBoxImages.FieldByName('DocName').AsString);
          t := trim(qry_InBoxImages.FieldByName('DocName').AsString);
          TreeNode := tvImages.Items.AddObject(nil, t,ImageDetPtr);

          If ImageDetPtr^.DocType = '.TXT' Then
            ImageIndex := 11
          else If ImageDetPtr^.DocType = '.CSV' Then
            ImageIndex := 11
          else If ImageDetPtr^.DocType = '.RTF' Then
            ImageIndex := 11
          else If ImageDetPtr^.DocType = '.PDF' Then
            ImageIndex := 6
          else If ImageDetPtr^.DocType = '.DOC' Then
            ImageIndex := 7
          else If ImageDetPtr^.DocType = '.DOCX' Then
            ImageIndex := 7
          else If ImageDetPtr^.DocType = '.XLS' Then
            ImageIndex := 5
          else If ImageDetPtr^.DocType = '.XLSX' Then
            ImageIndex := 5
          else If ImageDetPtr^.DocType = '.HTML' Then
            ImageIndex := 4
          else If ImageDetPtr^.DocType = '.HTM' Then
            ImageIndex := 4
          else If ImageDetPtr^.DocType = '.MSG' Then
            ImageIndex := 4
          else If ImageDetPtr^.DocType = '.EML' Then
            ImageIndex := 4
          else If Copy(ImageDetPtr^.DocType, 1, 4) = '.TIF' Then
            ImageIndex := 8
          else ImageIndex := 3;

          TreeNode.ImageIndex := ImageIndex;
          TreeNode.SelectedIndex := ImageIndex;
          qry_InBoxImages.Next;
        end;
    end;

  ComponentTot := Scroll_ImageViewer.ComponentCount;
  For J := ComponentTot-1 downto 0 Do
    begin
      If (Scroll_ImageViewer.Components[J] is TFrame) Then
        begin
          If Scroll_ImageViewer.Components[J] is Tfram_ImageViewer Then
            Tfram_ImageViewer(Scroll_ImageViewer.FindComponent('fram_ImageViewer1')).FreeMemoryStream;
          Scroll_ImageViewer.Components[J].Free;
        end;
    end;
end;

procedure Tfrm_ImageCentre.DisplayThumbnail(tImageNo  :Integer);
Var
  J  :Integer;
  TreeNode   :TTreeNode;
begin
  For J := 0 to tvImages.Items.Count-1 Do
    begin
      TreeNode := tvImages.Items.Item[J];
      If PImgRec(TreeNode.Data)^.TrxNo = tImageNo Then
        begin
          tvImages.ClearSelection(False);
          tvImages.Selected := TreeNode;
          break;
        end;
    end;
end;

procedure Tfrm_ImageCentre.KeyDownAbort(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Abort;
end;

procedure Tfrm_ImageCentre.Panel3Resize(Sender: TObject);
begin
 // chk_Preview.Left := panel3.Width-75;
end;

procedure Tfrm_ImageCentre.RenameDocument1Click(Sender: TObject);
Var
  I           :Integer;
  DocName     :String;
  ExtName     :String;
  TrxNo       :Integer;
  J   :Integer;
  Treenode   :TTreeNode;
  sTemp    :String;
  iOldCount, iNewCount  :Integer;
begin
  If tvImages.SelectionCount = 0 Then
    exit;

  If  tvImages.SelectionCount > 1 Then
    begin
      Messagedlg('Only 1 Document can be renamed at a time.', mtInformation, [mbOK], 0);
      exit;
    end;

  TreeNode := tvImages.Selections[0];
  TrxNo := PImgRec(TreeNode.Data)^.TrxNo;

  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT DocName FROM eRecordImages WHERE TrxNo = :TrxNo');
  qry_SQL.Parameters.ParamByName('TrxNo').Value := TrxNo;
  qry_SQL.Open;
  DocName := qry_SQL.FieldbyName('DocName').AsString;
  ExtName := ExtractFileExt(DocName);
  If ExtName <> '' Then
    Delete(DocName, length(DocName)-length(ExtName) + 1, Length(ExtName));
  qry_SQL.Close;

  If not InputQuery('Enter a new Document Name', 'Document Name :', DocName) Then
    exit;

  try
    qry_SQL.Close;
    qry_SQL.SQL.Clear;
    qry_SQL.SQL.Add('UPDATE eRecordImages SET DocName = :DocName WHERE TrxNo = :TrxNo');
    qry_SQL.Parameters.ParamByName('TrxNo').Value := TrxNo;
    qry_SQL.Parameters.ParamByName('Docname').Value := DocName+ExtName;
    qry_SQL.ExecSQL;
  finally
    tvInBoxChange(tvInBox, tvInBox.Selected);
  end;
end;

end.
