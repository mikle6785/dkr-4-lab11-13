program Chessboard;

uses GraphABC;

const
  BoardSize = 8;
  SquareSize = 40; 

var
  x, y, row, col: Integer;

begin
  SetWindowSize(BoardSize * SquareSize, BoardSize * SquareSize);
  ClearWindow(clWhite); 

  for row := 0 to BoardSize - 1 do
    for col := 0 to BoardSize - 1 do
    begin
      x := col * SquareSize;
      y := row * SquareSize;

      if (row + col) mod 2 = 0 then
        SetBrushColor(clWhite) // Белый квадрат
      else
        SetBrushColor(clBlack); // Черный квадрат

      Rectangle(x, y, x + SquareSize, y + SquareSize); // Рисуем квадрат
    end;
end.