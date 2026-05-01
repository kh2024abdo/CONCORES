object Frm_Settings: TFrm_Settings
  Left = 0
  Top = 0
  Caption = 'إعدادات النظام'
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
      Caption = 'إعدادات النظام'
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
      DataSource = dsSettings
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ARABIC_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'SETTING_KEY'
          Title.Caption = 'المفتاح'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SETTING_VALUE'
          Title.Caption = 'القيمة'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPTION'
          Title.Caption = 'الوصف'
          Width = 200
          Visible = True
        end>
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
    object btnSave: TBitBtn
      Left = 20
      Top = 10
      Width = 80
      Height = 30
      Caption = 'حفظ'
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 110
      Top = 10
      Width = 80
      Height = 30
      Caption = 'إلغاء'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnClose: TBitBtn
      Left = 620
      Top = 10
      Width = 80
      Height = 30
      Caption = 'إغلاق'
      ModalResult = 2
      TabOrder = 2
      OnClick = btnCloseClick
    end
  end
  object dsSettings: TDataSource
    Left = 600
    Top = 200
  end
  object FDQuery: TFDQuery
    Connection = DM_Main.FDConnection
    SQL.Strings = (
      'SELECT * FROM SETTINGS')
    Left = 600
    Top = 260
  end
end
