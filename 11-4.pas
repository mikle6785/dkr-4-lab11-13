program ConcentricCirclesFinal;

uses graphabc;

var
  i: Integer;
  xc, yc, r: Integer;

begin
  randomize;
  xc := 200;
  yc := 200;
  r := 200; // Устанавливаем начальный радиус

  for i := 1 to 20 do
  begin
    setpencolor(clrandom);
    circle(xc, yc, r - i * 8); // Уменьшаем радиус на 8 в каждой итерации
  end;
end.