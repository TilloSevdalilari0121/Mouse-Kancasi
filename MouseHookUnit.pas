unit MouseHookUnit;

interface

uses
  Windows, Messages, Forms;

procedure StartMouseHook;
procedure StopMouseHook;

implementation
uses
  Unit1; // Form1'e eriþmek için Unit1'i ekledik

var
  MouseHook: HHOOK = 0;

function MouseProc(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
begin
  if nCode >= 0 then
  begin
    if (wParam = WM_RBUTTONDOWN) and Assigned(Form1) and Form1.Running then
    begin
      Form1.StopClicking;
    end;
  end;
  Result := CallNextHookEx(MouseHook, nCode, wParam, lParam);
end;

procedure StartMouseHook;
begin
  if MouseHook = 0 then
  begin
    MouseHook := SetWindowsHookEx(WH_MOUSE_LL, @MouseProc, HInstance, 0);
    if MouseHook = 0 then
      MessageBox(0, 'Fare kancasý kurulamadý!', 'Hata', MB_OK or MB_ICONERROR);
  end;
end;

procedure StopMouseHook;
begin
  if MouseHook <> 0 then
  begin
    UnhookWindowsHookEx(MouseHook);
    MouseHook := 0;
  end;
end;

initialization
finalization
  StopMouseHook;
end.
