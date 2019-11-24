unit Secure;

interface

uses
  Classes, Graphics, ExtCtrls, RegSec, ScktComp;

type
  TCheckRegThread = class(TThread)
  private
    FSecureIPAddr    :String;
    FSecureHost    :String;
    FSecurePort      :Integer;
    FSessionID       :Integer;
  protected
    procedure Execute; override;
    procedure CheckReg;
  public
    constructor Create(SecureIPAddr, SecureHost :string; SecurePort :Integer; var SessionID:Integer; var ResultStr :string);
  end;

implementation

constructor TCheckRegThread.Create(SecureIPAddr, SecureHost :string; SecurePort :Integer; var SessionID:Integer; var ResultStr :string);
begin
  FSessionID := SessionID;
  FreeOnTerminate := True;
  inherited Create(False);
end;

procedure TCheckRegThread.Execute;
begin
  CheckReg();
end;

procedure TCheckRegThread.CheckReg;
Var
  RegSec           :TRegSec;
  ClientSocket     :TClientSocket;
begin
  RegSec := RegSec.Create(Nil);
  ClientSocket := TClientSocket.Create(Nil);
  try
    If FSecureIPAddr <> '' Then
      ClientSocket.Address := FSecureIPAddr
    else ClientSocket.Host := FSecureHost;
    ClientSocket.Port := FSecurePort;
    ClientSocket.ClientType := ctBlocking;
  finally
    RegSec.Free;
    ClientSocket.Free;
  end;
end;

end.
