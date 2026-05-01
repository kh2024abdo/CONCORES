unit uFrm_Users;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrm_Users = class(TForm)
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
    dsUsers: TDataSource;
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
  Frm_Users: TFrm_Users;

implementation

{$R *.dfm}

uses
  uDM_Main, uFunctions, uGlobals;

procedure TFrm_Users.FormCreate(Sender: TObject);
begin
  FDQuery.Connection := DM_Main.FDConnection;
  FDQuery.SQL.Text := 'SELECT * FROM USERS ORDER BY USERNAME';
  dsUsers.DataSet := FDQuery;
  DBGrid.DataSource := dsUsers;
end;

procedure TFrm_Users.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFrm_Users.LoadData;
begin
  Screen.Cursor := crHourGlass;
  try
    FDQuery.Close;
    FDQuery.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrm_Users.btnNewClick(Sender: TObject);
begin
  FDQuery.Append;
  FDQuery.FieldByName('ID').AsInteger := DM_Main.GetNextID('SEQ_USERS');
  FDQuery.FieldByName('ROLE').AsString := 'USER';
  FDQuery.FieldByName('IS_ACTIVE').AsInteger := 1;
end;

procedure TFrm_Users.btnEditClick(Sender: TObject);
begin
  if not FDQuery.IsEmpty then
    FDQuery.Edit;
end;

procedure TFrm_Users.btnDeleteClick(Sender: TObject);
begin
  if FDQuery.IsEmpty then Exit;
  if ConfirmAction('هل أنت متأكد من الحذف؟') then
    FDQuery.Delete;
end;

procedure TFrm_Users.btnSaveClick(Sender: TObject);
begin
  if Trim(FDQuery.FieldByName('USERNAME').AsString) = '' then
  begin
    ShowWarning('يرجى إدخال اسم المستخدم!');
    Exit;
  end;
  FDQuery.FieldByName('CREATED_AT').AsDateTime := Now;
  FDQuery.Post;
  ShowInfo('تم الحفظ بنجاح!');
  LoadData;
end;

procedure TFrm_Users.btnCancelClick(Sender: TObject);
begin
  FDQuery.Cancel;
  LoadData;
end;

procedure TFrm_Users.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
