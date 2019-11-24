unit framPutFilesintoContainer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Printers;

type
  Tfram_PutFilesintoContainer = class(TFrame)
    Label75: TLabel;
    Label76: TLabel;
    BitBtn11: TBitBtn;
    edt_Con: TEdit;
    edt_RecNo: TEdit;
    BitBtn12: TBitBtn;
    GroupBox12: TGroupBox;
    lb_RecInContBatch: TListBox;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn18: TBitBtn;
    GroupBox13: TGroupBox;
    lb_RecInContSucc: TListBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    GroupBox16: TGroupBox;
    lb_RecInContErr: TListBox;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    qry_ContainersMain: TADOQuery;
    qry_FilesMain: TADOQuery;
    PrintDialog: TPrintDialog;
    qry_SecureScan: TADOQuery;
    OpenDialog: TOpenDialog;
    btn_GetOldContainer: TBitBtn;
    procedure edt_ConEnter(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure btn_GetOldContainerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses MetrofilerDataModule, Main;

{$R *.dfm}

procedure Tfram_PutFilesintoContainer.BitBtn11Click(Sender: TObject);
begin
  try
//==================================Verify Record===============================
    qry_FilesMain.Close;
    qry_FilesMain.SQL.Clear;
    qry_FilesMain.SQL.Add('SELECT * FROM Files WHERE FileNumber = :FO AND Code = :CC');
    qry_FilesMain.Parameters.ParamByName('FO').Value := edt_RecNo.Text;
    qry_FilesMain.Parameters.ParamByName('CC').Value := CompsCode;
    qry_FilesMain.Open;
    If qry_FilesMain.IsEmpty Then
      begin
        ShowMessage('File not found!!');
        exit;
      end;
    If (qry_FilesMain.FieldByName('ISSUESTATUS').asString <> 'REC')and
       (qry_FilesMain.FieldByName('ISSUESTATUS').asString <> '') then
      begin
        MessageDlg('File status must be New or Received to be put into a Container!!',mtError,[mbOK],0);
        exit;
      end;
//==================================Verify Container============================
    qry_ContainersMain.Close;
    qry_ContainersMain.SQL.Clear;
    qry_ContainersMain.SQL.Add('SELECT * FROM Containers WHERE Container = :CO AND Code = :CC');
    qry_ContainersMain.Parameters.ParamByName('CO').Value := edt_Con.Text;
    qry_ContainersMain.Parameters.ParamByName('CC').Value := Compscode;
    qry_ContainersMain.Open;
    If qry_ContainersMain.IsEmpty Then
      begin
        ShowMessage('Container not found!!');
        exit;
      end;
    If (qry_ContainersMain.FieldByName('ISSUESTATUS').asString = 'MET')Then
      begin
        ShowMessage('Container is OFF-SITE!!');
        exit;
      end;
    If (qry_ContainersMain.FieldByName('ISSUESTATUS').asString = 'REQ')Then
      begin
        ShowMessage('Container has been requested!!');
        exit;
      end;
//======================Check for Destruction Dates=============================
    If qry_Filesmain.FieldByName('DESTRUCT').asDateTime > qry_ContainersMain.FieldByName('DESTRUCT').asDateTime Then
      begin
        qry_ContainersMain.Edit;
        qry_ContainersMain.FieldByName('DESTRUCT').Value := qry_Filesmain.FieldByName('DESTRUCT').Value;
        qry_ContainersMain.Post;
      end;
//==============================================================================
    qry_Filesmain.Edit;
    qry_Filesmain.FieldByName('ISSUESTATUS').asString := 'CON';
    qry_Filesmain.FieldByName('CONTAINERNO').asString := qry_ContainersMain.FieldbyName('CONTAINER').asString;
    qry_Filesmain.Post;
    If qry_ContainersMain.FieldbyName('ISSUESTATUS').asString = 'IN' Then
      If PrintDialog.Execute Then
        dm_Metrofiler.PrintRecordwithDrawelSlip(Printer.PrinterIndex,
                                  qry_ContainersMain.FieldbyName('CONTAINER').asString,
                                  qry_ContainersMain.FieldbyName('WAREHOUSE').asString,
                                  qry_ContainersMain.FieldbyName('LOCNO').asString,
                                  qry_FilesMain.FieldbyName('FILENUMBER').asString);
    MessageDlg('Transaction completed successfully',mtInformation,[mbOK],0);
    lb_RecInContSucc.Items.append('Record '+edt_RecNo.Text+' ->Successful-> '+edt_Con.Text);
  finally
    qry_ContainersMain.Close;
    qry_FilesMain.Close;
  end;
end;

procedure Tfram_PutFilesintoContainer.BitBtn12Click(Sender: TObject);
begin
  lb_RecInContBatch.Items.Add(edt_RecNo.Text + ' ===>' + edt_Con.Text);
  edt_RecNo.Text := '';
end;

procedure Tfram_PutFilesintoContainer.BitBtn13Click(Sender: TObject);
Var
  I            :Integer;
  Container    :String[20];
  RecordNo     :String[20];
  Flag         :Boolean;
  PrinterIndex :Integer;
begin
  Flag := False;
  PrinterIndex := -1;
  For I := 0 to lb_RecInContBatch.Items.Count-1 Do
    begin
      RecordNo := trim(copy(lb_RecInContBatch.Items.Strings[I],1,pos(' ===>',lb_RecInContBatch.Items.Strings[I])-1));
      Container := trim(copy(lb_RecInContBatch.Items.Strings[I],
                         pos(' ===>',lb_RecInContBatch.Items.Strings[I])+5,
                         length(lb_RecInContBatch.Items.Strings[I])));
//==============================================================================
      try
//==================================Verify Record===============================
        qry_FilesMain.Active := False;
        qry_FilesMain.SQL.Clear;
        qry_FilesMain.SQL.Add('SELECT * FROM Files WHERE FileNumber = :FO and Code = :CC');
        qry_FilesMain.Parameters.ParamByName('FO').Value := RecordNo;
        qry_FilesMain.Parameters.ParamByName('cc').Value := CompsCode;
        qry_FilesMain.Active := True;
        If qry_FilesMain.IsEmpty Then
          begin
            lb_RecInContErr.Items.append('File "'+RecordNo+'" not found!!');
            Continue;
          end;
        If (qry_FilesMain.FieldByName('ISSUESTATUS').asString <> 'REC')and
           (qry_FilesMain.FieldByName('ISSUESTATUS').asString <> '') then
          begin
            MessageDlg('File status must be New or Received to be put into to a Container!!',mtError,[mbOK],0);
            exit;
          end;
//==================================Verify Container============================
        qry_ContainersMain.Active := False;
        qry_ContainersMain.SQL.Clear;
        qry_ContainersMain.SQL.Add('SELECT * FROM Containers WHERE Container = :CO AND Code = :CC');
        qry_ContainersMain.Parameters.ParamByName('CO').Value := Container;
        qry_ContainersMain.Parameters.ParamByName('CC').Value := Compscode;
        qry_ContainersMain.Active := True;
        If qry_ContainersMain.IsEmpty Then
          begin
            lb_RecInContErr.Items.append('Container "'+Container+'" not found!!');
            Continue;
          end;
        If (qry_ContainersMain.FieldByName('ISSUESTATUS').asString = 'MET')Then
          begin
            lb_RecInContErr.Items.append('Container "'+Container+'" is OFF-SITE!!');
            Continue;
          end;
        If (qry_ContainersMain.FieldByName('ISSUESTATUS').asString = 'REQ')Then
          begin
            lb_RecInContErr.Items.append('Container "'+Container+'" has been reuested!!');
            Continue;
          end;
//======================Check for Destruction Dates=============================
        If qry_Filesmain.FieldByName('DESTRUCT').asDateTime > qry_ContainersMain.FieldByName('DESTRUCT').asDateTime Then
          begin
            qry_ContainersMain.Edit;
            qry_ContainersMain.FieldByName('DESTRUCT').Value := qry_Filesmain.FieldByName('DESTRUCT').Value;
            qry_ContainersMain.Post;
          end;
//==============================================================================
        qry_Filesmain.Edit;
        qry_Filesmain.FieldByName('ISSUESTATUS').asString := 'CON';
        qry_Filesmain.FieldByName('CONTAINERNO').asString := qry_ContainersMain.FieldbyName('CONTAINER').asString;
        qry_Filesmain.Post;

        If qry_ContainersMain.FieldbyName('ISSUESTATUS').asString = 'IN' Then
          begin
            If not Flag Then
              begin
                If PrintDialog.Execute Then
                  begin
                    PrinterIndex := Printer.PrinterIndex;
                    Flag := True;
                    dm_Metrofiler.PrintRecordwithDrawelSlip(PrinterIndex,
                                              qry_ContainersMain.FieldbyName('CONTAINER').asString,
                                              qry_ContainersMain.FieldbyName('WAREHOUSE').asString,
                                              qry_ContainersMain.FieldbyName('LOCNO').asString,
                                              qry_FilesMain.FieldbyName('FILENUMBER').asString);
                  end;
              end
            else
              begin
                dm_Metrofiler.PrintRecordwithDrawelSlip(PrinterIndex,
                                          qry_ContainersMain.FieldbyName('CONTAINER').asString,
                                          qry_ContainersMain.FieldbyName('WAREHOUSE').asString,
                                          qry_ContainersMain.FieldbyName('LOCNO').asString,
                                          qry_FilesMain.FieldbyName('FILENUMBER').asString);
              end;
          end;
        lb_RecInContSucc.Items.append('File "'+RecordNo+' successfully put into Container "'+Container+'"!!');
      finally
        qry_ContainersMain.Active := False;
        qry_FilesMain.Active := False;
      end;
    end;
end;

procedure Tfram_PutFilesintoContainer.BitBtn14Click(Sender: TObject);
begin
  if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    lb_RecInContBatch.Items.Clear;
end;

procedure Tfram_PutFilesintoContainer.BitBtn15Click(Sender: TObject);
Var
  PageNum :string;
  Ctr,x,PHeight,LineSpace :integer;
  ListTot,J               :integer;
begin
  x := 0;
  Ctr := 1;
  if PrintDialog.Execute then
    begin
      Printer.BeginDoc;
      PHeight := Printer.PageHeight;
      LineSpace :=PHeight DIV 60;
      PageNum := IntToStr(Printer.PageNumber);
      //----------
      Printer.Canvas.TextOut(0,x,'Records in Container put-away');
      x := x + LineSpace;
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'Date: ' + DateToStr(date) + ' Time: ' + DateToStr(Time));
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------------------------');
      x := x + LineSpace;
      x := x + LineSpace;
      ListTot := lb_RecInContBatch.Items.Count;
      For J := 0 to ListTot-1 Do
        begin
          Printer.Canvas.TextOut(0,x,lb_RecInContBatch.Items.Strings[J]);
          Ctr := Ctr + 1;    //No of lines printed
          x := x + LineSpace;
          if Ctr > 59 then
            begin
              Printer.NewPage;
              x:= 0;
              Ctr := 0;
              PageNum := IntToStr(Printer.PageNumber);
            end;
        end;
      Printer.EndDoc;
    end;           //PrintDialog.Executeend;
end;

procedure Tfram_PutFilesintoContainer.BitBtn18Click(Sender: TObject);
var
  Filename       :String;
  I              :Cardinal;
  mpos           :integer;
  mchars         :integer;
  mfile          :string;
  mloc           :string;
  mbarcode       :string;
  TempStr        :string;
  F              :TextFile;
begin
  qry_SecureScan.Active := False;
  qry_SecureScan.SQl.Clear;
  qry_SecureScan.Sql.Add('SELECT * FROM AuthCodes WHERE USERID = :ID');
  qry_SecureScan.Parameters.ParamByName('ID').Value := ftString;
  qry_SecureScan.Parameters.ParamByName('ID').Value := User;
  qry_SecureScan.Active := True;
  Filename := qry_SecureScan.FieldbyName('ScanEXE').AsString;
  qry_SecureScan.Active := False;
  dm_Metrofiler.ShellExecAndWait(FileName, '', SW_MAXIMIZE, I);
//-------------
  If OpenDialog.Execute Then
    begin
      mfile := OpenDialog.FileName;
      AssignFile(F,mfile);
      Reset(F);
      While Not Eof(F) do
        begin
          Readln(F,TempStr);
          mpos := Pos(',',TempStr);
          mchars := mpos - 1;                   //get position of '
          mloc := Copy(TempStr,1,mchars);
          MLOC := trim(mloc);
//-----------------
          mchars := (length(TempStr) - mpos);
          Inc(mpos,1);
          mbarcode := Copy(TempStr,mpos,mchars);
          lb_RecInContBatch.Items.Add(mbarcode + ' ===>' + mloc);
        end;
      CloseFile(F);
    end;
end;

procedure Tfram_PutFilesintoContainer.edt_ConEnter(Sender: TObject);
begin
  edt_Con.Text := '';
end;

procedure Tfram_PutFilesintoContainer.BitBtn5Click(Sender: TObject);
begin
  if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    lb_RecInContSucc.Items.Clear;
end;

procedure Tfram_PutFilesintoContainer.BitBtn6Click(Sender: TObject);
Var
  PageNum :string;
  Ctr,x,PHeight,LineSpace :integer;
  ListTot,J               :integer;
begin
  x := 0;
  Ctr := 1;
  if PrintDialog.Execute then
    begin
      Printer.BeginDoc;
      PHeight := Printer.PageHeight;
      LineSpace :=PHeight DIV 60;
      PageNum := IntToStr(Printer.PageNumber);
      //----------
      Printer.Canvas.TextOut(0,x,'Records in Container put-away');
      x := x + LineSpace;
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'Date: ' + DateToStr(date) + ' Time: ' + DateToStr(Time));
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------------------------');
      x := x + LineSpace;
      x := x + LineSpace;
      ListTot := lb_RecInContErr.Items.Count;
      For J := 0 to ListTot-1 Do
        begin
          Printer.Canvas.TextOut(0,x,lb_RecInContErr.Items.Strings[J]);
          Ctr := Ctr + 1;    //No of lines printed
          x := x + LineSpace;
          if Ctr > 59 then
            begin
              Printer.NewPage;
              x:= 0;
              Ctr := 0;
              PageNum := IntToStr(Printer.PageNumber);
            end;
        end;
      Printer.EndDoc;
    end;           //PrintDialog.Executeend;
end;

procedure Tfram_PutFilesintoContainer.BitBtn7Click(Sender: TObject);
begin
  if MessageDlg('Are you Sure',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    lb_RecInContErr.Items.Clear;
end;

procedure Tfram_PutFilesintoContainer.btn_GetOldContainerClick(Sender: TObject);
begin
  try
    edt_Con.Text := '';
    qry_FilesMain.Close;
    qry_FilesMain.SQL.Clear;
    qry_FilesMain.SQL.Add('SELECT ISSUESTATUS, CONTAINERNO FROM Files WHERE FileNumber = :FN');
    qry_FilesMain.Parameters.ParamByName('FN').Value := edt_RecNo.Text;
    qry_FilesMain.Open;
    If qry_FilesMain.IsEmpty Then
      begin
        Messagedlg('Record not found !!',mtError,[mbOK],0);
        exit;
      end;
    If length(qry_FilesMain.FieldByName('CONTAINERNO').asString) = 0 Then
      begin
        Messagedlg('File shows no history of being in a Container!!',mtInformation,[mbOK],0);
        exit;
      end;
    qry_ContainersMain.close;
    qry_ContainersMain.SQL.Clear;
    qry_ContainersMain.SQL.Add('SELECT ISSUESTATUS FROM Containers WHERE Container = :CN');
    qry_ContainersMain.Parameters.ParamByName('CN').Value := qry_FilesMain.FieldByName('CONTAINERNO').asString;
    qry_ContainersMain.Open;
    If qry_ContainersMain.IsEmpty Then
      begin
        Messagedlg('Container not found!!',mtError,[mbOK],0);
        exit;
      end;
    If qry_ContainersMain.FieldByName('ISSUESTATUS').asString = 'MET' Then
      begin
        Messagedlg('The previous Container is OFF-SITE!!',mtInformation,[mbOK],0);
        exit;
      end;
    If qry_ContainersMain.FieldByName('ISSUESTATUS').asString = 'REQ' Then
      begin
        Messagedlg('The previous Container has been requested!!',mtInformation,[mbOK],0);
        exit;
      end;
    edt_Con.Text := qry_FilesMain.FieldbyName('CONTAINERNO').asString;
  finally
    qry_FilesMain.Close;
    qry_ContainersMain.close;
  end;
end;

procedure Tfram_PutFilesintoContainer.BitBtn4Click(Sender: TObject);
Var
  PageNum :string;
  Ctr,x,PHeight,LineSpace :integer;
  ListTot,J               :integer;
begin
  x := 0;
  Ctr := 1;
  if PrintDialog.Execute then
    begin
      Printer.BeginDoc;
      PHeight := Printer.PageHeight;
      LineSpace :=PHeight DIV 60;
      PageNum := IntToStr(Printer.PageNumber);
      //----------
      Printer.Canvas.TextOut(0,x,'Records in Container put-away');
      x := x + LineSpace;
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'Date: ' + DateToStr(date) + ' Time: ' + DateToStr(Time));
      x := x + LineSpace;
      Printer.Canvas.TextOut(0,x,'---------------------------------------------------------------------------------------------------------------------------------------------------------------');
      x := x + LineSpace;
      x := x + LineSpace;
      ListTot := lb_RecInContSucc.Items.Count;
      For J := 0 to ListTot-1 Do
        begin
          Printer.Canvas.TextOut(0,x,lb_RecInContSucc.Items.Strings[J]);
          Ctr := Ctr + 1;    //No of lines printed
          x := x + LineSpace;
          if Ctr > 59 then
            begin
              Printer.NewPage;
              x:= 0;
              Ctr := 0;
              PageNum := IntToStr(Printer.PageNumber);
            end;
        end;
      Printer.EndDoc;
    end;           //PrintDialog.Executeend;
end;

end.
