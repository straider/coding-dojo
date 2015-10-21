program CountLines1;

uses
  SysUtils;

(* http://rosettacode.org/wiki/Read_a_specific_line_from_a_file#Pascal *)
function CountLines( filename : string ) : int32;
  var 
    f     : TextFile;
    lines : int32;
begin
  Assign( f, filename );
  Reset( f );

  lines := 0;
  while not eof( f ) do
  begin
    ReadLn( f );
    Inc( lines );
  end;

  Close( f );

  CountLines := lines;
end;

begin
  WriteLn( CountLines( ParamStr( 1 ) ) );
end.
