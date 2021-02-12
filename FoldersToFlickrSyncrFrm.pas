unit FoldersToFlickrSyncrFrm;

{$WARN UNIT_PLATFORM OFF}

interface

uses
  System.SysUtils, System.Variants, System.Classes, Winapi.Messages,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, REST.Client, Data.Bind.Components,
  Vcl.ComCtrls, REST.Authenticator.OAuth, REST.Authenticator.OAuth.WebForm.Win, SHDocVw,
  FoldersToFlickrSyncrSupportUnit, FoldersToFlickrSyncrMethodsClassesUnit, IdHTTP,
  IdSSLOpenSSL, IdHeaderList, System.Generics.Collections, System.Types,
  IdTCPConnection, Vcl.Menus, Vcl.ActnPopup, Vcl.ExtDlgs, Vcl.Grids, Vcl.Samples.Spin,
  Windows7SupportUnit, Vcl.CheckLst, REST.Types, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, System.ImageList, Vcl.ImgList, Vcl.PlatformDefaultStyleActnCtrls,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdBaseComponent, IdComponent, IdTCPClient,
  Data.Bind.ObjectScope;

type
  TFoldersToFlickrSyncrForm = class(TForm)
    aclActions: TActionList;
    actAddFolderToSycncronization: TAction;
    actCancelSyncronization: TAction;
    actChangeOrCreateUser: TAction;
    actClearAccessToken: TAction;
    actClearLogs: TAction;
    actCopyToClipboard: TAction;
    actCreateAlbum: TAction;
    actGenerateCodeForMethods: TAction;
    actGetAccessToken: TAction;
    actGetCredentialsForAccessToken: TAction;
    actGetPermissionsFromPiwigoSync: TAction;
    actGetPhotosetList: TAction;
    actGetRequestTokenAndAuthCode: TAction;
    actGetUploadStatus: TAction;
    actLoadFlickrAlbums: TAction;
    actLocateDummyPlaceholder: TAction;
    actLocatePicasaContactsXML: TAction;
    actPrepareFolderStructure: TAction;
    actRemoveFolderFromSyncronization: TAction;
    actReplacingPhotos: TAction;
    actSaveResizedPhotosFolder: TAction;
    actSortAlbums: TAction;
    actSyncronize: TAction;
    actTestEcho: TAction;
    actTestLogin: TAction;
    actTestSelected: TAction;
    actUploadingPhotos: TAction;
    actUploadingPhotosIndyBased: TAction;
    BindingsList1: TBindingsList;
    bntGetPermissionsFromPiwigoSync: TButton;
    btnAddFolderToSycncronization: TButton;
    btnCancelSyncronization: TButton;
    btnChangeUser: TButton;
    btnClearAccessToken: TButton;
    btnClearLogs: TButton;
    btnCreateAlbum: TButton;
    btnGenerateCodeForMethods: TButton;
    btnGetAccessToken: TButton;
    btnGetCredentialsForAccessToken: TButton;
    btnGetPhotosetList: TButton;
    btnGetRequestTokenAndAuthCode: TButton;
    btnGetUploadStatus: TButton;
    btnLoadFlickrAlbums: TButton;
    btnLocateDummyPlaceholder: TButton;
    btnLocatePicasaContactsXML: TButton;
    btnPrepareFolderStructure: TButton;
    btnRemoveFolderFromSyncronization: TButton;
    btnReplacingPhotos: TButton;
    btnSaveResizedPhotosFolder: TButton;
    btnSortAlbums: TButton;
    btnSyncronize: TButton;
    btnTestEcho: TButton;
    btnTestLogin: TButton;
    btnTestSelected: TButton;
    btnUploadingPhotos: TButton;
    btnUploadingPhotosIndyBased: TButton;
    chbExcludeContacts: TCheckListBox;
    chbIncludeContacts: TCheckListBox;
    chkApplyPermissionsChanges: TCheckBox;
    chkDoNotUnlinkUnknownPhotosFromAlbum: TCheckBox;
    chkEnforceSyncrIniPermissions: TCheckBox;
    chkIgnoreArchivedFlag: TCheckBox;
    chkPicasaContactsFamily: TCheckBox;
    chkPicasaContactsFriends: TCheckBox;
    chkPicasaNoContactsFamily: TCheckBox;
    chkPicasaNoContactsFriends: TCheckBox;
    chkPicasaPeopleToAlbum: TCheckBox;
    chkProcessDoNotDeleteUnknownAlbums: TCheckBox;
    chkResize: TCheckBox;
    chkResumeFromIncompletedFolders: TCheckBox;
    chkSaveResizedPhotosFolder: TCheckBox;
    chkSetImageDescription: TCheckBox;
    chkWhoCanSeeFamily: TCheckBox;
    chkWhoCanSeeFriends: TCheckBox;
    cmbLanguage: TComboBox;
    dlgOpen: TOpenDialog;
    dlgOpenPlaceholder: TOpenPictureDialog;
    edtAccessToken: TLabeledEdit;
    edtAccessTokenSecret: TLabeledEdit;
    edtAlbumsCreated: TEdit;
    edtAlbumsProcessed: TEdit;
    edtAlbumsToProcess: TEdit;
    edtAverageSize: TEdit;
    edtBaseURL: TLabeledEdit;
    edtConsumerKey: TLabeledEdit;
    edtConsumerSecret: TLabeledEdit;
    edtErrors: TEdit;
    edtFlickrAPICalls: TEdit;
    edtFoldersScanned: TEdit;
    edtFoldersToAlbums: TEdit;
    edtLastApiCallMethodName: TLabeledEdit;
    edtPeopleAlbumName: TEdit;
    edtPhotoReplacments: TEdit;
    edtPhotosProcessed: TEdit;
    edtPhotosToProcess: TEdit;
    edtPhotosTotalSize: TEdit;
    edtPhotosUploaded: TEdit;
    edtPicasaContacts: TLabeledEdit;
    edtPiwigoSyncFile: TLabeledEdit;
    edtPlaceholderImageLocation: TLabeledEdit;
    edtReplacementPhotoDescription: TLabeledEdit;
    edtReplacementPhotoTags: TLabeledEdit;
    edtReplacementPhotoTitle: TLabeledEdit;
    edtReplacingPhotosURL: TLabeledEdit;
    edtRequestToken: TLabeledEdit;
    edtRequestTokenSecret: TLabeledEdit;
    edtResizeFileSize: TLabeledEdit;
    edtResizeHeight: TLabeledEdit;
    edtResizeJpgQuality: TEdit;
    edtResizeWidth: TLabeledEdit;
    edtResolvedErrors: TEdit;
    edtResponseStatusCode: TLabeledEdit;
    edtRESTEndpointURL: TLabeledEdit;
    edtSaveResizedPhotosFolder: TEdit;
    edtStatusText: TLabeledEdit;
    edtSyncronizationTime: TEdit;
    edtThreadsActive: TEdit;
    edtThreadsCompleted: TEdit;
    edtThreadsToRun: TSpinEdit;
    edtUploadedSize: TEdit;
    edtUploadingPhotosURL: TLabeledEdit;
    edtUploadPhotoDescription: TLabeledEdit;
    edtUploadPhotoTags: TLabeledEdit;
    edtUploadPhotoTitle: TLabeledEdit;
    edtUserAccessPermission: TLabeledEdit;
    edtUserFullName: TLabeledEdit;
    edtUserID: TLabeledEdit;
    edtUserName: TLabeledEdit;
    edtVerifierPIN: TLabeledEdit;
    grbActions: TGroupBox;
    grbAlbumsfromFolders: TGroupBox;
    grbAlbumsonFlickr: TGroupBox;
    grbApplicationUploadSettings: TGroupBox;
    grbApplyPermissionChanges: TGroupBox;
    grbAuthentication: TGroupBox;
    grbDefaultFlickrPermissionsForUploadedItems: TGroupBox;
    grbDummyPhoto: TGroupBox;
    grbErrors: TGroupBox;
    grbExcludeContacts: TGroupBox;
    grbExcludeFolders: TGroupBox;
    grbFlickrAPICalls: TGroupBox;
    grbFlickrSettings: TGroupBox;
    grbFolderFilters: TGroupBox;
    grbFoldersAndPhotos: TGroupBox;
    grbIncludeContacts: TGroupBox;
    grbIncludeFolders: TGroupBox;
    grbOperations: TGroupBox;
    grbPermissionsFromPiwigo_sync_files: TGroupBox;
    grbPhotoRequestBody: TGroupBox;
    grbPhotoResponse: TGroupBox;
    grbPhotosProcessed: TGroupBox;
    grbPicasa: TGroupBox;
    grbPicasaContacts: TGroupBox;
    grbPicasaContactsFilters: TGroupBox;
    grbPicasaPeopleToAlbum: TGroupBox;
    grbPriorityDescriptionForPhoto: TGroupBox;
    grbResizeRules: TGroupBox;
    grbSyncronizationActivity: TGroupBox;
    grbTopFoldersToSyncronize: TGroupBox;
    grdThreadsData: TStringGrid;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    imlSupport: TImageList;
    lblActiveThreads: TLabel;
    lblActivityMessage: TLabel;
    lblAlbumsCreated: TLabel;
    lblAlbumsFromFoldersBottom: TLabel;
    lblAlbumsonFlickrBottom: TLabel;
    lblAlbumsProcessed: TLabel;
    lblAlbumsProcessedDetails: TLabel;
    lblAverageSize: TLabel;
    lblAverageSizeDetails: TLabel;
    lblClearAccessTokenWarning: TLabel;
    lbldot1: TLabel;
    lbldot2: TLabel;
    lbldot3: TLabel;
    lbldotdotdot: TLabel;
    lblError: TLabel;
    lblErrors: TLabel;
    lblErrorsDetails: TLabel;
    lblFlickrAPICalls: TLabel;
    lblFlickrAPICallsDetails: TLabel;
    lblFoldersScanned: TLabel;
    lblFoldersScannedDetails: TLabel;
    lblFoldersToScan: TLabel;
    lblFoldersToScanDetails: TLabel;
    lblFoldersWithAlbums: TLabel;
    lblGetAccessToken: TLabel;
    lblGetRequestTokenAndAuthCode: TLabel;
    lblLanguage: TLabel;
    lblPeopleAlbumName: TLabel;
    lblPhotosfromfolder: TLabel;
    lblPhotosProcessed: TLabel;
    lblPhotosProcessedDetails: TLabel;
    lblPhotosReplaced: TLabel;
    lblPhotosTotalSize: TLabel;
    lblPhotosTotalSizeDetails: TLabel;
    lblPhotosUploaded: TLabel;
    lblPlaceholderImageLocation: TLabel;
    lblResizeJpgQuality: TLabel;
    lblResolvedErrors: TLabel;
    lblResolvedErrorsDetails: TLabel;
    lblSizeofUploadedPhotos: TLabel;
    lblStatusBarStatus: Tlabel;
    lblStatusBarUserAccessPermission: Tlabel;
    lblStatusBarUserFullName: Tlabel;
    lblStatusBarUserID: Tlabel;
    lblStatusBarUserName: Tlabel;
    lblSyncronizationTime: TLabel;
    lblSyncronizationTimeDetails: TLabel;
    lblThreadsActive: TLabel;
    lblThreadsActiveDetails: TLabel;
    lblThreadsCompleted: TLabel;
    lblThreadsCompletedDetails: TLabel;
    lblUploadedSizeDetails: TLabel;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    lnlAlbumsToProcess: TLabel;
    lnlAlbumsToProcessDetails: TLabel;
    lnlPhotosToProcess: TLabel;
    lnlPhotosToProcessDetails: TLabel;
    lstAlbums: TListBox;
    lstAlbumsFromFolders: TListBox;
    lstAPICalls: TListBox;
    lstTopFoldersToSyncronize: TListBox;
    memActionsLog: TMemo;
    memErrorsLog: TMemo;
    memExcludeFiles: TMemo;
    memFlickrLog: TMemo;
    memGeneratedCode: TMemo;
    memIncludeFiles: TMemo;
    memMethodInfo: TMemo;
    memPhotoRequestBody: TMemo;
    memPhotoResponse: TMemo;
    memResponceContent: TMemo;
    memResponseErrorMessage: TMemo;
    memSortAlbums: TMemo;
    memSyncronizatioLog: TMemo;
    mniAddFoldertoSycncronization: TMenuItem;
    mniCollectFoldersDataforSyncronization: TMenuItem;
    mniCopycontentintoClipboard: TMenuItem;
    mniCopyToClipboard: TMenuItem;
    mniRemoveFolderfromSyncronization: TMenuItem;
    mnuPopup: TPopupActionBar;
    mnuTopFoldersToSyncronize: TPopupActionBar;
    N1: TMenuItem;
    N2: TMenuItem;
    OAuthAuthenticator: TOAuth1Authenticator;
    pcDevelopment: TPageControl;
    pcGenerator: TPageControl;
    pcPages: TPageControl;
    pcPhotosOperations: TPageControl;
    pcResponse: TPageControl;
    pnlActionsPerformed: TPanel;
    pnlActivityMessage: TPanel;
    pnlAuthentication: TPanel;
    pnlClearLogs: TPanel;
    pnlDefaultFlickrPermissionsForUploadedItems1: TPanel;
    pnlDefaultFlickrPermissionsForUploadedItems2: TPanel;
    pnlFilters: TPanel;
    pnlFlickrAlbums: TPanel;
    pnlFlickrAPISettings: TPanel;
    pnlFlickrDummyPhoto: TPanel;
    pnlFlickrDummyPhotoInfo: TPanel;
    pnlFolderActions: TPanel;
    pnlFoldersControl: TPanel;
    pnlGenerator: TPanel;
    pnlHeader: TPanel;
    pnlJpegQuality: TGridPanel;
    pnlLoadFlickrAlbums: TPanel;
    pnlPages: TPanel;
    pnlPermissionsForPhotosWithFacesInContacts: TPanel;
    pnlPhotoOperations: TPanel;
    pnlPicasa: TPanel;
    pnlPicasaContacts: TPanel;
    pnlPicasaPermissions: TPanel;
    pnlPlaceholderImageLocation: TPanel;
    pnlResizeLimits: TPanel;
    pnlSaveResized: TPanel;
    pnlSaveResizedEdit: TPanel;
    pnlScanFolders: TPanel;
    pnlStatusBarApplicationData: TPanel;
    pnlStatusBarProgress: TPanel;
    pnlStatusBarStatus: TPanel;
    pnlStatusBarUserAccessPermission: TPanel;
    pnlStatusBarUserAndPrograssBar: TPanel;
    pnlStatusBarUserFullName: TPanel;
    pnlStatusBarUserID: TPanel;
    pnlStatusBarUserName: TPanel;
    pnlSyncronizationActivity: TGridPanel;
    pnlSyncronizationJob: TPanel;
    pnlTestButtons: TPanel;
    pnlTestHeader: TPanel;
    pnlTopFolders: TPanel;
    pnlWhoCanSee: TPanel;
    prbProgress: TProgressBar;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    rgpChooseSafetyFilter: TRadioGroup;
    rgpChooseSearchSetting: TRadioGroup;
    rgpFlickrAlbumsSortOrder: TRadioGroup;
    rgpHandleFoldersOrder: TRadioGroup;
    rgpPermissionsForPhotosWithFaces: TRadioGroup;
    rgpPermissionsForPhotosWithOutFaces: TRadioGroup;
    rgpPriorityPermissions: TRadioGroup;
    rgpPriorityTitle: TRadioGroup;
    rgpWhoCanAddMeta: TRadioGroup;
    rgpWhoCanComment: TRadioGroup;
    rgpWhoCanSee: TRadioGroup;
    scbSettings: TScrollBox;
    Splitter1: TSplitter;
    Splitter10: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    Splitter6: TSplitter;
    Splitter7: TSplitter;
    Splitter8: TSplitter;
    splUploads: TSplitter;
    stbApplication: TPanel;
    tbsApiCalls: TTabSheet;
    tbsAuthentication: TTabSheet;
    tbsDevelopment: TTabSheet;
    tbsDevelopmentCustomActions: TTabSheet;
    tbsFlickrAPICalls: TTabSheet;
    tbsFlickrSettings: TTabSheet;
    tbsFoldersToSyncronize: TTabSheet;
    tbsGenerationCode: TTabSheet;
    tbsGenerationMethodInfo: TTabSheet;
    tbsGenerator: TTabSheet;
    tbsLogs: TTabSheet;
    tbsPhotos: TTabSheet;
    tbsPicasaSettings: TTabSheet;
    tbsResponseContent: TTabSheet;
    tbsResponseErrorMessage: TTabSheet;
    tbsSortAlbums: TTabSheet;
    tbsSyncronizationMonitor: TTabSheet;
    tbsUploadingPhotosDetails: TTabSheet;
    tbsUploadSetting: TTabSheet;
    trvFolderStructure: TTreeView;
    trvPicasaContacts: TTreeView;
    procedure actAddFolderToSycncronizationExecute(Sender: TObject);
    procedure actCancelSyncronizationExecute(Sender: TObject);
    procedure actCancelSyncronizationUpdate(Sender: TObject);
    procedure actChangeOrCreateUserExecute(Sender: TObject);
    procedure actChangeOrCreateUserUpdate(Sender: TObject);
    procedure actClearAccessTokenExecute(Sender: TObject);
    procedure actClearAccessTokenUpdate(Sender: TObject);
    procedure actClearLogsExecute(Sender: TObject);
    procedure actCopyToClipboardExecute(Sender: TObject);
    procedure actCreateAlbumExecute(Sender: TObject);
    procedure actCreateAlbumUpdate(Sender: TObject);
    procedure actGenerateCodeForMethodsExecute(Sender: TObject);
    procedure actGenerateCodeForMethodsUpdate(Sender: TObject);
    procedure actGetAccessTokenExecute(Sender: TObject);
    procedure actGetAccessTokenUpdate(Sender: TObject);
    procedure actGetCredentialsForAccessTokenExecute(Sender: TObject);
    procedure actGetCredentialsForAccessTokenUpdate(Sender: TObject);
    procedure actGetPermissionsFromPiwigoSyncExecute(Sender: TObject);
    procedure actGetPermissionsFromPiwigoSyncUpdate(Sender: TObject);
    procedure actGetPhotosetListExecute(Sender: TObject);
    procedure actGetPhotosetListUpdate(Sender: TObject);
    procedure actGetRequestTokenAndAuthCodeExecute(Sender: TObject);
    procedure actGetRequestTokenAndAuthCodeUpdate(Sender: TObject);
    procedure actGetUploadStatusExecute(Sender: TObject);
    procedure actGetUploadStatusUpdate(Sender: TObject);
    procedure actLoadFlickrAlbumsExecute(Sender: TObject);
    procedure actLoadFlickrAlbumsUpdate(Sender: TObject);
    procedure actLocateDummyPlaceholderExecute(Sender: TObject);
    procedure actLocatePicasaContactsXMLExecute(Sender: TObject);
    procedure actPrepareFolderStructureExecute(Sender: TObject);
    procedure actPrepareFolderStructureUpdate(Sender: TObject);
    procedure actRemoveFolderFromSyncronizationExecute(Sender: TObject);
    procedure actRemoveFolderFromSyncronizationUpdate(Sender: TObject);
    procedure actReplacingPhotosExecute(Sender: TObject);
    procedure actReplacingPhotosUpdate(Sender: TObject);
    procedure actSaveResizedPhotosFolderExecute(Sender: TObject);
    procedure actSaveResizedPhotosFolderUpdate(Sender: TObject);
    procedure actSortAlbumsExecute(Sender: TObject);
    procedure actSortAlbumsUpdate(Sender: TObject);
    procedure actSyncronizeExecute(Sender: TObject);
    procedure actSyncronizeUpdate(Sender: TObject);
    procedure actTestEchoExecute(Sender: TObject);
    procedure actTestLoginExecute(Sender: TObject);
    procedure actTestLoginUpdate(Sender: TObject);
    procedure actTestSelectedExecute(Sender: TObject);
    procedure actTestSelectedUpdate(Sender: TObject);
    procedure actUploadingPhotosExecute(Sender: TObject);
    procedure actUploadingPhotosIndyBasedExecute(Sender: TObject);
    procedure actUploadingPhotosIndyBasedUpdate(Sender: TObject);
    procedure actUploadingPhotosUpdate(Sender: TObject);
    procedure edtPicasaContactsChange(Sender: TObject);
    procedure edtThreadsToRunChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pnlFiltersResize(Sender: TObject);
    procedure rgpPermissionsForPhotosWithFacesClick(Sender: TObject);
    procedure rgpPermissionsForPhotosWithOutFacesClick(Sender: TObject);
    procedure rgpWhoCanSeeClick(Sender: TObject);
  private
    FActiveCollectFileDataThreads: TThreadList;
    FApplicationIniFile: string;
    FAvailableCollectFileDataThreads: TThreadList;
    FCancelSyncronization: Boolean;
    FExcludeFolders: TListString;
    FFlickrAccessible: Boolean;
    FIncludeFolders: TListString;
    FIncompletedFolders: TStringList;
    FMainFormActivated: Boolean;
    FPhotoListsToProcess: TLocalFolderList;
    FPlaceholderPhotoID: string;
    FProcessThreadsMaxCount: Integer;
    FReadyToProcess: Boolean;
    FSyncFileName: string;
    FSyncronizing: Boolean;
    FSync_CollectFolderData: Boolean;
    FSync_DeleteUnknownAlbums: Boolean;
    FSync_LoadFlickrAlbums: Boolean;
    FTotalFoldersScanned: integer;
    FUserIDCollection: TDictionaryStrings;
    FWebBrowser: TWebBrowser;
    FWebForm: Tfrm_OAuthWebForm;
    FWorkCollectionsFromFolders: TListString;
    FWorkLoad: TLocalWorkLoad;
    ThreadsList: array of cardinal;
    procedure AccessTokenRedirect(const aURL: string; var aDoCloseWebView: boolean);
    procedure ActionMessage(const aMessageTxt: string);
    procedure ActivateApplicationForUser(const aUserName: string);
    procedure AddNewThreads(const aActiveList: TList);
    procedure ApplicationIniFileRead(const aUserName: string);
    procedure ApplicationIniFileWrite;
    procedure AssignDefaultPopupMenu(const aComponent: TComponent);
    procedure BuildTreeStructure;
    procedure CleanActiveThreads;
    procedure CreateCleanUpThread;
    function CreateProcessThread: TCollectFileDataThread;
    function DoFilterDirectories(
      const aPath: string;
      const aSearchRec: TSearchRec): Boolean;
    function DoFilterFiles(
      const aPath: string;
      const aSearchRec: TSearchRec): Boolean;
    function ExecuteAPIMethod(const aAPIMethod: string): boolean; overload; deprecated 'use one based on interface';
    function ExecuteAPIMethod(const aAPIMethod: IFlickrAPIMethod): boolean; overload;
    function ExecuteAPIMethod(const aAPIMethod: IFlickrAPIMethod; out aXML: ibvXMLAccess): boolean; overload;
    function GetAccessToken: string;
    function GetAccessTokenSecret: string;
    function GetApplicationIniFile: string;
    function GetConsumerKey: string;
    function GetConsumerSecret: string;
    function GetCorrectedThreadsCount(const aRequestedThreadCount: integer): Integer;
    procedure GetCredentialsforAccessToken(const aUserName: string);
//    function GetPhotoIDInfo(const aPhotoID: string): boolean;
    function GetPhotoPermissions(const aPhotoID: string;
      out aIsFamily, aIsFriend, aIsPublic, aPermissionAddMeta, aPermissionComment: String): boolean;
    function GetPlaceholderPhotoID: string;
    function GetProcessThreadsMaxCount: Integer;
    function GetRequestToken: string;
    function GetRequestTokenSecret: string;
    function GetSyncFileName: string;
    function GetUserID: string;
    function GetVerifierPIN: string;
    procedure HandleCleanUpThreadTerminate(Sender: TObject);
    procedure IncreaseProcessThreads;
    procedure InitializeProcessThread(const aWorkFolder: TLocalFolder; const aInsertPosition: TInsertPosition);
    function IsFlickrAccessible: boolean;
    function IsPhotoExist(const aPhotoID: string): boolean;
    procedure LocalPhotoFile_ProcessThreadTerminate(Sender: TObject);
    function LogActionActivity(const aMessageTxt: string): ISnapshotInterface;
    function LogActionRecord(const aMessageTxt: string): ISnapshotInterface;
    function PostPhotoToFlickr(
      const aFileName, aPhoto_id, aDescription, aTitle, aTags: string;
      const aIsPublic, aIsFriend, aIsFamily: string;
      const aAsync: Boolean;
      out aResponseText, aUploadedPhotoID, aTicketID: string ): Boolean;
    procedure ResetRESTComponentsToDefaults;
    procedure SetAccessToken(const Value: string);
    procedure SetAccessTokenSecret(const Value: string);
    procedure SetConsumerKey(const Value: string);
    procedure SetConsumerSecret(const Value: string);
    procedure SetProcessThreadsMaxCount(const Value: Integer);
    procedure SetProgressBarPosition(const Value: Integer);
    procedure SetReadyToProcess(const Value: Boolean);
    procedure SetRequestToken(const Value: string);
    procedure SetRequestTokenSecret(const Value: string);
    procedure SetSyncronizing(const Value: Boolean);
    procedure SetUserID(const Value: string);
    procedure SetVerifierPIN(const Value: string);
    function ShowMessageDlg(
      const aMsg: string;
      const aDlgType: TMsgDlgType;
      const aButtons: TMsgDlgButtons;
      const aDefaultButton: TMsgDlgBtn = mbOK;
      const aAutoCloseTime: Cardinal = 0): Integer;
    procedure SortApplicationIniFile;
    function Sync_ApplyPicasaSettings: boolean;
    function Sync_CollectFolderData: Boolean;
    function Sync_CollectFoldersAndFilesForTopFolder(const aSourceFolder: string): Boolean;
    function Sync_DeleteUnknownAlbums: Boolean;
    function Sync_LoadFlickrAlbums: Boolean;
    function Sync_ReorderAlbums: boolean;
    function Sync_SetFlickrPermissions: Boolean;
    function Sync_StartThreadsToProcessCollectedFolders: Boolean;
    function ThreadIDToIndex(const aThreadID: Cardinal): integer;
    procedure ThreadMessage(var Message: TMessage); message TH_MYMESSAGE;
    procedure TopFoldersChanged;
    procedure WebBrowserDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
    property AccessToken: string read GetAccessToken write SetAccessToken;
    property AccessTokenSecret: string read GetAccessTokenSecret write SetAccessTokenSecret;
    property ApplicationIniFile: string read GetApplicationIniFile;
    property ConsumerKey: string read GetConsumerKey write SetConsumerKey;
    property ConsumerSecret: string read GetConsumerSecret write SetConsumerSecret;
    property PlaceholderPhotoID: string read GetPlaceholderPhotoID;
    property ProcessThreadsMaxCount: Integer read GetProcessThreadsMaxCount write SetProcessThreadsMaxCount;
    property ProgressBarPosition: Integer write SetProgressBarPosition;
    property ReadyToProcess: Boolean read FReadyToProcess write SetReadyToProcess;
    property RequestToken: string read GetRequestToken write SetRequestToken;
    property RequestTokenSecret: string read GetRequestTokenSecret write SetRequestTokenSecret;
    property SyncFileName: string read GetSyncFileName;
    property Syncronizing: Boolean read FSyncronizing write SetSyncronizing;
    property UserID: string read GetUserID write SetUserID;
    property VerifierPIN: string read GetVerifierPIN write SetVerifierPIN;
  end;

{ TODO : async mode - find generic solution or upload with temporary title and update title to required value after upload}
{ TODO : thread to check tickets ids for async upload}
{ TODO : remove /hide test tabs and support buttons}
{ TODO : download photos from Auto Upload album ? }
{ TODO : download Picasa contacts and allow to edit/extend them (import and match google contacts) - mark family/friend/private contacts, modify names, store locally and update with actual Picasa contacts file}
{ TODO : create special album with contacts photo from Picasa information}

var
  FoldersToFlickrSyncrForm: TFoldersToFlickrSyncrForm;

implementation

uses
  ActiveX, System.UITypes, System.IniFiles, System.Math, Winapi.Windows,
  FoldersToFlickrSyncrMethodsUnit, System.StrUtils, System.RegularExpressions,
  System.NetEncoding, IdMultipartFormData, Vcl.FileCtrl, System.IOUtils,
  Vcl.Graphics, System.Generics.Defaults, FoldersToFlickrSyncrSelectUserDialogFrm,
  FoldersToFlickrSyncrMessageDialogFrm, System.SyncObjs, Vcl.Clipbrd, Winapi.ShellAPI;

{$R *.dfm}

const
  UserIDSection = 'UserID';

procedure TFoldersToFlickrSyncrForm.AccessTokenRedirect(const aURL: string; var aDoCloseWebView: boolean);
begin
  if ContainsText(aURL, '/authorize.gne') then
    FWebBrowser.OnDocumentComplete := WebBrowserDocumentComplete;
end;

procedure TFoldersToFlickrSyncrForm.actAddFolderToSycncronizationExecute(Sender: TObject);
var
  s, vDir: string;
  vOpt: TSelectDirFileDlgOpts;
  vDirs: TArray<string>;
begin
  if lstTopFoldersToSyncronize.ItemIndex <> -1 then
    s := lstTopFoldersToSyncronize.Items[lstTopFoldersToSyncronize.ItemIndex]
  else if lstTopFoldersToSyncronize.Count > 0 then
    s := lstTopFoldersToSyncronize.Items[0]
  else
    s := '';

  vOpt := vOpt + [sdAllowMultiselect];

  if SelectDirectory(s, vDirs, vOpt, 'Select Location - ' + (Sender as TAction).Caption) then
  begin
    for vDir in vDirs do begin
      s := ExcludeTrailingPathDelimiter(vDir);
      if lstTopFoldersToSyncronize.Items.IndexOf(s) = -1 then
        lstTopFoldersToSyncronize.Items.Add(ExcludeTrailingPathDelimiter(s));
    end;
    FSync_CollectFolderData := False;
  end;

end;

procedure TFoldersToFlickrSyncrForm.actCancelSyncronizationExecute(Sender: TObject);
begin
  FCancelSyncronization := True;

  CleanActiveThreads;
end;

procedure TFoldersToFlickrSyncrForm.actCancelSyncronizationUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Syncronizing and not FCancelSyncronization;
end;

procedure TFoldersToFlickrSyncrForm.actChangeOrCreateUserExecute(Sender: TObject);
var
  vSelectedUser: string;
begin
  ApplicationIniFileWrite;
  vSelectedUser := SelectUser(Self, FUserIDCollection, edtUserID.Text, True);
  if (vSelectedUser = AUTHORIZENEWUSER_ITEM) then
  begin
    // new user - clear tokens from current user
    RequestToken := '';
    RequestTokenSecret := '';
    VerifierPin := '';
    AccessToken := '';
    AccessTokenSecret := '';
    edtUserName.Text := '';
    ActivateApplicationForUser(vSelectedUser);
    actGetRequestTokenAndAuthCode.Execute;
    actGetCredentialsForAccessToken.Execute;
  end
  else if (vSelectedUser <> '') and not SameText(vSelectedUser, edtUserName.Text) then
    ActivateApplicationForUser(vSelectedUser);
end;

procedure TFoldersToFlickrSyncrForm.actChangeOrCreateUserUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not Syncronizing and
    Assigned(FUserIDCollection) and (FUserIDCollection.Count >= 0);
end;

procedure TFoldersToFlickrSyncrForm.actClearAccessTokenExecute(Sender: TObject);
begin
  AccessToken := '';
  AccessTokenSecret := '';
end;

procedure TFoldersToFlickrSyncrForm.actClearAccessTokenUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=
    (edtAccessToken.Text <> '') or (edtAccessTokenSecret.Text <> '');
end;

procedure TFoldersToFlickrSyncrForm.actClearLogsExecute(Sender: TObject);
begin
  memErrorsLog.Lines.Clear;
  memActionsLog.Lines.Clear;
end;

procedure TFoldersToFlickrSyncrForm.actCopyToClipboardExecute(Sender: TObject);

  function _getTreeViewText(const aControl: TTreeView): string;
  var
    i: Integer;
  begin
    Result := '';
    for i := 0 to aControl.Items.Count -1 do begin
      Result := Result + #13#10 + aControl.Items[i].Text;
    end;

    Result := Trim(Result);

  end;

var
  vControl: TWinControl;
begin
  vControl := FindVCLWindow(mnuPopup.PopupPoint);
  if vControl is TMemo then
    ClipBoard.AsText := (vControl as TMemo).Lines.Text
  else if vControl is TListBox then
    ClipBoard.AsText := (vControl as TListBox).Items.Text
  else if vControl is TCheckListBox then
    ClipBoard.AsText := (vControl as TCheckListBox).Items.Text
  else if vControl is TTreeView then
    ClipBoard.AsText := _getTreeViewText(vControl as TTreeView);
end;

procedure TFoldersToFlickrSyncrForm.actCreateAlbumExecute(Sender: TObject);
begin
  ExecuteAPIMethod(Get_photosets_create('rô', '', PlaceholderPhotoID));
end;

procedure TFoldersToFlickrSyncrForm.actCreateAlbumUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := IsFlickrAccessible;
end;

procedure TFoldersToFlickrSyncrForm.actGenerateCodeForMethodsExecute(Sender: TObject);
var
  vXML: IbvXMLAccess;
  vToken: string;
  vFunctionName, vFunctionParams,
  vMethod_Name,
  vNeedsLogin,
  vRequiredPermissions,
  vArgumentsCount,
  vArgumentName,
  vArgumentOptional: string;
  i, j, vCnt: integer;
  vMethods, vFunctionsDeclaration, vFunctionsImplementation, vArguments: TStringlist;
begin
  HourGlass;

  memMethodInfo.Clear;

  if ExecuteAPIMethod(Get_reflection_getMethods, vXML) then
  begin

    vToken := vXML.Element['rsp.methods.method[?]'];
    vCnt := StrToIntDef(vToken, 0);

    prbProgress.Visible := True;
    vArguments := TStringlist.Create;
    vFunctionsDeclaration := TStringlist.Create;
    vFunctionsImplementation := TStringlist.Create;
    vMethods := TStringList.Create;
    try

     vFunctionsDeclaration.Add('// this unit is generated');
     vFunctionsDeclaration.Add('');
     vFunctionsDeclaration.Add('unit FoldersToFlickrSyncrMethodsUnit;');
     vFunctionsDeclaration.Add('');
     vFunctionsDeclaration.Add('interface');
     vFunctionsDeclaration.Add('');
     vFunctionsDeclaration.Add('uses');
     vFunctionsDeclaration.Add('  FoldersToFlickrSyncrMethodsClassesUnit;');
     vFunctionsDeclaration.Add('');

     vFunctionsImplementation.Add('');
     vFunctionsImplementation.Add('implementation');
     vFunctionsImplementation.Add('');

      for i := 0 to vCnt - 1 do begin
        vMethods.Add(vXML.Element[format('rsp.methods.method[%d]', [i])]);
      end;

      prbProgress.Min := 0;
      prbProgress.Max := vMethods.Count - 1;

      for i := 0 to vMethods.Count - 1 do begin
        vFunctionName := ReplaceText(ReplaceText(vMethods[i], 'flickr.', ''), '.', '_');
        vMethod_Name := vMethods[i];
        if ExecuteAPIMethod(Get_reflection_getMethodInfo(vMethods[i])) then
        begin

          memMethodInfo.Lines.Add( 'method_name' + ' = ' + vMethods[i]);

          vXML := TbvXMLAccess.Create(RESTResponse.Content);
          vToken := vXML.Attribute['rsp.stat'];
          Assert(SameText(vToken, rspOK));
          vNeedsLogin := vXML.Attribute['rsp.method.needslogin'];
          memMethodInfo.Lines.Add('rsp.method.needslogin = ' + vNeedsLogin);
          vRequiredPermissions := vXML.Attribute['rsp.method.requiredperms'];
          memMethodInfo.Lines.Add('rsp.method.requiredperms = ' + vRequiredPermissions);
          vToken := vXML.Element['rsp.method.description'];
          memMethodInfo.Lines.Add('rsp.method.description = ' + vToken);
          vToken := vXML.Element['rsp.method.response'];
    //      memGeneratedCode.Lines.Add('rsp.method.response = ' + vToken);
          vArgumentsCount := vXML.Element['rsp.arguments.argument[?]'];
          memMethodInfo.Lines.Add('rsp.arguments.arguments.count = ' + vArgumentsCount);
          vCnt := StrToIntDef(vArgumentsCount, 0);

          vFunctionParams := '';
          vArguments.Clear;
          vFunctionName := 'function Get_' + vFunctionName;

          for j := 0 to vCnt - 1 do begin

            vArgumentName := vXML.Attribute[format('rsp.arguments.argument[%d].name', [j])];
            Assert(((j = 0) and SameText(vArgumentName, ARGUMENTNAME_API_KEY)) or
             ((j <> 0) and not SameText(vArgumentName, ARGUMENTNAME_API_KEY)));

            memMethodInfo.Lines.Add(format('rsp.arguments.argument[%d].name', [j]) + ' = ' + vArgumentName);
            // do not add api_key as parameter to the function
            if j > 0 then
              vFunctionParams := vFunctionParams + IfThen(vFunctionParams = '', 'const a', ', a') + vArgumentName;

            vArgumentOptional := vXML.Attribute[format('rsp.arguments.argument[%d].optional', [j])];
            memMethodInfo.Lines.Add(format('rsp.arguments.argument[%d].optional', [j]) + ' = ' + vArgumentOptional);
            if (j > 0) and SameText(vArgumentOptional, '1') then
              vFunctionParams := vFunctionParams + '_optional';

            vArguments.Add('  vArgument.Name := ' + QuotedStr(vArgumentName) + ';');
            vArguments.Add('  vArgument.Optional := ' + Ifthen(vArgumentOptional = '1', 'True', 'False') + ';');
            if j > 0 then
              vArguments.Add('  vArgument.Value := a' + vArgumentName + IfThen(vArgumentOptional = '1', '_optional', '') + ';');
            vArguments.Add(Format('  Result.Arguments[%d] := vArgument;', [j]));

            vToken := vXML.Element[format('rsp.arguments.argument[%d]', [j])];
            memMethodInfo.Lines.Add(format('rsp.arguments.argument[%d]', [j]) + ' = ' + vToken);
          end;
          memMethodInfo.Lines.Add('');

          if vCnt = 1 then
            vFunctionName := vFunctionName + ': IFlickrAPIMethod;'
          else
            vFunctionName := vFunctionName + '(' + vFunctionParams + ': string): IFlickrAPIMethod;';
          vFunctionsDeclaration.Add(vFunctionName);

          vFunctionsImplementation.Add('');
          vFunctionsImplementation.Add(vFunctionName);
          vFunctionsImplementation.Add('var');
          vFunctionsImplementation.Add('  vArgument: TflArgument;');
          vFunctionsImplementation.Add('begin');
          vFunctionsImplementation.Add('  Result := TflMethod.Create(' +
            QuotedStr(vMethod_Name) + ', ' +
            IfThen(vNeedsLogin = '1', 'True, ', 'False, ') +
            vRequiredPermissions + ', ' +
            vArgumentsCount + ');');
          vFunctionsImplementation.AddStrings(vArguments);
          vFunctionsImplementation.Add('end;');

          prbProgress.Position := i;
        end;

      end;

     vFunctionsImplementation.Add('');
     vFunctionsImplementation.Add('end.');

     vFunctionsDeclaration.AddStrings(vFunctionsImplementation);
     vFunctionsDeclaration.SaveToFile('FoldersToFlickrSyncrMethodsUnit.pas');

     memGeneratedCode.Lines.Clear;
     memGeneratedCode.Lines.AddStrings(vFunctionsDeclaration);

    finally
      prbProgress.Visible := False;
      vMethods.Free;
      vFunctionsImplementation.Free;
      vFunctionsDeclaration.Free;
      vArguments.Free;
    end;
  end;

end;

procedure TFoldersToFlickrSyncrForm.actGenerateCodeForMethodsUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := IsFlickrAccessible;
end;

procedure TFoldersToFlickrSyncrForm.actGetAccessTokenExecute(Sender: TObject);
var
  vToken: string;
begin
  ResetRESTComponentsToDefaults;

  /// grab the verifier from the edit-field
  OAuthAuthenticator.VerifierPIN := edtVerifierPIN.Text;

  /// here, we want to change the request-token and the verifier into an access-token
  if (OAuthAuthenticator.RequestToken = '') or (OAuthAuthenticator.VerifierPIN = '') then
  begin
    ShowMessageDlg('Request-token and verifier are both required.', mtError, [mbOK]);
    Exit;
  end;

  /// we want to request an access-token
  OAuthAuthenticator.AccessToken := '';
  OAuthAuthenticator.AccessTokenSecret := '';

  RESTClient.BaseURL := OAuthAuthenticator.AccessTokenEndpoint;
  RESTClient.Authenticator := OAuthAuthenticator;

  RESTRequest.Method := TRESTRequestMethod.rmPOST;
  RESTRequest.Execute;

  if RESTResponse.GetSimpleValue('oauth_token', vToken) then
    AccessToken := vToken
  else
    AccessToken := '';
  if RESTResponse.GetSimpleValue('oauth_token_secret', vToken) then
    AccessTokenSecret := vToken
  else
    AccessTokenSecret := '';
  if RESTResponse.GetSimpleValue('user_nsid', vToken) then
    UserID := TNetEncoding.URL.Decode(vToken)
  else
    UserID := '';
  if RESTResponse.GetSimpleValue('username', vToken) then
    edtUserName.Text := vToken
  else
    edtUserName.Text := '';
  if RESTResponse.GetSimpleValue('fullname', vToken) then
    edtUserFullName.Text := TNetEncoding.URL.Decode(vToken)
  else
    edtUserFullName.Text := '';

  /// now we should remove the request-token
  RequestToken := '';
  RequestTokenSecret := '';
  VerifierPin := '';

  actChangeOrCreateUser.Caption := Format('Change (%s) or Authorize New User', [edtUserName.Text]);

end;

procedure TFoldersToFlickrSyncrForm.actGetAccessTokenUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (edtVerifierPIN.Text <> '') and
    (edtRequestToken.Text <> '') and
    (edtRequestTokenSecret.Text <> '');
  lblGetAccessToken.Enabled := (Sender as TAction).Enabled;

end;

procedure TFoldersToFlickrSyncrForm.actGetCredentialsForAccessTokenExecute(Sender: TObject);
begin
  GetCredentialsforAccessToken('');
end;

procedure TFoldersToFlickrSyncrForm.actGetCredentialsForAccessTokenUpdate(Sender: TObject);
begin
 (Sender as TAction).Enabled :=
    (edtAccessToken.Text <> '') and (edtAccessTokenSecret.Text <> '');
  edtVerifierPIN.Enabled := not (Sender as TAction).Enabled;
end;

procedure TFoldersToFlickrSyncrForm.actGetPermissionsFromPiwigoSyncExecute(Sender: TObject);
var
  i: Integer;
  vSourceFolder: string;
  vPathList, vFileList: TStringDynArray;
  vPathName, vPivigoIniFileName, s: string;
  vPiwigoIni : TIniFile;
  vSyncrIni: TIniFileUnicode;
  vSections: TStringList;
  vLevel, vIsFamily, vIsFriend, vIsPublic: Integer;
begin
  for i := 0 to lstTopFoldersToSyncronize.Count - 1 do begin
    vSourceFolder := lstTopFoldersToSyncronize.Items[i];

    if System.SysUtils.DirectoryExists(vSourceFolder) then
    begin

      prbProgress.Visible := True;
      try

        prbProgress.Min := 0;
        ProgressBarPosition := 0;
//        vIsFamily := 0;
//        vIsFriend := 0;
//        vIsPublic := 0;

        vPathList := TDirectory.GetDirectories(vSourceFolder,  TSearchOption.soAllDirectories, nil);
        prbProgress.Max := Length(vPathList) - 1;

        for vPathName in vPathList do begin

          vFileList := TDirectory.GetFiles(vPathName, edtPiwigoSyncFile.Text, nil);
          for vPivigoIniFileName in vFileList do
          begin
            if FileExists(ExtractFilePath(vPivigoIniFileName) + SyncFileName) then
            begin
              vPiwigoIni := TIniFile.Create(vPivigoIniFileName);
              try

                vSyncrIni := TIniFileUnicode.Create(ExtractFilePath(vPivigoIniFileName) + SyncFileName, fWriteIni);
                try

                  vSyncrIni.WriteRequired := False;
                  vSections := TStringList.Create;
                  try

                    vPiwigoIni.ReadSections(vSections);
                    for s in vSections do begin
                      if not SameText(s, 'Album') and vSyncrIni.SectionExists(s) and vPiwigoIni.ValueExists(s, 'Level') then
                      begin
                        vLevel := vPiwigoIni.ReadInteger(s, 'level', -1);
                        if (vLevel < 0) or (vLevel > 8) then
                          Continue;
                        // Piwigo Privacy Levels: 8 - Admins, 4 - Family, 2 - Friends, 1 - Contacts, 0 - everybody

                        case vLevel of
                          8: begin
                            vIsFamily := 0;
                            vIsFriend := 0;
                            vIsPublic := 0;
                          end;
                          4: begin
                            vIsFamily := 1;
                            vIsFriend := 0;
                            vIsPublic := 0;
                          end;
                          2: begin
                            vIsFamily := 1;
                            vIsFriend := 1;
                            vIsPublic := 0;
                          end;
                          1: begin
                            vIsFamily := 1;
                            vIsFriend := 1;
                            vIsPublic := 0;
                          end;
                          0: begin
                            vIsFamily := 0;
                            vIsFriend := 0;
                            vIsPublic := 1;
                          end;
                          else
                            Continue;
                        end;

                        vSyncrIni.WriteInteger(s, 'IsFamily', vIsFamily);
                        vSyncrIni.WriteInteger(s, 'IsFriend', vIsFriend);
                        vSyncrIni.WriteInteger(s, 'IsPublic', vIsPublic);
                        vSyncrIni.WriteRequired := True;

                      end;

                    end;

                  finally
                    vSections.Free;
                  end;

                finally
                  vSyncrIni.Free;
                end;

              finally
                vPiwigoIni.Free;
              end;

            end;
          end;

          ProgressBarPosition := prbProgress.Position + 1;
          prbProgress.Update;
        end;

      finally
        prbProgress.Visible := False;
      end;

    end;

  end;
  SetTaskBarProgressState_NoProgress(Self.Handle);
end;

procedure TFoldersToFlickrSyncrForm.actGetPermissionsFromPiwigoSyncUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := edtPiwigoSyncFile.Text <> ''
end;

procedure TFoldersToFlickrSyncrForm.actGetPhotosetListExecute(Sender: TObject);
var
  vXML, vNode: IbvXMLAccess;
  vToken: string;
  vcntstr: string;
  i, vCnt: integer;
begin
  if ExecuteAPIMethod(Get_photosets_getList('','','',''), vXML) then
  begin
    vcntstr := vXML.Element['rsp.photosets.photoset[?]'];
    vCnt := StrToIntDef(vcntstr, 0);
    for i := 0 to vCnt - 1 do begin
      vToken := vXML.Element[format('rsp.photosets.photoset[%d].title', [i])];
      vToken := vXML.Element[format('rsp.photosets.photoset[%d].description', [i])];
      vToken := vXML.Attribute[format('rsp.photosets.photoset[%d].id', [i])];
      vNode := TbvXMLAccess.Create(vXML.Node[format('rsp.photosets.photoset[%d]', [i])].XML);
      vToken := vNode.Attribute['photoset.id'];
      vToken := vNode.Element['photoset.title'];
      vToken := vNode.Element['photoset.description'];
    end;
  end;

end;

procedure TFoldersToFlickrSyncrForm.actGetPhotosetListUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := IsFlickrAccessible;
end;

procedure TFoldersToFlickrSyncrForm.actGetRequestTokenAndAuthCodeExecute(Sender: TObject);
var
  vToken: string;
  vURL: string;
begin
  ResetRESTComponentsToDefaults;

  AccessToken := '';
  AccessTokenSecret := '';
  VerifierPIN := '';
  RequestToken := '';
  RequestTokenSecret := '';

  // we need to transfer the data here manually
  OAuthAuthenticator.ConsumerKey := ApplicationConsumerKey;
  OAuthAuthenticator.ConsumerSecret := ApplicationConsumerSecret;

  /// a client-id is required
  if (OAuthAuthenticator.ConsumerKey = '') then
  begin
    ShowMessageDlg('A Consumer-ID ("client-id" or "app-id") is required.', mtError, [mbOK]);
    Exit;
  end;

  // 1. Getting a Request Token
  RESTClient.BaseURL := OAuthAuthenticator.RequestTokenEndpoint;
  RESTClient.Authenticator := OAuthAuthenticator;

  RESTRequest.Method := TRESTRequestMethod.rmPOST;
  RESTRequest.Execute;

  if RESTResponse.GetSimpleValue('oauth_token', vToken) then
    RequestToken := vToken
  else
    RequestToken := '';
  if RESTResponse.GetSimpleValue('oauth_token_secret', vToken) then
    RequestTokenSecret := vToken
  else
    RequestTokenSecret := '';

  // 2. Getting the User Authorization
  vURL := OAuthAuthenticator.AuthenticationEndpoint + '?oauth_token=' + OAuthAuthenticator.RequestToken +
    '&perms=delete' + '&' + IntToStr(Random(MaxInt));

  FWebForm := Tfrm_OAuthWebForm.Create(Self);
  try
//    vWebForm.Width := Monitor.Width - 300;
//    vWebForm.Height := Monitor.Height - 200;
//    vWebForm.Top := Monitor.Top + 100;
//    vWebForm.Left := Monitor.Left + 150;
//    vWebForm.Browser.Align := alClient;
    FWebBrowser := FWebForm.Browser;
    FWebForm.OnAfterRedirect := AccessTokenRedirect;
    FWebBrowser.MenuBar := True;
    FWebBrowser.Align := alClient;
    FWebBrowser.Visible := True;
    //FWebBrowser.FullScreen := True;
    FWebBrowser.MenuBar := True;
    FWebForm.ShowWithURL(vURL);
    FWebBrowser := nil;

  finally
    FWebForm.Release;
    FWebForm := nil;
  end;

  if RESTResponse.GetSimpleValue('oauth_verifier', vToken) then
  begin
    VerifierPIN := vToken;
  end else begin
    // open default broser for manual autorization
    ShellExecute(Self.WindowHandle, 'open', PChar(vURL), nil, nil, SW_SHOWNORMAL);
  end;

  // 3. Exchanging the Request Token for an Access Token
  if actGetAccessToken.Update then
    actGetAccessToken.Execute;

end;

procedure TFoldersToFlickrSyncrForm.actGetRequestTokenAndAuthCodeUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (edtBaseURL.Text <> '') and
    (ApplicationConsumerKey <> '') and
    (ApplicationConsumerSecret <> '') and
    ((MyAccessToken = '') or (MyAccessTokenSecret = ''));
  lblGetRequestTokenAndAuthCode.Enabled := (Sender as TAction).Enabled;
end;

procedure TFoldersToFlickrSyncrForm.actGetUploadStatusExecute(Sender: TObject);
begin
  ExecuteAPIMethod(Get_people_getUploadStatus);
end;

procedure TFoldersToFlickrSyncrForm.actGetUploadStatusUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := IsFlickrAccessible;
end;

procedure TFoldersToFlickrSyncrForm.ActionMessage(const aMessageTxt: string);
begin
  lblActivityMessage.Caption := aMessageTxt;
  lblActivityMessage.Update;
end;

procedure TFoldersToFlickrSyncrForm.ActivateApplicationForUser(const aUserName: string);
begin
  ApplicationIniFileRead(aUserName);

  GetCredentialsforAccessToken(aUserName);

  if AccessToken = '' then
  begin
    pcPages.ActivePage := tbsAuthentication;
  end;

  if (FPlaceholderPhotoID <> '') and not IsPhotoExist(FPlaceholderPhotoID) then
    FPlaceholderPhotoID := '';
  if not FileExists(edtPlaceholderImageLocation.Text) then
    edtPlaceholderImageLocation.Text := ''
  else
  begin
    lblPlaceholderImageLocation.ParentFont := True;
    lblPlaceholderImageLocation.Font.Color := clGreen;
  end;

  lblFoldersWithAlbums.Caption := 'Click "' + actPrepareFolderStructure.Caption + '" to preview ...';
  lblAlbumsonFlickrBottom.Caption := 'Click "' + actLoadFlickrAlbums.Caption + '" to preview ...';
  edtPhotosProcessed.Text := '0';
  lblPhotosProcessedDetails.Caption := '...';
  edtFoldersScanned.Text := '0';
  lblFoldersScannedDetails.Caption := '...';

  gFlickrApiCallsCount := 0;
  gPhotoUploads := 0;
  gPhotoReplacments := 0;
  gUploadedSize := 0;
  gPhotosTotalSize := 0;

end;

procedure TFoldersToFlickrSyncrForm.actLoadFlickrAlbumsExecute(Sender: TObject);
begin
  Sync_LoadFlickrAlbums;
end;

procedure TFoldersToFlickrSyncrForm.actLoadFlickrAlbumsUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := IsFlickrAccessible;
end;

procedure TFoldersToFlickrSyncrForm.actLocateDummyPlaceholderExecute(Sender: TObject);
begin
  dlgOpenPlaceholder.Title := edtPlaceholderImageLocation.EditLabel.Caption;
  if edtPlaceholderImageLocation.Text <> '' then
    dlgOpenPlaceholder.InitialDir := TPath.GetFullPath(ExtractFileDir(edtPlaceholderImageLocation.Text));
  if dlgOpenPlaceholder.InitialDir = '' then
    dlgOpenPlaceholder.InitialDir := ExtractFileDir(Application.ExeName);
  dlgOpenPlaceholder.FileName := edtPlaceholderImageLocation.Text;
  dlgOpenPlaceholder.Filter := 'Placeholder Image|*.jpg';
  if dlgOpenPlaceholder.Execute then
  begin
    edtPlaceholderImageLocation.Text := dlgOpenPlaceholder.FileName;
    lblPlaceholderImageLocation.ParentFont := True;
    lblPlaceholderImageLocation.Font.Color := clGreen;
  end;
end;

procedure TFoldersToFlickrSyncrForm.actLocatePicasaContactsXMLExecute(Sender: TObject);
begin
  dlgOpen.Title := edtPicasaContacts.EditLabel.Caption;
  if edtPicasaContacts.Text <> '' then
    try
      dlgOpen.InitialDir := TPath.GetFullPath(ExtractFileDir(edtPicasaContacts.Text));
    except
      dlgOpen.InitialDir := '';
    end;
  if dlgOpen.InitialDir = '' then
    dlgOpen.InitialDir := ExtractFileDir(Application.ExeName);
  dlgOpen.FileName := edtPicasaContacts.Text;
  dlgOpen.Filter := 'Picasa Contacts|contacts.xml';
  if dlgOpen.Execute then
  begin
    edtPicasaContacts.Text := dlgOpen.FileName;
  end;

end;

procedure TFoldersToFlickrSyncrForm.actPrepareFolderStructureExecute(Sender: TObject);
begin
  Sync_ApplyPicasaSettings;
  Sync_CollectFolderData;
end;

procedure TFoldersToFlickrSyncrForm.actPrepareFolderStructureUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := lstTopFoldersToSyncronize.Count > 0;
end;

procedure TFoldersToFlickrSyncrForm.actRemoveFolderFromSyncronizationExecute(Sender: TObject);
begin
  if lstTopFoldersToSyncronize.ItemIndex <> -1 then
    lstTopFoldersToSyncronize.Items.Delete(lstTopFoldersToSyncronize.ItemIndex);
  FSync_CollectFolderData := False;
end;

procedure TFoldersToFlickrSyncrForm.actRemoveFolderFromSyncronizationUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := lstTopFoldersToSyncronize.ItemIndex <> -1;
end;

procedure TFoldersToFlickrSyncrForm.actReplacingPhotosExecute(Sender: TObject);
var
  vResponseText, vUploadedPhotoID, vTicketID: String;
begin

  if PostPhotoToFlickr(
    edtPlaceholderImageLocation.Text,
    PlaceholderPhotoID, //  const aPhoto_id: string = ''; // id non empty - it is replacing command
    edtReplacementPhotoDescription.Text,
    edtReplacementPhotoTitle.Text,
    edtReplacementPhotoTags.Text,
    '0', //  const aIs_public: Boolean= False;
    '0', //  const aIs_friend: Boolean= False;
    '0', //  const aIs_family: Boolean= True;
    False, //  const aSyncMode: Boolean= False);
    vResponseText, vUploadedPhotoID, vTicketID) then
  begin
    if vTicketID <> '' then
    begin
    //
    end else
    if vUploadedPhotoID <> '' then
    begin
    //
    end;
  end else begin
    // Failed !
  end;

  memPhotoResponse.Text := vResponseText;

end;

procedure TFoldersToFlickrSyncrForm.actReplacingPhotosUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := IsFlickrAccessible;
end;

procedure TFoldersToFlickrSyncrForm.actSaveResizedPhotosFolderExecute(Sender: TObject);
var
  s, vDir: string;
  vOpt: TSelectDirFileDlgOpts;
  vDirs: TArray<string>;
begin
  if edtSaveResizedPhotosFolder.Text <> '' then
    s := edtSaveResizedPhotosFolder.Text
  else
    s := '';

  vOpt := vOpt - [sdAllowMultiselect];

  if SelectDirectory(s, vDirs, vOpt, 'Select Location - ' + chkSaveResizedPhotosFolder.Caption) then
  begin
    for vDir in vDirs do begin
      s := ExcludeTrailingPathDelimiter(vDir);
      edtSaveResizedPhotosFolder.Text := ExcludeTrailingPathDelimiter(s);
    end;
  end;
end;

procedure TFoldersToFlickrSyncrForm.actSaveResizedPhotosFolderUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := chkSaveResizedPhotosFolder.Checked;
end;

procedure TFoldersToFlickrSyncrForm.actSortAlbumsExecute(Sender: TObject);
begin
  ExecuteAPIMethod(Get_photosets_orderSets(AnsiReplaceText(memSortAlbums.Text, #13#10, '')));
end;

procedure TFoldersToFlickrSyncrForm.actSortAlbumsUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := IsFlickrAccessible and (memSortAlbums.Text <> '');
end;

procedure TFoldersToFlickrSyncrForm.actSyncronizeExecute(Sender: TObject);
begin
  SetTaskBarProgressState_Indeterminate(self.Handle);

  // save current setting in case appliction will be killed
  ApplicationIniFileWrite;

  // set Flag - we are syncronizing
  Syncronizing := True;

  // set gFlickrSettings
  Sync_SetFlickrPermissions;
  // set gPicasaSettings
  Sync_ApplyPicasaSettings;
  // scan folder structures and pick up jpg files for processing
  Sync_CollectFolderData;
  // Start Threads To Process Collected Folders
  Sync_StartThreadsToProcessCollectedFolders;

end;

procedure TFoldersToFlickrSyncrForm.actSyncronizeUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := IsFlickrAccessible and not Syncronizing;
end;

procedure TFoldersToFlickrSyncrForm.actTestEchoExecute(Sender: TObject);
begin
  ExecuteAPIMethod(Get_test_echo);
end;

procedure TFoldersToFlickrSyncrForm.actTestLoginExecute(Sender: TObject);
begin
  ExecuteAPIMethod(Get_test_login);
end;

procedure TFoldersToFlickrSyncrForm.actTestLoginUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := IsFlickrAccessible;
end;

procedure TFoldersToFlickrSyncrForm.actTestSelectedExecute(Sender: TObject);
begin
  {$WARN SYMBOL_DEPRECATED OFF}
  ExecuteAPIMethod(trim(lstAPICalls.Items[lstAPICalls.ItemIndex]));
  {$WARN SYMBOL_DEPRECATED  ON}
end;

procedure TFoldersToFlickrSyncrForm.actTestSelectedUpdate(Sender: TObject);
var
  s: string;
begin
 (Sender as TAction).Enabled :=
    (lstAPICalls.ItemIndex <> -1) and (ContainsText(lstAPICalls.Items[lstAPICalls.ItemIndex], 'flickr.'));

  if (Sender as TAction).Enabled then
  begin
    s := 'Test ' + trim(lstAPICalls.Items[lstAPICalls.ItemIndex]);
    if not SameText((Sender as TAction).Caption, s) then
      (Sender as TAction).Caption := s;
  end;
end;

procedure TFoldersToFlickrSyncrForm.actUploadingPhotosExecute(Sender: TObject);
var
  vImageStream: TFileStream;
  b: TBytes;
  s: string;
  vUploadRESTRequest: TFlickrPostRESTRequest;
begin
  ResetRESTComponentsToDefaults;

  vUploadRESTRequest := TFlickrPostRESTRequest.Create(Self);
  try

    vUploadRESTRequest.ResetToDefaults;
    vUploadRESTRequest.Accept := '*/*';
    vUploadRESTRequest.Client := RESTClient;
    vUploadRESTRequest.Response := RESTResponse;
    vUploadRESTRequest.SynchronizedEvents := False;

    RESTClient.BaseURL := FlickrUploadingPhotosURL;
    RESTClient.Authenticator := OAuthAuthenticator;

    vUploadRESTRequest.Resource := '';
    vUploadRESTRequest.Body.ClearBody;

    vImageStream := TFileStream.Create(edtPlaceholderImageLocation.Text, fmOpenRead or fmShareDenyWrite);
    try

      vImageStream.Position := 0;
      SetLength(b, vImageStream.Size);
      vImageStream.ReadBuffer(b, vImageStream.Size);
      vImageStream.Position := 0;
      s := TEncoding.ANSI.GetString(b);
      SetLength(b, 0);

    finally
      vImageStream.Free;
    end;

    //vUploadRESTRequest.AddParameter(ARGUMENTNAME_PHOTO, s, TRESTRequestParameterKind.pkREQUESTBODY);
    //vUploadRESTRequest.AddParameter(ARGUMENTNAME_PHOTO, '', TRESTRequestParameterKind.pkREQUESTBODY);
    vUploadRESTRequest.AddParameter('description', MyEncodeAsUTF8('simpledescription'), TRESTRequestParameterKind.pkGETorPOST);
//    vUploadRESTRequest.AddParameter('title', 'upload test', TRESTRequestParameterKind.pkGETorPOST);
  //    vUploadRESTRequest.AddParameter('tags', '"cmbined tag" aaaa bbbbb', TRESTRequestParameterKind.pkGETorPOST);
  //    vUploadRESTRequest.AddParameter('is_public', '1', TRESTRequestParameterKind.pkGETorPOST);
  //    vUploadRESTRequest.AddParameter('is_friend', '1', TRESTRequestParameterKind.pkGETorPOST);
  //    vUploadRESTRequest.AddParameter('is_family', '1', TRESTRequestParameterKind.pkGETorPOST);
  //    vUploadRESTRequest.AddParameter('safety_level', '1', TRESTRequestParameterKind.pkGETorPOST);
  //    vUploadRESTRequest.AddParameter('content_type', '1', TRESTRequestParameterKind.pkGETorPOST);
  //    vUploadRESTRequest.AddParameter('hidden', '1', TRESTRequestParameterKind.pkGETorPOST);
    vUploadRESTRequest.AddParameter(ARGUMENTNAME_PHOTO, edtPlaceholderImageLocation.Text, TRESTRequestParameterKind.pkREQUESTBODY);

    vUploadRESTRequest.Method := TRESTRequestMethod.rmPOST;
    vUploadRESTRequest.Execute;
    {$WARN IMPLICIT_STRING_CAST OFF}
    memPhotoRequestBody.Lines.Text := vUploadRESTRequest.FRequestBody;
    {$WARN IMPLICIT_STRING_CAST ON}

  finally
    FreeAndNil(vUploadRESTRequest);
  end;

//photo
//    The file to upload.
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

end;

procedure TFoldersToFlickrSyncrForm.actUploadingPhotosIndyBasedExecute(Sender: TObject);
var
  vResponseText, vUploadedPhotoID, vTicketID: String;
begin

  if PostPhotoToFlickr(
    edtPlaceholderImageLocation.Text,
    '', //  const aPhoto_id: string = ''; // id non empty - it is replacing command
    edtUploadPhotoDescription.Text,
    edtUploadPhotoTitle.Text,
    edtUploadPhotoTags.Text,
    '0', //  const aIs_public: Boolean= False;
    '0', //  const aIs_friend: Boolean= False;
    '0', //  const aIs_family: Boolean= True;
    False, //  const aSyncMode: Boolean= False);
    vResponseText, vUploadedPhotoID, vTicketID) then
  begin
    if vTicketID <> '' then
    begin
    //
    end else
    if vUploadedPhotoID <> '' then
    begin
    //
    end;
  end else begin
    ShowMessageDlg('UploadingPhotosIndyBased - failed', mtError, [mbOK]);
  end;

  memPhotoResponse.Text := vResponseText;

end;

procedure TFoldersToFlickrSyncrForm.actUploadingPhotosIndyBasedUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := IsFlickrAccessible;
end;

procedure TFoldersToFlickrSyncrForm.actUploadingPhotosUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := IsFlickrAccessible;
end;

procedure TFoldersToFlickrSyncrForm.AddNewThreads(const aActiveList: TList);
var
  vCollectFileDataThread: TCollectFileDataThread;
begin
  if FReadyToProcess and (FPhotoListsToProcess.Count > 0) and
     (aActiveList.Count < ProcessThreadsMaxCount) then
  begin

    repeat

      vCollectFileDataThread := CreateProcessThread;
      if Assigned(vCollectFileDataThread) then
      begin
        aActiveList.Add(vCollectFileDataThread);
        edtThreadsActive.Text := IntToStr(aActiveList.Count);
        vCollectFileDataThread.LocalFolderToProcess := FPhotoListsToProcess[0];
        vCollectFileDataThread.NameThreadForDebugging(FPhotoListsToProcess[0].AlbumName, vCollectFileDataThread.ThreadID);
        FPhotoListsToProcess.Delete(0);
        if vCollectFileDataThread.Suspended then
          vCollectFileDataThread.Start;
      end;

    until not Assigned(vCollectFileDataThread) or (FPhotoListsToProcess.Count = 0) or (aActiveList.Count >= ProcessThreadsMaxCount);

  end;
end;

procedure TFoldersToFlickrSyncrForm.ApplicationIniFileRead(const aUserName: string);
var
  vIniFile: TIniFileUnicode;
  vSection: string;

  function _ReadLabeledEdit(const aComponent: TLabeledEdit): string;
  begin
    Result := vIniFile.ReadString(vSection, aComponent.Name, aComponent.Text);
  end;

  function _ReadEdit(const aComponent: TEdit): string;
  begin
    Result := vIniFile.ReadString(vSection, aComponent.Name, aComponent.Text);
  end;

  function _ReadCheckBox(const aComponent: TCheckBox): boolean;
  begin
    Result := vIniFile.ReadBool(vSection, aComponent.Name, aComponent.Checked);
  end;

  function _ReadRadioButton(const aComponent: TRadioButton): boolean;
  begin
    Result := vIniFile.ReadBool(vSection, aComponent.Name, aComponent.Checked);
  end;

  procedure _ReadRadioGroup(const aComponent: TRadioGroup);
  var
    i: integer;
  begin
    i := vIniFile.ReadInteger(vSection, aComponent.Name, aComponent.ItemIndex);
    if (i >= 0) and (i < aComponent.Items.Count) then
      aComponent.ItemIndex := i;
    if Assigned(aComponent.OnClick) then
      aComponent.OnClick(aComponent);
  end;

  procedure _ReadList(const aComponentName: string; const aList: TStrings);
  var
    vList: TStringList;
    i: integer;
  begin
    vList := TStringList.Create;
    try

      aList.Clear;
      vIniFile.ReadSectionValues(aComponentName, vList);

      for i := 0 to vList.Count - 1 do begin
        if aList.IndexOf(vList.ValueFromIndex[i]) = -1 then
          aList.Add(vList.ValueFromIndex[i]);
      end;

    finally
      vList.Free;
    end;

  end;

var
  i, vHeight, vWidth, vLeft, vTop, vMonitorNo: integer;
  vMonitor: TMonitor;
  s, vLastUserID: string;
  vUserIDList: TStringList;
begin

  vIniFile := TIniFileUnicode.Create(ApplicationIniFile, fReadIni);
  try

    // do not need to load anything for new user
    if aUserName = AUTHORIZENEWUSER_ITEM then
      Exit;

    if aUserName = '' then
    begin
      vSection := '';

      vUserIDList := TStringList.Create;
      try

        _ReadList(UserIDSection + '_List', vUserIDList);

        for s in vUserIDList do begin
          FUserIDCollection.AddOrSetValue(s,
            vIniFile.ReadString(s, 'UserFullName', edtUserFullName.Text) + ' <' +
            vIniFile.ReadString(s, 'UserName', edtUserName.Text) + '>');
        end;

      finally
        vUserIDList.Free;
      end;

      vLastUserID := vIniFile.ReadString(UserIDSection, 'LastUserID', '');

      if (vLastUserID = '') and (FUserIDCollection.Count = 0) then
        Exit
      else if FUserIDCollection.Count = 1 then
        vSection := FUserIDCollection.Keys.ToArray[0]
      else begin
        if (FUserIDCollection.Count > 1) and not FUserIDCollection.ContainsKey(vLastUserID) then
          vSection := SelectUser(Self, FUserIDCollection, vLastUserID, False)
        else
          vSection := vLastUserID;
      end;
    end else
      vSection := aUserName;

    Assert(vSection <> '');

    i := vIniFile.ReadInteger(vSection, pcPages.Name, pcPages.ActivePageIndex);
    if (i = -1) or (i >= pcPages.PageCount) or not pcPages.Pages[i].TabVisible then
      i := 0;
    pcPages.ActivePageIndex := i;

    vHeight := vIniFile.ReadInteger(vSection, 'Height', Height);
    vWidth := vIniFile.ReadInteger(vSection, 'Width', Width);
    vLeft := vIniFile.ReadInteger(vSection, 'Left', (Monitor.Left + Monitor.Width - vWidth) div 2);
    vTop := vIniFile.ReadInteger(vSection, 'Top', (Monitor.Top + Monitor.Height - vHeight) div 2);
    vMonitorNo := vIniFile.ReadInteger(vSection, 'MonitorNo', Monitor.MonitorNum);

    if (vMonitorNo < 0) or (vMonitorNo > Screen.MonitorCount) then
    begin
      vMonitorNo := 0;
      while vMonitorNo < Screen.MonitorCount do begin
        if Screen.Monitors[vMonitorNo].Primary then
          Break;
      end;
    end;

    vMonitor := Screen.Monitors[vMonitorNo];

    if vLeft < vMonitor.Left then
      vLeft := vMonitor.Left;
    if vLeft > vMonitor.Left + vMonitor.Width - vWidth then
      vLeft := vMonitor.Left + vMonitor.Width - vWidth;
    if vTop < vMonitor.Top then
      vTop := vMonitor.Top;
    if vTop > vMonitor.Top + vMonitor.Height - vHeight then
      vTop := vMonitor.Top + vMonitor.Height - vHeight;

    Self.SetBounds(vLeft, vTop, vWidth, vHeight);

    VerifierPIN := _ReadLabeledEdit(edtVerifierPIN);
    RequestToken := _ReadLabeledEdit(edtRequestToken);
    RequestTokenSecret := _ReadLabeledEdit(edtRequestTokenSecret);
    AccessToken := _ReadLabeledEdit(edtAccessToken);
    AccessTokenSecret := _ReadLabeledEdit(edtAccessTokenSecret);
    grbPhotoResponse.Height := vIniFile.ReadInteger(vSection, grbPhotoResponse.Name, grbPhotoResponse.Height);
//    pnlTopFolders.Width := vIniFile.ReadInteger(vSection, pnlTopFolders.Name, pnlTopFolders.Width);
//    pnlFlickrAlbums.Width := vIniFile.ReadInteger(vSection, pnlFlickrAlbums.Name, pnlFlickrAlbums.Width);
    grbAlbumsfromFolders.Height := vIniFile.ReadInteger(vSection, grbAlbumsfromFolders.Name, grbAlbumsfromFolders.Height);
    edtPicasaContacts.Text := _ReadLabeledEdit(edtPicasaContacts);
    FPlaceholderPhotoID := vIniFile.ReadString(vSection, 'PlaceholderPhotoID', '');
    edtSaveResizedPhotosFolder.Text := _ReadEdit(edtSaveResizedPhotosFolder);

    edtPeopleAlbumName.Text := _ReadEdit(edtPeopleAlbumName);
    chkPicasaPeopleToAlbum.Checked := _ReadCheckBox(chkPicasaPeopleToAlbum);

    chkResize.Checked := _ReadCheckBox(chkResize);
    chkPicasaContactsFamily.Checked := _ReadCheckBox(chkPicasaContactsFamily);
    chkPicasaContactsFriends.Checked := _ReadCheckBox(chkPicasaContactsFriends);
    chkPicasaNoContactsFamily.Checked := _ReadCheckBox(chkPicasaContactsFamily);
    chkPicasaNoContactsFriends.Checked := _ReadCheckBox(chkPicasaContactsFriends);
    chkProcessDoNotDeleteUnknownAlbums.Checked := _ReadCheckBox(chkProcessDoNotDeleteUnknownAlbums);
    chkDoNotUnlinkUnknownPhotosFromAlbum.Checked := _ReadCheckBox(chkDoNotUnlinkUnknownPhotosFromAlbum);
    chkWhoCanSeeFamily.Checked := _ReadCheckBox(chkWhoCanSeeFamily);
    chkWhoCanSeeFriends.Checked := _ReadCheckBox(chkWhoCanSeeFriends);
    chkResumeFromIncompletedFolders.Checked := _ReadCheckBox(chkResumeFromIncompletedFolders);
    chkIgnoreArchivedFlag.Checked := _ReadCheckBox(chkIgnoreArchivedFlag);
    chkSetImageDescription.Checked := _ReadCheckBox(chkSetImageDescription);
    chkApplyPermissionsChanges.Checked := _ReadCheckBox(chkApplyPermissionsChanges);
    chkEnforceSyncrIniPermissions.Checked := _ReadCheckBox(chkEnforceSyncrIniPermissions);
    chkSaveResizedPhotosFolder.Checked := _ReadCheckBox(chkSaveResizedPhotosFolder);

    edtThreadsToRun.Value := vIniFile.ReadInteger(vSection, edtThreadsToRun.Name, edtThreadsToRun.Value);

    _ReadRadioGroup(rgpPriorityTitle);
    _ReadRadioGroup(rgpPriorityPermissions);
    _ReadRadioGroup(rgpPermissionsForPhotosWithFaces);
    _ReadRadioGroup(rgpPermissionsForPhotosWithOutFaces);
    _ReadRadioGroup(rgpWhoCanSee);
    _ReadRadioGroup(rgpWhoCanComment);
    _ReadRadioGroup(rgpWhoCanAddMeta);
    _ReadRadioGroup(rgpChooseSafetyFilter);
    _ReadRadioGroup(rgpChooseSearchSetting);
    _ReadRadioGroup(rgpHandleFoldersOrder);
    _ReadRadioGroup(rgpFlickrAlbumsSortOrder);

    edtResizeWidth.Text := _ReadLabeledEdit(edtResizeWidth);
    edtResizeHeight.Text := _ReadLabeledEdit(edtResizeHeight);
    edtResizeFileSize.Text := _ReadLabeledEdit(edtResizeFileSize);
    edtResizeJpgQuality.Text := _ReadEdit(edtResizeJpgQuality);
    edtPlaceholderImageLocation.Text := vIniFile.ReadString(vSection, edtPlaceholderImageLocation.Name, 'placeholderimage.jpg');

    _ReadList(vSection + '_' + lstTopFoldersToSyncronize.Name, lstTopFoldersToSyncronize.Items);
    _ReadList(vSection + '_' + memExcludeFiles.Name, memExcludeFiles.Lines);
    _ReadList(vSection + '_' + memIncludeFiles.Name, memIncludeFiles.Lines);
    FIncompletedFolders.Clear;
    if chkResumeFromIncompletedFolders.Checked then
      _ReadList(vSection + '_IncompletedAlbums', FIncompletedFolders)
    else
      vIniFile.EraseSection(vSection + '_IncompletedAlbums');

  finally
    vIniFile.Free;
  end;

end;

procedure TFoldersToFlickrSyncrForm.ApplicationIniFileWrite;
var
  vIniFile: TIniFileUnicode;
  vSection: string;

  function _WriteLabeledEdit(const aComponent: TLabeledEdit): string;
  begin
    vIniFile.WriteString(vSection, aComponent.Name, aComponent.Text);
  end;

  function _WriteEdit(const aComponent: TEdit): string;
  begin
    vIniFile.WriteString(vSection, aComponent.Name, aComponent.Text);
  end;

  function _WriteCheckBox(const aComponent: TCheckBox): string;
  begin
    vIniFile.WriteBool(vSection, aComponent.Name, aComponent.Checked);
  end;

  function _WriteRadioButton(const aComponent: TRadioButton): string;
  begin
    vIniFile.WriteBool(vSection, aComponent.Name, aComponent.Checked);
  end;

  function _WriteRadioGroup(const aComponent: TRadioGroup): string;
  begin
    vIniFile.WriteInteger(vSection, aComponent.Name, aComponent.ItemIndex);
  end;

  procedure _WriteList(const aComponentName: string; const aList: TStrings);
  var
    i: integer;
    vLst: TStringList;
  begin
    vLst := TStringList.Create;
    try
      vIniFile.EraseSection(aComponentName);
      vLst.AddStrings(aList);
      for i := 0 to vLst.Count - 1 do
        vIniFile.WriteString(aComponentName, i.ToString, vLst[i]);
    finally
      vLst.Free;
    end;
  end;

  procedure _WriteArray(const aComponentName: string; const aList: TArray<String>; const aSort: Boolean);
  var
    i: integer;
    vLst: TStringList;
  begin
    vLst := TStringList.Create;
    try
      vLst.AddStrings(aList);
      if aSort then
        vLst.Sort;
      vIniFile.EraseSection(aComponentName);
      for i := 0 to vLst.Count - 1 do
        vIniFile.WriteString(aComponentName, i.ToString, vLst[i]);

    finally
      vLst.Free;
    end;
  end;

begin

  vSection := edtUserID.Text;
  if vSection = '' then
    Exit;

  vIniFile := TIniFileUnicode.Create(ApplicationIniFile, fWriteIni);
  try

    _WriteArray(UserIDSection + '_List', FUserIDCollection.Keys.ToArray, True);
    vIniFile.WriteString(UserIDSection, 'LastUserID', edtUserID.Text);

    vIniFile.WriteString(vSection, 'UserName', edtUserName.Text);
    vIniFile.WriteString(vSection, 'UserFullName', edtUserFullName.Text);

    vIniFile.WriteInteger(vSection, 'Left', Left);
    vIniFile.WriteInteger(vSection, 'Top', Top);
    vIniFile.WriteInteger(vSection, 'Height', Height);
    vIniFile.WriteInteger(vSection, 'Width', Width);
    vIniFile.WriteInteger(vSection, 'MonitorNo', Monitor.MonitorNum);
    vIniFile.WriteInteger(vSection, pcPages.Name, pcPages.ActivePageIndex);
    vIniFile.WriteInteger(vSection, grbPhotoResponse.Name, grbPhotoResponse.Height);
//    vIniFile.WriteInteger(vSection, pnlTopFolders.Name, pnlTopFolders.Width);
//    vIniFile.WriteInteger(vSection, pnlFlickrAlbums.Name, pnlFlickrAlbums.Width);
    vIniFile.WriteInteger(vSection, grbAlbumsfromFolders.Name, grbAlbumsfromFolders.Height);

    _WriteLabeledEdit(edtVerifierPIN);
    _WriteLabeledEdit(edtRequestToken);
    _WriteLabeledEdit(edtRequestTokenSecret);
    _WriteLabeledEdit(edtAccessToken);
    _WriteLabeledEdit(edtAccessTokenSecret);
    _WriteLabeledEdit(edtPicasaContacts);
    _WriteEdit(edtSaveResizedPhotosFolder);
    vIniFile.WriteString(vSection, 'PlaceholderPhotoID', FPlaceholderPhotoID);

    _WriteEdit(edtPeopleAlbumName);
    _WriteCheckBox(chkPicasaPeopleToAlbum);

    _WriteCheckBox(chkResize);
    _WriteCheckBox(chkPicasaContactsFamily);
    _WriteCheckBox(chkPicasaContactsFriends);
    _WriteCheckBox(chkPicasaNoContactsFamily);
    _WriteCheckBox(chkPicasaNoContactsFriends);
    _WriteCheckBox(chkProcessDoNotDeleteUnknownAlbums);
    _WriteCheckBox(chkDoNotUnlinkUnknownPhotosFromAlbum);
    _WriteCheckBox(chkWhoCanSeeFamily);
    _WriteCheckBox(chkWhoCanSeeFriends);
    _WriteCheckBox(chkResumeFromIncompletedFolders);
    _WriteCheckBox(chkIgnoreArchivedFlag);
    _WriteCheckBox(chkSetImageDescription);
    _WriteCheckBox(chkApplyPermissionsChanges);
    _WriteCheckBox(chkEnforceSyncrIniPermissions);
    _WriteCheckBox(chkSaveResizedPhotosFolder);

    vIniFile.WriteInteger(vSection, edtThreadsToRun.Name, edtThreadsToRun.Value);

    _WriteRadioGroup(rgpPriorityTitle);
    _WriteRadioGroup(rgpPriorityPermissions);
    _WriteRadioGroup(rgpPermissionsForPhotosWithFaces);
    _WriteRadioGroup(rgpPermissionsForPhotosWithOutFaces);
    _WriteRadioGroup(rgpWhoCanSee);
    _WriteRadioGroup(rgpWhoCanComment);
    _WriteRadioGroup(rgpWhoCanAddMeta);
    _WriteRadioGroup(rgpChooseSafetyFilter);
    _WriteRadioGroup(rgpChooseSearchSetting);
    _WriteRadioGroup(rgpHandleFoldersOrder);
    _WriteRadioGroup(rgpFlickrAlbumsSortOrder);

    _WriteLabeledEdit(edtResizeWidth);
    _WriteLabeledEdit(edtResizeHeight);
    _WriteLabeledEdit(edtResizeFileSize);
    _WriteEdit(edtResizeJpgQuality);
    _WriteLabeledEdit(edtPlaceholderImageLocation);

    _WriteList(vSection + '_' + lstTopFoldersToSyncronize.Name, lstTopFoldersToSyncronize.Items);
    _WriteList(vSection + '_' + memExcludeFiles.Name, memExcludeFiles.Lines);
    _WriteList(vSection + '_' + memIncludeFiles.Name, memIncludeFiles.Lines);
    if chkResumeFromIncompletedFolders.Checked and (FIncompletedFolders.Count > 0) then
      _WriteList(vSection + '_IncompletedAlbums', FIncompletedFolders)
    else
      vIniFile.EraseSection(vSection + '_IncompletedAlbums');

  finally
    vIniFile.Free;
  end;

  SortApplicationIniFile;

end;

procedure TFoldersToFlickrSyncrForm.AssignDefaultPopupMenu(const aComponent: TComponent);
var
  vComponent: TComponent;
  i: integer;
begin
  for i := 0 to aComponent.ComponentCount -1 do begin
    vComponent := aComponent.Components[i];
    if (vComponent is TMemo) and not Assigned((vComponent as TMemo).PopupMenu) then
      (vComponent as TMemo).PopupMenu := mnuPopup;
    if (vComponent is TListBox) and not Assigned((vComponent as TListBox).PopupMenu) then
      (vComponent as TListBox).PopupMenu := mnuPopup;
    if (vComponent is TCheckListBox) and not Assigned((vComponent as TCheckListBox).PopupMenu) then
      (vComponent as TCheckListBox).PopupMenu := mnuPopup;
    if (vComponent is TTreeView) and not Assigned((vComponent as TTreeView).PopupMenu) then
      (vComponent as TTreeView).PopupMenu := mnuPopup;
    if vComponent.ComponentCount > 0 then
      AssignDefaultPopupMenu(vComponent);
  end;
end;

procedure TFoldersToFlickrSyncrForm.BuildTreeStructure;
var
  vWorkFolder: TLocalFolder;
  vTreeNode: TTreeNode;
begin

  for vTreeNode in trvFolderStructure.Items do begin
    vTreeNode.Free;
  end;

  trvFolderStructure.Items.Clear;

  if FWorkLoad.PhotosCount > 0 then
  begin

    vTreeNode := trvFolderStructure.Items.Add(nil, 'All Albums (' + FWorkLoad.PhotosCount.ToString + ')');
    // folders for syncronization top folder
    for vWorkFolder in FWorkLoad.WorkCollection.ToArray do begin
      trvFolderStructure.Items.AddChild(vTreeNode, vWorkFolder.AlbumName + ' (' + IntToStr(vWorkFolder.LocalPhotos.Count)+')').Expand(False);
    end;

    // expand all top nodes
    vTreeNode.Expand(True);

  end;

end;

procedure TFoldersToFlickrSyncrForm.CleanActiveThreads;
var
  vList: TList;
  i: Integer;
  v: TCollectFileDataThread;
begin
  if Assigned(FPhotoListsToProcess) and Assigned(FActiveCollectFileDataThreads) then
  begin

    if FCancelSyncronization then
    begin
      FIncompletedFolders.Clear;
      if (FPhotoListsToProcess.Count > 0) then
      begin
        for i := 0 to FPhotoListsToProcess.Count - 1 do begin
          if not FPhotoListsToProcess[i].IsUploadCompleteForAllPhotos and (FPhotoListsToProcess[i].ProcessedPhotosCount > 0)  then
          begin
            FIncompletedFolders.Add(FPhotoListsToProcess[i].SourceFolderFullName);
          end;
        end;
      end;
    end;

    FPhotoListsToProcess.Clear;

    if Assigned(FActiveCollectFileDataThreads) then begin
      vList := FActiveCollectFileDataThreads.LockList;
      try

        for i := 0 to vList.Count - 1 do begin
          if FCancelSyncronization and (TThread(vList.Items[i]) is TCollectFileDataThread) then
          begin
            v := TCollectFileDataThread(vList.Items[i]);
            FIncompletedFolders.Add(v.LocalFolderToProcess.SourceFolderFullName);
          end;
          TThread(vList.Items[i]).Terminate;
        end;

      finally
        FActiveCollectFileDataThreads.UnlockList;
      end;

    end;

  end;
end;

procedure TFoldersToFlickrSyncrForm.CreateCleanUpThread;
var
  vCleanUpThread: TCleanUpThread;
begin
  vCleanUpThread := TCleanUpThread.Create(True);
  vCleanUpThread.FreeOnTerminate := True;
  vCleanUpThread.Priority := tpLower;
  vCleanUpThread.OnTerminate := HandleCleanUpThreadTerminate;
  vCleanUpThread.Start;
end;

function TFoldersToFlickrSyncrForm.CreateProcessThread: TCollectFileDataThread;
var
  i, l: integer;
begin
  Result := TCollectFileDataThread.Create(True);
  Result.FreeOnTerminate := False;
  Result.OnTerminate := LocalPhotoFile_ProcessThreadTerminate;
  l := 0;
  for i := 0 to Length(ThreadsList) do begin
    if ThreadsList[i] = 0 then
    begin
      if not FPhotoListsToProcess[0].ArchivedFolder then
      begin
        ThreadsList[i] := Result.ThreadID;
        grdThreadsData.Cells[0, l + 1] := IntToStr(Result.ThreadID);
        grdThreadsData.Cells[1, l + 1] := FPhotoListsToProcess[0].AlbumName;
        grdThreadsData.Cells[2, l + 1] := '';
        grdThreadsData.Cells[3, l + 1] := '';
        grdThreadsData.Cells[4, l + 1] := IntToStr(FPhotoListsToProcess[0].LocalPhotos.Count);
        grdThreadsData.Cells[5, l + 1] := '0';
        Break;
      end;
    end else
      Inc(l);
  end;
end;

function TFoldersToFlickrSyncrForm.DoFilterDirectories(
  const aPath: string;
  const aSearchRec: TSearchRec): Boolean;
var
  s, vLog: string;
begin
  Result := (aSearchRec.Name[1] <> '.');
  vLog := '';

  // include by pattern
  if Result then
  begin
    for s in FIncludeFolders do begin
      if s <> '' then
      begin
        Result := TRegEx.Create(s, [roIgnoreCase]).Match(aSearchRec.Name).Success;
        if Result then
        begin
          vLog := Format('Folder "%s" Included by pattern "%s"', [aSearchRec.Name, s]);
          Break;
        end;
      end;
    end;
  end;

  // exclude by pattern
  if Result then
  begin
    for s in FExcludeFolders do begin
      if s <> '' then
      begin
        Result := not TRegEx.Create(s, [roIgnoreCase]).Match(aSearchRec.Name).Success;
        if not Result then
        begin
          vLog := Format('Folder "%s" Excluded by pattern "%s"', [aSearchRec.Name, s]);
          Break;
        end;
      end;
    end;
  end;

  if vLog <> '' then
    LogActionRecord(vLog);

end;

function TFoldersToFlickrSyncrForm.DoFilterFiles(
  const aPath: string;
  const aSearchRec: TSearchRec): Boolean;
begin
  // ignore thumbnails
  Result :=
    not StartsStr('x0x0', aSearchRec.Name);
end;

procedure TFoldersToFlickrSyncrForm.edtPicasaContactsChange(Sender: TObject);
var
  vPair: TPair<string,string>;
  vTreeNode: TTreeNode;
begin

  gPicasaSettings.LoadPicasaContacts(edtPicasaContacts.Text);

//  lstPicasaContacts.Items.AddStrings(gPicasaSettings.Contacts.Values.ToArray);

  for vTreeNode in trvPicasaContacts.Items do begin
    vTreeNode.Free;
  end;

  trvPicasaContacts.Items.Clear;

  for vPair in gPicasaSettings.Contacts do begin
    vTreeNode := trvPicasaContacts.Items.Add(nil, vPair.Value);
    trvPicasaContacts.Items.AddChild(vTreeNode, vPair.Key);
  end;

  trvPicasaContacts.AlphaSort;

  //lstPicasaContacts.Items.Count
  grbPicasaContacts.Caption := Format(' Picasa Contacts (%d contacts) ', [gPicasaSettings.Contacts.Count]);

  chbIncludeContacts.Items.AddStrings(gPicasaSettings.Contacts.Keys.ToArray);
  chbExcludeContacts.Items.AddStrings(gPicasaSettings.Contacts.Values.ToArray);

//  chbIncludeContacts.Items.AddStrings(lstPicasaContacts.Items);
//  chbExcludeContacts.Items.AddStrings(lstPicasaContacts.Items);

end;

procedure TFoldersToFlickrSyncrForm.edtThreadsToRunChange(Sender: TObject);
begin
  ProcessThreadsMaxCount := edtThreadsToRun.Value;
end;

function TFoldersToFlickrSyncrForm.ExecuteAPIMethod(const aAPIMethod: string): boolean;
var
  vXML: ibvXMLAccess;
begin
  ResetRESTComponentsToDefaults;

  RESTClient.BaseURL := FlickrRESTEndpointURL;
  RESTClient.Authenticator := OAuthAuthenticator;

  RESTRequest.Resource := '';
  RESTRequest.Params.AddItem('method', aAPIMethod, TRESTRequestParameterKind.pkGETorPOST);
  RESTRequest.Params.AddItem('oauth_consumer_key', ConsumerKey, TRESTRequestParameterKind.pkGETorPOST);
  RESTRequest.Params.AddItem('format', 'rest', TRESTRequestParameterKind.pkGETorPOST);
  edtLastApiCallMethodName.text := aAPIMethod;
  RESTRequest.Method := TRESTRequestMethod.rmPOST;
  RESTRequest.Execute;
  vXML := TbvXMLAccess.Create(RESTResponse.Content);
  Result := SameText(vXML.Attribute['rsp.stat'], rspOK);

//   from http://www.wackylabs.net/2011/12/oauth-and-flickr-part-1/
// oauth_consumer_key: This is your API Key
// consumer secret: This is your Shared Secret
// oauth_token
// oauth_token_secret
// oauth_timestamp: This is the number of seconds since 1/1/1970, sometimes called the unix epoch.
//   Note, this time should always be calculated using GMT (or UTC) times, not local times.
//   If your timestamp is not a current time (i.e. is more than an hour out) then Flickr will reject your call to the Flickr API.
// oauth_nonce: A random series of characters unique to this call to Flickr
//   If you have two users using the same web page that both make calls to Flickr at the same time then the timestamp will be the same,
//   but the oauth_nonce must be different.
// oauth_callback: The callback URL in the Flickr API Keys settings is now ignored
// oauth_version: The version is always '1.0'
// oauth_signature_method: The signature method for Flickr is always HMAC-SHA1.

end;

function TFoldersToFlickrSyncrForm.ExecuteAPIMethod(const aAPIMethod: IFlickrAPIMethod): boolean;
var
  vXML: ibvXMLAccess;
begin
  Result := ExecuteAPIMethod(aAPIMethod, vXML);
end;

function TFoldersToFlickrSyncrForm.ExecuteAPIMethod(const aAPIMethod: IFlickrAPIMethod; out aXML: ibvXMLAccess): boolean;
var
  i: integer;
  vArgument: TFlickrAPIArgument;
begin
  LogActionMessage(memFlickrLog.Lines, aAPIMethod.Method_WithArguments, False);

  ResetRESTComponentsToDefaults;

  Result := False;

  RESTClient.BaseURL := FlickrRESTEndpointURL;
  RESTClient.Authenticator := OAuthAuthenticator;

  RESTRequest.Resource := '';
  RESTRequest.Params.AddItem('method', aAPIMethod.Method_Name, TRESTRequestParameterKind.pkGETorPOST);
  edtLastApiCallMethodName.text := aAPIMethod.Method_Name;
  RESTRequest.Params.AddItem('format', 'rest', TRESTRequestParameterKind.pkGETorPOST);

  for i := 0 to aAPIMethod.ArgumentsCount - 1 do begin
    vArgument := aAPIMethod.Arguments[i];
    if SameText(vArgument.Name, ARGUMENTNAME_API_KEY) then
    begin
      if not vArgument.Optional then
        RESTRequest.Params.AddItem('oauth_consumer_key', ConsumerKey, TRESTRequestParameterKind.pkGETorPOST);
    end else
    if vArgument.Value <> '' then
    begin
      RESTRequest.Params.AddItem(vArgument.Name, MyEncodeAsUTF8(vArgument.Value), TRESTRequestParameterKind.pkGETorPOST);
    end else if not vArgument.Optional then
      ShowMessageDlg(Format('%s - required argument "%s" is empty!', [aAPIMethod.Method_Name, vArgument.Name]), mtError, [mbOK]);
  end;

  RESTRequest.Method := TRESTRequestMethod.rmPOST;
  try

    RESTRequest.Execute;

  except
    on E: Exception do
    begin
      memResponseErrorMessage.Text := e.ClassName + ': ' + e.Message;
      raise;
    end;
  end;

  try

    if ContainsText(RESTResponse.Content, '<?xml version=') then
    begin
      aXML := TbvXMLAccess.Create(RESTResponse.Content);
      Result := SameText(aXML.Attribute['rsp.stat'], rspOK);
    end else
      Result := False;

  except
    on E: Exception do
      memResponseErrorMessage.Text := e.ClassName + ': ' + e.Message;
  end;

  TInterlocked.Increment(gFlickrApiCallsCount);

end;

procedure TFoldersToFlickrSyncrForm.FormActivate(Sender: TObject);
begin
  if not FMainFormActivated then
  begin

    gMainFormHandle := Self.Handle;

    ConsumerKey := ApplicationConsumerKey;
    ConsumerSecret := ApplicationConsumerSecret;

    ActivateApplicationForUser('');

    FMainFormActivated := True;
  end;

end;

procedure TFoldersToFlickrSyncrForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FCancelSyncronization := False;

  CleanActiveThreads;

  SetLength(ThreadsList, 0);
  if Assigned(FWorkCollectionsFromFolders) then
    FWorkCollectionsFromFolders.Clear;

  ApplicationIniFileWrite;

end;

procedure TFoldersToFlickrSyncrForm.FormCreate(Sender: TObject);
begin

  FMainFormActivated := False;

  FIncompletedFolders := TStringList.Create;
  FIncompletedFolders.Sorted := True;
  FIncompletedFolders.Duplicates := dupIgnore;
  FIncompletedFolders.CaseSensitive := False;
  FExcludeFolders := TListString.Create;
  FIncludeFolders := TListString.Create;
  FWorkLoad := TLocalWorkLoad.Create;
  FWorkCollectionsFromFolders := TListString.Create;
  FPhotoListsToProcess := TLocalFolderList.Create;
  FUserIDCollection := TDictionaryStrings.Create;
  FActiveCollectFileDataThreads := TThreadList.Create;
  FActiveCollectFileDataThreads.Duplicates := dupAccept;

  FAvailableCollectFileDataThreads := TThreadList.Create;
  FAvailableCollectFileDataThreads.Duplicates := dupAccept;

  lblFoldersWithAlbums.Caption := '';
  lblAlbumsonFlickrBottom.Caption := '';

  //tbsDevelopment.TabVisible := False;

  edtRESTEndpointURL.Text := FlickrRESTEndpointURL;
  edtUploadingPhotosURL.Text := FlickrUploadingPhotosURL;
  edtReplacingPhotosURL.Text := FlickrReplacingPhotosURL;

  grdThreadsData.ColCount := 6;

  grdThreadsData.ColWidths[0] := 62 * Self.Monitor.PixelsPerInch div 96;
  grdThreadsData.ColWidths[2] := 160 * Self.Monitor.PixelsPerInch div 96;
  grdThreadsData.ColWidths[3] := 42 * Self.Monitor.PixelsPerInch div 96;
  grdThreadsData.ColWidths[4] := 42 * Self.Monitor.PixelsPerInch div 96;
  grdThreadsData.ColWidths[5] := 40 * Self.Monitor.PixelsPerInch div 96;
  grdThreadsData.ColWidths[1] := Max(100, grdThreadsData.ClientWidth -
    grdThreadsData.ColWidths[0] - grdThreadsData.ColWidths[2] - grdThreadsData.ColWidths[3] -
  grdThreadsData.ColWidths[4] - grdThreadsData.ColWidths[5]- GetSystemMetrics(SM_CXVSCROLL));

  grdThreadsData.Cells[0, 0] := 'Thread ID';
  grdThreadsData.Cells[1, 0] := 'Album';
  grdThreadsData.Cells[2, 0] := 'Photo';
  grdThreadsData.Cells[3, 0] := 'No';
  grdThreadsData.Cells[4, 0] := 'Total';
  grdThreadsData.Cells[5, 0] := '%';

  Randomize;

  AssignDefaultPopupMenu(Self);

  actPrepareFolderStructure.Hint := 'Scan ' + Trim(grbTopFoldersToSyncronize.Caption);

end;

procedure TFoldersToFlickrSyncrForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FWorkLoad);
  FreeAndNil(FExcludeFolders);
  FreeAndNil(FIncludeFolders);
  FreeAndNil(FWorkCollectionsFromFolders);
  FreeAndNil(FPhotoListsToProcess);
  FreeAndNil(FUserIDCollection);
  FreeAndNil(FActiveCollectFileDataThreads);
  FreeAndNil(FAvailableCollectFileDataThreads);
  FreeAndNil(FIncompletedFolders);
end;

function TFoldersToFlickrSyncrForm.GetAccessToken: string;
begin
  Result := MyAccessToken;
end;

function TFoldersToFlickrSyncrForm.GetAccessTokenSecret: string;
begin
  Result := MyAccessTokenSecret;
end;

function TFoldersToFlickrSyncrForm.GetApplicationIniFile: string;
//var
//  vExactName: String;
begin
  if FApplicationIniFile = '' then
  begin
    FApplicationIniFile := ChangeFileExt(Application.ExeName, '.ini');

//    if not FileExists(FApplicationIniFile) then
//    begin
//      vExactName := FApplicationIniFile;
//      FApplicationIniFile := ReplaceText(
//        ReplaceText(
//        ReplaceText(
//        ReplaceText(FApplicationIniFile, '\Win32\', '\'),
//          '\Win64\', '\'), '\Debug\', '\'), '\Release\', '\');
//      if not FileExists(FApplicationIniFile) then
//        FApplicationIniFile := vExactName;
//    end;
  end;

  Result := FApplicationIniFile;
end;

function TFoldersToFlickrSyncrForm.GetConsumerKey: string;
begin
  Result := ApplicationConsumerKey;
end;

function TFoldersToFlickrSyncrForm.GetConsumerSecret: string;
begin
  Result := ApplicationConsumerSecret;
end;

function TFoldersToFlickrSyncrForm.GetCorrectedThreadsCount(const aRequestedThreadCount: integer): Integer;
begin
  if aRequestedThreadCount <= 0 then
  begin
    Result := Max(12, System.CPUCount * 5);
    if Length(ThreadsList) < Result then
    begin
      SetLength(ThreadsList, Result);
      grdThreadsData.RowCount := Result + 1;
    end;
    edtThreadsToRun.Value := Result;
  end else
    Result := aRequestedThreadCount;
end;

procedure TFoldersToFlickrSyncrForm.GetCredentialsforAccessToken(const aUserName: string);
var
  vXML: IbvXMLAccess;
begin

  if AccessToken <> '' then
  begin

    lblStatusBarStatus.Caption := 'Accessing Flickr ...';
    pnlStatusBarStatus.ParentBackground := False;
    pnlStatusBarStatus.Color := clYellow;
    lblStatusBarUserID.Caption := '';
    lblStatusBarUserName.Caption := '';
    lblStatusBarUserFullName.Caption := '';
    lblStatusBarUserAccessPermission.Caption := '';
    FFlickrAccessible := False;
    FSyncFileName := '';
    lblActivityMessage.Caption := 'Accessing Flickr ...';
    Self.Repaint;

    if ExecuteAPIMethod(Get_auth_oauth_checkToken(AccessToken), vXML) then
    begin

      lblStatusBarStatus.Caption := 'Autorization Status: OK';
      pnlStatusBarStatus.ParentBackground := False;
      pnlStatusBarStatus.Color := clMoneyGreen;
      UserID := vXML.Attribute['rsp.oauth.user.nsid'];
      lblStatusBarUserID.Caption := edtUserID.EditLabel.Caption + ' ' + UserID;
      edtUserName.Text := vXML.Attribute['rsp.oauth.user.username'];
      lblStatusBarUserName.Caption := edtUserName.EditLabel.Caption + ' ' + edtUserName.Text;
      edtUserFullName.Text := vXML.Attribute['rsp.oauth.user.fullname'];
      lblStatusBarUserFullName.Caption := edtUserFullName.EditLabel.Caption + ' ' + edtUserFullName.Text;
      edtUserAccessPermission.Text := vXML.Element['rsp.oauth.perms'];
      lblStatusBarUserAccessPermission.Caption := edtUserAccessPermission.EditLabel.Caption + ' ' + edtUserAccessPermission.Text;
      FFlickrAccessible := True;
      // use user ID
      FSyncFileName := '.' + MakeFileFriendly(edtUserID.Text) + '_syncr.ini';
      lblActivityMessage.Caption := 'Access to Flickr granted';
      lblActivityMessage.Font.Color := clMoneyGreen;
      FUserIDCollection.AddOrSetValue(edtUserID.Text, edtUserFullName.Text + ' <' + edtUserName.Text + '>');
      actChangeOrCreateUser.Caption := Format('Change (%s) or Authorize New User', [edtUserName.Text]);

    end else begin

      lblStatusBarStatus.Caption := 'Failed To Access Flickr for ' + aUserName;
      pnlStatusBarStatus.ParentBackground := False;
      pnlStatusBarStatus.Color := clRed;
      lblStatusBarUserID.Caption := '';
      lblStatusBarUserName.Caption := '';
      lblStatusBarUserFullName.Caption := '';
      lblStatusBarUserAccessPermission.Caption := '';
      FFlickrAccessible := False;
      FSyncFileName := '';
      lblActivityMessage.Caption := 'Cannot Access to Flickr';
      if Assigned(vXML) then
        lblActivityMessage.Caption := lblActivityMessage.Caption + ', error code: ' +
        vXML.Attribute['rsp.err.code'] + ', message: ' + vXML.Attribute['rsp.err.msg'];
      lblActivityMessage.Font.Color := clRed;
      UserID := '';
      edtUserName.Text := '';
      edtUserFullName.Text := '';
      edtUserAccessPermission.Text := '';
      actChangeOrCreateUser.Caption := Format('Change (%s) or Authorize New User', [edtUserName.Text]);

    end;
  end else begin
    lblStatusBarStatus.Caption := 'Authorization Required! Please Proceed with <' +
      actGetRequestTokenAndAuthCode.Caption + '> and <' + actGetAccessToken.Caption + '>';
    pnlStatusBarStatus.ParentBackground := False;
    pnlStatusBarStatus.Color := clYellow;
    lblStatusBarUserID.Caption := '';
    lblStatusBarUserName.Caption := '';
    lblStatusBarUserFullName.Caption := '';
    lblStatusBarUserAccessPermission.Caption := '';
    FFlickrAccessible := False;
    FSyncFileName := '';
    lblActivityMessage.Caption := '';
    actChangeOrCreateUser.Caption := 'Authorize New User';
  end;

end;

//function TFoldersToFlickrSyncrForm.GetPhotoIDInfo(const aPhotoID: string): boolean;
//var
//  vXML: IbvXMLAccess;
//  vToken, vID: string;
//begin
//  Result := IsFlickrAccessible;
//  if not Result then
//  begin
//    ShowMessageDlg('Access to Flickr is not setup for GetPhotoIDInfo', mtError, [mbOK]);
//    Exit;
//  end;
//
//  if aPhotoID <> '' then
//  begin
//    // validate if photo exists - flickr.photos.getInfo - clear ID if not
//    if ExecuteAPIMethod(Get_photos_getInfo(aPhotoID, ''), vXML) then
//    begin
//      vID := vXML.Attribute['rsp.photo.id'];
//      vToken := vXML.Attribute['rsp.photo.owner.nsid'];
//      // wrong user - remove photo reference
//      Result := (vToken = UserID) and (vID = aPhotoID);
//    end else
//      Result := False;
//  end else begin
//    ShowMessageDlg('GetPhotoIDInfo for empty PhotoID', mtError, [mbOK]);
//    Result := False;
//  end;
//end;

function TFoldersToFlickrSyncrForm.GetPhotoPermissions(const aPhotoID: string;
  out aIsFamily, aIsFriend, aIsPublic, aPermissionAddMeta, aPermissionComment: String): boolean;
var
  vXML: IbvXMLAccess;
begin
  Result := IsFlickrAccessible;
  if not Result then
  begin
    ShowMessageDlg('Access to Flickr is not setup for GetPhotoPermissions', mtError, [mbOK]);
    Exit;
  end;

  if aPhotoID <> '' then
  begin
    // validate if photo exists - flickr.photos.getPerms - Get permissions for a photo.
    if ExecuteAPIMethod(Get_photos_getPerms(aPhotoID), vXML) then
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
      Result := True;
    end else
      Result := False;
  end else begin
    ShowMessageDlg('GetPhotoPermissions for empty PhotoID', mtError, [mbOK]);
    Result := False;
  end;
end;

function TFoldersToFlickrSyncrForm.GetPlaceholderPhotoID: string;
var
  vResponseText, vUploadedPhotoID, vTicketID: String;
begin

  Result := FPlaceholderPhotoID;

  if Result = '' then
  begin
    if PostPhotoToFlickr(
      edtPlaceholderImageLocation.Text,
      '',
      'Temporary Photo to be used as temporary placeholder for new albums',
      'Temporary Photo',
      '',
      '0', //  const aIs_public: Boolean= False;
      '0', //  const aIs_friend: Boolean= False;
      '0', //  const aIs_family: Boolean= True;
      False, //  const aSyncMode: Boolean= False);
      vResponseText, vUploadedPhotoID, vTicketID) then
    begin
      if vTicketID <> '' then
      begin
        ShowMessageDlg('GetPlaceholderPhotoID - do not use async upload here - we need exact ID', mtError, [mbOK]);
      end else
      if vUploadedPhotoID <> '' then
      begin
        Result := vUploadedPhotoID;
        FPlaceholderPhotoID := vUploadedPhotoID;
        // store into sync ini file immediately
        ApplicationIniFileWrite;
      end;
    end else begin
      ShowMessageDlg('GetPlaceholderPhotoID - failed to upload', mtError, [mbOK]);
    end;
  end;

  Assert(Result <> '');

  memPhotoResponse.Text := vResponseText;
end;

function TFoldersToFlickrSyncrForm.GetProcessThreadsMaxCount: Integer;

  function _IsRunningUnderIDE: Boolean;
  begin
    {$WARN SYMBOL_PLATFORM OFF}
    // Show if application is running under Delphi IDE
    Result := DebugHook <> 0;
    {$WARN SYMBOL_PLATFORM ON}
  end;

begin
//  if _IsRunningUnderIDE then
//    Result := 1 // need for debugging only
//  else

  FProcessThreadsMaxCount := GetCorrectedThreadsCount(FProcessThreadsMaxCount);
  Result := FProcessThreadsMaxCount;
end;

function TFoldersToFlickrSyncrForm.GetRequestToken: string;
begin
  Result := edtRequestToken.Text;
end;

function TFoldersToFlickrSyncrForm.GetRequestTokenSecret: string;
begin
  Result := edtRequestTokenSecret.Text;
end;

function TFoldersToFlickrSyncrForm.GetSyncFileName: string;
begin
  Result := FSyncFileName;
end;

function TFoldersToFlickrSyncrForm.GetUserID: string;
begin
  Result := FlickrUserID;
end;

function TFoldersToFlickrSyncrForm.GetVerifierPIN: string;
begin
  Result := edtVerifierPIN.Text;
end;

procedure TFoldersToFlickrSyncrForm.HandleCleanUpThreadTerminate(Sender: TObject);
var
  vList: TList;
begin

  if Assigned(FAvailableCollectFileDataThreads) then
  begin
    vList := FAvailableCollectFileDataThreads.LockList;
    try

      while vList.Count > 0 do begin
        TObject(vList.Items[0]).Free;
        vList.Delete(0);
      end;

    finally
      FAvailableCollectFileDataThreads.UnlockList;
    end;

  end;

  //pnlStructureData.Enabled := True;

  if not FCancelSyncronization then
  begin
    if not Sync_LoadFlickrAlbums then
      CustomMessageDlg(Self, 'Failed to Load Flickr Albums!', mtError, [mbOK], mbOK);

    if not Sync_DeleteUnknownAlbums then
      CustomMessageDlg(Self, 'Failed to Delete Unknown Albums!', mtError, [mbOK], mbOK);

    if not Sync_ReorderAlbums then
      CustomMessageDlg(Self, 'Failed to Reorder Albums!', mtError, [mbOK], mbOK);

    memSyncronizatioLog.Lines.Add('Syncronization complete');

    memSyncronizatioLog.Lines.SaveToFile(ChangeFileExt(Application.ExeName, '.syncronization.log'));
    memActionsLog.Lines.SaveToFile(ChangeFileExt(Application.ExeName, '.actions.log'));
    memErrorsLog.Lines.SaveToFile(ChangeFileExt(Application.ExeName, '.errors.log'));
  end;

  Syncronizing := False;

end;

procedure TFoldersToFlickrSyncrForm.IncreaseProcessThreads;
var
  vActiveList: TList;
begin
  vActiveList := FActiveCollectFileDataThreads.LockList;
  try

    AddNewThreads(vActiveList);

  finally
    FActiveCollectFileDataThreads.UnlockList;
  end;

end;

procedure TFoldersToFlickrSyncrForm.InitializeProcessThread(const aWorkFolder: TLocalFolder; const aInsertPosition: TInsertPosition);
var
  i: integer;
begin
  if not aWorkFolder.IsUploadCompleteForAllPhotos or aWorkFolder.ArchivedFolder then
  begin
    i := FPhotoListsToProcess.IndexOf(aWorkFolder);
    if i = -1 then
    begin
      case aInsertPosition of
        ipTop: FPhotoListsToProcess.Insert(0, aWorkFolder);
        ipAdd: FPhotoListsToProcess.Add(aWorkFolder);
      end;
      //LocalPhotoFile_ProcessThreadTerminate(nil);
      //LogActionRecord(aWorkFolder.AlbumName + ' - Load Local Files Data');
    end else begin
      // move to the top
      if (aInsertPosition = ipTop) and (i <> 0) then
        FPhotoListsToProcess.Move(i, 0);
    end;
  end;
end;

function TFoldersToFlickrSyncrForm.IsFlickrAccessible: boolean;
begin
  Result := FFlickrAccessible and
    (MyAccessToken <> '') and (MyAccessTokenSecret <> '') and
    (SameText(edtUserAccessPermission.Text, 'delete'));
end;

function TFoldersToFlickrSyncrForm.IsPhotoExist(const aPhotoID: string): Boolean;
var
  vIsFamily, vIsFriend, vIsPublic, vPermissionAddMeta, vPermissionComment: String;
begin
  Result := GetPhotoPermissions(aPhotoID,
    vIsFamily, vIsFriend, vIsPublic, vPermissionAddMeta, vPermissionComment);
end;

procedure TFoldersToFlickrSyncrForm.LocalPhotoFile_ProcessThreadTerminate(Sender: TObject);
var
  vCollectFileDataThread: TCollectFileDataThread;
  vActiveList, vAvailableList: TList;
  i: integer;
begin
  vActiveList := FActiveCollectFileDataThreads.LockList;
  try

    vAvailableList := FAvailableCollectFileDataThreads.LockList;
    try

      vCollectFileDataThread := Sender as TCollectFileDataThread;

      if Assigned(vCollectFileDataThread) then
      begin
        vActiveList.Remove(vCollectFileDataThread);
        vAvailableList.Add(vCollectFileDataThread);
        if not FCancelSyncronization and not vCollectFileDataThread.LocalFolderToProcess.IsUploadCompleteForAllPhotos then
        begin
          // return this folder into collection to reprocess
          FPhotoListsToProcess.Add(vCollectFileDataThread.LocalFolderToProcess);
        end;
        vCollectFileDataThread.LocalFolderToProcess := nil;

        i := ThreadIDToIndex(vCollectFileDataThread.ThreadID);
        if i <> -1 then
        begin
          ThreadsList[i] := 0;
          grdThreadsData.Cells[0, i + 1] := IfThen(FCancelSyncronization, 'Terminated', 'Completed');
          grdThreadsData.Cells[5, i + 1] := IfThen(FCancelSyncronization, '', '100%');
        end;

        while (ProcessThreadsMaxCount < Length(ThreadsList)) do begin
          i := Length(ThreadsList) - 1;
          if ThreadsList[i] = 0 then
          begin
            SetLength(ThreadsList, i);
            grdThreadsData.RowCount := i + 1;
          end else
            Break;
        end;

      end;

      AddNewThreads(vActiveList);

      if vActiveList.Count = 0 then
      begin
        edtThreadsActive.Text := '0';
        edtThreadsActive.Update;
        edtThreadsCompleted.Text := IntToStr(vAvailableList.Count);
        edtThreadsCompleted.Update;
        if not FCancelSyncronization then
          FIncompletedFolders.Clear;
        CreateCleanUpThread;
        prbProgress.Visible := False;
        SetTaskBarProgressState_NoProgress(Self.Handle);
      end else begin
        edtThreadsActive.Text := IntToStr(vActiveList.Count);
        edtThreadsCompleted.Text := IntToStr(vAvailableList.Count);
      end;

    finally
      FAvailableCollectFileDataThreads.UnlockList;
    end;

  finally
    FActiveCollectFileDataThreads.UnlockList;
  end;

end;

function TFoldersToFlickrSyncrForm.LogActionActivity(const aMessageTxt: string): ISnapshotInterface;
begin
  Result := LogActionMessage(memActionsLog.Lines, aMessageTxt, False);
end;

function TFoldersToFlickrSyncrForm.LogActionRecord(const aMessageTxt: string): ISnapshotInterface;
begin
  Result := LogActionMessage(memActionsLog.Lines, aMessageTxt, True);
end;

procedure TFoldersToFlickrSyncrForm.pnlFiltersResize(Sender: TObject);
begin
  grbFolderFilters.Width := pnlFilters.ClientWidth div 2;
  grbExcludeFolders.Height := grbFolderFilters.ClientHeight div 2;
  grbExcludeContacts.Height := grbPicasaContactsFilters.ClientHeight div 2;
end;

function TFoldersToFlickrSyncrForm.PostPhotoToFlickr(
  const aFileName, aPhoto_id, aDescription, aTitle, aTags: string;
  const aIsPublic, aIsFriend, aIsFamily : string;
  const aAsync: Boolean;
  out aResponseText, aUploadedPhotoID, aTicketID: string ): Boolean;
var
  vMFData: TIdMultiPartFormDataStream;
  i: Integer;
  vFullURL: String;
  vParameters: TStringList;
  vXML: IbvXMLAccess;
  vIsUpload: Boolean;
  vUploadSize: int64;
begin

  vIsUpload := aPhoto_id = '';
  vUploadSize := 0;

  LogActionMessage(memFlickrLog.Lines, Ifthen(vIsUpload, 'Upload ', 'Replace ') + aFileName, False);

  Result := False;
  aResponseText := '';
  aUploadedPhotoID := '';
  aTicketID := '';

  ResetRESTComponentsToDefaults;

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
        if aDescription <> '' then
          vParameters.Values['description'] := MyEncodeAsUTF8(aDescription);
        if aTitle <> '' then
          vParameters.Values['title'] := MyEncodeAsUTF8(aTitle)
        else
          vParameters.Values['title'] := MyEncodeAsUTF8(ExtractFileName(aFileName));
        if aTags <> '' then
          vParameters.Values['tags'] := MyEncodeAsUTF8(aTags);
        vParameters.Values['is_public'] := aIsPublic;
        vParameters.Values['is_friend'] := aIsFriend;
        vParameters.Values['is_family'] := aIsFamily;
        vParameters.Values['safety_level'] := '1';
        vParameters.Values['content_type'] := '1';
        vParameters.Values['hidden'] := IfThen(aIsPublic = '1', '0', '1');
      end;

      // parameters specific to replacing photo
      //photo_id
      //    The ID of the photo to replace.

      if not vIsUpload then
        vParameters.Values['photo_id'] := aPhoto_id;

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
      vMFData.AddFile(ARGUMENTNAME_PHOTO, aFileName);

      IdHTTP1.Disconnect;
      IdHTTP1.Request.Clear;
      IdHTTP1.Request.Charset := 'utf-8';
      IdHTTP1.Request.CustomHeaders.Clear;
      IdHTTP1.Request.RawHeaders.Clear;
      IdHTTP1.Response.Clear;
      IdHTTP1.Response.RawHeaders.Clear;
      IdHTTP1.HandleRedirects := True;
      IdHTTP1.Request.BasicAuthentication := False;
      IdHTTP1.Request.CustomHeaders.AddValue('Authorization',
        GetOAuthAuthenticateHeaderValue(vParameters,
          ApplicationConsumerKey,
          ApplicationConsumerSecret,
          // OAuthAuthenticator.CallbackEndpoint,
          MyAccessToken,
          MyAccessTokenSecret,
          vFullURL) // as per oauth-spec we do need the full URL without (!) any query-params
          );
      IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol, hoForceEncodeParams];
      try

        aResponseText := IdHTTP1.Post(vFullURL, vMFData);
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
          aResponseText := e.ClassName + ': ' + e.Message + #13#10 + e.ErrorMessage;
        on E: Exception do
          aResponseText := e.ClassName + ': ' + e.Message;
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

end;

procedure TFoldersToFlickrSyncrForm.ResetRESTComponentsToDefaults;
begin
  RESTRequest.ResetToDefaults;
  RESTClient.ResetToDefaults;
  RESTResponse.ResetToDefaults;
end;

procedure TFoldersToFlickrSyncrForm.rgpPermissionsForPhotosWithFacesClick(Sender: TObject);
begin
  if rgpPermissionsForPhotosWithFaces.ItemIndex = 0 then
  begin
    chkPicasaContactsFriends.Enabled := True;
    chkPicasaContactsFamily.Enabled := True;
  end else begin
    chkPicasaContactsFriends.Enabled := False;
    chkPicasaContactsFamily.Enabled := False;
    chkPicasaContactsFriends.Checked := False;
    chkPicasaContactsFamily.Checked := False;
  end;
end;

procedure TFoldersToFlickrSyncrForm.rgpPermissionsForPhotosWithOutFacesClick(Sender: TObject);
begin
  if rgpPermissionsForPhotosWithOutFaces.ItemIndex = 0 then
  begin
    chkPicasaNoContactsFriends.Enabled := True;
    chkPicasaNoContactsFamily.Enabled := True;
  end else begin
    chkPicasaNoContactsFriends.Enabled := False;
    chkPicasaNoContactsFamily.Enabled := False;
    chkPicasaNoContactsFriends.Checked := False;
    chkPicasaNoContactsFamily.Checked := False;
  end;
end;

procedure TFoldersToFlickrSyncrForm.rgpWhoCanSeeClick(Sender: TObject);
begin
  if rgpWhoCanSee.ItemIndex = 0 then
  begin
    chkWhoCanSeeFamily.Enabled := True;
    chkWhoCanSeeFriends.Enabled := True;
  end else begin
    chkWhoCanSeeFriends.Enabled := False;
    chkWhoCanSeeFamily.Enabled := False;
    chkWhoCanSeeFriends.Checked := False;
    chkWhoCanSeeFamily.Checked := False;
  end;
end;

procedure TFoldersToFlickrSyncrForm.SetAccessToken(const Value: string);
begin
  MyAccessToken := Value;
  edtAccessToken.Text := Value;
  OAuthAuthenticator.AccessToken := Value;
end;

procedure TFoldersToFlickrSyncrForm.SetAccessTokenSecret(const Value: string);
begin
  MyAccessTokenSecret := Value;
  edtAccessTokenSecret.Text := Value;
  OAuthAuthenticator.AccessTokenSecret := Value;
end;

procedure TFoldersToFlickrSyncrForm.SetConsumerKey(const Value: string);
begin
  edtConsumerKey.Text := Value;
  OAuthAuthenticator.ConsumerKey := Value;
end;

procedure TFoldersToFlickrSyncrForm.SetConsumerSecret(const Value: string);
begin
  edtConsumerSecret.Text := Value;
  OAuthAuthenticator.ConsumerSecret := Value;
end;

procedure TFoldersToFlickrSyncrForm.SetProcessThreadsMaxCount(const Value: Integer);
begin

  FProcessThreadsMaxCount := GetCorrectedThreadsCount(Value);

  if Length(ThreadsList) < Value then
  begin
    SetLength(ThreadsList, FProcessThreadsMaxCount);
    grdThreadsData.RowCount := FProcessThreadsMaxCount + 1;
    IncreaseProcessThreads;
  end;

  edtThreadsToRun.Value := FProcessThreadsMaxCount;

end;

procedure TFoldersToFlickrSyncrForm.SetProgressBarPosition(const Value: Integer);
begin
  prbProgress.Position := Value;
  SetTaskBarProgressValue(Self.Handle, prbProgress.Position, prbProgress.Max);
end;

procedure TFoldersToFlickrSyncrForm.SetReadyToProcess(const Value: Boolean);
begin
  FReadyToProcess := Value;
  if FReadyToProcess then begin
    // start actual processing
    LocalPhotoFile_ProcessThreadTerminate(nil);
      //LogActionRecord(aWorkFolder.AlbumName + ' - Load Local Files Data');
  end;
end;

procedure TFoldersToFlickrSyncrForm.SetRequestToken(const Value: string);
begin
  edtRequestToken.Text := Value;
  OAuthAuthenticator.RequestToken := Value;
end;

procedure TFoldersToFlickrSyncrForm.SetRequestTokenSecret(const Value: string);
begin
  edtRequestTokenSecret.Text := Value;
  OAuthAuthenticator.RequestTokenSecret := Value;
end;

procedure TFoldersToFlickrSyncrForm.SetSyncronizing(const Value: Boolean);
begin
  FSyncronizing := Value;
  if FSyncronizing then
  begin
    SetTaskBarProgressState_Indeterminate(Self.Handle);
    LogActionMessage(memActionsLog.Lines, '*** Full Syncronization Starts ***', True);
    gSyncronizationTime := Now;
    FCancelSyncronization := False;

    // clean up GUI
    actCancelSyncronization.Update;
    actChangeOrCreateUser.Update;
    actSyncronize.Update;
    edtErrors.Text := '0';
    edtPhotosProcessed.Text := '0';
    edtPhotosProcessed.Update;
    lblError.Caption := '';
    lblError.Update;
    lblPhotosProcessedDetails.Caption := '...';
    lblPhotosProcessedDetails.Update;
    memErrorsLog.Clear;
    memErrorsLog.Update;
    memActionsLog.Clear;
    memActionsLog.Update;
    memSyncronizatioLog.Clear;
    memSyncronizatioLog.Update;

    // initialize global variables
    gAlbumsCreated := 0;
    gAlbumsProcessed :=  0;
    gDoNotUnlinkUnknownPhotosFromAlbum := chkDoNotUnlinkUnknownPhotosFromAlbum.Checked;
    gDoResize := chkResize.Checked;
    gApplyPermissionsChanges := chkApplyPermissionsChanges.Checked;
    gEnforceSyncrIniPermissions := chkEnforceSyncrIniPermissions.Checked;
    gDoSaveResizedPhotos := chkSaveResizedPhotosFolder.Checked;
    gSaveResizedPhotosFolder := edtSaveResizedPhotosFolder.Text;
    gErrors := 0;
    gFlickrApiCallsCount :=  0;
    gImageUniqueIDList.Clear;
    gMaxResizeFileSize := StrToInt(edtResizeFileSize.Text) * 1024;
    gMaxResizeHeight := StrToInt(edtResizeHeight.Text);
    gMaxResizeWidth := StrToInt(edtResizeWidth.Text);
    gPhotoReplacments :=  0;
    gPhotosProcessed :=  0;
    gPhotosTotalSize := 0;
    gPhotoUploads :=  0;
    gResizeJpgQuality := Max(Min(100, StrToInt(edtResizeJpgQuality.Text)), 50);
    gResolvedErrors := 0;
    gSyncronizationTime := Now;
    gUploadedSize :=  0;
    gSetImageDescription := chkSetImageDescription.Checked;
    gPriorityPermissionsFlickr := rgpPriorityPermissions.ItemIndex = 0;
    gPriorityTitleExif := rgpPriorityTitle.ItemIndex = 0;
    FreeAndNil(gFlickrAlbums);
    ClearFlickrPhotosNotInSet;
    FreeAndNil(gFlickrPhotosNotInSet);

    tbsAuthentication.Enabled := False;
    tbsFlickrSettings.Enabled := False;
    tbsPicasaSettings.Enabled := False;
    tbsUploadSetting.Enabled := False;
    tbsApiCalls.Enabled := False;
    tbsDevelopment.Enabled := False;

  end else begin
    SetTaskBarProgressState_NoProgress(Self.Handle);
    LogActionMessage(memActionsLog.Lines, '*** Full Syncronization Finished ***', True);
    edtSyncronizationTime.Text := FormatDateTime('HH:MM:SS', Now - gSyncronizationTime);
    gImageUniqueIDList.Clear;
    FreeAndNil(gFlickrAlbums);
    ClearFlickrPhotosNotInSet;
    FreeAndNil(gFlickrPhotosNotInSet);
  // now reset all flags to collected data
    FSync_CollectFolderData := False;
    FSync_DeleteUnknownAlbums := False;
    FSync_LoadFlickrAlbums := False;

    tbsAuthentication.Enabled := True;
    tbsFlickrSettings.Enabled := True;
    tbsPicasaSettings.Enabled := True;
    tbsUploadSetting.Enabled := True;
    tbsApiCalls.Enabled := True;
    tbsDevelopment.Enabled := True;

  end;
end;

procedure TFoldersToFlickrSyncrForm.SetUserID(const Value: string);
begin
  edtUserID.Text := Value;
  FlickrUserID := Value;
end;

procedure TFoldersToFlickrSyncrForm.SetVerifierPIN(const Value: string);
begin
  edtVerifierPIN.Text := Value;
  OAuthAuthenticator.VerifierPIN := Value;
end;

function TFoldersToFlickrSyncrForm.ShowMessageDlg(const aMsg: string; const aDlgType: TMsgDlgType;
  const aButtons: TMsgDlgButtons; const aDefaultButton: TMsgDlgBtn; const aAutoCloseTime: Cardinal): Integer;
begin
  if aDlgType in [mtError, mtWarning] then
  begin
    memErrorsLog.Lines.Add('--- ' + FormatDateTime('dd-mmm-yyyy hh:mm:ss', now) + ' ---');
    memErrorsLog.Lines.Add(aMsg);
  end;

  Result := CustomMessageDlg(Self, aMsg, aDlgType, aButtons, aDefaultButton, aAutoCloseTime);
end;

procedure TFoldersToFlickrSyncrForm.SortApplicationIniFile;
var
  vIniFile: TIniFileUnicode;
  vSections, vValues, vSortedText: TStringList;
  s, v: string;
begin

  vSections := TStringList.Create;
  vValues := TStringList.Create;
  vSortedText := TStringList.Create;
  try

    vIniFile := TIniFileUnicode.Create(ApplicationIniFile, fReadIni);
    try

      vIniFile.ReadSections(vSections);

      vSections.Sort;

      for s in vSections do begin
        vIniFile.ReadSectionValues(s, vValues);
        vValues.Sort;
        if vValues.Count > 0 then
        begin
          vValues.Sort;
          vSortedText.Add('[' + s + ']');
          for v in vValues do begin
            vSortedText.Add(v);
          end;
          vSortedText.Add('');
        end;

      end;

    finally
      vIniFile.Free;
    end;

    vSortedText.SaveToFile(ApplicationIniFile, TEncoding.Unicode);

  finally
    vSortedText.Free;
    vValues.Free;
    vSections.Free;
  end;

end;

function TFoldersToFlickrSyncrForm.Sync_ApplyPicasaSettings: boolean;
begin
  Result := True;
  if FCancelSyncronization then
    Exit;

  SetTaskBarProgressState_Indeterminate(self.Handle);

  Result := True;

  LogActionActivity('--- Load Picasa Contacts ---');
  ActionMessage('Load Picasa Contacts');

  gPicasaSettings.ApplySettings(
    rgpPermissionsForPhotosWithFaces.ItemIndex = 2,
    chkPicasaContactsFamily.Checked,
    chkPicasaContactsFriends.Checked,
    rgpPermissionsForPhotosWithFaces.ItemIndex = 1,
    rgpPermissionsForPhotosWithOutFaces.ItemIndex = 2,
    chkPicasaNoContactsFamily.Checked,
    chkPicasaNoContactsFriends.Checked,
    rgpPermissionsForPhotosWithOutFaces.ItemIndex = 1,
    edtPicasaContacts.Text);

end;

function TFoldersToFlickrSyncrForm.Sync_CollectFolderData: Boolean;
var
  i: integer;
  vTmpItems: TStringList;
begin
  Result := True;
  if FCancelSyncronization then
    Exit;

  edtFoldersScanned.Text := '0';
  FTotalFoldersScanned := 0;

  SetTaskBarProgressState_Indeterminate(self.Handle);

  LogActionActivity('--- Collecting Local Data ---');
  ActionMessage('Collecting Local Data');

  FSync_CollectFolderData := False;

  FExcludeFolders.Clear;
  FExcludeFolders.AddRange(memExcludeFiles.Lines.ToStringArray);
  FExcludeFolders.Sort;

  FIncludeFolders.Clear;
  FIncludeFolders.AddRange(memIncludeFiles.Lines.ToStringArray);
  FIncludeFolders.Sort;

  FWorkLoad.Clear;
  gWorkAlbumsFromFolders.Clear;
  FPhotoListsToProcess.Clear;
  FWorkCollectionsFromFolders.Clear;
  lstAlbumsFromFolders.Clear;

  for i := 0 to lstTopFoldersToSyncronize.Count - 1 do begin
    if FCancelSyncronization then
      Exit;
    Result := Sync_CollectFoldersAndFilesForTopFolder(lstTopFoldersToSyncronize.Items[i]);
    if not Result then
      Exit;
  end;

  if FWorkLoad.PhotosCount > 0 then
  begin
    edtPhotosToProcess.Text := IntToStr(FWorkLoad.PhotosCount);
    edtPhotosToProcess.Update;
    edtAlbumsToProcess.Text := IntToStr(FWorkLoad.AlbumsCount);
    edtAlbumsToProcess.Update;
  end else begin
    edtPhotosToProcess.Text := 'no Photos';
    edtPhotosToProcess.Update;
    edtAlbumsToProcess.Text := 'no Albums';
    edtAlbumsToProcess.Update;
  end;

  vTmpItems := TStringList.Create;
  try

    vTmpItems.AddStrings(gWorkAlbumsFromFolders.Values.ToArray);
    vTmpItems.Sort;
    if rgpFlickrAlbumsSortOrder.ItemIndex = 0 then
    begin
      lstAlbumsFromFolders.Items.AddStrings(vTmpItems);
    end else begin
      for i := vTmpItems.Count - 1 downto 0 do begin
        lstAlbumsFromFolders.Items.Add(vTmpItems[i]);
      end;
    end;

  finally
    vTmpItems.Free;
  end;

  BuildTreeStructure;

  lblAlbumsFromFoldersBottom.Caption := IntToStr(lstAlbumsFromFolders.Count) + ' Albums to Syncronize';

  Result := gWorkAlbumsFromFolders.Count > 0;
  FSync_CollectFolderData := Result;

  TopFoldersChanged;

  if not Result then
    lblError.Caption := 'No Albums/Photos to Syncronize!';

end;

function TFoldersToFlickrSyncrForm.Sync_CollectFoldersAndFilesForTopFolder(
    const aSourceFolder: string): Boolean;
var
  vPathList, vFileList: TStringDynArray;
  vPathName, vFileName, vParentFolderName: string;
  vFolder, vExistedFolder: TLocalFolder;
begin

  Result := True;

  if FCancelSyncronization then
    Exit;

  Assert(SyncFileName <> '');

  if System.SysUtils.DirectoryExists(aSourceFolder) then
  begin

    prbProgress.Visible := True;
    try

      prbProgress.Min := 0;
      ProgressBarPosition := 0;

      vParentFolderName := System.SysUtils.ExtractFilePath(aSourceFolder);
      vPathList := TDirectory.GetDirectories(aSourceFolder, TSearchOption.soAllDirectories, DoFilterDirectories);
      vPathList := vPathList + [aSourceFolder];
      // sort vPathList
      if rgpHandleFoldersOrder.ItemIndex = 1 then
      begin
        TArray.Sort<string>(vPathList , TDelegatedComparer<string>.Construct(
          function(const Left, Right: string): Integer
          begin
            Result := CompareText(Right, Left);
          end));
      end else begin
        TArray.Sort<string>(vPathList , TDelegatedComparer<string>.Construct(
          function(const Left, Right: string): Integer
          begin
            Result := CompareText(Left, Right);
          end));
      end;

      prbProgress.Max := Length(vPathList) - 1;
      for vPathName in vPathList do begin
        Inc(FTotalFoldersScanned);
        edtFoldersScanned.Text := IntToStr(FTotalFoldersScanned);
        edtFoldersScanned.Update;
        vFolder := TLocalFolder.Create;
        vFolder.IgnoreArchivedFlag := chkIgnoreArchivedFlag.Checked;
        vFolder.SyncDataFileName := System.SysUtils.IncludeTrailingPathDelimiter(vPathName) + SyncFileName;
        // Upload=0 - ignore this folder

        if vFolder.UploadFolder then
        begin

          vFolder.FolderNameRelative := copy(vPathName, Length(vParentFolderName) + 1);

          // if we already have album with the same name - add photos there
          for vExistedFolder in FWorkLoad.WorkCollection.ToArray do begin
            if SameText(vExistedFolder.AlbumName, vFolder.AlbumName) then
            begin
              memSyncronizatioLog.Lines.Add(Format('Merged Album "%s" will be created', [vFolder.AlbumName]));
              vFolder.Free;
              vFolder := vExistedFolder;
              Break;
            end;
          end;

          vFolder.SourceFolderFullName := vPathName;
          // do collect data for non archived folders - assume it is up to date for archived ones
          if not vFolder.ArchivedFolder then
            vFileList := TDirectory.GetFiles(vPathName, '*.jpg', DoFilterFiles)
          else
            SetLength(vFileList, 0);

          if vFolder.ArchivedFolder or (Length(vFileList) > 0) then
          begin
            // merged albums - need only one copy with combined set of photos
            if not FWorkLoad.WorkCollection.Contains(vFolder) then
            begin
              FWorkLoad.WorkCollection.Add(vFolder);
              FWorkLoad.AlbumsCount := FWorkLoad.AlbumsCount + 1;
            end;
            if not vFolder.ArchivedFolder then
            begin
              // sort vFileList
              TArray.Sort<string>(vFileList , TDelegatedComparer<string>.Construct(
                function(const Left, Right: string): Integer
                begin
                  Result := CompareText(Left, Right);
                end));

              for vFileName in vFileList do
              begin
                vFolder.AddPhoto(vFileName);
              end;
            end;
            // apply information from picasa - security
            // for merged albums this is another picasa.ini file
            Result := vFolder.ApplyPicasaFileName;

            if not Result then
              Exit;

            // need to use length() to proper calculate count for merged albums
            FWorkLoad.PhotosCount := FWorkLoad.PhotosCount + Length(vFileList);
            if vFolder.FlickrAlbumID = '' then
            begin
              Assert(not vFolder.ArchivedFolder, 'Archived folder must have FlickrAlbumID');
              gWorkAlbumsFromFolders.AddOrSetValue(vFolder.AlbumName, vFolder.AlbumName);
            end else begin
              gWorkAlbumsFromFolders.AddOrSetValue(vFolder.FlickrAlbumID, vFolder.AlbumName);
            end;

          end else begin
            if vFolder.LocalPhotos.Count = 0 then
              vFolder.Free;
          end;
        end else
          vFolder.Free;

        ProgressBarPosition := prbProgress.Position + 1;
        prbProgress.Update;
        edtPhotosToProcess.Text := IntToStr(FWorkLoad.PhotosCount);
        edtPhotosToProcess.Update;
      end;

    finally
      prbProgress.Visible := False;
    end;

  end;

end;

function TFoldersToFlickrSyncrForm.Sync_DeleteUnknownAlbums: Boolean;
var
  vXML: IbvXMLAccess;
  vAlbumName, vAlbumID: string;
  vRequiredAlbums: TListString;
  vTmpItems: TStringList;
  i: integer;
begin
  SetTaskBarProgressState_Indeterminate(self.Handle);

  Result := IsFlickrAccessible and FSync_LoadFlickrAlbums and FSync_CollectFolderData;
  if not Result then
  begin
    ShowMessageDlg('Access to Flickr is not setup for Sync_DeleteUnknownAlbums', mtError, [mbOK]);
    Exit;
  end;

  if not chkProcessDoNotDeleteUnknownAlbums.Checked then
  begin
    LogActionActivity('--- Deleting Unknown Albums ---');
    ActionMessage('Deleting Unknown Albums');
    memSyncronizatioLog.Lines.Add('Deleting Unknown Albums');
    vRequiredAlbums := TListString.Create;
    try

      vRequiredAlbums.AddRange(gWorkAlbumsFromFolders.Values.ToArray);

      for vAlbumID in gFlickrAlbums.Keys.ToArray do begin
        if FCancelSyncronization then
          Exit;
        vAlbumName := gFlickrAlbums.Items[vAlbumID];
        if not vRequiredAlbums.Contains(vAlbumName) then
        begin
          // do not delete auto upload album
          if SameText(vAlbumName, 'Auto Upload') or SameText(vAlbumName, 'Folders to Flickr') then
          begin
            Result := True;
            Continue;
          end;

          if ExecuteAPIMethod(Get_photosets_delete(vAlbumID), vXML) then
          begin
            //vAlbumID := vXML.Attribute['rsp.photoset.id'];
            //Assert(vAlbumID <> '');
            gFlickrAlbums.Remove(vAlbumID);
            LogActionRecord('"' + vAlbumName + '" album deleted');
            Result := True;
          end else begin
            Result := False;
            if ShowMessageDlg('Delete Albums "' + vAlbumName + '" failed.',
              mtWarning, [mbIgnore, mbCancel], mbIgnore, 5000) = mrIgnore then
            begin
              TInterlocked.Increment(gErrors);
              edtErrors.Text := IntToStr(TInterlocked.Read(gErrors));
              edtErrors.Update;
              Break;
            end else begin
              Result := False;
              Exit;
            end;
          end;
        end else
          vRequiredAlbums.Remove(vAlbumName);
      end;

    finally
      vRequiredAlbums.Free;
    end;

    vTmpItems := TStringList.Create;
    try

      vTmpItems.AddStrings(gFlickrAlbums.Values.ToArray);
      vTmpItems.Sort;
      lstAlbums.Items.Clear;
      if rgpFlickrAlbumsSortOrder.ItemIndex = 0 then
      begin
        lstAlbums.Items.AddStrings(vTmpItems);
      end else begin
        for i := vTmpItems.Count - 1 downto 0 do
          lstAlbums.Items.Add(vTmpItems[i]);
      end;

    finally
      vTmpItems.Free;
    end;

  end;

  lblAlbumsonFlickrBottom.Caption := IntToStr(lstAlbums.Items.Count) + ' Albums';
  FSync_DeleteUnknownAlbums := Result;
  FSync_LoadFlickrAlbums := Result;

end;

function TFoldersToFlickrSyncrForm.Sync_LoadFlickrAlbums: Boolean;
var
  vXML, vNode: IbvXMLAccess;
  vToken, vTitle, vID: string;
  i, vCnt, vTotal, vProcessed, vPageNo: integer;
  vTmpItems: TStringList;
begin
  SetTaskBarProgressState_Indeterminate(self.Handle);

  LogActionActivity('--- Loading Albums from Flickr ---');
  ActionMessage('Loading Albums from Flickr');
  memSyncronizatioLog.Lines.Add('Loading Albums from Flickr');

  vPageNo := 1;
  vProcessed := 0;
//  vTotal := 0;
//  vCnt := 0;

  lstAlbums.Clear;
  if not Assigned(gFlickrAlbums) then
    gFlickrAlbums := TDictionaryStrings.Create
  else
    gFlickrAlbums.Clear;
  FSync_LoadFlickrAlbums := False;
  Result := IsFlickrAccessible;
  if not Result then
  begin
    ShowMessageDlg('Access to Flickr is not setup for Sync_LoadFlickrAlbums', mtError, [mbOK]);
    Exit;
  end;

  repeat

    if FCancelSyncronization then
      Exit;

    if ExecuteAPIMethod(Get_photosets_getList('', IntToStr(vPageNo), '500', ''), vXML) then
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
      ShowMessageDlg('Sync_LoadFlickrAlbums failed', mtError, [mbOK]);
      Exit;
    end;

    inc(vPageNo);

  until (vProcessed >= vTotal) or (vCnt = 0);

  vTmpItems := TStringList.Create;
  try

    vTmpItems.AddStrings(gFlickrAlbums.Values.ToArray);
    vTmpItems.Sort;
    lstAlbums.Items.Clear;
    if rgpFlickrAlbumsSortOrder.ItemIndex = 0 then
    begin
      lstAlbums.Items.AddStrings(vTmpItems);
    end else begin
      for i := vTmpItems.Count - 1 downto 0 do
        lstAlbums.Items.Add(vTmpItems[i]);
    end;

    lblAlbumsonFlickrBottom.Caption := IntToStr(vTotal) + ' Albums';

  finally
    vTmpItems.Free;
  end;

  FSync_LoadFlickrAlbums := Result;

end;

function TFoldersToFlickrSyncrForm.Sync_ReorderAlbums: boolean;
var
  i: Integer;
  vWorkFolder: TLocalFolder;
  s, vAlbumListIDs: string;
begin
  // now set order of albums and assign collections
  vAlbumListIDs := '';
  memSyncronizatioLog.Lines.Add('Reorder Albums');

  // for vWorkFolder in vWorkFolderList.ToArray do begin
  for i := 0 to FWorkLoad.WorkCollection.Count - 1 do begin
    vWorkFolder := FWorkLoad.WorkCollection[i];

    s := vWorkFolder.FlickrAlbumID;
    if not gFlickrAlbums.ContainsKey(s) then
      s := FindFlickrAlbumByName(vWorkFolder.AlbumName);
    if vAlbumListIDs = '' then
      vAlbumListIDs := s
    else
      if rgpFlickrAlbumsSortOrder.ItemIndex <> rgpHandleFoldersOrder.ItemIndex then
        vAlbumListIDs := s + ',' + vAlbumListIDs
      else
        vAlbumListIDs := vAlbumListIDs + ',' + s;
  end;

//vWorkFolder.Collections;
//    flickr.collections.getTree Optional user_id
//    flickr.collections.create Optional description, Optional parent_id, Required title, Optional after_new_coll
//    flickr.collections.sortCollections Optional child_collection_ids, Optional collection_id, Optional no_move
//    flickr.collections.editSets Required collection_id, Optional do_remove, Required photoset_ids
//    flickr.collections.getInfo Required collection_id
//    flickr.collections.createIcon Required collection_id, Required photo_ids
//    flickr.collections.removeSet Required collection_id, Required photoset_id
//    flickr.collections.delete Required collection_id, Optional recursive
//    flickr.collections.moveCollection Required collection_id, Required parent_collection_id
//    flickr.collections.editMeta Optional collection_id, Optional description, Optional title
//
//I haven't test them all, but you can test them with Firebug, just call
//
//    F.API.callMethod("flickr.collections.create", {title:"test"})
//
//from javascript command line of Firebug in one of your flickr pages.
//
//I've tested some of these with rest api with json output format from my own application, i'm not sure if they could run with other formats than json.

  if vAlbumListIDs <> '' then
    Result := ExecuteAPIMethod(Get_photosets_orderSets(vAlbumListIDs))
  else
    Result := True;

end;

function TFoldersToFlickrSyncrForm.Sync_SetFlickrPermissions: Boolean;
var
  vIsFamily, vIsFriend, vIsPublic, vPermissionAddMeta, vPermissionComment: String;
  vResponseText, vUploadedPhotoID, vTicketID: String;
begin
  Result := True;
  if FCancelSyncronization then
    Exit;

  SetTaskBarProgressState_Indeterminate(self.Handle);

  gFlickrSettings.ApplySettings(
    rgpWhoCanSee.ItemIndex = 2,
    chkWhoCanSeeFamily.Checked,
    chkWhoCanSeeFriends.Checked,
    rgpWhoCanSee.ItemIndex = 1,
    rgpWhoCanAddMeta.ItemIndex,
    rgpWhoCanComment.ItemIndex,
    rgpChooseSafetyFilter.ItemIndex + 1,
    rgpChooseSearchSetting.ItemIndex + 1);

  Result := IsFlickrAccessible;
  if not Result then
  begin
    ShowMessageDlg('Access to Flickr is not setup for Sync_GetActualFlickrPermissions', mtError, [mbOK]);
    Exit;
  end;

  if (gFlickrSettings.WhoCanSeeDefault) or (rgpWhoCanComment.ItemIndex = 4) or (rgpWhoCanAddMeta.ItemIndex = 4) then
  begin
    // 1. upload photo with default/empty permissions
    Result := PostPhotoToFlickr(
      TPath.GetFullPath(edtPlaceholderImageLocation.Text),
      '',
      'Temporary Photo to retrive default permissions',
      'Temporary Photo',
      '',
      '', //  const aIs_public: Boolean= False;
      '', //  const aIs_friend: Boolean= False;
      '', //  const aIs_family: Boolean= True;
      False, //  const aSyncMode: Boolean= False);
      vResponseText, vUploadedPhotoID, vTicketID);
    memPhotoResponse.Text := vResponseText;
    if Result then
    begin
      if vUploadedPhotoID = '' then
      begin
        Result := False;
        ShowMessageDlg('Sync_GetActualFlickrPermissions - failed to receive UploadedPhotoID', mtError, [mbOK]);
        Exit;
      end;
    end else begin
      ShowMessageDlg('Sync_GetActualFlickrPermissions - failed to upload', mtError, [mbOK]);
      Exit;
    end;

    // 2  read actual permissions with flickr.photos.getPerms
    if GetPhotoPermissions(vUploadedPhotoID, vIsFamily, vIsFriend, vIsPublic, vPermissionAddMeta, vPermissionComment) then
    begin
      Result := True;
    end else begin
      Result := False;
      ShowMessageDlg('Sync_LoadFlickrAlbums failed flickr.photos.getPerms', mtError, [mbOK]);
    end;

    // 3. delete uploaded photo flickr.photos.delete
    if not ExecuteAPIMethod(Get_photos_delete(vUploadedPhotoID)) then
    begin
      Result := False;
      ShowMessageDlg('Sync_GetActualFlickrPermissions failed flickr.photos.delete', mtError, [mbOK]);
      Exit;
    end;

    gFlickrSettings.ApplyActualSettings(
      IfThen(gFlickrSettings.WhoCanSeeDefault, vIsFamily, gFlickrSettings.IsFamily),
      IfThen(gFlickrSettings.WhoCanSeeDefault, vIsFriend, gFlickrSettings.IsFriend),
      IfThen(gFlickrSettings.WhoCanSeeDefault, vIsPublic, gFlickrSettings.IsPublic),
      IfThen(rgpWhoCanAddMeta.ItemIndex = 4, vPermissionAddMeta, gFlickrSettings.PermissionAddMeta),
      IfThen(rgpWhoCanComment.ItemIndex = 4, vPermissionComment, gFlickrSettings.PermissionComment));

  end;
end;

function TFoldersToFlickrSyncrForm.Sync_StartThreadsToProcessCollectedFolders: Boolean;
var
  vWorkFolder: TLocalFolder;
  vResumeFromIncompletedAlbums: boolean;
  vLastIncompleted: string;
begin
  FReadyToProcess := False;
  Result := True;
  if FCancelSyncronization then
    Exit;

  SetTaskBarProgressState_Indeterminate(self.Handle);

  prbProgress.Visible := True;
  prbProgress.Max := FWorkLoad.PhotosCount;
  prbProgress.Position := 0;

  LogActionActivity('--- Load Local Files Data ---');
  ActionMessage('Load Local Files Data');

  Result := IsFlickrAccessible and FSync_CollectFolderData;
  if not Result then
  begin
    ShowMessageDlg('Access to Flickr is not setup for Sync_LoadLocalFilesData', mtError, [mbOK]);
    Exit;
  end;

  if not chkResumeFromIncompletedFolders.Checked then
    FIncompletedFolders.Clear;

  edtFoldersToAlbums.Text := IntToStr(FWorkLoad.AlbumsCount);
  edtFoldersToAlbums.Update;

  vResumeFromIncompletedAlbums := chkResumeFromIncompletedFolders.Checked and (FIncompletedFolders.Count > 0);

  // if we resume processing - start processing from list of incompleted folders first
  if vResumeFromIncompletedAlbums then
  begin
    vLastIncompleted := FIncompletedFolders[0];
    for vWorkFolder in FWorkLoad.WorkCollection.ToArray do begin
      if FCancelSyncronization then
        Exit;

      if FIncompletedFolders.IndexOf(vWorkFolder.SourceFolderFullName) <> -1 then
      begin
        // place incompleted folders first
        InitializeProcessThread(vWorkFolder, ipTop)
      end else
      if CompareText(vWorkFolder.SourceFolderFullName, vLastIncompleted ) < 0 then
      begin
        // collect folders sorted in descending order from incompleted ones
        if rgpHandleFoldersOrder.ItemIndex = 1 then
          InitializeProcessThread(vWorkFolder, ipAdd);
      end else begin
        // collect folders sorted in ascending order from incompleted ones
        if rgpHandleFoldersOrder.ItemIndex = 0 then
          InitializeProcessThread(vWorkFolder, ipAdd);
      end;
    end;
  end;

  // collect all folders - duplicates will be ignored
  for vWorkFolder in FWorkLoad.WorkCollection.ToArray do begin
    if FCancelSyncronization then
      Exit;
    InitializeProcessThread(vWorkFolder, ipAdd);
  end;

  ReadyToProcess := True;

  Result := True;

end;

function TFoldersToFlickrSyncrForm.ThreadIDToIndex(const aThreadID: Cardinal): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Length(ThreadsList) - 1 do
    if ThreadsList[i] = aThreadID then
    begin
      Result := i;
      break;
    end;
end;

procedure TFoldersToFlickrSyncrForm.ThreadMessage(var Message: TMessage);

  procedure _GetSizeAsText(const aSize: Int64; out aSizeStr, aByteStr: string);
  const
    K1: Int64 = 1024;
    M1: Int64 = 1024 * 1024;
    G1: Int64 = 1024 * 1024 * 1024;
  begin
    if aSize < K1 then
    begin
      aSizeStr := FormatFloat('0', aSize);
      aByteStr := 'Bytes';
    end else if aSize < M1 then
    begin
      aSizeStr := FormatFloat(',0.00', aSize / K1);
      aByteStr := 'Kb';
    end else if aSize < G1 then
    begin
      aSizeStr := FormatFloat(',0.00', aSize / (M1));
      aByteStr := 'Mb';
    end else begin
      aSizeStr := FormatFloat(',0.00', aSize / (G1));
      aByteStr := 'Gb';
    end;
  end;

var
  vAverageSize: Int64;
  vSizeStr, vByteStr: string;
  vPhotoToProcess : PPhotoToProcess;
  vCustomMessageRecord: PCustomMessageRecord;
  vMessage: PString;
  i: integer;
begin

  try

    case Message.WParam of

      TH_SHOWPROGRESS:
        begin
          vPhotoToProcess := PPhotoToProcess(Message.LParam);
          i := ThreadIDToIndex(vPhotoToProcess^.FThreadID);
          if i <> -1 then
          begin
            grdThreadsData.Cells[2, i + 1] := vPhotoToProcess^.FTitle^;
            grdThreadsData.Cells[3, i + 1] := IntToStr(vPhotoToProcess^.FNumber);
            grdThreadsData.Cells[4, i + 1] := IntToStr(vPhotoToProcess^.FTotalPotos);
            grdThreadsData.Cells[5, i + 1] := IntToStr(vPhotoToProcess^.FNumber * 100 div vPhotoToProcess^.FTotalPotos) + '%';
          end;
          Dispose(vPhotoToProcess^.FTitle);
          Dispose(vPhotoToProcess);

          edtPhotosProcessed.Text := IntToStr(TInterlocked.Read(gPhotosProcessed));
          lblPhotosProcessedDetails.Caption := IntTostr(TInterlocked.Read(gPhotosProcessed) * 100 div FWorkLoad.PhotosCount) + '%';

          edtAlbumsProcessed.Text := IntToStr(TInterlocked.Read(gAlbumsProcessed));
          lblAlbumsProcessedDetails.Caption := IntTostr(TInterlocked.Read(gAlbumsProcessed) * 100 div FWorkLoad.AlbumsCount) + '%';

          edtPhotosUploaded.Text := IntToStr(TInterlocked.Read(gPhotoUploads));
          edtPhotoReplacments.Text := IntToStr(TInterlocked.Read(gPhotoReplacments));
          _GetSizeAsText(TInterlocked.Read(gUploadedSize), vSizeStr, vByteStr);
          edtUploadedSize.Text := vSizeStr;
          lblUploadedSizeDetails.Caption := vByteStr;

          if TInterlocked.Read(gPhotoUploads) + TInterlocked.Read(gPhotoReplacments) > 0 then
            vAverageSize := TInterlocked.Read(gUploadedSize) div (TInterlocked.Read(gPhotoUploads) + TInterlocked.Read(gPhotoReplacments))
          else
            vAverageSize := 0;

          _GetSizeAsText(vAverageSize, vSizeStr, vByteStr);
          edtAverageSize.Text := vSizeStr;
          lblAverageSizeDetails.Caption := vByteStr;

          _GetSizeAsText(TInterlocked.Read(gPhotosTotalSize), vSizeStr, vByteStr);
          edtPhotosTotalSize.Text := vSizeStr;
          lblPhotosTotalSizeDetails.Caption := vByteStr;

          edtFlickrAPICalls.Text := IntToStr(TInterlocked.Read(gFlickrApiCallsCount));
          edtErrors.Text := IntToStr(TInterlocked.Read(gErrors));
          edtResolvedErrors.Text := IntToStr(TInterlocked.Read(gResolvedErrors));

          ProgressBarPosition := TInterlocked.Read(gPhotosProcessed);

          edtSyncronizationTime.Text := FormatDateTime('HH:MM:SS', Now - gSyncronizationTime);
          edtAlbumsCreated.Text := IntToStr(TInterlocked.Read(gAlbumsCreated));
        end;

      TH_CUSTOMMESSAGE:
        begin
          vCustomMessageRecord := PCustomMessageRecord(Message.LParam);
          memErrorsLog.Lines.Add(vCustomMessageRecord^.FMsg);
          i := ThreadIDToIndex(vCustomMessageRecord^.FThreadID);
          if i <> -1 then
          begin
            ShowMessageDlg(vCustomMessageRecord^.FMsg,
              vCustomMessageRecord^.FDlgType,
              [mbOK], //vCustomMessageRecord^.FButtons,
              mbOK, //vCustomMessageRecord^.FDefaultButton,
              Max(1000, vCustomMessageRecord^.FAutoCloseTime));
          end;
          Dispose(vCustomMessageRecord);
        end;

      TH_LOG_TO_PHOTOLOG:
        begin
          vMessage := PString(Message.LParam);
          memSyncronizatioLog.Lines.Add(vMessage^);
          Dispose(vMessage);
        end;

      TH_LOG_TO_ERRORTOLOG:
        begin
          vMessage := PString(Message.LParam);
          memErrorsLog.Lines.Add(vMessage^);
          Dispose(vMessage);
        end;

      else begin
        ShowMessageDlg('ThreadMessage: Unsupported Index: ' + inttostr(Message.WParam), mtError, [mbOK]);
        Assert(False);
      end;

    end;
  except
    sleep(1);
    // do nothing - it may be rare excepton here
  end;
end;

procedure TFoldersToFlickrSyncrForm.TopFoldersChanged;
begin
  if lstTopFoldersToSyncronize.Count > 0 then
  begin
    lblFoldersWithAlbums.Caption := Format('In %d Folder(s) - %d Albums and %d Photos to Syncronize',
      [FWorkLoad.WorkCollection.Count, FWorkLoad.AlbumsCount, FWorkLoad.PhotosCount]);
    lblFoldersWithAlbums.Font.Color := clGreen;
  end else begin
    lblFoldersWithAlbums.Caption := 'Folders contain no data for Syncronization';
    lblFoldersWithAlbums.Font.Color := clRed;
  end;
end;

procedure TFoldersToFlickrSyncrForm.WebBrowserDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
var
  vStrStream: TStringStream;
  vStream: IStream;
  vPersistStreamInit: IPersistStreamInit;
  s: string;
  vMatch: System.RegularExpressions.TMatch;
begin
  if Assigned(FWebBrowser) and Assigned(FWebBrowser.Document) then
  begin
    //FWebBrowser.OnDocumentComplete := nil;

    vStrStream := TStringStream.Create('', TEncoding.UTF8);
    try
      vPersistStreamInit := FWebBrowser.Document as IPersistStreamInit;
      vStream := TStreamAdapter.Create(vStrStream, soReference);
      vPersistStreamInit.Save(vStream,true);
      s := vStrStream.DataString;

      // test - vStrStream.SaveToFile('aaa.txt');

      vMatch := System.RegularExpressions.TRegEx.Match(s, '.*You should now type this code into the application:.*"\>(\d\d\d-\d\d\d-\d\d\d){1}\<\/span\>.*',
        [roSingleLine]);
      if vMatch.Success and (vMatch.Groups.Count = 2) then
      begin
        VerifierPIN := vMatch.Groups.Item[1].Value;
        // we get it - Close the form
        FWebForm.btn_Close.Click;
      end;

    finally
      vStrStream.Free;
    end;
  end;
end;

end.
