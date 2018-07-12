Const
  allnumbers = '123456789';

type
  SudokuMas = array[1..9,1..9]of char;
  tgrid=array[1..9,1..9]of integer;

Var
  setka: SudokuMas;
  n,p:integer;
  Numbers, letters: string;
  result: string;
  arr,lake_grid:tgrid;
Procedure TURN;
Var
  i,k,tit:integer;
Begin
  for i:=1 to p do
    for k:=i to n-i do
    begin
      { arr[] }
      tit:=arr[i,k];
      arr[i,k]:=arr[n-k+1,i];
      arr[n-k+1,i]:=arr[n-i+1,n-k+1];
      arr[n-i+1,n-k+1]:=arr[k,n-i+1];
      arr[k,n-i+1]:=tit;
      { lake_grid[] }
      tit:=lake_grid[i,k];
      lake_grid[i,k]:=lake_grid[n-k+1,i];
      lake_grid[n-k+1,i]:=lake_grid[n-i+1,n-k+1];
      lake_grid[n-i+1,n-k+1]:=lake_grid[k,n-i+1];
      lake_grid[k,n-i+1]:=tit;
    end;
end;

var
  f:textfile;
  i,j:integer;
begin
  assignfile(f,'InSudoku1.txt'); reset(f);
  readln(f,n);
  for i:=1 to n do
    for j:=1 to n do
      read(f,arr[i,j]);
  for i:=1 to n do
    for j:=1 to n do
      read(f,lake_grid[i,j]);
  p:=n div 2;
  TURN;
  For i:=1 to n do
  begin
    for j:=1 to n do
      write(arr[i,j]:2);
    writeln;
  end;
  closefile(f);
end.