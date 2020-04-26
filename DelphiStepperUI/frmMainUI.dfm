object formMainUI: TformMainUI
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Arduino'
  ClientHeight = 578
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -29
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 33
  object Label1: TLabel
    Left = 72
    Top = 24
    Width = 123
    Height = 33
    Caption = 'Com Port'
  end
  object memoLog: TMemo
    Left = 21
    Top = 184
    Width = 754
    Height = 330
    TabOrder = 0
  end
  object btnLeft: TButton
    Left = 21
    Top = 520
    Width = 139
    Height = 40
    Caption = 'Left'
    TabOrder = 1
    OnClick = btnSideClick
  end
  object btnRight: TButton
    Left = 190
    Top = 520
    Width = 139
    Height = 40
    Caption = 'Right'
    TabOrder = 2
    OnClick = btnSideClick
  end
  object SpinEdit1: TSpinEdit
    Left = 218
    Top = 21
    Width = 59
    Height = 43
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 16
  end
  object btnConnect: TButton
    Left = 21
    Top = 78
    Width = 308
    Height = 42
    Caption = 'Connect'
    TabOrder = 4
    OnClick = btnConnectClick
  end
  object btnDisconnect: TButton
    Left = 21
    Top = 136
    Width = 308
    Height = 42
    Caption = 'Disconnect'
    TabOrder = 5
    OnClick = btnDisconnectClick
  end
  object COM: TApdComPort
    ComNumber = 16
    Baud = 115200
    PromptForPort = False
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    LogHex = False
    Left = 160
    Top = 280
  end
end
