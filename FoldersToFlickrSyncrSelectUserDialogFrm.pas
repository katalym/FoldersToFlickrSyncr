unit FoldersToFlickrSyncrSelectUserDialogFrm;

interface

uses
  System.SysUtils, System.Classes, FoldersToFlickrSyncrSupportUnit,
  Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls;

type
  TSelectUserDialogForm = class(TForm)
    btnCancel: TBitBtn;
    btnOK: TBitBtn;
    pnlButtons: TPanel;
    rgrUsers: TRadioGroup;
  end;

function SelectUser(
  const aOwner: TForm;
  const aUsers: TDictionaryStrings;
  const aLastUserID: string;
  const aAllowCreateNew: boolean): string;

const
  AUTHORIZENEWUSER_ITEM = '< Authorize New User >';

implementation

{$R *.dfm}

function SelectUser(
  const aOwner: TForm;
  const aUsers: TDictionaryStrings;
  const aLastUserID: string;
  const aAllowCreateNew: boolean): string;

  procedure _CenterInOwnerForm(const aSubForm, aOwnerForm: TForm);
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

var
  vSelectUserDialogForm: TSelectUserDialogForm;
  s: string;
begin
  vSelectUserDialogForm := TSelectUserDialogForm.Create(aOwner);
  try

    vSelectUserDialogForm.rgrUsers.Items.Clear;
    for s in aUsers.Keys.ToArray do begin
      vSelectUserDialogForm.rgrUsers.Items.Add(aUsers.Items[s] + '(' + s + ')');
      if SameText(s, aLastUserID) then
        vSelectUserDialogForm.rgrUsers.ItemIndex := vSelectUserDialogForm.rgrUsers.Items.Count;
    end;
    if aAllowCreateNew then
      vSelectUserDialogForm.rgrUsers.Items.Add(AUTHORIZENEWUSER_ITEM);

    if vSelectUserDialogForm.rgrUsers.ItemIndex = -1 then
      vSelectUserDialogForm.rgrUsers.ItemIndex := 0;

    vSelectUserDialogForm.rgrUsers.Height :=
      vSelectUserDialogForm.rgrUsers.Items.Count *
        (30 * Screen.MonitorFromWindow(aOwner.Handle).PixelsPerInch div vSelectUserDialogForm.PixelsPerInch) +
        (40 * Screen.MonitorFromWindow(aOwner.Handle).PixelsPerInch div vSelectUserDialogForm.PixelsPerInch);
    vSelectUserDialogForm.AutoSize := True;

    _CenterInOwnerForm(vSelectUserDialogForm, aOwner);

    if vSelectUserDialogForm.ShowModal = mrOk then
    begin
      if vSelectUserDialogForm.rgrUsers.ItemIndex < aUsers.Keys.Count then
        Result := aUsers.Keys.ToArray[vSelectUserDialogForm.rgrUsers.ItemIndex]
      else
        Result := AUTHORIZENEWUSER_ITEM;
    end else
      Result := '';

  finally
    vSelectUserDialogForm.Release;
  end;
end;

end.
