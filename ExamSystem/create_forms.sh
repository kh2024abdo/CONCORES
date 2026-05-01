#!/bin/bash

# قائمة الواجهات المطلوبة
forms=(
  "Institutions"
  "Corps"
  "Grades"
  "Subjects"
  "GradeSubjects"
  "ExamCenters"
  "Halls"
  "ExamSessions"
  "Competitions"
  "CandidateRegistrations"
  "ExamPapers"
  "Correctors"
  "CompetitionCorrectors"
  "CommitteeMembers"
  "Timetable"
  "HallGradeAssignments"
  "ArchiveLog"
  "ReportViewer"
)

for form in "${forms[@]}"; do
  # Create PAS file
  cat > "/workspace/ExamSystem/Forms/uFrm_${form}.pas" << EOF
unit uFrm_${form};

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrm_${form} = class(TForm)
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
  Frm_${form}: TFrm_${form};

implementation

{\$R *.dfm}

uses
  uDM_Main, uFunctions;

procedure TFrm_${form}.FormCreate(Sender: TObject);
begin
  FDQuery.Connection := DM_Main.FDConnection;
  FDQuery.SQL.Text := 'SELECT * FROM ' + UpperCase('${form}');
  if '${form}' = 'GradeSubjects' then FDQuery.SQL.Text := 'SELECT * FROM GRADE_SUBJECTS';
  if '${form}' = 'ExamCenters' then FDQuery.SQL.Text := 'SELECT * FROM EXAM_CENTERS';
  if '${form}' = 'ExamSessions' then FDQuery.SQL.Text := 'SELECT * FROM EXAM_SESSIONS';
  if '${form}' = 'CandidateRegistrations' then FDQuery.SQL.Text := 'SELECT * FROM CANDIDATE_REGISTRATIONS';
  if '${form}' = 'ExamPapers' then FDQuery.SQL.Text := 'SELECT * FROM EXAM_PAPERS';
  if '${form}' = 'CompetitionCorrectors' then FDQuery.SQL.Text := 'SELECT * FROM COMPETITION_CORRECTORS';
  if '${form}' = 'CommitteeMembers' then FDQuery.SQL.Text := 'SELECT * FROM COMMITTEE_MEMBERS';
  if '${form}' = 'HallGradeAssignments' then FDQuery.SQL.Text := 'SELECT * FROM HALL_GRADE_ASSIGNMENTS';
  if '${form}' = 'ArchiveLog' then FDQuery.SQL.Text := 'SELECT * FROM ARCHIVE_LOG';
  ds.DataSet := FDQuery;
  DBGrid.DataSource := ds;
end;

procedure TFrm_${form}.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFrm_${form}.LoadData;
begin
  Screen.Cursor := crHourGlass;
  try
    FDQuery.Close;
    FDQuery.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrm_${form}.btnNewClick(Sender: TObject);
begin
  FDQuery.Append;
end;

procedure TFrm_${form}.btnEditClick(Sender: TObject);
begin
  if not FDQuery.IsEmpty then FDQuery.Edit;
end;

procedure TFrm_${form}.btnDeleteClick(Sender: TObject);
begin
  if FDQuery.IsEmpty then Exit;
  if ConfirmAction('هل أنت متأكد من الحذف؟') then FDQuery.Delete;
end;

procedure TFrm_${form}.btnSaveClick(Sender: TObject);
begin
  FDQuery.Post;
  ShowInfo('تم الحفظ بنجاح!');
  LoadData;
end;

procedure TFrm_${form}.btnCancelClick(Sender: TObject);
begin
  FDQuery.Cancel;
  LoadData;
end;

procedure TFrm_${form}.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
EOF

  # Create DFM file
  cat > "/workspace/ExamSystem/Forms/uFrm_${form}.dfm" << EOF
object Frm_${form}: TFrm_${form}
  Left = 0
  Top = 0
  Caption = '${form}'
  ClientHeight = 480
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = clDarkBlue
    ParentBackground = False
    TabOrder = 0
    object lblTitle: TLabel
      Left = 20
      Top = 15
      Width = 100
      Height = 20
      Caption = '${form}'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlCenter: TPanel
    Left = 0
    Top = 50
    Width = 720
    Height = 380
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 720
      Height = 380
      Align = alClient
      DataSource = ds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ARABIC_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 430
    Width = 720
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnNew: TBitBtn
      Left = 20
      Top = 10
      Width = 80
      Height = 30
      Caption = 'جديد'
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnEdit: TBitBtn
      Left = 110
      Top = 10
      Width = 80
      Height = 30
      Caption = 'تعديل'
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 200
      Top = 10
      Width = 80
      Height = 30
      Caption = 'حذف'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnSave: TBitBtn
      Left = 400
      Top = 10
      Width = 80
      Height = 30
      Caption = 'حفظ'
      TabOrder = 3
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 490
      Top = 10
      Width = 80
      Height = 30
      Caption = 'إلغاء'
      TabOrder = 4
      OnClick = btnCancelClick
    end
    object btnClose: TBitBtn
      Left = 620
      Top = 10
      Width = 80
      Height = 30
      Caption = 'إغلاق'
      ModalResult = 2
      TabOrder = 5
      OnClick = btnCloseClick
    end
  end
  object ds: TDataSource
    Left = 600
    Top = 200
  end
  object FDQuery: TFDQuery
    Connection = DM_Main.FDConnection
    Left = 600
    Top = 260
  end
end
EOF

done

echo "All forms created successfully!"
