unit Unit1;

{**
  ********************************************************************
  *                                                                  *
  *    Bismillahirrahmanirrahim                                      *
  *    In the Name of Allah, the Most Gracious, the Most Merciful    *
  *                                                                  *
  ********************************************************************
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Math;

type
  TForm1 = class(TForm)
    lblX: TLabel;
    btnStart: TButton;
    btnStop: TButton;
    lblY: TLabel;
    lblDuration: TLabel;
    lblClicks: TLabel;
    edtX: TEdit;
    edtY: TEdit;
    edtDuration: TEdit;
    edtClicks: TEdit;
    Timer1: TTimer;
    TimerMouse: TTimer;
    Button1: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TimerMouseTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
     FClickCount: Integer;
    FCurrentClick: Integer;
    FRunning: Boolean;
    function GetMouseTracking: Boolean;  // Getter metodu
    procedure SetMouseTracking(Value: Boolean);  // Setter metodu

  public
    procedure StopClicking;
    property Running: Boolean read FRunning write FRunning; // Dýþarýdan eriþim için
    procedure StopMouseTracking; // Yeni metod: Koordinat takibini durdurur
    property MouseTracking: Boolean read GetMouseTracking write SetMouseTracking; // Düzgün tanýmlama
  end;

var
  Form1: TForm1;




implementation

{$R *.dfm}

 uses MouseHookUnit, MouseCoordHookUnit; // Fare kancasý birimini ekle


procedure TForm1.btnStartClick(Sender: TObject);
var
  Duration, Clicks: Integer;
  ClicksPerSecond: Double;
begin
    if FRunning then Exit;
      Clicks := StrToIntDef(edtClicks.Text, 50);
      Duration := StrToIntDef(edtDuration.Text, 100); // Saniye cinsinden

   // Sürenin sýfýr veya negatif olmasýný engelle**
      if Duration <= 0 then
        begin
            MessageBox(0, 'Süre sýfýr veya negatif olamaz! Lütfen geçerli bir süre girin.', 'Hata', MB_OK or MB_ICONERROR);
            Exit;
        end;

    // Saniye baþýna týklama sayýsýný hesapla
      ClicksPerSecond := Clicks / Duration;
      if ClicksPerSecond > 10 then
          begin
              MessageBox(0, 'Bu hýzda týklama insan simülasyonu için çok fazla! Saniyede en fazla 10 týklama olabilir.', 'Uyarý', MB_OK or MB_ICONWARNING);
              Exit; // Ýþlemi baþlatma
          end;

      FClickCount := Clicks;
      Duration := Duration * 1000; // Milisaniyeye çevir
      FCurrentClick := 0;
      FRunning := True;

      // Timer'ý ayarla (her týklama için yaklaþýk eþit süre + rastgele gecikme)
      Timer1.Interval := Duration div FClickCount;
      // TimerMouse.Interval:=Timer1.Interval;
     // TimerMouse intervalini TimerClick ile senkronize et, ama minimum bir sýnýr koy
    TimerMouse.Interval := Max(Timer1.Interval, 50); // 50 ms'den küçük olmasýn
    Timer1.Enabled := True;
    btnStart.Enabled := False;
    btnStop.Enabled := True;




end;

procedure TForm1.btnStopClick(Sender: TObject);
begin
   StopClicking;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
      TimerMouse.Enabled:=True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    FRunning := False;
    FCurrentClick := 0;
    TimerMouse.Interval := 100; // Fare pozisyonunu her 100 ms'de bir kontrol et
    TimerMouse.Enabled := True; // Program açýldýðýnda fare takibi baþlasýn
    Timer1.Enabled := False; // Týklama zamanlayýcýsý baþlangýçta kapalý
    Memo1.Enabled:=False;

   StartMouseHook;       // Týklama kancasýný baþlat
   StartMouseCoordHook;  // Koordinat kancasýný baþlat
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    StopMouseHook;       // Týklama kancasýný durdur
    StopMouseCoordHook;  // Koordinat kancasýný durdur
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  X, Y: Integer;
  RandomDelay: Integer;
begin
if not FRunning then Exit;

  // Koordinatlarý al
  X := StrToIntDef(edtX.Text, 100);
  Y := StrToIntDef(edtY.Text, 100);

  // Ýnsan benzeri davranýþ için küçük rastgele gecikme ekle
  RandomDelay := Random(100) + 50; // 50-150 ms arasý rastgele gecikme
  Sleep(RandomDelay);

  // Mouse'u hareket ettir ve týkla
  SetCursorPos(X, Y);
  mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
  Sleep(20); // Küçük bir süre basýlý tut
  mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);

  Inc(FCurrentClick);
  Caption := Format('Týklama: %d / %d', [FCurrentClick, FClickCount]);

  // Týklama sayýsý tamamlandýysa dur
  if FCurrentClick >= FClickCount then
    btnStopClick(Self);

end;

procedure TForm1.TimerMouseTimer(Sender: TObject);
var
  MousePos: TPoint;
begin
    // Fare pozisyonunu al
  GetCursorPos(MousePos);
  // Edit kutularýna yaz
  edtX.Text := IntToStr(MousePos.X);
  edtY.Text := IntToStr(MousePos.Y);
end;

procedure TForm1.StopClicking;
begin
  FRunning := False;
  Timer1.Enabled := False;
  btnStart.Enabled := True;
  btnStop.Enabled := False;
  Caption := 'Browser Auto Clicker';
end;

procedure TForm1.StopMouseTracking;
begin
    TimerMouse.Enabled := False;
end;

function TForm1.GetMouseTracking: Boolean;
begin
  Result := TimerMouse.Enabled; // TimerMouse durumunu döndür
end;

procedure TForm1.SetMouseTracking(Value: Boolean);
begin
  TimerMouse.Enabled := Value; // TimerMouse durumunu ayarla
end;

end.
