program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FormHome},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  BACTREKING in 'BACTREKING.pas',
  GenSudoku in 'GenSudoku.pas',
  Unit4 in 'Unit4.pas' {Form4},
  BestePlayers in 'BestePlayers.pas' {Form5},
  AUTOSOLUTION in 'AUTOSOLUTION.pas',
  Unit5 in 'Unit5.pas' {DataModule5: TDataModule},
  DM in 'DM.pas' {DataModule6: TDataModule},
  SaveResult in 'SaveResult.pas' {Form6},
  HelpPage in 'HelpPage.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormHome, FormHome);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TDataModule5, DataModule5);
  Application.CreateForm(TDataModule6, DataModule6);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
