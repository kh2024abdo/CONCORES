unit uFrm_Correctors;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrm_Correctors = class(TForm)
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
    ds: TDataSource;
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
  Frm_Correctors: TFrm_Correctors;

implementation

{$R *.dfm}

uses
  uDM_Main, uFunctions;

procedure TFrm_Correctors.FormCreate(Sender: TObject);
begin
  FDQuery.Connection := DM_Main.FDConnection;
  FDQuery.SQL.Text := 'SELECT * FROM ' + UpperCase('Correctors');
  if 'Correctors' = 'GradeSubjects' then FDQuery.SQL.Text := 'SELECT * FROM GRADE_SUBJECTS';
  if 'Correctors' = 'ExamCenters' then FDQuery.SQL.Text := 'SELECT * FROM EXAM_CENTERS';
  if 'Correctors' = 'ExamSessions' then FDQuery.SQL.Text := 'SELECT * FROM EXAM_SESSIONS';
  if 'Correctors' = 'CandidateRegistrations' then FDQuery.SQL.Text := 'SELECT * FROM CANDIDATE_REGISTRATIONS';
  if 'Correctors' = 'ExamPapers' then FDQuery.SQL.Text := 'SELECT * FROM EXAM_PAPERS';
  if 'Correctors' = 'CompetitionCorrectors' then FDQuery.SQL.Text := 'SELECT * FROM COMPETITION_CORRECTORS';
  if 'Correctors' = 'CommitteeMembers' then FDQuery.SQL.Text := 'SELECT * FROM COMMITTEE_MEMBERS';
  if 'Correctors' = 'HallGradeAssignments' then FDQuery.SQL.Text := 'SELECT * FROM HALL_GRADE_ASSIGNMENTS';
  if 'Correctors' = 'ArchiveLog' then FDQuery.SQL.Text := 'SELECT * FROM ARCHIVE_LOG';
  ds.DataSet := FDQuery;
  DBGrid.DataSource := ds;
end;

procedure TFrm_Correctors.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFrm_Correctors.LoadData;
begin
  Screen.Cursor := crHourGlass;
  try
    FDQuery.Close;
    FDQuery.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrm_Correctors.btnNewClick(Sender: TObject);
begin
  FDQuery.Append;
end;

procedure TFrm_Correctors.btnEditClick(Sender: TObject);
begin
  if not FDQuery.IsEmpty then FDQuery.Edit;
end;

procedure TFrm_Correctors.btnDeleteClick(Sender: TObject);
begin
  if FDQuery.IsEmpty then Exit;
  if ConfirmAction('هل أنت متأكد من الحذف؟') then FDQuery.Delete;
end;

procedure TFrm_Correctors.btnSaveClick(Sender: TObject);
begin
  FDQuery.Post;
  ShowInfo('تم الحفظ بنجاح!');
  LoadData;
end;

procedure TFrm_Correctors.btnCancelClick(Sender: TObject);
begin
  FDQuery.Cancel;
  LoadData;
end;

procedure TFrm_Correctors.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
