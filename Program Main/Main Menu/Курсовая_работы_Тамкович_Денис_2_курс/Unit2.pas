// Головоломка "Неприкасаемое судоку"
// Программист: Тамкович Д.И., гр. 62492

// Меню для выбора уровней сложности и разверности игрового поля
unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, GenSudoku, Unit3, Unit4, jpeg;

type
  TForm2 = class(TForm)
    RadioGroup1: TRadioGroup;           
    RadioGroup2: TRadioGroup;
    Username: TEdit;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    CreateSudoku: TButton;
    Image1: TImage;
    procedure Button2Click(Sender: TObject); // кнопка ГЛАВНОЕ МЕНЮ
    procedure Button3Click(Sender: TObject); // кнопка НАЧАТЬ
    procedure FormCreate(Sender: TObject);   // оформление формы при её создании
    procedure CreateSudokuClick(Sender: TObject); // кнопка Создать
    procedure UsernameKeyPress(Sender: TObject; var Key: Char); // отслеживание вводимых символов
    procedure FormClose(Sender: TObject; var Action: TCloseAction); // закртыие формы
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  arr,lake_grid:tgrid;
  n:integer;
  level:integer;

implementation

uses Unit1;

{$R *.dfm}


procedure TForm2.Button2Click(Sender: TObject);
begin
  FormHome.Show;
  Form2.Hide;
end;

procedure TForm2.Button3Click(Sender: TObject);
Var
  i,j:integer;
  fin:textfile;
  filename:string;
  levelnames:array[0..2]of string;
  kol:integer;
begin
  levelnames[0]:='BEGINER';
  levelnames[1]:='MIDDLE';
  levelnames[2]:='PROFESSOR';
  n:=RadioGroup1.ItemIndex + 8;
  level:=RadioGroup2.ItemIndex;
  filename:='SETKI\'+levelnames[level]+'\SETKA'+inttostr(n)+'\';
  assignfile(fin,filename+'kol.txt'); reset(fin);
  read(fin,kol);
  closefile(fin);
  filename:=filename+'setka'+inttostr(random(kol)+1)+'.txt';
  GenSetka(arr,lake_grid,n,filename);

  Form3.Show;
  Form2.Hide;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=0;
  RadioGroup2.ItemIndex:=0;
end;

procedure TForm2.CreateSudokuClick(Sender: TObject);
begin
  Form4.Show;
  Form2.Hide;
end;

procedure TForm2.UsernameKeyPress(Sender: TObject; var Key: Char);
begin
  if (length(Username.Text)=15) and (not (key=#8)) then
    Key:=#0
  else
    if length(Username.Text)=0 then
      if not (key in ['a'..'z', 'A'..'Z']) then
        key:=#0
  else
    if not (key in ['a'..'z', 'A'..'Z', '0'..'9', #8]) then
      Key:=#0;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormHome.Close;
end;

end.
