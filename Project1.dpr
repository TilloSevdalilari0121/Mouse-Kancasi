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
    // Splash ekran�n� g�ster
    Form2 := TForm2.Create(nil); // Manuel olu�tur**
    Form2.Show; // Modals�z g�ster**
    Form2.Update; // Hemen g�r�n�r yap**
   // Sleep(3100); // 3 saniye bekle (d�ng� yerine basit bir bekleme)**
   Application.ProcessMessages;
   while Form2.Visible do
    Application.ProcessMessages;
    Form2.Free; // Splash formu serbest b�rak**
    Application.CreateForm(TForm1, Form1);
    Application.Run;

end.
