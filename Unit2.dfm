object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object lblBismillah: TLabel
    Left = 152
    Top = 176
    Width = 61
    Height = 15
    Caption = 'lblBismillah'
  end
  object TimerSplash: TTimer
    OnTimer = TimerSplashTimer
    Left = 528
  end
end
