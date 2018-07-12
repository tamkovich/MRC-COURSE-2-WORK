unit HelpPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, Menus, Unit2;

type
  TForm7 = class(TForm)
    WebBrowser1: TWebBrowser;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit1;
{$R *.dfm}

procedure TForm7.FormCreate(Sender: TObject);
begin
  WebBrowser1.Navigate(extractfilepath(paramstr(0))+'templates\MainHelpPage.html');
end;

procedure TForm7.N3Click(Sender: TObject);
begin
  FormHome.Show;
  Form7.Hide;
end;

procedure TForm7.N2Click(Sender: TObject);
begin
  Form2.Show;
  Form7.Hide;
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormHome.Close;
end;

end.
