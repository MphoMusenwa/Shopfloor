unit framRichEditViewer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, DB, ADODB, ExtCtrls, StdCtrls, ComCtrls;

type
  Tfram_RTFViewer = class(TFrame)
    qry_eRecordImages: TADOQuery;
    pnl_Cover: TPanel;
    Panel1: TPanel;
    re: TRichEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    FileName   :String;
    function GetDocuments(Module :String; ImageNo :Integer):Boolean;
  end;

implementation

uses MetrofilerDataModule;

{$R *.dfm}


function Tfram_RTFViewer.GetDocuments(Module :String; ImageNo :Integer):Boolean;
Var
  DocType      :String;
  Flags        :OLEVariant;
  T            :TextFile;
  LineStr      :String;
  AImageNo     :Integer;
begin
  Result := False;
  Flags := 0;
  If ImageNo = 0 Then
    begin
      re.Lines.Clear;
      exit;
    end;
//---------
  AImageNo := ImageNo;
  FileName := dm_Metrofiler.ReadERecFromRepositry(Module, AImageNo);
  DocType := UpperCase(ExtractFileExt(Filename));
//---------
  If (DocType <> '.TXT')AND
     (DocType <> '.CSV')AND
     (DocType <> '.RTF')Then
    begin
      Messagedlg('Document format <'+DocType+'> not supported by this viewer!', mtWarning, [mbOK], 0);
      re.Lines.Clear;
      exit;
    end;
//==============================================================================
  IF DocType  = '.RTF' Then
    re.Lines.LoadFromFile(Filename)
  else
    begin
      re.Lines.Clear;
      AssignFile(T, Filename);
      try
        Reset(T);
        While not EOF(T) Do
          begin
            Readln(T, LineStr);
            re.Lines.Append(LineStr);
          end
      finally
        Closefile(T);
      end;
    end;
  Result := True;
end;

end.
