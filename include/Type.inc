{$ifndef COMMON_TYPE_INC}
{$define COMMON_TYPE_INC}

Type 
  Int = Integer;

  {$ifdef FPC}
  Int8 = Shortint;
  Int16 = Smallint;
  Int32 = Longint;
  {$endif}

  (* Int64 is builtin in
      both Delphi and Free Pascal. *)

  UInt = Cardinal;

  {$ifdef FPC}
  UInt8 = Byte;
  UInt16 = Word;
  UInt32 = Longword;
  UInt64 = QWord;
  {$endif}

  Bool = Boolean;

  {$ifndef FPC}
  UnicodeChar = WideChar;
  {$endif}

{$endif}
