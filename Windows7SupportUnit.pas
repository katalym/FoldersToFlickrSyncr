(* *

*)

unit Windows7SupportUnit;

interface

uses
  ShlObj, Forms, Windows, Vcl.DBGrids;

type
  TTaskbarProgressState = record
    Count_Indeterminate: Cardinal;
    Count_NoProgress: Cardinal;
    procedure Clear;
  end;

  ISnapshotInterface = interface
    ['{D80CA046-A76A-4855-A1DE-FC65B4E4D20F}']
    procedure Restore;
  end;

procedure AutoSizeGridColumnWidths(const aDBGrid: TDBGrid);

function HourGlass: ISnapshotInterface;

procedure InitializeWindows7Support;

function IsRunningUnderIDE: Boolean;

function OutputDebugMsgSnapShot(const aDebugString: string): ISnapshotInterface;

procedure SetTaskBarProgressState_Error(const aHandle: HWND; const aApplyToMainForm: Boolean = True);

procedure SetTaskBarProgressState_ForForm(const aHandle: HWND);

procedure SetTaskBarProgressState_Indeterminate(const aHandle: HWND; const aApplyToMainForm: Boolean = True);

procedure SetTaskBarProgressState_NoProgress(const aHandle: HWND; const aApplyToMainForm: Boolean = True);

procedure SetTaskBarProgressState_Normal(const aHandle: HWND; const aApplyToMainForm: Boolean = True);

procedure SetTaskBarProgressState_Paused(const aHandle: HWND; const aApplyToMainForm: Boolean = True);

procedure SetTaskBarProgressValue(const aHandle: HWND; const aCompleted, aTotal: UInt64; const aApplyToMainForm: Boolean = True);

var
  WM_TASKBARBUTTONCREATED: cardinal;
  GlobalTaskBarInterface: ITaskBarList3;

implementation

uses
  ComObj, ActiveX, System.Generics.Collections, System.SysUtils,
  System.Math, System.Classes, Data.DB, Vcl.Controls;

var
  FTaskbarProgressActivity: TDictionary<HWND, TTaskbarProgressState> = nil;
  vOutputDebugStringIndent: Integer = 0;

type
  TCursorSnapshot = class(TInterfacedObject, ISnapshotInterface)
  private
    FOriginalCursor: TCursor;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Restore;
  end;

  TOutputDebugStringSnapshot = class(TInterfacedObject, ISnapshotInterface)
  private
    FDebugString: string;
    FIndent: Integer;
    FStartedAt: Cardinal;
  public
    constructor Create(const aDebugString: string); reintroduce;
    destructor Destroy; override;
    procedure Restore;
  end;

constructor TCursorSnapshot.Create;
begin
  inherited Create;
  FOriginalCursor := Screen.Cursor;
end;

destructor TCursorSnapshot.Destroy;
begin
  Restore;
  inherited;
end;

procedure TCursorSnapshot.Restore;
begin
  Screen.Cursor := FOriginalCursor;
end;

function HourGlass: ISnapshotInterface;
begin
  Result := TCursorSnapshot.Create;
  Screen.Cursor := crHourGlass;
end;

function IsRunningUnderIDE: Boolean;
begin
{$WARN SYMBOL_PLATFORM OFF}
  // Show if application is running under Delphi IDE
  Result := DebugHook <> 0;
end;

procedure AutoSizeGridColumnWidths(const aDBGrid: TDBGrid);
const
  DEFBORDER = 10;
var
  i, vColumnCount, vRecNo: Integer;
  vSizes: array of Integer;
  vColIndex: array of Integer;
begin

  vColumnCount := 0;
  SetLength(vSizes, 0);
  SetLength(vColIndex, 0);
  for i := 0 to aDBGrid.Columns.Count - 1 do begin
    if aDBGrid.Columns[i].Visible then
    begin
      Inc(vColumnCount);

      SetLength(vSizes, vColumnCount);
      vSizes[vColumnCount - 1] := Max({aDBGrid.Columns[i].Width} 0, aDBGrid.Canvas.TextWidth(aDBGrid.Columns[i].Title.Caption) + DEFBORDER);

      SetLength(vColIndex, vColumnCount);
      vColIndex[vColumnCount - 1] := i;
    end;
  end;

  if vColumnCount > 0 then
  begin

    if Assigned(aDBGrid.DataSource) and Assigned(aDBGrid.DataSource.DataSet) and
       aDBGrid.DataSource.DataSet.Active and not aDBGrid.DataSource.DataSet.IsEmpty then
    begin

      aDBGrid.DataSource.DataSet.DisableControls;
      try
        vRecNo := aDBGrid.DataSource.DataSet.RecNo;
        try
          aDBGrid.DataSource.DataSet.First;
          while not aDBGrid.DataSource.DataSet.EOF do
          begin
            for i := 0 to vColumnCount - 1 do begin
              vSizes[i] := Max(vSizes[i],
                aDBGrid.Canvas.TextWidth(Trim(aDBGrid.Columns[vColIndex[i]].Field.DisplayText)) + DEFBORDER);
            end;
            aDBGrid.DataSource.DataSet.Next;
          end;

        finally
          aDBGrid.DataSource.DataSet.RecNo := vRecNo;
        end;

      finally
        aDBGrid.DataSource.DataSet.EnableControls
      end;
    end;

    for i := 0 to vColumnCount - 1 do
      aDBGrid.Columns[vColIndex[i]].Width := vSizes[i];
  end;
end;

procedure SetTaskBarProgressValue(const aHandle: HWND;
  const aCompleted, aTotal: UInt64; const aApplyToMainForm: Boolean = True);
begin
  if Assigned(GlobalTaskBarInterface) then
  begin
    GlobalTaskBarInterface.SetProgressValue(Application.MainFormHandle, aCompleted, aTotal);
    if aHandle <> 0 then
      GlobalTaskBarInterface.SetProgressValue(aHandle, aCompleted, aTotal);
  end;
end;

function GetTaskbarProgressState(const aHandle: HWND): TTaskbarProgressState;
begin
  if Assigned(FTaskbarProgressActivity) then
  begin
    if FTaskbarProgressActivity.ContainsKey(aHandle) then
    begin
      FTaskbarProgressActivity.TryGetValue(aHandle, Result);
    end else begin
      Result.Clear;
      FTaskbarProgressActivity.AddOrSetValue(aHandle, Result);
    end;
  end;
end;

procedure SetTaskBarProgressState(const aHandle: HWND; const aFlag: cardinal; const aApplyToMainForm: Boolean);
var
  vTaskbarProgressState: TTaskbarProgressState;
begin
  if Assigned(GlobalTaskBarInterface) and (aHandle <> 0) then
  begin

    if aApplyToMainForm and (aHandle <> Application.MainFormHandle) then
    begin
      SetTaskBarProgressState(Application.MainFormHandle, aFlag, False);
    end;

    if aFlag = TBPF_NOPROGRESS then
    begin
      vTaskbarProgressState := GetTaskbarProgressState(aHandle);
      vTaskbarProgressState.Count_NoProgress := vTaskbarProgressState.Count_NoProgress + 1;
      if vTaskbarProgressState.Count_NoProgress = 1 then
        GlobalTaskBarInterface.SetProgressState(aHandle, aFlag);

      if vTaskbarProgressState.Count_NoProgress = vTaskbarProgressState.Count_Indeterminate then
      begin
        FTaskbarProgressActivity.Remove(aHandle);
      end else
        FTaskbarProgressActivity.AddOrSetValue(aHandle, vTaskbarProgressState);

    end else
    if aFlag = TBPF_INDETERMINATE then
    begin
      vTaskbarProgressState := GetTaskbarProgressState(aHandle);
      vTaskbarProgressState.Count_Indeterminate := vTaskbarProgressState.Count_Indeterminate + 1;
      if vTaskbarProgressState.Count_Indeterminate = 1 then
        GlobalTaskBarInterface.SetProgressState(aHandle, aFlag);

      if vTaskbarProgressState.Count_NoProgress = vTaskbarProgressState.Count_Indeterminate then
      begin
        FTaskbarProgressActivity.Remove(aHandle);
      end else
        FTaskbarProgressActivity.AddOrSetValue(aHandle, vTaskbarProgressState);

    end else begin

      GlobalTaskBarInterface.SetProgressState(aHandle, aFlag);

    end;
  end;
end;

procedure SetTaskBarProgressState_NoProgress(const aHandle: HWND; const aApplyToMainForm: Boolean = True);
begin
  SetTaskBarProgressState(aHandle, TBPF_NOPROGRESS, aApplyToMainForm);
end;

procedure SetTaskBarProgressState_Indeterminate(const aHandle: HWND; const aApplyToMainForm: Boolean = True);
begin
  SetTaskBarProgressState(aHandle, TBPF_INDETERMINATE, aApplyToMainForm);
end;

procedure SetTaskBarProgressState_Normal(const aHandle: HWND; const aApplyToMainForm: Boolean = True);
begin
  SetTaskBarProgressState(aHandle, TBPF_NORMAL, aApplyToMainForm);
end;

procedure SetTaskBarProgressState_Error(const aHandle: HWND; const aApplyToMainForm: Boolean = True);
begin
  SetTaskBarProgressState(aHandle, TBPF_ERROR, aApplyToMainForm);
end;

procedure SetTaskBarProgressState_Paused(const aHandle: HWND; const aApplyToMainForm: Boolean = True);
begin
  SetTaskBarProgressState(aHandle, TBPF_PAUSED, aApplyToMainForm);
end;

procedure SetTaskBarProgressState_ForForm(const aHandle: HWND);
var
  vTaskbarProgressState: TTaskbarProgressState;
begin
  if Assigned(FTaskbarProgressActivity) and
     FTaskbarProgressActivity.ContainsKey(aHandle) and
     FTaskbarProgressActivity.TryGetValue(aHandle, vTaskbarProgressState) then
  begin
    if vTaskbarProgressState.Count_Indeterminate > vTaskbarProgressState.Count_NoProgress then
      GlobalTaskBarInterface.SetProgressState(aHandle, TBPF_INDETERMINATE)
    else
      GlobalTaskBarInterface.SetProgressState(aHandle, TBPF_NOPROGRESS);
  end;
end;

procedure TTaskbarProgressState.Clear;
begin
  Count_Indeterminate := 0;
  Count_NoProgress := 0;
end;

procedure InitializeWindows7Support;
begin
  CoCreateInstance(CLSID_TaskbarList, nil, CLSCTX_INPROC_SERVER,
    IID_ITaskbarList3, GlobalTaskBarInterface);
  if Assigned(GlobalTaskBarInterface) then
    GlobalTaskBarInterface.HrInit;
end;

function OutputDebugMsgSnapShot(const aDebugString: string): ISnapshotInterface;
begin
  if (aDebugString <> '') and IsRunningUnderIDE then
    Result := TOutputDebugStringSnapshot.Create(aDebugString)
  else
    Result := nil;
end;

function _GetThreadInfo: string;
var
  vThread: TThread;
begin
  vThread := TThread.CurrentThread;
  Result := 'Thread ID ' + IntToStr(vThread.ThreadID) + ' (' + vThread.ClassName + ') Main Thread ID ' + IntToStr(System.MainThreadID);
end;

constructor TOutputDebugStringSnapshot.Create(const aDebugString: string);
begin
  inherited Create;

  FStartedAt := GetTickCount;
  FDebugString := aDebugString;
  FIndent := vOutputDebugStringIndent;
  Inc(vOutputDebugStringIndent, 2);
  Windows.OutputDebugString(PWideChar(StringOfChar('-', FIndent) + '> ' + FDebugString + ' ' + _GetThreadInfo));
end;

destructor TOutputDebugStringSnapshot.Destroy;
begin
  Restore;
  FDebugString := '';
  Dec(vOutputDebugStringIndent, 2);
  inherited Destroy;
end;

procedure TOutputDebugStringSnapshot.Restore;
begin
  Windows.OutputDebugString(PWideChar(StringOfChar('-', FIndent) + '< ' + FDebugString + ' - ' + IntToStr(GetTickCount - FStartedAt) + ' ms ' + _GetThreadInfo));
end;

initialization

  FTaskbarProgressActivity := TDictionary<HWND, TTaskbarProgressState>.Create;

  InitializeWindows7Support;

finalization

  if Assigned(FTaskbarProgressActivity) then
    FreeAndNil(FTaskbarProgressActivity);

end.
