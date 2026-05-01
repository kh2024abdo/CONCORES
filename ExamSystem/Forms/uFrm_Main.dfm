object Frm_Main: TFrm_Main
  Left = 0
  Top = 0
  WindowState = wsMaximized
  Caption = 'نظام إدارة الامتحانات'
  ClientHeight = 768
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1024
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    Color = clDarkBlue
    ParentBackground = False
    TabOrder = 0
    object lblUserName: TLabel
      Left = 20
      Top = 15
      Width = 120
      Height = 16
      Caption = 'المستخدم: --'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblUserRole: TLabel
      Left = 20
      Top = 38
      Width = 100
      Height = 16
      Caption = 'الصلاحية: --'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 60
    Width = 1024
    Height = 38
    AutoSize = True
    ButtonHeight = 34
    ButtonWidth = 36
    Images = None
    TabOrder = 1
    object btnSettings: TToolButton
      Left = 0
      Top = 0
      Caption = 'الإعدادات'
      ImageIndex = 0
      OnClick = mnuSettingsClick
    end
    object btnUsers: TToolButton
      Left = 36
      Top = 0
      Caption = 'المستخدمين'
      ImageIndex = 1
      OnClick = mnuUsersClick
    end
    object Separator1: TToolButton
      Left = 72
      Top = 0
      Width = 8
      Caption = 'Separator1'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object btnAcademicYears: TToolButton
      Left = 80
      Top = 0
      Caption = 'السنوات'
      ImageIndex = 3
      OnClick = mnuAcademicYearsClick
    end
    object btnInstitutions: TToolButton
      Left = 116
      Top = 0
      Caption = 'المؤسسات'
      ImageIndex = 4
      OnClick = mnuInstitutionsClick
    end
    object btnCorps: TToolButton
      Left = 152
      Top = 0
      Caption = 'الأسلاك'
      ImageIndex = 5
      OnClick = mnuCorpsClick
    end
    object btnGrades: TToolButton
      Left = 188
      Top = 0
      Caption = 'الرتب'
      ImageIndex = 6
      OnClick = mnuGradesClick
    end
    object btnSubjects: TToolButton
      Left = 224
      Top = 0
      Caption = 'المواد'
      ImageIndex = 7
      OnClick = mnuSubjectsClick
    end
    object Separator2: TToolButton
      Left = 260
      Top = 0
      Width = 8
      Caption = 'Separator2'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btnExamCenters: TToolButton
      Left = 268
      Top = 0
      Caption = 'المراكز'
      ImageIndex = 9
      OnClick = mnuExamCentersClick
    end
    object btnHalls: TToolButton
      Left = 304
      Top = 0
      Caption = 'القاعات'
      ImageIndex = 10
      OnClick = mnuHallsClick
    end
    object btnSessions: TToolButton
      Left = 340
      Top = 0
      Caption = 'الدورات'
      ImageIndex = 11
      OnClick = mnuSessionsClick
    end
    object btnCompetitions: TToolButton
      Left = 376
      Top = 0
      Caption = 'المسابقات'
      ImageIndex = 12
      OnClick = mnuCompetitionsClick
    end
    object Separator3: TToolButton
      Left = 412
      Top = 0
      Width = 8
      Caption = 'Separator3'
      ImageIndex = 13
      Style = tbsSeparator
    end
    object btnCandidates: TToolButton
      Left = 420
      Top = 0
      Caption = 'المترشحين'
      ImageIndex = 14
      OnClick = mnuCandidatesClick
    end
    object btnRegistrations: TToolButton
      Left = 456
      Top = 0
      Caption = 'التسجيلات'
      ImageIndex = 15
      OnClick = mnuRegistrationsClick
    end
    object btnPapers: TToolButton
      Left = 492
      Top = 0
      Caption = 'الأوراق'
      ImageIndex = 16
      OnClick = mnuPapersClick
    end
    object Separator4: TToolButton
      Left = 528
      Top = 0
      Width = 8
      Caption = 'Separator4'
      ImageIndex = 17
      Style = tbsSeparator
    end
    object btnCorrectors: TToolButton
      Left = 536
      Top = 0
      Caption = 'المصححين'
      ImageIndex = 18
      OnClick = mnuCorrectorsClick
    end
    object btnCommittee: TToolButton
      Left = 572
      Top = 0
      Caption = 'اللجنة'
      ImageIndex = 19
      OnClick = mnuCommitteeClick
    end
    object btnTimetable: TToolButton
      Left = 608
      Top = 0
      Caption = 'الجدول'
      ImageIndex = 20
      OnClick = mnuTimetableClick
    end
    object btnAssignments: TToolButton
      Left = 644
      Top = 0
      Caption = 'التوزيع'
      ImageIndex = 21
      OnClick = mnuAssignmentsClick
    end
    object Separator5: TToolButton
      Left = 680
      Top = 0
      Width = 8
      Caption = 'Separator5'
      ImageIndex = 22
      Style = tbsSeparator
    end
    object btnArchive: TToolButton
      Left = 688
      Top = 0
      Caption = 'الأرشفة'
      ImageIndex = 23
      OnClick = mnuArchiveLogClick
    end
    object btnLogout: TToolButton
      Left = 724
      Top = 0
      Caption = 'خروج'
      ImageIndex = 24
      OnClick = mnuLogoutClick
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 749
    Width = 1024
    Height = 19
    Panels = <
      item
        Width = 500
      end
      item
        Width = 200
      end>
    SimplePanel = False
  end
  object MainMenu: TMainMenu
    Left = 96
    Top = 120
    object mnuFile: TMenuItem
      Caption = 'ملف'
      object mnuLogout: TMenuItem
        Caption = 'تسجيل الخروج'
        OnClick = mnuLogoutClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuExit: TMenuItem
        Caption = 'خروج'
        OnClick = mnuExitClick
      end
    end
    object mnuTools: TMenuItem
      Caption = 'أدوات'
      object mnuSettings: TMenuItem
        Caption = 'إعدادات النظام'
        OnClick = mnuSettingsClick
      end
      object mnuUsers: TMenuItem
        Caption = 'إدارة المستخدمين'
        OnClick = mnuUsersClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuAcademicYears: TMenuItem
        Caption = 'السنوات الدراسية'
        OnClick = mnuAcademicYearsClick
      end
      object mnuInstitutions: TMenuItem
        Caption = 'المؤسسات'
        OnClick = mnuInstitutionsClick
      end
      object mnuCorps: TMenuItem
        Caption = 'الأسلاك'
        OnClick = mnuCorpsClick
      end
      object mnuGrades: TMenuItem
        Caption = 'الرتب'
        OnClick = mnuGradesClick
      end
      object mnuSubjects: TMenuItem
        Caption = 'المواد'
        OnClick = mnuSubjectsClick
      end
      object mnuGradeSubjects: TMenuItem
        Caption = 'مواد الرتب'
        OnClick = mnuGradeSubjectsClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuExamCenters: TMenuItem
        Caption = 'مراكز الامتحان'
        OnClick = mnuExamCentersClick
      end
      object mnuHalls: TMenuItem
        Caption = 'القاعات'
        OnClick = mnuHallsClick
      end
      object mnuSessions: TMenuItem
        Caption = 'دورات الامتحان'
        OnClick = mnuSessionsClick
      end
      object mnuCompetitions: TMenuItem
        Caption = 'المسابقات'
        OnClick = mnuCompetitionsClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuCandidates: TMenuItem
        Caption = 'المترشحين'
        OnClick = mnuCandidatesClick
      end
      object mnuRegistrations: TMenuItem
        Caption = 'تسجيلات المترشحين'
        OnClick = mnuRegistrationsClick
      end
      object mnuPapers: TMenuItem
        Caption = 'أوراق الامتحان'
        OnClick = mnuPapersClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuCorrectors: TMenuItem
        Caption = 'المصححين'
        OnClick = mnuCorrectorsClick
      end
      object mnuCompetitionCorrectors: TMenuItem
        Caption = 'مصححي المسابقات'
        OnClick = mnuCompetitionCorrectorsClick
      end
      object mnuCommittee: TMenuItem
        Caption = 'أعضاء اللجنة'
        OnClick = mnuCommitteeClick
      end
      object mnuTimetable: TMenuItem
        Caption = 'جدول الامتحانات'
        OnClick = mnuTimetableClick
      end
      object mnuAssignments: TMenuItem
        Caption = 'توزيع الرتب على القاعات'
        OnClick = mnuAssignmentsClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuArchiveLog: TMenuItem
        Caption = 'سجل الأرشفة'
        OnClick = mnuArchiveLogClick
      end
    end
    object mnuHelp: TMenuItem
      Caption = 'مساعدة'
      object mnuAbout: TMenuItem
        Caption = 'حول'
        OnClick = mnuAboutClick
      end
    end
  end
end
