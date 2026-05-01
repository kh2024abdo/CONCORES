program ExamSystem;

uses
  Vcl.Forms,
  uDM_Main in 'DataModules\uDM_Main.pas' {DM_Main: TDataModule},
  uFrm_Login in 'Forms\uFrm_Login.pas' {Frm_Login},
  uFrm_Main in 'Forms\uFrm_Main.pas' {Frm_Main},
  uFrm_AcademicYears in 'Forms\uFrm_AcademicYears.pas' {Frm_AcademicYears},
  uFrm_Institutions in 'Forms\uFrm_Institutions.pas' {Frm_Institutions},
  uFrm_Corps in 'Forms\uFrm_Corps.pas' {Frm_Corps},
  uFrm_Grades in 'Forms\uFrm_Grades.pas' {Frm_Grades},
  uFrm_Subjects in 'Forms\uFrm_Subjects.pas' {Frm_Subjects},
  uFrm_GradeSubjects in 'Forms\uFrm_GradeSubjects.pas' {Frm_GradeSubjects},
  uFrm_ExamCenters in 'Forms\uFrm_ExamCenters.pas' {Frm_ExamCenters},
  uFrm_Halls in 'Forms\uFrm_Halls.pas' {Frm_Halls},
  uFrm_ExamSessions in 'Forms\uFrm_ExamSessions.pas' {Frm_ExamSessions},
  uFrm_Competitions in 'Forms\uFrm_Competitions.pas' {Frm_Competitions},
  uFrm_Candidates in 'Forms\uFrm_Candidates.pas' {Frm_Candidates},
  uFrm_CandidateRegistrations in 'Forms\uFrm_CandidateRegistrations.pas' {Frm_CandidateRegistrations},
  uFrm_ExamPapers in 'Forms\uFrm_ExamPapers.pas' {Frm_ExamPapers},
  uFrm_Correctors in 'Forms\uFrm_Correctors.pas' {Frm_Correctors},
  uFrm_CompetitionCorrectors in 'Forms\uFrm_CompetitionCorrectors.pas' {Frm_CompetitionCorrectors},
  uFrm_CommitteeMembers in 'Forms\uFrm_CommitteeMembers.pas' {Frm_CommitteeMembers},
  uFrm_Timetable in 'Forms\uFrm_Timetable.pas' {Frm_Timetable},
  uFrm_HallGradeAssignments in 'Forms\uFrm_HallGradeAssignments.pas' {Frm_HallGradeAssignments},
  uFrm_Users in 'Forms\uFrm_Users.pas' {Frm_Users},
  uFrm_Settings in 'Forms\uFrm_Settings.pas' {Frm_Settings},
  uFrm_ArchiveLog in 'Forms\uFrm_ArchiveLog.pas' {Frm_ArchiveLog},
  uFrm_ReportViewer in 'Forms\uFrm_ReportViewer.pas' {Frm_ReportViewer},
  uGlobals in 'Utils\uGlobals.pas',
  uFunctions in 'Utils\uFunctions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM_Main, DM_Main);
  Application.CreateForm(TFrm_Login, Frm_Login);
  if Frm_Login.ShowModal = mrOk then
  begin
    Application.CreateForm(TFrm_Main, Frm_Main);
    Application.Run;
  end;
end.
