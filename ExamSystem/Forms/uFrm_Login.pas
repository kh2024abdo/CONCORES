unit uFrm_Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TFrm_Login = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    btnLogin: TButton;
    btnExit: TButton;
    chkShowPassword: TCheckBox;
    lblTitle: TLabel;
    lblSubtitle: TLabel;
    Image1: TImage;
    procedure btnLoginClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure chkShowPasswordClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtUsernameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Login: TFrm_Login;

implementation

{$R *.dfm}

uses
  uDM_Main, uGlobals, uFunctions;

procedure TFrm_Login.btnLoginClick(Sender: TObject);
begin
  if Trim(edtUsername.Text) = '' then
  begin
    ShowWarning('يرجى إدخال اسم المستخدم!');
    edtUsername.SetFocus;
    Exit;
  end;
  
  if Trim(edtPassword.Text) = '' then
  begin
    ShowWarning('يرجى إدخال كلمة المرور!');
    edtPassword.SetFocus;
    Exit;
  end;
  
  Screen.Cursor := crHourGlass;
  try
    if DM_Main.Login(edtUsername.Text, edtPassword.Text) then
    begin
      ModalResult := mrOk;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrm_Login.btnExitClick(Sender: TObject);
begin
  if ConfirmAction('هل تريد الخروج من التطبيق؟') then
  begin
    Application.Terminate;
  end;
end;

procedure TFrm_Login.chkShowPasswordClick(Sender: TObject);
begin
  if chkShowPassword.Checked then
    edtPassword.PasswordChar := #0
  else
    edtPassword.PasswordChar := '*';
end;

procedure TFrm_Login.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not gIsLoggedIn then
  begin
    CanClose := ConfirmAction('هل تريد الخروج من التطبيق؟');
  end;
end;

procedure TFrm_Login.edtUsernameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    Key := #0;
  end;
end;

end.
