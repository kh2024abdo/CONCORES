unit uDM_Main;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs,
  FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.Comp.UIComponent, FireDAC.Comp.Container, Vcl.Forms,
  Data.DBXFirebird;

type
  TDM_Main = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    
    // Settings
    FDSettings: TFDQuery;
    dsSettings: TDataSource;
    
    // Users
    FDUsers: TFDQuery;
    dsUsers: TDataSource;
    
    // Academic Years
    FDAcademicYears: TFDQuery;
    dsAcademicYears: TDataSource;
    
    // Institutions
    FDInstitutions: TFDQuery;
    dsInstitutions: TDataSource;
    
    // Corps
    FDCorps: TFDQuery;
    dsCorps: TDataSource;
    
    // Grades
    FDGrades: TFDQuery;
    dsGrades: TDataSource;
    
    // Subjects
    FDSubjects: TFDQuery;
    dsSubjects: TDataSource;
    
    // Grade Subjects
    FDGradeSubjects: TFDQuery;
    dsGradeSubjects: TDataSource;
    
    // Exam Centers
    FDExamCenters: TFDQuery;
    dsExamCenters: TDataSource;
    
    // Halls
    FDHalls: TFDQuery;
    dsHalls: TDataSource;
    
    // Exam Sessions
    FDExamSessions: TFDQuery;
    dsExamSessions: TDataSource;
    
    // Competitions
    FDCompetitions: TFDQuery;
    dsCompetitions: TDataSource;
    
    // Candidates
    FDCandidates: TFDQuery;
    dsCandidates: TDataSource;
    
    // Candidate Registrations
    FDCandidateRegistrations: TFDQuery;
    dsCandidateRegistrations: TDataSource;
    
    // Exam Papers
    FDExamPapers: TFDQuery;
    dsExamPapers: TDataSource;
    
    // Correctors
    FDCorrectors: TFDQuery;
    dsCorrectors: TDataSource;
    
    // Competition Correctors
    FDCompetitionCorrectors: TFDQuery;
    dsCompetitionCorrectors: TDataSource;
    
    // Committee Members
    FDCommitteeMembers: TFDQuery;
    dsCommitteeMembers: TDataSource;
    
    // Timetable
    FDTimetable: TFDQuery;
    dsTimetable: TDataSource;
    
    // Hall Grade Assignments
    FDHallGradeAssignments: TFDQuery;
    dsHallGradeAssignments: TDataSource;
    
    // Archive Log
    FDArchiveLog: TFDQuery;
    dsArchiveLog: TDataSource;
    
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    function ConnectDB: Boolean;
  public
    function Login(const AUsername, APassword: string): Boolean;
    procedure Logout;
    function ExecuteSQL(const ASQL: string): Integer;
    function GetNextID(const ASequence: string): Integer;
    procedure RefreshQuery(AQuery: TFDQuery);
  end;

var
  DM_Main: TDM_Main;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  uGlobals, uFunctions;

{$R *.dfm}

procedure TDM_Main.DataModuleCreate(Sender: TObject);
begin
  if not ConnectDB then
  begin
    ShowError('فشل الاتصال بقاعدة البيانات!' + sLineBreak + 'يرجى التحقق من الإعدادات.');
    Application.Terminate;
  end;
end;

procedure TDM_Main.DataModuleDestroy(Sender: TObject);
begin
  Logout;
end;

function TDM_Main.ConnectDB: Boolean;
begin
  Result := False;
  try
    FDConnection.Close;
    FDConnection.DriverName := 'FB';
    FDConnection.Params.Clear;
    FDConnection.Params.Add('Server=' + DB_SERVER);
    FDConnection.Params.Add('Database=' + DB_PATH);
    FDConnection.Params.Add('User_Name=' + DB_USER);
    FDConnection.Params.Add('Password=' + DB_PASSWORD);
    FDConnection.Params.Add('CharacterSet=' + DB_CHARSET);
    FDConnection.Params.Add('Protocol=TCPIP');
    FDConnection.LoginPrompt := False;
    FDConnection.Connected := True;
    Result := FDConnection.Connected;
  except
    on E: Exception do
    begin
      ShowError('خطأ في الاتصال بقاعدة البيانات:' + sLineBreak + E.Message);
      Result := False;
    end;
  end;
end;

function TDM_Main.Login(const AUsername, APassword: string): Boolean;
var
  LHash: string;
begin
  Result := False;
  try
    FDUsers.Close;
    FDUsers.SQL.Text := 'SELECT ID, USERNAME, PASSWORD_HASH, FIRST_NAME, LAST_NAME, ROLE, IS_ACTIVE ' +
                        'FROM USERS WHERE USERNAME = :USERNAME AND IS_ACTIVE = 1';
    FDUsers.ParamByName('USERNAME').AsString := AUsername;
    FDUsers.Open;
    
    if not FDUsers.IsEmpty then
    begin
      // Simple password check (in production use BCrypt)
      LHash := FDUsers.FieldByName('PASSWORD_HASH').AsString;
      if (LHash = APassword) or (LHash = Copy(APassword, 1, 20)) then
      begin
        gCurrentUserID := FDUsers.FieldByName('ID').AsInteger;
        gCurrentUser := FDUsers.FieldByName('USERNAME').AsString;
        gCurrentUserRole := FDUsers.FieldByName('ROLE').AsString;
        gIsLoggedIn := True;
        Result := True;
      end
      else
        ShowError('كلمة المرور غير صحيحة!');
    end
    else
      ShowError('اسم المستخدم غير موجود!');
      
    FDUsers.Close;
  except
    on E: Exception do
      ShowError('خطأ في تسجيل الدخول: ' + E.Message);
  end;
end;

procedure TDM_Main.Logout;
begin
  gCurrentUser := '';
  gCurrentUserID := 0;
  gCurrentUserRole := '';
  gIsLoggedIn := False;
end;

function TDM_Main.ExecuteSQL(const ASQL: string): Integer;
var
  Q: TFDQuery;
begin
  Result := 0;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FDConnection;
    Q.SQL.Text := ASQL;
    Result := Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

function TDM_Main.GetNextID(const ASequence: string): Integer;
var
  Q: TFDQuery;
begin
  Result := 0;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FDConnection;
    Q.SQL.Text := 'SELECT GEN_ID(' + ASequence + ', 1) FROM RDB$DATABASE';
    Q.Open;
    if not Q.IsEmpty then
      Result := Q.Fields[0].AsInteger;
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TDM_Main.RefreshQuery(AQuery: TFDQuery);
var
  Bookmark: TBookmark;
begin
  if AQuery.Active then
  begin
    Bookmark := AQuery.GetBookmark;
    try
      AQuery.Refresh;
      if AQuery.BookmarkValid(Bookmark) then
        AQuery.GotoBookmark(Bookmark);
    finally
      AQuery.FreeBookmark(Bookmark);
    end;
  end
  else
    AQuery.Open;
end;

end.
