object Frm_Candidates: TFrm_Candidates
  Left = 0
  Top = 0
  Caption = 'إدارة المترشحين'
  ClientHeight = 589
  ClientWidth = 943
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
    Width = 943
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = clDarkBlue
    ParentBackground = False
    TabOrder = 0
    object lblTitle: TLabel
      Left = 20
      Top = 15
      Width = 120
      Height = 20
      Caption = 'قائمة المترشحين'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlSearch: TPanel
    Left = 0
    Top = 50
    Width = 943
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lblSearch: TLabel
      Left = 20
      Top = 15
      Width = 50
      Height = 16
      Caption = 'البحث:'
    end
    object edtSearch: TEdit
      Left = 80
      Top = 12
      Width = 300
      Height = 24
      TabOrder = 0
      OnKeyPress = edtSearchKeyPress
    end
    object btnSearch: TBitBtn
      Left = 390
      Top = 10
      Width = 80
      Height = 30
      Caption = 'بحث'
      TabOrder = 1
      OnClick = btnSearchClick
    end
    object chkActiveOnly: TCheckBox
      Left = 490
      Top = 14
      Width = 120
      Height = 20
      Caption = 'النشطين فقط'
      TabOrder = 2
      OnClick = chkActiveOnlyClick
    end
  end
  object pnlCenter: TPanel
    Left = 0
    Top = 100
    Width = 943
    Height = 439
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 943
      Height = 439
      Align = alClient
      DataSource = dsCandidates
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = ARABIC_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      OnDblClick = DBGridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'LAST_NAME'
          Title.Caption = 'اللقب'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FIRST_NAME'
          Title.Caption = 'الاسم'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FATHER_NAME'
          Title.Caption = 'اسم الأب'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BIRTH_DATE'
          Title.Caption = 'تاريخ الميلاد'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GENDER'
          Title.Caption = 'الجنس'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NATIONAL_ID'
          Title.Caption = 'رقم الهوية'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PHONE'
          Title.Caption = 'الهاتف'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Title.Caption = 'البريد الإلكتروني'
          Width = 200
          Visible = True
        end>
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 539
    Width = 943
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object btnNew: TBitBtn
      Left = 20
      Top = 10
      Width = 80
      Height = 30
      Caption = 'جديد'
      Glyph.Data = {DE030000424DDE03000000000000360000002800000010000000100000000100}
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnEdit: TBitBtn
      Left = 110
      Top = 10
      Width = 80
      Height = 30
      Caption = 'تعديل'
      Glyph.Data = {DE030000424DDE03000000000000360000002800000010000000100000000100}
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 200
      Top = 10
      Width = 80
      Height = 30
      Caption = 'حذف'
      Glyph.Data = {DE030000424DDE03000000000000360000002800000010000000100000000100}
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnSave: TBitBtn
      Left = 500
      Top = 10
      Width = 80
      Height = 30
      Caption = 'حفظ'
      Enabled = False
      Glyph.Data = {DE030000424DDE03000000000000360000002800000010000000100000000100}
      TabOrder = 3
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 590
      Top = 10
      Width = 80
      Height = 30
      Caption = 'إلغاء'
      Enabled = False
      Glyph.Data = {DE030000424DDE03000000000000360000002800000010000000100000000100}
      TabOrder = 4
      OnClick = btnCancelClick
    end
    object btnClose: TBitBtn
      Left = 840
      Top = 10
      Width = 80
      Height = 30
      Caption = 'إغلاق'
      Glyph.Data = {DE030000424DDE03000000000000360000002800000010000000100000000100}
      ModalResult = 2
      TabOrder = 5
      OnClick = btnCloseClick
    end
  end
  object dsCandidates: TDataSource
    Left = 800
    Top = 200
  end
  object FDQuery: TFDQuery
    Connection = DM_Main.FDConnection
    SQL.Strings = (
      'SELECT * FROM CANDIDATES')
    Left = 800
    Top = 260
  end
end
