unit RegSec;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Registry,
  Dialogs,
  CRC_32;
const
    MaxRound = 9; // Number of rounds minus one.

type
  TCipherBlock = array[0..15] of Byte;
  TSBox = array[0..MaxRound,0..15,0..255] of byte; // [round, byte of block, byte]
  TRegSec = class(TComponent)
  private
    { Private declarations }
    CRegisteredTo        :String;
    CSoftwareTitle       :String;
    CUsers               :Integer;
    CDevices1            :Integer;
    CDevices2            :Integer;
    CDevices3            :Integer;
    CDevices4            :Integer;
    CDevices5            :Integer;
    CDevices6            :Integer;
    CDevices7            :Integer;
    CDevices8            :Integer;
    CDevices9            :Integer;
    CDevices10           :Integer;
    CTrial               :Boolean;
    CSerialNo            :String;
    CUnLockKey           :String;
    CDiskSerial          :String;
    CDateRegistered      :TDate;
    CExpiresOn           :TDate;
    CSysMessage          :String;
//------------------------------------------------------------------------------
    { Private declarations }
    rotor,                            { Rotor and ratchet are used to help }
    ratchet,                          { Continually shuffle the "cards."   }
    avalanche,                        { Data dependent index. }
    last_plain,                       { Previous plain text byte. }
    last_cipher: byte;                { Previous cipher text byte. }
    cards: array[0..255] of byte;     { Array to hold a permutation of all }
    UserKey :String;
    procedure hash_init;              { Initialize state without key. }
    function  pRandom(nKey :integer):integer;
    function  GetSerNo() :String;
    procedure SetKey(const user_key: string); { Initialize state with key. }
    procedure Reoriginate;            { Restart stream. }
    procedure HashInit;               { Prepare to compute hash. }
    function  encrypt(const b: byte): byte;  { Encrypt b and return the result. }
    function  decrypt(const b: byte): byte;  { Decrypt b and return the result. }
    procedure EncryptString(var s: string);
    procedure DecryptString(var s: string);
    function  hash_final: string;      { Compute final hash value. }
    procedure burn;                   { Destroy internal key information. }
    function  RandomByte: byte;
    function  RandomFloat: extended;
    function  RandomInt(const Range: Longint): Longint;
    function  RandomInteger: Longint;
    function  RandomString: string;
    procedure PoolByte(const b: byte);      { "Pool" procedures "stir" entropy into}
    procedure PoolInt(const li: longint);   { pool of random numbers. }
    procedure PoolFloat(r: extended);
    procedure PoolString(const s: string);
    property RandByte: byte read RandomByte write PoolByte;
    property RandFloat: extended read RandomFloat write PoolFloat;
    property RandInteger: longint read RandomInteger write PoolInt;
    property RandString: string read RandomString write PoolString;
    function GetWindowsDrive :String;
  protected
    { Protected declarations }
  public
    { Public declarations }
//------------------------------------------------------------------------------
    constructor Create(AOwner: TComponent); override;
    function pDCrypt(cString,s_no :string) :String;
    function pNCrypt(cString,s_no :string) :String;
    function Unlock: Boolean;
    function GenSerial: Boolean;
    function GetSerial:Boolean;
    function Lock: Boolean;
    function IsReg() :Boolean;
    function UnReg() :Boolean;
//------------------------------------------------------------------------------
  published
    { Published declarations }
    property ResiteredTo: String read CRegisteredTo write CRegisteredTo;
    property SoftwareTitle: String read CSoftwareTitle write CSoftwareTitle;
    property Users: Integer read CUsers write CUsers;
    property Devices01: Integer read CDevices1 write CDevices1;
    property Devices02: Integer read CDevices2 write CDevices2;
    property Devices03: Integer read CDevices3 write CDevices3;
    property Devices04: Integer read CDevices4 write CDevices4;
    property Devices05: Integer read CDevices5 write CDevices5;
    property Devices06: Integer read CDevices6 write CDevices6;
    property Devices07: Integer read CDevices7 write CDevices7;
    property Devices08: Integer read CDevices8 write CDevices8;
    property Devices09: Integer read CDevices9 write CDevices9;
    property Devices10: Integer read CDevices10 write CDevices10;
    property Trial: Boolean read CTrial write CTrial;
    property SerialNo: String read CSerialNo write CSerialNo;
    property UnlockKey: String read CUnlockKey write CUnlockKey;
    property DiskSerial: String Read CDiskSerial;
    property ExpiresOn: TDate read CExpiresOn write CExpiresOn;
    property DateRegistred: TDate read CDateRegistered;
    property SysMessage: String read CSysMessage;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('SkySoft', [TRegSec]);
end;
//--
constructor TRegSec.Create(AOwner: TComponent);           //Assign Defaults
begin
  Inherited Create(AOwner);
end;

function TRegSec.GetWindowsDrive :String;
Var
  a    :array[0..244] of Char;
begin
  IF GetWindowsDirectory(a, Sizeof(a)) <> 0 Then
    begin
      Result := StrPas(a);
      Result := copy(Result, 1, 3);
    end
  else Result := 'Error';
end;

function TRegSec.GetSerNo() :String;
var
  VolumeSerialNumber :DWORD;
  MaximumComponentLength :DWORD;
  FileASystemFlags :DWORD;
  SerialNumber :string;
  mDrive     :Array[0..244] of Char;
  TempStr    :String;
begin
  TempStr := GetWindowsDrive; 
  StrPCopy(mDrive, TempStr);
  GetVolumeInformation(mDrive,
                       nil,
                       0,
                       @VolumeSerialNumber,
                       MaximumComponentLength,
                       FileASystemFlags,
                       nil,
                       0);
  SerialNumber := IntToHex(HiWord(VolumeSerialNumber), 4) +
                  '-' +
                  IntToHex(LoWord(VolumeSerialNumber), 4);
  result := SerialNumber;
end;


function TRegSec.pDCrypt(cString,s_no :string) :String;
var
  nLen,i,n :integer;
  mString :String;
  mTemp,mVal :string;
  cReturn :String;
begin
  cReturn := '';
  s_No := s_No + CSoftwareTitle;
  SetKey(trim(s_No));
  i := 1;
  nlen := (length(trim(cString)) div 2);
  for n := 1 to nlen do
    begin
      mVal := '$'+(cString[i]+cString[i+1]);
      cReturn := cReturn + chr(Ord(StrToInt(mval)));
      inc(i,2);
    end;
  DecryptString(cReturn);
  Result := cReturn;
end;

function TRegSec.pRandom(nKey :integer):integer;
var
  cNumber :string;
begin
  cNumber := '010983089738792879871279873987377871987209778723029838098378798738790'
            +'897938748974938702389798374783729982555341129808309784098928798273623'
            +'556538298726368545762109238098367767864340980983789386267238578245624'
            +'379837926645039009238821796836872678364289758979836276347632097834689'
            +'379837926645039009238821796836872678364289758979836276347632097834689'
            +'897837798387487987487478798327498734908723908738787948723987489377483'
            +'897837798387487987487478798327498734908723908738787948723987489377483'
            +'556538298726368545762109238098367767864340980983789386267238578245624'
            +'980938098309840398409823490213840913889380980984093804983094803998984' 
            +'028978798379872398723982093840982349872398429380948023948093848839849' 
            +'763876483298732837638888398388881664307896389663767387628364637647664' 
            +'989178036753458732637092990927863475634512687865478554699754321861654' 
            +'224561325498783432433523658923824152354453234543544354562332214111422' 
            +'132432432423423252354236546543253565423544542098472423982398898098484' 
            +'892098467682374551978489730982897469287638981287987817720109928910922' 
            +'678629387897298787308929092983478947676876237846239903983789646576846'
            +'090920909394789781327879874664023080978308978748908098230980293488844' 
            +'980809198209809389846786178627609290927769823897917897220392890178722' 
            +'787818273782987192648634827838972100891764565712378628909837646648971'
            +'887263548763012937826789627543738974389993019087834769786161876646722' 
            +'097829809826647678678153984989743802102874879872088798737984897289761' 
            +'982927435651077897236356986186892810919178627784517627867818919104378' 
            +'909871276435876876109846256198734645410982612979187987656198761689761' 
            +'908908198097847690187128971728907177410289843992787871897278071290789' 
            +'982984565176514187549838970398703978029707373656618768551968928696167' 
            +'978208978489623916891269869127897869786197869186961289861298368691761' 
            +'927809784387436287563478639891738698123711020297986127687128763176722' 
            +'098091820398746454098012978964578127678681762876312980312890189829922' 
            +'093487984689764764398792387492387738309872309874239074802398394890989'; 
  nKey := ((nKey -1)*2) + 1;
  nKey := StrToInt(Copy(cNumber,nKey,2));
  Result := nKey;
end;

function TRegSec.pNCrypt(cString,s_no :string) :String;
var
  n :integer;
  cReturn,mString :String;
  mVal :integer;
  mTemp :String;
begin
  cReturn := '';
  mTemp := cString;
  s_No := s_No + CSoftwareTitle;
  SetKey(trim(s_No));
  EncryptString(mTemp);
  mString := mTemp;
  for n := 1 to length(mString) do              //max length is 10 was
    begin
      mVal := Ord(mString[n]);
      cReturn := cReturn + IntToHex(mval,2);
    end;
  result := cReturn;
end;

procedure TRegSec.hash_init;
  var i, j: integer;
  begin
    rotor := 1;           { Make sure we start key in a known place. }
    ratchet := 3;
    avalanche := 5;
    last_plain := 7;
    last_cipher := 11;

    j := 255;
    for i := 0 to 255 do  { Start with cards all in inverse order. }
      begin
        cards[i] := j;
        dec(j);
      end;
  end;

procedure TRegSec.HashInit;
begin
    UserKey := '';
    hash_init;
end;

procedure TRegSec.Reoriginate;
  { Sets up key for use by the stream cipher, based on user_key. }
  var keypos: integer;    { Index of current byte of user key. }
    toswap,               { Index for shuffling cards with. }
    swaptemp,             { For holding bytes while swapping. }
    rsum,                 { Function of key bytes processed to now. }
    i, j: byte;           { Indexes into key.cards. }

    function keyrand(const limit: integer): byte;
    var u, v, mask: word;
    begin
    if limit = 0 then
        keyrand := 0
    else
        begin
        v := 0;
        mask := 1;
        while mask < limit do
            mask := (mask shl 1) + 1;
        repeat
            rsum := (cards[rsum] + ord(UserKey[keypos])) and $FF;
            inc(keypos);
            if keypos > Length(UserKey) then
                begin
                keypos := 1;
                rsum := (rsum + Length(UserKey)) and $FF;
                end;
            u := mask and rsum;
            inc(v);
            if v > 11 then
                u := u mod limit;
        until u <= limit;
        keyrand := u;
        end;
    end;

  begin
    if length(UserKey) = 0 then
      hash_init
    else
      begin
        for i := 0 to 255 do  { Start with cards all in order. }
        cards[i] := i;
        keypos := 1;        { Start with first byte of user  }
        toswap := 0;
        rsum := 0;
        for i := 255 downto 1 do  { Swap elements.  Some may get swaped back }
          begin                   { and some may get swapped with self. }
            toswap := keyrand(i);
            swaptemp := cards[i];
            cards[i] := cards[toswap];
            cards[toswap] := swaptemp;
          end;
        rotor := cards[1];           { Make sure we start key in a known place. }
        ratchet := cards[3];
        avalanche := cards[5];
        last_plain := cards[7];
        last_cipher := cards[rsum];
        toswap := 0;
        swaptemp := 0;
        rsum := 0;
        keypos := 0;
      end
  end;

procedure TRegSec.SetKey(const user_key: string);
begin
    UserKey := user_key;
    Reoriginate;
end;


function TRegSec.encrypt(const b: byte): byte;
  var swaptemp: byte;
  begin
    ratchet := (ratchet + cards[rotor]) and $FF;
    If Rotor < 255 Then
      inc(rotor)
    else rotor := 1;
    swaptemp := cards[last_cipher];      { Round-robin swap. }
    cards[last_cipher] := cards[ratchet];
    cards[ratchet] := cards[last_plain];
    cards[last_plain] := cards[rotor];
    cards[rotor] := swaptemp;
    avalanche := (avalanche + cards[swaptemp]) and $FF;
    last_cipher := b xor
                 cards[(cards[ratchet] + cards[rotor]) and $FF] xor
                 cards[cards[(cards[last_plain] +
                              cards[last_cipher] +
                              cards[avalanche]) and $FF]];
    last_plain := b;
    encrypt := last_cipher;
  end;

function TRegSec.decrypt(const b: byte): byte;
  var swaptemp: byte;
  begin
    ratchet := ratchet + cards[rotor];
    If Rotor < 255 Then
      inc(rotor)
    else rotor := 1;
    swaptemp := cards[last_cipher];
    cards[last_cipher] := cards[ratchet];
    cards[ratchet] := cards[last_plain];
    cards[last_plain] := cards[rotor];
    cards[rotor] := swaptemp;
    avalanche := avalanche + cards[swaptemp];
    last_plain := b xor
                  cards[(cards[ratchet] + cards[rotor]) and $FF] xor
                  cards[cards[(cards[last_plain] +
                               cards[last_cipher] +
                               cards[avalanche]) and $FF]];
    last_cipher := b;
    decrypt := last_plain;
  end;

procedure TRegSec.EncryptString(var s: string);
var i: integer;
begin
    for i := 1 to length(s) do
        s[i] := chr(encrypt(ord(s[i])));
end;

procedure TRegSec.DecryptString(var s: string);
var i: integer;
begin
    for i := 1 to length(s) do
        s[i] := chr(decrypt(ord(s[i])));
end;

function TRegSec.hash_final: string;
  var i: integer;
  begin
    for i := 255 downto 0 do
      encrypt(i);
    result := '';
    for i := 1 to 20 do
      result := result + chr(encrypt(0));
  end;

procedure TRegSec.burn;
var i: integer;
  begin
    fillchar(cards, sizeof(cards), 0);
    for i := 1 to length(UserKey) do
        UserKey[i] := chr(0);
    UserKey := '';
    hash_init;
  end;


function TRegSec.RandomByte: byte;
begin
    result := encrypt(0);
end;

function TRegSec.RandomFloat: extended;
var i: integer;
begin
    result := 0.0;
    for i := 1 to 8 do
        result := (result + encrypt(0)) / 256.0;
end;

function TRegSec.RandomInteger: longint;
begin
    result := encrypt(0);
    result := (result shl 8) + encrypt(0);
    result := (result shl 8) + encrypt(0);
    result := (result shl 8) + encrypt(0);
end;

function TRegSec.RandomInt(const Range: Longint): Longint;
var r: extended;
begin
    result := trunc(Range * RandomFloat);
    if result >= Range then result := Range;
end;

function TRegSec.RandomString: string;
var i, j: integer;
begin
    result := '';
    for i := 1 to 65 do
        begin
        j := RandomInt(62)+48;
        if j > 57 then j := j + 7;
        if j > 90 then j := j + 6;
        result := result + chr(j);
        end;
end;

procedure TRegSec.PoolByte(const b: byte);
begin
    encrypt(b);
end;

procedure  TRegSec.PoolInt(const li: longint);
begin
    encrypt(byte(li and $FF));
    encrypt(byte((li shr 8) and $FF));
    encrypt(byte((li shr 16) and $FF));
    encrypt(byte((li shr 24) and $FF));
end;

procedure TRegSec.PoolFloat(r: extended);
var i: integer;
    b: byte;
begin
    if r < 0.0 then
        begin
        r := -r;
        encrypt(7);
        end;
    while r >= 256.0 do
        begin
        r := r / 256.0;
        encrypt(13);
        end;
    while r < 1.0 do
        begin
        r := r * 256.0;
        encrypt(17);
        end;
    for i := 1 to 8 do
        begin
        b := trunc(r);
        encrypt(b);
        r := (r - b) * 256.0;
        end;
end;

procedure TRegSec.PoolString(const s: string);
var i: integer;
begin
    for i := 1 to length(s) do
        encrypt(ord(s[i]));
end;



Function TRegSec.Unlock: Boolean;            //UnlockASystem
var
  cSerial :string;
  dString :String;
  iSerial :string;
  uType,cType,k     :string;
  y,z,key,dLeft,m,n :integer;
  DateReg :String;
  dReg :TDate;
  k1,k2,k5,k3,k4,mDate,mSerial,mUnlock :string;
  Year, Month, Day : Word;
  mTempStr,mVal,cString :string;
  mCust,mSysName,mDisk :String;
  Ciper, RegAddr   :String;
  mDReg, mExpires, mNoUsers, j  :integer;
  mNoNodes   :Array[1..10] of Integer;
  iniReg :TRegistry;
begin
  iniReg := TRegistry.Create;
  try
    try
      CDiskSerial := trim(GetSerNo());
//-----------Get Registery Address--------------------
      Ciper := '';
      For Y := 1 to length(CSoftwareTitle) Do
        Ciper := Ciper + inttoStr(ord(CSoftwareTitle[Y]));
      RegAddr := pNCrypt(CSoftwareTitle, Ciper);
//-----------Passed SerialNo--------------------------
      If length(CUnlockKey) = 0 Then   //Must be a trial Version
        begin
          Result := False;
          CSysMessage := 'Registration failed';
          exit;
        end;
//------------------------------------------------------------------------------
      mTempStr := pDCrypt(trim(CUnlockKey),CDiskSerial);
      If length(mTempStr) = 0 then
        begin
          Result := False;
          CSysMessage := 'Registration failed!! Invalid Serial Key!!';
          exit;
        end;
//-------------Retrieve Parameters-----
      mCust := copy(mTempStr,1,pos(',',mTempStr)-1);
      mTempStr := copy(mTempStr,pos(',',mTempStr)+1,1000);
      //---
      mDReg := StrtoIntDef(copy(mTempStr,1,pos(',',mTempStr)-1), 0);
      mTempStr := copy(mTempStr,pos(',',mTempStr)+1,1000);
      //---
      mNoUsers := StrtoIntDef(copy(mTempStr,1,pos(',',mTempStr)-1), 0);
      mTempStr := copy(mTempStr,pos(',',mTempStr)+1,1000);
      //---
      For J := 1 to 10 Do
        begin
          mNoNodes[J] := StrtoIntDef(copy(mTempStr,1,pos(',',mTempStr)-1), 0);
          mTempStr := copy(mTempStr,pos(',',mTempStr)+1,1000);
        end;
      //---
      mExpires := StrtoIntDef(copy(mTempStr,1,pos(',',mTempStr)-1), 0);
      mTempStr := copy(mTempStr,pos(',',mTempStr)+1,1000);
      //---
      mSysName := copy(mTempStr,1,pos(',',mTempStr)-1);
      mDisk := trim(copy(mTempStr,pos(',',mTempStr)+1,1000));
//-------------Investigate--------------
      If (trim(mDisk) = '')or
         (trim(mCust) = '')or
         (mDReg = 0)or
         (mNoUsers = 0)or
         (mExpires = 0)or
         (mSysName <> CSoftwareTitle) Then
        begin
          Result := False;
          CSysMessage := 'Registration failed!! Invalid Serial Key!!';
          exit;
        end;
      If mDisk <> GetSerNo() Then
        begin
          Result := False;
          CSysMessage := 'Registration failed!! Invalid Serial Key!!';
          exit;
        end;
      CDevices1 := mNoNodes[1];
      CDevices2 := mNoNodes[2];
      CDevices3 := mNoNodes[3];
      CDevices4 := mNoNodes[4];
      CDevices5 := mNoNodes[5];
      CDevices6 := mNoNodes[6];
      CDevices7 := mNoNodes[7];
      CDevices8 := mNoNodes[8];
      CDevices9 := mNoNodes[9];
      CDevices10 := mNoNodes[10];
      CUsers := mNoUsers;
      CExpiresOn := mExpires;
      CRegisteredTo := mCust;
//------------------------------------------------------------------------------
//Save Details
//------------------------------------------------------------------------------
      iniReg := TRegistry.Create;
      iniReg.RootKey:=HKEY_LOCAL_MACHINE;
      If not iniReg.OpenKey('\Software\Microsoft\'+RegAddr+'\SysInfo',True) Then
        begin
          Result := False;
          CSysMessage := '1:Registration failed!!';
          exit;
        end;
      iniReg.WriteString(pNCrypt('DateRegistered', Ciper), pNCrypt(InttoStr(mDReg), Ciper));
      iniReg.WriteString(pNCrypt('UnlockKey', Ciper), CUnlockKey);
      iniReg.WriteString(pNCrypt('DiskSerial', Ciper), pNCrypt(mDisk, Ciper));
      Result := True;
    except
      Result := False;
      CSysMessage := '3:Registration failed!!';
      exit;
    end;
  finally
    iniReg.Free;
  end;
end;

function TRegSec.GenSerial:Boolean;
Var
  TempStr    :String;
begin
  CSerialNo := '';
  CDiskSerial := GetSerNo();
  If CSoftwareTitle  = '' Then
    begin
      CSysMessage := 'Could not generate Serial!! Please enter SoftwareTitle first!!';
      Result := False;
      exit;
    end;
//---
  TempStr := CDiskSerial+',';
  TempStr := TempStr + InttoStr(CDevices1)+',';
  TempStr := TempStr + InttoStr(CDevices2)+',';
  TempStr := TempStr + InttoStr(CDevices3)+',';
  TempStr := TempStr + InttoStr(CDevices4)+',';
  TempStr := TempStr + InttoStr(CDevices5)+',';
  TempStr := TempStr + InttoStr(CDevices6)+',';
  TempStr := TempStr + InttoStr(CDevices7)+',';
  TempStr := TempStr + InttoStr(CDevices8)+',';
  TempStr := TempStr + InttoStr(CDevices9)+',';
  TempStr := TempStr + InttoStr(CDevices10)+',';
  TempStr := TempStr + InttoStr(CUsers)+',';
  TempStr := TempStr + InttoStr(Trunc(CExpiresOn));
//---
  CSerialNo := pNCrypt(TempStr, CSoftwareTitle+'ABC123');
  Result := True;
end;

function TRegSec.GetSerial:Boolean;
Var
  TempStr    :String;
begin
  If CSerialNo = '' Then
    begin
      CSysMessage := 'Could not get data from Serial!! Please enter Serial first!!';
      Result := False;
      exit;
    end;
  If CSoftwareTitle  = '' Then
    begin
      CSysMessage := 'Could not get data from Serial!! Please enter SoftwareTitle first!!';
      Result := False;
      exit;
    end;
//------
  TempStr := pDCrypt(CSerialNo, trim(CSoftwareTitle+'ABC123'));

  CDiskSerial := copy(TempStr, 1, pos(',', TempStr)-1);
  TempStr := copy(TempStr, pos(',', TempStr)+1, 1000);

  CDevices1 := StrtoIntDef(copy(TempStr, 1, pos(',', TempStr)-1), 0);
  TempStr := copy(TempStr, pos(',', TempStr)+1, 1000);
  CDevices2 := StrtoIntDef(copy(TempStr, 1, pos(',', TempStr)-1), 0);
  TempStr := copy(TempStr, pos(',', TempStr)+1, 1000);
  CDevices3 := StrtoIntDef(copy(TempStr, 1, pos(',', TempStr)-1), 0);
  TempStr := copy(TempStr, pos(',', TempStr)+1, 1000);
  CDevices4 := StrtoIntDef(copy(TempStr, 1, pos(',', TempStr)-1), 0);
  TempStr := copy(TempStr, pos(',', TempStr)+1, 1000);
  CDevices5 := StrtoIntDef(copy(TempStr, 1, pos(',', TempStr)-1), 0);
  TempStr := copy(TempStr, pos(',', TempStr)+1, 1000);
  CDevices6 := StrtoIntDef(copy(TempStr, 1, pos(',', TempStr)-1), 0);
  TempStr := copy(TempStr, pos(',', TempStr)+1, 1000);
  CDevices7 := StrtoIntDef(copy(TempStr, 1, pos(',', TempStr)-1), 0);
  TempStr := copy(TempStr, pos(',', TempStr)+1, 1000);
  CDevices8 := StrtoIntDef(copy(TempStr, 1, pos(',', TempStr)-1), 0);
  TempStr := copy(TempStr, pos(',', TempStr)+1, 1000);
  CDevices9 := StrtoIntDef(copy(TempStr, 1, pos(',', TempStr)-1), 0);
  TempStr := copy(TempStr, pos(',', TempStr)+1, 1000);
  CDevices10 := StrtoIntDef(copy(TempStr, 1, pos(',', TempStr)-1), 0);
  TempStr := copy(TempStr, pos(',', TempStr)+1, 1000);

  CUsers := StrtoIntDef(copy(TempStr, 1, pos(',', TempStr)-1), 0);
  TempStr := copy(TempStr, pos(',', TempStr)+1, 1000);

  CExpiresOn := StrtoIntDef(copy(TempStr, 1, 1000), 0);
  Result := True;
end;


function TRegSec.Lock: Boolean;
Var
  mTempStr    :String;
begin
  CUnlockKey := '';
  If CSerialNo = '' Then
    begin
      CSysMessage := 'Could not generate Locking information!! Please enter SerialNo first!!';
      Result := False;
      exit;
    end;
  If CRegisteredTo = '' Then
    begin
      CSysMessage := 'Could not generate Locking information!! Please enter RegistredTo first!!';
      Result := False;
      exit;
    end;
  If CSoftwareTitle = '' Then
    begin
      CSysMessage := 'Could not generate Locking information!! Please enter SoftwareTitle first!!';
      Result := False;
      exit;
    end;
  If Trunc(CExpiresOn) <= Trunc(Date) Then
    begin
     CSysMessage := 'Could not generate Locking information!! Invalid expiry date!!';
     Result := False;
     exit;
    end;
//------
  mTempStr := pDCrypt(CSerialNo, trim(CSoftwareTitle+'ABC123'));
  CDiskSerial := copy(mTempStr, 1, pos(',', mTempStr)-1);

  mTempStr := CRegisteredTo+','+
              InttoStr(Trunc(Now))+','+
              InttoStr(CUsers)+','+
              InttoStr(CDevices1)+','+
              InttoStr(CDevices2)+','+
              InttoStr(CDevices3)+','+
              InttoStr(CDevices4)+','+
              InttoStr(CDevices5)+','+
              InttoStr(CDevices6)+','+
              InttoStr(CDevices7)+','+
              InttoStr(CDevices8)+','+
              InttoStr(CDevices9)+','+
              InttoStr(CDevices10)+','+
              InttoStr(Trunc(CExpiresOn))+','+
              CSoftwareTitle+','+
              CDiskSerial;
//------
  mTempStr := pNCrypt(mTempStr, CDiskSerial);
  CUnlockKey := mTempStr;
  Result := True;
end;

function TRegSec.IsReg() :Boolean;
var
  dString             :String;
  iSerial             :string;
  DateReg,k             :string;
  y,z,key,dLeft   :integer;
  k1,k2,k5,k3,k4      :string;
  Year, Month, Day    :Word;
  mTempStr,mVal,mTest :string;
  SysSerial,DiskSer,mCust,mSysName,mDisk :String;
  UDisk,Unlock,mDateReg :String;
  dReg :TDate;
  RegAddr               :String;
  IsDEMO                :Boolean;
  Ciper                 :String;
  iniReg                :TRegistry;
  mDReg, mExpires, mNoUsers, j  :integer;
  mNoNodes   :Array[1..10] of Integer;
begin
  iniReg := TRegistry.Create;
  try
//-----------Get Registery Address--------------------
    Ciper := '';
    For Y := 1 to length(CSoftwareTitle) Do
      Ciper := Ciper + inttoStr(ord(CSoftwareTitle[Y]));
    RegAddr := pNCrypt(CSoftwareTitle, Ciper);
//-----------Open Address and get values--------------
   iniReg.RootKey:=HKEY_LOCAL_MACHINE;
   If not iniReg.KeyExists('\Software\Microsoft\'+RegAddr+'\SysInfo') Then
     begin
       Result := False;
       CSysMessage := 'Registration failed';
       exit;
     end
   else If iniReg.OpenKey('\Software\Microsoft\'+RegAddr+'\SysInfo',True) Then
     begin
       DateReg := pDCrypt(iniReg.ReadString(pNCrypt('DateRegistered', Ciper)), Ciper);
       CDiskSerial := pDCrypt(iniReg.ReadString(pNCrypt('DiskSerial', Ciper)), Ciper);
       CUnlockKey := iniReg.ReadString(pNCrypt('UnlockKey', Ciper));
     end;
//==========Now determine if registered================
//----------If All Blank then trial--------------------
   If ((DateReg = '')or
      (CUnlockKey = '')or
      (DiskSerial = ''))and
      (CTrial)Then
     begin
{       DateReg := pNCrypt(InttoStr(Trunc(Date)), Ciper);
       SysSerial := pNCrypt('DEMO01-000000001', Ciper);
       DiskSer := pNCrypt(GetSerNo('C:\'), Ciper);
//--------
       iniReg.WriteString(pNCrypt('DateRegistered', Ciper), DateReg);
       iniReg.WriteString(pNCrypt('DiskSerial', Ciper), DiskSer);
       iniReg.WriteString(pNCrypt('UnlockKey', Ciper), '2957T67G490F3A5');//dummy value}
       Result := False;
       exit;
     end
//----------else check values-------------------
   else
     begin
       //------------First check the disk serial
       If CDiskSerial <> GetSerNo() Then
         begin
           Result := False;
           exit;
         end;
       //------------RetrieveDate----
       try
         DReg := StrtoInt(DateReg);
       except
         Result := False;
         exit;
       end;
       If DReg > Now Then
         begin
           Result := False;
           exit;
         end;
       //------------Then check UnlockKey--------
       If length(CUnlockKey) = 0 Then   //Must be a trial Version
         begin
           Result := False;
           CSysMessage := 'Registration failed';
           exit;
         end;
//------------------------------------------------------------------------------
        mTempStr := pDCrypt(trim(CUnlockKey),CDiskSerial);
        If length(mTempStr) = 0 then
          begin
            Result := False;
            CSysMessage := 'Registration failed!! Invalid Serial Key!!';
            exit;
          end;
//-------------Retrieve Parameters-----
        mCust := copy(mTempStr,1,pos(',',mTempStr)-1);
        mTempStr := copy(mTempStr,pos(',',mTempStr)+1,1000);
        //---
        mDReg := StrtoIntDef(copy(mTempStr,1,pos(',',mTempStr)-1), 0);
        mTempStr := copy(mTempStr,pos(',',mTempStr)+1,1000);
        //---
        mNoUsers := StrtoIntDef(copy(mTempStr,1,pos(',',mTempStr)-1), 0);
        mTempStr := copy(mTempStr,pos(',',mTempStr)+1,1000);
        //---
        For J := 1 to 10 Do
          begin
            mNoNodes[J] := StrtoIntDef(copy(mTempStr,1,pos(',',mTempStr)-1), 0);
            mTempStr := copy(mTempStr,pos(',',mTempStr)+1,1000);
          end;
        //---
        mExpires := StrtoIntDef(copy(mTempStr,1,pos(',',mTempStr)-1), 0);
        mTempStr := copy(mTempStr,pos(',',mTempStr)+1,1000);
        //---
        mSysName := copy(mTempStr,1,pos(',',mTempStr)-1);
        mDisk := trim(copy(mTempStr,pos(',',mTempStr)+1,1000));
//-------------Investigate--------------
      If (trim(mDisk) = '')or
         (trim(mCust) = '')or
         (mDReg = 0)or
         (mNoUsers = 0)or
         (mExpires = 0)or
         (mSysName <> CSoftwareTitle) Then
        begin
          Result := False;
          CSysMessage := 'Registration failed!! Invalid Serial Key!!';
          exit;
        end;
      If mDisk <> GetSerNo() Then
        begin
          Result := False;
          CSysMessage := 'Registration failed!! Invalid Serial Key!!';
          exit;
        end;
      If Trunc(mExpires) <= Trunc(Now) Then
        begin
          Result := False;
          CSysMessage := 'Registration failed!! Software Expired!!';
          exit;
        end;
      CUsers := mNoUsers;
      CDevices1 := mNoNodes[1];
      CDevices2 := mNoNodes[2];
      CDevices3 := mNoNodes[3];
      CDevices4 := mNoNodes[4];
      CDevices5 := mNoNodes[5];
      CDevices6 := mNoNodes[6];
      CDevices7 := mNoNodes[7];
      CDevices8 := mNoNodes[8];
      CDevices9 := mNoNodes[9];
      CDevices10 := mNoNodes[10];
      CExpiresOn := mExpires;
      CRegisteredTo := mCust;
      Result := True;
    end;
  finally
    iniReg.Free;
  end;
end;

function TRegSec.UnReg() :Boolean;
var
  dString             :String;
  iSerial             :string;
  DateReg,k             :string;
  y,z,key,dLeft   :integer;
  k1,k2,k5,k3,k4      :string;
  Year, Month, Day    :Word;
  mTempStr,mVal,mTest :string;
  SysSerial,DiskSer,mCust,mSysName,mDisk :String;
  UDisk,Unlock,mDateReg :String;
  dReg :TDate;
  RegAddr               :String;
  IsDEMO                :Boolean;
  Ciper                 :String;
  iniReg                :TRegistry;
  mDReg, mExpires, mNoUsers  :integer;
  mNoNodes   :Array[1..10] of Integer;
begin
  iniReg := TRegistry.Create;
  try
//-----------Get Registery Address--------------------
    Ciper := '';
    For Y := 1 to length(CSoftwareTitle) Do
      Ciper := Ciper + inttoStr(ord(CSoftwareTitle[Y]));
    RegAddr := pNCrypt(CSoftwareTitle, Ciper);
//-----------Open Address and get values--------------
   iniReg.RootKey:=HKEY_LOCAL_MACHINE;
   If iniReg.KeyExists('\Software\Microsoft\'+RegAddr+'\SysInfo') Then
     iniReg.DeleteKey('\Software\Microsoft\'+RegAddr+'\SysInfo');
  finally
    iniReg.Free;
  end;
end;

end.

