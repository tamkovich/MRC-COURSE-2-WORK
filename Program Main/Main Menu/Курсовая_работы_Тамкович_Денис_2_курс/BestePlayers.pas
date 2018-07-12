// Головоломка "Неприкасаемое судоку"
// Программист: Тамкович Д.И., гр. 62492

// Unit для вывода лучших игроков (Рекорды)
unit BestePlayers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DM, ExtCtrls, JPEG;

type
  TForm5 = class(TForm)
    Beginer: TBitBtn;
    Middle: TBitBtn;
    PROFESSOR: TBitBtn;
    MainMenu: TBitBtn;
    x8: TBitBtn;
    x9: TBitBtn;
    Gx8MIDDLE: TDBGrid;
    Gx8PROFESSOR: TDBGrid;
    Gx9MIDDLE: TDBGrid;
    Gx9PROFESSOR: TDBGrid;
    Gx9BEGINER: TDBGrid;
    Gx8BEGINER: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Image1: TImage;
    AroundPanel1: TPanel;
    AroundPanel2: TPanel;
    procedure FormShow(Sender: TObject); // оформление формы при её отображении
    procedure FormClose(Sender: TObject; var Action: TCloseAction); // закрытие формы
    procedure MainMenuClick(Sender: TObject); // кнопка ГЛАВНОЕ МЕНЮ
    procedure BeginerClick(Sender: TObject); // кнопка НОВИЧОК (выбор статистики со сложностью НОВИЧОК)
    procedure MiddleClick(Sender: TObject); // кнопка ЛЮБИТЕЛЬ (выбор статистики со сложностью ЛЮБИТЕЛЬ)
    procedure PROFESSORClick(Sender: TObject); // кнопка ПРОФЕССОР (выбор статистики со сложностью ПРОФЕССОР)
    procedure x8Click(Sender: TObject); // кнопка для статистки с размерностью  поля 8x8
    procedure x9Click(Sender: TObject); // кнопка для статистки с размерностью поля 9x9

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  n, level:integer;

implementation

{$R *.dfm}

Uses Unit1;

procedure TForm5.MainMenuClick(Sender: TObject);
begin
  FormHome.Show;
  Form5.Hide;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  Gx8BEGINER.Height:=385;
  Gx8MIDDLE.Height:=385;
  Gx8MIDDLE.Top:=88;
  Gx8PROFESSOR.Height:=385;
  Gx8PROFESSOR.Top:=88;
  Gx9BEGINER.Height:=385;
  Gx9BEGINER.Top:=88;
  Gx9MIDDLE.Height:=385;
  Gx9MIDDLE.Top:=88;
  Gx9PROFESSOR.Height:=385;
  Gx9PROFESSOR.Top:=88;


  Gx8MIDDLE.Hide;
  Gx8PROFESSOR.Hide;
  Gx9BEGINER.Hide;
  Gx9MIDDLE.Hide;
  Gx9PROFESSOR.Hide;

  x8.Enabled:=False;
  Beginer.Enabled:=False;
  Gx8BEGINER.Show;

  x9.Enabled:=True;
  Middle.Enabled:=True;
  Professor.Enabled:=True;

  level:=0;
  n:=8;
end;

procedure TForm5.MiddleClick(Sender: TObject);
begin
  case level of
    0: Beginer.Enabled:=True;
    1: Middle.Enabled:=True;
    2: Professor.Enabled:=True;
  end;
  Middle.Enabled:=False;
  case n of
    8: begin
          case level of
            0: Gx8BEGINER.Hide;
            1: Gx8MIDDLE.Hide;
            2: Gx8PROFESSOR.Hide;
          end;
          Gx8MIDDLE.Show;
       end;
    9: begin
          case level of
            0: Gx9BEGINER.Hide;
            1: Gx9MIDDLE.Hide;
            2: Gx9PROFESSOR.Hide;
          end;
          Gx9MIDDLE.Show;
       end;
  end;
  level:=1;
end;

procedure TForm5.BeginerClick(Sender: TObject);
begin
  case level of
    0: Beginer.Enabled:=True;
    1: Middle.Enabled:=True;
    2: Professor.Enabled:=True;
  end;
  Beginer.Enabled:=False;
  case n of
    8: begin
          case level of
            0: Gx8BEGINER.Hide;
            1: Gx8MIDDLE.Hide;
            2: Gx8PROFESSOR.Hide;
          end;
          Gx8BEGINER.Show;
       end;
    9: begin
          case level of
            0: Gx9BEGINER.Hide;
            1: Gx9MIDDLE.Hide;
            2: Gx9PROFESSOR.Hide;
          end;
          Gx9BEGINER.Show;
       end;
  end;
  level:=0;
end;

procedure TForm5.PROFESSORClick(Sender: TObject);
begin
  case level of
    0: Beginer.Enabled:=True;
    1: Middle.Enabled:=True;
    2: Professor.Enabled:=True;
  end;
  Professor.Enabled:=False;
  case n of
    8: begin
          case level of
            0: Gx8BEGINER.Hide;
            1: Gx8MIDDLE.Hide;
            2: Gx8PROFESSOR.Hide;
          end;
          Gx8PROFESSOR.Show;
       end;
    9: begin
          case level of
            0: Gx9BEGINER.Hide;
            1: Gx9MIDDLE.Hide;
            2: Gx9PROFESSOR.Hide;
          end;
          Gx9PROFESSOR.Show;
       end;
  end;
  level:=2;
end;

procedure TForm5.x8Click(Sender: TObject);
begin
  x8.Enabled:=False;
  x9.Enabled:=True;
  case level of
    0: begin
        Gx9BEGINER.Hide;
        Gx8BEGINER.Show;
       end;
    1: begin
        Gx9MIDDLE.Hide;
        Gx8MIDDLE.Show;
       end;
    2: begin
        Gx9PROFESSOR.Hide;
        Gx8PROFESSOR.Show;
       end;
  end;
  n:=8;
end;

procedure TForm5.x9Click(Sender: TObject);
begin
  x9.Enabled:=False;
  x8.Enabled:=True;
  case level of
    0: begin
        Gx8BEGINER.Hide;
        Gx9BEGINER.Show;
       end;
    1: begin
        Gx8MIDDLE.Hide;
        Gx9MIDDLE.Show;
       end;
    2: begin
        Gx8PROFESSOR.Hide;
        Gx9PROFESSOR.Show;
       end;
  end;
  n:=9;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormHome.Close;
end;

end.
