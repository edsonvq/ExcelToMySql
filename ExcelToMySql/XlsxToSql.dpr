program XlsxToSql;

uses
  Forms,
  MainForm in 'MainForm.pas' {FormMain},
  DataModule in 'DataModule.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
