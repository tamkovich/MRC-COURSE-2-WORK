// Головоломка "Неприкасаемое судоку"
// Программист: Тамкович Д.И., гр. 62492

// Приветсвующее меню
unit Unit1;

interface

// в uses следует подключить модуль ShellAPI для того,
// чтобы возможно было использовать процедуры для отображения
// справки помощи с расширением ".chm"
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2, BestePlayers, HelpPage, jpeg, ExtCtrls, ShellAPI;

type
  TFormHome = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Image1: TImage;
    NameGamePanel: TPanel;
    NameGameLabel: TLabel;
    procedure Button1Click(Sender: TObject); // кнопка НАЧАТЬ
    procedure Button2Click(Sender: TObject); // кнопка НАЧАТЬ
    procedure Button3Click(Sender: TObject); // кнопка ВЫЙТИ
    procedure Button4Click(Sender: TObject); // кнопка СПРАВКА
    procedure FormClose(Sender: TObject; var Action: TCloseAction); // закрытие формы
    procedure FormKeyDown(Sender: TObject; var Key: Word; // отслеживание нажатия клавиши
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome: TFormHome;

implementation

{$R *.dfm}

// Кнопка НАЧАТЬ
procedure TFormHome.Button1Click(Sender: TObject);
begin
  Form2.Show;
  FormHome.Hide;
end;

// Кнопка ВЫЙТИ
procedure TFormHome.Button3Click(Sender: TObject);
begin
  close;
end;

// Кнопка РЕКОРДЫ
procedure TFormHome.Button2Click(Sender: TObject);
begin
  Form5.Show;
  FormHome.Hide;
end;

// Кнопка СПРАВКА
procedure TFormHome.Button4Click(Sender: TObject);
begin
  // Справка - 'static\helpDoc.chm'
  ShellExecute(Handle, 'Open', 'static\helpDoc.chm', nil, nil,SW_SHOW);
end;

procedure TFormHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  exit;
end;

{ Нажатие на клавишу F1 }
procedure TFormHome.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // VK_F1 == 'F1'
  if key = VK_F1 then
  // Открытие помощи
    ShellExecute(Handle, 'Open', 'static\helpDoc.chm', nil, nil,SW_SHOW);
end;

end.
