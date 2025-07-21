unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    lblBismillah: TLabel;
    TimerSplash: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure TimerSplashTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    FColorStep: Integer;
  public
    { Public declarations }
  end;

var
 Form2: TForm2;
   //SplashForm: TSplashForm;
implementation

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action := caFree;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
    BorderStyle := bsNone;
    Position := poScreenCenter;
     Width := 600;
     Height := 300;
     Color := $00FFF0E1;

     // Label özelliklerini ayarla**
     lblBismillah.AutoSize := True;
   lblBismillah.Caption := 'Free Palestine';
   lblBismillah.Font.Name := 'Segoe Scrip';
  lblBismillah.Font.Size := 36;
  lblBismillah.Font.Style := [fsBold, fsItalic];
   lblBismillah.Font.Color := clBlack;
   lblBismillah.Alignment := taCenter;
   lblBismillah.Left := (Width - lblBismillah.Width) div 2;
  lblBismillah.Top := (Height - lblBismillah.Height) div 2;

 // Timer'ý ayarla (3 saniye = 3000 ms)**
   TimerSplash.Interval := 1000;
  TimerSplash.Enabled := True;
  Update;


end;

procedure TForm2.FormShow(Sender: TObject);
begin
       // Renk deðiþimlerini sýrayla yap**
{lblBismillah.Font.Color := clBlack; // Siyah**
Update;
Sleep(1000); // 1 saniye bekle**
lblBismillah.Font.Color := clWhite; // Beyaz**
Update;
Sleep(1000); // 1 saniye bekle**
lblBismillah.Font.Color := clGreen; // Yeþil**
Update;
Sleep(1000); // 1 saniye bekle**
Hide; // 3 saniye sonunda gizle**  }
end;

procedure TForm2.TimerSplashTimer(Sender: TObject);
begin

   Inc(FColorStep); // Adýmý artýr**
  case FColorStep of
    1: begin
      lblBismillah.Font.Color := clWhite;
      lblBismillah.Caption := 'from the River';
       // Ýkinci renk: Beyaz
      Update; // Ekraný güncelle**
    end;
    2: begin
      lblBismillah.Font.Color := clGreen; // Üçüncü renk: Yeþil
      lblBismillah.Caption := 'to the Sea';
      Update; // Ekraný güncelle**
    end;
  3: begin
      TimerSplash.Enabled := False;
  Hide; // 3 saniye sonunda gizle**
  end;
  end;

      // 3 saniye sonra formu kapat**
    //TimerSplash.Enabled := False;
    //Close;
end;

end.
