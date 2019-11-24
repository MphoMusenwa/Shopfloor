//============================================================\\
//===Platform: Windows
//===Development Tool:  Delphi 7 Professional
//===Database Connectivity:  ADO
//============================================================\\
unit repListContRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, QuickRpt, StdCtrls, ExtCtrls, Buttons, Qrctrls, ComCtrls,
  ADODB;

type
  Trep_ListContRecords = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    qry_Files: TADOQuery;
    qry_Get_Br_Dpt_FT: TADOQuery;
    qry_Containers: TADOQuery;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    cb_TypeofReport: TComboBox;
    Label11: TLabel;
    grp_Dates: TGroupBox;
    date_From: TDateTimePicker;
    Label12: TLabel;
    date_To: TDateTimePicker;
    chk_Dates: TLabel;
    lbl_Branch: TLabel;
    edt_Branch: TEdit;
    btn_SelBranch: TButton;
    lbl_Dept: TLabel;
    edt_Dept: TEdit;
    btn_SelDept: TButton;
    SpeedButton1: TSpeedButton;
    btn_Preview: TSpeedButton;
    procedure btn_PreviewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb_TypeofReportChange(Sender: TObject);
    procedure edt_BranchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_SelBranchClick(Sender: TObject);
    procedure edt_DeptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rep_ListContRecords: Trep_ListContRecords;

implementation

uses main, repCapturedContAmt, repCapturedContList, repCapturedRecAmt,
  repCapturedRecList, repOffSiteContAmt, repOffSiteContList,
  repOffSiteRecList, repOffSiteRecAmt, repDesContAmt, repDesContList,
  repDesRecAmt, repDesRecList, repRecContinSys, SelBranch, repRetContAmt,
  repRetContList, repRetRecAmt, repRetRecList, SelDept, DataVer, About,MetrofilerDataModule;

{$R *.DFM}

procedure Trep_ListContRecords.btn_PreviewClick(Sender: TObject);
begin
  Case cb_TypeofReport.ItemIndex of
    1 :begin
         Application.CreateForm(Trep_CapturedRecAmt, rep_CapturedRecAmt);
         With rep_CapturedRecAmt.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');

             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_CapturedRecAmt.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_CapturedRecAmt.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             rep_CapturedRecAmt.Tot := 0;
             Open;
           end;
         rep_CapturedRecAmt.report.Preview;
         rep_CapturedRecAmt.qry_Get_Br_Dpt_FT.Close;
         rep_CapturedRecAmt.qry_Records.Close;
         rep_CapturedRecAmt.Free;
       end;
    2 :begin
         Application.CreateForm(Trep_CapturedRecList, rep_CapturedRecList);
         With rep_CapturedRecList.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');

             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_CapturedRecList.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_CapturedRecList.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             Open;
           end;
         rep_CapturedRecList.report.Preview;
         rep_CapturedRecList.qry_Get_Br_Dpt_FT.Close;
         rep_CapturedRecList.qry_GetTot.Close;
         rep_CapturedRecList.qry_Records.Close;
         rep_CapturedRecList.Free;
       end;
    3 :begin
         Application.CreateForm(Trep_CapturedContAmt, rep_CapturedContAmt);
         With rep_CapturedContAmt.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');
             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_CapturedContAmt.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_CapturedContAmt.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             rep_CapturedContAmt.Tot := 0;
             Open;
           end;
         rep_CapturedContAmt.report.Preview;
         rep_CapturedContAmt.qry_Get_Br_Dpt_FT.Close;
         rep_CapturedContAmt.qry_Containers.Close;
         rep_CapturedContAmt.Free;
       end;
    4 :begin
         Application.CreateForm(Trep_CapturedContList, rep_CapturedContList);
         With rep_CapturedContList.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');
             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_CapturedContList.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_CapturedContList.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             Open;
           end;
         rep_CapturedContList.report.Preview;
         rep_CapturedContList.qry_Get_Br_Dpt_FT.Close;
         rep_CapturedContList.qry_GetTot.Close;
         rep_CapturedContList.qry_Containers.Close;
         rep_CapturedContList.Free;
       end;
    5 :begin
         Application.CreateForm(Trep_OffSiteContAmt, rep_OffSiteContAmt);
         With rep_OffSiteContAmt.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');

             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_OffSiteContAmt.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_OffSiteContAmt.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             rep_OffSiteContAmt.Tot := 0;
             Open;
           end;
         rep_OffSiteContAmt.report.Preview;
         rep_OffSiteContAmt.qry_Get_Br_Dpt_FT.Close;
         rep_OffSiteContAmt.qry_Containers.Close;
         rep_OffSiteContAmt.Free;
       end;
    6 :begin
         Application.CreateForm(Trep_OffSiteContList, rep_OffSiteContList);
         With rep_OffSiteContList.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');

             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_OffSiteContList.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_OffSiteContList.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             Open;
           end;
         rep_OffSiteContList.report.Preview;
         rep_OffSiteContList.qry_Get_Br_Dpt_FT.Close;
         rep_OffSiteContList.qry_Containers.Close;
         rep_OffSiteContList.qry_GetTot.Close;
         rep_OffSiteContList.Free;
       end;
    7 :begin
         Application.CreateForm(Trep_OffSiteRecAmt, rep_OffSiteRecAmt);
         With rep_OffSiteRecAmt.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');

             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_OffSiteRecAmt.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_OffSiteRecAmt.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             rep_OffSiteRecAmt.Tot := 0;
             Open;
           end;
         rep_OffSiteRecAmt.report.Preview;
         rep_OffSiteRecAmt.qry_Get_Br_Dpt_FT.Close;
         rep_OffSiteRecAmt.qry_Records.Close;
         rep_OffSiteRecAmt.Free;
       end;
    8 :begin
         Application.CreateForm(Trep_OffSiteRecList, rep_OffSiteRecList);
         With rep_OffSiteRecList.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');

             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_OffSiteRecList.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_OffSiteRecList.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             Open;
           end;
         rep_OffSiteRecList.report.Preview;
         rep_OffSiteRecList.qry_Get_Br_Dpt_FT.Close;
         rep_OffSiteRecList.qry_Records.Close;
         rep_OffSiteRecList.qry_GetTot.Close;
         rep_OffSiteRecList.Free;
       end;
    9 :begin
         Application.CreateForm(Trep_DesContAmt, rep_DesContAmt);
         With rep_DesContAmt.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');

             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_DesContAmt.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_DesContAmt.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             rep_DesContAmt.Tot := 0;
             Open;
           end;
         rep_DesContAmt.report.Preview;
         rep_DesContAmt.qry_Get_Br_Dpt_FT.Close;
         rep_DesContAmt.qry_Containers.Close;
         rep_DesContAmt.Free;
       end;
   10 :begin
         Application.CreateForm(Trep_DesContList, rep_DesContList);
         With rep_DesContList.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');

             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_DesContList.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_DesContList.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             Open;
           end;
         rep_DesContList.report.Preview;
         rep_DesContList.qry_Get_Br_Dpt_FT.Close;
         rep_DesContList.qry_Containers.Close;
         rep_DesContList.qry_GetTot.Close;
         rep_DesContList.Free;
       end;
   11 :begin
         Application.CreateForm(Trep_DesRecAmt, rep_DesRecAmt);
         With rep_DesRecAmt.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');

             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_DesRecAmt.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_DesRecAmt.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             rep_DesRecAmt.Tot := 0;
             Open;
           end;
         rep_DesRecAmt.report.Preview;
         rep_DesRecAmt.qry_Get_Br_Dpt_FT.Close;
         rep_DesRecAmt.qry_Records.Close;
         rep_DesRecAmt.Free;
       end;
   12 :begin
         Application.CreateForm(Trep_DesRecList, rep_DesRecList);
         With rep_DesRecList.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');

             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_DesRecList.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_DesRecList.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             Open;
           end;
         rep_DesRecList.report.Preview;
         rep_DesRecList.qry_Get_Br_Dpt_FT.Close;
         rep_DesRecList.qry_Records.Close;
         rep_DesRecList.qry_GetTot.Close;
         rep_DesRecList.Free;
       end;
   13 :begin
         Application.CreateForm(Trep_RecContinSys, rep_RecContinSys);
         With rep_RecContinSys.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT');
             SQL.Add('   a.Branch BrCode,');
             SQL.Add('   a.Name BrName,');
             SQL.Add('   c.Department DptCode,');
             SQL.Add('   c.Name DptName,');
             SQL.Add('   f.Description FileType');
             SQL.Add('FROM');
             SQL.Add('   Branches a');
             SQL.Add('   INNER JOIN BAuthRts b ON a.Branch = b.Branch AND a.Code = b.Code');
             SQL.Add('   INNER JOIN Departments c ON a.Branch = c.Branch AND a.Code = c.Code');
             SQL.Add('   INNER JOIN DAuthRts d ON a.Branch = d.Branch AND a.Code = d.Code AND c.Department = d.Department');
             SQL.Add('   INNER JOIN IndexAuthRts g ON a.Branch = g.Branch AND a.Code = g.Code AND c.Department = g.Department');
             SQL.Add('   INNER JOIN IndexDefinitions f ON f.Description = g.Description');
             SQL.Add('WHERE');
             SQL.Add('   ISNULL(a.Status, 0) <> -1 AND');
             SQL.Add('   ISNULL(c.Status, 0) <> -1 AND');
             SQL.Add('   b.UserId = :ID1 AND');
             SQL.Add('   d.UserId = :ID2');
             If length(edt_Branch.Text) > 0 Then
               begin
                 SQL.Add('AND(a.Branch = :BR)');
                 Parameters.ParamByName('BR').Value := edt_Branch.Text;
               end;
             If length(edt_Dept.Text) > 0 Then
               begin
                 SQL.Add('AND(c.Department = :DPT)');
                 Parameters.ParamByName('DPT').Value := edt_Dept.Text;
               end;
             Parameters.ParamByName('ID1').Value := User;
             Parameters.ParamByName('ID2').Value := User;
             rep_RecContinSys.CTot := 0;
             rep_RecContinSys.RTot := 0;
             Open;
             rep_RecContinSys.report.Preview;
             rep_RecContinSys.qry_Get_Br_Dpt_FT.Close;
             rep_RecContinSys.qry_Tot.Close;
             rep_RecContinSys.Free;   
           end;
       end;
   14 :begin
         Application.CreateForm(Trep_RetContAmt, rep_RetContAmt);
         With rep_RetContAmt.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');

             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_RetContAmt.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_RetContAmt.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             rep_RetContAmt.Tot := 0;
             Open;
           end;
         rep_RetContAmt.report.Preview;
         rep_RetContAmt.qry_Get_Br_Dpt_FT.Close;
         rep_RetContAmt.qry_Containers.Close;
         rep_RetContAmt.Free;
       end;
   15 :begin
         Application.CreateForm(Trep_RetContList, rep_RetContList);
         With rep_RetContList.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');

             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_RetContList.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_RetContList.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             Open;
           end;
         rep_RetContList.report.Preview;
         rep_RetContList.qry_Get_Br_Dpt_FT.Close;
         rep_RetContList.qry_Containers.Close;
         rep_RetContList.qry_GetTot.Close;
         rep_RetContList.Free;
       end;
   16 :begin
         Application.CreateForm(Trep_RetRecAmt, rep_RetRecAmt);
         With rep_RetRecAmt.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');

             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_RetRecAmt.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_RetRecAmt.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             rep_RetRecAmt.Tot := 0;
             Open;
           end;
         rep_RetRecAmt.report.Preview;
         rep_RetRecAmt.qry_Get_Br_Dpt_FT.Close;
         rep_RetRecAmt.qry_Records.Close;
         rep_RetRecAmt.Free;
       end;
   17 :begin
         Application.CreateForm(Trep_RetRecList, rep_RetRecList);
         With rep_RetRecList.qry_Get_Br_Dpt_FT Do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT a.Branch BrCode, a.Name BrName, c.Department DptCode, c.Name DptName FROM BRANCHES a, BAuthRts b, Departments c, DAuthRts d WHERE');
//=============Branch================================================
             SQL.Add('(a.Branch = b.Branch)');
             SQL.Add('AND(b.UserID = :ID)');
             SQL.Add('AND((a.Status <> 1)or(a.Status is null))');
             If length(edt_Branch.Text) > 0 Then
               SQL.Add('AND(a.Branch = :BR)');
//=============Department============================================
             SQL.Add('AND(c.Branch = a.Branch)');
             SQL.Add('AND(a.Branch = d.Branch)');
             SQL.Add('AND(c.Department = d.Department)');
             SQL.Add('AND(d.Userid = :ID)');
             SQL.Add('AND((c.Status <> 1)or(c.Status is null))');
             If length(edt_Dept.Text) > 0 Then
               SQL.Add('AND(c.Department = :DPT)');

             If length(edt_Branch.Text) > 0 Then
               Parameters.ParamByName('BR').Value := edt_Branch.Text;
             If length(edt_Dept.Text) > 0 Then
               Parameters.ParamByName('DPT').Value := edt_Dept.Text;
             Parameters.ParamByName('ID').Value := User;
             rep_RetRecList.FromD := Trunc(Date_From.date) + EncodeTime(0,0,0,0);
             rep_RetRecList.ToD := Trunc(Date_To.date) + EncodeTime(23,59,59,59);
             Open;
           end;
         rep_RetRecList.report.Preview;
         rep_RetRecList.qry_Get_Br_Dpt_FT.Close;
         rep_RetRecList.qry_Records.Close;
         rep_RetRecList.qry_GetTot.Close;
         rep_RetRecList.Free;
       end;
  end;
end;

procedure Trep_ListContRecords.FormShow(Sender: TObject);
begin
  top := 2;
  left := 10;
  height := 365;
  width := 690;
end;

procedure Trep_ListContRecords.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure Trep_ListContRecords.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_Files.Close;
  qry_Containers.Close;
  qry_Get_Br_Dpt_FT.Close;
  Action := CaFree;
end;

procedure Trep_ListContRecords.cb_TypeofReportChange(Sender: TObject);
begin
  Case cb_TypeofReport.ItemIndex of
    0 :begin
         grp_Dates.Visible := False;
       end;
    1 :begin
         chk_Dates.Caption := 'Captured from';
         grp_Dates.Visible := True;
       end;
    2 :begin
         chk_Dates.Caption := 'Captured from';
         grp_Dates.Visible := True;
       end;
    3 :begin
         chk_Dates.Caption := 'Captured from';
         grp_Dates.Visible := True;
       end;
    4 :begin
         chk_Dates.Caption := 'Captured from';
         grp_Dates.Visible := True;
       end;
    5 :begin
         chk_Dates.Caption := 'Moved off-site from';
         grp_Dates.Visible := True;
       end;
    6 :begin
         chk_Dates.Caption := 'Moved off-site from';
         grp_Dates.Visible := True;
       end;
    7 :begin
         chk_Dates.Caption := 'Moved off-site from';
         grp_Dates.Visible := True;
       end;
    8 :begin
         chk_Dates.Caption := 'Moved off-site from';
         grp_Dates.Visible := True;
       end;
    9 :begin
         chk_Dates.Caption := 'Destroyed from';
         grp_Dates.Visible := True;
       end;
   10 :begin
         chk_Dates.Caption := 'Destroyed from';
         grp_Dates.Visible := True;
       end;
   11 :begin
         chk_Dates.Caption := 'Destroyed from';
         grp_Dates.Visible := True;
       end;
   12 :begin
         chk_Dates.Caption := 'Destroyed from';
         grp_Dates.Visible := True;
       end;
   13 :begin
         grp_Dates.Visible := False;
       end;
   14 :begin
         chk_Dates.Caption := 'Retrieved from';
         grp_Dates.Visible := True;
       end;
   15 :begin
         chk_Dates.Caption := 'Retrieved from';
         grp_Dates.Visible := True;
       end;
   16 :begin
         chk_Dates.Caption := 'Retrieved from';
         grp_Dates.Visible := True;
       end;
   17 :begin
         chk_Dates.Caption := 'Retrieved from';
         grp_Dates.Visible := True;
       end;
  end;
end;

procedure Trep_ListContRecords.edt_BranchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If key = 8 Then
    begin
      edt_Branch.Text := '';
      lbl_Branch.Caption := '';
      edt_Dept.Text := '';
      lbl_Dept.Caption := '';
    end;
  Abort;
end;

procedure Trep_ListContRecords.btn_SelBranchClick(Sender: TObject);
begin
  If frm_SelBranch.Execute(User) = mrOK Then
    begin
      edt_Branch.Text := frm_SelBranch.qry_Branch.FieldbyName('Branch').asString;
      lbl_Branch.Caption := frm_SelBranch.qry_Branch.FieldbyName('Name').asString;
      edt_Dept.Text := '';
      lbl_Dept.Caption := '---';
    end;
  frm_SelBranch.qry_Branch.Close;
end;

procedure Trep_ListContRecords.edt_DeptKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If key = 8 Then
    begin
      edt_Dept.Text := '';
      lbl_Dept.Caption := '';
    end;
  Abort;
end;

procedure Trep_ListContRecords.FormCreate(Sender: TObject);
begin
  Date_From.Date := nOW;
  Date_To.Date := nOW;
end;

procedure Trep_ListContRecords.btn_SelDeptClick(Sender: TObject);
begin
  If length(edt_Branch.Text) = 0 Then
    begin
      Messagedlg('Please select a branch first!!', mtInformation ,[mbOK], 0);
      exit;
    end;
  If frm_SelDept.Execute(edt_Branch.Text, User) = mrOK Then
    begin
      edt_Dept.Text := frm_SelDept.qry_Dept.FieldbyName('Department').asString;
      lbl_Dept.Caption := frm_SelDept.qry_Dept.FieldbyName('Name').asString;
    end;
  frm_SelDept.qry_Dept.Close;
end;

end.
