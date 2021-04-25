program FoldersToFlickrSyncr;

uses
  {$IFDEF DEBUG}
  FastMM5 in 'FastMM5.pas',
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  {$ENDIF}
  Vcl.Forms,
  WinApi.Windows,
  FoldersToFlickrSyncrFrm in 'FoldersToFlickrSyncrFrm.pas' {FoldersToFlickrSyncrForm},
  XMLSupportUnit in 'XMLSupportUnit.pas',
  FoldersToFlickrSyncrSupportUnit in 'FoldersToFlickrSyncrSupportUnit.pas',
  FoldersToFlickrSyncrMethodsUnit in 'FoldersToFlickrSyncrMethodsUnit.pas',
  FoldersToFlickrSyncrMethodsClassesUnit in 'FoldersToFlickrSyncrMethodsClassesUnit.pas',
  Flickr.System.Net.Mime in 'Flickr.System.Net.Mime.pas',
  CCR.Exif.BaseUtils in '..\ccr-exif\CCR.Exif.BaseUtils.pas',
  CCR.Exif.Consts in '..\ccr-exif\CCR.Exif.Consts.pas',
  CCR.Exif.IPTC in '..\ccr-exif\CCR.Exif.IPTC.pas',
  CCR.Exif in '..\ccr-exif\CCR.Exif.pas',
  CCR.Exif.StreamHelper in '..\ccr-exif\CCR.Exif.StreamHelper.pas',
  CCR.Exif.TagIDs in '..\ccr-exif\CCR.Exif.TagIDs.pas',
  CCR.Exif.TiffUtils in '..\ccr-exif\CCR.Exif.TiffUtils.pas',
  CCR.Exif.XMPUtils in '..\ccr-exif\CCR.Exif.XMPUtils.pas',
  FoldersToFlickrSyncrMessageDialogFrm in 'FoldersToFlickrSyncrMessageDialogFrm.pas' {CustomMessageForm},
  FoldersToFlickrSyncrSelectUserDialogFrm in 'FoldersToFlickrSyncrSelectUserDialogFrm.pas' {SelectUserDialogForm},
  Windows7SupportUnit in 'Windows7SupportUnit.pas';

{$R *.res}

begin

{$IFDEF WIN32}
{$SetPEFlags IMAGE_FILE_LARGE_ADDRESS_AWARE}
{$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFoldersToFlickrSyncrForm, FoldersToFlickrSyncrForm);
  Application.Run;
end.

