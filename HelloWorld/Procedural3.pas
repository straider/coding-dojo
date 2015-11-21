(* Must be compiled with option -S2: fpc -S2 *)
program Procedural3;

uses
  SysUtils;

const 
  MESSAGE = 'Hello, %s!';
  
var
  greeting : string;

(* Must be compiled with option -S2 to allow default values. *)
function greet( msg : string; name : string = 'World' ) : string;
begin
  greet := Format( MESSAGE, [ name ] );
end;

begin
  if ParamCount = 1 then
    greeting := greet( MESSAGE, ParamStr( 1 ) )
  else
    greeting := greet( MESSAGE );
  
  WriteLn( greeting );

  WriteLn( '» José Carlos Monteiro «' );
end.
