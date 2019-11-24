unit BranchesDepartments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, ADODB, DBCtrls, Buttons, StdCtrls,
  Mask, ComCtrls;

type
  Tfrm_BranchesDepartments = class(TForm)
    pnl_Top: TPanel;
    btn_Close: TSpeedButton;
    nav: TDBNavigator;
    dts_Branches: TDataSource;
    qry_BranchMain: TADOQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    grd_Branches: TDBGrid;
    Splitter3: TSplitter;
    ScrollBox1: TScrollBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    editBranchCode: TDBEdit;
    editBranchName: TDBEdit;
    editBranchDelAddr: TDBMemo;
    editBranchCont: TDBEdit;
    editBranchTel: TDBEdit;
    editBranchFax: TDBEdit;
    editBranchStatus: TDBCheckBox;
    DBEdit3: TDBEdit;
    TabSheet2: TTabSheet;
    qry_DeptMain: TADOQuery;
    dts_Department: TDataSource;
    grd_Dept: TDBGrid;
    Splitter4: TSplitter;
    ScrollBox2: TScrollBox;
    lbl_DeptsDepartment: TLabel;
    lbl_DeptsDeliverAddr: TLabel;
    lbl_DeptsTel: TLabel;
    lbl_DeptsFax: TLabel;
    lbl_DeptsContact: TLabel;
    lbl_DeptsName: TLabel;
    Label3: TLabel;
    edt_DeptsDepartment: TDBEdit;
    edt_DeptsTelephone: TDBEdit;
    edt_DeptsFax: TDBEdit;
    mem_DeptsContact: TDBMemo;
    mem_DeptsDeliveryAddress: TDBMemo;
    edt_DeptsName: TDBEdit;
    chk_DeptsStatus: TDBCheckBox;
    DBEdit4: TDBEdit;
    procedure PageControl1Change(Sender: TObject);
    procedure navClick(Sender: TObject; Button: TNavigateBtn);
    procedure qry_BranchMainAfterInsert(DataSet: TDataSet);
    procedure qry_DeptMainAfterInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_BranchesDepartments: Tfrm_BranchesDepartments;

implementation

USES Main, MetrofilerDataModule;

{$R *.dfm}

procedure Tfrm_BranchesDepartments.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_BranchesDepartments.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm_Metrofiler.ClearCache;
  qry_BranchMain.Close;
  qry_DeptMain.Close;
  frm_Console.act_BranchesDepartments.Enabled := true;
  Action := caFree;
end;

procedure Tfrm_BranchesDepartments.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  PageControl1Change(Self);
end;

procedure Tfrm_BranchesDepartments.navClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  if (Button = nbPost) and (PageControl1.ActivePage = Tabsheet1) then
    begin
      PageControl1.ActivePage := Tabsheet2;
      PageControl1Change(Self);
    end;
end;

procedure Tfrm_BranchesDepartments.PageControl1Change(Sender: TObject);
begin
  If PageControl1.ActivePage = Tabsheet1 Then
    begin  //Branches
      qry_BranchMain.Close;
      qry_BranchMain.SQL.Clear;
      qry_BranchMain.SQL.Add('SELECT * FROM branches WHERE Code = :Code');
      qry_BranchMain.SQL.Add('ORDER BY Branch');
      qry_BranchMain.Parameters.ParamValues['Code'] := CompsCode;
      qry_BranchMain.Open;
      nav.DataSource := dts_Branches;
      nav.Enabled := True;
      frm_Console.AutoSizeExistingColumns(grd_Branches);
    end;
  If PageControl1.ActivePage = Tabsheet2 Then
    begin //Departments
      if qry_BranchMain.IsEmpty then
        begin
          MessageDlg('Please select the branch first', mtInformation, [mbOK], 0);
          PageControl1.ActivePage := Tabsheet1;
          PageControl1Change(Self);
          exit;
        end;
      qry_DeptMain.Close;
      qry_DeptMain.SQL.Clear;
      qry_DeptMain.SQL.Add('SELECT * FROM departments');
      qry_DeptMain.SQL.Add('WHERE Branch = :Branch');
      qry_DeptMain.SQL.Add('AND Code = :Code');
      qry_DeptMain.SQL.Add('order by Department');
      qry_DeptMain.Parameters.ParamValues['Code'] := CompsCode;
      qry_DeptMain.Parameters.ParamValues['Branch'] := qry_BranchMain.FieldByName('BRANCH').asString;
      qry_DeptMain.Open;
      nav.DataSource := dts_Department;
      nav.Enabled := True;
      frm_Console.AutoSizeExistingColumns(grd_Dept);
    end;
end;

procedure Tfrm_BranchesDepartments.qry_BranchMainAfterInsert(DataSet: TDataSet);
begin
  Dataset['Status'] := 0;
  Dataset['Code'] := CompsCode;
  Pagecontrol1.ActivePageIndex := 0;
  editBranchCode.SetFocus;
end;

procedure Tfrm_BranchesDepartments.qry_DeptMainAfterInsert(DataSet: TDataSet);
begin
  Dataset['Code'] := CompsCode;
  Dataset['Branch'] := qry_BranchMain.FieldbyName('BRANCH').asString;
  Dataset['Status'] := 0;
  
  Pagecontrol1.ActivePageIndex := 1;
  edt_DeptsDepartment.SetFocus;
end;

end.
