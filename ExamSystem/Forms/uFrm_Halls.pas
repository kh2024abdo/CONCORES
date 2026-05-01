unit uFrm_Halls;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrm_Halls = class(TForm)
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
  Frm_Halls: TFrm_Halls;

implementation

{$R *.dfm}

uses
  uDM_Main, uFunctions;

procedure TFrm_Halls.FormCreate(Sender: TObject);
begin
  FDQuery.Connection := DM_Main.FDConnection;
  FDQuery.SQL.Text := 'SELECT * FROM ' + UpperCase('Halls');
  if 'Halls' = 'GradeSubjects' then FDQuery.SQL.Text := 'SELECT * FROM GRADE_SUBJECTS';
  if 'Halls' = 'ExamCenters' then FDQuery.SQL.Text := 'SELECT * FROM EXAM_CENTERS';
  if 'Halls' = 'ExamSessions' then FDQuery.SQL.Text := 'SELECT * FROM EXAM_SESSIONS';
  if 'Halls' = 'CandidateRegistrations' then FDQuery.SQL.Text := 'SELECT * FROM CANDIDATE_REGISTRATIONS';
  if 'Halls' = 'ExamPapers' then FDQuery.SQL.Text := 'SELECT * FROM EXAM_PAPERS';
  if 'Halls' = 'CompetitionCorrectors' then FDQuery.SQL.Text := 'SELECT * FROM COMPETITION_CORRECTORS';
  if 'Halls' = 'CommitteeMembers' then FDQuery.SQL.Text := 'SELECT * FROM COMMITTEE_MEMBERS';
  if 'Halls' = 'HallGradeAssignments' then FDQuery.SQL.Text := 'SELECT * FROM HALL_GRADE_ASSIGNMENTS';
  if 'Halls' = 'ArchiveLog' then FDQuery.SQL.Text := 'SELECT * FROM ARCHIVE_LOG';
  ds.DataSet := FDQuery;
  DBGrid.DataSource := ds;
end;

procedure TFrm_Halls.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFrm_Halls.LoadData;
begin
  Screen.Cursor := crHourGlass;
  try
    FDQuery.Close;
    FDQuery.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrm_Halls.btnNewClick(Sender: TObject);
begin
  FDQuery.Append;
end;

procedure TFrm_Halls.btnEditClick(Sender: TObject);
begin
  if not FDQuery.IsEmpty then FDQuery.Edit;
end;

procedure TFrm_Halls.btnDeleteClick(Sender: TObject);
begin
  if FDQuery.IsEmpty then Exit;
  if ConfirmAction('هل أنت متأكد من الحذف؟') then FDQuery.Delete;
end;

procedure TFrm_Halls.btnSaveClick(Sender: TObject);
begin
  FDQuery.Post;
  ShowInfo('تم الحفظ بنجاح!');
  LoadData;
end;

procedure TFrm_Halls.btnCancelClick(Sender: TObject);
begin
  FDQuery.Cancel;
  LoadData;
end;

procedure TFrm_Halls.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
