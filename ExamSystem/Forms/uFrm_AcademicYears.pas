unit uFrm_AcademicYears;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrm_AcademicYears = class(TForm)
    pnlTop: TPanel;
    lblTitle: TLabel;
    pnlBottom: TPanel;
    btnNew: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    pnlCenter: TPanel;
    DBGrid: TDBGrid;
    dsAcademicYears: TDataSource;
    FDQuery: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    procedure LoadData;
  public
  end;

var
  Frm_AcademicYears: TFrm_AcademicYears;

implementation

{$R *.dfm}

uses
  uDM_Main, uFunctions;

procedure TFrm_AcademicYears.FormCreate(Sender: TObject);
begin
  FDQuery.Connection := DM_Main.FDConnection;
  FDQuery.SQL.Text := 'SELECT * FROM ACADEMIC_YEARS ORDER BY YEAR_START DESC';
  dsAcademicYears.DataSet := FDQuery;
  DBGrid.DataSource := dsAcademicYears;
end;

procedure TFrm_AcademicYears.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFrm_AcademicYears.LoadData;
begin
  Screen.Cursor := crHourGlass;
  try
    FDQuery.Close;
    FDQuery.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrm_AcademicYears.btnNewClick(Sender: TObject);
begin
  FDQuery.Append;
  FDQuery.FieldByName('ID').AsInteger := DM_Main.GetNextID('SEQ_ACADEMIC_YEARS');
  FDQuery.FieldByName('IS_ACTIVE').AsInteger := 1;
  FDQuery.FieldByName('IS_ARCHIVED').AsInteger := 0;
end;

procedure TFrm_AcademicYears.btnEditClick(Sender: TObject);
begin
  if not FDQuery.IsEmpty then FDQuery.Edit;
end;

procedure TFrm_AcademicYears.btnDeleteClick(Sender: TObject);
begin
  if FDQuery.IsEmpty then Exit;
  if ConfirmAction('هل أنت متأكد من الحذف؟') then FDQuery.Delete;
end;

procedure TFrm_AcademicYears.btnSaveClick(Sender: TObject);
begin
  if Trim(FDQuery.FieldByName('YEAR_LABEL').AsString) = '' then
  begin
    ShowWarning('يرجى إدخال اسم السنة!');
    Exit;
  end;
  FDQuery.FieldByName('CREATED_AT').AsDateTime := Now;
  FDQuery.Post;
  ShowInfo('تم الحفظ بنجاح!');
  LoadData;
end;

procedure TFrm_AcademicYears.btnCancelClick(Sender: TObject);
begin
  FDQuery.Cancel;
  LoadData;
end;

procedure TFrm_AcademicYears.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
