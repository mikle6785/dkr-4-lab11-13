program AppendToFile;

uses System.IO;

var
  S: string;
  filetext: StreamWriter;
  filePath: string;

begin
  // Запрос строки S
  Write('Введите строку, которую нужно добавить в файл: ');
  Readln(S);

  filePath := 'E:\text3.txt'; // Путь к файлу

  try
    filetext := new StreamWriter(filePath, true); // Открываем файл для добавления
    filetext.WriteLine(S); // Добавляем строку в файл
    filetext.Close(); // Закрываем файл
    Writeln('Строка успешно добавлена в файл ', filePath,'.');
  except
    on E: Exception do
      begin
        Writeln('Ошибка при работе с файлом: ', E.Message);
        Halt(1);
      end;
  end;
end.