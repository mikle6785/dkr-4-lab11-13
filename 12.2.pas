program CreateFile;

uses System.IO;

var
  N, K: integer;
  filetext: StreamWriter;
  filePath: string;
  i, j: integer;

begin
  // Запрос значений N и K
  Write('Введите количество строк (N): ');
  Readln(N);
  Write('Введите количество символов в строке (K): ');
  Readln(K);

  // Проверка на корректность данных
  if (N <= 0) or (K <= 0) then
  begin
    Writeln('Ошибка: N и K должны быть положительными числами.');
    Halt(1); // Прекращение программы с кодом ошибки
  end;
  
  filePath := 'E:\text2.txt'; // Путь к файлу

  try
    filetext := new StreamWriter(filePath);
    for i := 1 to N do
    begin
      for j := 1 to K do
      begin
        filetext.Write('*');
      end;
      filetext.WriteLine; // Переход на новую строку
    end;
    filetext.Close();
    Writeln('Файл text2.txt успешно создан.');
  except
    on E: Exception do
    begin
      Writeln('Ошибка при работе с файлом: ', E.Message);
      Halt(1); // Прекращение программы с кодом ошибки
    end;
  end;

  Readln; // Ожидание нажатия Enter для закрытия консоли
end.