object DM_Main: TDM_Main
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=FB')
    Left = 32
    Top = 24
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 104
    Top = 24
  end
  object FDSettings: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM SETTINGS')
    Left = 32
    Top = 80
  end
  object dsSettings: TDataSource
    DataSet = FDSettings
    Left = 96
    Top = 80
  end
  object FDUsers: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM USERS')
    Left = 32
    Top = 136
  end
  object dsUsers: TDataSource
    DataSet = FDUsers
    Left = 96
    Top = 136
  end
  object FDAcademicYears: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM ACADEMIC_YEARS')
    Left = 32
    Top = 192
  end
  object dsAcademicYears: TDataSource
    DataSet = FDAcademicYears
    Left = 96
    Top = 192
  end
  object FDInstitutions: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM INSTITUTIONS')
    Left = 32
    Top = 248
  end
  object dsInstitutions: TDataSource
    DataSet = FDInstitutions
    Left = 96
    Top = 248
  end
  object FDCorps: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM CORPS')
    Left = 32
    Top = 304
  end
  object dsCorps: TDataSource
    DataSet = FDCorps
    Left = 96
    Top = 304
  end
  object FDGrades: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM GRADES')
    Left = 32
    Top = 360
  end
  object dsGrades: TDataSource
    DataSet = FDGrades
    Left = 96
    Top = 360
  end
  object FDSubjects: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM SUBJECTS')
    Left = 160
    Top = 24
  end
  object dsSubjects: TDataSource
    DataSet = FDSubjects
    Left = 224
    Top = 24
  end
  object FDGradeSubjects: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM GRADE_SUBJECTS')
    Left = 160
    Top = 80
  end
  object dsGradeSubjects: TDataSource
    DataSet = FDGradeSubjects
    Left = 224
    Top = 80
  end
  object FDExamCenters: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM EXAM_CENTERS')
    Left = 160
    Top = 136
  end
  object dsExamCenters: TDataSource
    DataSet = FDExamCenters
    Left = 224
    Top = 136
  end
  object FDHalls: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM HALLS')
    Left = 160
    Top = 192
  end
  object dsHalls: TDataSource
    DataSet = FDHalls
    Left = 224
    Top = 192
  end
  object FDExamSessions: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM EXAM_SESSIONS')
    Left = 160
    Top = 248
  end
  object dsExamSessions: TDataSource
    DataSet = FDExamSessions
    Left = 224
    Top = 248
  end
  object FDCompetitions: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM COMPETITIONS')
    Left = 160
    Top = 304
  end
  object dsCompetitions: TDataSource
    DataSet = FDCompetitions
    Left = 224
    Top = 304
  end
  object FDCandidates: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM CANDIDATES')
    Left = 160
    Top = 360
  end
  object dsCandidates: TDataSource
    DataSet = FDCandidates
    Left = 224
    Top = 360
  end
  object FDCandidateRegistrations: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM CANDIDATE_REGISTRATIONS')
    Left = 288
    Top = 24
  end
  object dsCandidateRegistrations: TDataSource
    DataSet = FDCandidateRegistrations
    Left = 352
    Top = 24
  end
  object FDExamPapers: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM EXAM_PAPERS')
    Left = 288
    Top = 80
  end
  object dsExamPapers: TDataSource
    DataSet = FDExamPapers
    Left = 352
    Top = 80
  end
  object FDCorrectors: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM CORRECTORS')
    Left = 288
    Top = 136
  end
  object dsCorrectors: TDataSource
    DataSet = FDCorrectors
    Left = 352
    Top = 136
  end
  object FDCompetitionCorrectors: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM COMPETITION_CORRECTORS')
    Left = 288
    Top = 192
  end
  object dsCompetitionCorrectors: TDataSource
    DataSet = FDCompetitionCorrectors
    Left = 352
    Top = 192
  end
  object FDCommitteeMembers: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM COMMITTEE_MEMBERS')
    Left = 288
    Top = 248
  end
  object dsCommitteeMembers: TDataSource
    DataSet = FDCommitteeMembers
    Left = 352
    Top = 248
  end
  object FDTimetable: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM TIMETABLE')
    Left = 288
    Top = 304
  end
  object dsTimetable: TDataSource
    DataSet = FDTimetable
    Left = 352
    Top = 304
  end
  object FDHallGradeAssignments: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM HALL_GRADE_ASSIGNMENTS')
    Left = 288
    Top = 360
  end
  object dsHallGradeAssignments: TDataSource
    DataSet = FDHallGradeAssignments
    Left = 352
    Top = 360
  end
  object FDArchiveLog: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM ARCHIVE_LOG')
    Left = 416
    Top = 24
  end
  object dsArchiveLog: TDataSource
    DataSet = FDArchiveLog
    Left = 480
    Top = 24
  end
end
