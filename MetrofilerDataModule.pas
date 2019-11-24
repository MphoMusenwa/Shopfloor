//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 2006 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit MetrofilerDataModule;

interface

uses
  SysUtils, Classes, Types, ShellAPI, Variants, Windows, Registry, Dialogs,
  Forms, Messages, DB, ADODB, DBTables, zlib, Printers, WinSpool, INIFiles,
  ComObj, ActiveX, Controls, StrUtils, RegSec, ImageEnIO, DebenuPDFLibrary,
  iexBitmaps;

type
  // The Cache Parameter class definition
  TCacheParameter = class
    private
      // The data fields of this new class
      ParameterName   : String;
      ParameterValue  : Variant;
    public
      // Properties to read these data values
      property Name : String
          read ParameterName;
      property Value : Variant
          read ParameterValue;

      // Constructor
      constructor Create(const ParameterName   : String;
                         const ParameterValue : Variant);
  end;
  // The Cache Dataset class definition
  TCacheDataSet = class
    private
      // The data fields of this new class
      CacheDataSetID            : String;
      CacheDataSetDateExire   : TDatetime;
      CacheDataSetSQLText       : String;
      CacheDataSetParameters    : TList;
      CacheDataSetdsCache       : String;
    public
      // Properties to read these data values
      property ID : String
          read CacheDataSetID;
      property DateExire : TDatetime
          read CacheDataSetDateExire;
      property SQLText : String
          read CacheDataSetSQLText;
      property Parameters : TList
          read CacheDataSetParameters;
      property dsCache : String
          read CacheDataSetdsCache;

      // Constructor
      constructor Create(const CacheDataSetID   : String;
                         const CacheDataSetDateExire : TDatetime;
                         const CacheDataSetSQLText : String;
                         const CacheDataSetParameters : TList;
                         const CacheDataSetdsCache : String);
  end;
  tagEDITBALLOONTIP = record
    cbStruct: Longword;
    pszTitle: PWChar;
    pszText: PWChar;
    ttiIcon: Integer;
  end;
type
  PEDITBALLOONTIP = ^tagEDITBALLOONTIP;
const
  ECM_FIRST         = $00001500;
  EM_SHOWBALLOONTIP = ECM_FIRST + 3;
type
  Tdm_Metrofiler = class(TDataModule)
    ADOConnect_mFiler: TADOConnection;
    qry_SQL: TADOQuery;
    qry_ReadImage: TADOQuery;
    qry_InsertImage: TADOQuery;
    qry_InsAud: TADOQuery;
    PrintDialog: TPrintDialog;
    SaveDialogExcel: TSaveDialog;
    RegSec1: TRegSec;
    RegSec2: TRegSec;
    qry_CookieCache: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    CachedDatasets :TList;
    FGhostScriptFileName: string;
  public
    { Public declarations }
    ViewerLastView                       :String;
    TempDocuments   :TStringList;
    CookieCacheExpire     :TDateTime;
    ConnectionString  :String;
    ADAuthentication      :Boolean;
    PromptPrinter_for_PrintRecordwithDrawelSlip :Boolean;
    const PDFLicKey = 'j79qp5815rz86354x7zo7gj7y';
    const CookieDocManBranch :string = 'Cookie.DocMan.Branch';
    const CookieDocManDepartment :string = 'Cookie.DocMan.Department';
    const CookieDocManRecordType :string = 'Cookie.DocMan.RecordType';
    const CookieDocManRecordCat :string = 'Cookie.DocMan.RecordCat';
    const CookieERecManBranch :string = 'Cookie.eRecMan.Branch';
    const CookieERecManDepartment :string = 'Cookie.eRecMan.Department';
    const CookieERecManRecordType :string = 'Cookie.eRecMan.RecordType';
    const CookieERecManRecordCat :string = 'Cookie.eRecMan.RecordCat';
    const CookieWareManBranch :string = 'Cookie.WareMan.Branch';
    const CookieWareManDepartment :string = 'Cookie.WareMan.Department';
    const CookieWareManRecordType :string = 'Cookie.WareMan.RecordType';
    const CookieWareManRecordCat :string = 'Cookie.WareMan.RecordCat';
    procedure Delay(ms : Dword);
    function ShellExecAndWait(App, Params: string; Visibility : Integer; var ResultingExitCode : DWord): Boolean;
    function GetServTimeNow:TDateTime;
    function ConnectDB():Boolean;
    function DisconnectDB:Boolean;
    function GetUniqueTempFile(Filename :String):String;
    function GetTempDir :String;
    function SaveERecToRepositry(eRecNo :Integer; Filename, UserID :String):Integer;
    function ReadERecFromRepositry(Module  :String; TrxNo :Integer):String;
    function DeleteERecFromRepositry(TrxNo :Integer; DeleteIndex :Boolean):String;
    function UpdateERecRepositry(TrxNo :Integer):Integer;
    function InsAudit(AuditType: String; TrxNo :Integer; eRecNo :Integer; Barcode, Comment :String; Bytes :Integer):Boolean;
    procedure CopyFile(Const sourcefilename, targetfilename: String; COMPR :Boolean);
    procedure PrintContReturnSlip(Container, Warehouse, Location :String);
    procedure PrintContPutAwaySlip(Container, Warehouse, Location :String);
    procedure PrintContReqSlip(Container, Requester :String);
    procedure PrintRecordwithDrawelSlip(PrinterIndx :Integer;Container, Warehouse, Location, RecordNo :String);
    procedure ShowBalloonTop(ControlHandle :THandle; Caption, MessageStr :WideString; Icon :Integer);
//    procedure PrintInterMecLabel(Barcode
    function CreateGuid: string;
    function ExporttoXLS(Dataset :TDataset):Boolean;
    function LeftPad(value :integer; length :integer; pad :char):string;
    function EncryptPassw(Password :String):String;
    function DecryptPassw(Password :String):String;
    procedure SaveSearchCookie(CookieType, CookieValue :String);
    function GetSearchCookie(CookieType :String):String;
    function NewEncrypt (s: string; Key: Word) : string;
    function NewDecrypt (s: string; Key: Word) : string;
    function XorText(s :string; key :Integer):String;
    Procedure ExecuteCached(VAR Query  :TADOQuery; Timeout :TDateTime);
    procedure ClearCache;
    function GetLoggedOnUser :String;
    function GetLoggedOnComputerName :String;
    function GetPDFPageCount(Filename :String):Integer;
    Function String_Reverse(S : String): String;
  end;

var
  dm_Metrofiler: Tdm_Metrofiler;

implementation

uses Progress, Main;

{$R *.dfm}

Function Tdm_Metrofiler.String_Reverse(S : String): String;
 Var
    i : Integer;
 Begin
    Result := '';
    For i := Length(S) DownTo 1 Do
    Begin
      Result := Result + Copy(S,i,1) ;
    End;
 End;


// CacheParameter constructor
// --------------------------------------------------------------------------
constructor TCacheParameter.Create(const ParameterName   : String;
                                   const ParameterValue : Variant);
begin
  // Save the passed parameters
  self.ParameterName   := ParameterName;
  self.ParameterValue := ParameterValue;
end;

// CacheDataSet Constructor
// --------------------------------------------------------------------------
constructor TCacheDataSet.Create(const CacheDataSetID   : String;
                                 const CacheDataSetDateExire : TDatetime;
                                 const CacheDataSetSQLText : String;
                                 const CacheDataSetParameters : TList;
                                 const CacheDataSetdsCache : String);
begin
  // Save the passed parameters
  self.CacheDataSetID := CacheDataSetID;
  self.CacheDataSetDateExire := CacheDataSetDateExire;
  self.CacheDataSetSQLText := CacheDataSetSQLText;
  self.CacheDataSetParameters := CacheDataSetParameters;
  self.CacheDataSetdsCache := CacheDataSetdsCache;
end;

procedure Tdm_Metrofiler.ClearCache;
Var
  J          :Integer;
begin
//------Delete expired Entries
  For J := CachedDatasets.Count-1 downto 0 Do
    begin
      SysUtils.DeleteFile(TCacheDataSet(CachedDatasets[J]).dsCache);
      CachedDatasets.Delete(J);
    end;
end;

Procedure Tdm_Metrofiler.ExecuteCached(VAR Query  :TADOQuery; Timeout :TDateTime);
function IsParamsEqual(Params1, Params2 :TList):Boolean;
Var
  J, Q          :Integer;
  ParamName     :String;
  ParamValue    :Variant;
  ParamName2    :String;
  ParamValue2   :Variant;
  Exists        :Boolean;
  Param         :TParams;
begin
  If Params1.Count <> Params2.Count Then
    begin
      Result := False;
      exit;
    end;

  For J := 0 to Params1.Count-1 Do
    begin
      ParamName :=  TCacheParameter(Params1[J]).Name;
      ParamValue := TCacheParameter(Params1[J]).Value;
      Exists := False;
      For Q := 0 to Params2.Count-1 Do
        begin
          ParamName2 :=  TCacheParameter(Params2[Q]).Name;
          ParamValue2 := TCacheParameter(Params2[Q]).Value;

          If Uppercase(trim(ParamName)) = Uppercase(trim(ParamName2)) Then
            begin
              If ParamValue = ParamValue2 Then
                begin
                  Exists := True;
                  Break;
                end;
            end;
        end;
      If not exists Then
        begin
          Result := False;
          exit;
        end;
    end;
  Result := True;
end;

Var
  J, F             :Integer;
  Filename         :String;
  qry_Cache        :TADOQuery;
  SQLText          :String;
  ParamList        :TList;
  CacheDataSet     :TCacheDataSet;
  CacheParameter   :TCacheParameter;
  ID               :String;
begin
//------Delete expired Entries
  For J := CachedDatasets.Count-1 downto 0 Do
    begin
      If TCacheDataSet(CachedDatasets[J]).DateExire < Now Then
        begin
          SysUtils.DeleteFile(TCacheDataSet(CachedDatasets[J]).dsCache);
          CachedDatasets.Delete(J);
        end;
    end;
//------Get SQLText
  SQLText := Query.SQL.Text;
//------Build CacheParameter List
  ParamList := TList.Create;

  For J := 0 to Query.Parameters.Count-1 Do
    begin
      CacheParameter   := TCacheParameter.Create(Query.Parameters[J].Name,
                                                 Query.Parameters[J].Value);
      ParamList.Add(CacheParameter);
    end;
//------First Check if not exists in Cache--------------------------------------
  For J := 0 to CachedDatasets.Count-1 Do
    begin
      If TCacheDataSet(CachedDatasets[J]).SQLText = SQLText Then
        If IsParamsEqual(ParamList, TCacheDataSet(CachedDatasets[J]).Parameters) Then
          begin
            qry_Cache := TADOQuery.Create(Application);
            try
              qry_Cache.Connection := ADOConnect_mFiler;
              qry_Cache.LoadFromFile(TCacheDataSet(CachedDatasets[J]).dsCache);
              Query.Recordset := qry_Cache.Recordset;
              exit;
            finally
              qry_Cache.Free;
            end;
          end;
    end;

  {For J := Low(CachedDatasets) to High(CachedDatasets) Do
    begin
      If (CachedDatasets[J].SQLText = Query.SQL.Text)Then
        If (IsParamsEqual(Query.Parameters, CachedDatasets[J].Parameters))Then
          If (CachedDatasets[J].DateFetched+Timeout > Now) Then
            begin
              qry_Cache := TADOQuery.Create(Application);
              try
                qry_Cache.Connection := ADOConnect_mFiler;
                qry_Cache.LoadFromFile(CachedDatasets[J].dsCache);
                Query.Recordset := qry_Cache.Recordset;
                exit;
              finally
                qry_Cache.Free;
              end;
            end;
    end;   }
//-------Else get from database-------------------------------------------------
  Query.Open;
//----------Add to Cache---------------------------
  ID := CreateGuid;
  Filename := GetTempDir+ID+'.tmp';
  Query.SaveToFile(Filename, pfADTG);
  dm_Metrofiler.TempDocuments.Add(Filename);

  CacheDataSet     := TCacheDataSet.Create(ID,
                                           Now+Timeout,
                                           SQLText,
                                           ParamList,
                                           Filename);

  CachedDatasets.Add(CacheDataSet);
//----------Add to Cache--------------------------
end;

function Tdm_Metrofiler.XorText(s :string; key :Integer):String;
Var
  newText   :String;
  i         :Integer;
  charValue :Integer;
begin
  newText := '';
  for i := 1 to Length(s) do
    begin
      charValue := ord(s[i]);
      charValue := charValue XOR key;
      newText := newText + char(charValue);
    end;
   Result := newText;
end;

function Tdm_Metrofiler.NewDecrypt (s: string; Key: Word) : string;
Var
  i   :Integer;
begin
  for i := 0 to Length(s) do
    s[i] := char(ord(s[i]) - Key);
  result := s;
end;

function Tdm_Metrofiler.NewEncrypt (s: string; Key: Word) : string;
Var
  i   :Integer;
begin
  for i := 0 to Length(s) do
    s[i] := char(ord(s[i]) + Key);
  result := s;
end;

function Tdm_Metrofiler.EncryptPassw(Password :String):String;
begin
  Result := RegSec2.pNCrypt(Password, 'm3Tr0f1L3R007');
end;

function Tdm_Metrofiler.DecryptPassw(Password :String):String;
begin
  Result := RegSec2.pDCrypt(Password, 'm3Tr0f1L3R007');
end;

function Tdm_Metrofiler.LeftPad(value :integer; length :integer; pad :char):string;
begin
  result := RightStr(StringOfChar(pad,length) + IntToStr(value), length );
end;

function Tdm_Metrofiler.GetUniqueTempFile(Filename :String):String;
Var
  J       :Integer;
  Prefix  :String;
  Ext     :String;
  TempStr :String;
begin
  Ext := ExtractFileExt(Filename);
  Prefix := Filename;
  Delete(Prefix, pos(Ext, Prefix), length(Ext));
  Repeat
    Randomize;
    J := Random(2147483647);
    TempStr := GetTempDir+Prefix+InttoStr(J)+Ext;
  Until FileExists(TempStr) = False;
  Result := TempStr;
end;

function Tdm_Metrofiler.GetTempDir :String;
{$IFNDEF WIN32}
  const MAX_PATH = 144;
{$ENDIF}
Var
  a    :array[0..MAX_PATH] of Char;
begin
  IF GetTempPath(sizeof(a), a) <> 0 Then
    begin
      Result := StrPas(a);
      If copy(Result, length(Result), 1) <> '\' Then
        Result := Result + '\';
    end
  else Result := 'Error';
end;

procedure GetUserNameEx(NameFormat: DWORD;
  lpNameBuffer: LPSTR; nSize: PULONG); stdcall;
  external 'secur32.dll' Name 'GetUserNameExA';

function Tdm_Metrofiler.GetLoggedOnUser :String;
const
  NameUnknown = 0; // Unknown name type.
  NameFullyQualifiedDN = 1;  // Fully qualified distinguished name
  NameSamCompatible = 2; // Windows account name
  NameDisplay = 3;  // A "friendly" display name
  NameUniqueId = 6; // GUID string that the IIDFromString function returns
  NameCanonical = 7;  // Complete canonical name
  NameUserPrincipal = 8; // User principal name
  NameCanonicalEx = 9;
  NameServicePrincipal = 10;  // Generalized service principal name
  DNSDomainName = 11;  // DNS domain name, plus the user name

function LoggedOnUserNameEx(fFormat: DWORD): string;
var
  UserName: array[0..250] of char;
  Size: DWORD;
begin
  Size := 250;
  GetUserNameEx(fFormat, @UserName, @Size);
  Result := UserName;
end;

begin
  Result := LoggedOnUserNameEx(NameSamCompatible);
end;

function Tdm_Metrofiler.GetLoggedOnComputerName :String;
var
  c: array[0..127] of Char;
  computer: string;
  sz: dword;
begin
  sz := SizeOf(c);
  GetComputerName(c, sz);
  computer := c;
  Result := computer;
end;


procedure Tdm_Metrofiler.Delay(ms : Dword);
var
  TheTime   :DWord;
begin
  TheTime := GetTickCount + ms;
  while GetTickCount < TheTime do
    begin
      Sleep(5);
      Application.ProcessMessages;
    end;
end;

function Tdm_Metrofiler.ShellExecAndWait(App, Params: string; Visibility : Integer; var ResultingExitCode : DWord): Boolean;
var
 Msg: TMsg;
 E : TShellExecuteInfo;
begin
 FillChar(E, SizeOf(E), 0); // Superfulous, but what the heck!
 E.cbSize := sizeof(E);
 E.fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_NO_UI;
 E.wnd := 0; // Still not sure about leaving this at zero.
 E.lpVerb := nil; // Defaults to 'open'.
 E.lpFile := PChar(App); // Application or document to open.
 E.lpParameters := PChar(Params); // Optional Command line parameter.
 E.lpDirectory := nil; // Defaults to current directory.
 E.nShow := Visibility; // E.g. SW_SHOW or SW_HIDE.
 if ShellExecuteEx(@E) then
 begin
   repeat
     while PeekMessage(Msg, 0, 0, 0, pm_Remove) do
     begin
       if Msg.Message = wm_Quit then
         Halt(Msg.WParam);
       TranslateMessage(Msg);
       DispatchMessage(Msg);
     end;
   until WaitForSingleObject(E.hProcess, 50) <> WAIT_TIMEOUT;
   GetExitCodeProcess(E.hProcess, ResultingExitCode);
   CloseHandle(E.hProcess); // Prevent leakage.
   Result := True; // ShellExecuteEx succeeded.
 end
 else
 begin
   ResultingExitCode:=1; // Just so that it is not left undefined.
   Result:=False; // ShellExecuteEx failed.
 end;
end;

function Tdm_Metrofiler.GetServTimeNow:TDateTime;
begin
  qry_SQL.Close;
  qry_SQL.SQL.Text := 'SELECT GetDate()';
  qry_SQL.Open;
  Result := qry_SQL.Fields[0].asDateTime;
  qry_SQL.Close;
end;


function Tdm_Metrofiler.ConnectDB():Boolean;
begin
  If ADOConnect_mFiler.Connected Then
    begin
      Result := True;
      exit;
    end;
//----
  try
    ADOConnect_mFiler.Close;
    ADOConnect_mFiler.ConnectionString :=  dm_MetroFiler.ConnectionString;
    ADOConnect_mFiler.Open;
  except
    On E:Exception Do
      begin
        Messagedlg('Cannot Connect! Reason: '+E.Message, mtError, [mbOK], 0);
      end;
  end;
  Result := ADOConnect_mFiler.Connected;
end;

function Tdm_Metrofiler.DisconnectDB:Boolean;
begin
  try
    ADOConnect_mFiler.Close;
  finally
    Result := NOT(ADOConnect_mFiler.Connected);
  end;
end;

procedure Tdm_Metrofiler.DataModuleCreate(Sender: TObject);
begin
  TempDocuments := TStringList.Create;
  CachedDatasets := TList.Create;
end;

procedure Tdm_Metrofiler.DataModuleDestroy(Sender: TObject);
Var
  J   :Integer;
begin
  ClearCache;
  For J := 0 to TempDocuments.Count-1 Do
    begin
      SysUtils.DeleteFile(TempDocuments.Strings[J]);
    end;

  TempDocuments.Free;
end;

function Tdm_Metrofiler.SaveERecToRepositry(eRecNo :Integer; Filename, UserID :String):Integer;
Var
  DocName        :String;
  DocType        :String;
  NewFilename    :String;
  LocationType   :String;
  LocationPath   :String;
  RecordType     :String;
  NewERecNo      :Integer;
  FileBatchNo    :Integer;
  sFileBatchNo   :String;
  FileImageNo    :Integer;
  PageCount      :Integer;
  aPDFDoc        :TDebenuPDFLibrary;

Procedure GetGlobalParameter;
begin
  qry_ReadImage.Close;
  qry_ReadImage.SQL.Clear;
  qry_ReadImage.SQL.Add('SELECT * FROM MetroSystem WHERE Descr = ''eRecLocType''');
  qry_ReadImage.Open;
  If (qry_ReadImage.IsEmpty) Then
    begin
      LocationType := 'SQL';
      LocationPath := '';
    end
  else If (UpperCase(trim(qry_ReadImage.FieldbyName('sValue').AsString)) = 'SQL-SERVER') Then
    begin
      LocationType := 'SQL';
    end
  else If (UpperCase(trim(qry_ReadImage.FieldbyName('sValue').AsString)) = 'FILE-SYSTEM') Then
    begin
      LocationType := 'FILE';
      qry_ReadImage.Close;
      qry_ReadImage.SQL.Clear;
      qry_ReadImage.SQL.Add('SELECT * FROM MetroSystem WHERE Descr = ''eRecFileLoc''');
      qry_ReadImage.Open;
      LocationPath := trim(qry_ReadImage.FieldbyName('sValue').AsString);
    end;
  qry_ReadImage.Close;
end;

Procedure GetIndexDefParameter(mRecordType :String);
begin
  qry_ReadImage.Close;
  qry_ReadImage.SQL.Clear;
  qry_ReadImage.SQL.Add('SELECT eRecStoreType, eRecFileStoreLoc, FileBatchNo, FileImageNo FROM IndexDefinitions WHERE Description = '+QuotedStr(mRecordType));
  qry_ReadImage.Open;
  If UpperCase(trim(qry_ReadImage.FieldbyName('eRecStoreType').AsString)) = 'SQL-SERVER' Then
    begin
      LocationType := 'SQL';
      LocationPath := '';
      FileBatchNo := 0;
      FileImageNo := 0;
    end
  else If (UpperCase(trim(qry_ReadImage.FieldbyName('eRecStoreType').AsString)) = 'FILE-SYSTEM') Then
    begin
      LocationType := 'FILE';
      LocationPath := trim(qry_ReadImage.FieldbyName('eRecFileStoreLoc').AsString);
      FileBatchNo := qry_ReadImage.FieldbyName('FileBatchNo').AsInteger;
      FileImageNo := qry_ReadImage.FieldbyName('FileImageNo').AsInteger;

      If FileBatchNo <= 0 Then
        FileBatchNo := 1;

      If FileImageNo >= 10000 Then
        begin
          FileImageNo := 1;
          Inc(FileBatchNo);

          qry_ReadImage.Close;
          qry_ReadImage.SQL.Clear;
          qry_ReadImage.SQL.Add('UPDATE IndexDefinitions SET FileBatchNo = :FileBatchNo,  FileImageNo = :FileImageNo');
          qry_ReadImage.SQL.Add('WHERE Description = :Description');
          qry_ReadImage.Parameters.ParamValues['FileBatchNo'] := FileBatchNo;
          qry_ReadImage.Parameters.ParamValues['FileImageNo'] := FileImageNo;
          qry_ReadImage.Parameters.ParamValues['Description'] := mRecordType;
          qry_ReadImage.ExecSQL;
        end
      else
        begin
          Inc(FileImageNo);

          qry_ReadImage.Close;
          qry_ReadImage.SQL.Clear;
          qry_ReadImage.SQL.Add('UPDATE IndexDefinitions SET FileImageNo = :FileImageNo');
          qry_ReadImage.SQL.Add('WHERE Description = :Description');
          qry_ReadImage.Parameters.ParamValues['FileImageNo'] := FileImageNo;
          qry_ReadImage.Parameters.ParamValues['Description'] := mRecordType;
          qry_ReadImage.ExecSQL;
        end;

      sFileBatchNo := LeftPad(FileBatchNo, 6, '0');

      If copy(LocationPath, length(LocationPath), 1) <> '\' Then
        LocationPath := LocationPath + '\';

      LocationPath := LocationPath + sFileBatchNo + '\';

      ForceDirectories(LocationPath);
    end;
  qry_ReadImage.Close;
end;


begin
  Result := -1;
  try
//------------------------First Check Where to Save-----------------------------
    If eRecNo = 0 Then
      begin
        GetGlobalParameter;
      end
    else
      begin
        qry_ReadImage.Close;
        qry_ReadImage.SQL.Clear;
        qry_ReadImage.SQL.Add('SELECT RecordType FROM eRecords WHERE eRecNo = '+InttoStr(eRecNo));
        qry_ReadImage.Open;
//--------
        If qry_ReadImage.IsEmpty Then
          begin
            GetGlobalParameter;
          end
        else
          begin
            RecordType := trim(qry_ReadImage.FieldbyName('RecordType').asString);
            qry_ReadImage.Close;
            qry_ReadImage.SQL.Clear;
            qry_ReadImage.SQL.Add('SELECT Description FROM IndexDefinitions WHERE Description = '+QuotedStr(RecordType));
            qry_ReadImage.Open;
            If qry_ReadImage.IsEmpty Then
              begin
                GetGlobalParameter;
              end
            else
              begin
                GetIndexDefParameter(RecordType);
              end;
          end;
      end;
//-------------------------SQL-Server-------------------------------------------
   If LocationType = 'SQL' Then
     begin
        DocName := ExtractFilename(Filename);
        DocType := ExtractFileExt(DocName);

        If (Trim(UpperCase(DocType)) = '.TIF')OR
           (Trim(UpperCase(DocType)) = '.TIFF')Then
          begin
            PageCount := EnumTIFFIm(Filename);
          end
        else If (Trim(UpperCase(DocType)) = '.PDF')Then
          begin
            PageCount := GetPDFPageCount(Filename);
          end
        else
          begin
            PageCount := 1;
          end;
      //----
        qry_InsertImage.Close;
        qry_InsertImage.SQL.Clear;
        qry_InsertImage.SQL.Add('INSERT INTO eRecordImages (eRecNo, DocName, UserId, Filename, ScannedDoc, PageCount)');
        qry_InsertImage.SQL.Add('VALUES (:eRecNo, :DocName, :UserId, :Filename, :ScannedDoc, :PageCount)');
        qry_InsertImage.Parameters.ParamValues['eRecNo'] := eRecNo;
        qry_InsertImage.Parameters.ParamValues['DocName'] := DocName;
        qry_InsertImage.Parameters.ParamValues['UserId'] := UserID;
        qry_InsertImage.Parameters.ParamValues['Filename'] := NULL;
        qry_InsertImage.Parameters.ParamByName('ScannedDoc').LoadFromFile(Filename, ftBlob);
        qry_InsertImage.Parameters.ParamValues['PageCount'] := PageCount;
        qry_InsertImage.ExecSQL;
        Result := 1;
      end;
//-------------------------File-System Save-------------------------------------------
    If LocationType = 'FILE' Then
      begin
        DocName := ExtractFilename(Filename);
        DocType := ExtractFileExt(DocName);

        If (Trim(UpperCase(DocType)) = '.TIF')OR
           (Trim(UpperCase(DocType)) = '.TIFF')Then
          begin
            PageCount := EnumTIFFIm(Filename);
          end
        else If (Trim(UpperCase(DocType)) = '.PDF')Then
          begin
            PageCount := GetPDFPageCount(Filename);
          end
        else
          begin
            PageCount := 1;
          end;
//------------Add Blank Index to get eRecNo
        qry_InsertImage.Close;
        qry_InsertImage.SQL.Clear;
        qry_InsertImage.SQL.Add('SET NOCOUNT On');
        qry_InsertImage.SQL.Add('INSERT INTO eRecordImages (eRecNo, DocName, UserId, Filename, ScannedDoc, PageCount)');
        qry_InsertImage.SQL.Add('VALUES (:eRecNo, :DocName, :UserId, :Filename, :ScannedDoc, :PageCount)');
        qry_InsertImage.SQL.Add('SET NOCOUNT Off');
        qry_InsertImage.SQL.Add('SELECT SCOPE_IDENTITY() AS TrxNo');
        qry_InsertImage.Parameters.ParamValues['eRecNo'] := eRecNo;
        qry_InsertImage.Parameters.ParamValues['DocName'] := DocName;
        qry_InsertImage.Parameters.ParamValues['UserId'] := UserID;
        qry_InsertImage.Parameters.ParamByName('ScannedDoc').DataType := ftBlob;
        qry_InsertImage.Parameters.ParamValues['ScannedDoc'] := NULL;
        qry_InsertImage.Parameters.ParamValues['Filename'] := '';
        qry_InsertImage.Parameters.ParamValues['PageCount'] := PageCount;
        qry_InsertImage.Open;
        NewERecNo := qry_InsertImage.Fields[0].AsInteger;
//------------Make New Filename from eRecNo and Store it
        NewFilename := LocationPath + InttoStr(NewERecNo)+DocType;
        CopyFile(Filename, NewFilename, True);
//------------Update Index with new filename
        qry_InsertImage.Close;
        qry_InsertImage.SQL.Clear;
        qry_InsertImage.SQL.Add('UPDATE eRecordImages SET');
        qry_InsertImage.SQL.Add('   FileName = '+QuotedStr(NewFilename));
        qry_InsertImage.SQL.Add('WHERE TrxNo = '+InttoStr(NewERecNo));
        qry_InsertImage.ExecSQL;
//------------
        Result := 1;
      end;
  finally
    qry_InsertImage.Close;
    qry_ReadImage.Close;
  end;
end;

function Tdm_Metrofiler.ReadERecFromRepositry(Module  :String; TrxNo :Integer):String;

// returns file size in bytes or -1 if not found.
function eRecFileSize(fileName : wideString) : Int64;
var
  sr : TSearchRec;
begin
  if FindFirst(fileName, faAnyFile, sr ) = 0 then
     result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow)
  else
     result := -1;

  SysUtils.FindClose(sr);
end;

Var
  TempFilename   :String;
  SQLFilename    :String;
begin
  Result := '<Error>';
  try
//==============================================================================
//==============================================================================
//==============================================================================
    qry_ReadImage.Close;
    qry_ReadImage.SQL.Clear;
    qry_ReadImage.SQL.Add('SELECT * FROM eRecordImages WHERE TrxNo = :TrxNo');
    qry_ReadImage.Parameters.ParamByName('TrxNo').Value := TrxNo;
    qry_ReadImage.Open;
    If not(qry_ReadImage.FieldbyName('ScannedDoc').IsNull) Then
      begin
        TempFilename := GetUniqueTempFile(trim(qry_ReadImage.FieldByName('DocName').AsString));
        TBlobField(qry_ReadImage.Fieldbyname('ScannedDoc')).SaveToFile(TempFilename);
        dm_Metrofiler.TempDocuments.Add(TempFilename);
        dm_Metrofiler.InsAudit('View eRecord', TrxNo, qry_ReadImage.Fieldbyname('eRecNo').AsInteger, '', '', eRecFileSize(TempFilename));
        Result := TempFilename;
        exit;
      end;
//==============================================================================
//==============================================================================
//==============================================================================
    If trim(qry_ReadImage.FieldbyName('Filename').asString) <> '' Then
      begin
        SQLFilename := TRIM(qry_ReadImage.FieldByName('Filename').AsString);
        If not FileExists(SQLFilename) Then
          begin
            Messagedlg('eRecord does not exists in File-System. File Details: '+SQLFilename+'.', mtWarning, [mbOK], 0);
            Result := '';
            exit;
          end;
        try
          TempFilename := GetUniqueTempFile(trim(ExtractFileName(qry_ReadImage.FieldByName('DocName').AsString)));

          CopyFile(SQLFilename, TempFilename, False);
          dm_Metrofiler.TempDocuments.Add(TempFilename);
        except
          Messagedlg('Could not read eRecord from the File-System. File Details: '+SQLFilename+'.', mtWarning, [mbOK], 0);
          Result := '';
          exit;
        end;

        If Module = 'eRecords' Then
          dm_Metrofiler.InsAudit('View eRecord', TrxNo, qry_ReadImage.Fieldbyname('eRecNo').AsInteger, '', '', eRecFileSize(TempFilename));
        Result := TempFilename;
        exit;
      end;
  finally
    qry_ReadImage.Close;
  end;
end;

function Tdm_Metrofiler.DeleteERecFromRepositry(TrxNo :Integer; DeleteIndex :Boolean):String;
Var
  RepFilename   :String;
begin
  try
    qry_ReadImage.Close;
    qry_ReadImage.SQL.Clear;
    qry_ReadImage.SQL.Add('SELECT * FROM eRecordImages WHERE TrxNo = '+InttoStr(TrxNo));
    qry_ReadImage.Open;
    repFilename := trim(qry_ReadImage.FieldbyName('Filename').asString);
    If repFilename <> '' Then
      begin
        SysUtils.DeleteFile(RepFilename);
        If DeleteIndex Then
          begin
            qry_ReadImage.Close;
            qry_ReadImage.SQL.Clear;
            qry_ReadImage.SQL.Add('DELETE FROM eRecordImages WHERE TrxNo = '+InttoStr(TrxNo));
            qry_ReadImage.ExecSQL;
          end;
      end
    else
      begin
        If DeleteIndex Then
          begin
            qry_ReadImage.Close;
            qry_ReadImage.SQL.Clear;
            qry_ReadImage.SQL.Add('DELETE FROM eRecordImages WHERE TrxNo = '+InttoStr(TrxNo));
            qry_ReadImage.ExecSQL;
          end;
      end;
  finally
    qry_ReadImage.Close;
  end;
end;

function Tdm_Metrofiler.UpdateERecRepositry(TrxNo :Integer):Integer;
Var
  DocName        :String;
  DocExt         :String;
  RepFilename    :String;
  LocationType   :String;
  LocationPath   :String;
  RecordType     :String;

  eRecNo         :Integer;
  Filename       :String;

  FileBatchNo    :Integer;
  sFileBatchNo   :String;
  FileImageNo    :Integer;

  ScanDocLength  :Integer;
  ExtFilename    :String;
  TempStr        :String;


Procedure GetGlobalParameter;
begin
  qry_ReadImage.Close;
  qry_ReadImage.SQL.Clear;
  qry_ReadImage.SQL.Add('SELECT * FROM MetroSystem WHERE Descr = ''eRecLocType''');
  dm_Metrofiler.ExecuteCached(qry_ReadImage, EncodeTime(1,0,0,0));
  If (qry_ReadImage.IsEmpty) Then
    begin
      LocationType := 'SQL';
      LocationPath := '';
    end
  else If (UpperCase(trim(qry_ReadImage.FieldbyName('sValue').AsString)) = 'SQL-SERVER') Then
    begin
      LocationType := 'SQL';
      LocationPath := '';
    end
  else If (UpperCase(trim(qry_ReadImage.FieldbyName('sValue').AsString)) = 'FILE-SYSTEM') Then
    begin
      LocationType := 'FILE';
      qry_ReadImage.Close;
      qry_ReadImage.SQL.Clear;
      qry_ReadImage.SQL.Add('SELECT * FROM MetroSystem WHERE Descr = ''eRecFileLoc''');
      dm_Metrofiler.ExecuteCached(qry_ReadImage, EncodeTime(1,0,0,0));
      LocationPath := trim(qry_ReadImage.FieldbyName('sValue').AsString);
    end;
  qry_ReadImage.Close;
end;

Procedure GetIndexDefParameter(mRecordType :String; ReadOnly :Boolean);
begin

  qry_ReadImage.Close;
  qry_ReadImage.SQL.Clear;
  qry_ReadImage.SQL.Add('SELECT eRecStoreType, eRecFileStoreLoc, FileBatchNo, FileImageNo FROM IndexDefinitions WHERE Description = :Description');
  qry_ReadImage.Parameters.ParamValues['Description'] := mRecordType;
  If ReadOnly Then
    dm_Metrofiler.ExecuteCached(qry_ReadImage, EncodeTime(1,0,0,0))
  else
    qry_ReadImage.Open;
  If UpperCase(trim(qry_ReadImage.FieldbyName('eRecStoreType').AsString)) = 'SQL-SERVER' Then
    begin
      LocationType := 'SQL';
      LocationPath := '';
      FileBatchNo := 0;
      FileImageNo := 0;
    end
  else If (UpperCase(trim(qry_ReadImage.FieldbyName('eRecStoreType').AsString)) = 'FILE-SYSTEM') Then
    begin
      LocationType := 'FILE';
      LocationPath := '';
      FileBatchNo := 0;
      FileImageNo := 0;

      If not ReadOnly Then
        begin
          FileBatchNo := qry_ReadImage.FieldbyName('FileBatchNo').AsInteger;
          FileImageNo := qry_ReadImage.FieldbyName('FileImageNo').AsInteger;

          If FileBatchNo <= 0 Then
              FileBatchNo := 1;

          If FileImageNo >= 10000 Then
            begin
              FileImageNo := 1;
              Inc(FileBatchNo);

              qry_ReadImage.Close;
              qry_ReadImage.SQL.Clear;
              qry_ReadImage.SQL.Add('UPDATE IndexDefinitions SET FileBatchNo = :FileBatchNo,  FileImageNo = :FileImageNo');
              qry_ReadImage.SQL.Add('WHERE Description = :Description');
              qry_ReadImage.Parameters.ParamValues['FileBatchNo'] := FileBatchNo;
              qry_ReadImage.Parameters.ParamValues['FileImageNo'] := FileImageNo;
              qry_ReadImage.Parameters.ParamValues['Description'] := mRecordType;
              qry_ReadImage.ExecSQL;
            end
          else
            begin
              Inc(FileImageNo);

              qry_ReadImage.Close;
              qry_ReadImage.SQL.Clear;
              qry_ReadImage.SQL.Add('UPDATE IndexDefinitions SET FileImageNo = :FileImageNo');
              qry_ReadImage.SQL.Add('WHERE Description = :Description');
              qry_ReadImage.Parameters.ParamValues['FileImageNo'] := FileImageNo;
              qry_ReadImage.Parameters.ParamValues['Description'] := mRecordType;
              qry_ReadImage.ExecSQL;
            end;

          sFileBatchNo := LeftPad(FileBatchNo, 6, '0');

          If copy(LocationPath, length(LocationPath), 1) <> '\' Then
            LocationPath := LocationPath + '\';

          LocationPath := LocationPath + sFileBatchNo + '\';

          ForceDirectories(LocationPath);
        end;
    end;
  qry_ReadImage.Close;
end;

begin
  Result := -1;
  try
//------------------------Get eRecNo Details----------
    qry_ReadImage.Close;
    qry_ReadImage.SQL.Clear;
    qry_ReadImage.SQL.Add('SELECT');
    qry_ReadImage.SQL.Add('	i.TrxNo,');
    qry_ReadImage.SQL.Add('	i.eRecNo,');
    qry_ReadImage.SQL.Add('	i.DocName,');
    qry_ReadImage.SQL.Add('	DATALENGTH(i.ScannedDoc) AS ScanDocLength, ');
    qry_ReadImage.SQL.Add('	i.Filename,');
    qry_ReadImage.SQL.Add('	e.RecordType');
    qry_ReadImage.SQL.Add('FROM');
    qry_ReadImage.SQL.Add('	eRecordImages i');
    qry_ReadImage.SQL.Add('	LEFT OUTER JOIN eRecords e ON e.eRecNo = i.eRecNo');
    qry_ReadImage.SQL.Add('WHERE');
    qry_ReadImage.SQL.Add('	i.TrxNo = :TrxNo');
    qry_ReadImage.Parameters.ParamByName('TrxNo').Value := TrxNo;
    qry_ReadImage.Open;
    If qry_ReadImage.IsEmpty Then
      exit;

    eRecNo := qry_ReadImage.FieldbyName('eRecNo').asInteger;
    DocName := qry_ReadImage.FieldbyName('DocName').asString;
    ScanDocLength := qry_ReadImage.FieldbyName('ScanDocLength').asInteger;
    ExtFilename := Trim(UpperCase(qry_ReadImage.FieldbyName('Filename').asString));
    RecordType := qry_ReadImage.FieldbyName('RecordType').asString;
    qry_ReadImage.Close;

    Filename := ReadERecFromRepositry('', TrxNo);
//------------------------Check if we need to update the Location---------------
    If (eRecNo = 0)or(trim(RecordType) = '') Then
      begin
        GetGlobalParameter;
      end
    else
      begin
        GetIndexDefParameter(RecordType, true);
      end;

    If ((LocationType = 'SQL') AND (ExtFilename = '')) Then
      exit;

    If ((LocationType = 'FILE') AND (ScanDocLength = 0)) Then
      begin
        TempStr := String_Reverse(ExtFilename);
        Delete(TempStr, 1, pos('\', TempStr));//Delete Filename
        Delete(TempStr, 1, pos('\', TempStr));//Delete BatchNo
        TempStr := String_Reverse(TempStr);
        If UpperCase(LocationPath) = UpperCase(TempStr) Then
          exit;
      end;

    If ((LocationType = 'FILE')and(RecordType <> '')) Then
      GetIndexDefParameter(RecordType, false);
//-------------------------SQL-Server-------------------------------------------
   If LocationType = 'SQL' Then
     begin
        DocName := ExtractFilename(Filename);
        DocExt := ExtractFileExt(DocName);
        If DocExt[1] ='.' Then Delete(DocExt, 1, 1);
      //----
        DeleteERecFromRepositry(TrxNo, False);
        qry_InsertImage.Close;
        qry_InsertImage.SQL.Clear;
        qry_InsertImage.SQL.Add('UPDATE eRecordImages SET');
        qry_InsertImage.SQL.Add('  FileName = :Filename,');
        qry_InsertImage.SQL.Add('  ScannedDoc = :ScannedDoc');
        qry_InsertImage.SQL.Add('WHERE TrxNo = :TrxNo');
        qry_InsertImage.Parameters.ParamValues['Filename'] := NULL;
        qry_InsertImage.Parameters.ParamByName('ScannedDoc').LoadFromFile(Filename, ftBlob);
        qry_InsertImage.Parameters.ParamByName('TrxNo').Value := TrxNo;
        qry_InsertImage.ExecSQL;

        Result := 1;
     end;
//-------------------------File-System Save-------------------------------------------
   If LocationType = 'FILE' Then
     begin
//------------Work out Extention
        DocExt := ExtractFileExt(DocName);
        If DocExt[1] ='.' Then Delete(DocExt, 1, 1);
//------------Make New Filename from eRecNo and Store it
        RepFilename := LocationPath + InttoStr(TrxNo)+'.'+DocExt;
        CopyFile(Filename, RepFilename, True);
        DeleteERecFromRepositry(TrxNo, false);
//------------Update Index with new filename
        qry_InsertImage.Close;
        qry_InsertImage.SQL.Clear;
        qry_InsertImage.SQL.Add('UPDATE eRecordImages SET');
        qry_InsertImage.SQL.Add('  FileName = :Filename,');
        qry_InsertImage.SQL.Add('  ScannedDoc = :ScannedDoc');
        qry_InsertImage.SQL.Add('WHERE TrxNo = :TrxNo');
        qry_InsertImage.Parameters.ParamValues['Filename'] := RepFilename;
        qry_InsertImage.Parameters.ParamByName('ScannedDoc').DataType := FTBlob;
        qry_InsertImage.Parameters.ParamValues['ScannedDoc'] := NULL;
        qry_InsertImage.Parameters.ParamByName('TrxNo').Value := TrxNo;
        qry_InsertImage.ExecSQL;
//------------
        Result := 1;
      end;
  finally
    qry_InsertImage.Close;
    qry_ReadImage.Close;
  end;
end;

function Tdm_Metrofiler.InsAudit(AuditType: String; TrxNo :Integer; eRecNo :Integer; Barcode, Comment :String; Bytes :Integer):Boolean;
begin
  try
    qry_InsAud.Close;
    qry_InsAud.Parameters.ParamValues['UserId'] := User;
    qry_InsAud.Parameters.ParamValues['AuditType'] := AuditType;
    qry_InsAud.Parameters.ParamValues['System'] := 'Metrofiler';

    If Barcode <> '' Then
      qry_InsAud.Parameters.ParamValues['Barcode'] := Barcode
    else qry_InsAud.Parameters.ParamByName('Barcode').Value := null;

    If Comment <> '' Then
      qry_InsAud.Parameters.ParamValues['Comment'] := Comment
    else qry_InsAud.Parameters.ParamByName('Comment').Value := null;

    If TrxNo <> 0 Then
      qry_InsAud.Parameters.ParamValues['TrxNo'] := TrxNo
    else qry_InsAud.Parameters.ParamByName('TrxNo').Value := null;

    If eRecNo <> 0 Then
      qry_InsAud.Parameters.ParamValues['eRecNo'] := eRecNo
    else qry_InsAud.Parameters.ParamValues['eRecNo'] := null;

    If Bytes <> 0 Then
      qry_InsAud.Parameters.ParamValues['Bytes'] := Bytes
    else qry_InsAud.Parameters.ParamValues['Bytes'] := null;

    qry_InsAud.ExecSQL;
  finally
    Result := (qry_InsAud.RowsAffected > 0);
    qry_InsAud.Close;
  end;
end;

procedure Tdm_Metrofiler.CopyFile(Const sourcefilename, targetfilename: String; COMPR :Boolean);
var
  InStrm : TStream;
  ZStrm : TCustomZLibStream;
  OutStrm: TStream;
  Buffer : Array[0..4095] of Char;
  nSize  :Integer;
begin
  If COMPR Then
    begin
      InStrm := TFileStream.create(sourcefilename, fmOpenRead + fmShareDenyWrite);
      OutStrm := TFileStream.create(targetfilename, fmCreate);
      try
        ZStrm := TCompressionStream.Create(clFastest, OutStrm);
        try
          ZStrm.CopyFrom(InStrm, 0);
        finally
          ZStrm.Free;
        end;
      finally
        OutStrm.free; //Freeing the stream finishes and closes the file on disk
        InStrm.free;
      end;
    end
  else
    begin
      InStrm := TFilestream.Create(sourcefilename, fmOpenRead);
      OutStrm := TFileStream.Create(targetfilename, fmCreate);
      ZStrm := TDecompressionStream.Create(InStrm);
      try
        nSize := 4096;
        while nSize > 0 do begin
          nSize := ZStrm.Read(Buffer, 4096);
          if nSize > 0 then OutStrm.Write(Buffer, nSize);
        end;
      finally
        ZStrm.Free;
        OutStrm.Free;
        InStrm.Free;
      end;
    end;
end;

procedure Tdm_Metrofiler.PrintContReturnSlip(Container, Warehouse, Location :String);
var
  Temp, S, PrinterName                 :String;
  DocInfo1                :TDocInfo1;
  Handle                  :THandle;
  N                       :DWORD;
  sDest                   :String;
  PageNum :string;
  x,PHeight,LineSpace :integer;
begin
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT ContLocPrint FROM Company');
  qry_SQL.Open;
  If qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      exit;
    end;
  sDest := UpperCase(trim(qry_SQL.FieldByName('ContLocPrint').asString));
  qry_SQL.Close;

  If sDest = 'PRINT TO ELTRON PRINTER' Then
    begin
      If PromptPrinter_for_PrintRecordwithDrawelSlip Then
        if not PrintDialog.Execute then
          exit;

      PromptPrinter_for_PrintRecordwithDrawelSlip := True;
      Temp := Printer.Printers.Strings[Printer.PrinterIndex];
      If Pos(' on ',Temp) <> -1 Then
        begin
          Delete(Temp,Pos(' on ',Temp),length(Temp)-Pos(' on ',Temp)+1);
          PrinterName := Temp;
        end
      else PrinterName := Temp;
//========================Change the location===================================
      Temp := copy(location,1,2)+' '+
              copy(location,3,2)+' '+
              copy(location,5,2)+'/'+
              copy(location,7,2)+'*'+
              copy(location,9,2)+'*'+
              copy(location,11,2);
      location := temp;
//========================Now Print=============================================
      If not OpenPrinter(PChar(PrinterName), Handle, nil)then
        begin
          ShowMessage('error ' + IntToStr(GetLastError));
          Exit;
        end;
      With DocInfo1 do
        begin
           pDocName := PChar('Metrofile Container Return Label');
           pOutputFile := nil;
           pDataType := 'RAW';
        end;
      StartDocPrinter(Handle, 1, @DocInfo1);
      StartPagePrinter(Handle);
      try
        S := ''+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
        S := 'N'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);

        S := 'A40,10,0,3,1,1,N,"Metrofile Container Return Label"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);

        S := 'A50,50,0,3,1,1,N,"Barcode"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
        S := 'B70,80,0,1,3,7,80,B,"'+Container+'"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);

        S := 'A50,200,0,3,1,1,N,"Warehouse"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
        S := 'A70,240,0,4,1,1,N,"'+Warehouse+'"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);

        S := 'A50,280,0,3,1,1,N,"Location"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
        S := 'A70,320,0,4,1,1,N,"'+Location+'"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);


        S := 'P1'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
        S := ''+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
      finally
        EndDocPrinter(Handle);
        ClosePrinter(Handle);
      end;
    end
  else if sDest = 'PRINT TO NORMAL PRINTER' Then
    begin
      x := 0;
      If PromptPrinter_for_PrintRecordwithDrawelSlip Then
        if not PrintDialog.Execute then
          exit;

      PromptPrinter_for_PrintRecordwithDrawelSlip := True;
      Printer.BeginDoc;
      PHeight := Printer.PageHeight;
      LineSpace :=PHeight DIV 60;
      PageNum := IntToStr(Printer.PageNumber);
      //----------
      Printer.Canvas.TextOut(0,x,'Metrofile Container Return Label');
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'------------------------------------------------------');
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'Barcode: '+Container);
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'Warehouse: '+Warehouse);
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'Location: '+Location);
      Printer.EndDoc;
    end;
end;

procedure Tdm_Metrofiler.PrintContPutAwaySlip(Container, Warehouse, Location :String);
var
  Temp, S, PrinterName                 :String;
  DocInfo1                :TDocInfo1;
  Handle                  :THandle;
  N                       :DWORD;
  sDest                   :String;
  PageNum :string;
  x,PHeight,LineSpace :integer;
begin
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT ContLocPrint FROM Company');
  qry_SQL.Open;
  If qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      exit;
    end;
  sDest := UpperCase(trim(qry_SQL.FieldByName('ContLocPrint').asString));
  qry_SQL.Close;

  If sDest = 'PRINT TO ELTRON PRINTER' Then
    begin
      If not PrintDialog.Execute then
        begin
          exit;
        end;

      Temp := Printer.Printers.Strings[Printer.PrinterIndex];
      If Pos(' on ',Temp) <> -1 Then
        begin
          Delete(Temp,Pos(' on ',Temp),length(Temp)-Pos(' on ',Temp)+1);
          PrinterName := Temp;
        end
      else PrinterName := Temp;

//========================Change the location===================================
      Temp := copy(location,1,2)+' '+
              copy(location,3,2)+' '+
              copy(location,5,2)+'/'+
              copy(location,7,2)+'*'+
              copy(location,9,2)+'*'+
              copy(location,11,2);
      location := temp;
//========================Now Print=============================================
      If not OpenPrinter(PChar(PrinterName), Handle, nil)then
        begin
          ShowMessage('error ' + IntToStr(GetLastError));
          Exit;
        end;
      With DocInfo1 do
        begin
           pDocName := PChar('Metrofile Container Putaway Label');
           pOutputFile := nil;
           pDataType := 'RAW';
        end;
      StartDocPrinter(Handle, 1, @DocInfo1);
      StartPagePrinter(Handle);
      try
        S := ''+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
        S := 'N'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);

        S := 'A40,10,0,3,1,1,N,"Metrofile Container Putaway Label"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);

        S := 'A50,50,0,3,1,1,N,"Barcode"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
        S := 'B70,80,0,1,3,7,80,B,"'+Container+'"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);

        S := 'A50,200,0,3,1,1,N,"Warehouse"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
        S := 'A70,240,0,4,1,1,N,"'+Warehouse+'"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);

        S := 'A50,280,0,3,1,1,N,"Location"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
        S := 'A70,320,0,4,1,1,N,"'+Location+'"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);


        S := 'P1'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
        S := ''+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
      finally
        EndDocPrinter(Handle);
        ClosePrinter(Handle);
      end;
    end
  else if sDest = 'PRINT TO NORMAL PRINTER' Then
    begin
      x := 0;
      if PrintDialog.Execute then
        begin
          Printer.BeginDoc;
          PHeight := Printer.PageHeight;
          LineSpace :=PHeight DIV 60;
          PageNum := IntToStr(Printer.PageNumber);
          //----------
          Printer.Canvas.TextOut(0,x,'Metrofile Container Putaway Label');
          x := x + LineSpace;
          Printer.Canvas.TextOut(0,x,'------------------------------------------------------');
          x := x + LineSpace;
          Printer.Canvas.TextOut(0,x,'Barcode: '+Container);
          x := x + LineSpace;
          Printer.Canvas.TextOut(0,x,'Warehouse: '+Warehouse);
          x := x + LineSpace;
          Printer.Canvas.TextOut(0,x,'Location: '+Location);
          Printer.EndDoc;
        end;
    end;
end;

procedure Tdm_Metrofiler.PrintContReqSlip(Container, Requester :String);
var
  Temp, S, PrinterName                 :String;
  DocInfo1                :TDocInfo1;
  Handle                  :THandle;
  N                       :DWORD;
  sDest                   :String;
  PageNum :string;
  x,PHeight,LineSpace :integer;
begin
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT ContLocPrint FROM Company');
  qry_SQL.Open;
  If qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      exit;
    end;
  sDest := UpperCase(trim(qry_SQL.FieldByName('ContLocPrint').asString));
  qry_SQL.Close;

  If sDest = 'PRINT TO ELTRON PRINTER' Then
    begin
      If not PrintDialog.Execute then
        begin
          exit;
        end;

      Temp := Printer.Printers.Strings[Printer.PrinterIndex];
      If Pos(' on ',Temp) <> -1 Then
        begin
          Delete(Temp,Pos(' on ',Temp),length(Temp)-Pos(' on ',Temp)+1);
          PrinterName := Temp;
        end
      else PrinterName := Temp;
//========================Now Print=============================================
      If not OpenPrinter(PChar(PrinterName), Handle, nil)then
        begin
          ShowMessage('error ' + IntToStr(GetLastError));
          Exit;
        end;
      With DocInfo1 do
        begin
           pDocName := PChar('Metrofile Container Removal Label');
           pOutputFile := nil;
           pDataType := 'RAW';
        end;
      StartDocPrinter(Handle, 1, @DocInfo1);
      StartPagePrinter(Handle);
      try
        S := ''+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
        S := 'N'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);

        S := 'A40,10,0,3,1,1,N,"Metrofile Container Removal Label"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);

        S := 'A50,50,0,3,1,1,N,"Barcode"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
        S := 'B60,80,0,1,3,7,80,B,"'+Container+'"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);

        S := 'A50,200,0,3,1,1,N,"Requester"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
        S := 'A70,240,0,4,1,1,N,"'+Requester+'"'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);

        S := 'P1'+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
        S := ''+#10+#13;
        WritePrinter(Handle,PChar(S),Length(S), N);
      finally
        EndDocPrinter(Handle);
        ClosePrinter(Handle);
      end;
    end
  else if sDest = 'PRINT TO NORMAL PRINTER' Then
    begin
      x := 0;
      if PrintDialog.Execute then
        begin
          Printer.BeginDoc;
          PHeight := Printer.PageHeight;
          LineSpace :=PHeight DIV 60;
          PageNum := IntToStr(Printer.PageNumber);
          //----------
          Printer.Canvas.TextOut(0,x,'Metrofile Container Removal Label');
          x := x + LineSpace;
          Printer.Canvas.TextOut(0,x,'------------------------------------------------------');
          x := x + LineSpace;
          Printer.Canvas.TextOut(0,x,'Barcode: '+Container);
          x := x + LineSpace;
          Printer.Canvas.TextOut(0,x,'Requester: '+Requester);
          Printer.EndDoc;
        end;
    end;
end;

procedure Tdm_Metrofiler.PrintRecordwithDrawelSlip(PrinterIndx :Integer;Container, Warehouse, Location, RecordNo :String);
var
  x, LineSpace            :Integer;
begin
  x := 0;
  Printer.PrinterIndex := PrinterIndx;
  Printer.BeginDoc;
  Printer.Canvas.Font.Size := 10;
  Printer.Canvas.Font.PixelsPerInch := 300;
  LineSpace := Printer.PageHeight Div 60;
  Printer.Canvas.TextOut(0,x,'Metrofile File Insert Label');
  x := x + LineSpace;
  Printer.Canvas.TextOut(0,x,'------------------------------------------------------');
  x := x + LineSpace;
  x := x + LineSpace;
  Printer.Canvas.TextOut(0,x,'Container:'+Container);
  x := x + LineSpace;
  Printer.Canvas.TextOut(0,x,'Warehouse:'+Warehouse);
  x := x + LineSpace;
  Printer.Canvas.TextOut(0,x,'Location:'+Location);
  x := x + LineSpace;
  Printer.Canvas.TextOut(0,x,'RecordNo:'+RecordNo);
  x := x + LineSpace;
  Printer.Canvas.TextOut(0,x,'------------------------------------------------------------------------');
  Printer.EndDoc;
end;

procedure Tdm_Metrofiler.ShowBalloonTop(ControlHandle :THandle; Caption, MessageStr :WideString; Icon :Integer);
var
  ebt: tagEDITBALLOONTIP;
begin
  with ebt do
  begin
    cbStruct := SizeOf(ebt);
    pszTitle := PWideChar(Caption);
    pszText  := PWideChar(MessageStr);
    ttiIcon  := icon;
  end;
  SendMessage(ControlHandle, EM_SHOWBALLOONTIP, 0, Longint(@ebt));
end;

function Tdm_Metrofiler.CreateGuid: string;
var
  ID: TGUID;
  Str    :String;
begin
  Result := '';
  if CoCreateGuid(ID) = S_OK then
    Str := GUIDToString(ID);
  Result := copy(Str, 26, 12);
end;

function Tdm_Metrofiler.ExporttoXLS(Dataset :TDataset):Boolean;
var
 xls, wb, Range: OLEVariant;
 arrData: Variant;
 i, j    :Integer;
 T, Tot  :Integer;
begin
  try
      Dataset.Last;
      Tot := Dataset.RecordCount;
      arrData := VarArrayCreate([1, Tot+1, 1, Dataset.FieldCount], varVariant);
    //------
      For J := 0 to Dataset.FieldCount-1 do
        If Dataset.Fields[J].Visible Then
         arrData[1, J+1] := Dataset.Fields[J].FieldName;
      frm_Progress.Show;
      try
        Dataset.First;
        i := 1;
        T := 0;
        While not Dataset.Eof Do
          begin
            Inc(T);
            frm_Progress.Prog(Round(T/Tot*100));
            If frm_Progress.Cancelled Then
              break;
            Inc(I);
            Application.ProcessMessages;
            For J := 0 to Dataset.FieldCount-1 Do
              If Dataset.Fields[J].Visible Then
                begin
                  if Dataset.Fields[J].value <> null  then
                    arrData[I, J+1] := Dataset.Fields[J].Value
                  else
                    arrData[I, J+1] := '';
                end;

            Dataset.Next;
          end;
      finally
        frm_Progress.Hide;
      end;
    //------
     Screen.Cursor := crHourglass;
     xls := CreateOLEObject('Excel.Application');
    //------
     wb := xls.Workbooks.Add;
    //------
     Range := wb.WorkSheets[1].Range[wb.WorkSheets[1].Cells[1, 1],
     wb.WorkSheets[1].Cells[Tot+1, Dataset.FieldCount]];
    //------
     Range.Value := arrData;
    //------
     xls.Visible := True;
  finally
    Dataset.First;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tdm_Metrofiler.SaveSearchCookie(CookieType, CookieValue :String);
begin
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('IF EXISTS(SELECT * FROM SearchCookies WHERE UserID = :UserID1 AND CookieType = :CookieType1)');
  qry_SQL.SQL.Add('    UPDATE SearchCookies SET CookieValue = :CookieValue1 WHERE UserID = :UserID2 AND CookieType = :CookieType2');
  qry_SQL.SQL.Add('ELSE');
  qry_SQL.SQL.Add('    INSERT INTO SearchCookies (UserID, CookieType, CookieValue)');
  qry_SQL.SQL.Add('    VALUES (:UserID3, :CookieType3, :CookieValue2)');
  qry_SQL.Parameters.ParamValues['UserID1'] := User;
  qry_SQL.Parameters.ParamValues['UserID2'] := User;
  qry_SQL.Parameters.ParamValues['UserID3'] := User;
  qry_SQL.Parameters.ParamValues['CookieType1'] := CookieType;
  qry_SQL.Parameters.ParamValues['CookieType2'] := CookieType;
  qry_SQL.Parameters.ParamValues['CookieType3'] := CookieType;
  qry_SQL.Parameters.ParamValues['CookieValue1'] := CookieValue;
  qry_SQL.Parameters.ParamValues['CookieValue2'] := CookieValue;
  qry_SQL.ExecSQL;
end;

function Tdm_Metrofiler.GetSearchCookie(CookieType :String):String;
Var
  RefreshFlag    :Boolean;
  CookieValue    :String;
begin
  RefreshFlag := false;
  CookieValue := '';

  if not qry_CookieCache.Active then
    RefreshFlag := True
  else
    begin
      If CookieCacheExpire <= Now Then
        RefreshFlag := True
    end;

  if RefreshFlag then
    begin
      qry_CookieCache.Close;
      qry_CookieCache.SQL.Clear;
      qry_CookieCache.SQL.Add('SELECT CookieType, CookieValue FROM SearchCookies WHERE UserID = :UserID');
      qry_CookieCache.Parameters.ParamValues['UserID'] := User;
      qry_CookieCache.Open;
      CookieCacheExpire := Now + EncodeTime(0,0,10,0);
    end;

  qry_CookieCache.First;
  While not qry_CookieCache.EOF Do
    begin
      if qry_CookieCache.FieldByName('CookieType').AsString = CookieType then
        begin
          CookieValue := qry_CookieCache.FieldByName('CookieValue').AsString;
          break;
        end;
      qry_CookieCache.next;
    end;

  Result := CookieValue;
end;

function Tdm_Metrofiler.GetPDFPageCount(Filename :String):Integer;
Var
  aPDFDoc    :TDebenuPDFLibrary;
begin
  aPDFDoc := TDebenuPDFLibrary.Create;
  try
     aPDFDoc.UnlockKey(dm_Metrofiler.PDFLicKey);
     aPDFDoc.LoadFromFile(Filename, '');
     Result := aPDFDoc.PageCount;
  finally
    aPDFDoc.Free;
  end;
end;

end.
