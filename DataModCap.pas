//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit DataModCap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Variants, StrUtils, ADODB, DateUtils, DBCtrls;

type
  FieldPropertiesRecord = Record
    FieldName  :String;
    Alias      :String;
    UpperCase  :Boolean;
    Verify     :Boolean;
    Required   :Boolean;
    Validate   :Boolean;
  end;
  TDatModCap = class(TDataModule)
    qry_RecordType: TADOQuery;
    qry_3DWhouse: TADOQuery;
    qry_BrowseFiles: TADOQuery;
    qry_FileType: TADOQuery;
    qry_Items: TADOQuery;
    dts_Whouse: TDataSource;
    dts_Location: TDataSource;
    dts_BrowseFiles: TDataSource;
    dts_Items: TDataSource;
    dts_FileType: TDataSource;
    dts_Files: TDataSource;
    qry_FilesMain: TADOQuery;
    qry_Dept: TADOQuery;
    qry_Location: TADOQuery;
    qry_Loc: TADOQuery;
    tbl_Location: TADOTable;
    qry_FilesFind: TADOQuery;
    qry_GenSQL: TADOQuery;
    Qry_Files: TADOQuery;
    qry_SecureScan: TADOQuery;
    qry_FilesSearch: TADOQuery;
    dts_FilesSearch: TDataSource;
    ap_ExecSp: TADOQuery;
    qry_ItemView: TADOQuery;
    qry_CheckViewPerm: TADOQuery;
    qry_ContainersMain: TADOQuery;
    dts_ContainersMain: TDataSource;
    dts_RecordType: TDataSource;
    qry_WHouse: TADOQuery;
    dts_3DWhouse: TDataSource;
    qry_3DFileType: TADOQuery;
    dts_3DFileType: TDataSource;
    qry_GetConStatus: TADOQuery;
    dts_GetConStatus: TDataSource;
    qry_RecsinCont: TADOQuery;
    dts_ContType: TDataSource;
    qry_ContType: TADOQuery;
    qry_InsertHist: TADOQuery;
    qry_FilesMainFileNumber: TStringField;
    qry_FilesMainBoxNumber: TStringField;
    qry_FilesMainLocno: TStringField;
    qry_FilesMainRecordNo: TIntegerField;
    qry_FilesMainWarehouse: TStringField;
    qry_FilesMainLabeled: TStringField;
    qry_FilesMainStatus: TIntegerField;
    qry_FilesMainText1: TStringField;
    qry_FilesMainText2: TStringField;
    qry_FilesMainText3: TStringField;
    qry_FilesMainText4: TStringField;
    qry_FilesMainText5: TStringField;
    qry_FilesMainText6: TStringField;
    qry_FilesMainDate1: TDateTimeField;
    qry_FilesMainDate2: TDateTimeField;
    qry_FilesMainNumber1: TIntegerField;
    qry_FilesMainNumber2: TIntegerField;
    qry_FilesMainEntryDate: TDateTimeField;
    qry_FilesMainWip: TIntegerField;
    qry_FilesMainAons: TIntegerField;
    qry_FilesMainSaons: TIntegerField;
    qry_FilesMainInos: TIntegerField;
    qry_FilesMainDestruct: TDateTimeField;
    qry_FilesMainFileType: TStringField;
    qry_FilesMainUserId: TStringField;
    qry_FilesMainIssuedTo: TStringField;
    qry_FilesMainIssuedOn: TDateTimeField;
    qry_FilesMainIssueStatus: TStringField;
    qry_FilesMainReturnedOn: TDateTimeField;
    qry_FilesMainNoDest: TIntegerField;
    qry_FilesMainDestroy: TIntegerField;
    qry_FilesMainFilingMethod: TStringField;
    qry_FilesMainDepartment: TStringField;
    qry_FilesMainItTxNo: TIntegerField;
    qry_FilesMainContainerNo: TStringField;
    qry_FilesMainComments: TMemoField;
    qry_FilesMainBranch: TStringField;
    qry_FilesMainBranch_Name: TStringField;
    qry_FilesMainDept_Name: TStringField;
    qry_FilesMainWare_Name: TStringField;
    qry_ContainersMainContainer: TStringField;
    qry_ContainersMainLocno: TStringField;
    qry_ContainersMainWarehouse: TStringField;
    qry_ContainersMainText1: TStringField;
    qry_ContainersMainText2: TStringField;
    qry_ContainersMainText3: TStringField;
    qry_ContainersMainText4: TStringField;
    qry_ContainersMainText5: TStringField;
    qry_ContainersMainText6: TStringField;
    qry_ContainersMainDate1: TDateTimeField;
    qry_ContainersMainDate2: TDateTimeField;
    qry_ContainersMainNumber1: TIntegerField;
    qry_ContainersMainNumber2: TIntegerField;
    qry_ContainersMainEntryDate: TDateTimeField;
    qry_ContainersMainWip: TIntegerField;
    qry_ContainersMainAons: TIntegerField;
    qry_ContainersMainSaons: TIntegerField;
    qry_ContainersMainInos: TIntegerField;
    qry_ContainersMainDestruct: TDateTimeField;
    qry_ContainersMainFileType: TStringField;
    qry_ContainersMainUserId: TStringField;
    qry_ContainersMainIssuedTo: TStringField;
    qry_ContainersMainIssuedOn: TDateTimeField;
    qry_ContainersMainIssueStatus: TStringField;
    qry_ContainersMainReturnedOn: TDateTimeField;
    qry_ContainersMainNoDest: TIntegerField;
    qry_ContainersMainDestroy: TIntegerField;
    qry_ContainersMainDepartment: TStringField;
    qry_ContainersMainComments: TMemoField;
    qry_ContainersMainBranch: TStringField;
    qry_ContainersMainContType: TStringField;
    qry_ContainersMainBranch_Name: TStringField;
    qry_ContainersMainDept_Name: TStringField;
    qry_ContainersMainWare_Name: TStringField;
    qry_FilesMainCode: TStringField;
    qry_ContainersMainCode: TStringField;
    qry_BrowseItems: TADOQuery;
    dts_BrowseItems: TDataSource;
    qry_FilesMainText7: TStringField;
    qry_FilesMainText8: TStringField;
    qry_FilesMainText9: TStringField;
    qry_FilesMainText10: TStringField;
    qry_FilesMainDate3: TDateTimeField;
    qry_ContainersMainItTxNo: TIntegerField;
    qry_ContainersMainText7: TStringField;
    qry_ContainersMainText8: TStringField;
    qry_ContainersMainText9: TStringField;
    qry_ContainersMainText10: TStringField;
    qry_ContainersMainDate3: TDateTimeField;
    qry_FilesMainRetentionPeriod: TSmallintField;
    qry_ContainersMainRetentionPeriod: TSmallintField;
    qry_SQL: TADOQuery;
    qry_BrowseContainers: TADOQuery;
    dts_BrowseContainers: TDataSource;
    qry_ItemsItemNumber: TStringField;
    qry_ItemsFileNumber: TStringField;
    qry_ItemsDescription: TStringField;
    qry_ItemsFilingMethod: TStringField;
    qry_ItemsStatus: TStringField;
    qry_ItemsSentToFile: TDateTimeField;
    qry_ItemsDateFiled: TDateTimeField;
    qry_ItemsText1: TStringField;
    qry_ItemsText2: TStringField;
    qry_ItemsText3: TStringField;
    qry_ItemsText4: TStringField;
    qry_ItemsText5: TStringField;
    qry_ItemsText6: TStringField;
    qry_ItemsDate1: TDateTimeField;
    qry_ItemsItemFiler: TStringField;
    qry_ItemsWarehouse: TStringField;
    qry_ItemsLocNo: TStringField;
    qry_ItemsRecordNo: TIntegerField;
    qry_ItemsIssuedTo: TStringField;
    qry_ItemsIssuedOn: TDateTimeField;
    qry_ItemsitTxNo: TIntegerField;
    qry_ItemsDate2: TDateTimeField;
    qry_ItemsNumber1: TIntegerField;
    qry_ItemsNumber2: TIntegerField;
    qry_ItemsEntryDate: TDateTimeField;
    qry_ItemsUserId: TStringField;
    qry_ItemsIssuedUserID: TStringField;
    qry_ItemsFileType: TStringField;
    qry_ItemsText7: TStringField;
    qry_ItemsText8: TStringField;
    qry_ItemsText9: TStringField;
    qry_ItemsText10: TStringField;
    qry_ItemsDate3: TDateTimeField;
    qry_ItemsImportBatchNo: TIntegerField;
    qry_FilesMainRecordCat: TStringField;
    qry_FilesMainUpdatedBy: TStringField;
    qry_FilesMainUpdatedOn: TDateTimeField;
    qry_ItemsUpdatedBy: TStringField;
    qry_ItemsUpdatedOn: TDateTimeField;
    qry_ContainersMainUpdatedBy: TStringField;
    qry_ContainersMainUpdatedOn: TDateTimeField;
    procedure qry_FilesMainAfterInsert(DataSet: TDataSet);
    procedure qry_FilesMainBeforePost(DataSet: TDataSet);
    procedure qry_ContainersMainBeforePost(DataSet: TDataSet);
    procedure qry_ContainersMainAfterInsert(DataSet: TDataSet);
    procedure qry_FilesMainAfterScroll(DataSet: TDataSet);
    procedure qry_ContainersMainBeforeDelete(DataSet: TDataSet);
    procedure qry_FilesMainCalcFields(DataSet: TDataSet);
    procedure qry_ContainersMainCalcFields(DataSet: TDataSet);
    procedure qry_ItemsBeforePost(DataSet: TDataSet);
    procedure qry_ItemsAfterPost(DataSet: TDataSet);
    procedure dts_FilesDataChange(Sender: TObject; Field: TField);
    procedure dts_ContainersMainDataChange(Sender: TObject; Field: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure dts_ItemsDataChange(Sender: TObject; Field: TField);
    procedure qry_FilesMainAfterPost(DataSet: TDataSet);
    procedure qry_FilesSearchAfterScroll(DataSet: TDataSet);
    procedure qry_ItemsAfterInsert(DataSet: TDataSet);
    procedure dts_ItemsStateChange(Sender: TObject);
    procedure dts_FilesStateChange(Sender: TObject);
    procedure dts_ContainersMainStateChange(Sender: TObject);
  private
    { Private declarations }
    mrBranch,mrDept,mrFileType, mrRecordCat      :String;
    mcBranch,mcDept,mcFileType,mcContType        :String;
    miFileType                                   :String;
    ItemKey                                      :String[20];
    FilesKey                                     :String[20];
  public
    { Public declarations }
    FieldProperties                      :Array of FieldPropertiesRecord;
    NoVerifyFlag                         :Boolean;
    miFilenumber                         :String;
    miBranch                             :String;
    miDepartment                         :String;
    miIssueStatus                        :String;
    IndexDefMatchCol                     :String;
    function CheckIfRequired(FieldName  :String):Boolean;
    function CheckIfVerified(FieldName  :String):Boolean;
    function CheckIfUpperCase(FieldName  :String):Boolean;
    function CheckIfValidate(FieldName  :String):Boolean;
    function CheckIfMatch(FieldName  :String):Boolean;
    function GetAlias(FieldName  :String):String;
    procedure CalculateDestructionDateFiles;
    procedure CalculateDestructionDateContainers;
    function String_Reverse(S : String): String;
  end;

var
  DatModCap: TDatModCap;

implementation

uses Processing, main, DataVer, MetrofilerDataModule;

{$R *.DFM}

function TDatModCap.String_Reverse(S : String): String;
Var
   i : Integer;
begin
   Result := '';
   for i := Length(S) DownTo 1 Do
    begin
     Result := Result + Copy(S,i,1);
    end;
end;

procedure TDatModCap.qry_FilesMainAfterInsert(DataSet: TDataSet);
begin
  Dataset['Code'] := CompsCode;
  Dataset['Branch'] := mrBranch;
  Dataset['Department'] := mrDept;
  Dataset['FileType'] := mrFileType;
  Dataset['RecordCat'] := mrRecordCat;
  Dataset['UserID'] := User;
  Dataset['EntryDate'] := Now;
  If mrFileType <> '' Then
    begin
      try
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :Description');
        qry_SQL.Parameters.ParamValues['Description'] := mrFileType;
        dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));
        Dataset['WIP'] := qry_SQL.FieldByName('fWIP').AsInteger;
        Dataset['AONS'] := qry_SQL.FieldByName('fAONS').AsInteger;
        Dataset['SAONS'] := qry_SQL.FieldByName('fSAONS').AsInteger;
        Dataset['INOS'] := qry_SQL.FieldByName('fINOS').AsInteger;
        Dataset['RETENTIONPERIOD'] := qry_SQL.FieldByName('fRETENTIONPERIOD').asInteger;
        Dataset['FILINGMETHOD'] := qry_SQL.FieldByName('FILINGMETHOD').AsString;
        Dataset['DESTROY'] := qry_SQL.FieldByName('fDESTROY').Value;
        CalculateDestructionDateFiles;
      finally
        qry_SQL.Close;
      end;
    end;
end;


procedure TDatModCap.qry_FilesMainBeforePost(DataSet: TDataSet);
var
  J          :Integer;
  FieldNAme  :String;
  TempStr    :String;
  TempStr2    :String;
  T          :Char;
  UseRecordCat    :Boolean;
  BarcodeSuffixPos    :Integer;
  BarcodeNum          :Integer;
  BarcodeBackwards    :String;
  BarcodeSuffix       :String;
begin
//-------------------Validate Branch--------------------------------------------
  If trim(DataSet.FieldByName('Branch').AsString) = '' Then
    begin
      MessageDLG('Please select a Branch.',mtWarning,[mbOK],0);
      Abort;
    end;
//-------------------Validate Department----------------------------------------
  If trim(DataSet.FieldByName('Department').AsString) = '' Then
    begin
      MessageDLG('Please select a Department.',mtWarning,[mbOK],0);
      Abort;
    end;
//-------------------Validate Record Type---------------------------------------
  If trim(DataSet.FieldByName('FileType').AsString) = '' Then
    begin
      MessageDLG('Please select a RecordType.',mtWarning,[mbOK],0);
      Abort;
    end;
//======================Validate Required Fields================================
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :Description');
  qry_SQL.Parameters.ParamValues['Description'] := trim(DataSet.FieldByName('FileType').AsString);
  dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));
  UseRecordCat := qry_SQL.FieldByName('UseRecordCat').AsBoolean;
  qry_SQL.Close;

  If UseRecordCat Then
    If trim(DataSet.FieldByName('RecordCat').AsString) = '' Then
      begin
        MessageDLG('Please select a Record Catagory.',mtWarning,[mbOK],0);
        Abort;
      end;

  For J := 0 to Dataset.FieldCount-1 Do
    begin
      If UpperCase(DataSet.Fields[J].FieldName) = 'TEXT1' Then
        FieldName := 'Col1'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT2' Then
        FieldName := 'Col2'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT3' Then
        FieldName := 'Col3'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT4' Then
        FieldName := 'Col4'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT5' Then
        FieldName := 'Col5'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT6' Then
        FieldName := 'Col6'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT7' Then
        FieldName := 'Col7'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT8' Then
        FieldName := 'Col8'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT9' Then
        FieldName := 'Col9'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT10' Then
        FieldName := 'Col10'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'DATE1' Then
        FieldName := 'Col11'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'DATE2' Then
        FieldName := 'Col12'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'DATE3' Then
        FieldName := 'Col13'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'NUMBER1' Then
        FieldName := 'Col14'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'NUMBER2' Then
        FieldName := 'Col15'
      else FieldName := '';
//-----
      If FieldName <> '' Then
        If CheckIfRequired(FieldName) Then
          If Dataset.Fields[J].asString = '' Then
          begin
            Messagedlg('Field "'+GetAlias(FieldName)+'" requires a value!!' , mtWarning, [mbOK], 0);
            Abort;
          end;
    end;
//-------------------Validate Filenumber----------------------------------------
    If Dataset.State = dsInsert Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT * FROM Barcode_Range WHERE Branch = :Branch AND Department = :Department AND RecordType = :RecordType AND Type = ''F'' AND AutoGenBarcode = 1');
      qry_SQL.Parameters.ParamValues['Branch'] := Dataset.FieldByName('Branch').AsString;
      qry_SQL.Parameters.ParamValues['Department'] := Dataset.FieldByName('Department').AsString;
      qry_SQL.Parameters.ParamValues['RecordType'] := Dataset.FieldbyName('FileType').asString;
      dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));
      If not qry_SQL.IsEmpty Then
        begin
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('EXEC [dbo].[ap_GetNextBarcode] :Branch, :Department, :RecordType, ''F''');
          qry_SQL.Parameters.ParamValues['Branch'] := Dataset.FieldByName('Branch').AsString;
          qry_SQL.Parameters.ParamValues['Department'] := Dataset.FieldByName('Department').AsString;
          qry_SQL.Parameters.ParamValues['RecordType'] := Dataset.FieldbyName('FileType').asString;
          qry_SQL.Open;
          Dataset.FieldByName('Filenumber').AsString := qry_SQL.Fields[0].AsString;
        end
      else
        begin
          if trim(DataSet.FieldByName('Filenumber').AsString) <> '' then
            begin
              BarcodeNum := StrtoIntDef(DataSet.FieldByName('Filenumber').AsString, -1);
              If BarcodeNum > 0 Then
                begin
                  qry_SQL.Close;
                  qry_SQL.SQL.Clear;
                  qry_SQL.SQL.Add('SELECT * FROM Barcode_Range WHERE Branch = :Branch AND Department = :Department AND RecordType = :RecordType AND Type = ''F'' AND :BarcodeNum BETWEEN BarCode_From AND BarCode_To AND AutoGenSuffix = 1');
                  qry_SQL.Parameters.ParamValues['Branch'] := Dataset.FieldByName('Branch').AsString;
                  qry_SQL.Parameters.ParamValues['Department'] := Dataset.FieldByName('Department').AsString;
                  qry_SQL.Parameters.ParamValues['RecordType'] := Dataset.FieldbyName('FileType').asString;
                  qry_SQL.Parameters.ParamValues['BarcodeNum'] := BarcodeNum;
                  dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));
                  If not qry_SQL.IsEmpty Then
                    begin
                      BarcodeSuffix := qry_SQL.FieldbyName('Suffix').asString;
                      BarcodeBackwards := String_Reverse(Dataset.FieldbyName('Filenumber').AsString);
                      If String_Reverse(copy(BarcodeBackwards, 1, length(BarcodeSuffix))) <> BarcodeSuffix Then
                        begin
                          Dataset['Filenumber'] := Dataset.FieldByName('Filenumber').AsString + BarcodeSuffix;
                        end;
                    end;
                end;
            end;
        end;
      qry_SQL.Close;
    end;

  if trim(DataSet.FieldByName('Filenumber').AsString) = '' then
    begin
      MessageDLG('Please enter a Barcode.',mtWarning,[mbOK],0);
      Abort;
    end;

  Dataset['UpdatedBy'] := User;
  Dataset['UpdatedOn'] := dm_Metrofiler.GetServTimeNow;
//---------------------
  FilesKey := DataSet.FieldByName('Filenumber').AsString;
  mrBranch := DataSet.FieldByName('Branch').AsString;
  mrDept := DataSet.FieldByName('Department').AsString;
  mrFileType := DataSet.FieldByName('FileType').AsString;
  mrRecordCat := DataSet.FieldByName('RecordCat').AsString;
end;

procedure TDatModCap.qry_ContainersMainBeforePost(DataSet: TDataSet);
var
  J          :Integer;
  FieldNAme :String;
  TempStr    :String;
  T          :Char;
  BarcodeNum  :Integer;
  ContainerSuffix, ContainerBackwards :String;
  AutoGen    :Boolean;
begin
//-------------------Validate Branch--------------------------------------------
  If trim(DataSet.FieldByName('Branch').AsString) = '' Then
    begin
      MessageDLG('Please select a Branch.',mtInformation,[mbOK],0);
      Abort;
    end;
//-------------------Validate Department----------------------------------------
  If trim(DataSet.FieldByName('Department').AsString) = '' Then
    begin
      MessageDLG('Please select a Department.',mtInformation,[mbOK],0);
      Abort;
    end;
//-------------------Validate Record Type---------------------------------------
  If trim(DataSet.FieldByName('FileType').AsString) = '' Then
    begin
      MessageDLG('Please select a RecordType.',mtInformation,[mbOK],0);
      Abort;
    end;
//-------------------Validate Container Type---------------------------------------
  If trim(DataSet.FieldByName('ContType').AsString) = '' Then
    begin
      MessageDLG('Please select a Container Type.',mtInformation,[mbOK],0);
      Abort;
    end;
//======================Validate Required Fields================================
  For J := 0 to Dataset.FieldCount-1 Do
    begin
      If UpperCase(DataSet.Fields[J].FieldName) = 'TEXT1' Then
        FieldName := 'Col1'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT2' Then
        FieldName := 'Col2'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT3' Then
        FieldName := 'Col3'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT4' Then
        FieldName := 'Col4'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT5' Then
        FieldName := 'Col5'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT6' Then
        FieldName := 'Col6'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT7' Then
        FieldName := 'Col7'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT8' Then
        FieldName := 'Col8'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT9' Then
        FieldName := 'Col9'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT10' Then
        FieldName := 'Col10'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'DATE1' Then
        FieldName := 'Col11'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'DATE2' Then
        FieldName := 'Col12'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'DATE3' Then
        FieldName := 'Col13'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'NUMBER1' Then
        FieldName := 'Col14'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'NUMBER2' Then
        FieldName := 'Col15'
      else FieldName := '';
//-----
      If FieldName <> '' Then
        If CheckIfRequired(FieldName) Then
          If Dataset.Fields[J].asString = '' Then
          begin
            Messagedlg('Field "'+GetAlias(FieldName)+'" requires a value!!' , mtWarning, [mbOK], 0);
            Abort;
          end;
    end;
//-------------------Validate Container----------------------------------------
  If Dataset.State = dsInsert Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT * FROM Barcode_Range WHERE Branch = :Branch AND Department = :Department AND RecordType = :RecordType AND Type = ''C'' AND AutoGenBarcode = 1');
      qry_SQL.Parameters.ParamValues['Branch'] := Dataset.FieldByName('Branch').AsString;
      qry_SQL.Parameters.ParamValues['Department'] := Dataset.FieldByName('Department').AsString;
      qry_SQL.Parameters.ParamValues['RecordType'] := Dataset.FieldbyName('FileType').asString;
      dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));
      If not qry_SQL.IsEmpty Then
        begin
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('EXEC [dbo].[ap_GetNextBarcode] :Branch, :Department, :RecordType, ''C''');
          qry_SQL.Parameters.ParamValues['Branch'] := Dataset.FieldByName('Branch').AsString;
          qry_SQL.Parameters.ParamValues['Department'] := Dataset.FieldByName('Department').AsString;
          qry_SQL.Parameters.ParamValues['RecordType'] := Dataset.FieldbyName('FileType').asString;
          qry_SQL.Open;
          Dataset.FieldByName('Container').AsString := qry_SQL.Fields[0].AsString;
        end
      else
        begin
          if trim(DataSet.FieldByName('Container').AsString) <> '' then
            begin
              BarcodeNum := StrtoIntDef(DataSet.FieldByName('Container').AsString, -1);
              If BarcodeNum > 0 Then
                begin
                  qry_SQL.Close;
                  qry_SQL.SQL.Clear;
                  qry_SQL.SQL.Add('SELECT * FROM Barcode_Range WHERE Branch = :Branch AND Department = :Department AND RecordType = :RecordType AND Type = ''C'' AND :BarcodeNum BETWEEN BarCode_From AND BarCode_To  AND AutoGenSuffix = 1');
                  qry_SQL.Parameters.ParamValues['Branch'] := Dataset.FieldByName('Branch').AsString;
                  qry_SQL.Parameters.ParamValues['Department'] := Dataset.FieldByName('Department').AsString;
                  qry_SQL.Parameters.ParamValues['RecordType'] := Dataset.FieldbyName('FileType').asString;
                  qry_SQL.Parameters.ParamValues['BarcodeNum'] := BarcodeNum;
                  dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));
                  If not qry_SQL.IsEmpty Then
                    begin
                      ContainerSuffix := qry_SQL.FieldbyName('Suffix').asString;
                      ContainerBackwards := String_Reverse(Dataset.FieldbyName('Container').AsString);
                      If String_Reverse(copy(ContainerBackwards, 1, length(ContainerSuffix))) <> ContainerSuffix Then
                        begin
                          Dataset['Container'] := Dataset.FieldByName('Container').AsString + ContainerSuffix;
                        end;
                    end;
                end;
            end;
        end;
      qry_SQL.Close;
    end;

  if trim(DataSet.FieldByName('Container').AsString) = '' then
    begin
      MessageDLG('Please enter a Barcode.',mtWarning,[mbOK],0);
      Abort;
    end;

  Dataset['UpdatedBy'] := User;
  Dataset['UpdatedOn'] := dm_Metrofiler.GetServTimeNow;    
//---------------------
  mcBranch := Dataset.FieldByName('Branch').AsString;
  mcDept := Dataset.FieldByName('Department').AsString;
  mcFileType := Dataset.FieldByName('FileType').AsString;
  mcContType := Dataset.FieldByName('ContType').AsString;
end;

procedure TDatModCap.qry_ContainersMainAfterInsert(DataSet: TDataSet);
begin
  Dataset['Code'] := CompsCode;
  Dataset['Branch'] := mcBranch;
  Dataset['Department'] := mcDept;
  Dataset['FileType'] := mcFileType;
  Dataset['ContType'] := mcContType;
  Dataset['UserID'] := User;
  Dataset['EntryDate'] := Now;
  If mcFileType <> '' Then
    begin
      try
        qry_SQL.Close;
        qry_SQL.SQL.Clear;
        qry_SQL.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :Description');
        qry_SQL.Parameters.ParamValues['Description'] := mcFileType;
        dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));
        Dataset['WIP'] := qry_SQL.FieldByName('cWIP').AsInteger;
        Dataset['AONS'] := qry_SQL.FieldByName('cAONS').AsInteger;
        Dataset['SAONS'] := qry_SQL.FieldByName('cSAONS').AsInteger;
        Dataset['INOS'] := qry_SQL.FieldByName('cINOS').AsInteger;
        Dataset['RETENTIONPERIOD'] := qry_SQL.FieldByName('cRETENTIONPERIOD').asInteger;
        Dataset['DESTROY'] := qry_SQL.FieldByName('cDESTROY').Value;
        CalculateDestructionDateContainers;
      finally
        qry_SQL.Close;
      end;
    end;
end;

procedure TDatModCap.qry_FilesMainAfterScroll(DataSet: TDataSet);
begin
  If (Dataset.FieldByName('ISSUESTATUS').asString = 'CON')OR
     (Dataset.FieldByName('ISSUESTATUS').asString = 'MET')OR
     (Dataset.FieldByName('ISSUESTATUS').asString = 'MIN')Then
    begin
      qry_GetConStatus.Close;
      qry_GetConStatus.SQL.Clear;
      qry_GetConStatus.SQL.Add('SELECT ISSUESTATUS FROM CONTAINERS WHERE (CONTAINER = :CN)AND(CODE = :CO)');
      qry_GetConStatus.Parameters.ParambyName('CN').Value := Dataset.FieldByName('CONTAINERNO').asString;
      qry_GetConStatus.Parameters.ParambyName('CO').Value := compsCode;
      qry_GetConStatus.Active := True;
    end;
  If (Dataset.FieldByName('ISSUESTATUS').asString = 'INUSE')OR
     (Dataset.FieldByName('ISSUESTATUS').asString = 'INUSEI')OR
     (Dataset.FieldByName('ISSUESTATUS').asString = 'OUT')OR
     (Dataset.FieldByName('ISSUESTATUS').asString = 'OUTI')Then
   begin
     If trim(Dataset.FieldByName('LocNo').asString) <> '' Then
       begin
         qry_SQL.Close;
         qry_SQL.SQL.Clear;
         qry_SQL.SQL.Add('SELECT Name, Surname FROM AuthCodes WHERE WorkPlaceId = :ID');
         qry_SQL.Parameters.ParamValues['ID'] := Dataset.FieldByName('LocNo').asString;
         dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(0,1,0,0));
         qry_SQL.Open;
         If not qry_SQL.IsEmpty Then
           begin
             frm_Console.fProcessing.edt_FileLocation.Text := trim(trim(qry_SQL.FieldByName('Name').AsString) + ' ' + trim(qry_SQL.FieldByName('Surname').AsString));
           end
         else
           begin
             qry_SQL.Close;
             qry_SQL.SQL.Clear;
             qry_SQL.SQL.Add('SELECT Location FROM ProxyLoc WHERE LocationId = :ID');
             qry_SQL.Parameters.ParamValues['ID'] := Dataset.FieldByName('LocNo').asString;
             dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(0,1,0,0));
             qry_SQL.Open;
             If not qry_SQL.IsEmpty Then
               begin
                 frm_Console.fProcessing.edt_FileLocation.Text := trim(qry_SQL.FieldByName('Location').AsString);
               end
             else
               begin
                 frm_Console.fProcessing.edt_FileLocation.Text := trim(Dataset.FieldByName('LocNo').AsString);
               end;
           end;
       end
     else
       begin
         frm_Console.fProcessing.edt_FileLocation.Text := trim(Dataset.FieldByName('LocNo').AsString);
       end;
   end
  else
   begin
      frm_Console.fProcessing.edt_FileLocation.Text := trim(Dataset.FieldByName('LocNo').AsString);
   end;
end;

procedure TDatModCap.qry_ContainersMainBeforeDelete(DataSet: TDataSet);
begin
  try
    qry_RecsinCont.Close;
    qry_RecsinCont.SQL.Clear;
    qry_RecsinCont.SQL.Add('SELECT COUNT(FILENUMBER) Tot FROM FILES WHERE (CONTAINERNO = :CN)AND(ISSUESTATUS = ''CON'')AND(Code = :CO)');
    qry_RecsinCont.Parameters.ParamByName('CN').Value := Dataset.FieldbyName('CONTAINER').asString;
    qry_RecsinCont.Parameters.ParambyName('CO').Value := compsCode;
    qry_RecsinCont.Open;
    If qry_RecsinCont.FieldByName('TOT').asInteger > 0 then
      begin
        Messagedlg('This container cannot be deleted!!'+#10#13+'The container has records in it!!',mtError,[mbOK],0);
        Abort;
      end;
  finally
    qry_RecsinCont.Close;
  end;
end;


procedure TDatModCap.qry_FilesMainCalcFields(DataSet: TDataSet);
Var
  qry_GetNames   :TADOQuery;
begin
  qry_GetNames := TADOQuery.Create(Self);
  try
    qry_GetNames.Connection  := dm_Metrofiler.ADOConnect_mFiler;
//-------------Get Branch Name--------------------------------------------------
    If trim(Dataset.FieldbyName('Branch').asString) <> '' Then
      begin
        qry_GetNames.Close;
        qry_GetNames.SQL.Clear;
        qry_GetNames.SQL.Add('SELECT * FROM Branches WHERE Branch = :Branch');
        qry_GetNames.Parameters.ParamValues['Branch'] := Dataset.FieldbyName('Branch').asString;
        dm_Metrofiler.ExecuteCached(qry_GetNames, EncodeTime(1,0,0,0));
        Dataset['Branch_Name'] := qry_GetNames.FieldbyName('Name').asString;
      end;
//-------------Get Department Name----------------------------------------------
    If trim(Dataset.FieldbyName('Department').asString) <> '' Then
      begin
        qry_GetNames.Close;
        qry_GetNames.SQL.Clear;
        qry_GetNames.SQL.Add('SELECT * FROM Departments WHERE Branch = :Branch AND Department = :Department');
        qry_GetNames.Parameters.ParamValues['Branch'] := Dataset.FieldbyName('Branch').asString;
        qry_GetNames.Parameters.ParamValues['Department'] := Dataset.FieldbyName('Department').asString;
        dm_Metrofiler.ExecuteCached(qry_GetNames, EncodeTime(1,0,0,0));
        Dataset['Dept_Name'] := qry_GetNames.FieldbyName('Name').asString;
      end;
//-------------Get Warehouse Name-----------------------------------------------
    If trim(Dataset.FieldbyName('Warehouse').asString) <> '' Then
      begin
        qry_GetNames.Close;
        qry_GetNames.SQL.Clear;
        qry_GetNames.SQL.Add('SELECT * FROM WHouse WHERE Warehouse = :Warehouse');
        qry_GetNames.Parameters.ParamValues['Warehouse'] := Dataset.FieldbyName('Warehouse').asString;
        dm_Metrofiler.ExecuteCached(qry_GetNames, EncodeTime(1,0,0,0));
        Dataset['Ware_Name'] := qry_GetNames.FieldbyName('Name').asString;
      end;
  finally
    qry_GetNames.Close;
    qry_GetNames.Free;
  end;
end;

procedure TDatModCap.qry_ContainersMainCalcFields(DataSet: TDataSet);
Var
  qry_GetNames   :TADOQuery;
begin
  qry_GetNames := TADOQuery.Create(Self);
  try
    qry_GetNames.Connection  := dm_Metrofiler.ADOConnect_mFiler;
//-------------Get Branch Name--------------------------------------------------
    If trim(Dataset.FieldbyName('Branch').asString) <> '' Then
      begin
        qry_GetNames.Close;
        qry_GetNames.SQL.Clear;
        qry_GetNames.SQL.Add('SELECT * FROM Branches WHERE Branch = :Branch');
        qry_GetNames.Parameters.ParamValues['Branch'] := Dataset.FieldbyName('Branch').asString;
        dm_Metrofiler.ExecuteCached(qry_GetNames, EncodeTime(1,0,0,0));
        Dataset['Branch_Name'] := qry_GetNames.FieldbyName('Name').asString;
      end;
//-------------Get Department Name----------------------------------------------
    If trim(Dataset.FieldbyName('Department').asString) <> '' Then
      begin
        qry_GetNames.Close;
        qry_GetNames.SQL.Clear;
        qry_GetNames.SQL.Add('SELECT * FROM Departments WHERE Branch = :Branch AND Department = :Department');
        qry_GetNames.Parameters.ParamValues['Branch'] := Dataset.FieldbyName('Branch').asString;
        qry_GetNames.Parameters.ParamValues['Department'] := Dataset.FieldbyName('Department').asString;
        dm_Metrofiler.ExecuteCached(qry_GetNames, EncodeTime(1,0,0,0));
        Dataset['Dept_Name'] := qry_GetNames.FieldbyName('Name').asString;
      end;
//-------------Get Warehouse Name-----------------------------------------------
    If trim(Dataset.FieldbyName('Warehouse').asString) <> '' Then
      begin
        qry_GetNames.Close;
        qry_GetNames.SQL.Clear;
        qry_GetNames.SQL.Add('SELECT * FROM WHouse WHERE Warehouse = :Warehouse');
        qry_GetNames.Parameters.ParamValues['Warehouse'] := Dataset.FieldbyName('Warehouse').asString;
        dm_Metrofiler.ExecuteCached(qry_GetNames, EncodeTime(1,0,0,0));
        Dataset['Ware_Name'] := qry_GetNames.FieldbyName('Name').asString;
      end;
  finally
    qry_GetNames.Close;
    qry_GetNames.Free;
  end;
end;

procedure TDatModCap.qry_ItemsBeforePost(DataSet: TDataSet);
var
  J, BarcodeNum         :Integer;
  FieldName :String;
  TempStr    :String;
  T          :Char;
  AutoGen    :Boolean;
  ItemSuffix, ItemBackwards :String;
begin
//-------------------Validate Filenumber--------------------------------------------
  If trim(DataSet.FieldByName('Filenumber').AsString) = '' Then
    begin
      MessageDLG('Cannot Post. No File Barcode Specified.',mtWarning,[mbOK],0);
      Abort;
    end;
//-------------------Validate Record Type---------------------------------------
  If trim(DataSet.FieldByName('FileType').AsString) = '' Then
    begin
      MessageDLG('Please select a RecordType.',mtWarning,[mbOK],0);
      Abort;
    end;
//======================Validate Required Fields================================
  For J := 0 to Dataset.FieldCount-1 Do
    begin
      If UpperCase(DataSet.Fields[J].FieldName) = 'TEXT1' Then
        FieldName := 'Col1'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT2' Then
        FieldName := 'Col2'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT3' Then
        FieldName := 'Col3'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT4' Then
        FieldName := 'Col4'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT5' Then
        FieldName := 'Col5'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT6' Then
        FieldName := 'Col6'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT7' Then
        FieldName := 'Col7'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT8' Then
        FieldName := 'Col8'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT9' Then
        FieldName := 'Col9'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'TEXT10' Then
        FieldName := 'Col10'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'DATE1' Then
        FieldName := 'Col11'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'DATE2' Then
        FieldName := 'Col12'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'DATE3' Then
        FieldName := 'Col13'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'NUMBER1' Then
        FieldName := 'Col14'
      else if UpperCase(DataSet.Fields[J].FieldName) = 'NUMBER2' Then
        FieldName := 'Col15'
      else FieldName := '';
//-----
      If FieldName <> '' Then
        If CheckIfRequired(FieldName) Then
          If Dataset.Fields[J].asString = '' Then
          begin
            Messagedlg('Field "'+GetAlias(FieldName)+'" requires a value!!' , mtWarning, [mbOK], 0);
            Abort;
          end;
    end;
//-------------------Validate Itemnumber----------------------------------------
    If Dataset.State = dsInsert Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT * FROM Barcode_Range WHERE Branch = :Branch AND Department = :Department AND RecordType = :RecordType AND Type = ''I'' AND AutoGenBarcode = 1');
      qry_SQL.Parameters.ParamValues['Branch'] := miBranch;
      qry_SQL.Parameters.ParamValues['Department'] := miDepartment;
      qry_SQL.Parameters.ParamValues['RecordType'] := Dataset.FieldbyName('FileType').asString;
      dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));
      If not qry_SQL.IsEmpty Then
        begin
          qry_SQL.Close;
          qry_SQL.SQL.Clear;
          qry_SQL.SQL.Add('EXEC [dbo].[ap_GetNextBarcode] :Branch, :Department, :RecordType, ''I''');
          qry_SQL.Parameters.ParamValues['Branch'] := miBranch;
          qry_SQL.Parameters.ParamValues['Department'] := miDepartment;
          qry_SQL.Parameters.ParamValues['RecordType'] := Dataset.FieldbyName('FileType').asString;
          qry_SQL.Open;
          Dataset.FieldByName('Itemnumber').AsString := qry_SQL.Fields[0].AsString;
        end
      else
        begin
          if trim(DataSet.FieldByName('Itemnumber').AsString) <> '' then
            begin
              BarcodeNum := StrtoIntDef(DataSet.FieldByName('Itemnumber').AsString, -1);
              If BarcodeNum > 0 Then
                begin
                  qry_SQL.Close;
                  qry_SQL.SQL.Clear;
                  qry_SQL.SQL.Add('SELECT * FROM Barcode_Range WHERE Branch = :Branch AND Department = :Department AND RecordType = :RecordType AND Type = ''I'' AND :BarcodeNum BETWEEN BarCode_From AND BarCode_To  AND AutoGenSuffix = 1');
                  qry_SQL.Parameters.ParamValues['Branch'] := miBranch;
                  qry_SQL.Parameters.ParamValues['Department'] := miDepartment;
                  qry_SQL.Parameters.ParamValues['RecordType'] := Dataset.FieldbyName('FileType').asString;
                  qry_SQL.Parameters.ParamValues['BarcodeNum'] := BarcodeNum;
                  dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));
                  If not qry_SQL.IsEmpty Then
                    begin
                      ItemSuffix := qry_SQL.FieldbyName('Suffix').asString;
                      ItemBackwards := String_Reverse(Dataset.FieldbyName('Itemnumber').AsString);
                      If String_Reverse(copy(ItemBackwards, 1, length(ItemSuffix))) <> ItemSuffix Then
                        begin
                          Dataset['Itemnumber'] := Dataset.FieldByName('Itemnumber').AsString + ItemSuffix;
                        end;
                    end;
                end;
            end;
        end;
      qry_SQL.Close;
    end;

  if trim(DataSet.FieldByName('Itemnumber').AsString) = '' then
    begin
      MessageDLG('Please enter a Barcode.',mtWarning,[mbOK],0);
      Abort;
    end;
//------------
  If qry_Items.State = dsInsert Then
    begin
      If frm_Console.fProcessing.chk_DCMatchItemstoFile.checked Then
        qry_Items['Status'] := 'I'
      else qry_Items['Status'] := 'P';
    end;

  Dataset['UpdatedBy'] := User;
  Dataset['UpdatedOn'] := dm_Metrofiler.GetServTimeNow;

  miFileType := qry_FilesMain.FieldByName('FileType').AsString;
  ItemKey := Dataset.FieldbyName('ITEMNUMBER').asString;
end;

procedure TDatModCap.qry_ItemsAfterPost(DataSet: TDataSet);
begin
  Dataset.Close;
  Dataset.Open;
  Dataset.Locate('ITEMNUMBER', ItemKey, []);
end;

function TDatModCap.CheckIfRequired(FieldName  :String):Boolean;
Var
  J   :Integer;
begin
  Result := False;
  For J := 0 to length(FieldProperties)-1 Do
    begin
      If FieldName = FieldProperties[J].FieldName Then
        begin
          Result := FieldProperties[J].Required;
          exit;
        end;
    end;
end;

function TDatModCap.CheckIfVerified(FieldName  :String):Boolean;
Var
  J   :Integer;
begin
  Result := False;
  For J := 0 to length(FieldProperties)-1 Do
    begin
      If FieldName = FieldProperties[J].FieldName Then
        begin
          Result := FieldProperties[J].Verify;
          exit;
        end;
    end;
end;

function TDatModCap.CheckIfUpperCase(FieldName  :String):Boolean;
Var
  J   :Integer;
begin
  Result := False;
  For J := 0 to length(FieldProperties)-1 Do
    begin
      If FieldName = FieldProperties[J].FieldName Then
        begin
          Result := FieldProperties[J].UpperCase;
          exit;
        end;
    end;
end;

function TDatModCap.CheckIfValidate(FieldName  :String):Boolean;
Var
  J   :Integer;
begin
  Result := False;
  For J := 0 to length(FieldProperties)-1 Do
    begin
      If FieldName = FieldProperties[J].FieldName Then
        begin
          Result := FieldProperties[J].Validate;
          exit;
        end;
    end;
end;

function TDatModCap.GetAlias(FieldName  :String):String;
Var
  J   :Integer;
begin
  Result := '';
  For J := 0 to length(FieldProperties)-1 Do
    begin
      If FieldName = FieldProperties[J].FieldName Then
        begin
          Result := FieldProperties[J].Alias;
          exit;
        end;
    end;
end;


procedure TDatModCap.dts_FilesDataChange(Sender: TObject; Field: TField);
Var
  FieldName, MatchFieldName, CheckStr, TStr  :String;
  C, J                       :Integer;
  DBEdit                     :TDBEdit;
  LocalP, ScreenP: TPoint;
begin
  If qry_FilesMain.State = dsInsert Then
    begin
      If not(Field = NIL) Then
        begin
          FieldName := UPPERCASE(TRIM(Field.FieldName));
//----------
          If FieldName = 'FILETYPE' Then
            begin
              qry_SQL.Close;
              qry_SQL.SQL.Clear;
              qry_SQL.SQL.Add('SELECT * FROM Barcode_Range WHERE Branch = :Branch AND Department = :Department AND RecordType = :RecordType AND Type = ''F'' AND AutoGenBarcode = 1');
              qry_SQL.Parameters.ParamValues['Branch'] := qry_FilesMain.FieldbyName('Branch').asString;
              qry_SQL.Parameters.ParamValues['Department'] := qry_FilesMain.FieldbyName('Department').asString;
              qry_SQL.Parameters.ParamValues['RecordType'] := qry_FilesMain.FieldbyName('FileType').asString;
              dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));

              If (not qry_SQL.IsEmpty)and(qry_FilesMain.FieldByName('Filenumber').AsString <> '') Then
                DatModCap.qry_FilesMain['Filenumber'] := null;
              DatModCap.dts_FilesStateChange(Nil);
            end;
        end;
    end;
  If qry_FilesMain.State IN dsEditModes Then
    begin
      If not(Field = NIL) Then
        begin
          FieldName := UPPERCASE(TRIM(Field.FieldName));
//----------
          If FieldName = 'TEXT1' Then
            FieldName := 'Col1'
          else if FieldName = 'TEXT2' Then
            FieldName := 'Col2'
          else if FieldName = 'TEXT3' Then
            FieldName := 'Col3'
          else if FieldName = 'TEXT4' Then
            FieldName := 'Col4'
          else if FieldName = 'TEXT5' Then
            FieldName := 'Col5'
          else if FieldName = 'TEXT6' Then
            FieldName := 'Col6'
          else if FieldName = 'TEXT7' Then
            FieldName := 'Col7'
          else if FieldName = 'TEXT8' Then
            FieldName := 'Col8'
          else if FieldName = 'TEXT9' Then
            FieldName := 'Col9'
          else if FieldName = 'TEXT10' Then
            FieldName := 'Col10'
          else if FieldName = 'DATE1' Then
            FieldName := 'Col11'
          else if FieldName = 'DATE2' Then
            FieldName := 'Col12'
          else if FieldName = 'DATE3' Then
            FieldName := 'Col13'
          else if FieldName = 'NUMBER1' Then
            FieldName := 'Col14'
          else if FieldName = 'NUMBER2' Then
            FieldName := 'Col15'
          else FieldName := '';
//---------------
          MatchFieldName := DatModCap.GetAlias(FieldName);
//---------------
          If FieldName = 'Col1' Then
            DBEdit := frm_Console.fProcessing.edt_RText1
          else if FieldName = 'Col2' Then
            DBEdit := frm_Console.fProcessing.edt_RText2
          else if FieldName = 'Col3' Then
            DBEdit := frm_Console.fProcessing.edt_RText3
          else if FieldName = 'Col4' Then
            DBEdit := frm_Console.fProcessing.edt_RText4
          else if FieldName = 'Col5' Then
            DBEdit := frm_Console.fProcessing.edt_RText5
          else if FieldName = 'Col6' Then
            DBEdit := frm_Console.fProcessing.edt_RText6
          else if FieldName = 'Col7' Then
            DBEdit := frm_Console.fProcessing.edt_RText7
          else if FieldName = 'Col8' Then
            DBEdit := frm_Console.fProcessing.edt_RText8
          else if FieldName = 'Col9' Then
            DBEdit := frm_Console.fProcessing.edt_RText9
          else if FieldName = 'Col10' Then
            DBEdit := frm_Console.fProcessing.edt_RText10
          else if FieldName = 'Col11' Then
            DBEdit := frm_Console.fProcessing.edt_RDate1
          else if FieldName = 'Col12' Then
            DBEdit := frm_Console.fProcessing.edt_RDate2
          else if FieldName = 'Col13' Then
            DBEdit := frm_Console.fProcessing.edt_RDate3
          else if FieldName = 'Col14' Then
            DBEdit := frm_Console.fProcessing.edt_RNum1
          else if FieldName = 'Col15' Then
            DBEdit := frm_Console.fProcessing.edt_RNum2;
//---------------
          If FieldName <> '' Then
            begin
              If NoVerifyFlag Then
                exit;
              If CheckIfVerified(FieldName) Then
                begin
                  CheckStr := '';
                  LocalP.X := DBEdit.Left-2;
                  LocalP.Y := DBEdit.Top-13;
                  ScreenP := DBEdit.ClientToScreen(LocalP);
                  frm_DataVer.Top := Screenp.Y;
                  frm_DataVer.Left := ScreenP.X;
                  frm_DataVer.Width := DBEdit.Width;
                  frm_DataVer.Height := DBEdit.Height;
                  frm_DataVer.VerifyText :=  Field.AsString;
                  If frm_DataVer.Execute <> mrOK Then
                    begin
                      Abort;
                      exit;
                    end;
                end;
//----------------------
              If CheckIfMatch(MatchFieldName) Then
                begin
                  qry_SQL.Close;
                  qry_SQL.SQL.Clear;
                  qry_SQL.SQL.Add('SELECT * FROM IndexDefsMatch WHERE Description = :DS AND ['+Field.FieldName+'] = :Match');
                  qry_SQL.Parameters.ParamValues['DS'] := qry_FilesMain.FieldByName('FILETYPE').AsString;
                  qry_SQL.Parameters.ParamValues['Match'] := Field.Value;
                  qry_SQL.Open;
                  If not qry_SQL.IsEmpty Then
                    begin
                      For J := 1 to 10 Do
                        begin
                          If ('TEXT'+InttoStr(J)) <> UpperCase(Field.FieldName) Then
                            qry_FilesMain['TEXT'+InttoStr(J)] := qry_SQL.FieldByName('TEXT'+InttoStr(J)).Value;
                        end;
                      For J := 1 to 3 Do
                        begin
                          If ('DATE'+InttoStr(J)) <> UpperCase(Field.FieldName) Then
                            qry_FilesMain['DATE'+InttoStr(J)] := qry_SQL.FieldByName('DATE'+InttoStr(J)).Value;
                        end;
                      For J := 1 to 2 Do
                        begin
                          If ('NUMBER'+InttoStr(J)) <> UpperCase(Field.FieldName) Then
                            qry_FilesMain['NUMBER'+InttoStr(J)] := qry_SQL.FieldByName('NUMBER'+InttoStr(J)).Value;
                        end;
                   end;
                  qry_SQL.Close;
                end;
            end;
        end;
    end;
end;

procedure TDatModCap.dts_FilesStateChange(Sender: TObject);
begin
  If qry_FilesMain.State = dsInsert Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT * FROM Barcode_Range WHERE Branch = :Branch AND Department = :Department AND RecordType = :RecordType AND Type = ''F'' AND AutoGenBarcode = 1');
      qry_SQL.Parameters.ParamValues['Branch'] := qry_FilesMain.FieldbyName('Branch').asString;
      qry_SQL.Parameters.ParamValues['Department'] := qry_FilesMain.FieldbyName('Department').asString;
      qry_SQL.Parameters.ParamValues['RecordType'] := qry_FilesMain.FieldbyName('FileType').asString;
      dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));

      If not qry_SQL.IsEmpty Then
        begin
          frm_Console.fProcessing.EditFileNumber.ReadOnly := True;
          frm_Console.fProcessing.EditFileNumber.Color := clScrollbar;
        end
      else
        begin
          frm_Console.fProcessing.EditFileNumber.ReadOnly := False;
          frm_Console.fProcessing.EditFileNumber.Color := clWindow;
        end;
    end
  else
    begin
      frm_Console.fProcessing.EditFileNumber.Color := clScrollbar;
      frm_Console.fProcessing.EditFileNumber.ReadOnly := True;
    end;
end;

procedure TDatModCap.dts_ContainersMainDataChange(Sender: TObject;
  Field: TField);
Var
  FieldName, MatchFieldName, CheckStr, TStr  :String;
  C, j :Integer;
  DBEdit                     :TDBEdit;
  LocalP, ScreenP: TPoint;
begin
  If qry_ContainersMain.State = dsInsert Then
    begin
      If not(Field = NIL) Then
        begin
          FieldName := UPPERCASE(TRIM(Field.FieldName));
//----------
          If FieldName = 'FILETYPE' Then
            begin
              qry_SQL.Close;
              qry_SQL.SQL.Clear;
              qry_SQL.SQL.Add('SELECT * FROM Barcode_Range WHERE Branch = :Branch AND Department = :Department AND RecordType = :RecordType AND Type = ''C'' AND AutoGenBarcode = 1');
              qry_SQL.Parameters.ParamValues['Branch'] := qry_ContainersMain.FieldbyName('Branch').asString;
              qry_SQL.Parameters.ParamValues['Department'] := qry_ContainersMain.FieldbyName('Department').asString;
              qry_SQL.Parameters.ParamValues['RecordType'] := qry_ContainersMain.FieldbyName('FileType').asString;
              dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));

              If (not qry_SQL.IsEmpty)and(qry_ContainersMain.FieldByName('Container').AsString <> '') Then
                DatModCap.qry_ContainersMain['Container'] := null;
              DatModCap.dts_ContainersMainStateChange(Nil);
            end;
        end;
    end;
  If qry_ContainersMain.State IN dsEditModes Then
    begin
      If not(Field = NIL) Then
        begin
          FieldName := UPPERCASE(TRIM(Field.FieldName));
//----------
          If FieldName = 'TEXT1' Then
            FieldName := 'Col1'
          else if FieldName = 'TEXT2' Then
            FieldName := 'Col2'
          else if FieldName = 'TEXT3' Then
            FieldName := 'Col3'
          else if FieldName = 'TEXT4' Then
            FieldName := 'Col4'
          else if FieldName = 'TEXT5' Then
            FieldName := 'Col5'
          else if FieldName = 'TEXT6' Then
            FieldName := 'Col6'
          else if FieldName = 'TEXT7' Then
            FieldName := 'Col7'
          else if FieldName = 'TEXT8' Then
            FieldName := 'Col8'
          else if FieldName = 'TEXT9' Then
            FieldName := 'Col9'
          else if FieldName = 'TEXT10' Then
            FieldName := 'Col10'
          else if FieldName = 'DATE1' Then
            FieldName := 'Col11'
          else if FieldName = 'DATE2' Then
            FieldName := 'Col12'
          else if FieldName = 'DATE3' Then
            FieldName := 'Col13'
          else if FieldName = 'NUMBER1' Then
            FieldName := 'Col14'
          else if FieldName = 'NUMBER2' Then
            FieldName := 'Col15';
//---------------
          MatchFieldName := DatModCap.GetAlias(FieldName);
//---------------
          If FieldName = 'Col1' Then
            DBEdit := frm_Console.fProcessing.edt_CText1
          else if FieldName = 'Col2' Then
            DBEdit := frm_Console.fProcessing.edt_CText2
          else if FieldName = 'Col3' Then
            DBEdit := frm_Console.fProcessing.edt_CText3
          else if FieldName = 'Col4' Then
            DBEdit := frm_Console.fProcessing.edt_CText4
          else if FieldName = 'Col5' Then
            DBEdit := frm_Console.fProcessing.edt_CText5
          else if FieldName = 'Col6' Then
            DBEdit := frm_Console.fProcessing.edt_CText6
          else if FieldName = 'Col7' Then
            DBEdit := frm_Console.fProcessing.edt_CText7
          else if FieldName = 'Col8' Then
            DBEdit := frm_Console.fProcessing.edt_CText8
          else if FieldName = 'Col9' Then
            DBEdit := frm_Console.fProcessing.edt_CText9
          else if FieldName = 'Col10' Then
            DBEdit := frm_Console.fProcessing.edt_CText10
          else if FieldName = 'Col11' Then
            DBEdit := frm_Console.fProcessing.edt_CDate1
          else if FieldName = 'Col12' Then
            DBEdit := frm_Console.fProcessing.edt_CDate2
          else if FieldName = 'Col13' Then
            DBEdit := frm_Console.fProcessing.edt_CDate3
          else if FieldName = 'Col14' Then
            DBEdit := frm_Console.fProcessing.edt_CNum1
          else if FieldName = 'Col15' Then
            DBEdit := frm_Console.fProcessing.edt_CNum2;
//---------------
          If FieldName <> '' Then
            begin
              If NoVerifyFlag Then
                exit;
              If CheckIfVerified(FieldName) Then
                begin
                  CheckStr := '';
                  LocalP.X := DBEdit.Left-2;
                  LocalP.Y := DBEdit.Top-13;
                  ScreenP := DBEdit.ClientToScreen(LocalP);
                  frm_DataVer.Top := Screenp.Y;
                  frm_DataVer.Left := ScreenP.X;
                  frm_DataVer.Width := DBEdit.Width;
                  frm_DataVer.Height := DBEdit.Height;
                  frm_DataVer.VerifyText :=  Field.AsString;
                  If frm_DataVer.Execute <> mrOK Then
                    begin
                      Abort;
                      exit;
                    end;
                end;
//----------------------
              If CheckIfMatch(MatchFieldName) Then
                begin
                  qry_SQL.Close;
                  qry_SQL.SQL.Clear;
                  qry_SQL.SQL.Add('SELECT * FROM IndexDefsMatch WHERE Description = :DS AND ['+Field.FieldName+'] = :Match');
                  qry_SQL.Parameters.ParamValues['DS'] := qry_ContainersMain.FieldByName('FILETYPE').AsString;
                  qry_SQL.Parameters.ParamValues['Match'] := Field.Value;
                  qry_SQL.Open;
                  If not qry_SQL.IsEmpty Then
                    begin
                      For J := 1 to 10 Do
                        begin
                          If ('TEXT'+InttoStr(J)) <> UpperCase(Field.FieldName) Then
                            qry_ContainersMain['TEXT'+InttoStr(J)] := qry_SQL.FieldByName('TEXT'+InttoStr(J)).Value;
                        end;
                      For J := 1 to 3 Do
                        begin
                          If ('DATE'+InttoStr(J)) <> UpperCase(Field.FieldName) Then
                            qry_ContainersMain['DATE'+InttoStr(J)] := qry_SQL.FieldByName('DATE'+InttoStr(J)).Value;
                        end;
                      For J := 1 to 2 Do
                        begin
                          If ('NUMBER'+InttoStr(J)) <> UpperCase(Field.FieldName) Then
                            qry_ContainersMain['NUMBER'+InttoStr(J)] := qry_SQL.FieldByName('NUMBER'+InttoStr(J)).Value;
                        end;
                   end;
                  qry_SQL.Close;
                end;
            end;
        end;
    end;
end;

procedure TDatModCap.dts_ContainersMainStateChange(Sender: TObject);
begin
  If qry_ContainersMain.State = dsInsert Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT * FROM Barcode_Range WHERE Branch = :Branch AND Department = :Department AND RecordType = :RecordType AND Type = ''C'' AND AutoGenBarcode = 1');
      qry_SQL.Parameters.ParamValues['Branch'] := qry_ContainersMain.FieldbyName('Branch').asString;
      qry_SQL.Parameters.ParamValues['Department'] := qry_ContainersMain.FieldbyName('Department').asString;
      qry_SQL.Parameters.ParamValues['RecordType'] := qry_ContainersMain.FieldbyName('FileType').asString;
      dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));

      If not qry_SQL.IsEmpty Then
        begin
          frm_Console.fProcessing.edt_ContainerNo.ReadOnly := True;
          frm_Console.fProcessing.edt_ContainerNo.Color := clScrollbar;
        end
      else
        begin
          frm_Console.fProcessing.edt_ContainerNo.ReadOnly := False;
          frm_Console.fProcessing.edt_ContainerNo.Color := clWindow;
        end;
    end
  else
    begin
      frm_Console.fProcessing.edt_ContainerNo.Color := clScrollbar;
      frm_Console.fProcessing.edt_ContainerNo.ReadOnly := True;
    end;
end;

procedure TDatModCap.DataModuleCreate(Sender: TObject);
begin
  NoVerifyFlag := False;
end;

procedure TDatModCap.dts_ItemsDataChange(Sender: TObject; Field: TField);
Var
  FieldName, MatchFieldName, CheckStr, TStr  :String;
  C, J :Integer;
  DBEdit                     :TDBEdit;
  LocalP, ScreenP: TPoint;
begin
  If qry_Items.State = dsInsert Then
    begin
      If not(Field = NIL) Then
        begin
          FieldName := UPPERCASE(TRIM(Field.FieldName));
//----------
          If FieldName = 'FILETYPE' Then
            begin
              qry_SQL.Close;
              qry_SQL.SQL.Clear;
              qry_SQL.SQL.Add('SELECT * FROM Barcode_Range WHERE Branch = :Branch AND Department = :Department AND RecordType = :RecordType AND Type = ''F'' AND AutoGenBarcode = 1');
              qry_SQL.Parameters.ParamValues['Branch'] := miBranch;
              qry_SQL.Parameters.ParamValues['Department'] := miDepartment;
              qry_SQL.Parameters.ParamValues['RecordType'] := qry_Items.FieldbyName('FileType').asString;
              dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));

              If (not qry_SQL.IsEmpty)and(qry_Items.FieldByName('Itemnumber').AsString <> '') Then
                qry_Items['Itemnumber'] := null;
              dts_ItemsStateChange(Nil);
            end;
        end;
    end;
  If qry_Items.State IN dsEditModes Then
    begin
      If not(Field = NIL) Then
        begin
          FieldName := UPPERCASE(TRIM(Field.FieldName));
//----------
          If FieldName = 'TEXT1' Then
            FieldName := 'Col1'
          else if FieldName = 'TEXT2' Then
            FieldName := 'Col2'
          else if FieldName = 'TEXT3' Then
            FieldName := 'Col3'
          else if FieldName = 'TEXT4' Then
            FieldName := 'Col4'
          else if FieldName = 'TEXT5' Then
            FieldName := 'Col5'
          else if FieldName = 'TEXT6' Then
            FieldName := 'Col6'
          else if FieldName = 'TEXT7' Then
            FieldName := 'Col7'
          else if FieldName = 'TEXT8' Then
            FieldName := 'Col8'
          else if FieldName = 'TEXT9' Then
            FieldName := 'Col9'
          else if FieldName = 'TEXT10' Then
            FieldName := 'Col10'
          else if FieldName = 'DATE1' Then
            FieldName := 'Col11'
          else if FieldName = 'DATE2' Then
            FieldName := 'Col12'
          else if FieldName = 'DATE3' Then
            FieldName := 'Col13'
          else if FieldName = 'NUMBER1' Then
            FieldName := 'Col14'
          else if FieldName = 'NUMBER2' Then
            FieldName := 'Col15'
          else FieldName := '';
//---------------
          MatchFieldName := DatModCap.GetAlias(FieldName);
//---------------
          If FieldName = 'Col1' Then
            DBEdit := frm_Console.fProcessing.edt_IText1
          else if FieldName = 'Col2' Then
            DBEdit := frm_Console.fProcessing.edt_IText2
          else if FieldName = 'Col3' Then
            DBEdit := frm_Console.fProcessing.edt_IText3
          else if FieldName = 'Col4' Then
            DBEdit := frm_Console.fProcessing.edt_IText4
          else if FieldName = 'Col5' Then
            DBEdit := frm_Console.fProcessing.edt_IText5
          else if FieldName = 'Col6' Then
            DBEdit := frm_Console.fProcessing.edt_IText6
          else if FieldName = 'Col7' Then
            DBEdit := frm_Console.fProcessing.edt_IText7
          else if FieldName = 'Col8' Then
            DBEdit := frm_Console.fProcessing.edt_IText8
          else if FieldName = 'Col9' Then
            DBEdit := frm_Console.fProcessing.edt_IText9
          else if FieldName = 'Col10' Then
            DBEdit := frm_Console.fProcessing.edt_IText10
          else if FieldName = 'Col11' Then
            DBEdit := frm_Console.fProcessing.edt_IDate1
          else if FieldName = 'Col12' Then
            DBEdit := frm_Console.fProcessing.edt_IDate2
          else if FieldName = 'Col13' Then
            DBEdit := frm_Console.fProcessing.edt_IDate3
          else if FieldName = 'Col14' Then
            DBEdit := frm_Console.fProcessing.edt_INum1
          else if FieldName = 'Col15' Then
            DBEdit := frm_Console.fProcessing.edt_INum2;
//---------------
          If FieldName <> '' Then
            begin
              If NoVerifyFlag Then
                exit;
              If CheckIfVerified(FieldName) Then
                begin
                  CheckStr := '';
                  LocalP.X := DBEdit.Left-2;
                  LocalP.Y := DBEdit.Top-13;
                  ScreenP := DBEdit.ClientToScreen(LocalP);
                  frm_DataVer.Top := Screenp.Y;
                  frm_DataVer.Left := ScreenP.X;
                  frm_DataVer.Width := DBEdit.Width;
                  frm_DataVer.Height := DBEdit.Height;
                  frm_DataVer.VerifyText :=  Field.AsString;
                  If frm_DataVer.Execute <> mrOK Then
                    begin
                      Abort;
                      exit;
                    end;
                end;
//----------------------
              If CheckIfMatch(MatchFieldName) Then
                begin
                  qry_SQL.Close;
                  qry_SQL.SQL.Clear;
                  qry_SQL.SQL.Add('SELECT * FROM IndexDefsMatch WHERE Description = :DS AND ['+Field.FieldName+'] = :Match');
                  qry_SQL.Parameters.ParamValues['DS'] := qry_Items.FieldByName('FILETYPE').AsString;
                  qry_SQL.Parameters.ParamValues['Match'] := Field.Value;
                  qry_SQL.Open;
                  If not qry_SQL.IsEmpty Then
                    begin
                      For J := 1 to 10 Do
                        begin
                          If ('TEXT'+InttoStr(J)) <> UpperCase(Field.FieldName) Then
                            qry_Items['TEXT'+InttoStr(J)] := qry_SQL.FieldByName('TEXT'+InttoStr(J)).Value;
                        end;
                      For J := 1 to 3 Do
                        begin
                          If ('DATE'+InttoStr(J)) <> UpperCase(Field.FieldName) Then
                            qry_Items['DATE'+InttoStr(J)] := qry_SQL.FieldByName('DATE'+InttoStr(J)).Value;
                        end;
                      For J := 1 to 2 Do
                        begin
                          If ('NUMBER'+InttoStr(J)) <> UpperCase(Field.FieldName) Then
                            qry_Items['NUMBER'+InttoStr(J)] := qry_SQL.FieldByName('NUMBER'+InttoStr(J)).Value;
                        end;
                   end;
                  qry_SQL.Close;
                end;
            end;
        end;
    end;
end;

procedure TDatModCap.dts_ItemsStateChange(Sender: TObject);
begin
  If qry_Items.State = dsInsert Then
    begin
      frm_Console.fProcessing.chk_DCMatchItemstoFile.Visible := true;
      frm_Console.fProcessing.btn_InUseItem.Enabled := false;
      frm_Console.fProcessing.btn_PrintItemCoversheet.Enabled := false;

      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT * FROM Barcode_Range WHERE Branch = :Branch AND Department = :Department AND RecordType = :RecordType AND Type = ''I'' AND AutoGenBarcode = 1');
      qry_SQL.Parameters.ParamValues['Branch'] := miBranch;
      qry_SQL.Parameters.ParamValues['Department'] := miDepartment;
      qry_SQL.Parameters.ParamValues['RecordType'] := qry_Items.FieldbyName('FileType').asString;
      dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));

      If not qry_SQL.IsEmpty Then
        begin
          frm_Console.fProcessing.editItemCode.ReadOnly := True;
          frm_Console.fProcessing.editItemCode.Color := clScrollbar;
        end
      else
        begin
          frm_Console.fProcessing.editItemCode.ReadOnly := False;
          frm_Console.fProcessing.editItemCode.Color := clWindow;
        end;
    end
  else if qry_Items.State = dsEdit Then
    begin
      frm_Console.fProcessing.chk_DCMatchItemstoFile.Visible := false;
      frm_Console.fProcessing.btn_InUseItem.Enabled := false;
      frm_Console.fProcessing.btn_PrintItemCoversheet.Enabled := false;
      frm_Console.fProcessing.editItemCode.Color := clScrollbar;
      frm_Console.fProcessing.editItemCode.ReadOnly := True;
    end
  else
    begin
      frm_Console.fProcessing.btn_PrintItemCoversheet.Enabled := true;
      frm_Console.fProcessing.btn_InUseItem.Enabled := True;
      frm_Console.fProcessing.chk_DCMatchItemstoFile.Visible := false;
      frm_Console.fProcessing.editItemCode.Color := clScrollbar;
      frm_Console.fProcessing.editItemCode.ReadOnly := True;
    end;
end;

procedure TDatModCap.qry_FilesMainAfterPost(DataSet: TDataSet);
begin
  qry_FilesMain.Close;
  qry_FilesMain.SQL.Clear;
  qry_FilesMain.SQL.Add('Select * from files where filenumber = :MFILE');
  qry_FilesMain.Parameters.ParamByName('MFILE').Value := FilesKey;
  qry_FilesMain.Open;
end;

procedure TDatModCap.qry_FilesSearchAfterScroll(DataSet: TDataSet);
begin
  If frm_Console.fProcessing = Nil Then
    exit;
  frm_Console.fProcessing.btn_ViewImage.Enabled := Dataset.FieldByName('ImageStatus').asInteger <> 0;
end;

procedure TDatModCap.qry_ItemsAfterInsert(DataSet: TDataSet);
begin
  If miIssueStatus = 'MET' Then
    begin
      Messagedlg('Items may not be captured if the Record is Off-Site!', mtInformation, [mbOK], 0);
      DatModCap.qry_Items.Cancel;
      exit;
    end;
//--------------------------
  qry_Items['FileNumber'] := miFilenumber;
  qry_Items['FileType'] := miFileType;
  qry_Items['SentToFile'] := dm_Metrofiler.GetServTimeNow;
  qry_Items['UserID'] := User;

  If miFileType <> '' Then
    begin
      qry_SQL.Close;
      qry_SQL.SQL.Clear;
      qry_SQL.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :Description');
      qry_SQL.Parameters.ParamValues['Description'] := miFileType;
      dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));
      qry_Items['FilingMethod'] := qry_SQL.FieldbyName('FilingMethod').Value;
      qry_SQL.Close;
    end;

  frm_Console.fProcessing.Date_Filed.DateTime := now;
end;


procedure TDatModCap.CalculateDestructionDateFiles;
var
  RecordType  :String;
  mStartDate  :TDateTime;
  CalcDestructOnField :String;
  J, RetentionPeriod   :Integer;
begin
  If qry_FilesMain.FieldByName('Destroy').AsInteger = 1 Then
    begin
      qry_FilesMain.edit;
      qry_FilesMain['Destruct'] := Null;
      exit;
    end;
  RecordType := trim(qry_FilesMain.FieldByName('FileType').AsString);
//-------
  If RecordType = '' Then
    begin
      qry_SQL.Close;
      MessageDLG('The File must have a Record Type before calculating the destruction date',mtInformation,[mbOK],0);
      exit;
    end;
//-------
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :Description');
  qry_SQL.Parameters.ParamValues['Description'] := RecordType;
  dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));
  If qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      MessageDLG('The Record Type does not exists in the system',mtInformation,[mbOK],0);
      exit;
    end;
//-------
  If qry_SQL.FieldByName('fDestroy').AsInteger = 1 Then
    begin
      qry_FilesMain.edit;
      qry_FilesMain['Destruct'] := Null;
      exit;
    end;
  If (qry_SQL.FieldByName('fCalcDestructOnEntryDate').AsBoolean = False)and
     (trim(qry_SQL.FieldByName('fCalcDestructOnField').AsString) = '') Then
    begin
      qry_SQL.Close;
      MessageDLG('First complete the Record Type Definition. You need to specify on what to calculate the destruction date from.',mtInformation,[mbOK],0);
      exit;
    end;

  If (qry_SQL.FieldByName('fCalcDestructOnEntryDate').AsBoolean = False)Then
    begin
      CalcDestructOnField :=  trim(qry_SQL.FieldByName('fCalcDestructOnField').AsString);

      mStartDate := 0;
      For J := 11 to 12 Do
        begin
          If trim(qry_SQL.FieldByName('Col'+InttoStr(J)).AsString) = CalcDestructOnField Then
            begin
              If J = 11 Then
                mStartDate := qry_FilesMain.FieldbyName('Date1').asDateTime;
              If J = 12 Then
                mStartDate := qry_FilesMain.FieldbyName('Date2').asDateTime;
            end;
        end;
    end
  else If qry_SQL.FieldByName('fCalcDestructOnEntryDate').AsBoolean = True Then
    begin
      mStartDate := qry_FilesMain.FieldbyName('EntryDate').asDateTime;
    end;

   If mStartDate = 0 Then
     begin
       qry_FilesMain.edit;
       qry_FilesMain['Destruct'] := Null;
       exit;
     end;

   RetentionPeriod := qry_FilesMain.FieldbyName('RetentionPeriod').asInteger;

   qry_FilesMain.edit;
   qry_FilesMain['Destruct'] := StartoftheDay(IncMonth(mStartDate,RetentionPeriod));
end;


procedure TDatModCap.CalculateDestructionDateContainers;
var
  RecordType  :String;
  mStartDate  :TDateTime;
  CalcDestructOnField :String;
  J, RetentionPeriod   :Integer;
begin
  If qry_ContainersMain.FieldByName('Destroy').AsInteger = 1 Then
    begin
      qry_ContainersMain.edit;
      qry_ContainersMain['Destruct'] := Null;
      exit;
    end;
  RecordType := trim(qry_ContainersMain.FieldByName('FileType').AsString);
//-------
  If RecordType = '' Then
    begin
      qry_SQL.Close;
      MessageDLG('The Container must have a Record Type before calculating the destruction date',mtInformation,[mbOK],0);
      exit;
    end;
//-------
  qry_SQL.Close;
  qry_SQL.SQL.Clear;
  qry_SQL.SQL.Add('SELECT * FROM IndexDefinitions WHERE Description = :Description');
  qry_SQL.Parameters.ParamValues['Description'] := RecordType;
  dm_Metrofiler.ExecuteCached(qry_SQL, EncodeTime(1,0,0,0));
  If qry_SQL.IsEmpty Then
    begin
      qry_SQL.Close;
      MessageDLG('The Record Type does not exists in the system',mtInformation,[mbOK],0);
      exit;
    end;
//-------
  If qry_SQL.FieldByName('cDestroy').AsInteger = 1 Then
    begin
      qry_ContainersMain.edit;
      qry_ContainersMain['Destruct'] := Null;
      exit;
    end;
  If (qry_SQL.FieldByName('cCalcDestructOnEntryDate').AsBoolean = False)and
     (trim(qry_SQL.FieldByName('cCalcDestructOnField').AsString) = '') Then
    begin
      qry_SQL.Close;
      MessageDLG('First complete the Record Type Definition. You need to specify on what to calculate the destruction date from.',mtInformation,[mbOK],0);
      exit;
    end;

  If (qry_SQL.FieldByName('cCalcDestructOnEntryDate').AsBoolean = False)Then
    begin
      CalcDestructOnField :=  trim(qry_SQL.FieldByName('cCalcDestructOnField').AsString);

      mStartDate := 0;
      For J := 11 to 12 Do
        begin
          If trim(qry_SQL.FieldByName('Col'+InttoStr(J)).AsString) = CalcDestructOnField Then
            begin
              If J = 11 Then
                mStartDate := qry_ContainersMain.FieldbyName('Date1').asDateTime;
              If J = 12 Then
                mStartDate := qry_ContainersMain.FieldbyName('Date2').asDateTime;
            end;
        end;
    end
  else If qry_SQL.FieldByName('cCalcDestructOnEntryDate').AsBoolean = True Then
    begin
      mStartDate := qry_ContainersMain.FieldbyName('EntryDate').asDateTime;
    end;

   If mStartDate = 0 Then
     begin
       qry_ContainersMain.edit;
       qry_ContainersMain['Destruct'] := Null;
       exit;
     end;

   RetentionPeriod:= qry_ContainersMain.FieldbyName('RetentionPeriod').asInteger;

   qry_ContainersMain.edit;
   qry_ContainersMain['Destruct'] := StartoftheDay(IncMonth(mStartDate,RetentionPeriod));
end;

function TDatModCap.CheckIfMatch(FieldName  :String):Boolean;
Var
  J   :Integer;
begin
  If trim(IndexDefMatchCol) <> '' then
    Result := IndexDefMatchCol = Fieldname
  else Result := False;
end;

end.
