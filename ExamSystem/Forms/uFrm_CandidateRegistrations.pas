unit uFrm_CandidateRegistrations;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrm_CandidateRegistrations = class(TForm)
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
  Frm_CandidateRegistrations: TFrm_CandidateRegistrations;

implementation

{$R *.dfm}

uses
  uDM_Main, uFunctions;

procedure TFrm_CandidateRegistrations.FormCreate(Sender: TObject);
begin
  FDQuery.Connection := DM_Main.FDConnection;
  FDQuery.SQL.Text := 'SELECT * FROM ' + UpperCase('CandidateRegistrations');
  if 'CandidateRegistrations' = 'GradeSubjects' then FDQuery.SQL.Text := 'SELECT * FROM GRADE_SUBJECTS';
  if 'CandidateRegistrations' = 'ExamCenters' then FDQuery.SQL.Text := 'SELECT * FROM EXAM_CENTERS';
  if 'CandidateRegistrations' = 'ExamSessions' then FDQuery.SQL.Text := 'SELECT * FROM EXAM_SESSIONS';
  if 'CandidateRegistrations' = 'CandidateRegistrations' then FDQuery.SQL.Text := 'SELECT * FROM CANDIDATE_REGISTRATIONS';
  if 'CandidateRegistrations' = 'ExamPapers' then FDQuery.SQL.Text := 'SELECT * FROM EXAM_PAPERS';
  if 'CandidateRegistrations' = 'CompetitionCorrectors' then FDQuery.SQL.Text := 'SELECT * FROM COMPETITION_CORRECTORS';
  if 'CandidateRegistrations' = 'CommitteeMembers' then FDQuery.SQL.Text := 'SELECT * FROM COMMITTEE_MEMBERS';
  if 'CandidateRegistrations' = 'HallGradeAssignments' then FDQuery.SQL.Text := 'SELECT * FROM HALL_GRADE_ASSIGNMENTS';
  if 'CandidateRegistrations' = 'ArchiveLog' then FDQuery.SQL.Text := 'SELECT * FROM ARCHIVE_LOG';
  ds.DataSet := FDQuery;
  DBGrid.DataSource := ds;
end;

procedure TFrm_CandidateRegistrations.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFrm_CandidateRegistrations.LoadData;
begin
  Screen.Cursor := crHourGlass;
  try
    FDQuery.Close;
    FDQuery.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrm_CandidateRegistrations.btnNewClick(Sender: TObject);
begin
  FDQuery.Append;
end;

procedure TFrm_CandidateRegistrations.btnEditClick(Sender: TObject);
begin
  if not FDQuery.IsEmpty then FDQuery.Edit;
end;

procedure TFrm_CandidateRegistrations.btnDeleteClick(Sender: TObject);
begin
  if FDQuery.IsEmpty then Exit;
  if ConfirmAction('هل أنت متأكد من الحذف؟') then FDQuery.Delete;
end;

procedure TFrm_CandidateRegistrations.btnSaveClick(Sender: TObject);
begin
  FDQuery.Post;
  ShowInfo('تم الحفظ بنجاح!');
  LoadData;
end;

procedure TFrm_CandidateRegistrations.btnCancelClick(Sender: TObject);
begin
  FDQuery.Cancel;
  LoadData;
end;

procedure TFrm_CandidateRegistrations.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
