unit uFrm_Candidates;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Comp.UIComponent, FireDAC.Comp.Container;

type
  TFrm_Candidates = class(TForm)
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
    dsCandidates: TDataSource;
    FDQuery: TFDQuery;
    pnlSearch: TPanel;
    lblSearch: TLabel;
    edtSearch: TEdit;
    btnSearch: TBitBtn;
    chkActiveOnly: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure chkActiveOnlyClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    FIsEditing: Boolean;
    procedure LoadData;
    procedure EnableControls(AEnabled: Boolean);
    procedure ClearSearch;
  public
    { Public declarations }
  end;

var
  Frm_Candidates: TFrm_Candidates;

implementation

{$R *.dfm}

uses
  uDM_Main, uFunctions, uGlobals;

procedure TFrm_Candidates.FormCreate(Sender: TObject);
begin
  FIsEditing := False;
  // Setup query
  FDQuery.Connection := DM_Main.FDConnection;
  FDQuery.SQL.Text := 'SELECT * FROM CANDIDATES ORDER BY LAST_NAME, FIRST_NAME';
  dsCandidates.DataSet := FDQuery;
  DBGrid.DataSource := dsCandidates;
end;

procedure TFrm_Candidates.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFrm_Candidates.LoadData;
begin
  Screen.Cursor := crHourGlass;
  try
    FDQuery.Close;
    FDQuery.SQL.Text := 'SELECT * FROM CANDIDATES';
    if chkActiveOnly.Checked then
      FDQuery.SQL.Text := FDQuery.SQL.Text + ' WHERE IS_ACTIVE = 1';
    FDQuery.SQL.Text := FDQuery.SQL.Text + ' ORDER BY LAST_NAME, FIRST_NAME';
    FDQuery.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrm_Candidates.EnableControls(AEnabled: Boolean);
begin
  btnNew.Enabled := AEnabled;
  btnEdit.Enabled := AEnabled;
  btnDelete.Enabled := AEnabled;
  btnSearch.Enabled := AEnabled;
  edtSearch.Enabled := AEnabled;
  chkActiveOnly.Enabled := AEnabled;
  DBGrid.Enabled := AEnabled;
  btnSave.Enabled := not AEnabled;
  btnCancel.Enabled := not AEnabled;
end;

procedure TFrm_Candidates.ClearSearch;
begin
  edtSearch.Text := '';
  LoadData;
end;

procedure TFrm_Candidates.btnNewClick(Sender: TObject);
begin
  FDQuery.Append;
  FIsEditing := True;
  EnableControls(False);
  edtSearch.SetFocus;
end;

procedure TFrm_Candidates.btnEditClick(Sender: TObject);
begin
  if FDQuery.IsEmpty then
  begin
    ShowWarning('لا توجد سجلات للتعديل!');
    Exit;
  end;
  
  FDQuery.Edit;
  FIsEditing := True;
  EnableControls(False);
end;

procedure TFrm_Candidates.btnDeleteClick(Sender: TObject);
begin
  if FDQuery.IsEmpty then
  begin
    ShowWarning('لا توجد سجلات للحذف!');
    Exit;
  end;
  
  if ConfirmAction('هل أنت متأكد من حذف هذا السجل؟') then
  begin
    try
      FDQuery.Delete;
      ShowInfo('تم الحذف بنجاح!');
    except
      on E: Exception do
        ShowError('خطأ في الحذف: ' + E.Message);
    end;
  end;
end;

procedure TFrm_Candidates.btnSaveClick(Sender: TObject);
var
  LID: Integer;
begin
  // Validate required fields
  if Trim(FDQuery.FieldByName('LAST_NAME').AsString) = '' then
  begin
    ShowWarning('يرجى إدخال اللقب!');
    FDQuery.FieldByName('LAST_NAME').FocusControl;
    Exit;
  end;
  
  if Trim(FDQuery.FieldByName('FIRST_NAME').AsString) = '' then
  begin
    ShowWarning('يرجى إدخال الاسم!');
    FDQuery.FieldByName('FIRST_NAME').FocusControl;
    Exit;
  end;
  
  try
    if FDQuery.State in [dsInsert, dsEdit] then
    begin
      if FDQuery.FieldByName('ID').IsNull then
      begin
        LID := DM_Main.GetNextID('SEQ_CANDIDATES');
        FDQuery.FieldByName('ID').AsInteger := LID;
      end;
      
      FDQuery.FieldByName('UPDATED_AT').AsDateTime := Now;
      if FDQuery.FieldByName('CREATED_AT').IsNull then
        FDQuery.FieldByName('CREATED_AT').AsDateTime := Now;
        
      FDQuery.Post;
      DM_Main.RefreshQuery(FDQuery);
      ShowInfo('تم الحفظ بنجاح!');
    end;
    
    FIsEditing := False;
    EnableControls(True);
  except
    on E: Exception do
    begin
      ShowError('خطأ في الحفظ: ' + E.Message);
      FDQuery.Cancel;
    end;
  end;
end;

procedure TFrm_Candidates.btnCancelClick(Sender: TObject);
begin
  if FDQuery.State in [dsInsert, dsEdit] then
    FDQuery.Cancel;
    
  FIsEditing := False;
  EnableControls(True);
  LoadData;
end;

procedure TFrm_Candidates.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Candidates.btnSearchClick(Sender: TObject);
var
  LSearch: string;
begin
  LSearch := Trim(edtSearch.Text);
  if LSearch = '' then
  begin
    LoadData;
    Exit;
  end;
  
  Screen.Cursor := crHourGlass;
  try
    FDQuery.Close;
    FDQuery.SQL.Text := 'SELECT * FROM CANDIDATES WHERE ' +
                        'LAST_NAME LIKE :SEARCH OR ' +
                        'FIRST_NAME LIKE :SEARCH OR ' +
                        'FATHER_NAME LIKE :SEARCH OR ' +
                        'NATIONAL_ID LIKE :SEARCH';
    if chkActiveOnly.Checked then
      FDQuery.SQL.Text := FDQuery.SQL.Text + ' AND IS_ACTIVE = 1';
    FDQuery.SQL.Text := FDQuery.SQL.Text + ' ORDER BY LAST_NAME, FIRST_NAME';
    FDQuery.ParamByName('SEARCH').AsString := '%' + LSearch + '%';
    FDQuery.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrm_Candidates.edtSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnSearchClick(nil);
    Key := #0;
  end;
end;

procedure TFrm_Candidates.chkActiveOnlyClick(Sender: TObject);
begin
  LoadData;
end;

procedure TFrm_Candidates.DBGridDblClick(Sender: TObject);
begin
  if not FIsEditing and (not FDQuery.IsEmpty) then
  begin
    btnEditClick(nil);
  end;
end;

end.
