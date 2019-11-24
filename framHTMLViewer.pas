unit framHTMLViewer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, DB, ADODB, ExtCtrls;

type
  Tfram_HTMLViewer = class(TFrame)
    qry_eRecordImages: TADOQuery;
    pnl_Cover: TPanel;
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
  private
    { Private declarations }
  public
    { Public declarations }
    FileName   :String;
    function GetDocuments(Module  :String; ImageNo :Integer):Boolean;
  end;

implementation

uses MetrofilerDataModule;

{$R *.dfm}


function Tfram_HTMLViewer.GetDocuments(Module  :String; ImageNo :Integer):Boolean;
Var
  AImageNo   :Integer;
  DocType    :String;
  Flags      :OLEVariant;
begin
  Result := False;
  Flags := 0;
  If ImageNo = 0 Then
    begin
      WebBrowser1.Navigate(WideString('about:blank'), Flags, Flags, Flags, Flags);
      exit;
    end;
//---------
  AImageNo := ImageNo;
  FileName := dm_Metrofiler.ReadERecFromRepositry(Module, AImageNo);
  DocType := UpperCase(ExtractFileExt(Filename));
//---------
  If (DocType <> '.EML')AND
     (DocType <> '.HTM')AND
     (DocType <> '.DOC')AND
     (DocType <> '.PPT')AND
     (DocType <> '.HTML')AND
     (DocType <> '.MSG')Then
    begin
      Messagedlg('Document format <'+DocType+'> not supported by this viewer!', mtWarning, [mbOK], 0);
      WebBrowser1.Navigate(WideString('about:blank'), Flags, Flags, Flags, Flags);
      exit;
    end;
//==============================================================================
  WebBrowser1.Navigate(WideString('FILE://'+Filename), Flags, Flags, Flags, Flags);
  While WebBrowser1.Busy Do
    Sleep(10);
  pnl_Cover.Visible := (DocType = '.DOC');
  Result := True;
end;

end.
