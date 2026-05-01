unit uFrm_Settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Buttons, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrm_Settings = class(TForm)
    pnlTop: TPanel;
    lblTitle: TLabel;
    pnlBottom: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    pnlCenter: TPanel;
    DBGrid: TDBGrid;
    dsSettings: TDataSource;
    FDQuery: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    procedure LoadData;
  public
  end;

var
  Frm_Settings: TFrm_Settings;

implementation

{$R *.dfm}

uses
  uDM_Main, uFunctions;

procedure TFrm_Settings.FormCreate(Sender: TObject);
begin
  FDQuery.Connection := DM_Main.FDConnection;
  FDQuery.SQL.Text := 'SELECT * FROM SETTINGS ORDER BY SETTING_KEY';
  dsSettings.DataSet := FDQuery;
  DBGrid.DataSource := dsSettings;
end;

procedure TFrm_Settings.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFrm_Settings.LoadData;
begin
  Screen.Cursor := crHourGlass;
  try
    FDQuery.Close;
    FDQuery.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrm_Settings.btnSaveClick(Sender: TObject);
begin
  try
    if FDQuery.State in [dsInsert, dsEdit] then
    begin
      FDQuery.Post;
      ShowInfo('تم الحفظ بنجاح!');
    end;
    LoadData;
  except
    on E: Exception do
      ShowError('خطأ في الحفظ: ' + E.Message);
  end;
end;

procedure TFrm_Settings.btnCancelClick(Sender: TObject);
begin
  if FDQuery.State in [dsInsert, dsEdit] then
    FDQuery.Cancel;
  LoadData;
end;

procedure TFrm_Settings.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
