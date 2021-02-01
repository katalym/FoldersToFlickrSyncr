unit FoldersToFlickrSyncrMessageDialogFrm;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Menus, Vcl.ActnPopup, Vcl.PlatformDefaultStyleActnCtrls;

type
  TCustomMessageForm = class(TForm)
    btnAutoClose: TSpeedButton;
    imaImage: TImage;
    lblMessage: TLabel;
    mniCopyToClipboard: TMenuItem;
    mnuPopup: TPopupActionBar;
    pnlButtons: TPanel;
    scbMessage: TScrollBox;
    tmrAutoClose: TTimer;
    procedure btnAutoCloseClick(Sender: TObject);
    procedure mniCopyToClipboardClick(Sender: TObject);
    procedure tmrAutoCloseTimer(Sender: TObject);
  protected
    FAutoCloseModalResult: integer;
    FAutoCloseTime: Cardinal;
    procedure CustomKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function GetFormText: String;
    procedure WriteToClipBoard(Text: String);
  end;

procedure CenterInOwnerForm(const aSubForm, aOwnerForm: TForm);

function CustomMessageDlg(
  const AOwner: TForm;
  const aMsg: string;
  const aDlgType: TMsgDlgType;
  const aButtons: TMsgDlgButtons;
  const aDefaultButton: TMsgDlgBtn = mbOK;
  const aAutoCloseTime: Cardinal = 0): TModalResult;

implementation

uses
  Vcl.Clipbrd, Consts, System.Math, Windows7SupportUnit;

{$R *.dfm}

const
  spbCaption = 'Click to Cancel - Close in %d secs';

var
  ModalResults: array[TMsgDlgBtn] of Integer = (
    mrYes, mrNo, mrOk, mrCancel, mrAbort, mrRetry, mrIgnore, mrAll, mrNoToAll,
    mrYesToAll, 0, mrClose);
  ButtonCaptions: array[TMsgDlgBtn] of Pointer = (
    @SMsgDlgYes, @SMsgDlgNo, @SMsgDlgOK, @SMsgDlgCancel, @SMsgDlgAbort,
    @SMsgDlgRetry, @SMsgDlgIgnore, @SMsgDlgAll, @SMsgDlgNoToAll, @SMsgDlgYesToAll,
    @SMsgDlgHelp, @SMsgDlgClose);
  IconIDs: array[TMsgDlgType] of PChar = (IDI_EXCLAMATION, IDI_HAND,
    IDI_ASTERISK, IDI_QUESTION, nil);
  ButtonWidths : array[TMsgDlgBtn] of Integer = (
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Captions: array[TMsgDlgType] of Pointer = (@SMsgDlgWarning, @SMsgDlgError,
    @SMsgDlgInformation, @SMsgDlgConfirm, nil);
  ButtonKind: array[TMsgDlgBtn] of TBitBtnKind = (
    bkYes, bkNo, bkOK, bkCancel, bkAbort, bkRetry, bkIgnore, bkAll, bkCustom,
    bkCustom, bkCustom, bkClose);

function bvCreateMessageDialog(
  const aOwnerForm: TForm;
  const aMsg: string;
  const aDlgType: TMsgDlgType;
  const aButtons: TMsgDlgButtons;
  const aDefaultButton: TMsgDlgBtn;
  const aAutoCloseTime: Cardinal = 0): TCustomMessageForm;

  function _GetFormMonitorByPosition(const aForm: TForm): Integer;
  var
    i: Integer;
  begin
    Result := 0;
    for i := 0 to Screen.MonitorCount - 1 do
      if (aForm.Left >= Screen.Monitors[i].Left) and (aForm.Left <= Screen.Monitors[i].Left + Screen.Monitors[i].Width) and
         (aForm.Top >= Screen.Monitors[i].Top) and (aForm.Top <= Screen.Monitors[i].Top + Screen.Monitors[i].Height) then
      begin
        Result := i;
        Break;
      end;
  end;

const { do not translate - these are the names of components}
  ButtonNames: array[TMsgDlgBtn] of string = (
    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'NoToAll',
    'YesToAll', 'Help', 'Close');

  function _GetAveCharSize(Canvas: TCanvas): TPoint;
  var
    i: Integer;
    vBuffer: array[0..51] of Char;
  begin
    for i := 0 to 25 do vBuffer[i] := Chr(i + Ord('A'));
    for i := 0 to 25 do vBuffer[i + 26] := Chr(i + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, vBuffer, 52, TSize(Result));
    Result.X := Result.X div 52;
  end;

const
  mcHorzMargin = 8;
  mcVertMargin = 8;
  mcHorzSpacing = 10;
  mcVertSpacing = 10;
  mcButtonWidth = 50;
  mcButtonHeight = 14;
  mcButtonSpacing = 4;
  bvBitBtn_ExpectedGlyphSize = 18;
  bvBitBtn_ExpectedButtonCaptionSpacing = 20;
  bvBitBtn_MinimalButtonWidth = 65;
var
  vDialogUnits: TPoint;
  vHorzMargin, vVertMargin, vHorzSpacing, vVertSpacing,
  vButtonHeight, vButtonSpacing, vButtonCount, vButtonGroupWidth, vMonitor, vLeftGap, vTopGap,
  vTextWidth, vTextHeight, vXpos, vLeft, vNewButtonWidth, vMaxClientWidth, vAutoCloseLabelWidth: Integer;
  vBtn, vCancelButton: TMsgDlgBtn;
  vIconID: PChar;
  vTextRect: TRect;
  vButton: TBitBtn;
begin
  Result := TCustomMessageForm.Create(Application);
  Result.BiDiMode := Application.BiDiMode;
  Result.BorderStyle := bsDialog;
  Result.Canvas.Font := Result.Font;
  Result.KeyPreview := True;
  Result.PopupMode := pmAuto;
  Result.Position := poDesigned;
  Result.OnKeyDown := TCustomMessageForm(Result).CustomKeyDown;
  vDialogUnits := _GetAveCharSize(Result.Canvas);
  vHorzMargin := MulDiv(mcHorzMargin, vDialogUnits.X, 4);
  vVertMargin := MulDiv(mcVertMargin, vDialogUnits.Y, 8);
  vHorzSpacing := MulDiv(mcHorzSpacing, vDialogUnits.X, 4);
  vVertSpacing := MulDiv(mcVertSpacing, vDialogUnits.Y, 8);
  vButtonGroupWidth := 0;
  vButtonCount := 0;
  for vBtn in aButtons do begin
    inc (vButtonCount);
    if ButtonWidths[vBtn] = 0 then
    begin
      vTextRect := Rect(0,0,0,0);
      WinApi.Windows.DrawText(Result.Canvas.Handle,
        PChar(LoadResString(ButtonCaptions[vBtn])), -1,
        vTextRect, DT_CALCRECT or DT_LEFT or DT_SINGLELINE or
        Result.DrawTextBiDiModeFlagsReadingOnly);
      ButtonWidths[vBtn] := Max(bvBitBtn_MinimalButtonWidth,
        vTextRect.Right - vTextRect.Left + bvBitBtn_ExpectedButtonCaptionSpacing);
    end;
    vButtonGroupWidth := vButtonGroupWidth + ButtonWidths[vBtn]{ + bvBitBtn_ExpectedGlyphSize};
  end;

  vButtonHeight := MulDiv(mcButtonHeight, vDialogUnits.Y, 8);
  vButtonSpacing := MulDiv(mcButtonSpacing, vDialogUnits.X, 4);
  vIconID := IconIDs[aDlgType];
  Result.lblMessage.Caption := aMsg;
  vTextWidth := Result.lblMessage.Width;
  vTextHeight := Result.lblMessage.Height;
  Result.imaImage.Visible := Assigned(vIconID);
  vTextHeight := Max(vTextHeight, 32);

  if aAutoCloseTime > 0 then
  begin
    Result.btnAutoClose.Caption := Format(spbCaption, [aAutoCloseTime div 1000]);
    Result.btnAutoClose.Left := vButtonSpacing;
    Result.btnAutoClose.Top := (Result.pnlButtons.Height - Result.btnAutoClose.Height) div 2;
    vAutoCloseLabelWidth := Result.btnAutoClose.Width + (vButtonSpacing * 2);
    Result.FAutoCloseModalResult := ModalResults[aDefaultButton];
    Result.FAutoCloseTime := aAutoCloseTime;
  end else
    vAutoCloseLabelWidth := 0;

  if vButtonCount <> 0 then
    vButtonGroupWidth := vButtonGroupWidth + vButtonSpacing * (vButtonCount - 1);

  Result.ClientWidth := Max(vTextWidth + IfThen(Result.imaImage.Visible,
    Result.imaImage.Width + Result.imaImage.Margins.Left + Result.imaImage.Margins.Right, 0), vButtonGroupWidth + vAutoCloseLabelWidth) + vHorzMargin * 2;
  Result.ClientHeight := vTextHeight + Result.pnlButtons.Height + vVertMargin * 2;

  if Assigned(aOwnerForm) and (aOwnerForm.FormStyle = fsStayOnTop) then
  begin
    Result.FormStyle := fsStayOnTop;
  end;

  CenterInOwnerForm(Result, aOwnerForm);
  vMonitor := _GetFormMonitorByPosition(Result);
  // limit total size to 2/3 of the monitor
  vMaxClientWidth := (Screen.Monitors[vMonitor].Width * 66) div 100;
  if Result.ClientWidth > vMaxClientWidth then
  begin
    Result.lblMessage.Width := Result.lblMessage.Width - Result.ClientWidth + vMaxClientWidth;
    Result.lblMessage.WordWrap := True;
    vTextHeight := Result.lblMessage.Height;
    Result.ClientHeight := vTextHeight + Result.pnlButtons.Height + vVertMargin * 2;
  end;

  Result.ClientWidth := Min(Result.ClientWidth, vMaxClientWidth);
  Result.ClientHeight := Min(Result.ClientHeight, (Screen.Monitors[vMonitor].Height * 66) div 100);
  Result.Left := (Screen.Monitors[vMonitor].Width div 2) - (Result.Width div 2);
  Result.Top := (Screen.Monitors[vMonitor].Height div 2) - (Result.Height div 2);
  // center it again to accept changes in size
  CenterInOwnerForm(Result, aOwnerForm);

  vLeftGap := (Screen.Monitors[vMonitor].Width * 3) div 100;
  vTopGap  := (Screen.Monitors[vMonitor].Height * 3) div 100;
  if (Result.Width > (Screen.Monitors[vMonitor].Width - 2 * vLeftGap)) then begin
    Result.Width := Screen.Monitors[vMonitor].Width - 2 * vLeftGap;
    Result.Left := Screen.Monitors[vMonitor].Left + vLeftGap;
  end;
  if (Result.Height > (Screen.Monitors[vMonitor].Height - 2 * vTopGap)) then begin
    Result.Height := Screen.Monitors[vMonitor].Height - 2 * vTopGap;
    Result.Top := Screen.Monitors[vMonitor].Top + vTopGap;
  end;

  if aDlgType <> mtCustom then
    Result.Caption := LoadResString(Captions[aDlgType])
  else
    Result.Caption := Application.Title;

  if vIconID <> nil then
  begin
    Result.imaImage.Picture.Icon.Handle := LoadIcon(0, vIconID);
  end;

  //Result.FMessageLabel.Caption := aMsg;
  Result.lblMessage.BiDiMode := Result.BiDiMode;
  if Result.scbMessage.Width > vTextWidth then
  begin
    Result.lblMessage.Left := (Result.scbMessage.Width - vTextWidth) div 2;
    if Result.lblMessage.UseRightToLeftAlignment then
      Result.lblMessage.Left := Result.ClientWidth - vLeft - Result.lblMessage.Width;
  end;

  if mbCancel in aButtons then vCancelButton := mbCancel else
    if mbNo in aButtons then vCancelButton := mbNo else
      vCancelButton := mbOk;
//  vXpos := (Result.ClientWidth - vButtonGroupWidth) div 2;
  vXpos := Result.ClientWidth - vButtonGroupWidth - vButtonSpacing;
  //vButtonGroupWidth := 0;
  for vBtn in aButtons do begin
    //vButton := TButton.Create(Result);
    vButton := TBitBtn.Create(Result.pnlButtons);
    vButton.Name := ButtonNames[vBtn];
    vButton.Parent := Result.pnlButtons;
    vButton.Caption := LoadResString(ButtonCaptions[vBtn]);
    vButton.Kind := ButtonKind[vBtn];
    vButton.ModalResult := ModalResults[vBtn];
    if vBtn = aDefaultButton then
    begin
      vButton.Default := True;
      Result.ActiveControl := vButton;
    end;
    if vBtn = vCancelButton then
      vButton.Cancel := True;
    vNewButtonWidth := ButtonWidths[vBtn];
    if Assigned(vButton.Glyph) and not vButton.Glyph.Empty then
    begin
      vButton.Glyph := nil;
      //inc(vNewButtonWidth, bvBitBtn_ExpectedGlyphSize);
    end;
    //vButtonGroupWidth := vButtonGroupWidth + vNewButtonWidth;
    vButton.SetBounds(vXpos, 8 {vIconTextHeight + vVertMargin + vVertSpacing},
      vNewButtonWidth, vButtonHeight);
    Inc(vXpos, vNewButtonWidth + vButtonSpacing);
  end;

  // code below is not working - nice if it will be
  //vButtonGroupWidth := vButtonGroupWidth + vButtonSpacing * (vButtonCount - 1);
  //ClientWidth := Max(vIconTextWidth, vButtonGroupWidth) + vHorzMargin * 2;
end;

procedure CenterInOwnerForm(const aSubForm, aOwnerForm: TForm);
var
  vActiveForm: TForm;
begin
  if Assigned(ASubForm) then begin
    if not Assigned(aOwnerForm) then begin
      vActiveForm := Screen.ActiveForm;
      if not Assigned(vActiveForm) then begin
        aSubForm.Position := poScreenCenter;
        Exit;
      end;
    end else
      vActiveForm := aOwnerForm;

    aSubForm.Position := poDesigned;

    aSubForm.Left := vActiveForm.Left + (vActiveForm.Width - aSubForm.Width) div 2;
    aSubForm.Top := vActiveForm.Top + (vActiveForm.Height - aSubForm.Height) div 2;

    if aSubForm.Left + aSubForm.Width > vActiveForm.Monitor.Left + vActiveForm.Monitor.Width then
      aSubForm.Left := vActiveForm.Monitor.Left +
        vActiveForm.Monitor.Width - aSubForm.Width;
    if aSubForm.Top + aSubForm.Height > vActiveForm.Monitor.Top + vActiveForm.Monitor.Height then
      aSubForm.Top := vActiveForm.Monitor.Top +
        vActiveForm.Monitor.Height - aSubForm.Height;

    if aSubForm.Left < vActiveForm.Monitor.Left then
      aSubForm.Left := vActiveForm.Left;
    if aSubForm.Top < vActiveForm.Monitor.Top then
      aSubForm.Top := vActiveForm.Top;

    // this will keep proper form's monitor number
    //SendMessage(aSubForm.Handle, BVM_BVSFORM_UPDATEINTERNALFORMBOUNDARIES, 0, 0);
  end;
end;

function CustomMessageDlg(
  const AOwner: TForm;
  const aMsg: string;
  const aDlgType: TMsgDlgType;
  const aButtons: TMsgDlgButtons;
  const aDefaultButton: TMsgDlgBtn = mbOK;
  const aAutoCloseTime: Cardinal = 0): TModalResult;
const
  CShift40: integer = 40;
var
  vShift40: integer;
  vMessage: TCustomMessageForm;
  vOwnerForm, vActiveForm: TForm;
  i: Integer;
  vDefaultButton: TMsgDlgBtn;
begin

  if not Assigned(AOwner) then
    vOwnerForm := Screen.ActiveForm
  else
    vOwnerForm := AOwner;

  if aDlgType = mtError then
    SetTaskBarProgressState_Error(vOwnerForm.Handle)
  else
    SetTaskBarProgressState_Paused(vOwnerForm.Handle);

  // set active form to Owner - so created dialog will be placed on proper monitor (Delphi 7)
  vActiveForm := Screen.ActiveForm;
  if Assigned(vOwnerForm) and (vOwnerForm.Visible) and vOwnerForm.CanFocus then
    WinApi.Windows.SetFocus(vOwnerForm.Handle);
  try

    vDefaultButton := aDefaultButton;
    if not (vDefaultButton in aButtons) then
    begin
      if mbOk in aButtons then
      begin
        vDefaultButton := mbOk;
      end else begin
        if mbYes in aButtons then
        begin
          vDefaultButton := mbYes;
        end else begin
          for vDefaultButton := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do begin
            if vDefaultButton in aButtons then
               Break;
          end;
        end;
      end;
    end;

//    Result := ModalResults[vDefaultButton];

    vMessage := bvCreateMessageDialog(vOwnerForm, aMsg, //UnStacktracedMessage(aMsg),
      aDlgType, aButtons, vDefaultButton, aAutoCloseTime);

    try

      vShift40 := CShift40 * vMessage.Monitor.PixelsPerInch div 96;

      for i := 0 to vMessage.ComponentCount - 1 do begin
        if (vMessage.Components[i] is TBitBtn) then begin
          if ((vMessage.Components[i] as TBitBtn).Top > (vMessage.ClientHeight - vShift40)) then begin
            (vMessage.Components[i] as TBitBtn).Top := vMessage.ClientHeight - vShift40;
          end;
        end;
      end;

      vMessage.tmrAutoClose.Enabled := aAutoCloseTime > 0;
      vMessage.btnAutoClose.Visible := aAutoCloseTime > 0;

      Result := vMessage.ShowModal;

      if Assigned(vOwnerForm) and not (csDestroying in vOwnerForm.ComponentState) then
        vOwnerForm.Repaint;

    finally
      vMessage.Free;
    end;

  finally
    if Assigned(vActiveForm) and vActiveForm.Enabled and vActiveForm.Visible and vActiveForm.CanFocus then
      WinApi.Windows.SetFocus(vActiveForm.Handle);
  end;

  SetTaskBarProgressState_NoProgress(vOwnerForm.Handle);

end;

function GetOwnerFormForComponent(
  const aComponent: TComponent;
  const aStartScanFromOwner: Boolean = False): TForm;
var
  vComponent: TComponent;
begin
  // often we need to define owner of active component (frame or ...)
  // to set proper Owner for new auxiliary form (wizards, messages and etc)

  Result := nil;

  if aStartScanFromOwner and Assigned(aComponent) then
    vComponent := aComponent.Owner
  else
    vComponent := aComponent;

  while Assigned(vComponent) and
    (vComponent is TComponent) and
    not (vComponent is TForm) do begin
    vComponent := vComponent.Owner;
  end;

  if Assigned(vComponent) and (vComponent is TForm) then
    Result := vComponent as TForm;

end;

procedure TCustomMessageForm.btnAutoCloseClick(Sender: TObject);
begin
  tmrAutoClose.Enabled := False;
  (Sender as TSpeedButton).Visible := False;
end;

procedure TCustomMessageForm.CustomKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = Word('C')) then
  begin
    Beep;
    WriteToClipBoard(GetFormText);
  end;
end;

function TCustomMessageForm.GetFormText: String;
var
  vDividerLine, vButtonCaptions: string;
  I: integer;
begin
  vDividerLine := StringOfChar('-', 27) + sLineBreak;
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TBitBtn then
      vButtonCaptions := vButtonCaptions + TBitBtn(Components[I]).Caption +
        StringOfChar(' ', 3);
  vButtonCaptions := StringReplace(vButtonCaptions,'&','', [rfReplaceAll]);
  Result := Format('%s%s%s%s%s%s%s%s%s%s', [vDividerLine, Caption, sLineBreak,
    vDividerLine, lblMessage.Caption, sLineBreak, vDividerLine, vButtonCaptions,
    sLineBreak, vDividerLine]);
end;

procedure TCustomMessageForm.mniCopyToClipboardClick(Sender: TObject);
begin
  VCL.Clipbrd.Clipboard.AsText := lblMessage.Caption;
end;

procedure TCustomMessageForm.tmrAutoCloseTimer(Sender: TObject);
begin
  FAutoCloseTime := FAutoCloseTime - tmrAutoClose.Interval;
  if FAutoCloseTime > 0 then
  begin
    btnAutoClose.Caption := Format(spbCaption, [fAutoCloseTime div 1000]);
  end else begin
    ModalResult := FAutoCloseModalResult;
  end;
end;

procedure TCustomMessageForm.WriteToClipBoard(Text: String);
var
  Data: THandle;
  DataPtr: Pointer;
begin
  if OpenClipBoard(0) then
  begin
    try

      Data := GlobalAlloc(GMEM_MOVEABLE+GMEM_DDESHARE, ByteLength(Text) + SizeOf(Char));
      try
        DataPtr := GlobalLock(Data);
        try
          Move(PChar(Text)^, DataPtr^, ByteLength(Text) + SizeOf(Char));
          EmptyClipBoard;
          SetClipboardData(CF_UNICODETEXT, Data);
        finally
          GlobalUnlock(Data);
        end;
      except
        GlobalFree(Data);
        raise;
      end;
    finally
      CloseClipBoard;
    end;
  end
  else
    raise Exception.Create('CannotOpenClipboard');
end;

end.
