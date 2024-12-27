program FindMinMax;

uses System.IO;

var
  filePathIn: string;
  filePathOut: string;
  fileIn, fileOut: Text;
  num, minNum, maxNum: integer;
  firstNum: boolean;

begin
  filePathIn := 'E:\input.txt';
  filePathOut := 'E:\output.txt';

  firstNum := true; // флаг для обработки первого числа
  
  try
    // Проверяем, существует ли входной файл
    if not System.IO.File.Exists(filePathIn) then
    begin
      Writeln('Ошибка: Файл ', filePathIn, ' не найден.');
      Halt(1);
    end;

    Assign(fileIn, filePathIn);
    Reset(fileIn);

    while not Eof(fileIn) do
    begin
      ReadLn(fileIn, num);
      if firstNum then
      begin
        minNum := num;
        maxNum := num;
        firstNum := false;
      end
      else
      begin
        if num < minNum then
          minNum := num;
        if num > maxNum then
          maxNum := num;
      end;
    end;

    Close(fileIn);

    Assign(fileOut, filePathOut);
    Rewrite(fileOut);
    WriteLn(fileOut, 'Минимальное число: ', minNum);
    WriteLn(fileOut, 'Максимальное число: ', maxNum);
    Close(fileOut);

    Writeln('Результаты записаны в файл ', filePathOut);
  except
    on E: Exception do
    begin
      Writeln('Ошибка при работе с файлом: ', E.Message);
      Halt(1);
    end;
  end;

  Readln;
end.