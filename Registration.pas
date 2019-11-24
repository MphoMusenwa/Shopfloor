unit Registration;

interface

uses
  Classes, Graphics, ExtCtrls, RegSec, ScktComp, SysUtils, Forms;

type
{ TRegThread }
  TRegThread = class(TThread)
  private
  protected
    fDocMan  :Word;
    fWareMan  :Word;
    fEntMan  :Word;
    feRecMan  :Word;
    fImgMan   :Word;
    fCOOLMan   :Word;
    fWebMan   :Word;
    feRecBulkCapture :Word;
    fIndexMatchingMan :Word;
    fRecordCount     :Integer;
    fContainerCount  :Integer;
    fItemCount       :Integer;
    feRecordCount    :Integer;
    fSecureID        :Integer;
    fExpireDays      :Integer;
    fErrorMessage    :String;

    fSecureIPAddr    :String;
    fSecureHost      :String;
    fSecurePort      :Integer;
    fInit            :Boolean;

    ffrm_Console     :TForm;

    procedure Execute; override;
    procedure IsRegistered();
    procedure SaveValues;
  public
    constructor Create(SecureID :Integer; SecureIPAddr, SecureHost :String; SecurePort :Integer);
  end;

implementation

uses main;

constructor TRegThread.Create(SecureID :Integer; SecureIPAddr, SecureHost :String; SecurePort :Integer);
begin
  fSecureIPAddr := SecureIPAddr;
  fSecureHost := SecureHost;
  fSecurePort := SecurePort;
  fSecureID := SecureID;

  ffrm_Console := frm_Console;

  FreeOnTerminate := True;
  inherited Create(False);
end;

procedure TRegThread.Execute;
begin
  IsRegistered();
end;

procedure TRegThread.IsRegistered();
var
  mTemp             :String;
  mCommand          :String;
  Stream            :TWinSocketStream;
  Buffer            :Array[0 .. 999] of Char;
  LastError         :String;
  Retries           :Integer;
  ClientSocket      :TClientSocket;
  RegSec1           :TRegSec;
  NewSecureID       :Integer;
begin
         fInit := TRUE;
          fDocMan  := 0;
          fWareMan  := 0;
          fEntMan  := 1;
          feRecMan  := 0;
          fImgMan  := 0;
          fWebMan := 1;
          feRecBulkCapture := 1;
          fRecordCount     := 1000000;
          fContainerCount  := 1000000;
          fItemCount      := 1000000;
          feRecordCount    := 1000000;
          fExpireDays := Trunc(EncodeDate(2025, 1, 1));
          Synchronize(SaveValues);
          EXIT;


  ClientSocket := TClientSocket.Create(nil);
  try
    RegSec1 := TRegSec.Create(Nil);
    try
      ClientSocket.ClientType := ctBlocking;
      RegSec1.Trial := False;
//----------
      If fSecureID = 0 Then
        begin
          fDocMan  := 0;
          fWareMan  := 0;
          fEntMan  := 0;
          feRecMan  := 0;
          fImgMan  := 0;
          fCOOLMan := 0;
          fWebMan := 0;
          feRecBulkCapture := 0;
          fIndexMatchingMan := 0;
          fRecordCount     := 0;
          fContainerCount  := 0;
          fItemCount      := 0;
          feRecordCount    := 0;
        end;
//-----------
      If fSecureIPAddr <> '' Then
        ClientSocket.Address := fSecureIPAddr
      else ClientSocket.Host := fSecureHost;
      ClientSocket.Port := fSecurePort;
      Retries := 0;
      Repeat
        LastError := '';
        Inc(Retries);
        try
          try
            ClientSocket.Open;
            Sleep(10);
            Application.ProcessMessages;
  //------------
            If not ClientSocket.Active Then
              begin
                LastError := 'Warning.... Could not obtain registration details. Security server is unavailable.';
                Continue;
              end;
  //-----------Check if MetroFiler Registered
            Clientsocket.Socket.SendText('IsReg?MetroFiler?'+InttoStr(fSecureID));
            Sleep(10);
            Application.ProcessMessages;
            Stream := TWinSocketStream.Create(ClientSocket.Socket, 60000);
            FillChar(Buffer, 1000, 0);
            If not Stream.WaitForData(5000) Then
              begin
                LastError := 'Warning.... Could not obtain registration details. Security server not responding.';
                Continue;
              end;
            If Stream.Read(Buffer, 1000) = 0 then
              begin
                LastError := 'Warning.... Could not obtain registration details. Security server responded with a NULL string.';
                Continue;
              end;
  //--------------now process the request-------------
            mTemp := Buffer;
            RegSec1.SoftwareTitle := 'MetroFiler';
            mCommand := RegSec1.pDCrypt(mTemp, 'MetroFiler');
            If copy(mCommand, 1, 21) <> 'IsReg?MetroFiler=>OK.' Then
              begin
                LastError := 'Warning.... Could not obtain registration details. '+mCommand;
                break;
              end;
            mCommand := copy(mCommand, 22, 1000);
//===================Analyze the devices========================================
            If fSecureID = 0 Then
              begin
   //----fSecureID
                fSecureID := StrtoInt(copy(mCommand, 1, pos(',', mCommand)-1));
                mCommand := copy(mCommand, pos(',', mCommand)+1, 1000);
   //----SystemType
                mTemp := copy(mCommand, 1, pos(',', mCommand)-1);
                mCommand := copy(mCommand, pos(',', mCommand)+1, 1000);

                If copy(mTemp, 2, 1) = '1' Then fDocMan := 1;
                If copy(mTemp, 3, 1) = '1' Then fWareMan  := 1;
                If copy(mTemp, 4, 1) = '1' Then feRecMan  := 1;
                If copy(mTemp, 5, 1) = '1' Then fEntMan  := 1;
                If copy(mTemp, 6, 1) = '1' Then fWebMan := 1;
                If copy(mTemp, 7, 1) = '1' Then fImgMan := 1;
                If copy(mTemp, 8, 1) = '1' Then feRecBulkCapture := 1;
                If copy(mTemp, 9, 1) = '1' Then fIndexMatchingMan := 1;
                If copy(mTemp, 10, 1) = '1' Then fCOOLMan := 1;
        //----
                If (fDocMan = 0)and
                   (fWareMan = 0)and
                   (feRecMan = 0)and
                   (fImgMan = 0)and
                   (fCOOLMan = 0)and
                   (feRecBulkCapture = 0)and
                   (fEntMan = 0)Then
                  begin
                    LastError := 'Warning.... System is not registered.';
                    break;
                  end;
   //----ExpireDays
                fExpireDays := StrtoInt(copy(mCommand, 1, 1000));

                fInit := true;
                Synchronize(SaveValues);
                break;
              end
            else
              begin
   //----fSecureID
                NewSecureID := StrtoInt(copy(mCommand, 1, pos(',', mCommand)-1));

                if fSecureID <> NewSecureID then
                  fSecureID := NewSecureID;

                Synchronize(SaveValues);
                break;
              end;

          except
            on E: Exception do
              begin
                LastError := 'Warning.... Could not obtain registration details. '+E.Message;
                Continue;
              end;
          end;
        finally
          If ClientSocket.Active Then
            ClientSocket.Close;
          Sleep(10);
          Application.ProcessMessages;
        end;
      Until Retries >= 30;

      fErrorMessage := LastError;
      fInit := false;
      Synchronize(SaveValues);
    finally
      RegSec1.Free;
    end;
  finally
    ClientSocket.Free;
  end;
end;

procedure TRegThread.SaveValues;
begin
  frm_Console.fSecureID := fSecureID;
  If fInit Then
    begin
      frm_Console.fDocMan := fDocMan;
      frm_Console.fWareMan := fWareMan;
      frm_Console.fEntMan := fEntMan;
      frm_Console.feRecMan := feRecMan;
      frm_Console.fImgMan := fImgMan;
      frm_Console.fCOOLMan := fCOOLMan;
      frm_Console.fWebMan := fWebMan;
      frm_Console.feRecBulkCapture := feRecBulkCapture;
      frm_Console.fIndexMatchingMan := fIndexMatchingMan;
      frm_Console.fExpireDays := fExpireDays;
    end;
  frm_Console.fErrorMessage := fErrorMessage;
end;

end.
