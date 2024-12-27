program SquareAnimationTrajectory;

uses GraphABC;

const
  SquareSize = 20;   // Размер квадрата
  StepSize = 5;    // Шаг движения
  DelayTime = 20;   // Задержка между кадрами
  WindowWidth = 400;  // Ширина окна
  WindowHeight = 400; // Высота окна
  Margin = 20;        // Отступ от края
  TurnX = 200;       // Координата X для поворота
  TurnY = 200;       // Координата Y для поворота

var
  x, y, dx, dy: Integer;
  distanceBeforeTurn, distanceAfterTurn: Real;
  moved: Boolean;
  turnDone: Boolean;

begin
  SetWindowSize(WindowWidth, WindowHeight);
  ClearWindow(clWhite);
  SetPenColor(clBlack);
  SetBrushColor(clBlack); // Красный квадрат

  x := Margin; // Начальная координата X
  y := Margin; // Начальная координата Y
  dx := StepSize; // Направление по X (вправо)
  dy := StepSize; // Направление по Y (вниз)
  distanceBeforeTurn := 0; // Дистанция до поворота
  distanceAfterTurn := 0;  // Дистанция после поворота
  moved := false;  // Флаг остановки
  turnDone := false; // Флаг поворота

  while not moved do
  begin
    // Рисуем след
    Line(x + SquareSize div 2, y + SquareSize div 2, x + SquareSize div 2 + dx, y + SquareSize div 2 + dy);

    // Рисуем квадрат
    Rectangle(x, y, x + SquareSize, y + SquareSize);

    // Проверяем, нужно ли повернуть
    if not turnDone then
     begin
      if (x >= TurnX - SquareSize / 2) and (y >= TurnY - SquareSize / 2)  then
      begin
       
        distanceBeforeTurn := sqrt(sqr(x - Margin) + sqr(y - Margin)); // Расстояние до поворота
          dx := StepSize; // Меняем направление
          dy := -StepSize;
        turnDone := true;
        
      end
     end else
      begin
          distanceAfterTurn := sqrt(sqr(x - TurnX) + sqr(y - TurnY));
          if distanceAfterTurn >= distanceBeforeTurn then moved := true;
      end;
       
    // Обновляем координаты
    if not moved then
    begin
      x := x + dx;
      y := y + dy;
    end;
    Sleep(DelayTime);
  end;

  ReadLn;
end.