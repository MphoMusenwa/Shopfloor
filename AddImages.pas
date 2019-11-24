unit AddImages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DirDlg, ExtCtrls;

type
  Tfrm_AddImages = class(TForm)
    Label1: TLabel;
    edt_Folder: TEdit;
    btn_Browse: TSpeedButton;
    chk_InclSub: TCheckBox;
    btn_OK: TBitBtn;
    btn_Cancel: TBitBtn;
    Panel2: TPanel;
    Image2: TImage;
    Label20: TLabel;
    Label21: TLabel;
    procedure btn_BrowseClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
  private
    { Private declarations }
    nResult : TStringList;
  public
    { Public declarations }
    Procedure GetImageFileNames(Directory  :PChar; VAR ImageList   :TStringList);
    procedure FileLook(Folder : string);
  end;

var
  frm_AddImages: Tfrm_AddImages;

implementation

{$R *.dfm}

procedure Tfrm_AddImages.btn_BrowseClick(Sender: TObject);
var
  s        :String;
begin
  if SelectDirectory('Select location of databases.',s,'',s) then
    begin
      if copy(s, length(s), 1) <> '\' then
        s := s + '\';
      edt_Folder.Text := s;
    end;
end;

Procedure Tfrm_AddImages.GetImageFileNames(Directory  :PChar; VAR ImageList   :TStringList);
function GetExtension(FileName:String):String;
Var
  J   :Integer;
begin
  Result := '';
  For J := length(FileName) downto 1 Do
    begin
      If FileName[J] = '.' Then
        exit
      else
        Result := FileName[J] + Result;
    end;
end;

var
  DirInfo       :TSearchRec;
  r             :Integer;
  TFiles        :String;
begin
  nResult := ImageList;
  If chk_InclSub.Checked = False Then
    begin
      nResult.Clear;
      TFiles := Directory+'\*.*';
      r := FindFirst(TFiles, FaAnyfile, DirInfo);
      While r = 0 do
        Begin
          If ((DirInfo.Attr and FaDirectory <> FaDirectory) and
             (DirInfo.Attr and FaVolumeId <> FaVolumeID)) Then
            If (UpperCase(GetExtension(DirInfo.Name)) = 'TIF')OR
               (UpperCase(GetExtension(DirInfo.Name)) = 'TIFF')OR
               (UpperCase(GetExtension(DirInfo.Name)) = 'JPG')OR
               (UpperCase(GetExtension(DirInfo.Name)) = 'JPEG')OR
               (UpperCase(GetExtension(DirInfo.Name)) = 'PDF')Then
              nResult.Append(Directory +'\'+ DirInfo.Name);
          r := FindNext(DirInfo);
        end;
      SysUtils.FindClose(DirInfo);
    end
  else
    begin
      nResult.Clear;

      TFiles := Directory+'\*.*';
      FileLook(TFiles);
    end;
end;

procedure Tfrm_AddImages.btn_OKClick(Sender: TObject);
Var
  StrList   :TStringList;
begin
  StrList   := TStringList.Create;
  StrList.Clear;
  try
    GetImageFileNames(PChar(edt_Folder.Text), StrList);
    If nResult.Count <= 0 Then
      begin
        Messagedlg('No Valid Images found in this folder!!', mtWarning, [mbOK], 0);
        exit;
      end;
    ModalResult := mrOK;
  finally
    StrList.Free;
  end;
end;

procedure Tfrm_AddImages.FileLook(Folder : string);
function GetExtension(FileName:String):String;
Var
  J   :Integer;
begin
  Result := '';
  For J := length(FileName) downto 1 Do
    begin
      If FileName[J] = '.' Then
        exit
      else
        Result := FileName[J] + Result;
    end;
end;

var
  validres  :integer;
  SearchRec :TSearchRec;
  DirPath, FullName, Flname :string;

begin
  DirPath := ExtractFilePath(Folder);
  If not DirectoryExists(DirPath) then
    exit;

  Flname := ExtractFileName(Folder);
  validres := FindFirst(Folder, faAnyFile, SearchRec);

  while validres = 0 do
    begin
      If (SearchRec.Name[1] <> '.') then
        begin {ignore . and .. dirs}
            If (UpperCase(GetExtension(SearchRec.Name)) = 'TIF')OR
               (UpperCase(GetExtension(SearchRec.Name)) = 'TIFF')OR
               (UpperCase(GetExtension(SearchRec.Name)) = 'JPG')OR
               (UpperCase(GetExtension(SearchRec.Name)) = 'JPEG')OR
               (UpperCase(GetExtension(SearchRec.Name)) = 'PDF')Then
            nResult.Append(DirPath + SearchRec.Name);

          FullName:=DirPath + LowerCase(SearchRec.Name);

          If (SearchRec.Attr and faDirectory > 0) then {it is a directory, not a file}
          FileLook(FullName+'\'+ Flname);
        end;
      validres:=FindNext(SearchRec);
    end;
end;


end.
