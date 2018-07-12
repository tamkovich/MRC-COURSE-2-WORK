unit SaveResult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DM;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit3;

{$R *.dfm}

procedure TForm6.BitBtn2Click(Sender: TObject);
begin
  Form6.Close;
end;

procedure TForm6.BitBtn1Click(Sender: TObject);
Var
  h,m,s:integer;
  myDate : TDateTime;
begin
  h:=strtoint(Unit3.Form3.Edit1.Text[1]+Unit3.Form3.Edit1.Text[2]);
  m:=strtoint(Unit3.Form3.Edit1.Text[4]+Unit3.Form3.Edit1.Text[5]);
  s:=strtoint(Unit3.Form3.Edit1.Text[7]+Unit3.Form3.Edit1.Text[8]);
  myDate:=EncodeTime(h, m, s, 0);
  LongTimeFormat := 'hh:mm:ss';
  DataModule6.TGamers.Insert;
  DataModule6.TGamers.FieldByName('Username').AsString:=Edit1.Text;
  DataModule6.TGamers.FieldByName('Time').AsDateTime:=myDate;
  DataModule6.TGamers.FieldByName('Length').AsInteger:=Unit3.n;
  DataModule6.TGamers.FieldByName('Difficult').AsString:=Unit3.levelnames[Unit3.lvl];
  DataModule6.TGamers.Post;

  case Unit3.n of
    8: case Unit3.lvl of
          0: Begin
                DataModule6.Qx8B.Insert;
                DataModule6.Qx8B.FieldByName('Username').AsString:=Edit1.Text;
                DataModule6.Qx8B.FieldByName('Время').AsDateTime:=myDate;
                DataModule6.Qx8B.Post;
             end;
          1: Begin
                DataModule6.Qx8M.Insert;
                DataModule6.Qx8M.FieldByName('Username').AsString:=Edit1.Text;
                DataModule6.Qx8M.FieldByName('Время').AsDateTime:=myDate;
                DataModule6.Qx8M.Post;
             end;
          2: Begin
                DataModule6.Qx8P.Insert;
                DataModule6.Qx8P.FieldByName('Username').AsString:=Edit1.Text;
                DataModule6.Qx8P.FieldByName('Время').AsDateTime:=myDate;
                DataModule6.Qx8P.Post;
             end;
       end;
    9: case Unit3.lvl of
          0: Begin
                DataModule6.Qx9B.Insert;
                DataModule6.Qx9B.FieldByName('Username').AsString:=Edit1.Text;
                DataModule6.Qx9B.FieldByName('Время').AsDateTime:=myDate;
                DataModule6.Qx9B.Post;
             end;
          1: Begin
                DataModule6.Qx9M.Insert;
                DataModule6.Qx9M.FieldByName('Username').AsString:=Edit1.Text;
                DataModule6.Qx9M.FieldByName('Время').AsDateTime:=myDate;
                DataModule6.Qx9M.Post;
             end;
          2: Begin
                DataModule6.Qx9P.Insert;
                DataModule6.Qx9P.FieldByName('Username').AsString:=Edit1.Text;
                DataModule6.Qx9P.FieldByName('Время').AsDateTime:=myDate;
                DataModule6.Qx9P.Post;
             end;
       end;
  end;

  Unit3.Form3.N4.Enabled:=False;
  Form6.Close;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  Edit1.Text:=Unit3.Username;
  Label2.Caption:=Label2.Caption+': '+Unit3.Form3.Edit1.Text;
  Label3.Caption:=Label3.Caption+': '+inttostr(Unit3.n);
  Label4.Caption:=Label4.Caption+': '+Unit3.levelnames[lvl];
end;

procedure TForm6.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (length(Edit1.Text)=15) and (not (key=#8)) then
    Key:=#0
  else
    if length(Edit1.Text)=0 then
      if not (key in ['a'..'z', 'A'..'Z']) then
        key:=#0
  else
    if not (key in ['a'..'z', 'A'..'Z', '0'..'9', #8]) then
      Key:=#0;
end;

end.
