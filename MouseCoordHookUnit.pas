unit MouseCoordHookUnit;
interface

uses
  Windows, Messages;

procedure StartMouseCoordHook;
procedure StopMouseCoordHook;

implementation

uses
  Unit1;

var
  MouseCoordHook: HHOOK = 0;

function MouseCoordProc(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
begin
  if nCode >= 0 then
  begin
    if (wParam = WM_RBUTTONDOWN) and Assigned(Form1) and Form1.MouseTracking then
    begin
      Form1.StopMouseTracking;
    end;
  end;
  Result := CallNextHookEx(MouseCoordHook, nCode, wParam, lParam);
end;

procedure StartMouseCoordHook;
begin
  if MouseCoordHook = 0 then
  begin
    MouseCoordHook := SetWindowsHookEx(WH_MOUSE_LL, @MouseCoordProc, HInstance, 0);
    if MouseCoordHook = 0 then
      MessageBox(0, 'Koordinat fare kancasý kurulamadý!', 'Hata', MB_OK or MB_ICONERROR);
  end;
end;

procedure StopMouseCoordHook;
begin
  if MouseCoordHook <> 0 then
  begin
    UnhookWindowsHookEx(MouseCoordHook);
    MouseCoordHook := 0;
  end;
end;

initialization
finalization
  StopMouseCoordHook;
end.
