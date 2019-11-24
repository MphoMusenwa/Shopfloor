unit ItemCoversheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, QRCtrls, QuickRpt, ExtCtrls, StdCtrls, Buttons;

type
  Tfrm_ItemCoversheet = class(TForm)
    qry_repRecordHead: TADOQuery;
    qry_repRecordDetail: TADOQuery;
    qry_Transa: TADOQuery;
    rep_RecordDetails: TQuickRep;
    TitleBand1: TQRBand;
    QRShape13: TQRShape;
    QRShape8: TQRShape;
    QRShape4: TQRShape;
    QRLabel19: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRImage1: TQRImage;
    ColumnHeaderBand2: TQRBand;
    QRShape2: TQRShape;
    QRLabel18: TQRLabel;
    QRShape18: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape19: TQRShape;
    DetailBand2: TQRBand;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    PageFooterBand1: TQRBand;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel23: TQRLabel;
    lbl_repRecordDetOperator: TQRLabel;
    QRLabel24: TQRLabel;
    QRSysData1: TQRSysData;
    SummaryBand1: TQRBand;
    QRShape_Action: TQRShape;
    QRShape_ActionTitle: TQRShape;
    qrShape_History2: TQRShape;
    qrShape_History3: TQRShape;
    qrShape_History1: TQRShape;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRShape14: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    qrlbl_TrxType1: TQRLabel;
    qrlbl_Date1: TQRLabel;
    qrlbl_FrStat1: TQRLabel;
    qrlbl_ToStat1: TQRLabel;
    qrlbl_Requester1: TQRLabel;
    qrlbl_Warehouse1: TQRLabel;
    qrlbl_LocNo1: TQRLabel;
    qrlbl_TrxType2: TQRLabel;
    qrlbl_Date2: TQRLabel;
    qrlbl_FrStat2: TQRLabel;
    qrlbl_ToStat2: TQRLabel;
    qrlbl_Requester2: TQRLabel;
    qrlbl_Warehouse2: TQRLabel;
    qrlbl_LocNo2: TQRLabel;
    qrlbl_TrxType3: TQRLabel;
    qrlbl_Date3: TQRLabel;
    qrlbl_FrStat3: TQRLabel;
    qrlbl_ToStat3: TQRLabel;
    qrlbl_Requester3: TQRLabel;
    qrlbl_Warehouse3: TQRLabel;
    qrlbl_LocNo3: TQRLabel;
    qrlbl_ActionTitle: TQRLabel;
    qrlbl_Action: TQRLabel;
    qry_Action: TADOQuery;
    Panel1: TPanel;
    btn_PrintRecordDetails: TSpeedButton;
    Label1: TLabel;
    cb_Action: TComboBox;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape17: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape26: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText12: TQRDBText;
    procedure btn_PrintRecordDetailsClick(Sender: TObject);
    procedure QRDBText8Print(sender: TObject; var Value: string);
    procedure QRDBBarcodePrint(sender: TObject; var Value: string);
  private
    { Private declarations }
    function getBarcode(rawData  :String):String;
    function Str2Code128(InStr :String):String;
  public
    { Public declarations }
    function Execute(Itemnumber  :String):Integer;
  end;

var
  frm_ItemCoversheet: Tfrm_ItemCoversheet;

implementation

Uses Main;

{$R *.dfm}

function Tfrm_ItemCoversheet.Execute(Itemnumber  :String):Integer;
begin
  qry_repRecordHead.Close;
  qry_repRecordHead.Parameters.ParamValues['mItem'] := Itemnumber;
  qry_repRecordHead.Open;

  qry_repRecordDetail.Close;
  qry_repRecordDetail.Parameters.ParamValues['mItem'] := Itemnumber;
  qry_repRecordDetail.Open;

  qry_Transa.Close;
  qry_Transa.SQL.Clear;
  qry_Transa.SQL.Add('SELECT TOP 3 * FROM Transa WHERE Itemnumber = :Itemnumber ORDER BY Trx_No DESC');
  qry_Transa.Parameters.ParamValues['Itemnumber'] := Itemnumber;
  qry_Transa.Open;

  qrlbl_TrxType1.Caption := '';
  qrlbl_TrxType2.Caption := '';
  qrlbl_TrxType3.Caption := '';
  qrlbl_TrxType1.Enabled := false;
  qrlbl_TrxType2.Enabled := false;
  qrlbl_TrxType3.Enabled := false;

  qrlbl_Date1.Caption := '';
  qrlbl_Date2.Caption := '';
  qrlbl_Date3.Caption := '';
  qrlbl_Date1.Enabled := false;
  qrlbl_Date2.Enabled := false;
  qrlbl_Date3.Enabled := false;

  qrlbl_FrStat1.Caption := '';
  qrlbl_FrStat2.Caption := '';
  qrlbl_FrStat3.Caption := '';
  qrlbl_FrStat1.Enabled := false;
  qrlbl_FrStat2.Enabled := false;
  qrlbl_FrStat3.Enabled := false;

  qrlbl_ToStat1.Caption := '';
  qrlbl_ToStat2.Caption := '';
  qrlbl_ToStat3.Caption := '';
  qrlbl_ToStat1.Enabled := false;
  qrlbl_ToStat2.Enabled := false;
  qrlbl_ToStat3.Enabled := false;

  qrlbl_Requester1.Caption := '';
  qrlbl_Requester2.Caption := '';
  qrlbl_Requester3.Caption := '';
  qrlbl_Requester1.Enabled := false;
  qrlbl_Requester2.Enabled := false;
  qrlbl_Requester3.Enabled := false;

  qrlbl_Warehouse1.Caption := '';
  qrlbl_Warehouse2.Caption := '';
  qrlbl_Warehouse3.Caption := '';
  qrlbl_Warehouse1.Enabled := false;
  qrlbl_Warehouse2.Enabled := false;
  qrlbl_Warehouse3.Enabled := false;

  qrlbl_LocNo1.Caption := '';
  qrlbl_LocNo2.Caption := '';
  qrlbl_LocNo3.Caption := '';
  qrlbl_LocNo1.Enabled := false;
  qrlbl_LocNo2.Enabled := false;
  qrlbl_LocNo3.Enabled := false;

  qrShape_History1.Enabled := false;
  qrShape_History2.Enabled := false;
  qrShape_History3.Enabled := false;

  qrShape_ActionTitle.Top := 128-24-24-24;
  qrlbl_ActionTitle.Top := 133-24-24-24;
  qrShape_Action.Top := 155-24-24-24;
  qrlbl_Action.Top := 160-24-24-24;

  If not qry_Transa.IsEmpty Then
    begin
      qrlbl_TrxType1.Caption := qry_Transa.FieldByName('Transaction_Type').AsString;
      qrlbl_Date1.Caption := qry_Transa.FieldByName('TDate').AsString;
      qrlbl_FrStat1.Caption := qry_Transa.FieldByName('From_Status').AsString;
      qrlbl_ToStat1.Caption := qry_Transa.FieldByName('To_Status').AsString;
      qrlbl_Requester1.Caption := qry_Transa.FieldByName('Requester').AsString;
      qrlbl_Warehouse1.Caption := qry_Transa.FieldByName('Warehouse').AsString;
      qrlbl_LocNo1.Caption := qry_Transa.FieldByName('LocNo').AsString;

      qrlbl_TrxType1.Enabled := True;
      qrlbl_Date1.Enabled := True;
      qrlbl_FrStat1.Enabled := True;
      qrlbl_ToStat1.Enabled := True;
      qrlbl_Requester1.Enabled := True;
      qrlbl_Warehouse1.Enabled := True;
      qrlbl_LocNo1.Enabled := True;

      qrShape_History1.Enabled := true;

      qrShape_ActionTitle.Top := 128-24-24;
      qrlbl_ActionTitle.Top := 133-24-24;
      qrShape_Action.Top := 155-24-24;
      qrlbl_Action.Top := 160-24-24;

      if qry_Transa.RecordCount >= 2 then
        begin
          qry_Transa.Next;
          qrlbl_TrxType2.Caption := qry_Transa.FieldByName('Transaction_Type').AsString;
          qrlbl_Date2.Caption := qry_Transa.FieldByName('TDate').AsString;
          qrlbl_FrStat2.Caption := qry_Transa.FieldByName('From_Status').AsString;
          qrlbl_ToStat2.Caption := qry_Transa.FieldByName('To_Status').AsString;
          qrlbl_Requester2.Caption := qry_Transa.FieldByName('Requester').AsString;
          qrlbl_Warehouse2.Caption := qry_Transa.FieldByName('Warehouse').AsString;
          qrlbl_LocNo2.Caption := qry_Transa.FieldByName('LocNo').AsString;

          qrlbl_TrxType2.Enabled := True;
          qrlbl_Date2.Enabled := True;
          qrlbl_FrStat2.Enabled := True;
          qrlbl_ToStat2.Enabled := True;
          qrlbl_Requester2.Enabled := True;
          qrlbl_Warehouse2.Enabled := True;
          qrlbl_LocNo2.Enabled := True;

          qrShape_History2.Enabled := true;

          qrShape_ActionTitle.Top := 128-24;
          qrlbl_ActionTitle.Top := 133-24;
          qrShape_Action.Top := 155-24;
          qrlbl_Action.Top := 160-24;
        end;

      if qry_Transa.RecordCount >= 3 then
        begin
          qry_Transa.Next;
          qrlbl_TrxType3.Caption := qry_Transa.FieldByName('Transaction_Type').AsString;
          qrlbl_Date3.Caption := qry_Transa.FieldByName('TDate').AsString;
          qrlbl_FrStat3.Caption := qry_Transa.FieldByName('From_Status').AsString;
          qrlbl_ToStat3.Caption := qry_Transa.FieldByName('To_Status').AsString;
          qrlbl_Requester3.Caption := qry_Transa.FieldByName('Requester').AsString;
          qrlbl_Warehouse3.Caption := qry_Transa.FieldByName('Warehouse').AsString;
          qrlbl_LocNo3.Caption := qry_Transa.FieldByName('LocNo').AsString;

          qrlbl_TrxType3.Enabled := True;
          qrlbl_Date3.Enabled := True;
          qrlbl_FrStat3.Enabled := True;
          qrlbl_ToStat3.Enabled := True;
          qrlbl_Requester3.Enabled := True;
          qrlbl_Warehouse3.Enabled := True;
          qrlbl_LocNo3.Enabled := True;

          qrShape_History3.Enabled := true;

          qrShape_ActionTitle.Top := 128;
          qrlbl_ActionTitle.Top := 133;
          qrShape_Action.Top := 155;
          qrlbl_Action.Top := 160;
        end;
    end;

  qry_Action.Close;
  qry_Action.SQL.Clear;
  qry_Action.SQL.Add('SELECT ActionName FROM Actions WHERE ActionType = ''Coversheet'' ORDER BY ActionName');
  qry_Action.Open;
  qry_Action.First;
  cb_Action.Items.clear;
  While not qry_Action.EOF Do
    begin
      cb_Action.Items.Add(qry_Action.Fields[0].AsString);
      qry_Action.Next;
    end;
  qry_Action.Close;

  lbl_repRecordDetOperator.Caption := User;
  rep_RecordDetails.ReportTitle := 'Item Coversheet - '+Itemnumber;

  Result := ShowModal;
end;



procedure Tfrm_ItemCoversheet.QRDBText8Print(sender: TObject;
  var Value: string);
begin
  If Value <> '' Then
    Value := '*' + Value + '*';
end;

procedure Tfrm_ItemCoversheet.QRDBBarcodePrint(sender: TObject;
  var Value: string);
begin
  If Value <> '' Then
    Value := '*' + Value + '*';
//  Value := getBarcode(Value);
end;

function Tfrm_ItemCoversheet.Str2Code128(InStr :String):String;
var
  J, R       :Integer;
  OutStr    :String;
  O, I, Dum :Integer;
  tableB    :Boolean;
  mini, Checksum      :Integer;
begin
  OutStr := '';

  R := 10;
  If Length(InStr) > 0 Then
    begin
      //Check for valid characters
      For I := 1 to length(InStr) Do
        begin
          O := ord(InStr[I]);

          If ((O >= 32)and(O <= 126))OR(O = 203) Then
            begin
            end
          else
            begin
              R := 0;
              break;
            end;
        end;
      //Calculation of the code string with optimized use of tables B and C
      OutStr := '';
      tableB := True;

      If R > 0 Then
        begin
          I := 1;      //i become the string index
          While I <= Length(InStr) Do
            begin
              //See if interesting to switch to table C
              //yes for 4 digits at start or end, else if 6 digits
              If TableB Then
                begin
                  If (I = 1) or ((I + 3) = Length(InStr)) Then
                    mini := 4
                  else
                    mini := 6;

                  //-------------------Testnum-----------------
                  //if the mini% characters from i% are numeric, then mini%=0
                  mini := mini -1;
                  If I + mini <= Length(InStr) Then
                    begin
                      While mini >= 0 Do
                        begin
                          If (Ord(Instr[I + mini]) < 48) or (Ord(InStr[I + mini]) > 57) Then
                            break;
                          mini := mini -1;
                        end;
                    end;
                  //-------------------Testnum-----------------

                  If mini < 0 Then //Choice of table C
                    begin
                      If I  = 1 Then //Starting with table C
                        OutStr := Chr(210)
                      else
                        OutStr := OutStr + Chr(204);

                      TableB := False;
                    end
                  else if I = 1 then // Starting with table B
                    begin
                      OutStr := Chr(209);
                    end
                end;
              If not TableB Then //We are on table C, try to process 2 digits
                begin
                  mini := 2;

                  //-------------------Testnum-----------------
                  //if the mini% characters from i% are numeric, then mini%=0
                  mini := mini -1;
                  If I + mini <= Length(InStr) Then
                    begin
                      While mini >= 0 Do
                        begin
                          If (Ord(Instr[I + mini]) < 48) or (Ord(Instr[I + mini]) > 57) Then
                            break;
                          mini := mini -1;
                        end;
                    end;
                  //-------------------Testnum-----------------

                  If mini < 0 Then  //OK for 2 digits, process it
                    begin
                      Dum := StrtoInt(copy(InStr, I, 2));
                      If (Dum < 95) Then
                        Dum := Dum + 32
                      else
                        Dum := Dum + 105;
                      OutStr := OutStr + Chr(Dum);
                      I := i + 2;
                    end
                  else
                    begin
                      OutStr := OutStr + Chr(205);
                      TableB := True;
                    end;
                end;
              If TableB Then   //Process 1 digit with table B
                begin
                  OutStr := OutStr + copy(InStr, I, 1);
                  I := I + 1;
                end;
            end;
          //Calculation of the checksum
          For i := 1 To Length(OutStr) Do
            begin
              Dum := Ord(OutStr[I]);
              If Dum < 127 Then
                Dum := Dum - 32
              else
                Dum := Dum - 105;

              If I = 1 Then
                Checksum := Dum;
              Checksum := (Checksum  + (i -1) * Dum) Mod 103;
            end;
          //Calculation of the checksum ASCII code
          If Checksum < 95 Then
            Checksum := Checksum + 32
          else
           Checksum := Checksum + 105;

          //Add the checksum and the STOP
          OutStr := OutStr + Chr(Checksum) + Chr(211);
        end;
    end;
  Result := OutStr;
end;


function Tfrm_ItemCoversheet.getBarcode(rawData  :String):String;
var
  offset        :Integer;
  highAscii     :Integer;
  total         :Integer;
  J             :Integer;
  newCodeString :Array of Integer;
  character     :char;
  ASCIIValue    :Integer;
  checkDigit    :Integer;
  check         :Integer;
  holder        :Integer;
  BarcodeText   :String;
begin
  offset := 32;
  highAscii := 18;

  SetLength(newCodeString, length(rawData) + 3);
  newCodeString[0] := offset + highAscii + 105;
  total := 105;

  for J := 0 to length(rawData)-1 do
    begin

      character := rawData[J + 1];
      ASCIIValue := Ord(character);
      checkDigit := ((ASCIIValue - offset) * (J + 1));

      total := total + checkdigit;
      newCodeString[J + 1] := ASCIIValue;
    end;

  check := total mod 103;
  holder := 0;

  If (check + offset >= 127) Then
    begin
      holder := check + offset + highAscii;
    end
  else
    begin
      holder := check + offset;
    end;

  newCodeString[length(newCodeString) - 2] := holder;
  holder := 106 + offset + highAscii;
  newCodeString[length(newCodeString) - 1] := holder;

  for J := 0 to length(newCodeString) - 1 do
    begin
      if newCodeString[J] = 32 then
        newCodeString[J] := 128;
    end;

  BarcodeText := '';
  for J := 0 to length(newCodeString) - 1 do
    begin
       BarcodeText := BarcodeText + chr(newCodeString[J]);
    end;

  Result := BarcodeText;
end;

procedure Tfrm_ItemCoversheet.btn_PrintRecordDetailsClick(Sender: TObject);
begin
  qrlbl_Action.Caption := cb_Action.Text;
  ModalResult := mrOK;
end;

end.
