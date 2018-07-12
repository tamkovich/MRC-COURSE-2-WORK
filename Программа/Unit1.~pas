unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

Const
  allnumbers = '123456789';

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  SudokuMas = array[0..10,0..10]of char;

var
  Form1: TForm1;
  setka, oblasti: SudokuMas;
  n:integer;
  Numbers: string;
  result: string;

implementation

{$R *.dfm}

procedure TForm1.N2Click(Sender: TObject);
Var
  i,j,k:integer;
  f,f2:textfile;
  S:STRING;
begin
  if OpenDialog1.Execute then
  begin
    Assignfile(f,OpenDialog1.FileName);
    Reset(f);
    Assignfile(f2,'output.txt');
    Rewrite(f2);
    readln(f,n);
    for i:=1 to n+2 do
    begin
      read(f,s);
      k:=0;
      for j:=1 to length(s) do
        if s[j]<>' ' then
        begin
          setka[i-1][k]:=s[j];
          write(f2,s[j]);
          k:=k+1;
        end;
      readln(f);
      writeln(f2)
    end;

    closefile(f);
    closefile(f2);
  end;
end;

procedure TForm1.N5Click(Sender: TObject);
Var
  i,j:integer;
begin
  Numbers:=copy(allnumbers,1,n);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.N3Click(Sender: TObject);
Var
  i,j:integer;
  f:textfile;
begin
  Assignfile(f,'SolveSudoku.txt');
  Rewrite(f);
  for i:=1 to n do
  begin
    for j:=1 to n do
      write(f,setka[i][j],' ');
    writeln(f);
  end;
  closefile(f);
end;

function GenShablon(AvailNum:string):string;
Var
  index:integer;
Begin
  randomize;
  While AvailNum<>'' do
  begin
    index:=random(Length(AvailNum))+1;
    result:=result+AvailNum[index];
    delete(AvailNum,index,1);
  end;
  GenShablon:=result;
end;

procedure GenSetka(ShablonLine:string);
Var
  i,j:integer;
  front,backyard:string;
begin

  for i:=1 to n div 2 do
  begin
    For j:=1 to n do
      setka[i][j]:=ShablonLine[j];
    front:=Copy(ShablonLine,n-1,2);
    backyard:=Copy(ShablonLine,1,n-2);
    ShablonLine:=front+backyard;
  end;
  /////
  if n mod 2 = 0 then
  begin
    backyard:=Copy(ShablonLine,1,n-1);
    ShablonLine:=ShablonLine[n]+backyard;
  end;
  /////
  for i:=(n div 2)+1 to n do
  begin
    For j:=1 to n do
      setka[i][j]:=ShablonLine[j];
    front:=Copy(ShablonLine,n-1,2);
    backyard:=Copy(ShablonLine,1,n-2);
    ShablonLine:=front+backyard;
  end;
end;

procedure TForm1.N6Click(Sender: TObject);
Var
  i,j:integer;
  f,f2:textfile;
  ShablonLine:string;
begin
  assignfile(f,'GenSize.txt'); reset(f);
  assignfile(f2,'output.txt'); rewrite(f2);
  read(f,n);
  ShablonLine:='';
  result:='';
  For i:=0 to n+1 do
  begin
    setka[i][0]:='0';
    setka[i][n+1]:='0';
    setka[0][i]:='0';
    setka[n+1][i]:='0';
  end;
  ShablonLine:=GenShablon(Numbers);
  GenSetka(ShablonLine);
  write(f2,ShablonLine);
  closefile(f);
  closefile(f2);
end;

end.
 