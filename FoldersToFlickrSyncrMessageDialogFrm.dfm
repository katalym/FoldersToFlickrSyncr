object CustomMessageForm: TCustomMessageForm
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Select User'
  ClientHeight = 174
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object imaImage: TImage
    AlignWithMargins = True
    Left = 12
    Top = 16
    Width = 32
    Height = 115
    Margins.Left = 12
    Margins.Top = 16
    Margins.Right = 16
    Align = alLeft
  end
  object scbMessage: TScrollBox
    Left = 60
    Top = 0
    Width = 221
    Height = 134
    HorzScrollBar.Smooth = True
    HorzScrollBar.Tracking = True
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    ParentBackground = True
    PopupMenu = mnuPopup
    TabOrder = 0
    object lblMessage: TLabel
      Left = 0
      Top = 16
      Width = 3
      Height = 13
      PopupMenu = mnuPopup
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 134
    Width = 281
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnAutoClose: TSpeedButton
      Left = 0
      Top = 0
      Width = 177
      Height = 22
      Caption = 'Click to Cancel - Close in %d secs'
      OnClick = btnAutoCloseClick
    end
  end
  object mnuPopup: TPopupActionBar
    Left = 128
    Top = 88
    object mniCopyToClipboard: TMenuItem
      Caption = 'Copy To Clipboard'
      OnClick = mniCopyToClipboardClick
    end
  end
  object tmrAutoClose: TTimer
    Enabled = False
    OnTimer = tmrAutoCloseTimer
    Left = 216
    Top = 8
  end
end
