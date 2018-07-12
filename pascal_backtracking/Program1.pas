Type
  tgrid = array[1..9,1..9]of integer;
  couple = array[1..2]of integer;

Var
  f:textfile;
  n,free_loc:integer;
  arr, lake_grid: tgrid;

Function find_empty_location(Var l:couple):boolean;
Var
  row,col:integer;
  b:boolean;
begin
  b:=False;
  for row:=1 to n do
    for col:=1 to n do
      if (not b) and (arr[row,col] = 0) then
      begin
        l[1]:=row;
        l[2]:=col;
        b:=True;
        break;
      end;
  find_empty_location:=b;
end;

Function used_in_row(row,num:integer):boolean;
var
  j:integer;
  b:boolean;
begin
  b:=False;
  for j:=1 to n do
    if arr[row,j] = num then
    begin
      b:=True;
      break;
    end;  
  used_in_row:=b;
end;

Function used_in_col(col,num:integer):boolean;
var
  i:integer;
  b:boolean;
begin
  b:=False;
  for i:=1 to n do
    if arr[i,col] = num then
    begin
      b:=True;
      break;
    end;
  used_in_col:=b;
end;

Function used_in_box(row,col,num:integer):boolean;
Var
  i,j,kol_match,id:integer;
  b:boolean;
begin
  b:=False;
  id:=lake_grid[row,col];
  kol_match:=0;
  i:=1;
  j:=1;
  while (i<=n) and not b do
  begin
    j:=1;
    while(j<=n)and(kol_match<n)do
    begin
      if id = lake_grid[i,j] then
      begin
        inc(kol_match);
        if (arr[i,j] = num)and(i<>row)and(j<>col) then
        begin
          b:=True;
          break;
        end;
      end;
      inc(j);
    end;
    inc(i);
  end;
  used_in_box:=b;
end;

Function used_in_corners(row,col,num:integer):boolean;
var
  b:boolean;
begin
  b:=False;  
  if row > 1 then
  begin
    if col > 1 then
      if arr[row-1,col-1] = num then
        b:=True;
    if col < n then
      if arr[row-1,col+1] = num then
        b:=True;
  end;
 if not b then 
  if row < n then
  begin
    if col > 1 then
      if arr[row+1,col-1] = num then
        b:=True;
    if col < n then
      if arr[row+1,col+1] = num then
        b:=True;
  end;
  
  used_in_corners:=b;
end;

Function check_location_is_safe(row,col,num:integer):boolean;
Var
  b:boolean;
begin
  b:=True;
  if used_in_row(row,num) then
    b:=False
  else 
  if used_in_col(col,num) then
    b:=False 
  else
  if used_in_box(row,col,num) then
    b:=false
  else
  if used_in_corners(row,col,num) then
    b:=false;
  
  check_location_is_safe:=b;
  
end;
  
Function solve_sudoku(free_kol:integer):boolean;
Var
  row,col,num:integer;
  b:boolean;
  l:couple;
begin
  l[1]:=1;
  l[2]:=1;
  b:=False;
  if not find_empty_location(l) then
  begin
    b:=True;
  end; 
  row:=l[1];
  col:=l[2];
 if not b then
  for num:=1 to n do
  begin
    if check_location_is_safe(row,col,num) then
    begin
      arr[row,col]:=num;
      if solve_sudoku(free_kol-1) then
      begin
        b:=True;
        break;
      end;
      arr[row,col]:=0
    end;
  end;
  
  solve_sudoku:=b;
end;
  
Var  
  i,j,k:integer;
  
begin
  for k:=1 to 9 do
  begin
  assignfile(f,'InSudoku'+inttostr(k)+'.txt'); reset(f);
  read(f,n);
  free_loc:=0;
  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
      read(f,arr[i,j]);
      if arr[i,j] = 0 then
        free_loc:=free_loc+1;
    end;
    readln(f);
  end;
  for i:=1 to n do
  begin
    for j:=1 to n do
      read(f,lake_grid[i,j]);
    readln(f);
  end;
  closefile(f);
  assignfile(f,'bk'+inttostr(k)+'.txt'); rewrite(f);
  if solve_sudoku(free_loc) then
    for i:=1 to n do
    begin
      for j:=1 to n do
        write(f,arr[i,j]:2);
      writeln(f);
    end
  else 
    write(f,'Нет решений');
  closefile(f);
  end;
end.