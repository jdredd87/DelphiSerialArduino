program DelphiStepperUI;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  frmMainUI in 'frmMainUI.pas' {formMainUI};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMainUI, formMainUI);
  Application.Run;
end.
