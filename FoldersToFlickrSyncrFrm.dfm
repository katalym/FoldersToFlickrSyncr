object FoldersToFlickrSyncrForm: TFoldersToFlickrSyncrForm
  Left = 0
  Top = 0
  Caption = 'Folders To Flickr Syncronization (FoldersToFlickrSyncr)'
  ClientHeight = 804
  ClientWidth = 1070
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 1070
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 0
    object lblError: TLabel
      AlignWithMargins = True
      Left = 553
      Top = 11
      Width = 203
      Height = 19
      Margins.Left = 4
      Margins.Top = 11
      Margins.Right = 4
      Margins.Bottom = 11
      Align = alClient
      Alignment = taRightJustify
    end
    object lblLanguage: TLabel
      AlignWithMargins = True
      Left = 371
      Top = 13
      Width = 83
      Height = 13
      Margins.Left = 4
      Margins.Top = 13
      Margins.Right = 4
      Margins.Bottom = 15
      Align = alLeft
      Caption = 'Select Language:'
    end
    object btnChangeUser: TButton
      AlignWithMargins = True
      Left = 6
      Top = 7
      Width = 355
      Height = 27
      Margins.Left = 6
      Margins.Top = 7
      Margins.Right = 6
      Margins.Bottom = 7
      Action = actChangeOrCreateUser
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object btnCancelSyncronization: TButton
      AlignWithMargins = True
      Left = 766
      Top = 7
      Width = 131
      Height = 27
      Margins.Left = 6
      Margins.Top = 7
      Margins.Right = 6
      Margins.Bottom = 7
      Action = actCancelSyncronization
      Align = alRight
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object btnSyncronize: TButton
      AlignWithMargins = True
      Left = 909
      Top = 7
      Width = 155
      Height = 27
      Margins.Left = 6
      Margins.Top = 7
      Margins.Right = 6
      Margins.Bottom = 7
      Action = actSyncronize
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object cmbLanguage: TComboBox
      AlignWithMargins = True
      Left = 462
      Top = 10
      Width = 83
      Height = 21
      Margins.Left = 4
      Margins.Top = 10
      Margins.Right = 4
      Margins.Bottom = 10
      Align = alLeft
      Enabled = False
      ItemIndex = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = 'English'
      Items.Strings = (
        'English')
    end
  end
  object pnlPages: TPanel
    Left = 0
    Top = 41
    Width = 1070
    Height = 719
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter3: TSplitter
      Left = 834
      Top = 0
      Height = 719
      Align = alRight
      Visible = False
    end
    object pcPages: TPageControl
      Left = 0
      Top = 0
      Width = 834
      Height = 719
      ActivePage = tbsAuthentication
      Align = alClient
      Images = imlSupport
      TabOrder = 0
      object tbsAuthentication: TTabSheet
        Caption = 'Authentication'
        object Splitter10: TSplitter
          Left = 327
          Top = 0
          Height = 690
        end
        object grbAuthentication: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 321
          Height = 684
          Align = alLeft
          Caption = ' Authentication '
          TabOrder = 0
          object pnlAuthentication: TPanel
            Left = 2
            Top = 15
            Width = 317
            Height = 667
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              317
              667)
            object lblGetRequestTokenAndAuthCode: TLabel
              Left = 16
              Top = 13
              Width = 10
              Height = 13
              Caption = '1.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblGetAccessToken: TLabel
              Left = 16
              Top = 171
              Width = 10
              Height = 13
              Caption = '2.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblClearAccessTokenWarning: TLabel
              Left = 16
              Top = 280
              Width = 288
              Height = 59
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Caption = 
                'Warning! Clear Access token only if associated Permission was re' +
                'moved from your account or changed below "delete" access'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object btnGetRequestTokenAndAuthCode: TButton
              Left = 32
              Top = 8
              Width = 233
              Height = 25
              Action = actGetRequestTokenAndAuthCode
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
            end
            object edtVerifierPIN: TLabeledEdit
              Left = 16
              Top = 56
              Width = 182
              Height = 21
              EditLabel.Width = 231
              EditLabel.Height = 13
              EditLabel.Caption = 'Authentication-Code (from Authorization Dialog)'
              TabOrder = 0
            end
            object edtRequestToken: TLabeledEdit
              Left = 16
              Top = 96
              Width = 280
              Height = 21
              EditLabel.Width = 148
              EditLabel.Height = 13
              EditLabel.Caption = 'Request Token (oauth_token):'
              Enabled = False
              TabOrder = 1
            end
            object edtRequestTokenSecret: TLabeledEdit
              Left = 16
              Top = 136
              Width = 161
              Height = 21
              EditLabel.Width = 186
              EditLabel.Height = 13
              EditLabel.Caption = 'Request Secret (oauth_token_secret):'
              Enabled = False
              TabOrder = 2
            end
            object btnGetAccessToken: TButton
              Left = 32
              Top = 166
              Width = 121
              Height = 25
              Action = actGetAccessToken
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
            end
            object edtAccessToken: TLabeledEdit
              Left = 16
              Top = 214
              Width = 280
              Height = 21
              EditLabel.Width = 70
              EditLabel.Height = 13
              EditLabel.Caption = 'Access-Token:'
              Enabled = False
              TabOrder = 3
            end
            object edtAccessTokenSecret: TLabeledEdit
              Left = 16
              Top = 253
              Width = 161
              Height = 21
              EditLabel.Width = 105
              EditLabel.Height = 13
              EditLabel.Caption = 'Access-Token-Secret:'
              Enabled = False
              TabOrder = 4
            end
            object btnClearAccessToken: TButton
              Left = 16
              Top = 345
              Width = 129
              Height = 25
              Action = actClearAccessToken
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
            end
          end
        end
        object grbFlickrSettings: TGroupBox
          AlignWithMargins = True
          Left = 333
          Top = 3
          Width = 490
          Height = 684
          Align = alClient
          Caption = ' Flickr API Settings '
          TabOrder = 1
          object pnlFlickrAPISettings: TPanel
            AlignWithMargins = True
            Left = 2
            Top = 15
            Width = 486
            Height = 237
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            object edtConsumerKey: TLabeledEdit
              Left = 8
              Top = 16
              Width = 280
              Height = 21
              EditLabel.Width = 123
              EditLabel.Height = 13
              EditLabel.Caption = 'App Consumer Key / Key:'
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              Text = 'hardcoded - see inside the code'
            end
            object edtConsumerSecret: TLabeledEdit
              Left = 8
              Top = 56
              Width = 161
              Height = 21
              EditLabel.Width = 149
              EditLabel.Height = 13
              EditLabel.Caption = 'App Consumer Secret / Secret:'
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              Text = 'hardcoded - see inside the code'
            end
            object edtBaseURL: TLabeledEdit
              Left = 8
              Top = 96
              Width = 143
              Height = 21
              EditLabel.Width = 50
              EditLabel.Height = 13
              EditLabel.Caption = 'Base-URL:'
              Enabled = False
              ReadOnly = True
              TabOrder = 2
              Text = 'https://api.flickr.com'
            end
            object edtRESTEndpointURL: TLabeledEdit
              Left = 8
              Top = 136
              Width = 199
              Height = 21
              EditLabel.Width = 96
              EditLabel.Height = 13
              EditLabel.Caption = 'REST Endpoint URL:'
              Enabled = False
              TabOrder = 3
              Text = 'https://api.flickr.com/services/rest/'
            end
            object edtUploadingPhotosURL: TLabeledEdit
              Left = 8
              Top = 176
              Width = 199
              Height = 21
              EditLabel.Width = 109
              EditLabel.Height = 13
              EditLabel.Caption = 'Uploading Photos URL:'
              Enabled = False
              TabOrder = 4
              Text = 'https://up.flickr.com/services/upload/'
            end
            object edtReplacingPhotosURL: TLabeledEdit
              Left = 8
              Top = 216
              Width = 199
              Height = 21
              EditLabel.Width = 108
              EditLabel.Height = 13
              EditLabel.Caption = 'Replacing Photos URL:'
              Enabled = False
              TabOrder = 5
              Text = 'https://up.flickr.com/services/replace/'
            end
          end
          object btnGetCredentialsForAccessToken: TButton
            Left = 10
            Top = 259
            Width = 182
            Height = 25
            Action = actGetCredentialsForAccessToken
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object edtUserID: TLabeledEdit
            Left = 10
            Top = 303
            Width = 129
            Height = 21
            EditLabel.Width = 37
            EditLabel.Height = 13
            EditLabel.Caption = 'UserID:'
            Enabled = False
            TabOrder = 2
          end
          object edtUserAccessPermission: TLabeledEdit
            Left = 161
            Top = 303
            Width = 129
            Height = 21
            EditLabel.Width = 90
            EditLabel.Height = 13
            EditLabel.Caption = 'Access Permission:'
            Enabled = False
            TabOrder = 3
          end
          object edtUserName: TLabeledEdit
            Left = 10
            Top = 343
            Width = 161
            Height = 21
            EditLabel.Width = 53
            EditLabel.Height = 13
            EditLabel.Caption = 'UserName:'
            Enabled = False
            TabOrder = 4
          end
          object edtUserFullName: TLabeledEdit
            Left = 10
            Top = 383
            Width = 280
            Height = 21
            EditLabel.Width = 75
            EditLabel.Height = 13
            EditLabel.Caption = 'User Full Name:'
            Enabled = False
            TabOrder = 5
          end
        end
      end
      object tbsFlickrSettings: TTabSheet
        Hint = 'Flickr Settings'
        Caption = 'Flickr'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        object grbDefaultFlickrPermissionsForUploadedItems: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 566
          Height = 684
          Hint = 'Permission will not change for replacing Photos'
          Align = alLeft
          Caption = ' Default Permissions for Uploaded Photos '
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object pnlDefaultFlickrPermissionsForUploadedItems1: TPanel
            Left = 2
            Top = 15
            Width = 285
            Height = 667
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object pnlWhoCanSee: TPanel
              Left = 0
              Top = 0
              Width = 285
              Height = 93
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object rgpWhoCanSee: TRadioGroup
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 279
                Height = 87
                Align = alClient
                Caption = ' Who can see these items? '
                ItemIndex = 2
                Items.Strings = (
                  'Only You (Private)'
                  'Anyone (Public)'
                  'Default for Your account')
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = rgpWhoCanSeeClick
              end
              object chkWhoCanSeeFriends: TCheckBox
                Left = 154
                Top = 20
                Width = 87
                Height = 17
                Caption = 'Your Frinds'
                TabOrder = 0
              end
              object chkWhoCanSeeFamily: TCheckBox
                Left = 154
                Top = 38
                Width = 87
                Height = 17
                Caption = 'Your Family'
                TabOrder = 1
              end
            end
            object rgpWhoCanComment: TRadioGroup
              AlignWithMargins = True
              Left = 3
              Top = 96
              Width = 279
              Height = 128
              Align = alTop
              Caption = ' Who can comment? '
              ItemIndex = 4
              Items.Strings = (
                'Only you'
                'Your friends and family'
                'Your contacts'
                'Any Flickr member'
                'Default for Your account')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object rgpWhoCanAddMeta: TRadioGroup
              AlignWithMargins = True
              Left = 3
              Top = 230
              Width = 279
              Height = 134
              Align = alTop
              Caption = ' Who can add notes, tags, and people? '
              ItemIndex = 4
              Items.Strings = (
                'Only you'
                'Your friends and family'
                'Your Contacts (Recommended)'
                'Any Flickr member'
                'Default for Your account')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
          end
          object pnlDefaultFlickrPermissionsForUploadedItems2: TPanel
            Left = 287
            Top = 15
            Width = 277
            Height = 667
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object rgpChooseSafetyFilter: TRadioGroup
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 271
              Height = 102
              Align = alTop
              Caption = ' Choose a Safety Filter '
              ItemIndex = 3
              Items.Strings = (
                'Safe'
                'Moderate'
                'Restricted'
                'Default for Your account')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object rgpChooseSearchSetting: TRadioGroup
              AlignWithMargins = True
              Left = 3
              Top = 111
              Width = 271
              Height = 83
              Align = alTop
              Caption = ' Choose a Search Setting '
              ItemIndex = 2
              Items.Strings = (
                'Keep available for public searches'
                'Hide from public searches'
                'Default for Your account')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object grbDummyPhoto: TGroupBox
              AlignWithMargins = True
              Left = 3
              Top = 200
              Width = 271
              Height = 123
              Align = alTop
              Caption = ' Dummy/Placeholder Photo '
              TabOrder = 2
              object pnlFlickrDummyPhoto: TPanel
                Left = 2
                Top = 15
                Width = 267
                Height = 99
                Align = alTop
                AutoSize = True
                BevelOuter = bvNone
                TabOrder = 0
                object pnlPlaceholderImageLocation: TPanel
                  AlignWithMargins = True
                  Left = 0
                  Top = 6
                  Width = 267
                  Height = 41
                  Margins.Left = 0
                  Margins.Top = 6
                  Margins.Right = 0
                  Margins.Bottom = 4
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  DesignSize = (
                    267
                    41)
                  object edtPlaceholderImageLocation: TLabeledEdit
                    Left = 8
                    Top = 15
                    Width = 235
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 170
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Location of Placeholder Image (jpg)'
                    TabOrder = 0
                  end
                  object btnLocateDummyPlaceholder: TButton
                    AlignWithMargins = True
                    Left = 243
                    Top = 15
                    Width = 21
                    Height = 21
                    Margins.Top = 15
                    Margins.Bottom = 5
                    Action = actLocateDummyPlaceholder
                    Align = alRight
                    TabOrder = 1
                  end
                end
                object pnlFlickrDummyPhotoInfo: TPanel
                  Left = 0
                  Top = 51
                  Width = 267
                  Height = 48
                  Align = alTop
                  AutoSize = True
                  BevelOuter = bvNone
                  TabOrder = 1
                  object lblPlaceholderImageLocation: TLabel
                    AlignWithMargins = True
                    Left = 8
                    Top = 3
                    Width = 250
                    Height = 42
                    Margins.Left = 8
                    Align = alTop
                    Caption = 
                      'Placeholder Image is necessary if you wish to use "Default for Y' +
                      'our account" settings for Flickr Permissions'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                end
              end
            end
          end
        end
      end
      object tbsPicasaSettings: TTabSheet
        Hint = 'Picasa Settings'
        Caption = 'Picasa'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        object Splitter8: TSplitter
          Left = 273
          Top = 0
          Height = 690
        end
        object pnlPicasa: TPanel
          Left = 0
          Top = 0
          Width = 273
          Height = 690
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object grbPicasa: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 267
            Height = 278
            Hint = 'Photos which located in folder which contains .picasa.ini file'
            Align = alTop
            Caption = ' Permissions based on Picasa '
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object lblPhotosfromfolder: TLabel
              AlignWithMargins = True
              Left = 10
              Top = 69
              Width = 252
              Height = 13
              Margins.Left = 8
              Align = alTop
              Caption = 'Photos from folder which contais .picasa.ini file:'
              WordWrap = True
            end
            object pnlPicasaContacts: TPanel
              AlignWithMargins = True
              Left = 2
              Top = 21
              Width = 263
              Height = 41
              Margins.Left = 0
              Margins.Top = 6
              Margins.Right = 0
              Margins.Bottom = 4
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                263
                41)
              object edtPicasaContacts: TLabeledEdit
                Left = 8
                Top = 15
                Width = 231
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                EditLabel.Width = 171
                EditLabel.Height = 13
                EditLabel.Caption = 'Location of Picasa contacts.xml file:'
                TabOrder = 0
                Text = 'contacts.xml'
                OnChange = edtPicasaContactsChange
              end
              object btnLocatePicasaContactsXML: TButton
                AlignWithMargins = True
                Left = 239
                Top = 15
                Width = 21
                Height = 21
                Margins.Top = 15
                Margins.Bottom = 5
                Action = actLocatePicasaContactsXML
                Align = alRight
                TabOrder = 1
              end
            end
            object pnlPermissionsForPhotosWithFacesInContacts: TPanel
              Left = 2
              Top = 85
              Width = 263
              Height = 86
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object rgpPermissionsForPhotosWithFaces: TRadioGroup
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 257
                Height = 80
                Align = alClient
                Caption = ' Photos WITH faces '
                ItemIndex = 2
                Items.Strings = (
                  'Only You (Private)'
                  'Anyone (Public)'
                  'Do Not Apply')
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = rgpPermissionsForPhotosWithFacesClick
              end
              object chkPicasaContactsFriends: TCheckBox
                Left = 154
                Top = 20
                Width = 87
                Height = 17
                Margins.Top = 6
                Margins.Right = 4
                Margins.Bottom = 12
                Caption = 'Your Frinds'
                TabOrder = 0
              end
              object chkPicasaContactsFamily: TCheckBox
                Left = 154
                Top = 38
                Width = 87
                Height = 17
                Margins.Top = 6
                Margins.Right = 4
                Margins.Bottom = 12
                Caption = 'Your Family'
                TabOrder = 1
              end
            end
            object pnlPicasaPermissions: TPanel
              Left = 2
              Top = 171
              Width = 263
              Height = 86
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 2
              object rgpPermissionsForPhotosWithOutFaces: TRadioGroup
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 257
                Height = 80
                Hint = 
                  ' Permission for Photos WITHOUT faces in Picasa Contacts for fold' +
                  'er with .picasa.ini file present '
                Align = alTop
                Caption = ' Photos WITHOUT faces '
                ItemIndex = 2
                Items.Strings = (
                  'Only You (Private)'
                  'Anyone (Public)'
                  'Do Not Apply')
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = rgpPermissionsForPhotosWithOutFacesClick
              end
              object chkPicasaNoContactsFriends: TCheckBox
                Left = 154
                Top = 20
                Width = 87
                Height = 17
                Margins.Top = 6
                Margins.Right = 4
                Margins.Bottom = 12
                Caption = 'Your Frinds'
                TabOrder = 0
              end
              object chkPicasaNoContactsFamily: TCheckBox
                Left = 154
                Top = 38
                Width = 87
                Height = 17
                Margins.Top = 6
                Margins.Right = 4
                Margins.Bottom = 12
                Caption = 'Your Family'
                TabOrder = 1
              end
            end
          end
          object grbPicasaPeopleToAlbum: TGroupBox
            Left = 0
            Top = 284
            Width = 273
            Height = 105
            Align = alTop
            Caption = ' Picasa People - to Album '
            TabOrder = 1
            object lblPeopleAlbumName: TLabel
              AlignWithMargins = True
              Left = 10
              Top = 45
              Width = 63
              Height = 13
              Margins.Left = 8
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              Caption = 'Album Name:'
              FocusControl = edtPeopleAlbumName
            end
            object chkPicasaPeopleToAlbum: TCheckBox
              AlignWithMargins = True
              Left = 10
              Top = 21
              Width = 261
              Height = 17
              Margins.Left = 8
              Margins.Top = 6
              Margins.Right = 0
              Align = alTop
              Caption = 'Extract Picasa People to separate Album'
              TabOrder = 0
            end
            object edtPeopleAlbumName: TEdit
              AlignWithMargins = True
              Left = 10
              Top = 64
              Width = 253
              Height = 21
              Margins.Left = 8
              Margins.Top = 2
              Margins.Right = 8
              Margins.Bottom = 5
              Align = alTop
              ReadOnly = True
              TabOrder = 1
              Text = 'People'
            end
          end
        end
        object grbPicasaContacts: TGroupBox
          AlignWithMargins = True
          Left = 279
          Top = 3
          Width = 544
          Height = 684
          Align = alClient
          Caption = ' Picasa Contacts '
          TabOrder = 1
          object trvPicasaContacts: TTreeView
            Left = 2
            Top = 15
            Width = 540
            Height = 667
            Align = alClient
            Indent = 19
            ReadOnly = True
            SortType = stText
            TabOrder = 0
          end
        end
      end
      object tbsUploadSetting: TTabSheet
        Hint = 'Upload Setting'
        Caption = 'Upload Setting'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        object scbSettings: TScrollBox
          Left = 0
          Top = 0
          Width = 826
          Height = 690
          Align = alClient
          AutoSize = True
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          ParentBackground = True
          TabOrder = 0
          object Splitter7: TSplitter
            Left = 823
            Top = 0
            Height = 690
            Align = alRight
          end
          object Splitter1: TSplitter
            Left = 532
            Top = 0
            Height = 690
            Align = alRight
          end
          object grbApplicationUploadSettings: TGroupBox
            AlignWithMargins = True
            Left = 538
            Top = 3
            Width = 282
            Height = 684
            Align = alRight
            Caption = ' Rules to process Albums and Photos'
            TabOrder = 0
            object grbActions: TGroupBox
              AlignWithMargins = True
              Left = 5
              Top = 18
              Width = 272
              Height = 70
              Align = alTop
              Caption = ' Album Actions  '
              TabOrder = 0
              object chkProcessDoNotDeleteUnknownAlbums: TCheckBox
                AlignWithMargins = True
                Left = 10
                Top = 21
                Width = 256
                Height = 17
                Margins.Left = 8
                Margins.Top = 6
                Margins.Right = 4
                Align = alTop
                Caption = 'Do not delete Unknown albums on Flickr'
                TabOrder = 0
              end
              object chkDoNotUnlinkUnknownPhotosFromAlbum: TCheckBox
                AlignWithMargins = True
                Left = 10
                Top = 44
                Width = 256
                Height = 17
                Margins.Left = 8
                Margins.Right = 4
                Align = alTop
                BiDiMode = bdLeftToRight
                Caption = 'Do not unlink Unknown Photos from Album'
                ParentBiDiMode = False
                TabOrder = 1
              end
            end
            object grbResizeRules: TGroupBox
              AlignWithMargins = True
              Left = 5
              Top = 147
              Width = 272
              Height = 174
              Align = alTop
              Caption = ' Upload Resized Photos instead of Originals '
              TabOrder = 2
              object chkResize: TCheckBox
                AlignWithMargins = True
                Left = 10
                Top = 18
                Width = 257
                Height = 17
                Hint = 
                  'Original photos will not be modified, Resized one will be create' +
                  'd for upload'
                Margins.Left = 8
                Margins.Bottom = 8
                Align = alTop
                Caption = 'Resize if any of the dimensions exceeds:'
                Checked = True
                State = cbChecked
                TabOrder = 0
              end
              object pnlResizeLimits: TPanel
                Left = 2
                Top = 43
                Width = 268
                Height = 42
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object edtResizeWidth: TLabeledEdit
                  Left = 8
                  Top = 15
                  Width = 44
                  Height = 21
                  Margins.Left = 6
                  Margins.Right = 6
                  Margins.Bottom = 4
                  Alignment = taRightJustify
                  EditLabel.Width = 32
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Width:'
                  TabOrder = 0
                  Text = '1920'
                end
                object edtResizeHeight: TLabeledEdit
                  Left = 65
                  Top = 15
                  Width = 44
                  Height = 21
                  Margins.Left = 6
                  Margins.Right = 6
                  Margins.Bottom = 4
                  Alignment = taRightJustify
                  EditLabel.Width = 35
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Height:'
                  TabOrder = 1
                  Text = '1200'
                end
                object edtResizeFileSize: TLabeledEdit
                  Left = 124
                  Top = 15
                  Width = 44
                  Height = 21
                  Margins.Left = 6
                  Margins.Right = 6
                  Margins.Bottom = 4
                  EditLabel.Width = 89
                  EditLabel.Height = 13
                  EditLabel.Caption = 'File Size in KBytes:'
                  TabOrder = 2
                  Text = '300'
                end
              end
              object pnlJpegQuality: TGridPanel
                Left = 2
                Top = 85
                Width = 268
                Height = 24
                Align = alTop
                BevelOuter = bvNone
                ColumnCollection = <
                  item
                    SizeStyle = ssAuto
                    Value = 50.000000000000000000
                  end
                  item
                    SizeStyle = ssAuto
                    Value = 100.000000000000000000
                  end>
                ControlCollection = <
                  item
                    Column = 1
                    Control = edtResizeJpgQuality
                    Row = 0
                  end
                  item
                    Column = 0
                    Row = 1
                  end
                  item
                    Column = 0
                    Control = lblResizeJpgQuality
                    Row = 0
                  end
                  item
                    Column = 1
                    Row = 1
                  end>
                RowCollection = <
                  item
                    Value = 100.000000000000000000
                  end>
                TabOrder = 2
                object edtResizeJpgQuality: TEdit
                  AlignWithMargins = True
                  Left = 184
                  Top = 0
                  Width = 34
                  Height = 21
                  Margins.Left = 4
                  Margins.Top = 0
                  Margins.Right = 4
                  Align = alLeft
                  MaxLength = 2
                  TabOrder = 0
                  Text = '75'
                end
                object lblResizeJpgQuality: TLabel
                  AlignWithMargins = True
                  Left = 8
                  Top = 3
                  Width = 168
                  Height = 13
                  Margins.Left = 8
                  Margins.Right = 4
                  Margins.Bottom = 8
                  Align = alLeft
                  Caption = 'Jpeg quality for resized pictures%:'
                end
              end
              object pnlSaveResized: TPanel
                Left = 2
                Top = 109
                Width = 268
                Height = 53
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 3
                object chkSaveResizedPhotosFolder: TCheckBox
                  AlignWithMargins = True
                  Left = 8
                  Top = 4
                  Width = 257
                  Height = 17
                  Margins.Left = 8
                  Margins.Top = 4
                  Margins.Bottom = 2
                  Align = alTop
                  Caption = 'Save Resized Photos at Folder'
                  TabOrder = 0
                end
                object pnlSaveResizedEdit: TPanel
                  Left = 0
                  Top = 23
                  Width = 268
                  Height = 30
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 1
                  object btnSaveResizedPhotosFolder: TButton
                    AlignWithMargins = True
                    Left = 244
                    Top = 6
                    Width = 21
                    Height = 21
                    Margins.Left = 0
                    Margins.Top = 6
                    Action = actSaveResizedPhotosFolder
                    Align = alRight
                    TabOrder = 0
                  end
                  object edtSaveResizedPhotosFolder: TEdit
                    AlignWithMargins = True
                    Left = 8
                    Top = 6
                    Width = 236
                    Height = 21
                    Margins.Left = 8
                    Margins.Top = 6
                    Margins.Right = 0
                    Align = alClient
                    TabOrder = 1
                  end
                end
              end
            end
            object rgpPriorityPermissions: TRadioGroup
              AlignWithMargins = True
              Left = 5
              Top = 327
              Width = 272
              Height = 47
              Hint = 'Priority to apply Permissions as set on "Flickr Setting" tab'
              Align = alTop
              Caption = ' Priority to Set Permission for Photo '
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Flickr Setting'
                'Picasa Settings')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object grbApplyPermissionChanges: TGroupBox
              AlignWithMargins = True
              Left = 5
              Top = 380
              Width = 272
              Height = 66
              Align = alTop
              Caption = ' Apply Permission Changes '
              TabOrder = 4
              object chkApplyPermissionsChanges: TCheckBox
                AlignWithMargins = True
                Left = 10
                Top = 18
                Width = 257
                Height = 21
                Hint = 'Apply Permissions Changes to Existed Photos'
                Margins.Left = 8
                Margins.Bottom = 0
                Align = alTop
                Caption = 'To Existed Photos'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
              object chkEnforceSyncrIniPermissions: TCheckBox
                AlignWithMargins = True
                Left = 10
                Top = 39
                Width = 257
                Height = 21
                Hint = 
                  'Enforce Permissions Stored in <user>_syncr.ini files to Existed ' +
                  'Photos'
                Margins.Left = 8
                Margins.Top = 0
                Align = alTop
                Caption = 'Stored in <user>_syncr.ini files'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
              end
            end
            object rgpPriorityTitle: TRadioGroup
              AlignWithMargins = True
              Left = 5
              Top = 452
              Width = 272
              Height = 60
              Hint = 'CaptionOrAbstract tag. Will be ignored if it is empty'
              Align = alTop
              Caption = ' Priority to Set Title for Photo '
              ItemIndex = 0
              Items.Strings = (
                'CaptionOrAbstract tag From EXIF'
                'File Name without extension')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
            end
            object grbPriorityDescriptionForPhoto: TGroupBox
              AlignWithMargins = True
              Left = 5
              Top = 518
              Width = 272
              Height = 43
              Align = alTop
              Caption = ' Set Description '
              TabOrder = 6
              object chkSetImageDescription: TCheckBox
                AlignWithMargins = True
                Left = 10
                Top = 18
                Width = 257
                Height = 20
                Margins.Left = 8
                Align = alClient
                Caption = 'Use ImageDescription tag from EXIF'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
            end
            object rgpFlickrAlbumsSortOrder: TRadioGroup
              AlignWithMargins = True
              Left = 5
              Top = 94
              Width = 272
              Height = 47
              Hint = 'Sort Flickr Albums in order'
              Align = alTop
              Caption = ' Sort Flickr Albums in order '
              Columns = 2
              ItemIndex = 1
              Items.Strings = (
                'Ascending'
                'Descending')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object pnlTopFolders: TPanel
            Left = 0
            Top = 0
            Width = 532
            Height = 690
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object grbTopFoldersToSyncronize: TGroupBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 526
              Height = 410
              Align = alClient
              Caption = ' Local Folders To Syncronize (subfolders included) '
              TabOrder = 0
              object lstTopFoldersToSyncronize: TListBox
                Left = 2
                Top = 90
                Width = 522
                Height = 318
                Align = alClient
                ItemHeight = 13
                PopupMenu = mnuTopFoldersToSyncronize
                Sorted = True
                TabOrder = 1
              end
              object pnlFolderActions: TPanel
                Left = 2
                Top = 15
                Width = 522
                Height = 75
                Align = alTop
                BevelOuter = bvNone
                Color = clMoneyGreen
                ParentBackground = False
                TabOrder = 0
                object btnRemoveFolderFromSyncronization: TButton
                  AlignWithMargins = True
                  Left = 151
                  Top = 7
                  Width = 116
                  Height = 25
                  Margins.Top = 7
                  Margins.Bottom = 7
                  Action = actRemoveFolderFromSyncronization
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                end
                object btnAddFolderToSycncronization: TButton
                  AlignWithMargins = True
                  Left = 3
                  Top = 6
                  Width = 116
                  Height = 27
                  Margins.Top = 6
                  Margins.Bottom = 6
                  Action = actAddFolderToSycncronization
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                end
                object rgpHandleFoldersOrder: TRadioGroup
                  AlignWithMargins = True
                  Left = 336
                  Top = 3
                  Width = 183
                  Height = 69
                  Hint = 'Collect and Process folders/subfolder in order'
                  Align = alRight
                  Caption = ' Process subfolder in order '
                  ItemIndex = 1
                  Items.Strings = (
                    'Ascending'
                    'Descending')
                  Constraints.MaxHeight = 69
                  ParentBackground = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                end
                object chkResumeFromIncompletedFolders: TCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 36
                  Width = 206
                  Height = 17
                  Hint = 'Resume from Last unprocessed Folders'
                  Margins.Left = 8
                  Margins.Right = 4
                  Caption = 'Resume from Last incompleted Folders'
                  Checked = True
                  State = cbChecked
                  TabOrder = 2
                end
                object chkIgnoreArchivedFlag: TCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 55
                  Width = 131
                  Height = 17
                  Hint = 'Ignore Archived= flag set in [Album] section of f ini files'
                  Margins.Left = 8
                  Margins.Right = 4
                  BiDiMode = bdLeftToRight
                  Caption = 'Ignore "Archived" flag'
                  ParentBiDiMode = False
                  TabOrder = 4
                end
              end
            end
            object pnlFilters: TPanel
              Left = 0
              Top = 416
              Width = 532
              Height = 274
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              OnResize = pnlFiltersResize
              object grbFolderFilters: TGroupBox
                Left = 0
                Top = 0
                Width = 274
                Height = 274
                Align = alLeft
                Caption = ' Folder Filter '
                TabOrder = 1
                object grbIncludeFolders: TGroupBox
                  AlignWithMargins = True
                  Left = 2
                  Top = 19
                  Width = 270
                  Height = 117
                  Hint = 'Include Subfolders - regular expression supported'
                  Margins.Left = 0
                  Margins.Top = 4
                  Margins.Right = 0
                  Margins.Bottom = 0
                  Align = alClient
                  Caption = ' Include Subfolders by Patterns - regular expression supported '
                  TabOrder = 0
                  object memIncludeFiles: TMemo
                    Left = 2
                    Top = 15
                    Width = 266
                    Height = 100
                    Align = alClient
                    Lines.Strings = (
                      '.*')
                    ScrollBars = ssBoth
                    TabOrder = 0
                    WordWrap = False
                  end
                end
                object grbExcludeFolders: TGroupBox
                  AlignWithMargins = True
                  Left = 2
                  Top = 140
                  Width = 270
                  Height = 132
                  Hint = 'Exclude Subfolders - regular expression supported'
                  Margins.Left = 0
                  Margins.Top = 4
                  Margins.Right = 0
                  Margins.Bottom = 0
                  Align = alBottom
                  Caption = ' Exclude Subfolders by Patterns - regular expression supported '
                  TabOrder = 1
                  object memExcludeFiles: TMemo
                    Left = 2
                    Top = 15
                    Width = 266
                    Height = 115
                    Align = alClient
                    Lines.Strings = (
                      '^DNG$'
                      '^Panoramas$'
                      '.*wedding.*'
                      '.*document.*')
                    ScrollBars = ssBoth
                    TabOrder = 0
                    WordWrap = False
                  end
                end
              end
              object grbPicasaContactsFilters: TGroupBox
                Left = 274
                Top = 0
                Width = 258
                Height = 274
                Align = alClient
                Caption = ' Picasa Contacts Filter '
                TabOrder = 0
                object grbExcludeContacts: TGroupBox
                  AlignWithMargins = True
                  Left = 2
                  Top = 140
                  Width = 254
                  Height = 132
                  Hint = 'Exclude Photos with selected Contacts'
                  Margins.Left = 0
                  Margins.Top = 4
                  Margins.Right = 0
                  Margins.Bottom = 0
                  Align = alBottom
                  Caption = ' Exclude Photos with selected Contacts '
                  TabOrder = 0
                  object chbExcludeContacts: TCheckListBox
                    Left = 2
                    Top = 15
                    Width = 250
                    Height = 115
                    Align = alClient
                    Enabled = False
                    ItemHeight = 13
                    TabOrder = 0
                  end
                end
                object grbIncludeContacts: TGroupBox
                  AlignWithMargins = True
                  Left = 2
                  Top = 19
                  Width = 254
                  Height = 117
                  Hint = ' Include Photos with selected Contacts'
                  Margins.Left = 0
                  Margins.Top = 4
                  Margins.Right = 0
                  Margins.Bottom = 0
                  Align = alClient
                  Caption = ' Include Photos with selected Contacts'
                  TabOrder = 1
                  object chbIncludeContacts: TCheckListBox
                    Left = 2
                    Top = 15
                    Width = 250
                    Height = 100
                    Align = alClient
                    Enabled = False
                    ItemHeight = 13
                    TabOrder = 0
                  end
                end
              end
            end
          end
        end
      end
      object tbsSyncronizationMonitor: TTabSheet
        Hint = 'Syncronization'
        Caption = 'Syncronization'
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        object pnlSyncronizationJob: TPanel
          Left = 0
          Top = 0
          Width = 826
          Height = 690
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter6: TSplitter
            Left = 0
            Top = 445
            Width = 826
            Height = 3
            Cursor = crVSplit
            Align = alBottom
          end
          object grbPhotosProcessed: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 820
            Height = 439
            Align = alClient
            Caption = ' Photos/Albums Processed '
            TabOrder = 0
            object memSyncronizatioLog: TMemo
              Left = 2
              Top = 15
              Width = 816
              Height = 422
              Align = alClient
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 0
              WordWrap = False
            end
          end
          object grdThreadsData: TStringGrid
            AlignWithMargins = True
            Left = 3
            Top = 451
            Width = 820
            Height = 236
            Align = alBottom
            ColCount = 6
            DefaultColWidth = 58
            DefaultRowHeight = 20
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
            TabOrder = 1
            ColWidths = (
              58
              417
              163
              68
              45
              39)
            RowHeights = (
              20
              20)
          end
        end
      end
      object tbsLogs: TTabSheet
        Hint = 'Activity & Errors'
        Caption = 'Log'
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
        object Splitter5: TSplitter
          Left = 0
          Top = 243
          Width = 826
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object grbErrors: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 249
          Width = 820
          Height = 438
          Align = alClient
          Caption = ' Errors && Warnings '
          TabOrder = 0
          object memErrorsLog: TMemo
            Left = 2
            Top = 15
            Width = 816
            Height = 421
            Align = alClient
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
            WordWrap = False
          end
        end
        object pnlClearLogs: TPanel
          Left = 0
          Top = 0
          Width = 826
          Height = 39
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object btnClearLogs: TButton
            AlignWithMargins = True
            Left = 3
            Top = 7
            Width = 137
            Height = 25
            Margins.Top = 7
            Margins.Bottom = 7
            Action = actClearLogs
            Align = alLeft
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
        object pnlActionsPerformed: TPanel
          Left = 0
          Top = 39
          Width = 826
          Height = 204
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object grbOperations: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 820
            Height = 198
            Align = alClient
            Caption = ' Actions Performed '
            TabOrder = 0
            object memActionsLog: TMemo
              Left = 2
              Top = 15
              Width = 816
              Height = 181
              Align = alClient
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
      end
      object tbsFoldersToSyncronize: TTabSheet
        Hint = 'Folders & Albums'
        Caption = 'Folders && Albums'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        object Splitter2: TSplitter
          Left = 439
          Top = 0
          Height = 690
          Align = alRight
        end
        object pnlScanFolders: TPanel
          Left = 0
          Top = 0
          Width = 439
          Height = 690
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object lblFoldersWithAlbums: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 674
            Width = 433
            Height = 13
            Align = alBottom
            Alignment = taCenter
            Caption = 'Folders To Syncronize: #'
          end
          object lblAlbumsFromFoldersBottom: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 287
            Width = 433
            Height = 13
            Align = alTop
            Alignment = taCenter
            Caption = 'Albums from Folders'
            WordWrap = True
          end
          object Splitter4: TSplitter
            Left = 0
            Top = 303
            Width = 439
            Height = 3
            Cursor = crVSplit
            Align = alTop
          end
          object grbFoldersAndPhotos: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 309
            Width = 433
            Height = 359
            Align = alClient
            Caption = ' List of Folders (number of photos  to process) '
            TabOrder = 1
            object trvFolderStructure: TTreeView
              Left = 2
              Top = 15
              Width = 429
              Height = 342
              Align = alClient
              Indent = 19
              ReadOnly = True
              SortType = stText
              TabOrder = 0
            end
          end
          object grbAlbumsfromFolders: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 433
            Height = 278
            Align = alTop
            Caption = ' Albums from Folders '
            TabOrder = 0
            object lstAlbumsFromFolders: TListBox
              Left = 2
              Top = 54
              Width = 429
              Height = 222
              Align = alClient
              BiDiMode = bdLeftToRight
              ItemHeight = 13
              ParentBiDiMode = False
              TabOrder = 1
            end
            object pnlFoldersControl: TPanel
              Left = 2
              Top = 15
              Width = 429
              Height = 39
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object btnPrepareFolderStructure: TButton
                AlignWithMargins = True
                Left = 3
                Top = 7
                Width = 190
                Height = 25
                Hint = 'Scan Local Folders To Syncronize (subfolders included) '
                Margins.Top = 7
                Margins.Bottom = 7
                Action = actPrepareFolderStructure
                Align = alLeft
                Caption = 'Scan Local Folders To Syncronize'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
            end
          end
        end
        object pnlFlickrAlbums: TPanel
          Left = 442
          Top = 0
          Width = 384
          Height = 690
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object lblAlbumsonFlickrBottom: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 674
            Width = 378
            Height = 13
            Align = alBottom
            Alignment = taCenter
            Caption = 'Albums on Flickr'
            WordWrap = True
          end
          object grbAlbumsonFlickr: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 378
            Height = 665
            Align = alClient
            Caption = ' Albums on Flickr '
            TabOrder = 0
            object lstAlbums: TListBox
              Left = 2
              Top = 54
              Width = 374
              Height = 609
              Align = alClient
              ItemHeight = 13
              TabOrder = 1
            end
            object pnlLoadFlickrAlbums: TPanel
              Left = 2
              Top = 15
              Width = 374
              Height = 39
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object btnLoadFlickrAlbums: TButton
                AlignWithMargins = True
                Left = 3
                Top = 7
                Width = 78
                Height = 25
                Margins.Top = 7
                Margins.Bottom = 7
                Action = actLoadFlickrAlbums
                Align = alLeft
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
            end
          end
        end
      end
      object tbsFlickrAPICalls: TTabSheet
        Caption = 'Flickr API Calls'
        ImageIndex = 1
        object grbFlickrAPICalls: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 820
          Height = 684
          Align = alClient
          Caption = ' Flickr API Calls '
          TabOrder = 0
          object memFlickrLog: TMemo
            Left = 2
            Top = 15
            Width = 816
            Height = 667
            Align = alClient
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object tbsDevelopment: TTabSheet
        Caption = 'Development'
        ImageIndex = 7
        object pcDevelopment: TPageControl
          Left = 0
          Top = 0
          Width = 826
          Height = 690
          ActivePage = tbsApiCalls
          Align = alClient
          TabOrder = 0
          object tbsApiCalls: TTabSheet
            Caption = 'API Calls'
            ImageIndex = 3
            object pnlTestButtons: TPanel
              Left = 0
              Top = 0
              Width = 507
              Height = 662
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object pcResponse: TPageControl
                AlignWithMargins = True
                Left = 3
                Top = 137
                Width = 501
                Height = 522
                ActivePage = tbsResponseContent
                Align = alClient
                TabOrder = 0
                object tbsResponseContent: TTabSheet
                  Caption = ' Responce Content '
                  object memResponceContent: TMemo
                    Left = 0
                    Top = 0
                    Width = 493
                    Height = 494
                    Align = alClient
                    ScrollBars = ssBoth
                    TabOrder = 0
                  end
                end
                object tbsResponseErrorMessage: TTabSheet
                  Caption = 'Error Message'
                  ImageIndex = 1
                  object memResponseErrorMessage: TMemo
                    Left = 0
                    Top = 0
                    Width = 493
                    Height = 494
                    Align = alClient
                    ScrollBars = ssBoth
                    TabOrder = 0
                  end
                end
                object tbsSortAlbums: TTabSheet
                  Caption = 'List of Album IDs for "SortAlbums"'
                  ImageIndex = 2
                  object memSortAlbums: TMemo
                    Left = 0
                    Top = 0
                    Width = 493
                    Height = 494
                    Align = alClient
                    Lines.Strings = (
                      
                        '72157701749209922,72157703564147371,72157701749236922,7215770504' +
                        '9824304,721577050'
                      '21373465')
                    ScrollBars = ssBoth
                    TabOrder = 0
                  end
                end
              end
              object pnlTestHeader: TPanel
                Left = 0
                Top = 0
                Width = 507
                Height = 134
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object btnTestEcho: TButton
                  Left = 8
                  Top = 8
                  Width = 81
                  Height = 25
                  Action = actTestEcho
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                end
                object btnTestLogin: TButton
                  Left = 8
                  Top = 39
                  Width = 81
                  Height = 25
                  Action = actTestLogin
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                end
                object edtStatusText: TLabeledEdit
                  Left = 126
                  Top = 58
                  Width = 85
                  Height = 21
                  EditLabel.Width = 56
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Status Text'
                  ReadOnly = True
                  TabOrder = 2
                end
                object edtResponseStatusCode: TLabeledEdit
                  Left = 238
                  Top = 58
                  Width = 51
                  Height = 21
                  Alignment = taRightJustify
                  EditLabel.Width = 59
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Status Code'
                  ReadOnly = True
                  TabOrder = 3
                  Text = '0'
                end
                object btnTestSelected: TButton
                  Left = 126
                  Top = 8
                  Width = 259
                  Height = 25
                  Action = actTestSelected
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 4
                end
                object btnGetPhotosetList: TButton
                  Left = 8
                  Top = 70
                  Width = 105
                  Height = 25
                  Action = actGetPhotosetList
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 6
                end
                object edtLastApiCallMethodName: TLabeledEdit
                  Left = 326
                  Top = 58
                  Width = 174
                  Height = 21
                  EditLabel.Width = 121
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Last API Metod executed'
                  ReadOnly = True
                  TabOrder = 5
                end
                object btnCreateAlbum: TButton
                  Left = 8
                  Top = 101
                  Width = 207
                  Height = 25
                  Action = actCreateAlbum
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 8
                end
                object btnSortAlbums: TButton
                  Left = 238
                  Top = 101
                  Width = 89
                  Height = 25
                  Action = actSortAlbums
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 7
                end
              end
            end
            object lstAPICalls: TListBox
              AlignWithMargins = True
              Left = 510
              Top = 3
              Width = 305
              Height = 656
              Align = alRight
              ItemHeight = 13
              Items.Strings = (
                'API Methods:'
                ''
                'activity'
                ''
                '    flickr.activity.userComments'
                '    flickr.activity.userPhotos'
                ''
                'auth.oauth'
                ''
                '    flickr.auth.oauth.checkToken'
                '    flickr.auth.oauth.getAccessToken'
                ''
                'blogs'
                ''
                '    flickr.blogs.getList'
                '    flickr.blogs.getServices'
                '    flickr.blogs.postPhoto'
                ''
                'cameras'
                ''
                '    flickr.cameras.getBrandModels'
                '    flickr.cameras.getBrands'
                ''
                'collections'
                ''
                '    flickr.collections.getInfo'
                '    flickr.collections.getTree'
                ''
                'commons'
                ''
                '    flickr.commons.getInstitutions'
                ''
                'contacts'
                ''
                '    flickr.contacts.getList'
                '    flickr.contacts.getListRecentlyUploaded'
                '    flickr.contacts.getPublicList'
                '    flickr.contacts.getTaggingSuggestions'
                ''
                'favorites'
                ''
                '    flickr.favorites.add'
                '    flickr.favorites.getContext'
                '    flickr.favorites.getList'
                '    flickr.favorites.getPublicList'
                '    flickr.favorites.remove'
                ''
                'galleries'
                ''
                '    flickr.galleries.addPhoto'
                '    flickr.galleries.create'
                '    flickr.galleries.editMeta'
                '    flickr.galleries.editPhoto'
                '    flickr.galleries.editPhotos'
                '    flickr.galleries.getInfo'
                '    flickr.galleries.getList'
                '    flickr.galleries.getListForPhoto'
                '    flickr.galleries.getPhotos'
                ''
                'groups'
                ''
                '    flickr.groups.browse'
                '    flickr.groups.getInfo'
                '    flickr.groups.join'
                '    flickr.groups.joinRequest'
                '    flickr.groups.leave'
                '    flickr.groups.search'
                ''
                'groups.discuss.replies'
                ''
                '    flickr.groups.discuss.replies.add'
                '    flickr.groups.discuss.replies.delete'
                '    flickr.groups.discuss.replies.edit'
                '    flickr.groups.discuss.replies.getInfo'
                '    flickr.groups.discuss.replies.getList'
                ''
                'groups.discuss.topics'
                ''
                '    flickr.groups.discuss.topics.add'
                '    flickr.groups.discuss.topics.getInfo'
                '    flickr.groups.discuss.topics.getList'
                ''
                'groups.members'
                ''
                '    flickr.groups.members.getList'
                ''
                'groups.pools'
                ''
                '    flickr.groups.pools.add'
                '    flickr.groups.pools.getContext'
                '    flickr.groups.pools.getGroups'
                '    flickr.groups.pools.getPhotos'
                '    flickr.groups.pools.remove'
                ''
                'interestingness'
                ''
                '    flickr.interestingness.getList'
                ''
                'machinetags'
                ''
                '    flickr.machinetags.getNamespaces'
                '    flickr.machinetags.getPairs'
                '    flickr.machinetags.getPredicates'
                '    flickr.machinetags.getRecentValues'
                '    flickr.machinetags.getValues'
                ''
                'panda'
                ''
                '    flickr.panda.getList'
                '    flickr.panda.getPhotos'
                ''
                'people'
                ''
                '    flickr.people.findByEmail'
                '    flickr.people.findByUsername'
                '    flickr.people.getGroups'
                '    flickr.people.getInfo'
                '    flickr.people.getLimits'
                '    flickr.people.getPhotos'
                '    flickr.people.getPhotosOf'
                '    flickr.people.getPublicGroups'
                '    flickr.people.getPublicPhotos'
                '    flickr.people.getUploadStatus'
                ''
                'photos'
                ''
                '    flickr.photos.addTags'
                '    flickr.photos.delete'
                '    flickr.photos.getAllContexts'
                '    flickr.photos.getContactsPhotos'
                '    flickr.photos.getContactsPublicPhotos'
                '    flickr.photos.getContext'
                '    flickr.photos.getCounts'
                '    flickr.photos.getExif'
                '    flickr.photos.getFavorites'
                '    flickr.photos.getInfo'
                '    flickr.photos.getNotInSet'
                '    flickr.photos.getPerms'
                '    flickr.photos.getRecent'
                '    flickr.photos.getSizes'
                '    flickr.photos.getUntagged'
                '    flickr.photos.getWithGeoData'
                '    flickr.photos.getWithoutGeoData'
                '    flickr.photos.recentlyUpdated'
                '    flickr.photos.removeTag'
                '    flickr.photos.search'
                '    flickr.photos.setContentType'
                '    flickr.photos.setDates'
                '    flickr.photos.setMeta'
                '    flickr.photos.setPerms'
                '    flickr.photos.setSafetyLevel'
                '    flickr.photos.setTags'
                ''
                'photos.comments'
                ''
                '    flickr.photos.comments.addComment'
                '    flickr.photos.comments.deleteComment'
                '    flickr.photos.comments.editComment'
                '    flickr.photos.comments.getList'
                '    '
                'flickr.photos.comments.getRecentForContac'
                'ts'
                ''
                'photos.geo'
                ''
                '    flickr.photos.geo.batchCorrectLocation'
                '    flickr.photos.geo.correctLocation'
                '    flickr.photos.geo.getLocation'
                '    flickr.photos.geo.getPerms'
                '    flickr.photos.geo.photosForLocation'
                '    flickr.photos.geo.removeLocation'
                '    flickr.photos.geo.setContext'
                '    flickr.photos.geo.setLocation'
                '    flickr.photos.geo.setPerms'
                ''
                'photos.licenses'
                ''
                '    flickr.photos.licenses.getInfo'
                '    flickr.photos.licenses.setLicense'
                ''
                'photos.notes'
                ''
                '    flickr.photos.notes.add'
                '    flickr.photos.notes.delete'
                '    flickr.photos.notes.edit'
                ''
                'photos.people'
                ''
                '    flickr.photos.people.add'
                '    flickr.photos.people.delete'
                '    flickr.photos.people.deleteCoords'
                '    flickr.photos.people.editCoords'
                '    flickr.photos.people.getList'
                ''
                'photos.suggestions'
                ''
                '    '
                'flickr.photos.suggestions.approveSuggestion'
                '    flickr.photos.suggestions.getList'
                '    '
                'flickr.photos.suggestions.rejectSuggestion'
                '    '
                'flickr.photos.suggestions.removeSuggestion'
                '    flickr.photos.suggestions.suggestLocation'
                ''
                'photos.transform'
                ''
                '    flickr.photos.transform.rotate'
                ''
                'photos.upload'
                ''
                '    flickr.photos.upload.checkTickets'
                ''
                'photosets'
                ''
                '    flickr.photosets.addPhoto'
                '    flickr.photosets.create'
                '    flickr.photosets.delete'
                '    flickr.photosets.editMeta'
                '    flickr.photosets.editPhotos'
                '    flickr.photosets.getContext'
                '    flickr.photosets.getInfo'
                '    flickr.photosets.getList'
                '    flickr.photosets.getPhotos'
                '    flickr.photosets.orderSets'
                '    flickr.photosets.removePhoto'
                '    flickr.photosets.removePhotos'
                '    flickr.photosets.reorderPhotos'
                '    flickr.photosets.setPrimaryPhoto'
                ''
                'photosets.comments'
                ''
                '    flickr.photosets.comments.addComment'
                '    '
                'flickr.photosets.comments.deleteComment'
                '    flickr.photosets.comments.editComment'
                '    flickr.photosets.comments.getList'
                ''
                'places'
                ''
                '    flickr.places.find'
                '    flickr.places.findByLatLon'
                '    flickr.places.getChildrenWithPhotosPublic'
                '    flickr.places.getInfo'
                '    flickr.places.getInfoByUrl'
                '    flickr.places.getPlaceTypes'
                '    flickr.places.getShapeHistory'
                '    flickr.places.getTopPlacesList'
                '    flickr.places.placesForBoundingBox'
                '    flickr.places.placesForContacts'
                '    flickr.places.placesForTags'
                '    flickr.places.placesForUser'
                '    flickr.places.resolvePlaceId'
                '    flickr.places.resolvePlaceURL'
                '    flickr.places.tagsForPlace'
                ''
                'prefs'
                ''
                '    flickr.prefs.getContentType'
                '    flickr.prefs.getGeoPerms'
                '    flickr.prefs.getHidden'
                '    flickr.prefs.getPrivacy'
                '    flickr.prefs.getSafetyLevel'
                ''
                'push'
                ''
                '    flickr.push.getSubscriptions'
                '    flickr.push.getTopics'
                '    flickr.push.subscribe'
                '    flickr.push.unsubscribe'
                ''
                'reflection'
                ''
                '    flickr.reflection.getMethodInfo'
                '    flickr.reflection.getMethods'
                ''
                'stats'
                ''
                '    flickr.stats.getCollectionDomains'
                '    flickr.stats.getCollectionReferrers'
                '    flickr.stats.getCollectionStats'
                '    flickr.stats.getCSVFiles'
                '    flickr.stats.getPhotoDomains'
                '    flickr.stats.getPhotoReferrers'
                '    flickr.stats.getPhotosetDomains'
                '    flickr.stats.getPhotosetReferrers'
                '    flickr.stats.getPhotosetStats'
                '    flickr.stats.getPhotoStats'
                '    flickr.stats.getPhotostreamDomains'
                '    flickr.stats.getPhotostreamReferrers'
                '    flickr.stats.getPhotostreamStats'
                '    flickr.stats.getPopularPhotos'
                '    flickr.stats.getTotalViews'
                ''
                'tags'
                ''
                '    flickr.tags.getClusterPhotos'
                '    flickr.tags.getClusters'
                '    flickr.tags.getHotList'
                '    flickr.tags.getListPhoto'
                '    flickr.tags.getListUser'
                '    flickr.tags.getListUserPopular'
                '    flickr.tags.getListUserRaw'
                '    flickr.tags.getMostFrequentlyUsed'
                '    flickr.tags.getRelated'
                ''
                'test'
                ''
                '    flickr.test.echo'
                '    flickr.test.login'
                '    flickr.test.null'
                ''
                'urls'
                ''
                '    flickr.urls.getGroup'
                '    flickr.urls.getUserPhotos'
                '    flickr.urls.getUserProfile'
                '    flickr.urls.lookupGallery'
                '    flickr.urls.lookupGroup'
                '    flickr.urls.lookupUser'
                '')
              TabOrder = 1
            end
          end
          object tbsPhotos: TTabSheet
            Caption = 'Upload/Replace Photos'
            ImageIndex = 3
            object pnlPhotoOperations: TPanel
              Left = 0
              Top = 0
              Width = 818
              Height = 129
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object btnUploadingPhotos: TButton
                Left = 527
                Top = 16
                Width = 185
                Height = 25
                Action = actUploadingPhotos
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
              end
              object btnUploadingPhotosIndyBased: TButton
                Left = 3
                Top = 16
                Width = 161
                Height = 25
                Action = actUploadingPhotosIndyBased
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
              end
              object btnReplacingPhotos: TButton
                Left = 184
                Top = 16
                Width = 145
                Height = 25
                Action = actReplacingPhotos
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
              object btnGetUploadStatus: TButton
                Left = 343
                Top = 16
                Width = 105
                Height = 25
                Action = actGetUploadStatus
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
              end
              object edtUploadPhotoTitle: TLabeledEdit
                Left = 3
                Top = 66
                Width = 131
                Height = 21
                EditLabel.Width = 60
                EditLabel.Height = 13
                EditLabel.Caption = 'Upload Title:'
                TabOrder = 4
                Text = #1085#1072#1079#1074#1072#1085#1080#1077' test'
              end
              object edtUploadPhotoDescription: TLabeledEdit
                Left = 156
                Top = 66
                Width = 213
                Height = 21
                EditLabel.Width = 93
                EditLabel.Height = 13
                EditLabel.Caption = 'Upload Description:'
                TabOrder = 5
                Text = #1087#1088#1086#1089#1090#1086' '#1086#1087#1080#1089#1072#1085#1080#1077
              end
              object edtUploadPhotoTags: TLabeledEdit
                Left = 396
                Top = 66
                Width = 333
                Height = 21
                EditLabel.Width = 63
                EditLabel.Height = 13
                EditLabel.Caption = 'Upload Tags:'
                TabOrder = 6
                Text = 'upload "'#1082#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086'1" test "combined tag"'
              end
              object edtReplacementPhotoDescription: TLabeledEdit
                Left = 3
                Top = 105
                Width = 131
                Height = 21
                EditLabel.Width = 89
                EditLabel.Height = 13
                EditLabel.Caption = 'Replacement Title:'
                TabOrder = 7
                Text = #1079#1072#1084#1077#1085#1072' test'
              end
              object edtReplacementPhotoTitle: TLabeledEdit
                Left = 156
                Top = 105
                Width = 213
                Height = 21
                EditLabel.Width = 122
                EditLabel.Height = 13
                EditLabel.Caption = 'Replacement Description:'
                TabOrder = 8
                Text = #1080#1079#1084#1077#1085#1105#1085#1085#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077
              end
              object edtReplacementPhotoTags: TLabeledEdit
                Left = 396
                Top = 105
                Width = 333
                Height = 21
                EditLabel.Width = 92
                EditLabel.Height = 13
                EditLabel.Caption = 'Replacement Tags:'
                TabOrder = 9
                Text = 'replacement "'#1082#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086'2" test "combined tag2"'
              end
            end
            object pcPhotosOperations: TPageControl
              AlignWithMargins = True
              Left = 3
              Top = 132
              Width = 812
              Height = 527
              ActivePage = tbsUploadingPhotosDetails
              Align = alClient
              TabOrder = 1
              object tbsUploadingPhotosDetails: TTabSheet
                Caption = 'Uploading Photos Details'
                object splUploads: TSplitter
                  Left = 0
                  Top = 156
                  Width = 804
                  Height = 3
                  Cursor = crVSplit
                  Align = alTop
                  Beveled = True
                end
                object grbPhotoResponse: TGroupBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 798
                  Height = 150
                  Align = alTop
                  Caption = ' Response '
                  TabOrder = 0
                  object memPhotoResponse: TMemo
                    AlignWithMargins = True
                    Left = 5
                    Top = 18
                    Width = 788
                    Height = 127
                    Align = alClient
                    ScrollBars = ssBoth
                    TabOrder = 0
                  end
                end
                object grbPhotoRequestBody: TGroupBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 162
                  Width = 798
                  Height = 334
                  Align = alClient
                  Caption = ' Request Body '
                  TabOrder = 1
                  object memPhotoRequestBody: TMemo
                    AlignWithMargins = True
                    Left = 5
                    Top = 18
                    Width = 788
                    Height = 311
                    Align = alClient
                    ScrollBars = ssBoth
                    TabOrder = 0
                  end
                end
              end
            end
          end
          object tbsGenerator: TTabSheet
            Caption = 'Generator'
            ImageIndex = 2
            object pnlGenerator: TPanel
              Left = 0
              Top = 0
              Width = 818
              Height = 49
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object btnGenerateCodeForMethods: TButton
                Left = 4
                Top = 10
                Width = 209
                Height = 25
                Action = actGenerateCodeForMethods
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
            end
            object pcGenerator: TPageControl
              Left = 0
              Top = 49
              Width = 818
              Height = 613
              ActivePage = tbsGenerationMethodInfo
              Align = alClient
              TabOrder = 1
              object tbsGenerationMethodInfo: TTabSheet
                Caption = 'Method Info'
                object memMethodInfo: TMemo
                  Left = 0
                  Top = 0
                  Width = 810
                  Height = 585
                  Align = alClient
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
              object tbsGenerationCode: TTabSheet
                Caption = 'Code'
                ImageIndex = 1
                object memGeneratedCode: TMemo
                  Left = 0
                  Top = 0
                  Width = 810
                  Height = 585
                  Align = alClient
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
            end
          end
          object tbsDevelopmentCustomActions: TTabSheet
            Caption = 'Custom Actions'
            ImageIndex = 3
            object grbPermissionsFromPiwigo_sync_files: TGroupBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 812
              Height = 72
              Align = alTop
              Caption = ' Permissions from .piwigo_sync... files '
              TabOrder = 0
              object bntGetPermissionsFromPiwigoSync: TButton
                AlignWithMargins = True
                Left = 250
                Top = 38
                Width = 207
                Height = 25
                Action = actGetPermissionsFromPiwigoSync
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
              object edtPiwigoSyncFile: TLabeledEdit
                Left = 5
                Top = 40
                Width = 228
                Height = 21
                EditLabel.Width = 155
                EditLabel.Height = 13
                EditLabel.Caption = '.piwigo_sync_<host>_piwigo.ini'
                TabOrder = 1
                Text = '.piwigo_sync_ubuvm_piwigo.ini'
              end
            end
          end
        end
      end
    end
    object grbSyncronizationActivity: TGroupBox
      AlignWithMargins = True
      Left = 840
      Top = 3
      Width = 227
      Height = 713
      Align = alRight
      Caption = ' Syncronization Activity '
      TabOrder = 1
      object pnlSyncronizationActivity: TGridPanel
        AlignWithMargins = True
        Left = 2
        Top = 19
        Width = 223
        Height = 692
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        BevelOuter = bvNone
        ColumnCollection = <
          item
            SizeStyle = ssAuto
            Value = 50.000000000000000000
          end
          item
            Value = 100.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 36.000000000000000000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = lnlPhotosToProcess
            Row = 0
          end
          item
            Column = 1
            Control = edtPhotosToProcess
            Row = 0
          end
          item
            Column = 2
            Control = lnlPhotosToProcessDetails
            Row = 0
          end
          item
            Column = 0
            Control = lnlAlbumsToProcess
            Row = 6
          end
          item
            Column = 1
            Control = edtAlbumsToProcess
            Row = 6
          end
          item
            Column = 2
            Control = lnlAlbumsToProcessDetails
            Row = 6
          end
          item
            Column = 0
            Control = lblFlickrAPICalls
            Row = 14
          end
          item
            Column = 1
            Control = edtFlickrAPICalls
            Row = 14
          end
          item
            Column = 2
            Control = lblFlickrAPICallsDetails
            Row = 14
          end
          item
            Column = 0
            Control = lblSizeofUploadedPhotos
            Row = 4
          end
          item
            Column = 1
            Control = edtUploadedSize
            Row = 4
          end
          item
            Column = 2
            Control = lblUploadedSizeDetails
            Row = 4
          end
          item
            Column = 0
            Control = lblAlbumsCreated
            Row = 8
          end
          item
            Column = 1
            Control = edtAlbumsCreated
            Row = 8
          end
          item
            Column = 2
            Control = lbldotdotdot
            Row = 8
          end
          item
            Column = 0
            Control = lblPhotosUploaded
            Row = 2
          end
          item
            Column = 1
            Control = edtPhotosUploaded
            Row = 2
          end
          item
            Column = 2
            Control = lbldot2
            Row = 3
          end
          item
            Column = 0
            Control = lblPhotosReplaced
            Row = 3
          end
          item
            Column = 1
            Control = edtPhotoReplacments
            Row = 3
          end
          item
            Column = 2
            Control = lbldot3
            Row = 2
          end
          item
            Column = 0
            Control = lblThreadsActive
            Row = 13
          end
          item
            Column = 1
            Control = edtThreadsActive
            Row = 13
          end
          item
            Column = 2
            Control = lblThreadsActiveDetails
            Row = 13
          end
          item
            Column = 0
            Control = lblThreadsCompleted
            Row = 12
          end
          item
            Column = 1
            Control = edtThreadsCompleted
            Row = 12
          end
          item
            Column = 2
            Control = lblThreadsCompletedDetails
            Row = 12
          end
          item
            Column = 0
            Control = lblPhotosProcessed
            Row = 1
          end
          item
            Column = 1
            Control = edtPhotosProcessed
            Row = 1
          end
          item
            Column = 2
            Control = lblPhotosProcessedDetails
            Row = 1
          end
          item
            Column = 0
            Control = lblFoldersToScan
            Row = 9
          end
          item
            Column = 1
            Control = edtFoldersToAlbums
            Row = 9
          end
          item
            Column = 2
            Control = lblFoldersToScanDetails
            Row = 9
          end
          item
            Column = 0
            Control = lblFoldersScanned
            Row = 10
          end
          item
            Column = 1
            Control = edtFoldersScanned
            Row = 10
          end
          item
            Column = 2
            Control = lblFoldersScannedDetails
            Row = 10
          end
          item
            Column = 0
            Control = lblErrors
            Row = 15
          end
          item
            Column = 1
            Control = edtErrors
            Row = 15
          end
          item
            Column = 2
            Control = lblErrorsDetails
            Row = 15
          end
          item
            Column = 0
            Control = lblAlbumsProcessed
            Row = 7
          end
          item
            Column = 1
            Control = edtAlbumsProcessed
            Row = 7
          end
          item
            Column = 2
            Control = lblAlbumsProcessedDetails
            Row = 7
          end
          item
            Column = 0
            Control = lblAverageSize
            Row = 5
          end
          item
            Column = 1
            Control = edtAverageSize
            Row = 5
          end
          item
            Column = 2
            Control = lblAverageSizeDetails
            Row = 5
          end
          item
            Column = 0
            Control = lblResolvedErrors
            Row = 16
          end
          item
            Column = 1
            Control = edtResolvedErrors
            Row = 16
          end
          item
            Column = 2
            Control = lblResolvedErrorsDetails
            Row = 16
          end
          item
            Column = 0
            Control = lblSyncronizationTime
            Row = 17
          end
          item
            Column = 1
            Control = edtSyncronizationTime
            Row = 17
          end
          item
            Column = 2
            Control = lblSyncronizationTimeDetails
            Row = 17
          end
          item
            Column = 0
            Control = lblPhotosTotalSize
            Row = 11
          end
          item
            Column = 1
            Control = edtPhotosTotalSize
            Row = 11
          end
          item
            Column = 2
            Control = lblPhotosTotalSizeDetails
            Row = 11
          end
          item
            Column = 0
            Control = lblActiveThreads
            Row = 18
          end
          item
            Column = 2
            Control = lbldot1
            Row = 18
          end
          item
            Column = 1
            Control = edtThreadsToRun
            Row = 18
          end>
        RowCollection = <
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 28.000000000000000000
          end>
        TabOrder = 0
        DesignSize = (
          223
          692)
        object lnlPhotosToProcess: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 5
          Width = 90
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Photos to process:'
        end
        object edtPhotosToProcess: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 2
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
        object lnlPhotosToProcessDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 5
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lnlAlbumsToProcess: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 173
          Width = 91
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Albums to process:'
        end
        object edtAlbumsToProcess: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 170
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
        object lnlAlbumsToProcessDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 173
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblFlickrAPICalls: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 397
          Width = 69
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Flickr API Calls'
        end
        object edtFlickrAPICalls: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 394
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 2
          Text = '0'
        end
        object lblFlickrAPICallsDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 397
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblSizeofUploadedPhotos: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 117
          Width = 116
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Size of Uploaded Photos'
        end
        object edtUploadedSize: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 114
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 3
          Text = '0'
        end
        object lblUploadedSizeDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 117
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblAlbumsCreated: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 229
          Width = 80
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Albums Created:'
        end
        object edtAlbumsCreated: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 226
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 4
          Text = '0'
        end
        object lbldotdotdot: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 229
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblPhotosUploaded: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 61
          Width = 85
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Photos Uploaded:'
        end
        object edtPhotosUploaded: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 58
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 5
          Text = '0'
        end
        object lbldot2: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 89
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblPhotosReplaced: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 89
          Width = 84
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Photos Replaced:'
        end
        object edtPhotoReplacments: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 86
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 6
          Text = '0'
        end
        object lbldot3: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 61
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblThreadsActive: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 369
          Width = 85
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Working Threads:'
        end
        object edtThreadsActive: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 366
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 7
          Text = '0'
        end
        object lblThreadsActiveDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 369
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblThreadsCompleted: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 341
          Width = 93
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Completed Threads'
        end
        object edtThreadsCompleted: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 338
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 8
          Text = '0'
        end
        object lblThreadsCompletedDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 341
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblPhotosProcessed: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 33
          Width = 89
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Photos Processed:'
        end
        object edtPhotosProcessed: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 30
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 9
          Text = '0'
        end
        object lblPhotosProcessedDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 33
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblFoldersToScan: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 257
          Width = 89
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Folders to Albums:'
        end
        object edtFoldersToAlbums: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 254
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 10
          Text = '0'
        end
        object lblFoldersToScanDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 257
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblFoldersScanned: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 285
          Width = 79
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Folders Scanned'
        end
        object edtFoldersScanned: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 282
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 11
          Text = '0'
        end
        object lblFoldersScannedDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 285
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblErrors: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 425
          Width = 33
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Errors:'
        end
        object edtErrors: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 422
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 12
          Text = '0'
        end
        object lblErrorsDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 425
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblAlbumsProcessed: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 201
          Width = 90
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Albums Processed:'
        end
        object edtAlbumsProcessed: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 198
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 13
          Text = '0'
        end
        object lblAlbumsProcessedDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 201
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblAverageSize: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 145
          Width = 67
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Average Size:'
        end
        object edtAverageSize: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 142
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 14
          Text = '0'
        end
        object lblAverageSizeDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 145
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblResolvedErrors: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 453
          Width = 80
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Resolved Errors:'
        end
        object edtResolvedErrors: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 450
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 15
          Text = '0'
        end
        object lblResolvedErrorsDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 453
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblSyncronizationTime: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 481
          Width = 99
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Syncronization Time:'
        end
        object edtSyncronizationTime: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 478
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 16
          Text = '0:00'
        end
        object lblSyncronizationTimeDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 481
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblPhotosTotalSize: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 313
          Width = 99
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Total Size of Photos:'
        end
        object edtPhotosTotalSize: TEdit
          AlignWithMargins = True
          Left = 128
          Top = 310
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Align = alClient
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 17
          Text = '0'
        end
        object lblPhotosTotalSizeDetails: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 313
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object lblActiveThreads: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 509
          Width = 76
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Active Threads:'
        end
        object lbldot1: TLabel
          AlignWithMargins = True
          Left = 207
          Top = 509
          Width = 12
          Height = 16
          Margins.Left = 4
          Margins.Top = 5
          Margins.Right = 4
          Margins.Bottom = 7
          Align = alRight
          Caption = '...'
        end
        object edtThreadsToRun: TSpinEdit
          AlignWithMargins = True
          Left = 128
          Top = 506
          Width = 55
          Height = 21
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 5
          Anchors = []
          EditorEnabled = False
          MaxValue = 0
          MinValue = 0
          TabOrder = 18
          Value = 0
          OnChange = edtThreadsToRunChange
        end
      end
    end
  end
  object stbApplication: TPanel
    Left = 0
    Top = 760
    Width = 1070
    Height = 44
    Align = alBottom
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 2
    object pnlStatusBarApplicationData: TPanel
      Left = 1
      Top = 1
      Width = 1068
      Height = 21
      Align = alTop
      ParentBackground = False
      TabOrder = 0
      object pnlActivityMessage: TPanel
        Left = 1
        Top = 1
        Width = 1066
        Height = 19
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object lblActivityMessage: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 3
          Width = 96
          Height = 13
          Margins.Left = 4
          Margins.Right = 4
          Align = alClient
          Alignment = taCenter
          Caption = 'Activity Message ...'
        end
      end
    end
    object pnlStatusBarUserAndPrograssBar: TPanel
      Left = 1
      Top = 22
      Width = 1068
      Height = 21
      Align = alClient
      ParentBackground = False
      TabOrder = 1
      object pnlStatusBarStatus: TPanel
        Left = 1
        Top = 1
        Width = 41
        Height = 19
        Align = alLeft
        AutoSize = True
        BevelEdges = [beRight]
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 4
        object lblStatusBarStatus: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 3
          Width = 31
          Height = 13
          Margins.Left = 4
          Margins.Right = 4
          Align = alLeft
          Caption = 'Status'
        end
      end
      object pnlStatusBarUserID: TPanel
        Left = 42
        Top = 1
        Width = 43
        Height = 19
        Align = alLeft
        AutoSize = True
        BevelEdges = [beRight]
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 0
        object lblStatusBarUserID: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 3
          Width = 33
          Height = 13
          Margins.Left = 4
          Margins.Right = 4
          Align = alLeft
          Caption = 'UserID'
        end
      end
      object pnlStatusBarUserFullName: TPanel
        Left = 144
        Top = 1
        Width = 75
        Height = 19
        Align = alLeft
        AutoSize = True
        BevelEdges = [beRight]
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 1
        object lblStatusBarUserFullName: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 3
          Width = 65
          Height = 13
          Margins.Left = 4
          Margins.Right = 4
          Align = alLeft
          Caption = 'UserFullName'
        end
      end
      object pnlStatusBarUserName: TPanel
        Left = 85
        Top = 1
        Width = 59
        Height = 19
        Align = alLeft
        AutoSize = True
        BevelEdges = [beRight]
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 3
        object lblStatusBarUserName: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 3
          Width = 49
          Height = 13
          Margins.Left = 4
          Margins.Right = 4
          Align = alLeft
          Caption = 'UserName'
        end
      end
      object pnlStatusBarUserAccessPermission: TPanel
        Left = 219
        Top = 1
        Width = 115
        Height = 19
        Align = alLeft
        AutoSize = True
        BevelEdges = [beRight]
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 2
        object lblStatusBarUserAccessPermission: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 3
          Width = 105
          Height = 13
          Margins.Left = 4
          Margins.Right = 4
          Align = alLeft
          Caption = 'UserAccessPermission'
        end
      end
      object pnlStatusBarProgress: TPanel
        Left = 334
        Top = 1
        Width = 733
        Height = 19
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 5
        object prbProgress: TProgressBar
          Left = 0
          Top = 0
          Width = 733
          Height = 19
          Align = alClient
          TabOrder = 0
          Visible = False
        end
      end
    end
  end
  object RESTClient: TRESTClient
    Authenticator = OAuthAuthenticator
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    AcceptEncoding = 'gzip'
    Params = <>
    Left = 248
  end
  object RESTRequest: TRESTRequest
    AssignedValues = [rvAcceptEncoding]
    AcceptEncoding = 'gzip'
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 328
  end
  object RESTResponse: TRESTResponse
    ContentType = 'text/html'
    Left = 408
  end
  object aclActions: TActionList
    Left = 992
    Top = 248
    object actLocateDummyPlaceholder: TAction
      Category = 'Settings'
      Caption = '...'
      Hint = 'Locate Exif Tool'
      OnExecute = actLocateDummyPlaceholderExecute
    end
    object actLocatePicasaContactsXML: TAction
      Category = 'Settings'
      Caption = '...'
      OnExecute = actLocatePicasaContactsXMLExecute
    end
    object actGetRequestTokenAndAuthCode: TAction
      Category = 'Authorization'
      Caption = 'Get Request-Token and Authentication-Code'
      OnExecute = actGetRequestTokenAndAuthCodeExecute
      OnUpdate = actGetRequestTokenAndAuthCodeUpdate
    end
    object actGetAccessToken: TAction
      Category = 'Authorization'
      Caption = 'Get Access-Token'
      OnExecute = actGetAccessTokenExecute
      OnUpdate = actGetAccessTokenUpdate
    end
    object actTestEcho: TAction
      Category = 'API Calls'
      Caption = 'Test Echo'
      Hint = 'flickr.test.echo'
      OnExecute = actTestEchoExecute
    end
    object actGetCredentialsForAccessToken: TAction
      Category = 'API Calls'
      Caption = 'Get Credentials for Access Token'
      Hint = 
        'Returns the credentials attached to an OAuth authentication toke' +
        'n'
      OnExecute = actGetCredentialsForAccessTokenExecute
      OnUpdate = actGetCredentialsForAccessTokenUpdate
    end
    object actClearAccessToken: TAction
      Category = 'Authorization'
      Caption = 'Clear Access Token (!)'
      Hint = 
        'Clear Access Token - it is not recommended uless you AccessToken' +
        ' became invalid'
      OnExecute = actClearAccessTokenExecute
      OnUpdate = actClearAccessTokenUpdate
    end
    object actTestLogin: TAction
      Category = 'API Calls'
      Caption = 'Test Login'
      Hint = 'flickr.test.login'
    end
    object actTestSelected: TAction
      Category = 'API Calls'
      Caption = 'Test Selected API Method'
      Hint = 'Test Selected API Method from the list on the right'
      OnExecute = actTestSelectedExecute
      OnUpdate = actTestSelectedUpdate
    end
    object actGenerateCodeForMethods: TAction
      Category = 'API Calls'
      Caption = 'Generate Code For all Methods'
      OnExecute = actGenerateCodeForMethodsExecute
      OnUpdate = actGenerateCodeForMethodsUpdate
    end
    object actGetPhotosetList: TAction
      Category = 'API Calls'
      Caption = 'Get Photoset List'
      Hint = 'flickr.photosets.getList'
      OnExecute = actGetPhotosetListExecute
      OnUpdate = actGetPhotosetListUpdate
    end
    object actGetUploadStatus: TAction
      Category = 'Photos'
      Caption = 'Get Upload Status'
      Hint = 'flickr.people.getUploadStatus'
      OnExecute = actGetUploadStatusExecute
      OnUpdate = actGetUploadStatusUpdate
    end
    object actUploadingPhotos: TAction
      Category = 'Photos'
      Caption = 'Uploading Photos (Doesn'#39't work)'
      Hint = 'Uploading Photos'
      OnExecute = actUploadingPhotosExecute
      OnUpdate = actUploadingPhotosUpdate
    end
    object actUploadingPhotosIndyBased: TAction
      Category = 'Photos'
      Caption = 'Uploading Photos Indy Based'
      Hint = 'Uploading Photos using Indy functionality'
      OnExecute = actUploadingPhotosIndyBasedExecute
      OnUpdate = actUploadingPhotosIndyBasedUpdate
    end
    object actReplacingPhotos: TAction
      Category = 'Photos'
      Caption = 'Replacing Photos'
      Hint = 'Replacing Photos'
      OnExecute = actReplacingPhotosExecute
      OnUpdate = actReplacingPhotosUpdate
    end
    object actAddFolderToSycncronization: TAction
      Category = 'Folders'
      Caption = 'Add Folder(s)'
      Hint = 'Add Folder to Sycncronization'
      OnExecute = actAddFolderToSycncronizationExecute
    end
    object actRemoveFolderFromSyncronization: TAction
      Category = 'Folders'
      Caption = 'Remove Folder'
      Hint = 'Remove selected Folder from Syncronization'
      OnExecute = actRemoveFolderFromSyncronizationExecute
      OnUpdate = actRemoveFolderFromSyncronizationUpdate
    end
    object actPrepareFolderStructure: TAction
      Category = 'Folders'
      Caption = 'Scan Folders for data to be syncronized'
      Hint = 'Collect Folders'#39' Data for Syncronization'
      OnExecute = actPrepareFolderStructureExecute
      OnUpdate = actPrepareFolderStructureUpdate
    end
    object actLoadFlickrAlbums: TAction
      Category = 'Syncronization'
      Caption = 'Load Albums'
      Hint = 'Load Albums Data from Flickr'
      OnExecute = actLoadFlickrAlbumsExecute
      OnUpdate = actLoadFlickrAlbumsUpdate
    end
    object actCreateAlbum: TAction
      Category = 'API Calls'
      Caption = 'Create Album '#1089' '#1088#1091#1089#1089#1082#1080#1084#1080' '#1073#1091#1082#1074#1072#1084#1080
      OnExecute = actCreateAlbumExecute
      OnUpdate = actCreateAlbumUpdate
    end
    object actSortAlbums: TAction
      Category = 'API Calls'
      Caption = 'Sort Albums'
      OnExecute = actSortAlbumsExecute
      OnUpdate = actSortAlbumsUpdate
    end
    object actClearLogs: TAction
      Category = 'Log'
      Caption = 'Clear Logs'
      OnExecute = actClearLogsExecute
    end
    object actChangeOrCreateUser: TAction
      Category = 'Authorization'
      Caption = 'Change (Current) or Authorize New User'
      OnExecute = actChangeOrCreateUserExecute
      OnUpdate = actChangeOrCreateUserUpdate
    end
    object actCancelSyncronization: TAction
      Category = 'Syncronization'
      Caption = 'Cancel Syncronization'
      OnExecute = actCancelSyncronizationExecute
      OnUpdate = actCancelSyncronizationUpdate
    end
    object actSyncronize: TAction
      Category = 'Syncronization'
      Caption = 'Syncronize'
      OnExecute = actSyncronizeExecute
      OnUpdate = actSyncronizeUpdate
    end
    object actGetPermissionsFromPiwigoSync: TAction
      Category = 'Settings'
      Caption = 'Get Permissions from .piwigo_... files'
      Hint = 
        'Get Permissions from .piwigo_... files and update current ._sync' +
        'r.ini files'
      OnExecute = actGetPermissionsFromPiwigoSyncExecute
      OnUpdate = actGetPermissionsFromPiwigoSyncUpdate
    end
    object actSaveResizedPhotosFolder: TAction
      Category = 'Settings'
      Caption = '...'
      OnExecute = actSaveResizedPhotosFolderExecute
      OnUpdate = actSaveResizedPhotosFolderUpdate
    end
    object actCopyToClipboard: TAction
      Category = 'Log'
      Caption = 'Copy content into Clipboard'
      OnExecute = actCopyToClipboardExecute
    end
  end
  object OAuthAuthenticator: TOAuth1Authenticator
    AccessTokenEndpoint = 'https://www.flickr.com/services/oauth/access_token'
    RequestTokenEndpoint = 'https://www.flickr.com/services/oauth/request_token'
    AuthenticationEndpoint = 'https://www.flickr.com/services/oauth/authorize'
    CallbackEndpoint = 'oob'
    Left = 144
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 48
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = RESTResponse
      FieldName = 'Content'
      Control = memResponceContent
      Track = False
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = RESTResponse
      FieldName = 'ErrorMessage'
      Control = memResponseErrorMessage
      Track = False
    end
    object LinkControlToField4: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = RESTResponse
      FieldName = 'StatusText'
      Control = edtStatusText
      Track = True
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = RESTResponse
      FieldName = 'StatusCode'
      Control = edtResponseStatusCode
      Track = True
    end
    object LinkControlToField5: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = RESTResponse
      FieldName = 'Content'
      Control = memPhotoResponse
      Track = False
    end
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoKeepOrigProtocol, hoForceEncodeParams]
    Left = 488
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 600
  end
  object mnuTopFoldersToSyncronize: TPopupActionBar
    Left = 992
    Top = 56
    object mniAddFoldertoSycncronization: TMenuItem
      Action = actAddFolderToSycncronization
    end
    object mniRemoveFolderfromSyncronization: TMenuItem
      Action = actRemoveFolderFromSyncronization
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mniCollectFoldersDataforSyncronization: TMenuItem
      Action = actPrepareFolderStructure
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mniCopycontentintoClipboard: TMenuItem
      Action = actCopyToClipboard
    end
  end
  object dlgOpen: TOpenDialog
    Options = [ofReadOnly, ofOverwritePrompt, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select location'
    Left = 992
    Top = 152
  end
  object dlgOpenPlaceholder: TOpenPictureDialog
    Options = [ofReadOnly, ofEnableSizing]
    Title = 'Select location'
    Left = 992
    Top = 200
  end
  object imlSupport: TImageList
    Left = 992
    Top = 296
    Bitmap = {
      494C010108000D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D36A22000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E2E2E21DCBCBCB34C9C9
      C936C9C9C9363D8FC5F03589C3F83487C2F83285C1F83083C0F82E81BFF82D7F
      BFF82B7DBEF82A7BBDF8297BBEF75696CBC30000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ECEB
      EC14686872A24A4951BEB0B0B04F0000000000000000000000001A5D92FF185A
      8FFF16588CFF155589FF135386FF125183FF104F80FF0F4D7EFF0E4B7CFF0D49
      7AFF000000000000000000000000000000000000000000000000D36A22008300
      FD000000000000000000D36A2200D36A2200D36A2200D36A2200000000000000
      00000000000000000000000000000000000000000000CBCBCB34F9F9F9F5FCFC
      FCFDFCFCFCFF4D9CCEFFDDECF6FFBDEEF9FFACEAF8FFABEAF8FFABEAF8FFABEA
      F8FFADEAF8FFD4F3FBFFA4C8E4FF6DA6D3AB0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000555D
      76B9194C96FF1D4A92FF212A45F1A6A6A6590000000000000000216398F9438A
      CCFF4690C5FF4A95C6FF62D4E8FF61D4E9FF4496C9FF409AC9FF3D88C7FF0E4C
      7DFF000000000000000000000000000000000000000000000000D36A22008300
      FD008300FD00D36A22008300FD008300FD008300FD008300FD00D36A22000000
      000000000000000000000000000000000000FEFEFE01C9C9C936FCFCFCFEFCFC
      FCFFFCFCFCFFADD2E8FF8EC2E1FF97E8F9FF61DCF6FF5BDBF5FF3288C2FF5BDB
      F5FF6ADEF6FFB1E7F6FF3A88C2EEDCEAF42A0000000000000000000000000000
      000000000000000000000000000000000000000000000000000097959D6D2F5F
      A1FD4E98DFFF156DDEFF1556BEFF4A4C57BE000000000000000022659BFB438A
      D4FF5EF377FF8CFFA4FF77FFACFF34F67CFF55EF75FF79FF64FF458FCEFF104E
      80FF000000000000000000000000000000000000000000000000D36A22008300
      FD008400FD008505FC008400FD009743F1008C15FC008400FD008300FD00D36A
      220000000000000000000000000000000000FEFEFE01C9C9C936FCFCFCFFFCFC
      FCFFFCFCFCFFF8FAFBFF68B1D8FFABDBEFFF74E0F7FF58DAF5FF58DAF5FF5DDB
      F5FF90E6F8FF92C1E1FF7EAAC799FEFEFE010000000000000000000000000000
      00000000000000000000000000000000000000000000EEEDEE122D4778E55CA2
      E3FFB6DFFDFFBEDFFFFF4B73B9FE82828B7F000000000000000024699FFB468F
      D9FF4FC84BFF21CB36FF25C842FFACB854FFFFA642FFFFA200FF518BCAFF1251
      84FF215A88EB205986EB1F5784EB000000000000000000000000D36A22008300
      FD008400FD008300FD008300FD00D36A220000000000D36A22008505FC008300
      FD00D36A2200000000000000000000000000FEFEFE01C9C9C936FCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFC9E3F0FF7BBDDFFFA2EAF9FF61DCF6FF3187C2FF77E1
      F7FFB6DEF0FF59A5D2FFC1C6C940FEFEFE010000000000000000000000000000
      00000000000000000000000000000000000000000000868593813976BDFF97D0
      FDFFDDFCFFFFB4BECFFF6C6A72AB000000000000000000000000266CA3FB4891
      DDFF45CE3BFF31BE07FFFFB75AFFFFB658FFCCD197FF8AFAF3FF3790CFFF1455
      88FF4EA1CDEB4C91CBEB205A87EB000000000000000000000000D36A22008300
      FD008400FD008400FD008400FD008300FD000000000000000000D36A22008400
      FD008300FD00000000000000000000000000FEFEFE01C9C9C936FCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFAFAFBFF8CC7E3FFACD9ECFF82E3F8FF3388C2FFACED
      FAFF449ECFFFBFDCEDFFC9C9C936FEFEFE010000000000000000000000000000
      000000000000000000000000000000000000E7E6E7192E4D80EC7ABEF7FFC7F3
      FFFF95B9D8FF575C6EBB000000000000000000000000000000002A6FA7F93F90
      D8FFEDBA38FFFFBF58FFFFBB62FFFFB644FF8CEBDBFF6DFFFFFF4992CAFF1758
      8CFF74F082EB5397D1EB225B89EB000000000000000000000000D36A22008300
      FD008300FD008300FD008300FD008300FD008300FD0000000000D36A22008300
      FD008300FD00000000000000000000000000FEFEFE01C9C9C936FCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFE0F0F6FF5DB4DAFFB4EBF8FF8EE6F8FFB5DD
      EEFF7EBFDEFFF8FAFBFFC9C9C936FEFEFE010000000000000000000000000000
      0000000000000000000000000000000000004B5571BE5298DBFFADE7FFFF72A8
      D7FF49546BC3FDFDFD0200000000000000003E77A3D63D74A1D6266FA8FF52A2
      DDFF4D93DAFF4392D5FF3C91D1FF3C8ECDFF3A8BCBFF3E84BEFF4B92CAFF195B
      90FF79E679EB5E94CEEB245E8DEB000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D36A22008300
      FD008300FD00000000000000000000000000FEFEFE01C9C9C936FCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFAAD9ECFFA4D7EBFFDCF4FBFF5BB3
      D9FFD3E7EFFFFCFCFCFFC9C9C936FEFEFE0100000000E4E4E41BB7B7B748F3F3
      F30C0000000000000000000000006E6E7C982A6FB8FE9BE1FFFF7CB5E3FF3949
      64CCF7F7F708000000000000000000000000447CA8D1619CD4D62871AAFF276F
      A9FF266EA7FF256CA5FF236AA3FF2268A0FF20669DFF1F649BFF1D6198FF1C5F
      95FF61E679EB4698D2EB266291EB000000000000000000000000000000008300
      FD008C15FC00D36A220000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE01C9C9C936FCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF2F7F9FF73C4E1FFABDBEDFF9DD2
      E6FFF2F2F2FFFCFCFCFFC9C9C936FEFEFE01D1D1D12E5C5C5BE3515150FC6565
      659C0000000000000000706F7D972466AFFE7ECDFFFF9FDBFEFF314E77EFD5D5
      D52A00000000000000000000000000000000457DABD3619CDAD6E39F56D6E4A1
      57D6E3A056D638719CFB4B90CCFC2FC637FC25C742FC23C33EFC37D04AEB3ED4
      51EB4EDC64EB579ACEEB296595EB000000000000000000000000000000008300
      FD008400FD00D36A220000000000D36A22008300FD008300FD008300FD008300
      FD008300FD00D36A22000000000000000000FEFEFE01C9C9C936FCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFFF8F8F8FFC3E3EEFF7CC8E2FFE2EB
      EDFFEDEDEDFFFCFCFCFFC9C9C936FEFEFE016D6D6DD7D6CFCDFFB8B4B2FF4041
      41F89E9E9E616D707B971F67B4FE6AC2FFFFA8E6FFFF4D7CACFE89898F760000
      0000000000000000000000000000000000004781AED363A1DFD6EBB267D6EDB5
      6BD6EBB368D63573A2FC5CA2D2FC5793CEFC4693D4FC3B8ECCFC4B96D0EB4994
      CFEB4D8DC3EB599ACEEB2B6798EB00000000000000000000000000000000D36A
      22008400FD008300FD000000000000000000D36A22008812FB008400FD008400
      FD009124FB00D36A22000000000000000000FEFEFE01C9C9C936FCFCFCFFFBFB
      FBFFFCFCFCFFFCFCFCFFFBFBFBFFF8F8F8FFF5F5F5FFF1F1F1FFECECECFFEAEA
      EAFFE6E6E6FFFCFCFCFFC9C9C936FEFEFE01828080ECD7D2D3FFCBC9CAFF8E8F
      8EFF464342FB6E6F75FE5395C9FF80D3FFFF76B2E0FF444C63C4000000000000
      0000000000000000000000000000000000004883B2D365A2E2D6F2C176D6F3C3
      77D6F2C276D63876A5FC3673A3FC3471A0FC286FA9FC246AA2FC3373A7EB3172
      A4EB3070A2EB2E6DA0EB2D6B9DEB00000000000000000000000000000000D36A
      22008300FD008400FD008300FD00D46C230000000000D36A22008300FD008300
      FD008406FB00D36A22000000000000000000FEFEFE01C9C9C936FCFCFCFFF9F9
      F9FFF9F9F9FFF9F9F9FFF7F7F7FFF6F6F6FFF2F2F2FFEBEBEBFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFC9C9C936FEFEFE01CECECE3A696969CB888888FDACAC
      ABFFAAA9A7FFBEB7B1FFB6B0AAFF729DBDFF365374EADEDEDE21000000000000
      0000000000000000000000000000000000004C86B5D15DA1DED6F4C67AD6F4C7
      7BD6F4C67AD6F3C377D6ECB469D6E3A056D666A3D2D63C729ED6000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D36A22008300FD008300FD00912DF600B16FFB00922CF8008300FD008505
      FC008400FD00D36A22000000000000000000FEFEFE01C9C9C936FCFCFCFFF7F7
      F7FFF9F9F9FFF7F7F7FFF7F7F7FFF3F3F3FFF0F0F0FFEAEAEAFFFCFCFCFFF6F6
      F6FFF4F4F4FFC5C5C591DFDFDF20000000000000000000000000737373ADA4A3
      A0FFCCCAC7FFC5C1BFFFCDC6C3FF7A7270FF616161A30000000000000000FBFB
      FB04EBEBEB14F3F3F30C00000000000000004886B5D66DB0E2D669A4DFD661A3
      DBD65BA2D8D65BA0D5D6599DD3D65D97C8D667A3D2D63D75A1D6000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D36A22008300FD008300FD008300FD008300FD00D36A2200D36A
      22008300FD00D36A2200000000000000000000000000C9C9C936FBFBFBFDF4F4
      F4FFF5F5F5FFF5F5F5FFF5F5F5FFF1F1F1FFEFEFEFFFE9E9E9FFFCFCFCFFE7E7
      E7FFC2C2C291DFDFDF20FDFDFD02000000000000000000000000DADADA2A6F6E
      6DF1D1CFCDFFE6E3E1FFB3B1B0FF6F6E6CFF484847F9434444E44F4F4FDB5959
      59E84E4E4EE5B8B8B84800000000000000004B88B8D54986B6D64885B5D64883
      B3D64681B1D64580AFD6437EACD6437CABD6417AA8D64078A6D6000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D36A2200D36A2200D36A2200000000000000
      0000D36A2200D36A2200000000000000000000000000CCCCCC33F8F8F8F0FBFB
      FBFDFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF8F8F8FFC2C2
      C291DFDFDF20FDFDFD020000000000000000000000000000000000000000C2C2
      C2466C6C6BE7C2C0BDFFD6D3D1FFACA9A9FFA8A7A6FFAFADACFFBBB9B8FF9999
      98FE707070B8F3F3F30C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D36A2200000000000000000000000000E3E3E31CCCCCCC33C9C9
      C936C9C9C936C9C9C936C9C9C936C9C9C936C9C9C936C9C9C936C9C9C936DFDF
      DF20FDFDFD020000000000000000000000000000000000000000000000000000
      0000E9E9E91987878798817F7EE59B9797F9A09C9BFC928F8EF67E7B7BD9A0A0
      9F71000000000000000000000000000000000000000000000000FCFCFC04D1D1
      D15AB4B4B49ADADADA3CFCFCFC03000000000000000000000000000000000000
      0000FBFBFB04FEFEFE0100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE01F7F7F708E0E0E024D0D0D03AD5D5D532E7E7E718F7F7F708FEFE
      FE01000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005C4D
      42C059493FC30000000000000000000000000000000000000000F0F0F01BC2C2
      C2ACBEBEBEF4C0C0C0AEECECEC1E000000000000000000000000F5F5F50ED3D3
      D350C7C7C769EBEBEB1F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0F0
      F010BDBDBD6EB2CCB1D58DC68AFE79BD76FE82C080FEA0C69EECAEB2AE9ECBCB
      CB3BF7F7F7080000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009D9188783221
      16FF322318FF998E867A00000000000000000000000000000000F7F7F70ECACA
      CA8FC0C0C0FCC2C2C2E3E0E0E03E0000000000000000FCFCFC03DBDBDB44B8B8
      B8D3BABABAE1DADADA4B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDEDE2BD3C5
      BDD3C0D0B3FE069801FE069601FE059401FE059101FE048D01FE1B9417FE97C3
      96F7B4B5B472F3F3F30C00000000000000000000000000000000000000000000
      000000000000EAEAEA40D9D9D9FFD9D9D9FFE9EAEA42E0DBD728230F00FFD8A5
      80FFE2AF8AFF200E02FFE0DBD828000000000000000000000000FBFBFB05D4D4
      D46FBFBFBFF0C3C3C3F0D7D7D75A0000000000000000F0F0F01ABDBDBDAABDBD
      BDF8C6C6C6E7DFDFDF5000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6E6E620D8C4B8E4A944
      0BFEBEC8A8FE0FA206FE10A106FE0E9E05FE0A9A02FE079301FE048C01FE0385
      01FE6BB269FEB5B5B570F8F8F807000000000000000000000000E8E8E852E6E6
      E66100000000DADADA94D6D6D6FFD7D8D8FFDDDFE08D543016E9845232FEC28B
      64FFC58E69FF8B5B3BFE442816EC00000000000000000000000000000000E7E7
      E734BEBEBED5C2C2C2FACFCFCF7EFBFBFB04F9F9F908D3D3D35CBCBCBCE1C4C4
      C4FCD2D2D2A6F3F3F31D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD02D0C9C4B3B05719FEAE50
      0AFEC4CFAEFE20B015FE22AF17FE1FAC14FE19A60FFE119E08FE099301FE0589
      01FE048001FE97C096F5CCCCCC3A0000000000000000E7E7E752CCCCCCFFD1D1
      D1FFCFCFCFFFD6D6D6FFD0D0D0FED6D8D8FE8B6A54FF653818FE8D684BFFA076
      56FFA07656FF8E6445FF583116FF8F77679E000000000000000000000000E9E9
      E92DC6C6C6D8C4C4C4FEC6C6C6A5E1E1E12AD7D7D756C3C3C3D4C2C2C2FDCACA
      CAD2E9E9E93DFEFEFE010000000000000000000000000000000000000000DE5E
      0100DE5E0100DE5E0100000000000000000000000000000000007D00F9008000
      FF007F00FE00000000000000000000000000EAEAEA38D0A786FEB35A0FFEBB67
      1AFEE0DBCBFEBBE0B7FEBBE0B8FEB9DEB6FEB7DCB4FEB3D9B1FEB0D5ADFEA2CA
      AAFE9BC4A9FEAAC8B9FEB2B3B398F7F7F70800000000E6E6E658C2C2C2FFC2C2
      C2FFCFCFCFFFE9E9E9FFE6E6E6FFEEF0F2FF956B4EFF672800FF662D07FF977A
      5FFF9B7E61FF542404FE613111FF805C44C7000000000000000000000000E5E5
      E534C9C9C9D7D4D4D4FFCDCDCDE9BEBEBEC7C1C1C1DFD0D0D0FEC7C7C7E7DEDE
      DE68FCFCFC050000000000000000000000000000000000000000DE5E0100DE5E
      0100DE5E0100DE5E0100DE5E010000000000000000008000FF008000FF008000
      FF008000FF008000FF000000000000000000E4E3E375DEB8C2FEC98C4FFEC77B
      2BFEEBE2D7FEF0F0F0FEEFEFF0FEEFEFEFFEEEEEEEFEEDEDEDFEEBEBEBFE58A2
      F8FE1678FEFE1068FEFEAABFE2E8EBEBEB140000000000000000BFBFBFFFCCCC
      CCFFE4E3E3FFB9B6B7FF949395FF9B9B9CFFD6D6DAFFFDFFFFFF742C00FFB29A
      7EFFB59D81FF75370FFF00000000000000000000000000000000F7F7F70DD0D0
      D087D9D9D9F5E1E1E1FFD7D7D7FFD7D7D7FFD4D4D4FFD1D1D1FFCDCDCDB6EFEF
      EF1E000000000000000000000000000000000000000000000000DE5E0100DE5E
      0100DE5E0100DE5E0100DE5E010000000000000000008000FF008000FF008000
      FF008000FF008000FF000000000000000000EDE0E7AAC83D8AFEE2BBCBFEDBAA
      6FFEECE4D8FEF0F0F0FEEFEFEFFEEEEEEEFEEDEDEDFEECECECFEEBEBEBFE5FAA
      F8FE1C7FFEFE136FFEFE91B8EEFEDBDBDB29EAEAEA41D3D3D398C8C8C8FFE6E6
      E6FFCFCBCBFF4F8475FF15A76EFF16A86AFF407E6CFFD6D8DEFF8B3903FFD2C6
      ACFFD6CAAFFF8A4313FF00000000000000000000000000000000ECECEC27D1D1
      D1CAEEEEEEFFE6E6E6FFD4D4D4FFCFCFCFFFD6D6D6FFC9C9C9FFCFCFCFC2ECEC
      EC24000000000000000000000000000000000000000000000000DE5E0100DE5E
      0100DE5E0100DE5E0100DE5E010000000000000000008000FF008000FF008000
      FF008000FF008000FF000000000000000000F0DDE7B8D93C94FEDD58A5FEEBC1
      D6FEF0EEEBFEF0F0F0FEEFEFEFFEEEEEEEFEEDEDEDFEECECECFEEBEBEBFE67B8
      F8FE259AFEFE1993FEFE8EC2F1FED9D9D92DB6B6B6F9C8C8C8FFCCCCCCFEE0E0
      E0FFC8C2C4FF09AA79FF21C07AFF22C075FF0EB67EFFAEB2B7FFA75720FF9C41
      06FF983F06FFA15827FF00000000000000000000000000000000EEEEEE23D2D2
      D2C3E1E1E1FFCECECEFFBCBCBCFFC7C7C7FFD1D1D1FFC3C3C3FFD7D7D7C7EFEF
      EF26000000000000000000000000000000000000000000000000DE5E0100DE5E
      0100DE5E0100DE5E0100DE5E010000000000000000008000FF008000FF008000
      FF008000FF008000FF000000000000000000F7F1F490DB419AFEE157AAFEE76F
      B9FEF3C8E3FEF9F9F9FEF7F7F7FEF7F7F7FEF5F5F5FEF4F4F4FEF2F2F2FE6FCA
      FAFE2CABFEFE1D9BFEFEA2CCEFFCEBEBEB17BEBEBEFACFCFCFFFD5D5D5FED3D3
      D3FFCFC9CBFF17B487FF5EDFB6FF60E0B8FF1BC08FFFBBB9BCFFCED4D9FFD8E1
      E6FED4DDE2FFC8CDD1FF00000000000000000000000000000000F2F2F216C3C3
      C3A4BDBDBDF2C0C0C0FCB8B8B8FECECECEFFC9C9C9FFCFCFCFF4E1E1E188F8F8
      F80E00000000000000000000000000000000000000000000000000000000DE5E
      0100DE5E0100D95C0100000000000000000000000000000000007D00F9008000
      FF007F00FE00000000000000000000000000FAFAFA59E371B3FEE258ADFEE76C
      BBFEEB80C5FEF4C3E3FEFAFAFAFEF9F9F9FEF7F7F7FED5D4F7FEB5B2F7FE70CD
      FBFE2EB0FEFE1FA0FEFEBAC8D1BDF9F9F906F2F2F239DADADA93DEDEDEFFC8C8
      C8FFDEDADBFF90B9AFFF9CE4D1FFA2E8D5FF88B9ACFFDED9DBFFC0C0C0FFD2D2
      D2FFDADADA93F5F5F53C00000000000000000000000000000000E2E2E23FBDBD
      BD9ED7D7D773E3E3E38DE1E1E196DDDDDDACD2D2D2D4CCCCCCBBEEEEEE290000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1F1F113EFC5DFF0E253ABFEE767
      BAFEEB77C3FEED82C9FEF3B4DEFEFAF9FAFED3D1FAFE726AFDFEA6A2F9FE6FCF
      FBFE2CB1FEFE6DBFF7FEC3C3C35A000000000000000000000000D2D2D2FFE0E0
      E0FFB7B6B6FFEAE7E8FFCFD3D1FFCCD1CFFFE7E3E4FFB5B4B4FFDBDBDBFFC5C5
      C5FF0000000000000000000000000000000000000000FDFDFD02D4D4D469C6C6
      C681F9F9F909FCFCFC07FBFBFB09F9F9F910D9D9D961BABABA9EF2F2F2140000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0F0F05EE98DC5FEE55B
      B4FEE969BDFEEB71C3FEF2ADDAFECCC8FAFE746DFDFE5F57FEFEA29DF9FE6BCE
      FBFE44BAFCFEBAC4CAB6F8F8F8070000000000000000E3E3E361E9E9E9FFEBEB
      EBFFE8E8E8FFB4B4B4FFAEAEAEFFAEAEAEFFB3B3B3FFE5E5E5FFE8E8E8FFE0E0
      E0FFE3E3E3630000000000000000000000000000000000000000DCDCDC5ABBBB
      BB99EBEBEB1A0000000000000000FCFCFC03D3D3D36AC5C5C58EF7F7F70D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD02DDDADC86EB91
      C9FEE557B3FEF2B1DBFEBCB9FCFE6D64FEFE6058FEFE524BFEFE9D98F9FE87D4
      F8FEC9D9E1C7EAEAEA18000000000000000000000000E8E8E84DEFEFEFFFF1F1
      F1FFE6E6E6FFFAFAFAFFF8F8F8FEF8F8F8FEF9F9F9FFE5E5E5FFF2F2F2FFEFEF
      EFFFEBEBEB4E0000000000000000000000000000000000000000F1F1F121C4C4
      C499BCBCBC8AD6D6D644DFDFDF37CFCFCF64C2C2C2A0E1E1E147FEFEFE010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7E7
      E754F6DEEDE5C6C4FCFE5B53FEFE574FFEFE4E46FEFE5E57FCFEC4C2F6FCD0D1
      D18BF1F1F1100000000000000000000000000000000000000000E9E9E94CE8E8
      E85B00000000DBDBDB93FCFCFCFFFCFCFCFFDCDCDC9400000000EBEBEB5AF0F0
      F04E000000000000000000000000000000000000000000000000FDFDFD02EAEA
      EA35C7C7C79CB2B2B2C5B1B1B1C6BFBFBFADDEDEDE52FAFAFA08000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F4F4F40EFDFDFD50EBEBEF7EEBEBF899D6D6DD8CF8F8F962EBEBEB220000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9E9E93DEBEBEBF7EAEAEAF7E9E9E93E00000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFDFFF8000FFE1C00FCC3F8000FFE0
      C00FC01F0000FFC0C00FC00F0000FF80C001C0870000FF81C001C0C70000FF03
      C001C0470000FF030001FFC700008E070001E3FF00000C0F0001E2030000001F
      0001E3030000003F0001E0830000003F003FF0030001C063003FF8038001C003
      003FFE338003E003FFFFFFFB8007F00FC1F3FFFFF00FFFE7C1C3FFFFE007FFC3
      C183FFFFC003F801C183FFFF8001C801E003FFFF00018000E003E3C700008000
      E007C1830000C003C00FC18300000003C00FC18300000003C00FC18300000003
      C00FE3C700000003C01FFFFF0001C00F801FFFFF80018007C61FFFFF80038007
      C01FFFFFE007C84FC03FFFFFF01FF87F00000000000000000000000000000000
      000000000000}
  end
  object mnuPopup: TPopupActionBar
    Left = 992
    Top = 104
    object mniCopyToClipboard: TMenuItem
      Action = actCopyToClipboard
    end
  end
end
