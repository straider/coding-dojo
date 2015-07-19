program Factorial20;

var
  i      : longint;
  value  : integer;
  result : longint;

function factorial( value : integer ) : longint;
var
  result    : longint;
  iteration : integer;
begin
  result := 1;
  for iteration := 1 to value do
  begin
    result := result * iteration;
  end;

  factorial := result;
end;

begin
  for i := 0 to 50000 do
  begin
    for value := 0 to 20 do
    begin
      result := factorial( value );
      WriteLn( result );
    end;
  end;
end.
