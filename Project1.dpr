program Project1;

uses
  Vcl.Forms, Windows,
  Unit1 in 'Unit1.pas' {Form1},
  MouseHookUnit in 'MouseHookUnit.pas',
  MouseCoordHookUnit in 'MouseCoordHookUnit.pas',
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
    Application.Initialize;
    // Splash ekranýný göster
    Form2 := TForm2.Create(nil); // Manuel oluþtur**
    Form2.Show; // Modalsýz göster**
    Form2.Update; // Hemen görünür yap**
   // Sleep(3100); // 3 saniye bekle (döngü yerine basit bir bekleme)**
   Application.ProcessMessages;
   while Form2.Visible do
    Application.ProcessMessages;
    Form2.Free; // Splash formu serbest býrak**
    Application.CreateForm(TForm1, Form1);
    Application.Run;

end.
