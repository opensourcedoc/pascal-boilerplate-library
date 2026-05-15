{$ifdef FPC} {$mode DELPHIUNICODE} {$endif}

library Logic;

{$Include Type.inc}

// Standard C compatible ABI.
function add(a: Int; b: Int): Int; cdecl;
begin
  Result := a + b;
end;

exports
  add;

begin
  // DLLMain.
end.