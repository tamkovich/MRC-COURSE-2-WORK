unit GenSudoku;

interface
Type
  tgrid=array[1..9,1..9]of integer;

implementation
Procedure GenSetka(Var arr:tgrid; Var lake_grid:tgrid; n:integer; filename:string);
Var
  i,j:integer;
  fin:textfile;
  turnkol;
Begin
  randomize;
  assignfile(fin,filename); reset(fin);
  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
    end;
  end;
End;

end.
 