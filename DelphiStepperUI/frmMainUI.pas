unit frmMainUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin, OoMisc, AdPort, AdWnPort;

type
  TformMainUI = class(TForm)
    memoLog: TMemo;
    btnLeft: TButton;
    btnRight: TButton;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    COM: TApdComPort;
    btnConnect: TButton;
    btnDisconnect: TButton;
    procedure btnSideClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    fData: String;
    procedure updateStatus;
    procedure readData;
  public

  end;

var
  formMainUI: TformMainUI;

implementation

{$R *.dfm}

procedure TformMainUI.FormCreate(Sender: TObject);
begin
  updateStatus;
end;

procedure TformMainUI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  COM.FlushInBuffer;
  COM.FlushOutBuffer;
  COM.Open := false;
end;

procedure TformMainUI.btnDisconnectClick(Sender: TObject);
begin
  try
    memoLog.Lines.Add('Disconnect....');
    COM.Open := false;
    memoLog.Lines.Add('Disconnected!');
  except
    on e: exception do
    begin
      memoLog.Lines.Add('Disconnecting Error : ' + e.Message);
    end;
  end;

  updateStatus;

end;

procedure TformMainUI.btnSideClick(Sender: TObject);
var
  data: string;
  idx: integer;
begin
  try
    COM.FlushInBuffer;
    COM.FlushOutBuffer;
    if Sender = btnLeft then
      COM.PutChar('L')
    else if Sender = btnRight then
      COM.PutChar('R');
      sleep(250);
  except
    on e: exception do
    begin
      showmessage('Serial Error : ' + e.Message);
    end;
  end;
  readData;
  updateStatus;
end;

procedure TformMainUI.btnConnectClick(Sender: TObject);
begin
  try
    memoLog.Lines.Add('Connecting....');
    COM.ComNumber := SpinEdit1.Value;
    COM.Baud := 115200;
    COM.Open := TRUE;
    sleep(250);
    readData;
    memoLog.Lines.Add('Connected!');
  except
    on e: exception do
    begin
      memoLog.Lines.Add('Connecting Error : ' + e.Message);
    end;
  end;
  updateStatus;

end;

procedure TformMainUI.updateStatus;
begin
  btnConnect.Enabled := not COM.Open;
  btnDisconnect.Enabled := COM.Open;
  btnLeft.Enabled := COM.Open;
  btnRight.Enabled := COM.Open;
end;

procedure TformMainUI.readData;
begin
  try
    if not COM.Open then
      exit;
    sleep(500);
    while COM.CharReady do
      fData := fData + COM.GetChar;
  finally
    if pos(#13, fData) > 0 then
    begin
      memoLog.Lines.Add(fData);
      fData := '';
    end;
  end;
end;

end.
