program DrawCircles;

uses GraphABC;

function RandomColor: Color;
begin
  Result := RGB(Random(256), Random(256), Random(256));
end;

var
  i: Integer;
  x: Integer;
  y: Integer;
  radius: Integer;

begin
  SetWindowSize(400, 400);
  ClearWindow(clWhite);
  
  y := 100;
  radius := 10; 

  // Рисуем окружности
  for i := 0 to 9 do
  begin
    x := 50 + i * 30; // Горизонтальные координаты: 50, 80, 110, 140, ..., 290
    SetBrushColor(RandomColor); 
    Circle(x, y, radius); 
  end;
end.