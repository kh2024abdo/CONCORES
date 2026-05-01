object Frm_Login: TFrm_Login
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'تسجيل الدخول - نظام إدارة الامتحانات'
  ClientHeight = 320
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 19
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 480
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Color = clDarkBlue
    ParentBackground = False
    TabOrder = 0
    object lblTitle: TLabel
      Left = 24
      Top = 16
      Width = 280
      Height = 24
      Caption = 'نظام إدارة الامتحانات'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubtitle: TLabel
      Left = 24
      Top = 48
      Width = 200
      Height = 19
      Caption = 'وزارة التعليم العالي والبحث العلمي'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 80
    Width = 480
    Height = 240
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Image1: TImage
      Left = 360
      Top = 40
      Width = 100
      Height = 100
      Picture.Data = {053A54466F726D5069637475726500000000}
      Stretch = True
    end
    object Label1: TLabel
      Left = 80
      Top = 40
      Width = 100
      Height = 19
      Caption = 'اسم المستخدم:'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 80
      Top = 96
      Width = 90
      Height = 19
      Caption = 'كلمة المرور:'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object edtUsername: TEdit
      Left = 200
      Top = 37
      Width = 220
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edtUsernameKeyPress
    end
    object edtPassword: TEdit
      Left = 200
      Top = 93
      Width = 220
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      OnKeyPress = edtUsernameKeyPress
    end
    object btnLogin: TButton
      Left = 200
      Top = 152
      Width = 100
      Height = 35
      Caption = 'دخول'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 3
      OnClick = btnLoginClick
    end
    object btnExit: TButton
      Left = 320
      Top = 152
      Width = 100
      Height = 35
      Caption = 'خروج'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 4
      OnClick = btnExitClick
    end
    object chkShowPassword: TCheckBox
      Left = 200
      Top = 128
      Width = 150
      Height = 20
      Caption = 'إظهار كلمة المرور'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = chkShowPasswordClick
    end
  end
end
