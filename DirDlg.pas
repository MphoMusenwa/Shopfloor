unit DirDlg;

interface


Function SelectDirectory(Caption:Ansistring;
                         InitialDir, fHint:Ansistring;
                         Var SelectedDir:Ansistring):Boolean;

implementation
uses  Windows, Classes, ShlObj,
{$IFDEF VER90}
Ole2
{$ELSE}
ActiveX
{$ENDIF}
;

type
   TBrowseForFolderDialog = class
   private
      bi: TBROWSEINFO;
      str: Array[0..MAX_PATH] of Char;
      pStr: PChar;
      fTitle: Ansistring;
      fInitPath: Ansistring;
      fHint: Ansistring;
      pIDListItem: PItemIDList;
      function  GetPath: Ansistring;
   public
      function Execute: Boolean;
      property Initpath: Ansistring read fInitpath write fInitpath;
      property Hint: Ansistring read fHint write fhint;
      property Title: Ansistring read fTitle write fTitle;
      property Path: Ansistring read GetPath;
   end;

{ callback for SHBrowseForFolder:
BFFM_ENABLEOK	Enables the OK button if the wParam parameter is nonzero or disables it
                if wParam is zero.
BFFM_SETSELECTION	Selects the specified folder.  The lParam parameter is the PIDL of the
                       folder to select if wParam is FALSE, or it is the path of the folder otherwise.
BFFM_SETSTATUSTEXT     Sets the status text to the null-terminated Ansistring specified
                       by the lParam parameter.
}
function FNBFFCallBack(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM): Integer stdcall;
begin
  Result := 0;
  with TBrowseForFolderDialog(lpdata) do
  case uMsg of
  BFFM_INITIALIZED:
  {The browse dialog box has finished initializing.}
    begin
      if fHint <> '' then
      SendMessage(Wnd,BFFM_SETSTATUSTEXT,0,longint(pChar(fHint)));
      if fInitPath<> '' then
      SendMessage(Wnd,BFFM_SETSELECTION,1,longint(pChar(fInitPath)));
    end;
  BFFM_SELCHANGED :
  {The selection has changed}
    begin
    end;
  end;
end;

function  TBrowseForFolderDialog.GetPath: Ansistring;
begin
  Result := pStr;
end;

function TBrowseForFolderDialog.Execute: Boolean;
begin
    bi.hwndOwner := GetActiveWindow;
    bi.lpszTitle := pChar(fTitle);
    bi.pidlRoot := nil;
    bi.pszDisplayName := @str;
    if fHint <> '' then bi.ulFlags := BIF_RETURNONLYFSDIRS OR BIF_STATUSTEXT
    else bi.ulFlags := BIF_RETURNONLYFSDIRS;
    bi.lpfn := @FNBFFCallBack;
    bi.LPARAM := longint(Self);
    pIDListItem := SHBrowseForFolder(bi);
    if pIDListItem <> nil then
    begin
      pStr := @Str;
      SHGetPathFromIDList(pIDListItem, pStr);
      CoTaskMemFree(pIDListItem);
      Result := True;
    end
    else
      Result := False;
end;


Function SelectDirectory(Caption:Ansistring;
                         InitialDir, fHint:Ansistring;
                         Var SelectedDir:Ansistring):Boolean;
var
   dlg: TBrowseForFolderDialog;
begin
   Result := false;
   dlg := TBrowseForFolderDialog.Create;
   Try
     dlg.Title    := Caption;
     dlg.Hint     := fHint;
     dlg.Initpath :=InitialDir;
     if dlg.Execute then begin
       SelectedDir := dlg.Path;
       result := True;
     end;
   Finally
     dlg.Free;
   End;
end;

end.
