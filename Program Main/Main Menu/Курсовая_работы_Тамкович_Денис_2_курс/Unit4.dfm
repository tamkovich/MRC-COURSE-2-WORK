object Form4: TForm4
  Left = 690
  Top = 155
  BorderStyle = bsToolWindow
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1053#1077#1087#1088#1080#1082#1072#1089#1072#1077#1084#1086#1075#1086' '#1089#1091#1076#1086#1082#1091
  ClientHeight = 532
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 144
    Top = 384
    Width = 85
    Height = 13
    Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1081' '#1094#1074#1077#1090
  end
  object PickColor: TPanel
    Left = 200
    Top = 408
    Width = 33
    Height = 33
    TabOrder = 11
  end
  object StringGrid1: TStringGrid
    Left = 9
    Top = 32
    Width = 337
    Height = 337
    BiDiMode = bdLeftToRight
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
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
    OnKeyPress = StringGrid1KeyPress
    OnSelectCell = StringGrid1SelectCell
  end
  object Panel1: TPanel
    Left = 16
    Top = 384
    Width = 36
    Height = 36
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Panel1Click
  end
  object Panel2: TPanel
    Left = 56
    Top = 384
    Width = 36
    Height = 36
    Color = 10320623
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Panel2Click
  end
  object Panel3: TPanel
    Left = 96
    Top = 384
    Width = 36
    Height = 36
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    OnClick = Panel3Click
  end
  object Panel4: TPanel
    Left = 16
    Top = 424
    Width = 36
    Height = 36
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Panel4Click
  end
  object Panel5: TPanel
    Left = 56
    Top = 424
    Width = 36
    Height = 36
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Panel5Click
  end
  object Panel6: TPanel
    Left = 96
    Top = 424
    Width = 36
    Height = 36
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Panel6Click
  end
  object Panel7: TPanel
    Left = 16
    Top = 464
    Width = 36
    Height = 36
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Panel7Click
  end
  object Panel8: TPanel
    Left = 56
    Top = 464
    Width = 36
    Height = 36
    Color = 4370676
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = Panel8Click
  end
  object Panel9: TPanel
    Left = 96
    Top = 464
    Width = 36
    Height = 36
    Color = clAqua
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = Panel9Click
  end
  object x8: TBitBtn
    Left = 280
    Top = 0
    Width = 25
    Height = 25
    Caption = '8x8'
    TabOrder = 12
    OnClick = x8Click
  end
  object x9: TBitBtn
    Left = 320
    Top = 0
    Width = 25
    Height = 25
    Caption = '9x9'
    TabOrder = 13
    OnClick = x9Click
  end
  object MakeShapes: TBitBtn
    Left = 152
    Top = 448
    Width = 81
    Height = 25
    Caption = #1044#1077#1083#1072#1090#1100' '#1092#1086#1088#1084#1099
    TabOrder = 14
    OnClick = MakeShapesClick
  end
  object PutNumbers: TBitBtn
    Left = 152
    Top = 480
    Width = 81
    Height = 25
    Caption = #1057#1090#1072#1074#1080#1090#1100' '#1094#1080#1092#1088#1099
    TabOrder = 15
    OnClick = PutNumbersClick
  end
  object Panel10: TPanel
    Left = 256
    Top = 376
    Width = 73
    Height = 89
    Caption = '-'
    TabOrder = 10
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
    Left = 8
    object N1: TMenuItem
      Caption = #1052#1077#1085#1102
      object N2: TMenuItem
        Caption = #1043#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1088#1077#1096#1077#1085#1080#1077
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1055#1088#1086#1081#1090#1080' '#1089#1072#1084#1086#1084#1091
        OnClick = N6Click
      end
    end
  end
end
