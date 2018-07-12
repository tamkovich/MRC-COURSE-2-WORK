Type
  tgrid = array[1..9,1..9]of integer;
  
Var
  f:textfile;
  lake_grid:tgrid;
  was:array[1..9,1..9]of boolean;
  n,i,j:integer;
  mas_was:string;
  
Procedure prohod(i,j,id:integer);
Begin
  was[i,j]:=True;
  if i>1 then
    if lake_grid[i-1,j]=id then
     if not was[i-1,j] then
      prohod(i-1,j,id);
  if i<n then
    if lake_grid[i+1,j]=id then
     if not was[i+1,j] then
      prohod(i+1,j,id);
  if j>1 then
    if lake_grid[i,j-1]=id then
     if not was[i,j-1] then
      prohod(i,j-1,id);
  if j<n then
    if lake_grid[i,j+1]=id then
     if not was[i,j+1] then
      prohod(i,j+1,id);
end;

Begin
  assignfile(f,'lg.txt'); reset(f);
  mas_was:='12345678';
  readln(f,n);
  if n=9 then
    mas_was:='123456789';
  for i:=1 to n do 
  begin
    for j:=1 to n do
    begin
      read(f,lake_grid[i,j]);
      was[i,j]:=False;
    end;
    readln(f);
  end;
  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
      if not was[i,j] then 
      if pos(inttostr(lake_grid[i,j]),mas_was)>0 then
      begin
        prohod(i,j, lake_grid[i,j]);  
        delete(mas_was,pos(inttostr(lake_grid[i,j]),mas_was),1);
      end;
    end;
  end;
  closefile(f);
  for i:=1 to n do
  begin
    for j:=1 to n do
      write(was[i,j]:5);
//      if not was[i,j] then
//        writeln('Плохая');
    writeln;
  end;
End.