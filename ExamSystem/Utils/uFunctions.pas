unit uFunctions;

interface

uses
  System.SysUtils, System.DateUtils, Vcl.Dialogs, Data.DB;

// String Functions
function TrimStr(const AStr: string): string;
function NullToEmpty(const AStr: string): string;
function EmptyToNull(const AStr: string): string;
function FormatDate(const ADate: TDateTime): string;
function FormatNumber(const ANumber: Double; ADigits: Integer = 2): string;
function GenerateCode(const APrefix: string; AID: Integer): string;

// Number Functions
function StrToIntDef(const AStr: string; ADefault: Integer): Integer;
function StrToFloatDef(const AStr: string; ADefault: Double): Double;
function RoundToDigits(const AValue: Double; ADigits: Integer): Double;

// Date Functions
function GetCurrentDate: TDateTime;
function GetCurrentYear: Integer;
function StartOfYear(AYear: Integer): TDateTime;
function EndOfYear(AYear: Integer): TDateTime;

// Database Functions
function FieldAsString(AField: TField): string;
function FieldAsInteger(AField: TField): Integer;
function FieldAsDouble(AField: TField): Double;
function FieldAsDateTime(AField: TField): TDateTime;
function FieldAsBoolean(AField: TField): Boolean;

// Validation Functions
function IsValidEmail(const AEmail: string): Boolean;
function IsValidPhone(const APhone: string): Boolean;
function IsValidDate(const ADate: TDateTime): Boolean;

// UI Functions
procedure ShowInfo(const AMessage: string);
procedure ShowWarning(const AMessage: string);
procedure ShowError(const AMessage: string);
function ConfirmAction(const AMessage: string): Boolean;

// File Functions
function GetAppPath: string;
function GetReportsPath: string;
function GetExportPath: string;

implementation

function TrimStr(const AStr: string): string;
begin
  if AStr = '' then
    Result := ''
  else
    Result := Trim(AStr);
end;

function NullToEmpty(const AStr: string): string;
begin
  if AStr = '' then
    Result := ''
  else
    Result := AStr;
end;

function EmptyToNull(const AStr: string): string;
begin
  if Trim(AStr) = '' then
    Result := ''
  else
    Result := AStr;
end;

function FormatDate(const ADate: TDateTime): string;
begin
  if ADate = 0 then
    Result := ''
  else
    Result := FormatDateTime('yyyy/mm/dd', ADate);
end;

function FormatNumber(const ANumber: Double; ADigits: Integer = 2): string;
begin
  Result := FloatToStrF(ANumber, ffFixed, 15, ADigits);
end;

function GenerateCode(const APrefix: string; AID: Integer): string;
begin
  Result := APrefix + Format('%.6d', [AID]);
end;

function StrToIntDef(const AStr: string; ADefault: Integer): Integer;
begin
  try
    Result := System.StrToInt(AStr);
  except
    Result := ADefault;
  end;
end;

function StrToFloatDef(const AStr: string; ADefault: Double): Double;
begin
  try
    Result := System.StrToFloat(AStr);
  except
    Result := ADefault;
  end;
end;

function RoundToDigits(const AValue: Double; ADigits: Integer): Double;
var
  Factor: Double;
begin
  Factor := Power(10, ADigits);
  Result := Round(AValue * Factor) / Factor;
end;

function GetCurrentDate: TDateTime;
begin
  Result := Now;
end;

function GetCurrentYear: Integer;
begin
  Result := YearOf(Now);
end;

function StartOfYear(AYear: Integer): TDateTime;
begin
  Result := EncodeDate(AYear, 1, 1);
end;

function EndOfYear(AYear: Integer): TDateTime;
begin
  Result := EncodeDate(AYear, 12, 31);
end;

function FieldAsString(AField: TField): string;
begin
  if AField.IsNull then
    Result := ''
  else
    Result := AField.AsString;
end;

function FieldAsInteger(AField: TField): Integer;
begin
  if AField.IsNull then
    Result := 0
  else
    Result := AField.AsInteger;
end;

function FieldAsDouble(AField: TField): Double;
begin
  if AField.IsNull then
    Result := 0
  else
    Result := AField.AsFloat;
end;

function FieldAsDateTime(AField: TField): TDateTime;
begin
  if AField.IsNull then
    Result := 0
  else
    Result := AField.AsDateTime;
end;

function FieldAsBoolean(AField: TField): Boolean;
begin
  if AField.IsNull then
    Result := False
  else
    Result := AField.AsBoolean;
end;

function IsValidEmail(const AEmail: string): Boolean;
begin
  Result := (Pos('@', AEmail) > 0) and (Pos('.', AEmail) > Pos('@', AEmail));
end;

function IsValidPhone(const APhone: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  if Length(APhone) < 8 then Exit;
  for I := 1 to Length(APhone) do
  begin
    if not (APhone[I] in ['0'..'9', '+', '-', ' ', '(' , ')']) then Exit;
  end;
  Result := True;
end;

function IsValidDate(const ADate: TDateTime): Boolean;
begin
  Result := (ADate >= EncodeDate(1900, 1, 1)) and (ADate <= EncodeDate(2100, 12, 31));
end;

procedure ShowInfo(const AMessage: string);
begin
  MessageDlg(AMessage, mtInformation, [mbOK], 0);
end;

procedure ShowWarning(const AMessage: string);
begin
  MessageDlg(AMessage, mtWarning, [mbOK], 0);
end;

procedure ShowError(const AMessage: string);
begin
  MessageDlg(AMessage, mtError, [mbOK], 0);
end;

function ConfirmAction(const AMessage: string): Boolean;
begin
  Result := MessageDlg(AMessage, mtConfirmation, mbYesNo, 0) = mrYes;
end;

function GetAppPath: string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

function GetReportsPath: string;
begin
  Result := GetAppPath + 'Reports\';
  if not DirectoryExists(Result) then
    CreateDir(Result);
end;

function GetExportPath: string;
begin
  Result := GetAppPath + 'Export\';
  if not DirectoryExists(Result) then
    CreateDir(Result);
end;

end.
