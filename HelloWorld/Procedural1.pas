program Procedural1;

uses
  SysUtils;

var
  name : string = 'World';

begin
  if ParamCount = 1 then
    name := ParamStr( 1 );

  WriteLn( Format( 'Hello, %s!', [ name ] ) );

  WriteLn( '» José Carlos Monteiro «' );
end.
