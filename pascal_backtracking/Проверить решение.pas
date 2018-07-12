Type
  tgrid=array[1..9,1..9]of integer;
Var
  f:textfile;
  n,i,j:integer;
  cl,numbers:string;
  lake_grid,a:tgrid;
  bly:array[1..9]of string;
  neresheno:boolean;
Begin
  neresheno:=False;
  assignfile(f,'InSudoku1.txt'); reset(f);
  readln(f,n);
  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
      read(f,a[i,j]);
    end;
    readln(f);
  end;
  readln(f);
  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
      read(f,lake_grid[i,j]);
    end;
    readln(f);
  end;
  closefile(f);
  assignfile(f,'bk1.txt'); reset(f);
  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
      read(f,a[i,j]);
    end;
    readln(f);
  end;
  closefile(f);
  numbers:='12345678';
  cl:=numbers;
  for i:=1 to n do
    bly[i]:=cl;
  for i:=1 to n do
  begin
    cl:=numbers;
    for j:=1 to n do
    begin
      if pos(inttostr(a[i,j]),cl)>0 then
        delete(cl,pos(inttostr(a[i,j]),cl),1)
      else
      begin
        neresheno:=True;
        break;
      end;
      if pos(inttostr(a[i,j]),bly[lake_grid[i,j]])>0 then
        delete(bly[lake_grid[i,j]],pos(inttostr(a[i,j]),bly[lake_grid[i,j]]),1)
      else
      begin
        neresheno:=True;
        break;
      end;
    end;
    if neresheno then
      break;
  end;
  if neresheno then writeln('нерешно')
               else writeln('решено!');
  writeln('-: ',cl);
  for i:=1 to n do
    writeln('2-: ',bly[i]);
End.