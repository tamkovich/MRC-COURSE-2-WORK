// Головоломка "Неприкасаемое судоку"
// Программист: Тамкович Д.И., гр. 62492

// Unit для создания своего собственного игрового поля

unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Menus, StdCtrls, Buttons, BACTREKING, AUTOSOLUTION;

type
  TForm4 = class(TForm)
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Panel10: TPanel;
    One: TButton;
    Two: TButton;
    Three: TButton;
    Four: TButton;
    Five: TButton;
    Six: TButton;
    Seven: TButton;
    Eight: TButton;
    Nine: TButton;
    RollUp: TBitBtn;
    Clear: TButton;
    PickColor: TPanel;
    Label1: TLabel;
    x8: TBitBtn;
    x9: TBitBtn;
    MakeShapes: TBitBtn;
    PutNumbers: TBitBtn;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure FormCreate(Sender: TObject); // оформление формы при её создании
    procedure FormShow(Sender: TObject); // оформление формы при её отображении
    procedure FormClose(Sender: TObject; var Action: TCloseAction); // закрытие формы
    procedure Panel1Click(Sender: TObject); // выбор панели для окрашивания поля в белый цвет
    procedure Panel2Click(Sender: TObject); // выбор панели для окрашивания поля в розовый цвет
    procedure Panel3Click(Sender: TObject); // выбор панели для окрашивания поля в зеленый цвет
    procedure Panel4Click(Sender: TObject); // выбор панели для окрашивания поля в желтый цвет
    procedure Panel5Click(Sender: TObject); // выбор панели для окрашивания поля в синий цвет
    procedure Panel6Click(Sender: TObject); // выбор панели для окрашивания поля в clMoneyGreen цвет
    procedure Panel7Click(Sender: TObject); // выбор панели для окрашивания поля в серый цвет
    procedure Panel8Click(Sender: TObject); // выбор панели для окрашивания поля в оранжевый цвет
    procedure Panel9Click(Sender: TObject); // выбор панели для окрашивания поля в аква цвет
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean); // отслежавние выбора ячейки таюлицы(игрового поля)
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char); // отслеживание ввода символов с клавиатуры в ячейку
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState); // заполнение таблицы(игового поля) значениями
    // и окрашивание соответсвующих блоков для игры
    procedure RollUpClick(Sender: TObject); // сворачивание панели для заполнения ячеек цифрами
    procedure OneClick(Sender: TObject); // заполнение ячейки цифрой 1
    procedure TwoClick(Sender: TObject); // заполнение ячейки цифрой 2
    procedure ThreeClick(Sender: TObject); // заполнение ячейки цифрой 3
    procedure FourClick(Sender: TObject); // заполнение ячейки цифрой 4
    procedure FiveClick(Sender: TObject); // заполнение ячейки цифрой 5
    procedure SixClick(Sender: TObject); // заполнение ячейки цифрой 6
    procedure SevenClick(Sender: TObject); // заполнение ячейки цифрой 7
    procedure EightClick(Sender: TObject); // заполнение ячейки цифрой 8
    procedure NineClick(Sender: TObject); // заполнение ячейки цифрой 9
    procedure ClearClick(Sender: TObject); // удаление содержимого ячейки с цифрой
    procedure MakeShapesClick(Sender: TObject); // активация окрашивания таблицы(игрового поля)
    procedure PutNumbersClick(Sender: TObject); // активация заполнения циврами таблицы(игрового поля)
    procedure x8Click(Sender: TObject); // выбор размерности поля 8x8
    procedure x9Click(Sender: TObject); // выбор размерности поля 9x9
    procedure N2Click(Sender: TObject); // кнопка в меню Меню/Главное меню
    procedure N3Click(Sender: TObject); // кнопка в меню Меню/Проверить
    procedure N4Click(Sender: TObject); // кнопка в меню Меню/Отправить
    procedure N5Click(Sender: TObject); // кнопка в меню Меню/Показать решение
    procedure N6Click(Sender: TObject); // кнопка в меню Меню/Пройти самому
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  colorid: integer;
  a,lake_grid,resha,gl:tgrid;
  n:integer;

  filename, letters:string;
  levelnames:array[0..2]of string;
  kol, level:integer;

  colcount:integer;
  covered:boolean;
  was_standart,was:array[1..9,1..9]of boolean;
  
implementation

uses Unit1, Unit2, Unit3;

{$R *.dfm}

procedure TForm4.N2Click(Sender: TObject);
begin
  FormHome.Show;
  Form4.Hide;
end;

procedure TForm4.FormShow(Sender: TObject);
Var
  i,j:integer;
begin
  { кнопки меню }
  N2.Enabled:=True;
  N3.Enabled:=True;
  N4.Enabled:=False;
  N5.Enabled:=False;
  N6.Enabled:=False; // пройти самому
  covered:=False;
  colorid:=5;
  Panel10.Hide;
  n:=9;
  For i:=1 to n do
    For j:=1 to n do
    begin
      lake_grid[i,j]:=5;
      was_standart[i,j]:=False;
    end;
  PickColor.Color:=clBlue;
  StringGrid1.ColCount:=n;
  StringGrid1.RowCount:=n;
  { кнопки размерности поля }
  x8.Enabled:=True;
  x9.Enabled:=False;
  { кнопки создания на поле }
  PutNumbers.Enabled:=True;
  MakeShapes.Enabled:=False;
end;

procedure TForm4.Panel1Click(Sender: TObject);
begin
  colorid:=1;
  PickColor.Color:=clWindow;
end;

procedure TForm4.Panel2Click(Sender: TObject);
begin
  colorid:=2;
  PickColor.Color:=rgb(239, 122, 157);
end;

procedure TForm4.Panel3Click(Sender: TObject);
begin
  colorid:=3;
  PickColor.Color:=clGreen;
end;

procedure TForm4.Panel4Click(Sender: TObject);
begin
  colorid:=4;
  PickColor.Color:=clYellow;
end;

procedure TForm4.Panel5Click(Sender: TObject);
begin
  colorid:=5;
  PickColor.Color:=clBlue;
end;

procedure TForm4.Panel6Click(Sender: TObject);
begin
  colorid:=6;
  PickColor.Color:=clMoneyGreen;
end;

procedure TForm4.Panel7Click(Sender: TObject);
begin
  colorid:=7;
  PickColor.Color:=clGray;
end;

procedure TForm4.Panel8Click(Sender: TObject);
begin
  colorid:=8;
  PickColor.Color:=rgb(244, 176, 66);
end;

procedure TForm4.Panel9Click(Sender: TObject);
begin
  colorid:=9;
  PickColor.Color:=clAqua;
end;

procedure TForm4.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if not covered then
  begin
    if PutNumbers.Enabled then
      if lake_grid[ARow+1,ACol+1]<>colorid then
      begin
        N4.Enabled:=False;
        lake_grid[ARow+1,ACol+1]:=colorid;
      end;
    if MakeShapes.Enabled then
    begin
      Panel10.Left:=0+32*Acol+8*(Acol div 2);
      Panel10.Top:=72+38*Arow-2*(Arow div 2);
      Panel10.Show;
    end;
  end;
end;

Procedure GetPutKoordGrid(Left, Top:integer; Var ACol:integer; Var ARow:integer);
begin
  ACol:=round((Left/33)-0.25);
  ARow:=round((Top+2-72)/38);
End;

procedure TForm4.RollUpClick(Sender: TObject);
begin
  Panel10.Hide;
end;

// Процедуры для выбора цифры, которую следует поставить
{
  [TForm3.OneClick ... TForm3.NineClick] + TForm3.ClearClick
}
procedure TForm4.OneClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  StringGrid1.Cells[ACol,Arow]:='1';
  if 1<>a[ARow+1,ACol+1] then
  begin
    N4.Enabled:=False;
    a[ARow+1,ACol+1]:=1;
  end;
end;

procedure TForm4.TwoClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  StringGrid1.Cells[ACol,Arow]:='2';
  if 2<>a[ARow+1,ACol+1] then
  begin
    N4.Enabled:=False;
    a[ARow+1,ACol+1]:=2;
  end;
end;

procedure TForm4.ThreeClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  StringGrid1.Cells[ACol,Arow]:='3';
  if 3<>a[ARow+1,ACol+1] then
  begin
    N4.Enabled:=False;
    a[ARow+1,ACol+1]:=3;
  end;
end;

procedure TForm4.FourClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  StringGrid1.Cells[ACol,Arow]:='4';
  if 4<>a[ARow+1,ACol+1] then
  begin
    N4.Enabled:=False;
    a[ARow+1,ACol+1]:=4;
  end;
end;

procedure TForm4.FiveClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  StringGrid1.Cells[ACol,Arow]:='5';
  if 5<>a[ARow+1,ACol+1] then
  begin
    N4.Enabled:=False;
    a[ARow+1,ACol+1]:=5;
  end;
end;

procedure TForm4.SixClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  StringGrid1.Cells[ACol,Arow]:='6';
  if 6<>a[ARow+1,ACol+1] then
  begin
    N4.Enabled:=False;
    a[ARow+1,ACol+1]:=6;
  end;
end;

procedure TForm4.SevenClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  StringGrid1.Cells[ACol,Arow]:='7';
  if 7<>a[ARow+1,ACol+1] then
  begin
    N4.Enabled:=False;
    a[ARow+1,ACol+1]:=7;
  end;
end;

procedure TForm4.EightClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  StringGrid1.Cells[ACol,Arow]:='8';
  if 8<>a[ARow+1,ACol+1] then
  begin
    N4.Enabled:=False;
    a[ARow+1,ACol+1]:=8;
  end;
end;

procedure TForm4.NineClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  StringGrid1.Cells[ACol,Arow]:='9';
  if 9<>a[ARow+1,ACol+1] then
  begin
    N4.Enabled:=False;
    a[ARow+1,ACol+1]:=9;
  end;
end;

procedure TForm4.ClearClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  StringGrid1.Cells[ACol,Arow]:='';
  if 0<>a[ARow+1,ACol+1] then
  begin
    N4.Enabled:=False;
    a[ARow+1,ACol+1]:=0;
  end;
end;

procedure TForm4.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  Key:=#0;
end;

procedure TForm4.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  case lake_grid[ARow+1,ACol+1] of
    1:  StringGrid1.Canvas.Brush.Color:=clWindow;
    2:  StringGrid1.Canvas.Brush.Color:=rgb(239, 122, 157);
    3:  StringGrid1.Canvas.Brush.Color:=clGreen;
    4:  StringGrid1.Canvas.Brush.Color:=clYellow;
    5:  StringGrid1.Canvas.Brush.Color:=clBlue;
    6:  StringGrid1.Canvas.Brush.Color:=clMoneyGreen;
    7:  StringGrid1.Canvas.Brush.Color:=clGray;
    8:  StringGrid1.Canvas.Brush.Color:=rgb(244, 176, 66);
    9:  StringGrid1.Canvas.Brush.Color:=clAqua;
  end;
  StringGrid1.Canvas.FillRect(Rect);
  StringGrid1.Canvas.Font.Color:=clWindowText;
  StringGrid1.Canvas.TextOut(Rect.Left+10, Rect.Top+8, StringGrid1.Cells[ACol, ARow]);
end;

procedure TForm4.MakeShapesClick(Sender: TObject);
begin
  Panel10.Hide;
  MakeShapes.Enabled:=False;
  PutNumbers.Enabled:=True;
end;

procedure TForm4.PutNumbersClick(Sender: TObject);
begin
  PutNumbers.Enabled:=False;
  MakeShapes.Enabled:=True;
end;

procedure TForm4.x8Click(Sender: TObject);
begin
  n:=8;
  StringGrid1.Height:=300;
  StringGrid1.Width:=300;
  StringGrid1.ColCount:=n;
  StringGrid1.RowCount:=n;
  x8.Enabled:=False;
  x9.Enabled:=True;

  Nine.Enabled:=False;
end;

procedure TForm4.x9Click(Sender: TObject);
begin
  n:=9;
  StringGrid1.Height:=337;
  StringGrid1.Width:=337;  
  StringGrid1.ColCount:=n;
  StringGrid1.RowCount:=n;
  x9.Enabled:=False;
  x8.Enabled:=True;

  Nine.Enabled:=True;
end;

Procedure prohod(i,j,id:integer);
Begin
  was[i,j]:=True;
  if i>1 then
    if gl[i-1,j]=id then
     if not was[i-1,j] then
      prohod(i-1,j,id);
  if i<n then
    if gl[i+1,j]=id then
     if not was[i+1,j] then
      prohod(i+1,j,id);
  if j>1 then
    if gl[i,j-1]=id then
     if not was[i,j-1] then
      prohod(i,j-1,id);
  if j<n then
    if gl[i,j+1]=id then
     if not was[i,j+1] then
      prohod(i,j+1,id);
end;

procedure TForm4.N3Click(Sender: TObject);
Var
  i,j,nfg:integer;
  pn:array[1..9]of integer;
  negotovo:boolean;
  solve_koef:real;
  fod:array[1..9]of integer;
  fin, fout:textfile;
  hot,mas_was:string;
begin
  mas_was:='12345678';
  if n=9 then
    mas_was:='123456789';
  for i:=1 to n do
  begin
    pn[i]:=0;
    fod[i]:=i;
  end;
  hot:='';
  for i:=1 to n do
    for j:=1 to n do
    begin
      was[i,j]:=False;
      resha[i,j]:=a[i,j];
      if pos(inttostr(lake_grid[i,j]),hot)=0 then
      begin
        hot:=hot+inttostr(lake_grid[i,j]);
        gl[i,j]:=fod[length(hot)];
      end
      else
        gl[i,j]:=fod[pos(inttostr(lake_grid[i,j]),hot)];
    end;
  negotovo:=False;
  nfg:=0;
  For i:=1 to n do
  begin
    For j:=1 to n do
    begin
      inc(pn[gl[i,j]]);
      if a[i,j]>0 then
        inc(nfg);
      if pn[gl[i,j]]>n then
      begin
        negotovo:=True;
        break;
      end;
    end;
    if negotovo then
      break;
  end;

  if nfg<(n+2) then
    negotovo:=True;
  if negotovo then
    ShowMessage('Неготовое судоку. Доработайте его. Неправильные формы или мало чисел(меньше '+inttostr(n+2)+')!')
  else
  begin
    for i:=1 to n do
      for j:=1 to n do
        if not was[i,j] then
          if pos(inttostr(gl[i,j]),mas_was)>0 then
          begin
            prohod(i,j, gl[i,j]);
            delete(mas_was,pos(inttostr(gl[i,j]),mas_was),1);
          end;
    for i:=1 to n do
      for j:=1 to n do
        if not was[i,j] then
        begin
          negotovo:=True;
          break;
        end;
    if negotovo then
      ShowMessage('Неготовое судоку. Доработайте его. Неправильные формы')
    else
    begin
      get_resh(resha, gl, n, negotovo);
      if not negotovo then
        ShowMessage('Неготовое судоку. Его не решить!')
      else
      begin
        level:=0;
        get_solve_koef(a, gl, n, solve_koef);
        filename:='SETKI\';
        if solve_koef>65 then
          level:=2
        else
        if solve_koef>20 then
          level:=1;
        letters:='ABCDEFGH';
        if n=9 then
          letters:=letters+'I';
        filename:=filename+levelnames[level]+'\SETKA'+inttostr(n)+'\';
        assignfile(fin,filename+'kol.txt'); reset(fin);
        read(fin, kol);
        closefile(fin);
        colcount:=n;
        ShowMessage('Сложность: '+levelnames[level]);
        N4.Enabled:=True;
        N5.Enabled:=True;
        N6.Enabled:=True;
      end;
    end;
  end;
end;

procedure TForm4.N4Click(Sender: TObject);
Var
  fin, fout:textfile;
  i,j:integer;
begin
  inc(kol); { новое поле добавляем }
  assignfile(fout,filename+'kol.txt'); rewrite(fout);
  write(fout, kol);
  closefile(fout);

  filename:=filename+'setka'+inttostr(kol)+'.txt';
  assignfile(fout,filename); rewrite(fout);
  writeln(fout, letters);
  writeln(fout);
  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
      if a[i,j]=0 then
        write(fout,'.')
      else
        write(fout, letters[a[i,j]]);
    end;
    writeln(fout);
  end;
  writeln(fout);
  for i:=1 to n do
  begin
    for j:=1 to n do
      write(fout,lake_grid[i,j],' ');
    writeln(fout);
  end;
  closefile(fout);
  N4.Enabled:=False;
  ShowMessage('Спасибо! Ваше судоку доступно теперь всем игрокам. Cложность: '+Levelnames[level]);
end;

procedure TForm4.N5Click(Sender: TObject);
Var
  i,j:integer;
begin
  if not covered then
  begin
    N5.Caption:='Вернуть свои изменения';
    x8.Enabled:=False;
    x9.Enabled:=False;
    MakeShapes.Enabled:=False;
    PutNumbers.Enabled:=False;
    StringGrid1.ColCount:=colcount;
    StringGrid1.RowCount:=colcount;
    if colcount=8 then
    begin
      StringGrid1.Height:=300;
      StringGrid1.Width:=300;
    end
    else
    begin
      StringGrid1.Height:=337;
      StringGrid1.Width:=337;
    end;
    covered:=True;
    For i:=1 to n do
      for j:=1 to n do
        StringGrid1.Cells[j-1,i-1]:=inttostr(resha[i,j]);
  end
  else
  begin
    N5.Caption:='Показать решение';
    if n=8 then
      x8.Enabled:=True
    else
      x9.Enabled:=True;
    MakeShapes.Enabled:=True;
    PutNumbers.Enabled:=False;
    StringGrid1.ColCount:=n;
    StringGrid1.RowCount:=n;
    if n=8 then
    begin
      StringGrid1.Height:=300;
      StringGrid1.Width:=300;
    end
    else
    begin
      StringGrid1.Height:=337;
      StringGrid1.Width:=337;
    end;
    covered:=False;
    For i:=1 to n do
      For j:=1 to n do
        if a[i,j]=0 then
          StringGrid1.Cells[j-1,i-1]:=''
        else
          StringGrid1.Cells[j-1,i-1]:=inttostr(a[i,j]);
  end;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormHome.Close;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  levelnames[0]:='BEGINER';
  levelnames[1]:='MIDDLE';
  levelnames[2]:='PROFESSOR';
end;

procedure TForm4.N6Click(Sender: TObject);
Var
  i,j:integer;
begin
  Unit2.n:=n;
  Unit2.level:=level;
  Form2.RadioGroup1.ItemIndex:=n-8;
  Form2.RadioGroup2.ItemIndex:=level;
  For i:=1 to n do
    For j:=1 to n do
    begin
      Unit2.arr[i,j]:=a[i,j];
      Unit2.lake_grid[i,j]:=lake_grid[i,j];
    end;
  Form3.Show;
end;

end.
