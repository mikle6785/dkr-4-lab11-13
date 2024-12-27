program RemoveAfterLastSpaceFromFile;

var
  filePath: string;
  f: file of char;
  c: char;
  i, k, numSymbols: integer;
  lastSpacePos: integer;
begin
  filePath := 'E:\symbol.txt'; // Путь к файлу

  try
    // Попытка открыть файл для чтения
    Assign(f, filePath);
    try
    Reset(f); // Открываем файл, если он существует
    except
         on E: Exception do
        begin
            Writeln('Файл ', filePath, ' не найден. Создаю новый файл.');
            Rewrite(f); // Создаем новый файл для записи
            Write('Сколько символов записать в файл (k)? ');
            Readln(numSymbols);
            Writeln('Введите ', numSymbols, ' символов, включая пробел:');
             for i := 1 to numSymbols do
                begin
                    Read(c);
                    Write(f, c);
                end;
            Close(f);
            Assign(f, filePath);
             Reset(f);

        end;
       end;

      Writeln('Исходный файл:');
        k := -1;
        i := 0;
        lastSpacePos := 0;
       while not Eof(f) do
          begin
              read(f, c);
             write(c);
           i := i+1;
            if c = ' ' then
                lastSpacePos := i;
         end;
    writeln;
      Close(f);
       Assign(f, filePath);
        Reset(f);
    if lastSpacePos = 0 then
      begin
      Writeln('Вы забыли ввести пробел, работа программы завершена');
      Close(f);
    end
    else
    begin
     Seek(f, lastSpacePos -1 );
      Truncate(f);
      Writeln('Удаление символов после последнего пробела, включая его:');
        Reset(f);
       while not eof(f) do
        begin
         read(f,c);
          write(c);
        end;
        Writeln;
      Close(f);
    end;
  except
    on E: Exception do
    begin
      Writeln('Ошибка при работе с файлом: ', E.Message);
      Close(f);
      Halt(1);
    end;
  end;
end.