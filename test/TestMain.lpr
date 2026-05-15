{$ifdef FPC} {$mode DELPHIUNICODE} {$endif}

{$ifdef WINDOWS} {$apptype CONSOLE} {$endif}

program TestMain;

uses
  {$ifdef DELPHI}
  System.SysUtils,
  Winapi.Windows;
  {$else}
  SysUtils,
  Dynlibs;
  {$endif}

{$Include Type.inc}

type
  TAdd = function(a: Int; b: Int): Int; cdecl;

const
  Lib = 'logic';

var
  LibHandle: THandle;
  Add: TAdd;
  Result: Int;
  DynamicLibrary: String;

begin
  {$IF DEFINED(WINDOWS)}
  DynamicLibrary := Lib + '.dll';
  {$ELSEIF DEFINED(DARWIN)}
  DynamicLibrary := 'lib' + Lib + '.dylib';
  {$ELSE}
  DynamicLibrary := 'lib' + Lib + '.so';
  {$ENDIF}

  try
    LibHandle := LoadLibrary(DynamicLibrary);

    if LibHandle <> 0 then
    begin
      try
        @Add := GetProcAddress(LibHandle, 'add');

        if Assigned(@Add) then
        begin
          Result := Add(10, 20);
          Assert(30 = Result);
        end
        else
          Writeln('Function not found: add');
      finally
        FreeLibrary(LibHandle);
      end;
    end
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  {$ifdef DEBUG} readln; {$endif}
end.