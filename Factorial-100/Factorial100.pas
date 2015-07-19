program Factorial100;

var
  i      : longint;
  value  : integer;
  result : int64;

function factorial( value : integer ) : int64;
var
  result    : int64;
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
    for value := 0 to 100 do
    begin
      result := factorial( value );
      WriteLn( result );
    end;
  end;
end.
