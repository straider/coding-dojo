program Procedural2;

uses
  SysUtils;

var
  name : string = '';

begin
  if ParamCount = 1 then
    name := ParamStr( 1 );
  if name = '' then
    name := 'World';

  WriteLn( Format( 'Hello, %s!', [ name ] ) );

  WriteLn( '» José Carlos Monteiro «' );
end.
