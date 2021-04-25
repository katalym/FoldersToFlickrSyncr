(**
  Purpose : Support functions
*)

unit FoldersToFlickrSyncrSupportUnit;

{$ASSERTIONS ON}
{$WARN UNIT_PLATFORM OFF}

interface

uses
  Classes, SysUtils,
  REST.Types, REST.Client, REST.Authenticator.OAuth,
  System.Generics.Collections, System.IniFiles,
  System.SyncObjs, Winapi.Messages, Winapi.Windows,
  FoldersToFlickrSyncrMethodsClassesUnit, System.UITypes, Vcl.Dialogs,
  Windows7SupportUnit, XMLSupportUnit;

const
  // REST Endpoint URL
  FlickrRESTEndpointURL = 'https://api.flickr.com/services/rest/';
  FlickrAccessTokenEndpoint = 'https://www.flickr.com/services/oauth/access_token';
  FlickrRequestTokenEndpoint = 'https://www.flickr.com/services/oauth/request_token';
  FlickrAuthenticationEndpoint = 'https://www.flickr.com/services/oauth/authorize';
  FlickrUploadingPhotosURL = 'https://up.flickr.com/services/upload/';
  FlickrReplacingPhotosURL = 'https://up.flickr.com/services/replace/';

  ApplicationConsumerKey = 'f8d140164947871940d02fbd987b9a9d';
  ApplicationConsumerSecret = '05064c1ff6bfe346';

  rspOK = 'ok';

const
  TH_MYMESSAGE = WM_USER + 100;          //Thread message
  TH_SHOWPROGRESS = 1;
  TH_CUSTOMMESSAGE = 2;
  TH_LOG_TO_PHOTOLOG = 3;
  TH_LOG_TO_ERRORTOLOG = 4;

type
  PPhotoToProcess = ^TPhotoToProcess;
  TPhotoToProcess = record
    FThreadID: Cardinal;
    FTitle: PString;
    FNumber: Cardinal;
    FTotalPotos: Cardinal;
  end;

  PCustomMessageRecord = ^TCustomMessageRecord;
  TCustomMessageRecord = record
    FThreadID: Cardinal;
    FMsg: string;
    FDlgType: TMsgDlgType;
    FButtons: TMsgDlgButtons;
    FDefaultButton: TMsgDlgBtn;
    FAutoCloseTime: Cardinal;
    procedure CustomMessageToForm(
      const aMsg: string;
      const aDlgType: TMsgDlgType;
      const aButtons: TMsgDlgButtons;
      const aDefaultButton: TMsgDlgBtn = mbOK;
      const aAutoCloseTime: Cardinal = 0);
  end;

  TDictionaryStrings = TDictionary<string, string>;
  TListString = TList<string>;

  TFlickrPhoto = class(TObject)
  strict private
    FHeight_o: Integer;
    FID: string;
    FIsFamily: String;
    FIsFriend: String;
    FIsPrimary: string;
    FIsPublic: String;
    FPerm_AddMeta: String;
    FPerm_Comment: String;
    FTitle: string;
    FWidth_o: Integer;
  public
    constructor Create;
    property Height_o: Integer read FHeight_o write FHeight_o;
    property ID: string read FID write FID;
    property IsFamily: String read FIsFamily write FIsFamily;
    property IsFriend: String read FIsFriend write FIsFriend;
    property IsPrimary: string read FIsPrimary write FIsPrimary;
    property IsPublic: String read FIsPublic write FIsPublic;
    property Perm_AddMeta: String read FPerm_AddMeta write FPerm_AddMeta;
    property Perm_Comment: String read FPerm_Comment write FPerm_Comment;
    property Title: string read FTitle write FTitle;
    property Width_o: Integer read FWidth_o write FWidth_o;
  end;

  TFlickrPhotos = TDictionary<string, TFlickrPhoto>;

  TLocalFolder = class;

  TLocalPhoto = class(TObject)
  strict private
    FAlbumName: string;
    FChanged_Access: boolean;
    FChanged_Description: boolean;
    FChanged_File: boolean;
//    FChanged_Flickr: boolean; { TODO : Changed_Flickr need to detect changes on the flickr and store them to sysncr.ini file}
    FChanged_Picasa: boolean;
    FChanged_Tags: boolean;
    FChanged_Title: boolean;
    FCreateResizedJPGDone: Boolean;
    FDefaultTitle: string;
    FDescription: string;
    FExifDateTimeOriginal: TDateTime;
    FExifTitle: string;
    FFailedLocalFileProcessing: integer;
    FFailedPostCommands: Integer;
    FFileDate: String;
    FFileMD5: String;
    FFileMD5Actual: String;
    FFileSize: Int64;
    FFileSizeActual: Int64;
    FImageUniqueID: string;
    FIsFamily: String;
    FIsFriend: String;
    FIsPublic: String;
    FModified: Boolean;
    FNewHeight: integer;
    FNewWidth: integer;
    FPermissionAddMeta: String;
    FPermissionComment: String;
    FPhotoFileName: string;
    FPhotoFileNameBackup: string;
    FPhotoID: string;
    FPicasa: String;
    FPicasaWarning: string;
    FPostPhotoLastError: string;
    FProcessingInfo: TStringList;
    FReadExifDone: Boolean;
    FReadFileDataDone: Boolean;
    FReadSyncIniDone: Boolean;
    FReportIntoLog: Boolean;
    FRequireResizedImage: boolean;
    FResizedPhotoFileName: string;
    FScale: Double;
    FSyncDataFileName: string;
    FTagsInternal: TStringList;
    FTitle: string;
    FUploadComplete: Boolean;
//    function AssignImageUniqueID(const aMD5String: string): string;
    function CreateResizedJPG: Boolean;
    function GenerateImageUniqueID: string;
    //function GetAccessLevel: String;
    function GetHasChanges: boolean;
    function GetIsFamily: String;
    function GetIsFriend: String;
    function GetIsPublic: String;
    function GetPerm_AddMeta: String;
    function GetPerm_Comment: String;
    function GetPhotoPermissions(
      out aIsFamily, aIsFriend, aIsPublic, aPermissionAddMeta, aPermissionComment: String;
      out vPhotoExists: boolean): boolean;
    function GetPreparedPhotoFileName: string;
    function GetTags: string;
    function IsImageUniqueIDValid(const aImageUniqueID: string): Boolean;
    procedure SetDescription(const Value: string);
    procedure SetFileDate(const Value: String);
    procedure SetFileMD5(const Value: String);
    procedure SetFileSize(const Value: Int64);
    procedure SetIsFamily(const Value: String);
    procedure SetIsFriend(const Value: String);
    procedure SetIsPublic(const Value: String);
    procedure SetPerm_AddMeta(const Value: String);
    procedure SetPerm_Comment(const Value: String);
    procedure SetPhotoFileName(const Value: string);
    procedure SetPhotoID(const Value: string);
    procedure SetTitle(const Value: string);
    procedure SetUploadComplete(const Value: Boolean);
  private
    FPicasaApplied: Boolean;
    procedure AddTag(const aTag: string);
    procedure AddTags(const aTags: tstrings);
    procedure ClearChanges;
    function PostPhotoToFlickr(const aAsync: Boolean;
      out aResponseText, aUploadedPhotoID, aTicketID: string ): Boolean;
    procedure UploadCompleteSet;
    function UploadPhotoToFlickr(const aWorkFolder: TLocalFolder): Boolean;
    procedure WriteSyncIniData;
    property Changed_Access: boolean read FChanged_Access write FChanged_Access;
    property Changed_Description: boolean read FChanged_Description write FChanged_Description;
    property Changed_File: boolean read FChanged_File write FChanged_File;
    //property Changed_Flickr: boolean read FChanged_Flickr write FChanged_Flickr;
    property Changed_Tags: boolean read FChanged_Tags write FChanged_Tags;
    property Changed_Title: boolean read FChanged_Title write FChanged_Title;
    property DateTimeOriginal: TDateTime read FExifDateTimeOriginal write FExifDateTimeOriginal;
    property Description: string read FDescription write SetDescription;
    property ExifTitle: string read FExifTitle write FExifTitle;
    property FailedLocalFileProcessing: integer read FFailedLocalFileProcessing write FFailedLocalFileProcessing;
    property FailedPostCommands: Integer read FFailedPostCommands write FFailedPostCommands;
    property FileDate: String read FFileDate write SetFileDate;
    property FileMD5: String read FFileMD5 write SetFileMD5;
    property FileMD5Actual: String read FFileMD5Actual write FFileMD5Actual;
    property FileSize: Int64 read FFileSize write SetFileSize;
    property FileSizeActual: Int64 read FFileSizeActual write FFileSizeActual;
    property HasChanges: boolean read GetHasChanges;
    property IsFamily: String read GetIsFamily write SetIsFamily;
    property IsFriend: String read GetIsFriend write SetIsFriend;
    property IsPublic: String read GetIsPublic write SetIsPublic;
    property PermissionAddMeta: String read GetPerm_AddMeta write SetPerm_AddMeta;
    property PermissionComment: String read GetPerm_Comment write SetPerm_Comment;
    property PhotoFileName: string read FPhotoFileName write SetPhotoFileName;
    property PhotoID: string read FPhotoID write SetPhotoID;
    property Picasa: String read FPicasa;
    property PicasaWarning: string read FPicasaWarning write FPicasaWarning;
    property PostPhotoLastError: string read FPostPhotoLastError write FPostPhotoLastError;
    property PreparedPhotoFileName: string read GetPreparedPhotoFileName;
    property SyncDataFileName: string read FSyncDataFileName write FSyncDataFileName;
    property Tags: string read GetTags;
    property Title: string read FTitle write SetTitle;
    property UploadComplete: Boolean read FUploadComplete write SetUploadComplete;
  public
    constructor Create(const aPhotoFileName, aSyncDataFileName, aAlbumName: string; const aTags: TStrings); reintroduce;
    destructor Destroy; override;
    function ApplyPicasaFaces(const aPicasaFileName, aFaces: String): Boolean;
//    function IsPhotoExist: boolean;
    function ReadExifData: Boolean;
    function ReadFileProperties: Boolean;
    function ReadSyncIniData: Boolean;
    property AlbumName: string read FAlbumName;
    property ImageUniqueID: string read FImageUniqueID;
    property Modified: Boolean read FModified write FModified;
    //property CreateResizedJPGDone: Boolean read FCreateResizedJPGDone write  FCreateResizedJPGDone;
    property ProcessingInfo: TStringList read FProcessingInfo write FProcessingInfo;
    property ReadExifDone: Boolean read FReadExifDone write FReadExifDone;
    property ReadFileDataDone: Boolean read FReadFileDataDone write FReadFileDataDone;
    property ReadSyncIniDone: Boolean read FReadSyncIniDone write FReadSyncIniDone;
    property ReportIntoLog: Boolean read FReportIntoLog write FReportIntoLog;
  end;

  TPhotoList = TList<TLocalPhoto>;

  TLocalFolder = class(TObject)
  strict private
    FAlbumName: string;
    FArchivedFolder: boolean;
//    FCollections: TStringList;
    FFlickrAlbumID: string;
    FFlickrPhotos: TFlickrPhotos;
    FFlickrPhotosCS: TCriticalSection;
    FFolderProcessingInfo: TStringList;
    FIsLocalDataLoadedForAllPhotos: Boolean;
    FIsUploadCompleteForAllPhotos: Boolean;
    FLocalPhotos: TPhotoList;
    FModified: Boolean;
    FProcessedPhotosCount: integer;
    FSourceFolderFullName: string;
    FSyncDataFileName: string;
    FSyncFileUpdated: Boolean;
    FTagsFromAlbumName: TStringList;
    FUploadFolder: boolean;
    function GetArchivedFolder: boolean;
    function GetIsLocalDataLoadedForAllPhotos: Boolean;
    function GetIsUploadCompleteForAllPhotos: Boolean;
    function GetUploadFolder: boolean;
    procedure SetAlbumName(const Value: string);
    procedure SetFlickrAlbumID(const Value: string);
    procedure SetFolderNameRelative(const Value: string);
    procedure SetSyncDataFileName(const Value: string);
    procedure SetSyncFileUpdated(const Value: Boolean);
  private
    FIgnoreArchivedFlag: Boolean;
    procedure Clear;
    function FindPhotoByID(const aFlickrPhotoID: string): TLocalPhoto;
    function Flickr_Load_PhotosForAlbum: Boolean;
    function Flickr_Sycronize_FolderWith_Album: Boolean;
    function GetListOfPhotos: string;
    function GetPrimaryPhotoID(out aPrimaryPhotoID: string): Boolean;
    procedure WriteSyncIniFile(const aForceWrite: boolean);
//    property Collections: TStringList read FCollections;
    property FlickrPhotos: TFlickrPhotos read FFlickrPhotos write FFlickrPhotos;
    property FlickrPhotosCS: TCriticalSection read FFlickrPhotosCS write FFlickrPhotosCS;
    property IsLocalDataLoadedForAllPhotos: Boolean read GetIsLocalDataLoadedForAllPhotos;
    property Modified: Boolean read FModified write FModified;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    function AddPhoto(const aFileName: string): TLocalPhoto;
    function ApplyPicasaFileName: Boolean;
    function IsNewAlbum: Boolean;
    property AlbumName: string read FAlbumName write SetAlbumName;
    property ArchivedFolder: boolean read GetArchivedFolder;
    property FlickrAlbumID: string read FFlickrAlbumID write SetFlickrAlbumID;
    property FolderNameRelative: string write SetFolderNameRelative;
    property FolderProcessingInfo: TStringList read FFolderProcessingInfo write FFolderProcessingInfo;
    property IgnoreArchivedFlag: Boolean read FIgnoreArchivedFlag write FIgnoreArchivedFlag;
    property IsUploadCompleteForAllPhotos: Boolean read GetIsUploadCompleteForAllPhotos;
    property LocalPhotos: TPhotoList read FLocalPhotos;
    property ProcessedPhotosCount: integer read FProcessedPhotosCount write FProcessedPhotosCount;
    property SourceFolderFullName: string read FSourceFolderFullName write FSourceFolderFullName;
    property SyncDataFileName: string write SetSyncDataFileName;
    property SyncFileUpdated: Boolean read FSyncFileUpdated write SetSyncFileUpdated;
    property UploadFolder: boolean read GetUploadFolder;
  end;

  TInsertPosition = (ipTop, ipAdd);

  TLocalFolderList = TList<TLocalFolder>;

  //TSyncFolderCollection = TDictionary<string, TLocalFolderList>;

  TLocalWorkLoad = Class(Tobject)
  private
    FAlbumsCount: Integer;
    FIsUploadCompleteForAllAlbums: Boolean;
    FPhotosCount: Integer;
    FWorkCollection: TLocalFolderList;
    function GetIsUploadCompleteForAllAlbums: Boolean;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Clear;
    property AlbumsCount: Integer read FAlbumsCount write FAlbumsCount;
    property IsUploadCompleteForAllAlbums: Boolean read GetIsUploadCompleteForAllAlbums;
    property PhotosCount: Integer read FPhotosCount write FPhotosCount;
    property WorkCollection: TLocalFolderList read FWorkCollection write FWorkCollection;
  end;

  TCollectFileDataThread = class(TThread)
  private
    FLocalFolderToProcess: TLocalFolder;
    procedure SetLocalFolderToProcess(const Value: TLocalFolder);
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;
    property LocalFolderToProcess: TLocalFolder read FLocalFolderToProcess write SetLocalFolderToProcess;
  end;

//  ISnapshotInterface = interface
//    ['{D80CA046-A76A-4855-A1DE-FC65B4E4D20F}']
//    procedure Restore;
//  end;

  TFlickrPostRESTRequest = class(TRESTRequest)
  protected
    procedure DoPrepareRequestBody(AParamList: TRESTRequestParameterArray;
      AContentType: TRESTContentType; var ABodyStream: TStream; var ABodyStreamOwner: Boolean); override;
  public
    FRequestBody: AnsiString;
    constructor Create(AOwner: TComponent); override;
    function ContentType: TRESTContentType; overload;
  end;

  TCleanUpThread = class(TThread)
  protected
    procedure Execute; override;
  end;

  TPicasaSettings = class(TObject)
  private
    FApplyForFaces: Boolean;
    FApplyNoFaces: Boolean;
    FContacts: TDictionaryStrings;
    FIsFamilyForFaces: Boolean;
    FIsFamilyNoFaces: Boolean;
    FIsFriendForFaces: Boolean;
    FIsFriendNoFaces: Boolean;
    FIsPublicForFaces: Boolean;
    FIsPublicNoFaces: Boolean;
    function GetIsFamilyForFaces: string;
    function GetIsFamilyNoFaces: string;
    function GetIsFriendForFaces: string;
    function GetIsFriendNoFaces: string;
    function GetIsPublicForFaces: string;
    function GetIsPublicNoFaces: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ApplySettings(
      const aDoNotApplyForFaces, aIsFamilyForFaces, aIsFriendForFaces, aIsPublicForFaces: Boolean;
      const aDoNotApplyNoFaces, aIsFamilyNoFaces, aIsFriendNoFaces, aIsPublicNoFaces: Boolean;
      const aContactsXMLFileName: string);
    procedure LoadPicasaContacts(const aContactsXMLFileName: string);
    property ApplyForFaces: Boolean read FApplyForFaces write FApplyForFaces;
    property ApplyNoFaces: Boolean read FApplyNoFaces write FApplyNoFaces;
    property Contacts: TDictionaryStrings read FContacts;
    property IsFamilyForFaces: string read GetIsFamilyForFaces;
    property IsFamilyNoFaces: string read GetIsFamilyNoFaces;
    property IsFriendForFaces: string read GetIsFriendForFaces;
    property IsFriendNoFaces: string read GetIsFriendNoFaces;
    property IsPublicForFaces: string read GetIsPublicForFaces;
    property IsPublicNoFaces: string read GetIsPublicNoFaces;
  end;

  TFlickrSettings = class(Tobject)
  private
    FHiddenFromSearch: integer;
    FIsFamily: Boolean;
    FIsFamily_Default: String;
    FIsFriend: Boolean;
    FIsFriend_Default: String;
    FIsPublic: Boolean;
    FIsPublic_Default: String;
    FPermissionAddMeta: integer;
    FPermissionAddMeta_Default: String;
    FPermissionComment: integer;
    FPermissionComment_Default: String;
    FSafetyFilter: integer;
    FWhoCanSeeDefault: Boolean;
    function GetHiddenFromSearch: string;
    function GetIsFamily: string;
    function GetIsFriend: string;
    function GetIsPublic: string;
    function GetPermissionAddMeta: string;
    function GetPermissionComment: string;
    function GetSafetyFilter: string;
  public
    procedure ApplyActualSettings(
      const aIsFamily, aIsFriend, aIsPublic, aPermissionAddMeta, aPermissionComment: String);
    procedure ApplySettings(
      const aWhoCanSeeDefault, aIsFamily, aIsFriend, aIsPublic: Boolean;
      const aPermissionAddMeta, aPermissionComment, aSafetyFilter, aHiddenFromSearch: integer);
    property HiddenFromSearch: string read GetHiddenFromSearch;
    property IsFamily: string read GetIsFamily;
    property IsFamily_Default: String read FIsFamily_Default;
    property IsFriend: string read GetIsFriend;
    property IsFriend_Default: String read FIsFriend_Default;
    property IsPublic: string read GetIsPublic;
    property IsPublic_Default: String read FIsPublic_Default;
    property PermissionAddMeta: string read GetPermissionAddMeta;
    property PermissionAddMeta_Default: String read FPermissionAddMeta_Default;
    property PermissionComment: string read GetPermissionComment;
    property PermissionComment_Default: String read FPermissionComment_Default;
    property SafetyFilter: string read GetSafetyFilter;
    property WhoCanSeeDefault: Boolean read FWhoCanSeeDefault;
  end;

  TIniFileUnicode_Mode = (fReadIni, fWriteIni);
  TIniFileUnicode = Class(TMemIniFile)
  private
    FIniFileUnicode_Mode: TIniFileUnicode_Mode;
    FWriteRequired: Boolean;
  public
    constructor Create(const FileName: string; const aIniFileUnicode_Mode: TIniFileUnicode_Mode); reintroduce;
    destructor Destroy; override;
    property WriteRequired: Boolean read FWriteRequired write FWriteRequired;
  end;

procedure ClearFlickrPhotosNotInSet;

function ExecuteAPIMethod(const aAPIMethod: IFlickrAPIMethod): boolean; overload;

function ExecuteAPIMethod(const aAPIMethod: IFlickrAPIMethod; out aXML: ibvXMLAccess; out aErrorMessage: string): boolean; overload;

function FindFlickrAlbumByName(const aAlbumName: string): string;

function GetOAuthAuthenticateHeaderValue(
  const aParameters: TStringList;
  const aConsumerKey, aConsumerSecret,
    aAccessToken, aAccessTokenSecret,
    aFullURL: string): string;

function HourGlass: ISnapshotInterface;

function LogActionMessage(
  const aStrings: Tstrings;
  const aMessageTxt: string;
  const aLogAsSingleMessage: boolean): ISnapshotInterface;

function MakeFileFriendly(const aUserName: string): string;

function MyEncodeAsUTF8(const aUnicodeString: string): string;

var
  MyAccessToken: string ='';
  MyAccessTokenSecret: string ='';
  FlickrUserID: string = '';
  gFlickrApiCallsCount: Int64 = 0;
  gPhotoUploads: Int64 = 0;
  gPhotoReplacments: Int64 = 0;
  gUploadedSize: Int64 = 0;
  gPhotosTotalSize: Int64 = 0;
  gPhotosProcessed: Int64 = 0;
  gAlbumsProcessed: Int64 = 0;
  gPreloadDone: Int64 = 0;
  gAlbumsCreated: Int64 = 0;
  gErrors: Int64 = 0;
  gResolvedErrors: Int64 = 0;
  gSynchronizationTime: TDateTime;
  gDoNotUnlinkUnknownPhotosFromAlbum: Boolean;
  gSetImageDescription: boolean;
  gPriorityPermissionsFlickr: boolean;
  gPriorityTitleExif: boolean;

  gDoResize: Boolean;
  gApplyPermissionsChanges: Boolean;
  gEnforceSyncrIniPermissions: Boolean;
  gDoSaveResizedPhotos: Boolean;
  gSaveResizedPhotosFolder: string;
  gMaxResizeWidth: integer;
  gMaxResizeHeight: integer;
  gMaxResizeFileSize: integer;
  gResizeJpgQuality: integer;
  gMainFormHandle: HWND;

  gPicasaSettings: TPicasaSettings;
  gFlickrSettings: TFlickrSettings;

  gWorkAlbumsFromFolders: TDictionaryStrings = nil;
  gFlickrAlbums: TDictionaryStrings = nil;
  gFlickrPhotosNotInSet: TFlickrPhotos = nil;
  gImageUniqueIDList: TDictionaryStrings = nil;

  gFlickrAlbumsCriticalSection: TCriticalSection;
  gFlickrPhotosNotInSetCriticalSection: TCriticalSection;
  gJpegExifCriticalSection: TCriticalSection;
  gFlickrPostPhotoCriticalSection: TCriticalSection;
  gImageUniqueIDAccessCriticalSection: TCriticalSection;
  gFileAccessCriticalSection: TSemaphore;

implementation

uses
  Vcl.Forms, Flickr.System.Net.Mime,
  REST.Utils, System.NetEncoding, System.Hash, System.DateUtils,
  System.Math, CCR.Exif, CCR.Exif.BaseUtils, Vcl.Graphics, CCR.Exif.IPTC, System.StrUtils,
  CCR.Exif.TagIDs, CCR.Exif.XMPUtils, Winapi.ActiveX, System.Generics.Defaults,
  FoldersToFlickrSyncrMethodsUnit, IdMultipartFormData, IdHTTP, IdSSLOpenSSL,
  IdGlobal, System.IOUtils, System.Types;

var
  GlobalIndent: TDictionary<Tstrings, integer>;
  glProcessFileThread: TThread = nil;
  FCustomMessageRecord: PCustomMessageRecord;

type

  TRGBArray = array[Word] of TRGBTriple;
  pRGBArray = ^TRGBArray;

  TCursorSnapshot = class(TInterfacedObject, ISnapshotInterface)
  private
    FOriginalCursor: TCursor;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Restore;
  end;

  TSendUserActivityMessageSnapshot = class(TInterfacedObject, ISnapshotInterface)
  private
    FIndent: Integer;
    FLogAsSingleMessage: Boolean;
    FMessageTxt: string;
    FStartedAt: Cardinal;
    FStrings: TStrings;
  public
    constructor Create(
      const aStrings: Tstrings;
      const aMessageTxt: string;
      const aLogAsSingleMessage: Boolean); reintroduce;
    destructor Destroy; override;
    procedure Restore;
  end;

function Flickr_Load_PhotosNotInSet: Boolean; forward;

procedure ClearFlickrPhotosNotInSet;
var
  vFlickrPhoto: TFlickrPhoto;
begin
  if Assigned(gFlickrPhotosNotInSet) then
  begin
    for vFlickrPhoto in gFlickrPhotosNotInSet.Values.ToArray do
      if Assigned(vFlickrPhoto) then
        vFlickrPhoto.Free;
    gFlickrPhotosNotInSet.Clear;
  end;
end;

function ExecuteAPIMethod(const aAPIMethod: IFlickrAPIMethod): boolean; overload;
var
  vXML: ibvXMLAccess;
  vErrorMessage: string;
begin
  Result := ExecuteAPIMethod(aAPIMethod, vXML, vErrorMessage);
end;

function ExecuteAPIMethod(const aAPIMethod: IFlickrAPIMethod; out aXML: ibvXMLAccess; out aErrorMessage: string): boolean; overload;
var
  i: integer;
  vArgument: TFlickrAPIArgument;
  vRESTClient: TRESTClient;
  vRESTRequest: TRESTRequest;
  vRESTResponse: TRESTResponse;
  vOAuthAuthenticator: TOAuth1Authenticator;
begin

  vOAuthAuthenticator := TOAuth1Authenticator.Create(nil);
  try

    vOAuthAuthenticator.AccessTokenEndpoint := FlickrAccessTokenEndpoint;
    vOAuthAuthenticator.RequestTokenEndpoint := FlickrRequestTokenEndpoint;
    vOAuthAuthenticator.AuthenticationEndpoint := FlickrAuthenticationEndpoint;
    vOAuthAuthenticator.ConsumerKey := ApplicationConsumerKey;
    vOAuthAuthenticator.ConsumerSecret := ApplicationConsumerSecret;
    vOAuthAuthenticator.CallbackEndpoint := 'oob';
    vOAuthAuthenticator.AccessToken := MyAccessToken;
    vOAuthAuthenticator.AccessTokenSecret := MyAccessTokenSecret;

    vRESTClient := TRESTClient.Create('');
    try

      vRESTClient.Authenticator := vOAuthAuthenticator;
      vRESTClient.Params.Clear;
      vRESTClient.HandleRedirects := True;
      vRESTClient.ResetToDefaults;
      vRESTClient.AcceptEncoding := 'gzip';
      vRESTClient.AcceptCharset := 'utf-8, *;q=0.8';
      vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';

      vRESTResponse := TRESTResponse.Create(nil);
      try

        vRESTResponse.ResetToDefaults;
        vRESTResponse.ContentEncoding := 'gzip';

        vRESTRequest := TRESTRequest.Create(nil);
        try

          vRESTRequest.Client := vRESTClient;
          vRESTRequest.Params.Clear;
          vRESTRequest.Response := vRESTResponse;
          vRESTRequest.SynchronizedEvents := False;
          vRESTRequest.ResetToDefaults;
          vRESTRequest.AcceptEncoding := 'gzip';
          vRESTRequest.AcceptCharset := 'utf-8, *;q=0.8';
          vRESTRequest.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
          vRESTClient.BaseURL := FlickrRESTEndpointURL;
          vRESTClient.Authenticator := vOAuthAuthenticator;

          vRESTRequest.Resource := '';
          vRESTRequest.Params.AddItem('method', aAPIMethod.Method_Name, TRESTRequestParameterKind.pkGETorPOST);
          ///edtLastApiCallMethodName.text := aAPIMethod.Method_Name;
          vRESTRequest.Params.AddItem('format', 'rest', TRESTRequestParameterKind.pkGETorPOST);

          for i := 0 to aAPIMethod.ArgumentsCount - 1 do begin
            vArgument := aAPIMethod.Arguments[i];
            if SameText(vArgument.Name, ARGUMENTNAME_API_KEY) then
            begin
              if not vArgument.Optional then
                vRESTRequest.Params.AddItem('oauth_consumer_key', ApplicationConsumerKey, TRESTRequestParameterKind.pkGETorPOST);
            end else
            if vArgument.Value <> '' then
            begin
              vRESTRequest.Params.AddItem(vArgument.Name, MyEncodeAsUTF8(vArgument.Value), TRESTRequestParameterKind.pkGETorPOST);
            end else if not vArgument.Optional then
            begin
              New(FCustomMessageRecord);
              FCustomMessageRecord^.CustomMessageToForm(Format('%s - required argument "%s" is empty!', [aAPIMethod.Method_Name, vArgument.Name]), mtError, [mbOK]);
//              Result := False;
            end;
          end;

          vRESTRequest.Method := TRESTRequestMethod.rmPOST;

          try

            vRESTRequest.Execute;
//            Result := True;

          except
            on E: Exception do
            begin
//              Result := False;
              aErrorMessage := E.ClassName + ': ' + E.Message;
              New(FCustomMessageRecord);
              FCustomMessageRecord^.CustomMessageToForm('ExecuteAPIMethod, vRESTRequest.Execute failed:'#13 + aErrorMessage, mtError, [mbOK]);
              TInterlocked.Increment(gErrors);
              Abort;
            end;
          end;

          try

            if ContainsText(vRESTResponse.Content, '<?xml version=') then
            begin
              aXML := TbvXMLAccess.Create(vRESTResponse.Content);
              Result := SameText(aXML.Attribute['rsp.stat'], rspOK);
              if not Result then
                aErrorMessage := vRESTResponse.Content;
            end else
              Result := False;

          except
            on E: Exception do begin
              Result := False;
              aErrorMessage := E.ClassName + ': ' + E.Message;
              New(FCustomMessageRecord);
              FCustomMessageRecord^.CustomMessageToForm('ExecuteAPIMethod, vRESTResponse.Content parsing failed:'#13 + aErrorMessage, mtError, [mbOK]);
              Abort;
            end;
          end;

          ///FlickrApiCalls := FlickrApiCalls  + 1;

          TInterlocked.Increment(gFlickrApiCallsCount);

        finally
          vRESTRequest.Free;
        end;

      finally
        vRESTResponse.Free;
      end;

    finally
      vRESTClient.Free;
    end;

  finally
    vOAuthAuthenticator.Free;
  end;
end;

procedure DoLogInformation(const aMessage: string);
var
  vMessage: PString;
begin
  New(vMessage);
  vMessage^ := aMessage;
  PostMessage(gMainFormHandle, TH_MYMESSAGE, TH_LOG_TO_PHOTOLOG, LParam(vMessage));
end;

procedure DoLogError(const aMessage: string);
var
  vMessage: PString;
begin
  New(vMessage);
  vMessage^ := aMessage;
  PostMessage(gMainFormHandle, TH_MYMESSAGE, TH_LOG_TO_ERRORTOLOG, LParam(vMessage));
end;

procedure DoLogPhotoProcessInformation(
  const aTitle: string;
  const aNumber: Cardinal;
  const aTotalPotos: Cardinal);
var
  vPhotoToProcess: PPhotoToProcess;
begin
  New(vPhotoToProcess);
  New(vPhotoToProcess^.FTitle);
  vPhotoToProcess^.FTitle^ := aTitle;
  vPhotoToProcess^.FThreadID := GetCurrentThreadID;
  vPhotoToProcess^.FNumber := aNumber;
  vPhotoToProcess^.FTotalPotos := aTotalPotos;
  PostMessage(gMainFormHandle, TH_MYMESSAGE, TH_SHOWPROGRESS, LParam(vPhotoToProcess));
end;

function Flickr_Load_AllAlbums: Boolean;
var
  vXML, vNode: IbvXMLAccess;
  vToken, vTitle, vID, vErrorMessage: string;
  i, vCnt, vTotal, vProcessed, vPageNo: integer;
begin

  vPageNo := 1;
  vProcessed := 0;
//  vTotal := 0;
//  vCnt := 0;

  DoLogInformation('Loading Flickr Albums ...');

  Assert(not Assigned(gFlickrAlbums));

  gFlickrAlbums := TDictionaryStrings.Create;

  repeat

    if ExecuteAPIMethod(Get_photosets_getList('', IntToStr(vPageNo), '500', ''), vXML, vErrorMessage) then
    begin
      vCnt := StrToInt(vXML.Element['rsp.photosets.photoset[?]']);
      vTotal := StrToInt(vXML.Attribute['rsp.photosets.total']);
      for i := 0 to vCnt - 1 do begin
        vTitle := vXML.Element[format('rsp.photosets.photoset[%d].title', [i])];
        vToken := vXML.Element[format('rsp.photosets.photoset[%d].description', [i])];
        vID := vXML.Attribute[format('rsp.photosets.photoset[%d].id', [i])];
        vNode := TbvXMLAccess.Create(vXML.Node[format('rsp.photosets.photoset[%d]', [i])].XML);
        vToken := vNode.Attribute['photoset.id'];
        vToken := vNode.Element['photoset.title'];
        vToken := vNode.Element['photoset.description'];
        gFlickrAlbums.AddOrSetValue(vID, vTitle);
        inc(vProcessed);
      end;
      Result := True;
    end else begin
      Result := False;
      New(FCustomMessageRecord);
      FCustomMessageRecord^.CustomMessageToForm('Sync_LoadFlickrAlbums failed'#13 + vErrorMessage, mtError, [mbOK]);
      FreeAndNil(gFlickrAlbums);
      Exit;
    end;

    inc(vPageNo);

    if vTotal > 0 then
    begin
      DoLogInformation(
        Format('%d%% loaded. %d of %d', [vProcessed * 100 div vTotal, vProcessed, vTotal]));
    end;

  until (vProcessed >= vTotal) or (vCnt = 0);

///  lstAlbums.Items.Clear;
//  lstAlbums.Items.AddStrings(gFlickrAlbums.Values.ToArray);
///  lblAlbumsonFlickrBottom.Caption := IntToStr(vTotal) + ' Albums';

///  FSync_LoadFlickrAlbums := Result;

end;

function GetOAuthAuthenticateHeaderValue(
  const aParameters: TStringList;
  const aConsumerKey, aConsumerSecret,
    aAccessToken, aAccessTokenSecret,
    aFullURL: string): string;

  function _GenerateTimeStamp: string;
  begin
    Result := IntToStr(DateTimeToUnix(TTimeZone.Local.ToUniversalTime(Now)));
  end;

  function _GenerateNonce: string;
  begin
    Result := THashMD5.GetHashString(_GenerateTimeStamp + IntToStr(Random(MaxInt)));
  end;

  procedure _AddCommonAuthParameters(
    const aParams: TStringList;
    const aConsumerKey, aNonce, aSignatureMethod, aTimestamp, aAccessToken,
      aVersion, aQuoteChar: string);

    function _FormatValue(const Value, QuoteChar: string): string; inline;
    begin
      Result := QuoteChar + URIEncode(Value) + QuoteChar;
    end;

  begin
  //  if aCallbackEndpoint <> '' then
  //    aParams.Values['oauth_callback'] := _FormatValue(aCallbackEndpoint, aQuoteChar);
    if aConsumerKey <> '' then
      aParams.Values['oauth_consumer_key'] := _FormatValue(aConsumerKey, aQuoteChar);
    aParams.Values['oauth_nonce'] := _FormatValue(aNonce, aQuoteChar);
    aParams.Values['oauth_signature_method'] := _FormatValue(aSignatureMethod, aQuoteChar);
    aParams.Values['oauth_timestamp'] := _FormatValue(aTimestamp, aQuoteChar);
    if aAccessToken <> '' then
      aParams.Values['oauth_token'] := _FormatValue(aAccessToken, aQuoteChar);
  //  else if aRequestToken <> '' then
  //    aParams.Values['oauth_token'] := _FormatValue(aRequestToken, aQuoteChar);
  //  if aVerifierPIN <> '' then
  //    aParams.Values['oauth_verifier'] := _FormatValue(aVerifierPIN, aQuoteChar);
    aParams.Values['oauth_version'] := _FormatValue(aVersion, aQuoteChar);
  end;

  function _BuildSignature(
    const aParameters: TStringList;
    const aConsumerKey, aConsumerSecret,
      aNonce, aSignatureMethod, aTimestamp, aAccessToken, aAccessTokenSecret,
      aVersion, aFullURL: string): string;
  var
    vParamList: TStringList;
    vParamsStr, vSigBaseStr, vSigningKey: string;
    i: integer;
  begin
    Assert(Assigned(aParameters));
    Assert(aConsumerKey <> '');
    Assert(aNonce <> '');
    Assert(aSignatureMethod <> '');
    Assert(aTimestamp <> '');
    Assert(aAccessToken <> '');
    Assert(aVersion <> '');
    Assert(aFullURL <> '');
    Assert(aAccessTokenSecret <> '');
    Assert(aConsumerSecret <> '');

    Result := '';

    // Step #1 - collect all relevant parameters, this includes
    // all oauth_params as well as the params from the payload
    // (payload-params ==> params from client and request)
    vParamList := TStringList.Create;
    try
      _AddCommonAuthParameters(vParamList,
        aConsumerKey, aNonce, aSignatureMethod, aTimestamp, aAccessToken, aVersion, '');
      // now collect the parameters from the payload. we do need the
      // union of the client-parameters and the request-parameters
      for i := 0 to aParameters.Count - 1 do begin
        vParamList.Values[aParameters.Names[i]] := URIEncode(aParameters.ValueFromIndex[i]);
      end;

      // OAuth-spec requires the parameters to be sorted by their name
      vParamList.Sort;

      vParamList.LineBreak := '&';

      // Step #2 - build a single string from the params
      vParamsStr := vParamList.Text;
      // Remove the trailing "linebreak" '&' character.
      vParamsStr := vParamsStr.Remove(Length(vParamsStr) - Length(vParamList.LineBreak));

    finally
      vParamList.Free;
    end;

    // as per oauth-spec we do need the full URL without (!) any query-params

    // Step #3 - build the SignatureBaseString, the LSigningKey and the Signature
    vSigBaseStr := 'POST&' + URIEncode(aFullURL) + '&' + URIEncode(vParamsStr);

    vSigningKey := aConsumerSecret + '&';

    if aAccessTokenSecret <> '' then
      vSigningKey := vSigningKey + aAccessTokenSecret;
  //  else if aRequestTokenSecret <> '' then
  //    vSigningKey := vSigningKey + aRequestTokenSecret;

    Result := TNetEncoding.Base64.EncodeBytesToString(THashSHA1.GetHMACAsBytes(vSigBaseStr, vSigningKey));
  end;

var
  vToken, vTimeStamp, vNonce, vOAuthVersion, vSignatureMethod: string;
  vTokenBuilder: TStringList;
begin
  // update timestamp and nonce for this request
  // --> these values must not change while a request is running
  vNonce := _GenerateNonce;
  vTimeStamp := _GenerateTimeStamp;
  vOAuthVersion := '1.0';
  vSignatureMethod := 'HMAC-SHA1';

  vTokenBuilder := TStringList.Create;
  try

    _AddCommonAuthParameters(vTokenBuilder,
      aConsumerKey, vNonce, vSignatureMethod, vTimestamp, aAccessToken, vOAuthVersion, '"');

    vTokenBuilder.Values['oauth_timestamp'] := Format('"%s"', [URIEncode(vTimestamp)]);
    vTokenBuilder.Values['oauth_signature'] := Format('"%s"', [URIEncode(
      _BuildSignature(aParameters, aConsumerKey, aConsumerSecret,
      vNonce, vSignatureMethod, vTimestamp, aAccessToken, aAccessTokenSecret,
      vOAuthVersion, aFullURL))]);

    vTokenBuilder.Sort;

    vTokenBuilder.LineBreak := ', ';
    vToken := 'OAuth ' + vTokenBuilder.Text;
    vToken := vToken.Remove(Length(vToken) - Length(vTokenBuilder.LineBreak));

    Result := vToken;

  finally
    vTokenBuilder.Free;
  end;
end;

function HourGlass: ISnapshotInterface;
begin
  Result := TCursorSnapshot.Create;
  Screen.Cursor := crHourGlass;
end;

function LogActionMessage(
  const aStrings: Tstrings;
  const aMessageTxt: string;
  const aLogAsSingleMessage: Boolean): ISnapshotInterface; overload;
begin
  Result := TSendUserActivityMessageSnapshot.Create(aStrings, aMessageTxt, aLogAsSingleMessage);
end;

function MakeFileFriendly(const aUserName: string): string;
var
  vChar: Char;
begin
  Result := '';
  for vChar in aUserName do
  begin
    if SysUtils.CharInSet(vChar, ['\', '/', ':', '*', '?', '"', '<', '>', '|']) then
      Result := Result + '-'
    else
      Result := Result + vChar;
  end;
end;

function MyEncodeAsUTF8(const aUnicodeString: string): string;
begin
  Result := aUnicodeString;
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

constructor TFlickrPostRESTRequest.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.AcceptEncoding := 'gzip';
  Self.AcceptCharset := 'utf-8, *;q=0.8';
  Self.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
end;

function TFlickrPostRESTRequest.ContentType: TRESTContentType;
begin
  Result := ctMULTIPART_FORM_DATA;
end;

procedure TFlickrPostRESTRequest.DoPrepareRequestBody(AParamList: TRESTRequestParameterArray;
  AContentType: TRESTContentType; var ABodyStream: TStream; var ABodyStreamOwner: Boolean);

  procedure AddCommonAuthParameters(const aParams: TStringList);

    function FormatValue(const aValue: string): string;
    begin
      Result := aValue;
    end;

  var
    vAuthenticator: TOAuth1Authenticator;
  begin
    vAuthenticator := Self.Client.Authenticator as TOAuth1Authenticator;
    if vAuthenticator.CallbackEndpoint <> '' then
      aParams.Values['oauth_callback'] := FormatValue(vAuthenticator.CallbackEndpoint);
    if vAuthenticator.ConsumerKey <> '' then
      aParams.Values['oauth_consumer_key'] := FormatValue(vAuthenticator.ConsumerKey);
    aParams.Values['oauth_nonce'] := FormatValue(vAuthenticator.Nonce);
    aParams.Values['oauth_signature_method'] := FormatValue(vAuthenticator.SignatureMethod);
    aParams.Values['oauth_timestamp'] := FormatValue(vAuthenticator.Timestamp);
    if vAuthenticator.AccessToken <> '' then
      aParams.Values['oauth_token'] := FormatValue(vAuthenticator.AccessToken)
    else if vAuthenticator.RequestToken <> '' then
      aParams.Values['oauth_token'] := FormatValue(vAuthenticator.RequestToken);
    if vAuthenticator.VerifierPIN <> '' then
      aParams.Values['oauth_verifier'] := FormatValue(vAuthenticator.VerifierPIN);
    aParams.Values['oauth_version'] := FormatValue(vAuthenticator.Version);
  end;

var
  LParam: TRESTRequestParameter;
  b: TBytes;
  vMultipartFormData: TMultipartFormData;
  vParams: TStringList;
begin
  Assert(Assigned(Client));
  Assert(self.Method in [TRESTRequestMethod.rmPUT, TRESTRequestMethod.rmPOST, TRESTRequestMethod.rmPATCH]);

  if Self.ContentType <> TRESTContentType.ctMULTIPART_FORM_DATA then
  begin
    inherited DoPrepareRequestBody(AParamList, AContentType, ABodyStream, ABodyStreamOwner);
  end else begin

    vMultipartFormData := TMultipartFormData.Create();
    try

      vParams := TStringList.Create;
      AddCommonAuthParameters(vParams);

//      for i := 0 to vParams.Count - 1 do
//      begin
//        vMultipartFormData.AddField(vParams.Names[i], vParams.Values[vParams.Names[i]]);
//      end;

      vParams.Free;

      for LParam in AParamList do
      begin
        if LParam.Kind  = TRESTRequestParameterKind.pkGETorPOST then
        begin
          // Multipart
          // For multipart names of body parameters are written - in contrast to WWWForm  (see below)
          if SameText(ARGUMENTNAME_PHOTO, LParam.Name) then
            vMultipartFormData.AddFile(LParam.Name, LParam.Value)
          else
            vMultipartFormData.AddField(LParam.Name, MyEncodeAsUTF8(LParam.Value));
        end;
      end;

      for LParam in AParamList do
      begin
        if LParam.Kind = TRESTRequestParameterKind.pkREQUESTBODY then
        begin
          // Multipart
          // For multipart names of body parameters are written - in contrast to WWWForm  (see below)
          if SameText(ARGUMENTNAME_PHOTO, LParam.Name) then
            vMultipartFormData.AddFile(LParam.Name, LParam.Value)
          else
            vMultipartFormData.AddField(LParam.Name, MyEncodeAsUTF8(LParam.Value));
        end;
      end;

      // copy created stream before it will be freed
      ABodyStream := TStringStream.Create(vMultipartFormData.GetBodyHeader, TEncoding.UTF8);
      ABodyStream.Position := ABodyStream.Size;

      vMultipartFormData.Stream.Position := 0;
      ABodyStream.CopyFrom(vMultipartFormData.Stream, vMultipartFormData.Stream.Size);

      SetLength(b, ABodyStream.Size);
      ABodyStream.Position := 0;
      ABodyStream.ReadBuffer(b[0], ABodyStream.Size);
      {$WARN IMPLICIT_STRING_CAST_LOSS OFF}
      Self.FRequestBody := TEncoding.ANSI.GetString(b);
      {$WARN IMPLICIT_STRING_CAST_LOSS ON}
      //Self.FRequestBody := (ABodyStream as TStringStream).DataString;

    finally
      vMultipartFormData.Free;
    end;

  end;
end;

Const
  RussianMonthNames: array[1..12] of string = ('Январь','Февраль','Март','Апрель','Май','Июнь','Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь');

constructor TLocalFolder.Create;
begin
  Inherited Create;

  FFolderProcessingInfo := TStringList.Create;

  FTagsFromAlbumName := TStringList.Create;
  FTagsFromAlbumName.Sorted := True;
  FTagsFromAlbumName.Duplicates := dupIgnore;
  FLocalPhotos := TPhotoList.Create(TComparer<TLocalPhoto>.Construct(
    function(const Left, Right: TLocalPhoto): Integer
    begin
      if Left.DateTimeOriginal < Right.DateTimeOriginal then
        Result := -1
      else if Left.DateTimeOriginal > Right.DateTimeOriginal then
        Result := 1
      else if Left.Title < Right.Title then
        Result := -1
      else if Left.Title > Right.Title then
        Result := 1
      else if Left.PhotoID < Right.PhotoID then
        Result := -1
      else if Left.PhotoID > Right.PhotoID then
        Result := 1
      else
        Result := 0;
    end));
//  FCollections := TStringList.Create;
//  FCollections.Sorted := True;
//  FCollections.Duplicates := dupIgnore;
  FFlickrPhotosCS := TCriticalSection.Create;

  FIsLocalDataLoadedForAllPhotos := False;
  FIsUploadCompleteForAllPhotos := False;
  FSyncFileUpdated := False;
  FUploadFolder := False;
  FArchivedFolder := False;
  FProcessedPhotosCount := 0;

end;

destructor TLocalFolder.Destroy;
begin

  FAlbumName := '';
  FFlickrAlbumID := '';
  FSyncDataFileName := '';

  Clear;

  FreeAndNil(FFlickrPhotosCS);
  FreeAndNil(FFlickrPhotos);
  FreeAndNil(FLocalPhotos);
//  FreeAndNil(FCollections);
  FreeAndNil(FTagsFromAlbumName);
  FreeAndNil(FFolderProcessingInfo);

  inherited Destroy;
end;

function TLocalFolder.AddPhoto(const aFileName: string): TLocalPhoto;
begin
  Result := TLocalPhoto.Create(aFileName, FSyncDataFileName, FAlbumName, FTagsFromAlbumName);
  FLocalPhotos.Add(Result);
end;

function TLocalFolder.ApplyPicasaFileName: Boolean;
var
  vIniFile: TMemIniFile; // for picasa only this is working with UTF8 encoding
  vPhoto: TLocalPhoto;
  vIDlist: TStringList;
  i: integer;
  s, vPicasaFileName: string;
const
  Contacts2 = 'Contacts2';
begin

  Result := True;
  Assert(FSourceFolderFullName <> '');
  vPicasaFileName := System.SysUtils.IncludeTrailingPathDelimiter(FSourceFolderFullName) + '.picasa.ini';

  if not gPriorityPermissionsFlickr  and (gPicasaSettings.ApplyForFaces or gPicasaSettings.ApplyNoFaces) and FileExists(vPicasaFileName) then
  begin

    try
      vIniFile := TMemIniFile.Create(vPicasaFileName, TEncoding.UTF8);
    except
      vIniFile := TMemIniFile.Create(vPicasaFileName);
    end;

    try

      if vIniFile.SectionExists(Contacts2) then
      begin
        vIDlist := TStringList.Create;
        try
          vIniFile.ReadSectionValues(Contacts2, vIDlist);
          for i := 0 to vIDlist.Count - 1 do begin
            if not gPicasaSettings.FContacts.ContainsKey(vIDlist.Names[i]) then
              gPicasaSettings.FContacts.Add(vIDlist.Names[i], vIDlist.ValueFromIndex[i]);
          end;
        finally
          vIDlist.Free;
        end;
      end;

      for vPhoto in FLocalPhotos do
      begin
        // for merged albums some photos may already be associated with picasa.ini
        if not vPhoto.FPicasaApplied then
        begin
          s := vIniFile.ReadString(ExtractFileName(vPhoto.PhotoFileName), 'faces', '');
          vPhoto.ApplyPicasaFaces(vPicasaFileName, s);
        end;
      end;

    finally
      vIniFile.Free;
    end;

  end;
end;

procedure TLocalFolder.Clear;
var
  vPhoto: TLocalPhoto;
  vFlickrPhoto: TFlickrPhoto;
begin
//  OutputDebugMsgSnapShot(FAlbumName);

  if Assigned(FLocalPhotos) then
  begin
    for vPhoto in FLocalPhotos.ToArray do begin
      if Assigned(vPhoto) then
        vPhoto.Free;
    end;
    FLocalPhotos.Clear;
  end;

  if Assigned(FFlickrPhotos) then
  begin
    for vFlickrPhoto in FFlickrPhotos.Values.ToArray do
      if Assigned(vFlickrPhoto) then
        vFlickrPhoto.Free;
    FFlickrPhotos.Clear;
  end;

  if Assigned(FFolderProcessingInfo) then
    FFolderProcessingInfo.Clear;

//  FCollections.Clear;
  FAlbumName := '';
end;

function TLocalFolder.FindPhotoByID(const aFlickrPhotoID: string): TLocalPhoto;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to FLocalPhotos.Count - 1 do begin
    if FLocalPhotos[i].PhotoID = aFlickrPhotoID then
    begin
      Result := FLocalPhotos[i];
      Break;
    end;
  end;
end;

function TLocalFolder.Flickr_Load_PhotosForAlbum: Boolean;
var
  vXML: IbvXMLAccess;
  vID, vErrorMessage: string;
  i, vCnt, vTotal, vProcessed, vPageNo: integer;
  vFlickrPhoto: TFlickrPhoto;
begin

  vPageNo := 1;
  vProcessed := 0;
//  vTotal := 0;
//  vCnt := 0;

  Assert(not Assigned(FlickrPhotos));

  FFlickrPhotos := TFlickrPhotos.Create;

  repeat

    if ExecuteAPIMethod(Get_photosets_getPhotos(FlickrAlbumID, FlickrUserID, 'o_dims,url_o', '500', IntToStr(vPageNo), '', 'photos'), vXML, vErrorMessage) then
    begin
      vCnt := StrToInt(vXML.Element['rsp.photoset.photo[?]']);
      vTotal := StrToInt(vXML.Attribute['rsp.photoset.total']);
      for i := 0 to vCnt - 1 do begin
        vFlickrPhoto := TFlickrPhoto.Create;
        vFlickrPhoto.Title := vXML.Attribute[format('rsp.photoset.photo[%d].title', [i])];
        vID := vXML.Attribute[format('rsp.photoset.photo[%d].id', [i])];
        vFlickrPhoto.Height_o := StrToIntDef(vXML.Attribute[format('rsp.photoset.photo[%d].height_o', [i])], 0);
        vFlickrPhoto.Width_o := StrToIntDef(vXML.Attribute[format('rsp.photoset.photo[%d].width_o', [i])], 0);
        vFlickrPhoto.IsPrimary := vXML.Attribute[format('rsp.photoset.photo[%d].isprimary', [i])];
        FFlickrPhotos.Add(vID, vFlickrPhoto);
        inc(vProcessed);
      end;
      Result := True;
    end else begin
      Result := False;
      New(FCustomMessageRecord);
      FCustomMessageRecord^.CustomMessageToForm('Sync_LoadFlickrPhotosForAlbum failed for ' + FlickrAlbumID + #13 + vErrorMessage, mtError, [mbOK]);
      FreeAndNil(FFlickrPhotos);
      Exit;
    end;

    inc(vPageNo);

  until (vProcessed >= vTotal) or (vCnt = 0);

  FFolderProcessingInfo.Add('Load Photos');

end;

function TLocalFolder.Flickr_Sycronize_FolderWith_Album: Boolean;
var
  vXML: IbvXMLAccess;
  s, vErrorMessage, vPrimaryPhotoID: string;
  vPhoto: TLocalPhoto;
  vPhotosToUnlink: TStringList;
  vFlickrPhoto: TFlickrPhoto;
begin
  gFlickrAlbumsCriticalSection.Acquire;
  try

    Result := True;

    // must be loaded already
    Assert(Assigned(gFlickrAlbums));

    if not gFlickrAlbums.ContainsKey(FlickrAlbumID) then
      FlickrAlbumID := FindFlickrAlbumByName(AlbumName);

    if ArchivedFolder then
    begin
      Exit;
    end;

    if not Assigned(FlickrPhotos) then
    begin
      Result := Result and Flickr_Load_PhotosForAlbum;
    end;
    if not Result then
      exit;

    // must be loaded already
    Assert(Assigned(gFlickrAlbums));

    if gFlickrAlbums.ContainsKey(FlickrAlbumID) then
    begin
      // update tilte for existed album to be exact as local album name
      if not SameText(AlbumName, gFlickrAlbums.Items[FlickrAlbumID]) then
      begin
        if not ExecuteAPIMethod(Get_photosets_editMeta(FlickrAlbumID, AlbumName, ''), vXML, vErrorMessage) then
        begin
          Result := False;
          New(FCustomMessageRecord);
          FCustomMessageRecord^.CustomMessageToForm(AlbumName + ' - Sync_CreateMissedAlbums failed, photosets_editMeta:'#13 +
            vErrorMessage, mtError, [mbOK]);
          Exit;
        end;

        FFolderProcessingInfo.Add('Edit Meta');

        gFlickrAlbums.AddOrSetValue(FlickrAlbumID, AlbumName);

      end;
    end else begin

      FlickrAlbumID := FindFlickrAlbumByName(AlbumName);

      if FlickrAlbumID = '' then
      begin
        GetPrimaryPhotoID(vPrimaryPhotoID);

        if vPrimaryPhotoID <> '' then
        begin
          if ExecuteAPIMethod(Get_photosets_create(AlbumName, '', vPrimaryPhotoID), vXML, vErrorMessage) then
          begin
            FlickrAlbumID := vXML.Attribute['rsp.photoset.id'];
            Assert(FlickrAlbumID <> '');
            gFlickrAlbums.Add(FlickrAlbumID, AlbumName);
            Result := True;
            TInterlocked.Increment(gAlbumsCreated);
            FFolderProcessingInfo.Add('Created');
          end else begin
            Result := False;
            New(FCustomMessageRecord);
            FCustomMessageRecord^.CustomMessageToForm(AlbumName + ' - Sync_CreateMissedAlbums failed, photosets_create:'#13 +
              vErrorMessage, mtError, [mbOK]);
            Exit;
          end;
        end else begin
          FCustomMessageRecord^.CustomMessageToForm(AlbumName + ' - Sync_CreateMissedAlbums failed, PrimaryPhotoID is empty:'#13 +
            vErrorMessage, mtError, [mbOK]);
          Exit;
        end;
      end;

    end;

    Modified := GetPrimaryPhotoID(vPrimaryPhotoID) or Modified;
    if Modified and (vPrimaryPhotoID <> '') then
    begin
      DoLogInformation(Format('%s - updating with %d photos', [AlbumName, LocalPhotos.Count]));
      Result := Result and ExecuteAPIMethod(Get_photosets_editPhotos(FlickrAlbumID, vPrimaryPhotoID, GetListOfPhotos));
      if not Result then
        Exit;
      FFolderProcessingInfo.Add('Edit Photos');
    end;

    if not gDoNotUnlinkUnknownPhotosFromAlbum and not ArchivedFolder then
    begin
      // remove ophraned photos from flickr album

      vPhotosToUnlink := TStringList.Create;
      try

        vPhotosToUnlink.Sorted := True;
        vPhotosToUnlink.Duplicates := dupIgnore;

        for s in FlickrPhotos.Keys.ToArray do begin
          vPhoto := FindPhotoByID(s);
          if not Assigned(vPhoto) then
          begin
            vPhotosToUnlink.Add(s);
            // move unlinked photos - into non in set photos
            if FlickrPhotos.TryGetValue(s, vFlickrPhoto) then
            begin

              gFlickrPhotosNotInSetCriticalSection.Acquire;
              try

                gFlickrPhotosNotInSet.AddOrSetValue(s, vFlickrPhoto);
                FlickrPhotos.Remove(s);

              finally
                gFlickrPhotosNotInSetCriticalSection.Release;
              end;
            end;
          end;
        end;

        if vPhotosToUnlink.Count > 0 then
        begin
          DoLogInformation(Format('%s - unlink %d ophraned from album', [AlbumName, vPhotosToUnlink.Count]));
          Result := Result and ExecuteAPIMethod(Get_photosets_removePhotos(FlickrAlbumID, vPhotosToUnlink.CommaText));
          if not Result then
            Exit;
          FFolderProcessingInfo.Add('Remove Photos');
        end;

      finally
        vPhotosToUnlink.Free;
      end;
    end;

    SyncFileUpdated := True;

  finally
    gFlickrAlbumsCriticalSection.Release;
  end;

end;

function TLocalFolder.GetArchivedFolder: boolean;
begin
  Result := FArchivedFolder;
  if Result then
    Result := not FIgnoreArchivedFlag;
end;

function TLocalFolder.GetIsLocalDataLoadedForAllPhotos: Boolean;
var
  vPhoto: TLocalPhoto;
begin
  if not FIsLocalDataLoadedForAllPhotos then
  begin
    FIsLocalDataLoadedForAllPhotos := True;
    for vPhoto in FLocalPhotos do begin
      // all photos must be processed or failed at least 3 times
      FIsLocalDataLoadedForAllPhotos := FIsLocalDataLoadedForAllPhotos and
        vPhoto.ReadExifDone and vPhoto.ReadFileDataDone and vPhoto.ReadSyncIniDone {and vPhoto.CreateResizedJPGDone};
      if not FIsLocalDataLoadedForAllPhotos then
        Break;
    end;
  end;

  Result := FIsLocalDataLoadedForAllPhotos;

end;

function TLocalFolder.GetIsUploadCompleteForAllPhotos: Boolean;
var
  vPhoto: TLocalPhoto;
begin
  if IsLocalDataLoadedForAllPhotos then
  begin
    if not FIsUploadCompleteForAllPhotos then
    begin
      FIsUploadCompleteForAllPhotos := True;
      for vPhoto in FLocalPhotos do begin
        // all photos must be processed or failed at least 3 times
        FIsUploadCompleteForAllPhotos := FIsUploadCompleteForAllPhotos and
          (vPhoto.UploadComplete or (vPhoto.FailedPostCommands > 3));
        if not FIsUploadCompleteForAllPhotos then
          Break;
      end;
    end;

    Result := FIsUploadCompleteForAllPhotos;
  end else
    Result := False;
end;

function TLocalFolder.GetListOfPhotos: string;
var
  vPhoto: TLocalPhoto;
begin

  Result := '';

  for vPhoto in LocalPhotos.ToArray do begin
    // handle only succesfully completed photos - ignore errors
    if vPhoto.UploadComplete then begin
      if Result = '' then
        Result := vPhoto.PhotoID
      else
        Result := Result + ',' + vPhoto.PhotoID;
    end;
  end;

end;

function TLocalFolder.GetPrimaryPhotoID(out aPrimaryPhotoID: string): Boolean;
var
  vPrimaryPhotoIDPublic, vPrimaryPhotoID: string;
  vPhoto: TLocalPhoto;
  vFlickrPhoto: TFlickrPhoto;
  vAlbumPhotosChanged, vAlbumPrimaryPhotoChanged: boolean;
begin

  vPrimaryPhotoID := '';
  vPrimaryPhotoIDPublic := '';
  vAlbumPhotosChanged := False;
  vAlbumPrimaryPhotoChanged := False;

  for vPhoto in LocalPhotos.ToArray do begin

    // handle only succesfully completed photos - ignore errors
    if vPhoto.UploadComplete then begin
      // find existed flickr photo for existed album, new album has no flickr photos
      if Assigned(FlickrPhotos) and FlickrPhotos.ContainsKey(vPhoto.PhotoID) then
      begin
        vFlickrPhoto := FlickrPhotos.Items[vPhoto.PhotoID];
        if vFlickrPhoto.IsPrimary = '1' then
        begin
          // no changes
          Result := False;
          aPrimaryPhotoID := vPhoto.PhotoID;
          Exit;
        end;
      end;
      if vPrimaryPhotoIDPublic = '' then
      begin
        if vPhoto.IsPublic = '1' then
        begin
          vPrimaryPhotoIDPublic := vPhoto.PhotoID;
          vAlbumPrimaryPhotoChanged := True;
        end;
      end;
      if vPrimaryPhotoID = '' then
      begin
        vPrimaryPhotoID := vPhoto.PhotoID;
        vAlbumPrimaryPhotoChanged := True;
      end;
    end;
  end;

  aPrimaryPhotoID := IfThen(vPrimaryPhotoIDPublic <> '', vPrimaryPhotoIDPublic, vPrimaryPhotoID);

  Result := vAlbumPrimaryPhotoChanged or vAlbumPhotosChanged;

end;

function TLocalFolder.GetUploadFolder: boolean;
begin
  Result := FUploadFolder;
end;

function TLocalFolder.IsNewAlbum: Boolean;
begin
  Result := (FlickrAlbumID = '') or SameText(FlickrAlbumID, AlbumName)
end;

procedure TLocalFolder.SetAlbumName(const Value: string);

  procedure _ExtractAndAddTags(const aParseName: string);
  var
    vPos: integer;
    s, vTag: string;
  begin
    // try extract year as YYYY
    vPos := StrToIntDef(copy(aParseName, 1, 4), -1);
    if vPos > 0 then
    begin
      FTagsFromAlbumName.Add(vPos.ToString);
      s := Trim(copy(aParseName, 5));
      // try extract month as MM
      vPos := Pos(' - ', s);
      if vPos > 0 then
        s := Trim(copy(s, vpos + 3))
    end
    else
      s := aParseName;

    repeat
      vPos := pos(' - ', s);
      if vPos <= 0 then
      begin
        vTag := s;
        s := '';
      end else begin
        vTag := Trim(copy(s, 1, vPos - 1));
        s := Trim(copy(s, vPos + 3));
      end;

      if (vTag <> '') then
        FTagsFromAlbumName.Add(vTag);

    until s = '';

  end;

begin
  FAlbumName := Value;
  if FFlickrAlbumID = '' then
    FFlickrAlbumID := Value;
  // extract tags from folder name
  _ExtractAndAddTags(Value);
end;

procedure TLocalFolder.SetFlickrAlbumID(const Value: string);
begin
  if FFlickrAlbumID <> Value then
  begin
    FFlickrAlbumID := Value;
  end;
end;

procedure TLocalFolder.SetFolderNameRelative(const Value: string);
//var
//  s, v: string;
begin
  AlbumName := Trim(ExtractFileName(Value));
//  v := Value;
//
//  repeat
//    s := ExtractFileName(v);
//    if (s <> '') and (s <> FAlbumName) then
//      FCollections.Add(s);
//    v := ExcludeTrailingPathDelimiter(ExtractFilePath(v));
//  until v = '';

end;

procedure TLocalFolder.SetSyncDataFileName(const Value: string);
var
  vIniFile: TIniFileUnicode;
  vPhoto: TLocalPhoto;
begin
  FSyncDataFileName := Value;
  FUploadFolder := True;
  FArchivedFolder := False;

  if FileExists(FSyncDataFileName) then
  begin
    vIniFile := TIniFileUnicode.Create(FSyncDataFileName, fReadIni);
    try
      FFlickrAlbumID := vIniFile.ReadString('Album', 'FlickrAlbumID', '');
      FUploadFolder := vIniFile.ReadBool('Album', 'Upload', True);
      FArchivedFolder := vIniFile.ReadBool('Album', 'Archived', False);
    finally
      vIniFile.Free;
    end;
  end;

  for vPhoto in FLocalPhotos do begin
    vPhoto.SyncDataFileName := FSyncDataFileName;
  end;

  // should not be different album with the same flickr ID
  if gWorkAlbumsFromFolders.ContainsKey(FFlickrAlbumID) then
    FFlickrAlbumID := '';

  if FFlickrAlbumID = '' then
    FFlickrAlbumID := AlbumName;
end;

procedure TLocalFolder.SetSyncFileUpdated(const Value: Boolean);
begin
  FSyncFileUpdated := Value;

  if FSyncFileUpdated then
    WriteSyncIniFile(False);

end;

procedure TLocalFolder.WriteSyncIniFile(const aForceWrite: boolean);
var
  vIniFile: TIniFileUnicode;
  vSections: TStringList;
  s: string;
  vPhoto: TLocalPhoto;
  i: Integer;
begin
  vIniFile := TIniFileUnicode.Create(FSyncDataFileName, fWriteIni);
  try

    vIniFile.WriteRequired := aForceWrite or
      not vIniFile.ValueExists('Album', 'FlickrAlbumID') or
      not vIniFile.ValueExists('Album', 'Upload') or
      not vIniFile.ValueExists('Album', 'Archived') or
      (FFlickrAlbumID <> vIniFile.ReadString('Album', 'FlickrAlbumID', ''));

    if IsUploadCompleteForAllPhotos then
    begin
      // only if All photos loaded and processed remove ophraned photo sections
      vSections := TStringList.Create;
      try
        vIniFile.ReadSections(vSections);
        i := vSections.IndexOf('Album');
        if i <> -1 then
          vSections.Delete(i);
        for vPhoto in FLocalPhotos do begin
          i := vSections.IndexOf(vPhoto.ImageUniqueID);
          if i <> -1 then
            vSections.Delete(i);
        end;

        for s in vSections do begin
          vIniFile.EraseSection(s);
          vIniFile.WriteRequired := True;
        end;

      finally
        vSections.Free;
      end;
    end;

    if vIniFile.WriteRequired then
    begin
      vIniFile.WriteString('Album', 'FlickrAlbumID', FFlickrAlbumID);
      vIniFile.WriteBool('Album', 'Upload', FUploadFolder);
      vIniFile.WriteBool('Album', 'Archived', FArchivedFolder);
    end;

  finally
    vIniFile.Free;
  end;

end;

function FindFlickrAlbumByName(const aAlbumName: string): string;
var
  s: string;
begin

  Result := '';

  Assert(Assigned(gFlickrAlbums));

  for s in gFlickrAlbums.Keys.ToArray do begin
    if gFlickrAlbums[s] = aAlbumName then
    begin
      Result := s;
      Break;
    end;
  end;

end;

constructor TLocalPhoto.Create(const aPhotoFileName, aSyncDataFileName, aAlbumName: string; const aTags: TStrings);
begin
  inherited Create;

  FProcessingInfo := TStringList.Create;
  FTagsInternal := TStringList.Create;
  FTagsInternal.Sorted := True;
  FTagsInternal.Duplicates := dupIgnore;
  AddTags(aTags);
  PhotoFileName := aPhotoFileName;
  FAlbumName := aAlbumName;
  ClearChanges;

  FCreateResizedJPGDone := not gDoResize;
  FReadExifDone := False;
  FReadFileDataDone := False;
  FReadSyncIniDone := False;
  FRequireResizedImage := False;
  FUploadComplete := False;

  SyncDataFileName := aSyncDataFileName;
end;

destructor TLocalPhoto.Destroy;
begin
//  OutputDebugMsgSnapShot(FPhotoFileName);

  FPicasaWarning := '';
  FreeAndNil(FProcessingInfo);
  FreeAndNil(FTagsInternal);
  if not gDoSaveResizedPhotos and (FResizedPhotoFileName <> '') then
  begin
    System.SysUtils.DeleteFile(FResizedPhotoFileName);
  end;
  FResizedPhotoFileName := '';

  if (FPhotoFileNameBackup <> '') then
  begin
    if UploadComplete then
      System.SysUtils.DeleteFile(FPhotoFileNameBackup)
    else
      RenameFile(FPhotoFileNameBackup, FPhotoFileName);
  end;

  inherited;
end;

procedure TLocalPhoto.AddTag(const aTag: string);
begin
  if FTagsInternal.IndexOf(aTag) = -1 then
  begin
    FChanged_Tags := True;
    FTagsInternal.Add(aTag);
  end;
end;

procedure TLocalPhoto.AddTags(const aTags: tstrings);
var
  i: integer;
begin
  for i := 0 to aTags.Count - 1 do
    AddTag(aTags[i]);
end;

function TLocalPhoto.ApplyPicasaFaces(const aPicasaFileName, aFaces: String): Boolean;
const
  FACETOIGNORE = 'ffffffffffffffff'; // this face id picasa marks as ignored
var
  vFaces: TStringList;
  i: integer;
  vFace, vName: string;
begin
  // Picasa changes may affect Tags and Acces Level

  FPicasa := aFaces;
  FPicasaApplied := True;

  Result := True;

  if FPicasa <> '' then
  begin
    // add Tags for Faces
    vFaces := TStringList.Create;
    try

      // rect64(89e91ca0a2ec2cf3),ffffffffffffffff;rect64(5e44684f82ef80a1),e1d185388ca5ca0f;rect64(7e825545a7016ffa),e22826cdd5077c3a
      vFaces.CommaText := ReplaceText(FPicasa, ';', ',');
      i := vFaces.Count - 2;
      while i >=0 do begin
        vFaces.Delete(i);
        Dec(i, 2);
      end;

      i := vFaces.IndexOf(FACETOIGNORE);
      while i <> -1 do begin
        vFaces.Delete(i);
        i := vFaces.IndexOf(FACETOIGNORE);
      end;

      if vFaces.Count > 0 then begin
        if gPicasaSettings.ApplyForFaces then
        begin
          AddTag('People');
          FIsPublic := gPicasaSettings.IsPublicForFaces;
          FIsFamily := gPicasaSettings.IsFamilyForFaces;
          FIsFriend := gPicasaSettings.IsFriendForFaces;
          FPermissionAddMeta := gFlickrSettings.PermissionAddMeta;
          FPermissionComment := gFlickrSettings.PermissionComment;

          for vFace in vFaces do begin

            if gPicasaSettings.FContacts.TryGetValue(vFace, vName) then
            begin

              if vName = '' then
                Continue;

              AddTag(vName);

            end else begin
              FPicasaWarning := Format('Unknown contact id: '#13#13 +
                'Photo ID: %s '#13'Contact ID: %s '#13'File: %s', [FPhotoFileName, vFace, aPicasaFileName]);
              New(FCustomMessageRecord);
              FCustomMessageRecord^.CustomMessageToForm(FPicasaWarning, mtWarning, [mbIgnore, mbCancel], mbIgnore, 5000);
              gPicasaSettings.FContacts.Add(vFace, 'Unknown - id:' + vFace);
              PicasaWarning := Format('Unknown contact id is used in picasa.ini'#13#13 +
                'Photo ID: %s'#13'Contact ID: %s'#13'File: %s', [FPhotoFileName, vFace, aPicasaFileName]);
            end;
          end;
        end;
      end else begin
        if gPicasaSettings.ApplyNoFaces then
        begin
          FIsPublic := gPicasaSettings.IsPublicNoFaces;
          FIsFamily := gPicasaSettings.IsFamilyNoFaces;
          FIsFriend := gPicasaSettings.IsFriendNoFaces;
          FPermissionAddMeta := gFlickrSettings.PermissionAddMeta;
          FPermissionComment := gFlickrSettings.PermissionComment;
        end;
      end;

    finally
      vFaces.Free;
    end;

  end else begin
    if gPicasaSettings.ApplyNoFaces then
    begin
      FIsPublic := gPicasaSettings.IsPublicNoFaces;
      FIsFamily := gPicasaSettings.IsFamilyNoFaces;
      FIsFriend := gPicasaSettings.IsFriendNoFaces;
      FPermissionAddMeta := gFlickrSettings.PermissionAddMeta;
      FPermissionComment := gFlickrSettings.PermissionComment;
    end;
  end;
end;

procedure TLocalPhoto.ClearChanges;
begin
  FChanged_File := False;
  FChanged_Tags := False;
  FChanged_Title := False;
  FChanged_Picasa := False;
  FChanged_Description := False;
  FChanged_Access := False;
//  FChanged_Flickr := False;
end;

function TLocalPhoto.CreateResizedJPG: Boolean;

  procedure __SmoothResize(const aSrc, aDst: Vcl.Graphics.TBitmap);
  var
    x, y, xP, yP, xP2, yP2, w1, w2, w3, w4, t3, z, z2, iz2: Integer;
    vSrcLine1, vSrcLine2, vDstLine: pRGBArray;
    vRed, vGreen, vBlue: Cardinal;
  begin
    aSrc.PixelFormat := pf24Bit;
    aDst.PixelFormat := pf24Bit;

    if ((aSrc.Width = aDst.Width) and (aSrc.Height = aDst.Height)) or (aDst.Width <=1) or (aDst.Height <=1) then
    begin
      aDst.Assign(aSrc);
    end else begin

      xP2 := MulDiv(pred(aSrc.Width), $10000, aDst.Width);
      yP2 := MulDiv(pred(aSrc.Height), $10000, aDst.Height);
      yP  := 0;

      for y := 0 to aDst.Height - 1 do
      begin
        vDstLine := aDst.ScanLine[y];
        xP := 0;

        vSrcLine1 := aSrc.ScanLine[yP shr 16];

        if (yP shr 16 < Pred(aSrc.Height)) then
          vSrcLine2 := aSrc.ScanLine[succ(yP shr 16)]
        else
          vSrcLine2 := aSrc.ScanLine[yP shr 16];

        z2  := Succ(yP and $FFFF);
        iz2 := Succ((not yp) and $FFFF);
        for x := 0 to aDst.Width - 1 do
        begin
          t3 := xP shr 16;
          z  := xP and $FFFF;
          w2 := MulDiv(z, iz2, $10000);
          w1 := iz2 - w2;
          w4 := MulDiv(z, z2, $10000);
          w3 := z2 - w4;
          vRed := (vSrcLine1[t3].rgbtRed * w1 + vSrcLine1[t3 + 1].rgbtRed * w2 +
            vSrcLine2[t3].rgbtRed * w3 + vSrcLine2[t3 + 1].rgbtRed * w4) shr 16;
          vDstLine[x].rgbtRed := vRed;
          vGreen := (vSrcLine1[t3].rgbtGreen * w1 + vSrcLine1[t3 + 1].rgbtGreen * w2 +
            vSrcLine2[t3].rgbtGreen * w3 + vSrcLine2[t3 + 1].rgbtGreen * w4) shr 16;
          vDstLine[x].rgbtGreen := vGreen;
          vBlue := (vSrcLine1[t3].rgbtBlue * w1 + vSrcLine1[t3 + 1].rgbtBlue * w2 +
            vSrcLine2[t3].rgbtBlue * w3 + vSrcLine2[t3 + 1].rgbtBlue * w4) shr 16;
          vDstLine[x].rgbtBlue := vBlue;
          Inc(xP, xP2);
        end; {for}
        Inc(yP, yP2);
      end; {for}
    end; {if}
  end;

  procedure __AddKeyWord(var aKeywords: TIPTCStringArray; const aKeyWord: string);

    function ___FindKeyword(const aKeywords: TIPTCStringArray; const aKeyWord: string): Boolean;
    var
      s: string;
    begin
      Result := False;
      for s in aKeywords do begin
        if SameText(s, aKeyWord) then
        begin
          Result := True;
          Break;
        end;
      end;
    end;

  begin
    if (aKeyWord <> '') and not ___FindKeyword(aKeywords, aKeyWord) then
    begin
      aKeywords := aKeywords + [aKeyWord];
//        SetLength(aKeywords, Length(aKeywords) + 1);
//        aKeywords[Length(aKeywords) - 1] := aKeyWord;
    end;
  end;

  function _ParseFileNameForDateTime(const aParseName: string): TDateTime;
  var
    y,m,d,h,n,s: integer;
  begin
    Result := MinDateTime;
    y := StrToIntDef(copy(aParseName, 1, 4), 0);
    if (y > 1800) and (y < 2100) then
    begin
      m := StrToIntDef(copy(aParseName, 6, 2), 0);
      if (m > 0) and (m < 12) then
      begin
        d := StrToIntDef(copy(aParseName, 9, 2), 0);
        if (d > 0) and (d < 31) then
        begin
          try
            Result := EncodeDate(y, m, d);
          except
            Result := MinDateTime;
            exit;
          end;
          h := StrToIntDef(copy(aParseName, 12, 2), 0);
          if (h >= 0) and (h <= 23) then
          begin
            n := StrToIntDef(copy(aParseName, 14, 2), 0);
            if (n >= 0) and (n <= 59) then
            begin
              s := StrToIntDef(copy(aParseName, 16, 2), 0);
              if (s >= 0) and (s <= 59) then
              try
                Result := EncodeDateTime(y, m, d, h, n, s, 0);
              except
                Result := MinDateTime;
                exit;
              end;
            end;
          end;
        end;
      end;
    end;
  end;

  function _RemoveCalendarEntries(const aKeyString: string): string;
  var
    y, m: integer;
  begin
    Result := Trim(aKeyString);
    y := StrToIntDef(copy(Result, 1, 4), 9999);
    if (y > 1800) and (y < 2100) then
    begin
      if Length(Result) = 4 then
      begin
        Result := '';
        Exit;
      end;
      m := StrToIntDef(copy(Result, 6, 2), 0);
      if (m >= 1) and (m <= 12) then
      begin
        if StartsText(FormatSettings.LongMonthNames[m], copy(Result, 9)) then
          Result := Trim(copy(Result, 9 + length(FormatSettings.LongMonthNames[m])));
      end;
    end;
  end;

  procedure __AddKeyWord_Calendar(var aIPTCKeywords: TIPTCStringArray; const aParseName: string);
  var
    vDigit: integer;
  begin
    vDigit := StrToIntDef(copy(aParseName, 1, 4), -1);
    if vDigit <> -1 then
    begin
      __AddKeyWord(aIPTCKeywords, IntToStr(vDigit));
      vDigit := StrToIntDef(copy(aParseName, 6, 2), -1);
      if (vDigit >= 1) and (vDigit <= 12) then
      begin
        __AddKeyWord(aIPTCKeywords, FormatSettings.LongMonthNames[vDigit]);
        __AddKeyWord(aIPTCKeywords, RussianMonthNames[vDigit]);
        if (vDigit >= 3) and (vDigit <= 5) then
        begin
          __AddKeyWord(aIPTCKeywords, 'Spring');
          __AddKeyWord(aIPTCKeywords, 'Весна');
        end else
        if (vDigit >= 6) and (vDigit <= 8) then
        begin
          __AddKeyWord(aIPTCKeywords, 'Summer');
          __AddKeyWord(aIPTCKeywords, 'Лето');
        end else
        if (vDigit >= 9) and (vDigit <= 11) then
        begin
          __AddKeyWord(aIPTCKeywords, 'Fall');
          __AddKeyWord(aIPTCKeywords, 'Autumn');
          __AddKeyWord(aIPTCKeywords, 'Осень');
        end else
        if (vDigit >= 12) or (vDigit <= 2) then
        begin
          __AddKeyWord(aIPTCKeywords, 'Winter');
          __AddKeyWord(aIPTCKeywords, 'Зима');
        end;
      end;
    end;
  end;

var
  s, vTags: string;
  vPhotoFileStream: TFileStream;
  vBitmap, vNewBitmap: TBitmap;
  vJpegEx: TJPEGImageEx;
  vIPTCKeywords: TIPTCStringArray;
  vExifStrm, vIPTCStrm, vXMPStream: TMemoryStream;
begin

  Result := True;

  if not gDoResize then
  begin
   FCreateResizedJPGDone := True;
   FRequireResizedImage := False;
  end;

  if FCreateResizedJPGDone or not FRequireResizedImage then
    Exit;

  vExifStrm := nil;
  vIPTCStrm := nil;
  vXMPStream := nil;

  vJpegEx := TJPEGImageEx.Create;
  try

    try

      gFileAccessCriticalSection.Acquire;
      try

        vPhotoFileStream := TFileStream.Create(FPhotoFileName, fmOpenRead or fmShareDenyWrite);
        try

          vPhotoFileStream.Position := 0;
          vJpegEx.ExifData.EnforceASCII := False;
          vJpegEx.IPTCData.AlwaysAssumeUTF8Encoding := True;
          vJpegEx.LoadFromStream(vPhotoFileStream);

          vIPTCKeywords := vJpegEx.IPTCData.Keywords;
          __AddKeyWord_Calendar(vIPTCKeywords, ExtractFileName(FPhotoFileName));

          if vJpegEx.IPTCData.Sections[isEnvelope].TagExists(itModelVersion) then
            vJpegEx.IPTCData.Sections[isEnvelope].Remove(itModelVersion);
          if vJpegEx.IPTCData.Sections[isApplication].TagExists(itRecordVersion) then
            vJpegEx.IPTCData.Sections[isApplication].Remove(itRecordVersion);

          vJpegEx.IPTCData.Keywords := vIPTCKeywords;
          vTags := '';
          for s in vIPTCKeywords do begin
            AddTag(Trim(s));
          end;

          vJpegEx.ExifData.SetAllDateTimeValues(DateTimeOriginal);

        finally
          vPhotoFileStream.Free;
        end;

      finally
        gFileAccessCriticalSection.Release;
      end;

    except
      on E: Exception do begin
        New(FCustomMessageRecord);
        FCustomMessageRecord^.CustomMessageToForm('CreateResizedJPG - define if resize is required failed:'#13 + E.Message, mtError, [mbOK]);
        Result := False;
        Exit;
      end;
    end;

    // do actual resize
    vBitmap := TBitmap.Create;
    try

      vBitmap.Assign(vJpegEx);

      if gDoSaveResizedPhotos then
      begin
        FResizedPhotoFileName := IncludeTrailingPathDelimiter(gSaveResizedPhotosFolder) + FAlbumName;

        if not DirectoryExists(FResizedPhotoFileName) then
          gDoSaveResizedPhotos := ForceDirectories(FResizedPhotoFileName);

        if gDoSaveResizedPhotos then
          FResizedPhotoFileName := IncludeTrailingPathDelimiter(FResizedPhotoFileName) + ExtractFileName(FPhotoFileName)
        else
          FResizedPhotoFileName := TPath.GetTempPath + '$tmp$' + ImageUniqueID + '.jpg';
      end else begin
        FResizedPhotoFileName := TPath.GetTempPath + '$tmp$' + ImageUniqueID + '.jpg';
      end;

      vNewBitmap := TBitmap.Create;
      try

        Assert((FNewWidth <> 0) and (FNewHeight <> 0));

        vNewBitmap.Width := FNewWidth;
        vNewBitmap.Height:= FNewHeight;

        __SmoothResize(vBitmap, vNewBitmap);

        vExifStrm := TMemoryStream.Create;
        vJpegEx.ExifData.SaveToStream(vExifStrm);
        vIPTCStrm := TMemoryStream.Create;
        vJpegEx.IPTCData.SaveToStream(vIPTCStrm);
        vXMPStream:= TMemoryStream.Create;
        vJpegEx.XMPPacket.SaveToStream(vXMPStream);

        vJpegEx.Assign(vNewBitmap);

        vJpegEx.CompressionQuality := gResizeJpgQuality;
        vJpegEx.ProgressiveEncoding := True;
        vJpegEx.Compress;

      finally
        vNewBitmap.Free;
      end;

      if Assigned(vExifStrm) then
      begin
        vExifStrm.Position := 0;
        vJpegEx.ExifData.LoadFromStream(vExifStrm);
        FreeAndNil(vExifStrm);
      end;
      if Assigned(vIPTCStrm) then
      begin
        vIPTCStrm.Position := 0;
        vJpegEx.IPTCData.LoadFromStream(vIPTCStrm);
        FreeAndNil(vIPTCStrm);
      end;
      if Assigned(vXMPStream) then
      begin
        vXMPStream.Position := 0;
        try
        vJpegEx.XMPPacket.LoadFromStream(vXMPStream);
        except
          on E: EInvalidXMPPacket do
          begin
            DoLogError(Format('CreateResizedJPG "%s" has corrupted XMP Packed'#13'%s', [FPhotoFileName, E.Message]));
          end;
          on E: Exception do begin
            New(FCustomMessageRecord);
            FCustomMessageRecord^.CustomMessageToForm('CreateResizedJPG resize failed:'#13 + E.Message, mtError, [mbOK]);
            vJpegEx.XMPPacket.Clear;
          end;
        end;
        FreeAndNil(vXMPStream);
      end;

      vJpegEx.SaveToFile(FResizedPhotoFileName);
      vJpegEx.ExifData.SaveToGraphic(FResizedPhotoFileName);
      vJpegEx.IPTCData.SaveToGraphic(FResizedPhotoFileName);
      vJpegEx.XMPPacket.SaveToGraphic(FResizedPhotoFileName);
      FileSetDate(FResizedPhotoFileName, DateTimeToFileDate(DateTimeOriginal));

      Result := True;

      FProcessingInfo.Add('CreateResizedJPG');

    finally
      vBitmap.Free;
    end;

  finally
    vJpegEx.Free;
  end;

end;

function TLocalPhoto.GenerateImageUniqueID: string;
begin
  Result := THashMD5.GetHashString(
    IntToStr(GetCurrentThreadId) + FormatDateTime('ddmmsszzz', now) + IntToStr(Random(MaxInt)));
end;

function TLocalPhoto.GetHasChanges: boolean;
begin
  Result := (FPhotoID = '') or
    FChanged_File or
    FChanged_Tags or
    FChanged_Title or
    FChanged_Picasa or
    FChanged_Description or
    FChanged_Access{ or
    FChanged_Flickr};
end;

function TLocalPhoto.GetIsFamily: String;
begin
  Result := IfThen(FIsFamily = '', gFlickrSettings.IsFamily_Default, FIsFamily);
end;

function TLocalPhoto.GetIsFriend: String;
begin
  Result := IfThen(FIsFriend = '', gFlickrSettings.IsFriend_Default, FIsFriend);
end;

function TLocalPhoto.GetIsPublic: String;
begin
  Result := IfThen(FIsPublic = '', gFlickrSettings.IsPublic_Default, FIsPublic);
end;

function TLocalPhoto.GetPerm_AddMeta: String;
begin
  Result := IfThen(FPermissionAddMeta = '', gFlickrSettings.PermissionAddMeta_Default, FPermissionAddMeta);
end;

function TLocalPhoto.GetPerm_Comment: String;
begin
  Result := IfThen(FPermissionComment = '', gFlickrSettings.PermissionComment_Default, FPermissionComment);
end;

function TLocalPhoto.GetPhotoPermissions(
  out aIsFamily, aIsFriend, aIsPublic, aPermissionAddMeta, aPermissionComment: String;
  out vPhotoExists: boolean): boolean;
var
  vXML: IbvXMLAccess;
  vErrorMessage: string;
begin

  if PhotoID <> '' then
  begin
    // validate if photo exists - flickr.photos.getPerms - Get permissions for a photo.
    if ExecuteAPIMethod(Get_photos_getPerms(PhotoID), vXML, vErrorMessage) then
    begin
      //<perms id="2733" ispublic="1" isfriend="1" isfamily="0" permcomment="0" permaddmeta="1" />
      aIsFamily := vXML.Attribute['rsp.perms.isfamily'];
      Assert(aIsFamily <> '');
      aIsFriend := vXML.Attribute['rsp.perms.isfriend'];
      Assert(aIsFriend <> '');
      aIsPublic := vXML.Attribute['rsp.perms.ispublic'];
      Assert(aIsPublic <> '');
      aPermissionAddMeta := vXML.Attribute['rsp.perms.permaddmeta'];
      Assert(aPermissionAddMeta <> '');
      aPermissionComment := vXML.Attribute['rsp.perms.permcomment'];
      Assert(aPermissionComment <> '');
      vPhotoExists := True;
      Result := True;
    end else begin
      if Assigned(vXML) and (vXML.Attribute['rsp.err.code'] = '1') then
      begin
        vPhotoExists := False;
        Result := True;
      end else
        Result := False;
    end;
  end else begin
    New(FCustomMessageRecord);
    FCustomMessageRecord^.CustomMessageToForm('GetPhotoPermissions for empty PhotoID', mtError, [mbOK]);
    Result := False;
  end;
end;

function TLocalPhoto.GetPreparedPhotoFileName: string;
begin
  if FRequireResizedImage then
  begin
    Result := FResizedPhotoFileName
  end else
    Result := FPhotoFileName;

  Assert(Result <> '');
end;

function TLocalPhoto.GetTags: string;
var
  i: Integer;
  s: string;
begin
  Result := '';
  for i := 0 to FTagsInternal.Count - 1 do begin
    s := FTagsInternal[i];
    if pos(' ', s) > 0 then
      s := s.QuotedString('"');
    Result := Result + IfThen(Result = '', '', ' ') + s;
  end;
end;

function TLocalPhoto.IsImageUniqueIDValid(const aImageUniqueID: string): Boolean;
var
  vch: Char;
  s: string;
begin
  Result := Length(aImageUniqueID) = 32;

  if Result then
  begin
    for vch in aImageUniqueID do begin
      Result := CharInSet(vch, ['0'..'9','a'..'f','A'..'F']);
      if not Result then
        Break;
    end;
  end;

  if Result then
  begin

    gImageUniqueIDAccessCriticalSection.Acquire;
    try

      s := LowerCase(aImageUniqueID);

      // if exists - request another one
      if gImageUniqueIDList.ContainsKey(s) then
        Result := False
      else
        gImageUniqueIDList.AddOrSetValue(s, '');

    finally
      gImageUniqueIDAccessCriticalSection.Release;
    end;
  end;

  if not Result then
    FImageUniqueID := '';

end;

//function TLocalPhoto.IsPhotoExist: boolean;
//var
//  vIsFamily, vIsFriend, vIsPublic, vPermissionAddMeta, vPermissionComment: String;
//begin
//  Result := GetPhotoPermissions(
//    vIsFamily, vIsFriend, vIsPublic, vPermissionAddMeta, vPermissionComment);
//end;

function TLocalPhoto.PostPhotoToFlickr(const aAsync: Boolean;
  out aResponseText, aUploadedPhotoID, aTicketID: string ): Boolean;
var
  vMFData: TIdMultiPartFormDataStream;
  i: Integer;
  vFullURL: String;
  vParameters: TStringList;
  vXML: IbvXMLAccess;
  vIsUpload: Boolean;
  vUploadSize: int64;
  vIdHTTP: TIdHTTP;
  vIdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL;
begin

  //gFlickrPostPhotoCriticalSection.Acquire;
  try

  vIsUpload := PhotoID = '';
  vUploadSize := 0;

  Result := False;
  aResponseText := '';
  aUploadedPhotoID := '';
  aTicketID := '';

  //ResetRESTComponentsToDefaults;

  // 1. as per oauth-spec we do need the full URL without (!) any query-params
  // 2. aPhoto_id is non empty - it is replacing command
  if vIsUpload then
    vFullURL := FlickrUploadingPhotosURL
  else
    vFullURL := FlickrReplacingPhotosURL;

  vMFData := TIdMultiPartFormDataStream.Create;
  try

    vParameters := TStringList.Create;
    try

      // parameters specific to uploading photo
      //title (optional)
      //    The title of the photo.
      //description (optional)
      //    A description of the photo. May contain some limited HTML.
      //tags (optional)
      //    A space-seperated list of tags to apply to the photo.
      //is_public, is_friend, is_family (optional)
      //    Set to 0 for no, 1 for yes. Specifies who can view the photo.
      //safety_level (optional)
      //    Set to 1 for Safe, 2 for Moderate, or 3 for Restricted.
      //content_type (optional)
      //    Set to 1 for Photo, 2 for Screenshot, or 3 for Other.
      //hidden (optional)
      //    Set to 1 to keep the photo in global search results, 2 to hide from public searches.

      if vIsUpload then
      begin
//        if Description <> '' then
//          vParameters.Values['description'] := MyEncodeAsUTF8(Description);
//        if Title <> '' then
//          vParameters.Values['title'] := MyEncodeAsUTF8(Title);
//        if Tags <> '' then
//          vParameters.Values['tags'] := MyEncodeAsUTF8(Tags);
        vParameters.Values['is_public'] := IsPublic;
        vParameters.Values['is_friend'] := IsFriend;
        vParameters.Values['is_family'] := IsFamily;
        vParameters.Values['safety_level'] := '1';
        vParameters.Values['content_type'] := '1';
        vParameters.Values['hidden'] := IfThen(IsPublic = '1', '0', '1');
      end;

      // parameters specific to replacing photo
      //photo_id
      //    The ID of the photo to replace.

      if not vIsUpload then
        vParameters.Values['photo_id'] := PhotoID;

      //async (optional)
      //    set to 1 for async mode, 0 for sync mode
      //    Photos may be replaced in async mode, for applications that don't want to wait around for an upload to complete,
      //    leaving a socket connection open the whole time. Processing photos asynchronously is recommended.
      //    Please consult the documentation for details.
      //photo
      //    The file to upload.

      vParameters.Values['async'] := IfThen(aAsync, '1', '0');

      // prepare form for http request
      for i := 0 to vParameters.Count - 1 do begin
        vMFData.AddFormField(vParameters.Names[i], vParameters.ValueFromIndex[i]);
      end;

      // finally add the photo
      vMFData.AddFile(ARGUMENTNAME_PHOTO, PreparedPhotoFileName);

      vIdSSLIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      try

        vIdSSLIOHandler.MaxLineAction := maException;
        vIdSSLIOHandler.Port := 0;
        vIdSSLIOHandler.DefaultPort := 0;
        vIdSSLIOHandler.SSLOptions.Mode := sslmUnassigned;
        vIdSSLIOHandler.SSLOptions.VerifyMode := [];
        vIdSSLIOHandler.SSLOptions.VerifyDepth := 0;

        vIdHTTP := TIdHTTP.Create(nil);
        try

          vIdHTTP.IOHandler := vIdSSLIOHandler;
          vIdHTTP.AllowCookies := True;
          vIdHTTP.HandleRedirects := True;
          vIdHTTP.ProxyParams.BasicAuthentication := False;
          vIdHTTP.ProxyParams.ProxyPort := 0;
          vIdHTTP.Request.ContentLength := -1;
          vIdHTTP.Request.ContentRangeEnd := -1;
          vIdHTTP.Request.ContentRangeStart := -1;
          vIdHTTP.Request.ContentRangeInstanceLength := -1;
          vIdHTTP.Request.Accept := 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
          vIdHTTP.Request.BasicAuthentication := False;
          vIdHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible; Indy Library)';
          vIdHTTP.Request.Ranges.Units := 'bytes';
          vIdHTTP.Request.Ranges.Clear;

          vIdHTTP.Disconnect;
          vIdHTTP.Request.Clear;
          vIdHTTP.Request.Charset := 'utf-8';
          vIdHTTP.Request.CustomHeaders.Clear;
          vIdHTTP.Request.RawHeaders.Clear;
          vIdHTTP.Response.Clear;
          vIdHTTP.Response.RawHeaders.Clear;
          vIdHTTP.HandleRedirects := True;
          vIdHTTP.Request.BasicAuthentication := False;
          vIdHTTP.Request.CustomHeaders.AddValue('Authorization',
            GetOAuthAuthenticateHeaderValue(vParameters,
              ApplicationConsumerKey,
              ApplicationConsumerSecret,
              // OAuthAuthenticator.CallbackEndpoint,
              MyAccessToken,
              MyAccessTokenSecret,
              vFullURL) // as per oauth-spec we do need the full URL without (!) any query-params
              );
          vIdHTTP.HTTPOptions := vIdHTTP.HTTPOptions + [hoKeepOrigProtocol, hoForceEncodeParams];
          try

            aResponseText := vIdHTTP.Post(vFullURL, vMFData);
            vUploadSize := vMFData.Size;

            if ContainsText(aResponseText, '<?xml version=') then
            begin
              vXML := TbvXMLAccess.Create(aResponseText);
              Result := SameText(vXML.Attribute['rsp.stat'], rspOK);
              if Result then
              begin

                if aAsync then begin
                  // ticketid is NOT the id of the new photo, but rather an id which can be used to check on the progress of the uploaded photo.
                  // Querying tickets: Once you've uploaded one or more photos and have some ticket ids,
                  // you can check their status with a call to the flickr.photos.upload.checkTickets
                  aTicketID := vXML.Element['rsp.ticketid'];
                end else begin
                  if vIsUpload then
                  begin
                    aUploadedPhotoID := vXML.Element['rsp.photoid'];
                  end else begin
                    // there are secrets attributes - we do not need them at the moment
                    aUploadedPhotoID := vXML.Element['rsp.photoid'];
                  end;
                end;
              end;
            end else begin
              Result := False;
            end;

          except
            on E: EIdHTTPProtocolException do
            begin
              aResponseText := e.ClassName + ': ' + e.Message + #13#10 + e.ErrorMessage;
              New(FCustomMessageRecord);
              FCustomMessageRecord^.CustomMessageToForm('PostPhotoToFlickr failed:'#13 + aResponseText, mtError, [mbOK]);
            end;
            on E: Exception do begin
              aResponseText := e.ClassName + ': ' + e.Message;
              New(FCustomMessageRecord);
              FCustomMessageRecord^.CustomMessageToForm('PostPhotoToFlickr failed:'#13 + aResponseText, mtError, [mbOK]);
            end;
          end;

        finally
          vIdHTTP.IOHandler := nil;
          vIdHTTP.Free;
        end;

      finally
        vIdSSLIOHandler.Free;
      end;

    finally
      vParameters.Free;
    end;

  finally
    vMFData.Free;
  end;

//  memPhotoRequestBody.Lines.Text := RequestBody;
  TInterlocked.Increment(gFlickrApiCallsCount);

  if Result then
  begin
    if vIsUpload then
      TInterlocked.Increment(gPhotoUploads)
    else
      TInterlocked.Increment(gPhotoReplacments);

    TInterlocked.Add(gUploadedSize, vUploadSize);
  end;

  finally
    //gFlickrPostPhotoCriticalSection.Release;
  end;
end;

function TLocalPhoto.ReadExifData: Boolean;

  function _ParseFileNameForDateTime(const aParseName: string): TDateTime;
  var
    y,m,d,h,n,s: integer;
  begin
    Result := MinDateTime;
    y := StrToIntDef(copy(aParseName, 1, 4), 0);
    if (y > 1800) and (y < 2100) then
    begin
      m := StrToIntDef(copy(aParseName, 6, 2), 0);
      if (m > 0) and (m < 12) then
      begin
        d := StrToIntDef(copy(aParseName, 9, 2), 0);
        if (d > 0) and (d < 31) then
        begin
          try
            Result := EncodeDate(y, m, d);
          except
            Result := MinDateTime;
            exit;
          end;
          h := StrToIntDef(copy(aParseName, 12, 2), 0);
          if (h >= 0) and (h <= 23) then
          begin
            n := StrToIntDef(copy(aParseName, 14, 2), 0);
            if (n >= 0) and (n <= 59) then
            begin
              s := StrToIntDef(copy(aParseName, 16, 2), 0);
              if (s >= 0) and (s <= 59) then
              try
                Result := EncodeDateTime(y, m, d, h, n, s, 0);
              except
                Result := MinDateTime;
                exit;
              end;
            end;
          end;
        end;
      end;
    end;
  end;

  function _SanitizeTitle(const aTxt: string) : string;
  var
    I: Integer;
  begin
    Result := aTxt;
    for I := 0 to 19 do begin
      Result := ReplaceText(Result, Char(i), ' ');
    end;

  end;

var
  vPhotoFileStream: TFileStream;
  vJpegEx: TJPEGImageEx;
  s: string;
begin

  Result := FReadExifDone;

  if not FReadExifDone then
  begin

    try

      // load up to date information about photo file
      vJpegEx := TJPEGImageEx.Create;
      try

        gFileAccessCriticalSection.Acquire;
        try

          vPhotoFileStream := TFileStream.Create(FPhotoFileName, fmOpenRead or fmShareDenyWrite);
          try

            vPhotoFileStream.Position := 0;
            vJpegEx.ExifData.EnforceASCII := False;
            vJpegEx.IPTCData.AlwaysAssumeUTF8Encoding := True;

            gJpegExifCriticalSection.Acquire;
            try

              vJpegEx.LoadFromStream(vPhotoFileStream);

            finally
              gJpegExifCriticalSection.Release;
            end;

            if gDoResize then
            begin
              FScale := Max(vJpegEx.Width / gMaxResizeWidth, vJpegEx.Height / gMaxResizeHeight);
              FNewWidth := Max(2, Min(gMaxResizeWidth, Ceil(vJpegEx.Width / FScale)));
              FNewHeight := Max(2, Min(gMaxResizeHeight, Ceil(vJpegEx.Height / FScale)));
              if (FNewWidth > vJpegEx.Width) or (FNewHeight > vJpegEx.Height) then
              begin
                FNewWidth := vJpegEx.Width;
                FNewHeight := vJpegEx.Height;
                FScale := 1;
              end;

              FRequireResizedImage :=
                (gMaxResizeWidth < vJpegEx.Width) or
                (gMaxResizeHeight < vJpegEx.Height) or
                (gMaxResizeFileSize < vPhotoFileStream.Size);

            end else begin
              FCreateResizedJPGDone := True;
              FRequireResizedImage := False;
            end;

            try

              if vJpegEx.ExifData.DateTimeOriginal.MissingOrInvalid then
              begin
                if vJpegEx.ExifData.DateTime.MissingOrInvalid then
                begin
                  DateTimeOriginal := _ParseFileNameForDateTime(FDefaultTitle);
                  if (DateTimeOriginal <= MinDateTime) or (DateTimeOriginal >= MaxDateTime) then
                  begin
                    DateTimeOriginal := FileDateToDateTime(FileGetDate(vPhotoFileStream.Handle));
                    if (DateTimeOriginal > MinDateTime) and (DateTimeOriginal < MaxDateTime) then
                    begin
                      vJpegEx.ExifData.DateTime := DateTimeOriginal;
                      vJpegEx.ExifData.DateTimeOriginal := DateTimeOriginal;
                    end;
                  end else begin
                    vJpegEx.ExifData.DateTime := DateTimeOriginal;
                    vJpegEx.ExifData.DateTimeOriginal := DateTimeOriginal;
                  end;
                end else begin
                  DateTimeOriginal := vJpegEx.ExifData.DateTime;
                  vJpegEx.ExifData.DateTime := DateTimeOriginal;
                end;
              end else begin
                DateTimeOriginal := vJpegEx.ExifData.DateTimeOriginal;
                vJpegEx.ExifData.DateTimeOriginal := DateTimeOriginal;
              end;

            except
              on E: Exception do
              begin
                DoLogError(Format('%s - failed to Access EXIF - DateTimeOriginal data'#13'%s', [FTitle, E.Message]));
                DateTimeOriginal := FileDateToDateTime(FileGetDate(vPhotoFileStream.Handle));
              end;
            end;

          finally
            vPhotoFileStream.Free;
          end;

        finally
          gFileAccessCriticalSection.Release;
        end;

        if gSetImageDescription then
        begin
          try

            s := Trim(_SanitizeTitle(vJpegEx.ExifData.ImageDescription));
            if s <> '' then
              FDescription := s;

          except
            on E: Exception do
            begin
              DoLogError(Format('%s - failed to Access EXIF - ImageDescription data'#13'%s', [FTitle, E.Message]));
              FDescription := '';
            end;
          end;
        end else
          FDescription := '';

        if gPriorityTitleExif then
        begin
          try

            s := Trim(_SanitizeTitle(vJpegEx.IPTCData.CaptionOrAbstract));
            if s <> '' then
              ExifTitle := s;

          except
            on E: Exception do
            begin
              DoLogError(Format('%s - failed to Access IPTC - CaptionOrAbstract data'#13'%s', [FTitle, E.Message]));
              ExifTitle := '';
            end;
          end;
        end else
          ExifTitle := '';

        try

          FImageUniqueID := vJpegEx.ExifData.ImageUniqueID;
          if not IsImageUniqueIDValid(FImageUniqueID) then
          begin
            FImageUniqueID := '';
            vJpegEx.ExifData.ImageUniqueID := GenerateImageUniqueID;
            FImageUniqueID := vJpegEx.ExifData.ImageUniqueID;
            DoLogInformation(Format('%s (%s) - set ImageUniqueID=%s by CCR Exif', [FTitle, FAlbumName, FImageUniqueID]));

            FPhotoFileNameBackup := ChangeFileExt(FPhotoFileName, '.jpg_syncrbak');
            if RenameFile(FPhotoFileName, FPhotoFileNameBackup) then
            begin

              gFileAccessCriticalSection.Acquire;
              try

                vPhotoFileStream := TFileStream.Create(FPhotoFileName, fmCreate or fmShareExclusive);
                try

                  try

                    vJpegEx.SaveToStream(vPhotoFileStream);

                  except
                    on E: Exception do
                    begin
                      Result := False;
                      DoLogError(Format('%s - failed to set ImageUniqueID by CCR Exif'#13'%s', [FTitle, E.Message]));
                      RenameFile(FPhotoFileNameBackup, FPhotoFileName);
                      FPhotoFileNameBackup := '';
                      Exit;
                    end;
                  end;

                finally
                  vPhotoFileStream.Free;
                end;

              finally
                gFileAccessCriticalSection.Release;
              end;

            end else begin
              DoLogError(Format('%s - set ImageUniqueID=%s by CCR Exif', [FTitle, FImageUniqueID]));
              Result := False;
              Exit;
            end;

            FileSetDate(FPhotoFileName, DateTimeToFileDate(DateTimeOriginal));
          end;

        except
          on E: Exception do
          begin
            DoLogError(Format('%s - failed to Access EXIF - ImageUniqueID data'#13'%s', [FTitle, E.Message]));
            FImageUniqueID := '';
            Result := False;
            Exit;
          end;
        end;

      finally
        vJpegEx.ExifData.Clear;
        vJpegEx.IPTCData.Clear;
        vJpegEx.XMPPacket.Clear;
        vJpegEx.Free;
      end;

    except
      on E: Exception do
      begin
        DoLogError(Format('%s - ReadExifData failed'#13'%s', [FTitle, E.Message]));
        FImageUniqueID := '';
        Result := False;
        Exit;
      end;
    end;

    Result := True;

//    FProcessingInfo.Add('ReadExifData');

  end;

end;

function TLocalPhoto.ReadFileProperties: Boolean;
var
  vJpgStream: TFileStream;
  vHashMD5: THashMD5;
  vBuffer: PByte;
  vBufLen: Integer;
  vReaded: Cardinal;
//  vSR: TSearchRec;
begin
  // load up to date information about photo file

  Result := FReadFileDataDone;
  if not FReadFileDataDone then
  begin

    try

      vHashMD5 := THashMD5.Create;
      vBufLen := 256 * 1024;
      vBuffer := AllocMem(vBufLen);
      try

        Assert(FImageUniqueID <> '');

        gFileAccessCriticalSection.Acquire;
        try

          vJpgStream := TFileStream.Create(FPhotoFileName, fmOpenRead or fmShareDenyWrite);
          try

            FileSizeActual := vJpgStream.Size;

            while vJpgStream.Position < vJpgStream.Size do begin
              vReaded := vJpgStream.Read(vBuffer^, vBufLen);
              if vReaded > 0 then
              begin
                vHashMD5.Update(vBuffer^, vReaded);
              end;
            end;

          finally
            vJpgStream.Free;
          end;

        finally
          gFileAccessCriticalSection.Release;
        end;

      finally
        FreeMem(vBuffer)
      end;

      FileMD5Actual := vHashMD5.HashAsString;

    except
      on E: Exception do
      begin
        DoLogError(Format('%s - ReadFileProperties failed'#13'%s', [FTitle, E.Message]));
        FImageUniqueID := '';
        Result := False;
        Exit;
      end;
    end;

    Result := True;

//    FProcessingInfo.Add('ReadFileProperties');

  end;

end;

function TLocalPhoto.ReadSyncIniData: Boolean;
var
  vIniFile: TIniFileUnicode;
  vTitle_sync, vDescription_sync, vPicasa_sync, vTags_sync: string;
  vIsPublic_sync, vIsFriend_sync, vIsFamily_sync, vPerm_Comment_sync, vPerm_AddMeta_sync: string;
begin

  Result := FReadSyncIniDone;

  if not FReadSyncIniDone then
  begin
    // first call ReadExifData

    try

      if FImageUniqueID = '' then
      begin
        FReadExifDone := False;
        FReadFileDataDone := False;
        Exit;
      end;
      Assert(FSyncDataFileName <> '');

      vIniFile := TIniFileUnicode.Create(FSyncDataFileName, fReadIni);
      try
        FPhotoID := vIniFile.ReadString(FImageUniqueID, 'PhotoID', '');
        vTitle_sync := vIniFile.ReadString(FImageUniqueID, 'Title', '');
        vDescription_sync := vIniFile.ReadString(FImageUniqueID, 'Description', '');
        vPicasa_sync := vIniFile.ReadString(FImageUniqueID, 'Picasa', '');
        vTags_sync := vIniFile.ReadString(FImageUniqueID, 'Tags', '');
        FFileMD5 := vIniFile.ReadString(FImageUniqueID, 'FileMD5', '');
        FFileSize := vIniFile.ReadInteger(FImageUniqueID, 'FileSize', 0);
        FFileDate := vIniFile.ReadString(FImageUniqueID, 'FileDate', '');
        vIsPublic_sync := vIniFile.ReadString(FImageUniqueID, 'IsPublic',
          IfThen(gPriorityPermissionsFlickr or (IsPublic = ''), gFlickrSettings.IsPublic, IsPublic));
        vIsFriend_sync := vIniFile.ReadString(FImageUniqueID, 'IsFriend',
          IfThen(gPriorityPermissionsFlickr or (IsFriend = ''), gFlickrSettings.IsFriend, IsFriend));
        vIsFamily_sync := vIniFile.ReadString(FImageUniqueID, 'IsFamily',
          IfThen(gPriorityPermissionsFlickr or (IsFamily = ''), gFlickrSettings.IsFamily, IsFamily));
        vPerm_Comment_sync := vIniFile.ReadString(FImageUniqueID, 'Perm_Comment',
          IfThen(gPriorityPermissionsFlickr or (PermissionComment = ''), gFlickrSettings.PermissionComment, PermissionComment));
        vPerm_AddMeta_sync := vIniFile.ReadString(FImageUniqueID, 'Perm_AddMeta',
          IfThen(gPriorityPermissionsFlickr or (PermissionAddMeta = ''), gFlickrSettings.PermissionAddMeta, PermissionAddMeta));

        ClearChanges;

        if gPriorityTitleExif and (ExifTitle <> '') then
          FTitle := ExifTitle;

        if FTitle = '' then
          FTitle := FDefaultTitle;

        FChanged_Title := FChanged_Title
          or not SameStr(FTitle, vTitle_sync)
          or not vIniFile.ValueExists(FImageUniqueID, 'Title');

        FChanged_Description := FChanged_Description
          or not SameStr(FDescription, vDescription_sync)
          or not vIniFile.ValueExists(FImageUniqueID, 'Description');

        FileMD5 := FileMD5Actual;
        FileSize := FileSizeActual;
        FileDate := FormatDateTime('yyyymmddHHmmss',
          System.IOUtils.TFile.GetLastWriteTimeUtc(FPhotoFileName));
        FChanged_File := FChanged_File
          or not vIniFile.ValueExists(FImageUniqueID, 'PhotoID')
          or not vIniFile.ValueExists(FImageUniqueID, 'FileMD5')
          or not vIniFile.ValueExists(FImageUniqueID, 'FileSize'){
          or not vIniFile.ValueExists(FImageUniqueID, 'FileDate')};

        FChanged_Picasa := FChanged_Picasa
          or not SameStr(FPicasa, vPicasa_sync)
          or not vIniFile.ValueExists(FImageUniqueID, 'Picasa');

        FChanged_Tags := FChanged_Tags
          or not SameStr(Tags, vTags_sync)
          or not vIniFile.ValueExists(FImageUniqueID, 'Tags');

        if gEnforceSyncrIniPermissions then
        begin
          FIsFamily := vIsFamily_sync;
          FIsFriend := vIsFriend_sync;
          FIsPublic := vIsPublic_sync;
          FPermissionComment := vPerm_Comment_sync;
          FPermissionAddMeta := vPerm_AddMeta_sync;
        end;

        if FIsFamily = '' then
          FIsFamily := vIsFamily_sync;
        if FIsFriend = '' then
          FIsFriend := vIsFriend_sync;
        if FIsPublic = '' then
          FIsPublic := vIsPublic_sync;
        if FPermissionComment = '' then
          FPermissionComment := vPerm_Comment_sync;
        if FPermissionAddMeta = '' then
          FPermissionAddMeta := vPerm_AddMeta_sync;

        FChanged_Access := FChanged_Access
          or not SameText(FIsFamily, vIsFamily_sync)
          or not SameText(FIsFriend, vIsFriend_sync)
          or not SameText(FIsPublic, vIsPublic_sync)
          or not SameText(FPermissionComment, vPerm_Comment_sync)
          or not SameText(FPermissionAddMeta, vPerm_AddMeta_sync)
          or not vIniFile.ValueExists(FImageUniqueID, 'IsPublic')
          or not vIniFile.ValueExists(FImageUniqueID, 'IsFriend')
          or not vIniFile.ValueExists(FImageUniqueID, 'IsFamily')
          or not vIniFile.ValueExists(FImageUniqueID, 'Perm_Comment')
          or not vIniFile.ValueExists(FImageUniqueID, 'Perm_AddMeta');

      finally
        vIniFile.Free;
      end;

    except
      on E: Exception do
      begin
        DoLogError(Format('%s - ReadSyncIniData failed'#13'%s', [FTitle, E.Message]));
        FImageUniqueID := '';
        Result := False;
        Exit;
      end;
    end;

    Result := True;

//    FProcessingInfo.Add('ReadSyncIniData');

  end;
end;

procedure TLocalPhoto.SetDescription(const Value: string);
begin
  FChanged_Description := FChanged_Description or (FDescription <> Value);
  FDescription := Value;
end;

procedure TLocalPhoto.SetFileDate(const Value: String);
begin
  if FFileDate = '' then
    FFileDate := Value;
  FChanged_File := FChanged_File or (FFileDate <> Value);
  FFileDate := Value;
end;

procedure TLocalPhoto.SetFileMD5(const Value: String);
begin
  if not SameText(FFileMD5, Value) then
  begin
    FChanged_File := True;
  end;

  FFileMD5 := Value;
end;

procedure TLocalPhoto.SetFileSize(const Value: Int64);
begin
  FChanged_File := FChanged_File or (FFileSize <> Value);
  FFileSize := Value;
end;

procedure TLocalPhoto.SetIsFamily(const Value: String);
begin
  FChanged_Access := FChanged_Access or (FIsFamily <> Value);
  FIsFamily := Value;
end;

procedure TLocalPhoto.SetIsFriend(const Value: String);
begin
  FChanged_Access := FChanged_Access or (FIsFriend <> Value);
  FIsFriend := Value;
end;

procedure TLocalPhoto.SetIsPublic(const Value: String);
begin
  FChanged_Access := FChanged_Access or (FIsPublic <> Value);
  FIsPublic := Value;
end;

procedure TLocalPhoto.SetPerm_AddMeta(const Value: String);
begin
  FChanged_Access := FChanged_Access or (FPermissionAddMeta <> Value);
  FPermissionAddMeta := Value;
end;

procedure TLocalPhoto.SetPerm_Comment(const Value: String);
begin
  FChanged_Access := FChanged_Access or (FPermissionComment <> Value);
  FPermissionComment := Value;
end;

procedure TLocalPhoto.SetPhotoFileName(const Value: string);
var
  vDigit: integer;
begin
  FPhotoFileName := Value;
  FDefaultTitle := Trim(System.IOUtils.TPath.GetFileNameWithoutExtension(FPhotoFileName));
  FTitle := FDefaultTitle;

  begin
    vDigit := StrToIntDef(copy(FDefaultTitle, 1, 4), -1);
    if vDigit <> -1 then
    begin
      AddTag(IntToStr(vDigit));
      vDigit := StrToIntDef(copy(FDefaultTitle, 6, 2), -1);
      if (vDigit >= 1) and (vDigit <= 12) then
      begin
        AddTag(FormatSettings.LongMonthNames[vDigit]);
        AddTag(RussianMonthNames[vDigit]);
        if (vDigit >= 3) and (vDigit <= 5) then
        begin
          AddTag('Spring');
          AddTag('Весна');
        end else
        if (vDigit >= 6) and (vDigit <= 8) then
        begin
          AddTag('Summer');
          AddTag('Лето');
        end else
        if (vDigit >= 9) and (vDigit <= 11) then
        begin
          AddTag('Fall');
          AddTag('Autumn');
          AddTag('Осень');
        end else
        if (vDigit >= 12) or (vDigit <= 2) then
        begin
          AddTag('Winter');
          AddTag('Зима');
        end;
      end;
    end;
  end;

end;

procedure TLocalPhoto.SetPhotoID(const Value: string);
begin
  FChanged_File := FChanged_File or (FPhotoID <> Value);
  FPhotoID := Value;
end;

procedure TLocalPhoto.SetTitle(const Value: string);
begin
  FChanged_Title := FChanged_Title or (FTitle <> Value);
  FTitle := Value;
end;

procedure TLocalPhoto.SetUploadComplete(const Value: Boolean);
begin
  FUploadComplete := Value;

  if FUploadComplete then
  begin
    WriteSyncIniData;
    if not gDoSaveResizedPhotos and (FResizedPhotoFileName <> '') then
    begin
      System.SysUtils.DeleteFile(FResizedPhotoFileName);
      FResizedPhotoFileName := ''
    end;
    if (FPhotoFileNameBackup <> '') then
    begin
      if UploadComplete then
        System.SysUtils.DeleteFile(FPhotoFileNameBackup)
      else
        RenameFile(FPhotoFileNameBackup, FPhotoFileName);
      FPhotoFileNameBackup := '';
    end;
  end;
end;

procedure TLocalPhoto.UploadCompleteSet;
begin
  FUploadComplete := True;
end;

function TLocalPhoto.UploadPhotoToFlickr(const aWorkFolder: TLocalFolder): Boolean;

  function _FillFlickrPhotoData(const aPhotoID: string; const aFlickrPhoto: TFlickrPhoto): boolean;
  var
    vXML: IbvXMLAccess;
    vToken, vID, vError: string;
    vCnt, i: Integer;
  begin

    if aPhotoID <> '' then
    begin
      // extract require information about photo
      if ExecuteAPIMethod(Get_photos_getInfo(aPhotoID, ''), vXML, vError) then
      begin
        vID := vXML.Attribute['rsp.photo.id'];
        vToken := vXML.Attribute['rsp.photo.owner.nsid'];
        // wrong user - remove photo reference
        Result := (vToken = FlickrUserID) and (vID = aPhotoID);
        if Result then
        begin
          aFlickrPhoto.Title := vXML.Element['rsp.photo.title'];

          if ExecuteAPIMethod(Get_photos_getSizes(aPhotoID), vXML, vError) then
          begin
            vcnt := vXML.Element['rsp.sizes.size[?]'].ToInteger;
            for i := vCnt - 1 downto 0 do begin
              vToken := vXML.Attribute[Format('rsp.sizes.size[%d].label', [i])];
              if SameText(vToken, 'Original') then
              begin
                aFlickrPhoto.Height_o := vXML.Attribute[Format('rsp.sizes.size[%d].height', [i])].ToInteger;
                aFlickrPhoto.Width_o := vXML.Attribute[Format('rsp.sizes.size[%d].width', [i])].ToInteger;
                Break;
              end;
            end;
          end else
            Result := False;
        end;
      end else
        Result := False;
    end else begin
      Result := False;
    end;
  end;

var
  vIsFamily, vIsFriend, vIsPublic, vPermissionAddMeta, vPermissionComment, s: string;
  vResponseText, vUploadedPhotoID, vTicketID: String;
  vIsUpload, vPhotoExists, vHasChanges: Boolean;
  vFlickrPhoto: TFlickrPhoto;
begin

  if UploadComplete then
  begin
    Result := True;
    Exit;
  end;

  aWorkFolder.FlickrPhotosCS.Acquire;
  try

    if PhotoID <> '' then
      vPhotoExists := aWorkFolder.FlickrPhotos.ContainsKey(PhotoID)
    else
      vPhotoExists := False;

  finally
    aWorkFolder.FlickrPhotosCS.Release;
  end;

  gFlickrPhotosNotInSetCriticalSection.Acquire;
  try

    if not Assigned(gFlickrPhotosNotInSet) then
    begin
      Result := Flickr_Load_PhotosNotInSet;
      if not Result then
        Exit;
    end;

    Assert(Assigned(gFlickrPhotosNotInSet));

    if (PhotoID <> '') and not vPhotoExists then
      vPhotoExists := gFlickrPhotosNotInSet.ContainsKey(PhotoID);

    // try to find photo by title in Not in Set
    if (PhotoID = '') and (gFlickrPhotosNotInSet.Count > 0) then
    begin

      for s in gFlickrPhotosNotInSet.Keys.ToArray do begin
        if gFlickrPhotosNotInSet.Items[s].Title = Title then
        begin
          PhotoID := s;

          vFlickrPhoto := gFlickrPhotosNotInSet.Items[s];
          // remove this photo from the list - so it will not be used if same title is duplicated
          gFlickrPhotosNotInSet.Remove(s);

          vPhotoExists := True;
          FChanged_File := False;
          FChanged_Access := FChanged_Access or
            (vFlickrPhoto.IsFamily <> FIsFamily) or
            (vFlickrPhoto.IsFriend <> FIsFriend) or
            (vFlickrPhoto.IsPublic <> FIsPublic) or
            (vFlickrPhoto.Perm_AddMeta <> FPermissionAddMeta) or
            (vFlickrPhoto.Perm_Comment <> FPermissionComment);

          vFlickrPhoto.IsFamily := IsFamily;
          vFlickrPhoto.IsFriend := IsFriend;
          vFlickrPhoto.IsPublic := IsPublic;
          vFlickrPhoto.Perm_AddMeta := PermissionAddMeta;
          vFlickrPhoto.Perm_Comment := PermissionComment;
          aWorkFolder.FlickrPhotos.Add(PhotoID, vFlickrPhoto);
          aWorkFolder.Modified := True;
          Break;
        end;
      end;

    end;

    vHasChanges := HasChanges or not vPhotoExists;

  finally
    gFlickrPhotosNotInSetCriticalSection.Release;
  end;

  // check if Photo actually exists on the Flickr
  if PhotoID <> '' then
  begin

    if vPhotoExists or GetPhotoPermissions(vIsFamily, vIsFriend, vIsPublic, vPermissionAddMeta, vPermissionComment, vPhotoExists) then
    begin

      vIsFamily := FIsFamily;
      vIsFriend := FIsFriend;
      vIsPublic := FIsPublic;
      vPermissionAddMeta := FPermissionAddMeta;
      vPermissionComment := FPermissionComment;

      if vPhotoExists then
      begin

        aWorkFolder.FlickrPhotosCS.Acquire;

        try

          if aWorkFolder.FlickrPhotos.ContainsKey(PhotoID) then
          begin
            vFlickrPhoto := aWorkFolder.FlickrPhotos.Items[PhotoID];
          end else begin
            // Photo not exists in the current Album - try to find in Not in Set
            gFlickrPhotosNotInSetCriticalSection.Acquire;
            try

              if gFlickrPhotosNotInSet.ContainsKey(PhotoID) then
              begin
                vFlickrPhoto := gFlickrPhotosNotInSet.Items[PhotoID];
                gFlickrPhotosNotInSet.Remove(PhotoID);
                aWorkFolder.FlickrPhotos.AddOrSetValue(PhotoID, vFlickrPhoto);
                aWorkFolder.Modified := True;
              end else begin
                // photo exists, but in another album - just create it and fill with actual data
                vFlickrPhoto := TFlickrPhoto.Create;
                if _FillFlickrPhotoData(PhotoID, vFlickrPhoto) then
                begin
                  vFlickrPhoto.IsFamily := vIsFamily;
                  vFlickrPhoto.IsFriend := vIsFriend;
                  vFlickrPhoto.IsPublic := vIsPublic;
                  vFlickrPhoto.Perm_AddMeta := vPermissionAddMeta;
                  vFlickrPhoto.Perm_Comment := vPermissionComment;
                  vFlickrPhoto.Title := Title;
                  aWorkFolder.FlickrPhotos.AddOrSetValue(PhotoID, vFlickrPhoto);
                  aWorkFolder.Modified := True;
                end else begin
                  PhotoID := '';
                  Assert(False);
                end;
              end;

            finally
              gFlickrPhotosNotInSetCriticalSection.Release;
            end;
          end;

          if Assigned(vFlickrPhoto) and (PhotoID <> '') then
          begin

            if EndsStr('.tmp', vFlickrPhoto.Title) and (vFlickrPhoto.Title <> FTitle) then
              Changed_Title := True;

            if (vFlickrPhoto.Height_o < FNewHeight) or (vFlickrPhoto.Width_o < FNewWidth) then
              Changed_File := True;

            vFlickrPhoto.IsFamily := vIsFamily;
            vFlickrPhoto.IsFriend := vIsFriend;
            vFlickrPhoto.IsPublic := vIsPublic;
            vFlickrPhoto.Perm_AddMeta := vPermissionAddMeta;
            vFlickrPhoto.Perm_Comment := vPermissionComment;

            // check if update permission for the photo is necessary
            if gApplyPermissionsChanges or gEnforceSyncrIniPermissions then
            begin
              FChanged_Access := FChanged_Access or
                (vFlickrPhoto.IsFamily <> FIsFamily) or
                (vFlickrPhoto.IsFriend <> FIsFriend) or
                (vFlickrPhoto.IsPublic <> FIsPublic) or
                (vFlickrPhoto.Perm_AddMeta <> FPermissionAddMeta) or
                (vFlickrPhoto.Perm_Comment <> FPermissionComment);
            end else begin
              // just apply Flickr's values and store them
              FIsFamily := vFlickrPhoto.IsFamily;
              FIsFriend := vFlickrPhoto.IsFriend;
              FIsPublic := vFlickrPhoto.IsPublic;
              FPermissionAddMeta := vFlickrPhoto.Perm_AddMeta;
              FPermissionComment := vFlickrPhoto.Perm_Comment;
            end;

            vHasChanges := vHasChanges or FChanged_Access or Changed_Title or Changed_File;
          end;

        finally
          aWorkFolder.FlickrPhotosCS.Release;
        end;

      end else begin
        // not exists - create new
        PhotoID := '';
        vHasChanges := True;
      end;
    end else begin
      Result := False;
      Exit;
    end;
  end;

  if vHasChanges then
  begin

    FModified := True;

    // only change access for newly uploaded photos or when enforced
    Changed_Access := Changed_Access and ((PhotoID = '') or gApplyPermissionsChanges or gEnforceSyncrIniPermissions);
    if PhotoID = '' then
    begin
      Changed_Title := True;
      Changed_Description := True;
      Changed_Access := True;
      Changed_Tags := True;
    end;

    if Changed_File then
    begin
      // file changed - do full upload/replacment
      vIsUpload := PhotoID = '';

      if CreateResizedJPG then
      begin
        FCreateResizedJPGDone := True;
      end else begin
        FProcessingInfo.Add('CreateResizedJPG failed');
        Result := False;
        Exit;
      end;

      if PostPhotoToFlickr(False, vResponseText, vUploadedPhotoID, vTicketID)  then
      begin
        FProcessingInfo.Add(IfThen(vIsUpload, 'Uploaded', 'Replaced'));
        FReportIntoLog := True;
//        DoLogInformation(Format('%s - %s', [Title, ifthen(PhotoID = '', 'Uploaded', 'Replaced')]));
        if vTicketID <> '' then
        begin
          Assert(False); // do not support async upload
        end else
        if vIsUpload then
        begin
          if vUploadedPhotoID <> '' then
          begin
            //
            PhotoID := vUploadedPhotoID;

            aWorkFolder.FlickrPhotosCS.Acquire;
            try

              if aWorkFolder.FlickrPhotos.ContainsKey(PhotoID) then
              begin
                vFlickrPhoto := aWorkFolder.FlickrPhotos.Items[PhotoID];
              end else begin
                vFlickrPhoto := TFlickrPhoto.Create;
                aWorkFolder.FlickrPhotos.AddOrSetValue(PhotoID, vFlickrPhoto);
                aWorkFolder.Modified := True;
              end;

            finally
              aWorkFolder.FlickrPhotosCS.Release;
            end;

            vFlickrPhoto.Title := Title;
            vFlickrPhoto.IsFamily := IsFamily;
            vFlickrPhoto.IsFriend := IsFriend;
            vFlickrPhoto.IsPublic := IsPublic;
            vFlickrPhoto.Perm_AddMeta := PermissionAddMeta;
            vFlickrPhoto.Perm_Comment := PermissionComment;

          end else
            Assert(False, 'PhotoID must not be empty');
           // if we did full upload should not care about:
           // !!! upload with non asci chars does not work - need to keep this updated via REST
           //Changed_Description := False;
           //Changed_Tags := False;
           //Changed_Title := False;
        end;

        Changed_File := False;

        // succesfully processed previously failed photo
        if FailedPostCommands > 0 then
        begin
          TInterlocked.Add(gErrors, - FailedPostCommands);
          TInterlocked.Increment(gResolvedErrors);
          FailedPostCommands := 0;
        end;

      end else begin
        // Failed !
        DoLogInformation(Format('%s (%s) - Failed to %s', [FTitle, FAlbumName, ifthen(PhotoID = '', 'Upload', 'Replace')]));
        DoLogInformation(Format('Error: %s', [vResponseText]));
        New(FCustomMessageRecord);
        FCustomMessageRecord^.CustomMessageToForm('Post Photo failed ' + Title + #13 + vResponseText,
          mtWarning, [mbIgnore, mbCancel], mbIgnore, 5000);
        TInterlocked.Increment(gErrors);
        FailedPostCommands := FailedPostCommands + 1;
        PostPhotoLastError := vResponseText;
        Result := False;
        Exit;
      end;
    end;

    if Changed_Description or Changed_Title then
    begin
      Result := ExecuteAPIMethod(Get_photos_setMeta(PhotoID, Title, Description));
      if not Result then
        Exit;
      if Changed_Description then
        FProcessingInfo.Add('Description');
      Changed_Description := False;
      if Changed_Title then
        FProcessingInfo.Add('Title');
      Changed_Title := False;
      FReportIntoLog := True;
//      DoLogInformation(Format('%s %s - %s', [FAlbumName, Title, 'Description and/or Title']));
    end;

    if Changed_Tags then
    begin
      if Tags <> '' then
      begin
        Result := ExecuteAPIMethod(Get_photos_setTags(PhotoID, Tags));
        if not Result then
          Exit;
        FProcessingInfo.Add('Tags');
      end;
      Changed_Tags := False;
      FReportIntoLog := True;
//      DoLogInformation(Format('%s %s - %s', [FAlbumName, Title, 'Tags']));
    end;

    if Changed_Access then
    begin
      if (IsPublic <> '') and
         (IsFriend <> '') and
         (IsFamily <> '' ) then
      begin
        Result := ExecuteAPIMethod(Get_photos_setPerms(PhotoID, IsPublic, IsFriend, IsFamily, PermissionComment, PermissionAddMeta));
        if not Result then
          Exit;
        FProcessingInfo.Add('Permissions');
        FReportIntoLog := True;
//        DoLogInformation(Format('%s %s - %s', [FAlbumName, Title, 'Permissions']));
      end;
      Changed_Access := False;
    end;

    UploadComplete := True;
    Result := True;

  end else begin
    // no changes - do not need to do  full upload complete (override sync ini) - just mark as done
    UploadCompleteSet;
    //UploadComplete := True;
    ClearChanges;
    Result := True;
  end;

end;

procedure TLocalPhoto.WriteSyncIniData;
var
  vIniFile: TIniFileUnicode;
begin

  Assert(FReadSyncIniDone);
  Assert(FImageUniqueID <> '');
  Assert(FSyncDataFileName <> '');

  vIniFile := TIniFileUnicode.Create(FSyncDataFileName, fWriteIni);
  try
    vIniFile.WriteString(FImageUniqueID, 'PhotoID', PhotoID);
    vIniFile.WriteString(FImageUniqueID, 'Title', Title);
    vIniFile.WriteString(FImageUniqueID, 'Description', Description);
    vIniFile.WriteString(FImageUniqueID, 'Picasa', Picasa);
    vIniFile.WriteString(FImageUniqueID, 'FileMD5', FileMD5);
    vIniFile.WriteInteger(FImageUniqueID, 'FileSize', FileSize);
    vIniFile.WriteString(FImageUniqueID, 'FileDate', FileDate);
    vIniFile.WriteString(FImageUniqueID, 'IsFamily', IsFamily);
    vIniFile.WriteString(FImageUniqueID, 'IsFriend', IsFriend);
    vIniFile.WriteString(FImageUniqueID, 'IsPublic', IsPublic);
    vIniFile.WriteString(FImageUniqueID, 'Perm_AddMeta', PermissionAddMeta);
    vIniFile.WriteString(FImageUniqueID, 'Perm_Comment', PermissionComment);
    vIniFile.WriteString(FImageUniqueID, 'Tags', Tags);
    vIniFile.DeleteKey(FImageUniqueID, 'Access');

    ClearChanges;

  finally
    vIniFile.Free;
  end;

end;

function Flickr_Load_PhotosNotInSet: Boolean;
var
  vXML: IbvXMLAccess;
  vID, vErrorMessage: string;
  i, vCnt, vTotal, vProcessed, vPageNo: integer;
  vFlickrPhoto: TFlickrPhoto;
begin

  vPageNo := 1;
  vProcessed := 0;
//  vTotal := 0;
//  vCnt := 0;

  Assert(not Assigned(gFlickrPhotosNotInSet));

  gFlickrPhotosNotInSet := TFlickrPhotos.Create;

  DoLogInformation('Loading Flickr Photos Not In Set');

  repeat

    if ExecuteAPIMethod(Get_photos_getNotInSet('', '', '', '', 'photos', '', 'o_dims,url_o', '500', IntToStr(vPageNo)), vXML, vErrorMessage) then
    begin
      vCnt := StrToInt(vXML.Element['rsp.photos.photo[?]']);
      vTotal := StrToInt(vXML.Attribute['rsp.photos.total']);
      for i := 0 to vCnt - 1 do begin
        vFlickrPhoto := TFlickrPhoto.Create;
        vID := vXML.Attribute[format('rsp.photos.photo[%d].id', [i])];
        vFlickrPhoto.ID := vID;
        vFlickrPhoto.Title := vXML.Attribute[format('rsp.photos.photo[%d].title', [i])];
        vFlickrPhoto.IsFamily := vXML.Attribute[format('rsp.photos.photo[%d].isfamily', [i])];
        vFlickrPhoto.IsFriend := vXML.Attribute[format('rsp.photos.photo[%d].isfriend', [i])];
        vFlickrPhoto.IsPublic := vXML.Attribute[format('rsp.photos.photo[%d].ispublic', [i])];
        vFlickrPhoto.Height_o := StrToIntDef(vXML.Attribute[format('rsp.photos.photo[%d].height_o', [i])], 0);
        vFlickrPhoto.Width_o := StrToIntDef(vXML.Attribute[format('rsp.photos.photo[%d].width_o', [i])], 0);
        gFlickrPhotosNotInSet.Add(vID, vFlickrPhoto);
        inc(vProcessed);
      end;
      Result := True;
    end else begin
      Result := False;
      New(FCustomMessageRecord);
      FCustomMessageRecord^.CustomMessageToForm('Sync_LoadFlickrPhotosNotInSet failed'#13 + vErrorMessage, mtError, [mbOK]);
      FreeAndNil(gFlickrPhotosNotInSet);
      Exit;
    end;

    inc(vPageNo);

    if vTotal > 0 then
    begin
      DoLogInformation(
        Format('%d%% loaded. %d of %d', [vProcessed * 100 div vTotal, vProcessed, vTotal]));
    end else begin
      DoLogInformation('no photos "not in set"');
    end;

  until (vProcessed >= vTotal) or (vCnt = 0);

//  FSync_LoadFlickrPhotosNotInSet := True;

end;

constructor TSendUserActivityMessageSnapshot.Create(
  const aStrings: Tstrings;
  const aMessageTxt: string;
  const aLogAsSingleMessage: Boolean);
begin
  inherited Create;

  Assert(Assigned(aStrings));
  FStartedAt := GetTickCount;
  FLogAsSingleMessage := aLogAsSingleMessage;
  FStrings := aStrings;
  FMessageTxt := aMessageTxt;

  if GlobalIndent.ContainsKey(FStrings) then
    FIndent := GlobalIndent.Items[FStrings];

  if FLogAsSingleMessage then
  begin
    FStrings.Add(StringOfChar(' ', FIndent) + FMessageTxt);
  end else begin
    GlobalIndent.AddOrSetValue(FStrings, FIndent + 2);
    FStrings.Add(StringOfChar('-', FIndent) + '> ' + FMessageTxt);
  end;
end;

destructor TSendUserActivityMessageSnapshot.Destroy;
begin
  if Assigned(FStrings) then
  begin
    Restore;
    FMessageTxt := '';
    if not FLogAsSingleMessage then
      GlobalIndent.AddOrSetValue(FStrings, FIndent - 2);
  end;
  inherited Destroy;
end;

procedure TSendUserActivityMessageSnapshot.Restore;
begin
  if not FLogAsSingleMessage then
    FStrings.Add(StringOfChar('-', FIndent) + '< ' + FMessageTxt + ' ' +IntToStr(GetTickCount - FStartedAt) + ' ms');
end;

constructor TLocalWorkLoad.Create;
begin
  inherited;
  AlbumsCount := 0;
  PhotosCount := 0;
  FWorkCollection := TLocalFolderList.Create(
  TComparer<TLocalFolder>.Construct(
    function(const Left, Right: TLocalFolder): Integer
    begin
      Result := CompareText(Right.AlbumName, Left.AlbumName);
    end));

end;

destructor TLocalWorkLoad.Destroy;
begin
  Clear;
  FreeAndNil(FWorkCollection);
  inherited;
end;

procedure TLocalWorkLoad.Clear;
var
  vLocalFolder: TLocalFolder;
begin
  for vLocalFolder in FWorkCollection.ToArray do begin
    vLocalFolder.Free;
  end;
  FWorkCollection.Clear;
  AlbumsCount := 0;
  PhotosCount := 0;
end;

function TLocalWorkLoad.GetIsUploadCompleteForAllAlbums: Boolean;
var
  vAlbum: TLocalFolder;
begin
  if not FIsUploadCompleteForAllAlbums then
  begin
    FIsUploadCompleteForAllAlbums := True;
    for vAlbum in WorkCollection.ToArray do begin
      // all Albums must be processed or failed at least 3 times
      FIsUploadCompleteForAllAlbums := FIsUploadCompleteForAllAlbums and vAlbum.IsUploadCompleteForAllPhotos;
      if not FIsUploadCompleteForAllAlbums then
        Break;
    end;
  end;

  Result := FIsUploadCompleteForAllAlbums;
end;

constructor TCollectFileDataThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  Priority := tpLowest;
end;

destructor TCollectFileDataThread.Destroy;
begin
  inherited;
end;

procedure TCollectFileDataThread.Execute;
var
  vPhoto: TLocalPhoto;
  vPhotoUploaded, vPhotosLoaded: boolean;
  vPhotoIndex, vRepeatCount: integer;
begin

  CoInitialize(nil);
  try

    if Terminated then
      Exit;

    if FLocalFolderToProcess.LocalPhotos.Count  < 40 then
      Priority := tpLowest
    else
      Priority := tpLower;

    if not FLocalFolderToProcess.ArchivedFolder or not Assigned(gFlickrAlbums) then
    begin

      gFlickrAlbumsCriticalSection.Acquire;
      try
        if not Assigned(gFlickrAlbums) then
        begin
          Flickr_Load_AllAlbums;
        end;

        Assert(Assigned(gFlickrAlbums));

        if not gFlickrAlbums.ContainsKey(FLocalFolderToProcess.FlickrAlbumID) then
          FLocalFolderToProcess.FlickrAlbumID := FindFlickrAlbumByName(FLocalFolderToProcess.AlbumName);

      finally
        gFlickrAlbumsCriticalSection.Release;
      end;

      gFlickrPhotosNotInSetCriticalSection.Acquire;
      try

        if not Assigned(gFlickrPhotosNotInSet) then
        begin
          Flickr_Load_PhotosNotInSet;
        end;

        Assert(Assigned(gFlickrPhotosNotInSet));

      finally
        gFlickrPhotosNotInSetCriticalSection.Release;
      end;
    end;

    vPhotoIndex := 0;
    vRepeatCount := 0;

    repeat

      vPhotosLoaded := Assigned(FLocalFolderToProcess.FlickrPhotos);
      if not vPhotosLoaded then
      begin
        if FLocalFolderToProcess.IsNewAlbum then
        begin
          // create to collect processed photos - only once
          FLocalFolderToProcess.FlickrPhotos := TFlickrPhotos.Create;
          vPhotosLoaded := True;
        end else begin
          vPhotosLoaded := FLocalFolderToProcess.ArchivedFolder or FLocalFolderToProcess.Flickr_Load_PhotosForAlbum;
        end;
      end;

      if vPhotosLoaded then
      begin

        for vPhoto in FLocalFolderToProcess.LocalPhotos.ToArray do begin

          if not vPhoto.UploadComplete then
          begin

            vPhotoUploaded := False;

            // wait for 5x secs in case conditions caused error will resolve itself
            if (vPhoto.FailedPostCommands > 0) or (vPhoto.FailedLocalFileProcessing > 0) and (vRepeatCount > 1) then
              Sleep(100);

            // AssignImageUniqueID - is called inside ReadExifData (CCR Exif)
            if vPhoto.ReadExifData then
            begin
              vPhoto.ReadExifDone := True;
              if Terminated then
                Exit;

              if vPhoto.ReadFileProperties then
              begin
                vPhoto.ReadFileDataDone := True;
                if Terminated then
                  Exit;

                if vPhoto.ReadSyncIniData then
                begin
                  vPhoto.ReadSyncIniDone := True;
                  if Terminated then
                    Exit;

                  // succesfully completed local processing - try upload
                  if vPhoto.UploadPhotoToFlickr(FLocalFolderToProcess) then
                  begin
                    // success
                    vPhotoUploaded := True;
                    FLocalFolderToProcess.ProcessedPhotosCount := FLocalFolderToProcess.ProcessedPhotosCount + 1;

                    TInterlocked.Increment(gPhotosProcessed);
                    TInterlocked.Add(gPhotosTotalSize, vPhoto.FileSizeActual);

                    Inc(vPhotoIndex);
                    if not FLocalFolderToProcess.ArchivedFolder then
                      DoLogPhotoProcessInformation(vPhoto.Title, vPhotoIndex, FLocalFolderToProcess.LocalPhotos.Count);
                    if not vPhoto.ReportIntoLog then
                      vPhoto.ProcessingInfo.Clear
                  end;

                end else begin
                  vPhoto.ReadSyncIniDone := False;
                  vPhoto.ProcessingInfo.Add('ReadSyncIniData failed');
                  vPhoto.FailedLocalFileProcessing := vPhoto.FailedLocalFileProcessing + 1;
                end;
              end else begin
                vPhoto.ReadFileDataDone := False;
                vPhoto.ProcessingInfo.Add('ReadFileProperties failed');
                vPhoto.FailedLocalFileProcessing := vPhoto.FailedLocalFileProcessing + 1;
              end;
            end else begin
              vPhoto.ReadExifDone := False;
              vPhoto.ProcessingInfo.Add('ReadExifData failed');
              vPhoto.FailedLocalFileProcessing := vPhoto.FailedLocalFileProcessing + 1;
            end;

            if not vPhotoUploaded then
            begin
              if vPhoto.FailedPostCommands > 0 then
                vPhoto.ProcessingInfo.Add(Format('Post failed %d times', [vPhoto.FailedPostCommands]));
              if vPhoto.FailedLocalFileProcessing > 0 then
                vPhoto.ProcessingInfo.Add(Format('Post failed %d times', [vPhoto.FailedLocalFileProcessing]));
            end;

            if vPhoto.ProcessingInfo.Count > 0 then
            begin
              DoLogInformation(Format('%s (%s): %s', [vPhoto.Title, vPhoto.AlbumName, vPhoto.ProcessingInfo.CommaText]));
            end;

          end;

          if Terminated then
            Exit;
        end;
      end else begin
        Sleep(100);
      end;

      inc(vRepeatCount);

    until FLocalFolderToProcess.IsUploadCompleteForAllPhotos or (vRepeatCount > 10);

    // Create flickr album or load existed one
    // other actions required for complted album

    if FLocalFolderToProcess.ArchivedFolder then
    begin
      FLocalFolderToProcess.FolderProcessingInfo.Clear;
    end else
    if FLocalFolderToProcess.IsLocalDataLoadedForAllPhotos then
    begin
      if FLocalFolderToProcess.IsUploadCompleteForAllPhotos then
      begin
        if FLocalFolderToProcess.Flickr_Sycronize_FolderWith_Album then
          if FLocalFolderToProcess.ProcessedPhotosCount = FLocalFolderToProcess.LocalPhotos.Count then
            FLocalFolderToProcess.FolderProcessingInfo.Clear
          else
            FLocalFolderToProcess.FolderProcessingInfo.Add(Format('*!* Processed %d of %d Photos',
              [FLocalFolderToProcess.ProcessedPhotosCount, FLocalFolderToProcess.LocalPhotos.Count]));
      end else
        FLocalFolderToProcess.FolderProcessingInfo.Add('failed to Upload photos');

    end else
      FLocalFolderToProcess.FolderProcessingInfo.Add('failed to scan photo files');

    if FLocalFolderToProcess.FolderProcessingInfo.Count > 0 then
    begin
      DoLogInformation(Format('%s: %s', [FLocalFolderToProcess.AlbumName, FLocalFolderToProcess.FolderProcessingInfo.CommaText]));
    end;

    TInterlocked.Increment(gAlbumsProcessed);

  finally
    CoUninitialize;
  end;

end;

procedure TCollectFileDataThread.SetLocalFolderToProcess(const Value: TLocalFolder);
begin
  FLocalFolderToProcess := Value;
end;

procedure TCleanUpThread.Execute;
begin
  NameThreadForDebugging('Clean up');
end;

constructor TPicasaSettings.Create;
begin
  inherited Create;
  FContacts := TDictionaryStrings.Create;
end;

destructor TPicasaSettings.Destroy;
begin
  FreeAndNil(FContacts);
  inherited;
end;

procedure TPicasaSettings.ApplySettings(
  const aDoNotApplyForFaces, aIsFamilyForFaces, aIsFriendForFaces, aIsPublicForFaces: Boolean;
  const aDoNotApplyNoFaces, aIsFamilyNoFaces, aIsFriendNoFaces, aIsPublicNoFaces: Boolean;
  const aContactsXMLFileName: string);
begin
  ApplyForFaces := not aDoNotApplyForFaces;
  ApplyNoFaces := not aDoNotApplyNoFaces;
  if (ApplyForFaces or ApplyNoFaces) and FileExists(aContactsXMLFileName) then
  begin
    FIsFamilyForFaces := aIsFamilyForFaces;
    FIsFriendForFaces := aIsFriendForFaces;
    FIsPublicForFaces := aIsPublicForFaces;
    FIsFamilyNoFaces := aIsFamilyNoFaces;
    FIsFriendNoFaces := aIsFriendNoFaces;
    FIsPublicNoFaces := aIsPublicNoFaces;
  end;

  LoadPicasaContacts(aContactsXMLFileName);

end;

function TPicasaSettings.GetIsFamilyForFaces: string;
begin
  Result := IfThen(FApplyForFaces, IfThen(FIsFamilyForFaces, '1', '0'), gFlickrSettings.IsFamily);
end;

function TPicasaSettings.GetIsFamilyNoFaces: string;
begin
  Result := IfThen(FApplyNoFaces, IfThen(FIsFamilyNoFaces, '1', '0'), gFlickrSettings.IsFamily);
end;

function TPicasaSettings.GetIsFriendForFaces: string;
begin
  Result := IfThen(FApplyForFaces, IfThen(FIsFriendForFaces, '1', '0'), gFlickrSettings.IsFriend);
end;

function TPicasaSettings.GetIsFriendNoFaces: string;
begin
  Result := IfThen(FApplyNoFaces, IfThen(FIsFriendNoFaces, '1', '0'), gFlickrSettings.IsFriend);
end;

function TPicasaSettings.GetIsPublicForFaces: string;
begin
  Result := IfThen(FApplyForFaces, IfThen(FIsPublicForFaces, '1', '0'), gFlickrSettings.IsPublic);
end;

function TPicasaSettings.GetIsPublicNoFaces: string;
begin
  Result := IfThen(FApplyNoFaces, IfThen(FIsPublicNoFaces, '1', '0'), gFlickrSettings.IsPublic);
end;

procedure TPicasaSettings.LoadPicasaContacts(const aContactsXMLFileName: string);
var
  vXML: IbvXMLAccess;
  vID, vName: string;
  vcntstr: string;
  i, vCnt: integer;
  vXMLContent: TStringList;
begin
  FContacts.Clear;
  if FileExists(aContactsXMLFileName) then
  begin

    vXMLContent := TStringList.Create;
    try

//  SetMultiByteConversionCodePage(DefaultSystemCodePage);
//  DefaultUnicodeCodePage := DefaultSystemCodePage;

      vXMLContent.LoadFromFile(aContactsXMLFileName, TEncoding.UTF8);  //! UTF8 important for picasa contacts

      vXML := TbvXMLAccess.Create(vXMLContent.Text);
      vcntstr := vXML.Element['contacts.contact[?]'];
      vCnt := StrToIntDef(vcntstr, 0);
      for i := 0 to vCnt - 1 do begin
        vID := vXML.Attribute[Format('contacts.contact[%d].id', [i])];
        vName := vXML.Attribute[Format('contacts.contact[%d].name', [i])];
        FContacts.Add(vID, vName);
      end;

    finally
      vXMLContent.Free;
    end;

  end;
end;

procedure TFlickrSettings.ApplyActualSettings(
  const aIsFamily, aIsFriend, aIsPublic, aPermissionAddMeta, aPermissionComment: String);
begin
  FIsFamily_Default := aIsFamily;
  FIsFriend_Default := aIsFriend;
  FIsPublic_Default := aIsPublic;
  FPermissionAddMeta_Default := aPermissionAddMeta;
  FPermissionComment_Default := aPermissionComment;
end;

procedure TFlickrSettings.ApplySettings(
  const aWhoCanSeeDefault, aIsFamily, aIsFriend, aIsPublic: Boolean;
  const aPermissionAddMeta, aPermissionComment, aSafetyFilter, aHiddenFromSearch: integer);
begin
  FWhoCanSeeDefault := aWhoCanSeeDefault;
  FIsFamily := aIsFamily;
  FIsFriend := aIsFriend;
  FIsPublic := aIsPublic;
  FPermissionAddMeta := aPermissionAddMeta;
  FPermissionComment := aPermissionComment;
  FSafetyFilter := aSafetyFilter;
  FHiddenFromSearch := aHiddenFromSearch;
end;

function TFlickrSettings.GetHiddenFromSearch: string;
begin
  Result := IfThen(FHiddenFromSearch > 2, '', IntToStr(FHiddenFromSearch));
end;

function TFlickrSettings.GetIsFamily: string;
begin
  Result := IfThen(FWhoCanSeeDefault, FIsFamily_Default, IfThen(FIsFamily, '1', '0'));
end;

function TFlickrSettings.GetIsFriend: string;
begin
  Result := IfThen(FWhoCanSeeDefault, FIsFriend_Default, IfThen(FIsFriend, '1', '0'));
end;

function TFlickrSettings.GetIsPublic: string;
begin
  Result := IfThen(FWhoCanSeeDefault, FIsPublic_Default, IfThen(FIsPublic, '1', '0'));
end;

function TFlickrSettings.GetPermissionAddMeta: string;
begin
  Result := IfThen(FPermissionAddMeta > 3, FPermissionAddMeta_Default, IntToStr(FPermissionAddMeta));
end;

function TFlickrSettings.GetPermissionComment: string;
begin
  Result := IfThen(FPermissionComment > 3, FPermissionComment_Default, IntToStr(FPermissionComment));
end;

function TFlickrSettings.GetSafetyFilter: string;
begin
  Result := IfThen(FSafetyFilter > 3, '', IntToStr(FSafetyFilter));
end;

constructor TIniFileUnicode.Create(const FileName: string; const aIniFileUnicode_Mode: TIniFileUnicode_Mode);
begin
  inherited Create(FileName, TEncoding.Unicode);
  FIniFileUnicode_Mode := aIniFileUnicode_Mode;
  FWriteRequired := FIniFileUnicode_Mode = fWriteIni;
end;

destructor TIniFileUnicode.Destroy;
begin
  if (FIniFileUnicode_Mode = fWriteIni) and FWriteRequired then
  begin
    UpdateFile;
  end;

  inherited;
end;

constructor TFlickrPhoto.Create;
begin
  Inherited;
  IsPrimary := '0';
end;

procedure TCustomMessageRecord.CustomMessageToForm(
  const aMsg: string;
  const aDlgType: TMsgDlgType;
  const aButtons: TMsgDlgButtons;
  const aDefaultButton: TMsgDlgBtn;
  const aAutoCloseTime: Cardinal);
begin
  FThreadID := GetCurrentThreadID;
  FMsg := aMsg;
  FDlgType := aDlgType;
  FButtons := aButtons;
  FDefaultButton := aDefaultButton;
  FAutoCloseTime := aAutoCloseTime;
  PostMessage(gMainFormHandle, TH_MYMESSAGE, TH_CUSTOMMESSAGE, NativeInt(Addr(Self)));
end;

initialization

  GlobalIndent := TDictionary<Tstrings, integer>.Create;
  gPicasaSettings := TPicasaSettings.Create;
  gFlickrSettings := TFlickrSettings.Create;

  gImageUniqueIDList := TDictionaryStrings.Create;
  gWorkAlbumsFromFolders := TDictionaryStrings.Create;

  gFlickrAlbumsCriticalSection := TCriticalSection.Create;
  gFlickrPhotosNotInSetCriticalSection := TCriticalSection.Create;
  gJpegExifCriticalSection := TCriticalSection.Create;
  gFlickrPostPhotoCriticalSection := TCriticalSection.Create;
  gImageUniqueIDAccessCriticalSection := TCriticalSection.Create;
  gFileAccessCriticalSection := TSemaphore.Create(nil, 3, 3, 'gFileAccessCriticalSection');

finalization

  gFileAccessCriticalSection.Free;
  gImageUniqueIDAccessCriticalSection.Free;
  gFlickrPostPhotoCriticalSection.Free;
  gFlickrAlbumsCriticalSection.Free;
  gFlickrPhotosNotInSetCriticalSection.Free;
  gJpegExifCriticalSection.Free;

  FreeAndNil(GlobalIndent);
  FreeAndNil(gPicasaSettings);
  FreeAndNil(gFlickrSettings);
  ClearFlickrPhotosNotInSet;
  FreeAndNil(gFlickrPhotosNotInSet);
  FreeAndNil(gFlickrAlbums);
  FreeAndNil(gWorkAlbumsFromFolders);
  FreeAndNil(gImageUniqueIDList);

end.
