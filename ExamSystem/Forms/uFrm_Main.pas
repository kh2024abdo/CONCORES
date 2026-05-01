unit uFrm_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TFrm_Main = class(TForm)
    MainMenu: TMainMenu;
    mnuFile: TMenuItem;
    mnuExit: TMenuItem;
    mnuTools: TMenuItem;
    mnuHelp: TMenuItem;
    mnuAbout: TMenuItem;
    pnlTop: TPanel;
    lblUserName: TLabel;
    lblUserRole: TLabel;
    StatusBar: TStatusBar;
    ToolBar: TToolBar;
    btnSettings: TToolButton;
    btnUsers: TToolButton;
    Separator1: TToolButton;
    btnAcademicYears: TToolButton;
    btnInstitutions: TToolButton;
    btnCorps: TToolButton;
    btnGrades: TToolButton;
    btnSubjects: TToolButton;
    Separator2: TToolButton;
    btnExamCenters: TToolButton;
    btnHalls: TToolButton;
    btnSessions: TToolButton;
    btnCompetitions: TToolButton;
    Separator3: TToolButton;
    btnCandidates: TToolButton;
    btnRegistrations: TToolButton;
    btnPapers: TToolButton;
    Separator4: TToolButton;
    btnCorrectors: TToolButton;
    btnCommittee: TToolButton;
    btnTimetable: TToolButton;
    btnAssignments: TToolButton;
    Separator5: TToolButton;
    btnArchive: TToolButton;
    btnLogout: TToolButton;
    mnuSettings: TMenuItem;
    mnuUsers: TMenuItem;
    N1: TMenuItem;
    mnuAcademicYears: TMenuItem;
    mnuInstitutions: TMenuItem;
    mnuCorps: TMenuItem;
    mnuGrades: TMenuItem;
    mnuSubjects: TMenuItem;
    mnuGradeSubjects: TMenuItem;
    N2: TMenuItem;
    mnuExamCenters: TMenuItem;
    mnuHalls: TMenuItem;
    mnuSessions: TMenuItem;
    mnuCompetitions: TMenuItem;
    N3: TMenuItem;
    mnuCandidates: TMenuItem;
    mnuRegistrations: TMenuItem;
    mnuPapers: TMenuItem;
    N4: TMenuItem;
    mnuCorrectors: TMenuItem;
    mnuCompetitionCorrectors: TMenuItem;
    mnuCommittee: TMenuItem;
    mnuTimetable: TMenuItem;
    mnuAssignments: TMenuItem;
    N5: TMenuItem;
    mnuArchiveLog: TMenuItem;
    N6: TMenuItem;
    mnuLogout: TMenuItem;
    procedure mnuExitClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure mnuSettingsClick(Sender: TObject);
    procedure mnuUsersClick(Sender: TObject);
    procedure mnuAcademicYearsClick(Sender: TObject);
    procedure mnuInstitutionsClick(Sender: TObject);
    procedure mnuCorpsClick(Sender: TObject);
    procedure mnuGradesClick(Sender: TObject);
    procedure mnuSubjectsClick(Sender: TObject);
    procedure mnuGradeSubjectsClick(Sender: TObject);
    procedure mnuExamCentersClick(Sender: TObject);
    procedure mnuHallsClick(Sender: TObject);
    procedure mnuSessionsClick(Sender: TObject);
    procedure mnuCompetitionsClick(Sender: TObject);
    procedure mnuCandidatesClick(Sender: TObject);
    procedure mnuRegistrationsClick(Sender: TObject);
    procedure mnuPapersClick(Sender: TObject);
    procedure mnuCorrectorsClick(Sender: TObject);
    procedure mnuCompetitionCorrectorsClick(Sender: TObject);
    procedure mnuCommitteeClick(Sender: TObject);
    procedure mnuTimetableClick(Sender: TObject);
    procedure mnuAssignmentsClick(Sender: TObject);
    procedure mnuArchiveLogClick(Sender: TObject);
    procedure mnuLogoutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    procedure OpenChildForm(const AFormClass: TFormClass; const ACaption: string);
  public
    { Public declarations }
  end;

var
  Frm_Main: TFrm_Main;

implementation

{$R *.dfm}

uses
  uGlobals, uFunctions, uDM_Main,
  uFrm_Settings, uFrm_Users, uFrm_AcademicYears, uFrm_Institutions,
  uFrm_Corps, uFrm_Grades, uFrm_Subjects, uFrm_GradeSubjects,
  uFrm_ExamCenters, uFrm_Halls, uFrm_ExamSessions, uFrm_Competitions,
  uFrm_Candidates, uFrm_CandidateRegistrations, uFrm_ExamPapers,
  uFrm_Correctors, uFrm_CompetitionCorrectors, uFrm_CommitteeMembers,
  uFrm_Timetable, uFrm_HallGradeAssignments, uFrm_ArchiveLog;

procedure TFrm_Main.FormCreate(Sender: TObject);
begin
  lblUserName.Caption := 'المستخدم: ' + gCurrentUser;
  lblUserRole.Caption := 'الصلاحية: ' + gCurrentUserRole;
  StatusBar.Panels[0].Text := APP_NAME + ' - الإصدار ' + APP_VERSION;
  StatusBar.Panels[1].Text := 'تاريخ اليوم: ' + FormatDate(Now);
end;

procedure TFrm_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := ConfirmAction('هل تريد الخروج من التطبيق؟');
end;

procedure TFrm_Main.mnuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Main.mnuAboutClick(Sender: TObject);
begin
  ShowInfo(APP_NAME + sLineBreak +
           'الإصدار: ' + APP_VERSION + sLineBreak +
           APP_COMPANY + sLineBreak +
           sLineBreak +
           'جميع الحقوق محفوظة © 2026');
end;

procedure TFrm_Main.mnuLogoutClick(Sender: TObject);
begin
  if ConfirmAction('هل تريد تسجيل الخروج؟') then
  begin
    DM_Main.Logout;
    ModalResult := mrNone;
    Close;
    Application.CreateForm(TFrm_Login, Frm_Login);
    Frm_Login.ShowModal;
  end;
end;

procedure TFrm_Main.OpenChildForm(const AFormClass: TFormClass; const ACaption: string);
var
  LForm: TForm;
begin
  // Check if form already exists
  for LForm in Screen.CustomForms do
  begin
    if (LForm.ClassType = AFormClass) and (LForm <> Self) then
    begin
      LForm.BringToFront;
      LForm.WindowState := wsMaximized;
      Exit;
    end;
  end;
  
  // Create new instance
  LForm := AFormClass.Create(Application);
  try
    LForm.Caption := ACaption;
    LForm.WindowState := wsMaximized;
    LForm.Show;
  except
    LForm.Free;
    raise;
  end;
end;

procedure TFrm_Main.mnuSettingsClick(Sender: TObject);
begin
  OpenChildForm(TFrm_Settings, 'إعدادات النظام');
end;

procedure TFrm_Main.mnuUsersClick(Sender: TObject);
begin
  OpenChildForm(TFrm_Users, 'إدارة المستخدمين');
end;

procedure TFrm_Main.mnuAcademicYearsClick(Sender: TObject);
begin
  OpenChildForm(TFrm_AcademicYears, 'السنوات الدراسية');
end;

procedure TFrm_Main.mnuInstitutionsClick(Sender: TObject);
begin
  OpenChildForm(TFrm_Institutions, 'المؤسسات');
end;

procedure TFrm_Main.mnuCorpsClick(Sender: TObject);
begin
  OpenChildForm(TFrm_Corps, 'الأسلاك');
end;

procedure TFrm_Main.mnuGradesClick(Sender: TObject);
begin
  OpenChildForm(TFrm_Grades, 'الرتب');
end;

procedure TFrm_Main.mnuSubjectsClick(Sender: TObject);
begin
  OpenChildForm(TFrm_Subjects, 'المواد');
end;

procedure TFrm_Main.mnuGradeSubjectsClick(Sender: TObject);
begin
  OpenChildForm(TFrm_GradeSubjects, 'مواد الرتب');
end;

procedure TFrm_Main.mnuExamCentersClick(Sender: TObject);
begin
  OpenChildForm(TFrm_ExamCenters, 'مراكز الامتحان');
end;

procedure TFrm_Main.mnuHallsClick(Sender: TObject);
begin
  OpenChildForm(TFrm_Halls, 'القاعات');
end;

procedure TFrm_Main.mnuSessionsClick(Sender: TObject);
begin
  OpenChildForm(TFrm_ExamSessions, 'دورات الامتحان');
end;

procedure TFrm_Main.mnuCompetitionsClick(Sender: TObject);
begin
  OpenChildForm(TFrm_Competitions, 'المسابقات');
end;

procedure TFrm_Main.mnuCandidatesClick(Sender: TObject);
begin
  OpenChildForm(TFrm_Candidates, 'المترشحين');
end;

procedure TFrm_Main.mnuRegistrationsClick(Sender: TObject);
begin
  OpenChildForm(TFrm_CandidateRegistrations, 'تسجيلات المترشحين');
end;

procedure TFrm_Main.mnuPapersClick(Sender: TObject);
begin
  OpenChildForm(TFrm_ExamPapers, 'أوراق الامتحان');
end;

procedure TFrm_Main.mnuCorrectorsClick(Sender: TObject);
begin
  OpenChildForm(TFrm_Correctors, 'المصححين');
end;

procedure TFrm_Main.mnuCompetitionCorrectorsClick(Sender: TObject);
begin
  OpenChildForm(TFrm_CompetitionCorrectors, 'مصححي المسابقات');
end;

procedure TFrm_Main.mnuCommitteeClick(Sender: TObject);
begin
  OpenChildForm(TFrm_CommitteeMembers, 'أعضاء اللجنة');
end;

procedure TFrm_Main.mnuTimetableClick(Sender: TObject);
begin
  OpenChildForm(TFrm_Timetable, 'جدول الامتحانات');
end;

procedure TFrm_Main.mnuAssignmentsClick(Sender: TObject);
begin
  OpenChildForm(TFrm_HallGradeAssignments, 'توزيع الرتب على القاعات');
end;

procedure TFrm_Main.mnuArchiveLogClick(Sender: TObject);
begin
  OpenChildForm(TFrm_ArchiveLog, 'سجل الأرشفة');
end;

end.
