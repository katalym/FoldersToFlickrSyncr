object SelectUserDialogForm: TSelectUserDialogForm
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
  object pnlButtons: TPanel
    Left = 0
    Top = 117
    Width = 281
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object btnOK: TBitBtn
      AlignWithMargins = True
      Left = 128
      Top = 6
      Width = 65
      Height = 25
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alRight
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
    end
    object btnCancel: TBitBtn
      AlignWithMargins = True
      Left = 205
      Top = 6
      Width = 70
      Height = 25
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alRight
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object rgrUsers: TRadioGroup
    AlignWithMargins = True
    Left = 6
    Top = 6
    Width = 269
    Height = 105
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alTop
    Caption = ' Users with registered access '
    Items.Strings = (
      'user 1'
      'user 2')
    TabOrder = 1
  end
end
