program CirclesWithoutLoop;

uses GraphABC;

const
  StartX = 50;   // Начальная координата X
  StartY = 50;   // Начальная координата Y
  StepX = 50;  // Шаг по X
  StepY = 50;  // Шаг по Y

begin
  SetWindowSize(600, 600);
  ClearWindow(clWhite);
  Randomize;
    
    // Круг 1 (самый маленький)
    SetBrushColor(RGB(0, 0, 128));  // Тёмно-синий
    Circle(StartX, StartY, 10);

    // Круг 2
    SetBrushColor(RGB(175, 101, 218)); //Фиолетовый
    Circle(StartX + StepX, StartY + StepY, 20);

    // Круг 3
    SetBrushColor(RGB(133, 229, 210)); // Бирюзовый
    Circle(StartX + StepX * 2, StartY + StepY * 2, 30);
    
    // Круг 4
    SetBrushColor(RGB(217, 64, 125)); // Малиновый
    Circle(StartX + StepX * 3, StartY + StepY * 3, 40);
    
    // Круг 5
    SetBrushColor(RGB(234, 160, 211)); // Розовый
    Circle(StartX + StepX * 4, StartY + StepY * 4, 50);

     // Круг 6
    SetBrushColor(RGB(3, 39, 105));  // Тёмно-синий
    Circle(StartX + StepX * 5, StartY + StepY * 5, 60);
    
    // Круг 7
    SetBrushColor(RGB(175, 101, 218)); //Фиолетовый
    Circle(StartX + StepX * 6, StartY + StepY * 6, 70);
    
    // Круг 8
    SetBrushColor(RGB(93, 164, 53)); // Зеленый
    Circle(StartX + StepX * 7, StartY + StepY * 7, 80);
     
  ReadLn;
end.