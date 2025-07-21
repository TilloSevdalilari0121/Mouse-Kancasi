object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object lblX: TLabel
    Left = 149
    Top = 25
    Width = 125
    Height = 31
    Caption = 'X Koordinat'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblY: TLabel
    Left = 149
    Top = 59
    Width = 124
    Height = 31
    Caption = 'Y Koordinat'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblDuration: TLabel
    Left = 149
    Top = 95
    Width = 45
    Height = 31
    Caption = 'S'#252're'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblClicks: TLabel
    Left = 149
    Top = 127
    Width = 142
    Height = 31
    Caption = 'T'#305'klama Say'#305's'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnStart: TButton
    Left = 298
    Top = 208
    Width = 111
    Height = 25
    Caption = 'Ba'#351'lat'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object btnStop: TButton
    Left = 298
    Top = 256
    Width = 111
    Height = 25
    Caption = 'Dur'
    TabOrder = 1
    OnClick = btnStopClick
  end
  object edtX: TEdit
    Left = 298
    Top = 35
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'edtX'
  end
  object edtY: TEdit
    Left = 298
    Top = 64
    Width = 121
    Height = 23
    TabOrder = 3
    Text = 'edtY'
  end
  object edtDuration: TEdit
    Left = 298
    Top = 105
    Width = 121
    Height = 23
    TabOrder = 4
    Text = '100'
  end
  object edtClicks: TEdit
    Left = 298
    Top = 134
    Width = 121
    Height = 23
    TabOrder = 5
    Text = '25'
  end
  object Button1: TButton
    Left = 298
    Top = 304
    Width = 111
    Height = 25
    Caption = 'Yeni Koordinat al'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 48
    Top = 209
    Width = 243
    Height = 208
    Cursor = crHandPoint
    BorderStyle = bsNone
    Lines.Strings = (
      'Nas'#305'l '#199'al'#305#351#305'r :'
      'Program ba'#351'lad'#305#287#305'n da mouse istedi'#287'in '
      'Koordinata g'#246't'#252'r Sa'#287' tu'#351'a t'#305'kla.'
      'S'#252're yazan yere ka'#231' saniye '#231'al'#305#351'aca'#287#305'n'#305' yaz'
      'T'#305'klama Say'#305's'#305' yazan yere Ka'#231' defa '
      't'#305'klanaca'#287#305'n'#305' yaz'
      'Ba'#351'lat tu'#351'una bas.'
      'Bitmeden durdurmak istersen herhangi bir '
      'yerde mouse sol tu'#351'una bas.')
    ReadOnly = True
    TabOrder = 7
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 568
    Top = 56
  end
  object TimerMouse: TTimer
    OnTimer = TimerMouseTimer
    Left = 568
    Top = 120
  end
end
