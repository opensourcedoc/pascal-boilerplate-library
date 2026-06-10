{$ifndef PLATFORM_INC}
{$define PLATFORM_INC}

const
  CR = #13;
  LF = #10;

  {$ifdef MSWIN}
  EOL = CR + LF;
  DIR_SEP = '\';
  PATH_SEP = ';';
  {$else}
  EOL = LF;
  DIR_SEP = '/';
  PATH_SEP = ':';
  {$endif}

{$endif}
