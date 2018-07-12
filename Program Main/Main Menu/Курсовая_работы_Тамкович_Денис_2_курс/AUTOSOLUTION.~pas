// Головоломка "Неприкасаемое судоку"
// Программист: Тамкович Д.И., гр. 62492

// Алгоритм Авторешения
unit AUTOSOLUTION;

interface
uses BACTREKING;

procedure get_solve_koef(Var a:tgrid; lg:tgrid; colcount:integer; Var solve_koef:real);
// получение коэфициента решенности головомки

implementation

uses SysUtils;

Type
  couple = array[1..2]of integer;

Var
  n,free_loc, k:integer;
  arr, lake_grid, how_get_answer: tgrid;
  var_block,var_row,var_col: array[1..9]of string;
  var_kletka:array[1..9,1..9]of string;
  str_symb,chop,gav:string;
  l:array[1..2]of integer;
  ositaa: integer;
  b_block:array[1..9,1..2]of string;
  
  use_row_func,use_col_func,use_box_func,use_in_shape_func:integer;
  use_twink_col_func,use_twink_row_func,use_twink_box_func:integer;

Function cut_var_block(s:string; x:integer):string;
// урезание вариантов различных чисел в блоке
begin
  delete(s,pos(inttostr(x),s),1);
  cut_var_block:=s;
end;

Function cut_var_row(s:string; x:integer):string;
// урезание вариантов различных чисел в ряду
begin
  delete(s,pos(inttostr(x),s),1);
  cut_var_row:=s;
end;

Function cut_var_col(s:string; x:integer):string;
// урезание вариантов различных чисел в столбце
begin
  delete(s,pos(inttostr(x),s),1);
  cut_var_col:=s;
end;

Function used_in_row(row,num:integer):boolean;
// проверка на использование цифры в ряду
var
  b:boolean;
begin
  b:=False;
  if pos(inttostr(num),var_row[row])=0 then
    b:=True;
  used_in_row:=b;
end;

Function used_in_col(col,num:integer):boolean;
// проверка на использование цифры в стобце
var
  b:boolean;
begin
  b:=False;
  if pos(inttostr(num),var_col[col])=0 then
    b:=True;
  used_in_col:=b;
end;

Function used_in_box(id,num:integer):boolean;
// проверка на использование цифры в блоке
Var
  b:boolean;
begin
  b:=False;
  if pos(inttostr(num),var_block[id])=0 then
    b:=True;
  used_in_box:=b;
end;

Function used_in_corners(row,col,num:integer):boolean;
// проверка на использование цифры в касающихся данной клетках
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
// проверка на свободность для данной цифры ячейки
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
  if used_in_box(lake_grid[row,col],num) then
    b:=false
  else
  if used_in_corners(row,col,num) then
    b:=false;
  
  check_location_is_safe:=b;
  
end;

Function variatns_in_block(num,paint:integer):integer;
// возращает количество вариантов в блоке
Var
  p_kol,free_kol,i,j:integer;
begin
  p_kol:=0;
  free_kol:=0;
  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
      if lake_grid[i,j]=paint then
      begin
        p_kol:=p_kol+1;
        if check_location_is_safe(i,j,num) then
        begin
          inc(free_kol);
          l[1]:=i;
          l[2]:=j;
        end;
      end;
    end;
    if p_kol = n then
      break;
  end;
  variatns_in_block:=free_kol;
end;

Function one_time_meet(id:integer; num:integer):boolean;
// одно ли место для конкретного числа в блоке
var
  i,j,kol_same:integer;
  b:boolean;
Begin
  b:=False;
  kol_same:=0;
  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
     if arr[i,j] = 0 then    
      if(lake_grid[i,j] = id)then
      begin
        if check_location_is_safe(i,j,num) then
        begin
          inc(kol_same);
          if kol_same > 1 then
            break;
          l[1]:=i;
          l[2]:=j;
        end;
      end;
    end;
    if kol_same > 1 then
            break;
  end;
    
  if kol_same = 1 then
    b:=True;
  one_time_meet:=b;
end;

Function wow_skin_box(x:integer):integer;
// проверка формы на ячейки с "голыми парами"
var
  i,j,num:integer;
  fps, sps: string;
  p_fps, p_sps:integer;
begin
  for i:=1 to n do
  begin  
    for j:=1 to n do
    begin
     if arr[i,j] = 0 then
      if b_block[lake_grid[i,j],2]='**' then
        if var_kletka[i,j] <> b_block[lake_grid[i,j],1] then
        begin
          fps:=b_block[lake_grid[i,j],1][1];
          sps:=b_block[lake_grid[i,j],1][2];
          p_fps:=pos(fps,var_kletka[i,j]);
          p_sps:=pos(sps,var_kletka[i,j]);
          if p_fps > 0 then
            if p_sps > 0 then
            begin
              delete(var_kletka[i,j],p_fps,1);
              delete(var_kletka[i,j],p_sps,1);
              if length(var_kletka[i,j])=1 then
              begin
                num:=strtoint(var_kletka[i,j]);
                dec(ositaa);
                arr[i,j]:=num;
                how_get_answer[i,j]:=7;
                x:=0;
                // удаление вариантов в блоке
                var_block[lake_grid[i,j]]:=cut_var_block(var_block[lake_grid[i,j]],arr[i,j]);
                // удаление вариантов в строке
                var_row[i]:=cut_var_row(var_row[i],arr[i,j]);
                // удаление вариантов в столбце
                var_col[j]:=cut_var_col(var_col[j],arr[i,j]);
              end;
            end;
        end;
    end;
  end;
  for i:=1 to n do
    b_block[i,2]:='';
    
  wow_skin_box:=x;
end;

Procedure DelVar(i,j:integer);
// удаление невозможных вариантов для данной ячейки
begin
  // удаление вариантов в блоке
  var_block[lake_grid[i,j]]:=cut_var_block(var_block[lake_grid[i,j]],arr[i,j]);
  // удаление вариантов в строке
  var_row[i]:=cut_var_row(var_row[i],arr[i,j]);
  // удаление вариантов в столбце
  var_col[j]:=cut_var_col(var_col[j],arr[i,j]);
end;

Procedure DelVarKletka(a,b:integer);
// удаление невозможных вариантов в других клетках относящихся к этой
Var
  id,i,j,p_num:integer;
  num:string;
Begin
  num:=inttostr(arr[a,b]);
  id:=lake_grid[a,b];
  var_kletka[a,b]:='';
  for i:=1 to n do
    for j:=1 to n do
      if(arr[i,j]>0)and(a<>i)and(b<>j)then
        if(id=lake_grid[i,j])or(i=a)or(j=b)or(used_in_corners(i,j,strtoint(num)))then
        begin
          p_num:=pos(num,var_kletka[i,j]);
          if p_num>0 then
            delete(var_kletka[i,j],p_num,1);
        end;
        
  if a > 1 then
  begin
    if b > 1 then
      if pos(num,var_kletka[a-1,b-1])>0 then
        delete(var_kletka[a-1,b-1],pos(num,var_kletka[a-1,b-1]),1);
    if b < n then
      if pos(num,var_kletka[a-1,b+1])>0 then
        delete(var_kletka[a-1,b+1],pos(num,var_kletka[a-1,b+1]),1);
  end;
  if a < n then
  begin
    if b > 1 then
      if pos(num,var_kletka[a+1,b-1])>0 then
        delete(var_kletka[a+1,b-1],pos(num,var_kletka[a+1,b-1]),1);
    if b < n then
      if pos(num,var_kletka[a+1,b+1])>0 then
        delete(var_kletka[a+1,b+1],pos(num,var_kletka[a+1,b+1]),1);
  end;
  
end;

Function CloseAlone(x:integer):integer;
// проверка на правило "Запертый кандидат"
Var
  i,j,k,k2,k3,k4:integer;
  condidats,num:string;
  Kola:array[1..9,1..9]of integer;
Begin
  { обнуляю }
  for i:=1 to n do
    for j:=1 to n do
      Kola[i,j]:=0;
  { обнулил }

  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
      for k:=1 to length(var_kletka[i,j]) do
      begin
        num:=var_kletka[i,j][k];
        inc(Kola[lake_grid[i,j],strtoint(num)]);
      end;
    end;
  end;
  
  for k:=1 to n do
  begin
    for k2:=1 to length(var_block[k]) do
    begin
      { одиночки в строках }
      for i:=1 to n do
      begin
        { обнуляю }
        condidats:='';
        { обнулил }
        num:=var_block[k][k2];
        for j:=1 to n do
          if lake_grid[i,j]=k then
            if pos(num,var_kletka[i,j])>0 then
              condidats:=condidats+inttostr(j);
        if length(condidats)=Kola[k,strtoint(num)] then
          for j:=1 to n do
            if lake_grid[i,j]<>k then
              if pos(num,var_kletka[i,j])>0 then
              begin
                delete(var_kletka[i,j],pos(num,var_kletka[i,j]),1);
                x:=0;
              end;
      end;
      { нашёл }
      
      { одиночки в столбцах }
      for j:=1 to n do
      begin
        { обнуляю }
        condidats:='';
        { обнулил }
        num:=var_block[k][k2];
        for i:=1 to n do
          if lake_grid[i,j]=k then
            if pos(num,var_kletka[i,j])>0 then
              condidats:=condidats+inttostr(i);
        if length(condidats)=Kola[k,strtoint(num)] then
          for i:=1 to n do
            if lake_grid[i,j]<>k then
              if pos(num,var_kletka[i,j])>0 then
              begin
                delete(var_kletka[i,j],pos(num,var_kletka[i,j]),1);
                x:=0;
              end;
      end;
      { нашёл }
    end;
  end;
  
  CloseAlone:=x;
End;
// Конец Запертого кандидата

Function Hidetwink(x:integer):integer;
// проверка на правило "Cкрытые пары"
Var
  i,j,k,k2,k3,k4,j2,kst:integer;
  condidats,num,same_twink:string;
  Kola:array[1..9,1..9]of integer;
  Kolba:array[1..9,1..9]of string;
  lpar:array[1..9,1..2]of integer;
Begin
  { обнуляю }
  for i:=1 to n do
    for j:=1 to n do
    begin
      Kola[i,j]:=0;
      Kolba[i,j]:='';
    end;
  { обнулил }
  
  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
      for k:=1 to length(var_kletka[i,j]) do
      begin
        num:=var_kletka[i,j][k];
        inc(Kola[lake_grid[i,j],strtoint(num)]);
      end;
    end;
  end;

  same_twink:='';
  
  { поиск сп }
  for k:=1 to n do
  begin
    for k2:=1 to n do
    begin
      if Kola[k,k2]=2 then
      begin
        for i:=1 to n do
        begin
          for j:=1 to n do
          begin
            if lake_grid[i,j]=k then
            begin
              if pos(inttostr(k2),var_kletka[i,j])>0 then
              begin
                Kolba[i,j]:=Kolba[i,j]+inttostr(k2);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  
  for k:=1 to n do
  begin
    kst:=0;
    for i:=1 to n do
    begin
      for j:=1 to n do
      begin
        if lake_grid[i,j]=k then
        begin
          if length(Kolba[i,j])=2 then
          begin
            inc(kst);
            lpar[kst,1]:=i;
            lpar[kst,2]:=j;
          end;
        end;
      end;
    end;
    if kst>1 then
    begin
      for i:=1 to kst-1 do
      begin
        for j:=i+1 to kst do
        begin
          if (Kolba[lpar[i,1],lpar[i,2]]=Kolba[lpar[j,1],lpar[j,2]]) then
          begin
            k2:=1;
            While k2<=length(var_kletka[lpar[i,1],lpar[i,2]]) do
            begin
              if pos(var_kletka[lpar[i,1],lpar[i,2]][k2],Kolba[lpar[i,1],lpar[i,2]])=0 then
              begin
                delete(var_kletka[lpar[i,1],lpar[i,2]],k2,1);
                dec(k2);
                x:=0;
              end;
              inc(k2);
            end;
            k2:=1;
            While k2<=length(var_kletka[lpar[j,1],lpar[j,2]]) do
            begin
              if pos(var_kletka[lpar[j,1],lpar[j,2]][k2],Kolba[lpar[j,1],lpar[j,2]])=0 then
              begin
                delete(var_kletka[lpar[j,1],lpar[j,2]],k2,1);
                dec(k2);
                x:=0;
              end;
              inc(k2);
            end;
          end;
        end;
      end;
    end;
  end;
  { нашёл }
  
  Hidetwink:=x;
end;
// Конец скрытых пар

// НАЧАЛО АВТОРЕШЕНИЯ
Procedure auto_solve;
// главна процедуры для запуска авторешение
var
  i,j,x,Hi,Hj,HLen,HSame,HDel:integer;
  color:string;
  num,free_kol,NITAV:integer;
  Ha:array[1..9]of integer;
begin
  x:=1;
  free_kol:=0;
  use_row_func:=0;
  use_col_func:=0;
  use_box_func:=0;
  use_in_shape_func:=0;
  use_twink_col_func:=0;
  use_twink_row_func:=0;
  use_twink_box_func:=0;
  while x<=n do
  begin
    for num:=x to n do
    begin
      // для строки
      inc(use_row_func);
      for i:=1 to n do
      begin
      free_kol:=0;
        for j:=1 to n do
          if arr[i,j]=0 then
            if check_location_is_safe(i,j,num) then
            begin
              inc(free_kol);
              l[1]:=i;
              l[2]:=j;
            end;
        if free_kol = 1 then
        begin
          dec(ositaa);
          arr[l[1],l[2]]:=num;
          how_get_answer[l[1],l[2]]:=1;
          x:=0;
          DelVar(l[1],l[2]);
          DelVarKletka(l[1],l[2]);
          break;
        end;
      end;
      if x = 0 then
          break;
      // для столбца
      inc(use_col_func);
      for i:=1 to n do
      begin
      free_kol:=0;
        for j:=1 to n do
          if arr[j,i]=0 then
            if check_location_is_safe(j,i,num) then
            begin
              inc(free_kol);
              l[1]:=j;
              l[2]:=i;
            end;
        if free_kol = 1 then
        begin
          dec(ositaa);
          arr[l[1],l[2]]:=num;
          how_get_answer[l[1],l[2]]:=2;
          x:=0;
          DelVar(l[1],l[2]);
          DelVarKletka(l[1],l[2]);
          break;
        end;
      end;
      if x = 0 then
          break;
      // для блока
      inc(use_box_func);
      for i:=1 to n do
      begin
      
        free_kol:=variatns_in_block(num, i);
        if free_kol = 1 then
        begin
          dec(ositaa);
          arr[l[1],l[2]]:=num;
          how_get_answer[l[1],l[2]]:=3;
          x:=0;
          DelVar(l[1],l[2]);
          DelVarKletka(l[1],l[2]);
          break;
        end; 
        
       end;
      if x = 0 then
          break; 
    end;
    if(x = n)and(ositaa<>0) then
    begin
     
     for num:=1 to n do
     begin
      // для конкретного числа в блоке   
      color:=''; 
      use_in_shape_func:=use_in_shape_func+1;
      for i:=1 to n do
      begin
        for j:=1 to n do
        begin
          if pos(inttostr(lake_grid[i,j]),color) = 0 then
          begin
            color:=color + inttostr(lake_grid[i,j]);
            if one_time_meet(lake_grid[i,j], num) then
            begin
              x:=0;
              dec(ositaa);
              arr[l[1],l[2]]:=num;
              how_get_answer[l[1],l[2]]:=4;
              DelVar(l[1],l[2]);
              DelVarKletka(l[1],l[2]);
              break;
            end;
          end;
        end;
        if x = 0 then
          break;
      end;
      if x = 0 then
          break;
     end;
    end;
    if(x=n)and(ositaa>0)then 
    begin
    // голые пары
    // в СТОЛБЦЕ
      inc(use_twink_col_func);
      for j:=1 to n do
      begin
        HLen:=0;
        for i:=1 to n do
          if length(var_kletka[i,j])=2 then
          begin
            inc(HLen);
            Ha[HLen]:=i;
          end;
        if Hlen>1 then
          for Hi:=1 to HLen do
          begin
            HSame:=0;
            for Hj:=1 to Hi-1 do
              if var_kletka[Ha[Hi],j]=var_kletka[Ha[Hj],j] then
                HSame:=Ha[Hj];
            for Hj:=Hi+1 to HLen do
              if var_kletka[Ha[Hi],j]=var_kletka[Ha[Hj],j] then
                HSame:=Ha[Hj];
            if Hsame>0 then
              for NITAV:=1 to n do
               if arr[NITAV,j]=0 then
                if (NITAV<>Ha[Hi])and(NITAV<>Hsame) then
                begin
                  HDel:=pos(var_kletka[HSame,j][1],var_kletka[NITAV,j]);
                  if HDel>0 then
                  begin
                    delete(var_kletka[NITAV,j],HDel,1);
                    x:=0;
                  end;
                  HDel:=pos(var_kletka[HSame,j][2],var_kletka[NITAV,j]);
                  if HDel>0 then
                  begin
                    delete(var_kletka[NITAV,j],HDel,1);
                    x:=0;
                  end;
                  if length(var_kletka[NITAV,j])=1 then
                  begin
                    x:=0;
                    dec(ositaa);
                    num:=strtoint(var_kletka[NITAV,j][1]);
                    arr[NITAV,j]:=num;
                    how_get_answer[NITAV,j]:=5;
                    DelVar(NITAV,j);
                    DelVarKletka(NITAV,j);
                  end;
                end;
          end;
      end;
    end;   
    if(x=n)and(ositaa>0)then 
    begin
    // голые пары
    // В СТРОКЕ
      inc(use_twink_col_func);
      for i:=1 to n do
      begin
        HLen:=0;
        for j:=1 to n do
          if length(var_kletka[i,j])=2 then
          begin
            inc(HLen);
            Ha[HLen]:=j;
          end;
        if Hlen>1 then
          for Hi:=1 to HLen do
          begin
            HSame:=0;
            for Hj:=1 to Hi-1 do
              if var_kletka[i,Ha[Hi]]=var_kletka[i,Ha[Hj]] then
                HSame:=Ha[Hj];
            for Hj:=Hi+1 to HLen do
              if var_kletka[i,Ha[Hi]]=var_kletka[i,Ha[Hj]] then
                HSame:=Ha[Hj];
            if Hsame>0 then
              for NITAV:=1 to n do
               if arr[i,NITAV]=0 then 
                if (NITAV<>Ha[Hi])and(NITAV<>Hsame) then
                begin
                  HDel:=pos(var_kletka[i,HSame][1],var_kletka[i,NITAV]);
                  if HDel>0 then
                  begin
                    delete(var_kletka[i,NITAV],HDel,1);
                    x:=0;
                  end;
                  HDel:=pos(var_kletka[i,HSame][2],var_kletka[i,NITAV]);
                  if HDel>0 then
                  begin
                    delete(var_kletka[i,NITAV],HDel,1);
                    x:=0;
                  end;
                  if length(var_kletka[i,NITAV])=1 then
                  begin
                    x:=0;
                    dec(ositaa);
                    num:=strtoint(var_kletka[i,NITAV][1]);
                    arr[i,NITAV]:=num;
                    how_get_answer[i,NITAV]:=5;
                    DelVar(i,NITAV);
                    DelVarKletka(i,NITAV);
                  end;
                end;
          end;
      end;
    end;
   if(x=n)and(ositaa>0)then
    for i:=1 to n do
    begin
      for j:=1 to n do
      begin
        if length(var_kletka[i,j])=2 then
        begin
          b_block[lake_grid[i,j],1]:=var_kletka[i,j];
          b_block[lake_grid[i,j],2]:=b_block[lake_grid[i,j],2]+'*';
        end;
        if length(var_kletka[i,j])=1 then
        begin
          x:=0;
          dec(ositaa);
          num:=strtoint(var_kletka[i,j]);
          arr[i,j]:=num;
          how_get_answer[i,j]:=6;
          DelVar(i,j);
          DelVarKletka(i,j);
         break;
        end;
      end;
      if x = 0 then
        break;
      { проверка кондидатов одиночек }
      if x>0 then
        x:=CloseAlone(x);
      if x>0 then
        x:=Hidetwink(x);
    end;
    x:=wow_skin_box(x);
    inc(x);
  end;
end;
// КОНЕЦ АВТОРЕШЕНИЯ

procedure get_solve_koef(Var a:tgrid; lg:tgrid; colcount:integer; Var solve_koef:real);
// получение коэфициента решенности головомки
Var  
  i,j,i2:integer;
  f:textfile;
Begin
  n:=colcount;
  ositaa:=0;
  gav:='';
  for i:=1 to n do
  begin
    gav:=gav+inttostr(i);
    str_symb:='';
    b_block[i,1]:='';
    b_block[i,2]:='';
    for j:=1 to n do
    begin
      str_symb:=str_symb+inttostr(j);
      var_kletka[i,j]:='';
      arr[i,j]:=a[i,j];
      lake_grid[i,j]:=lg[i,j];
      if arr[i,j] = 0 then
      begin
        ositaa:=ositaa+1;
        how_get_answer[i,j]:=0;
        for i2:=1 to n do
          var_kletka[i,j]:=var_kletka[i,j]+inttostr(i2);       
      end
      else
        how_get_answer[i,j]:=-1;
      
    end;
    var_block[i]:=str_symb;
    var_row[i]:=str_symb;
    var_col[i]:=str_symb;
  end;
  for i:=1 to n do
    for j:=1 to n do
      if arr[i,j]<>0 then
        DelVar(i,j);

  for i:=1 to n do
    for j:=1 to n do
    begin
      for i2:=1 to n do
        if pos(gav[i2],var_kletka[i,j]) > 0 then
        begin
          if pos(gav[i2],var_block[lake_grid[i,j]]) = 0 then
            delete(var_kletka[i,j],pos(gav[i2],var_kletka[i,j]),1);
          if pos(gav[i2],var_row[i]) = 0 then
            delete(var_kletka[i,j],pos(gav[i2],var_kletka[i,j]),1);
          if pos(gav[i2],var_col[j]) = 0 then
            delete(var_kletka[i,j],pos(gav[i2],var_kletka[i,j]),1);
        end;
      if length(var_kletka[i,j])=1 then
      begin
        arr[i,j]:=0;
        how_get_answer[i,j]:=-2;
        DelVar(i,j);
        DelVarKletka(i,j);
        dec(ositaa);
      end;
    end;
    auto_solve;
    assignfile(f,'AUTOout'+inttostr(k)+'.txt'); rewrite(f);
  
  writeln(f,'Проверки в строке: ',use_row_func);
  writeln(f,'Проверки в столбце: ',use_col_func);
  writeln(f,'Проверки в блоке: ',use_box_func);
  writeln(f,'Проверки для конкретного числа в блоке: ',use_in_shape_func);
  
  writeln(f,'Голых пар в строке: ',use_twink_row_func);
  writeln(f,'Голых пар в столбце: ',use_twink_col_func);
  writeln(f,'Голых пар в блоке: ',use_twink_box_func);

  writeln(f,'Осталось открыть клеток: ', ositaa);
  solve_koef:=ositaa/(n*n)*100;
  for i:=1 to n do
  begin 
    for j:=1 to n do
    begin
      write(f,arr[i,j]:2);
    end;
    writeln(f);
  end;
  writeln(f);
  for i:=1 to n do
  begin 
    for j:=1 to n do
    begin
      write(f,how_get_answer[i,j]:2);
    end;
    writeln(f);
  end;
  closefile(f);
end;

end.
