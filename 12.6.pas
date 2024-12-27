program RemoveEmptyLines;

uses System.IO;

var
  filePath: string;
  tempFilePath: string;
  fileIn, fileOut: Text;
  line: string;

begin
  filePath := 'E:\text6.txt';
  tempFilePath := 'E:\temp_text6.txt';

  try
      // Проверка существования файла
     if not System.IO.File.Exists(filePath) then
     begin
         Writeln('Ошибка: Файл ', filePath, ' не найден.');
         Halt(1);
     end;

    Assign(fileIn, filePath);
    Reset(fileIn);

    Assign(fileOut, tempFilePath);
    Rewrite(fileOut);


    while not Eof(fileIn) do
    begin
      ReadLn(fileIn, line);
      if line <> '' then
        WriteLn(fileOut, line);
    end;

   Close(fileIn);
   Close(fileOut);

   Assign(fileIn, tempFilePath);
    Reset(fileIn);
    Assign(fileOut, filePath);
    Rewrite(fileOut);

     while not Eof(fileIn) do
      begin
         ReadLn(fileIn,line);
         WriteLn(fileOut,line);
      end;

   Close(fileIn);
   Close(fileOut);


    Writeln('Пустые строки удалены из файла ', filePath, '.');
  except
    on E: Exception do
    begin
      Writeln('Ошибка при работе с файлом: ', E.Message);
       if System.IO.File.Exists(tempFilePath) then
          System.IO.File.Delete(tempFilePath);
      Halt(1);
    end;
  end;
end.