unit uGlobals;

interface

const
  // Application Info
  APP_NAME = 'نظام إدارة الامتحانات';
  APP_VERSION = '1.0.0';
  APP_COMPANY = 'وزارة التعليم العالي والبحث العلمي';
  
  // Database Settings
  DB_SERVER = 'localhost';
  DB_PATH = 'C:\ExamDB\EXAM_SYSTEM.FDB';
  DB_USER = 'SYSDBA';
  DB_PASSWORD = 'masterkey';
  DB_CHARSET = 'UTF8';
  
  // User Roles
  ROLE_ADMIN = 'ADMIN';
  ROLE_MANAGER = 'MANAGER';
  ROLE_USER = 'USER';
  ROLE_VIEWER = 'VIEWER';
  
  // Exam Types
  EXAM_TYPE_IKHTIBAR = 'IKHTIBAR';
  EXAM_TYPE_MIHANI = 'MIHANI';
  
  // Competition Status
  COMP_STATUS_ACTIVE = 'ACTIVE';
  COMP_STATUS_COMPLETED = 'COMPLETED';
  COMP_STATUS_ARCHIVED = 'ARCHIVED';
  COMP_STATUS_CANCELLED = 'CANCELLED';
  
  // Session Status
  SESSION_STATUS_PLANNED = 'PLANNED';
  SESSION_STATUS_ONGOING = 'ONGOING';
  SESSION_STATUS_COMPLETED = 'COMPLETED';
  SESSION_STATUS_ARCHIVED = 'ARCHIVED';
  
  // Registration Decisions
  DECISION_PENDING = 'PENDING';
  DECISION_ACCEPTED = 'ACCEPTED';
  DECISION_REJECTED = 'REJECTED';
  DECISION_EXCLUDED = 'EXCLUDED';
  DECISION_ABSENT = 'ABSENT';
  DECISION_FAILED = 'FAILED';
  
  // Corrector Roles
  ROLE_CORRECTOR = 'CORRECTOR';
  ROLE_SECRETARY = 'SECRETARY';
  ROLE_CHIEF_CORRECTOR = 'CHIEF_CORRECTOR';
  
  // Committee Roles
  ROLE_PRESIDENT = 'PRESIDENT';
  ROLE_MEMBER = 'MEMBER';
  ROLE_RAPPORTEUR = 'RAPPORTEUR';
  
  // Archive Actions
  ACTION_ARCHIVED = 'ARCHIVED';
  ACTION_RESTORED = 'RESTORED';
  ACTION_DELETED = 'DELETED';
  ACTION_EXPORTED = 'EXPORTED';
  
  // Hall Types
  HALL_TYPE_HALL = 'HALL';
  HALL_TYPE_AMPHITHEATER = 'AMPHITHEATER';
  HALL_TYPE_ROOM = 'ROOM';
  HALL_TYPE_LAB = 'LAB';
  
  // Gender
  GENDER_MALE = 'M';
  GENDER_FEMALE = 'F';

var
  gCurrentUser: string;
  gCurrentUserID: Integer;
  gCurrentUserRole: string;
  gIsLoggedIn: Boolean;

implementation

initialization
  gCurrentUser := '';
  gCurrentUserID := 0;
  gCurrentUserRole := '';
  gIsLoggedIn := False;

end.
