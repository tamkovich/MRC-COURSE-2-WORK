object Form3: TForm3
  Left = 704
  Top = 116
  BorderStyle = bsToolWindow
  Caption = #1053#1077#1087#1088#1080#1082#1072#1089#1072#1077#1084#1086#1077' '#1089#1091#1076#1086#1082#1091
  ClientHeight = 531
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button3: TButton
    Left = 16
    Top = 440
    Width = 121
    Height = 49
    Caption = #1043#1051#1040#1042#1053#1054#1045' '#1052#1045#1053#1070
    TabOrder = 0
    OnClick = Button3Click
  end
  object Button1: TButton
    Left = 16
    Top = 384
    Width = 121
    Height = 49
    Caption = #1053#1040#1063#1040#1058#1068
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 304
    Top = 0
    Width = 49
    Height = 21
    TabOrder = 2
    Text = '00:00:00'
  end
  object StringGrid1: TStringGrid
    Left = 9
    Top = 32
    Width = 337
    Height = 337
    ColCount = 9
    DefaultColWidth = 36
    DefaultRowHeight = 36
    FixedCols = 0
    RowCount = 9
    FixedRows = 0
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Georgia'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    TabOrder = 3
    OnDrawCell = StringGrid1DrawCell
    OnKeyPress = StringGrid1KeyPress
    OnMouseMove = StringGrid1MouseMove
    OnSelectCell = StringGrid1SelectCell
  end
  object HelpPanel: TPanel
    Left = 40
    Top = 0
    Width = 217
    Height = 33
    Caption = '-'
    TabOrder = 5
    object Help1: TPanel
      Left = 0
      Top = 0
      Width = 25
      Height = 25
      Caption = '1'
      TabOrder = 0
    end
    object Help2: TPanel
      Left = 24
      Top = 0
      Width = 25
      Height = 25
      Caption = '2'
      TabOrder = 1
    end
    object Help3: TPanel
      Left = 48
      Top = 0
      Width = 25
      Height = 25
      Caption = '3'
      TabOrder = 2
    end
    object Help4: TPanel
      Left = 72
      Top = 0
      Width = 25
      Height = 25
      Caption = '4'
      TabOrder = 3
    end
    object Help5: TPanel
      Left = 96
      Top = 0
      Width = 25
      Height = 25
      Caption = '5'
      TabOrder = 4
    end
    object Help6: TPanel
      Left = 120
      Top = 0
      Width = 25
      Height = 25
      Caption = '6'
      TabOrder = 5
    end
    object Help7: TPanel
      Left = 144
      Top = 0
      Width = 25
      Height = 25
      Caption = '7'
      TabOrder = 6
    end
    object Help8: TPanel
      Left = 168
      Top = 0
      Width = 25
      Height = 25
      Caption = '8'
      TabOrder = 7
    end
    object Help9: TPanel
      Left = 192
      Top = 0
      Width = 25
      Height = 25
      Caption = '9'
      TabOrder = 8
    end
  end
  object Panel10: TPanel
    Left = 240
    Top = 384
    Width = 73
    Height = 89
    Caption = '-'
    TabOrder = 4
    object One: TButton
      Left = 0
      Top = 0
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Caption = '1'
      TabOrder = 0
      OnClick = OneClick
    end
    object Two: TButton
      Left = 24
      Top = 0
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Caption = '2'
      TabOrder = 1
      OnClick = TwoClick
    end
    object Three: TButton
      Left = 48
      Top = 0
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Caption = '3'
      TabOrder = 2
      OnClick = ThreeClick
    end
    object Four: TButton
      Left = 0
      Top = 24
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Caption = '4'
      TabOrder = 3
      OnClick = FourClick
    end
    object Five: TButton
      Left = 24
      Top = 24
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Caption = '5'
      TabOrder = 4
      OnClick = FiveClick
    end
    object Six: TButton
      Left = 48
      Top = 24
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Caption = '6'
      TabOrder = 5
      OnClick = SixClick
    end
    object Seven: TButton
      Left = 0
      Top = 48
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Caption = '7'
      TabOrder = 6
      OnClick = SevenClick
    end
    object Eight: TButton
      Left = 24
      Top = 48
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Caption = '8'
      TabOrder = 7
      OnClick = EightClick
    end
    object Nine: TButton
      Left = 48
      Top = 48
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Caption = '9'
      TabOrder = 8
      OnClick = NineClick
    end
    object RollUp: TBitBtn
      Left = 24
      Top = 72
      Width = 25
      Height = 17
      Cursor = crHandPoint
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = RollUpClick
    end
    object Clear: TButton
      Left = 48
      Top = 72
      Width = 25
      Height = 17
      Caption = 'C'
      TabOrder = 10
      OnClick = ClearClick
    end
  end
  object MainMenu1: TMainMenu
    object N1: TMenuItem
      Caption = ' '#1048#1075#1088#1072
      object N2: TMenuItem
        Caption = #1053#1086#1074#1072#1103
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1056#1077#1096#1080#1090#1100
        Enabled = False
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
        OnClick = N4Click
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 272
  end
end
