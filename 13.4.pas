program FindLastLocalMaximum;

var
  filePath: string;
  f: file of real;
  num, prevNum, prevPrevNum, lastMax: real;
  i, numElements: integer;
  found: boolean;
begin
  filePath := 'E:\real_numbers_4.dat';
  lastMax := 0;
  found := false;

  try
    // Попытка открыть файл для чтения
    Assign(f, filePath);
    try
      Reset(f);
    except
      on E: Exception do
      begin
        Writeln('Файл ', filePath, ' не найден. Создаю новый файл.');
        Rewrite(f);
        Write('Сколько вещественных чисел записать в файл? ');
        Readln(numElements);
        Writeln('Введите ', numElements, ' вещественных чисел:');
        for i := 1 to numElements do
        begin
            Readln(num);
            Write(f, num);
        end;
        Close(f);
        Assign(f,filePath);
        Reset(f);
      end;
    end;

    i := 1;
    if not Eof(f) then // Проверка, что файл не пуст
    begin
      Read(f, prevPrevNum);
      if not Eof(f) then
      begin
        Read(f, prevNum);
        while not Eof(f) do
        begin
          Read(f, num);
           if (num < prevNum) and (prevPrevNum < prevNum) then
            begin
                lastMax := prevNum;
                found := true;

            end;
            prevPrevNum := prevNum;
            prevNum := num;

          i:=i+1;
        end;

          if (prevPrevNum < prevNum) then
          begin
             lastMax := prevNum;
            found := true;
          end;


      end
    else begin
     lastMax := prevPrevNum;
     found := true;
      end;


    end;
      Close(f);

    if found then
      Writeln('Последний локальный максимум: ', lastMax:0:2)
    else
      Writeln('Локальных максимумов не найдено.');
  except
    on E: Exception do
    begin
      Writeln('Ошибка при работе с файлом: ', E.Message);
      Halt(1);
    end;
  end;
end.