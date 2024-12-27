program SwapMinMaxElements;

var
  filePath: string;
  tempFilePath: string;
  f, tempF: file of real;
  num, minNum, maxNum: real;
  minIdx, maxIdx, i, numElements: integer;
begin
  filePath := 'E:\real_numbers_5.dat';
  tempFilePath := 'E:\temp_real_numbers_5.dat';

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
    // Находим min и max элементы и их индексы
    minIdx := 1;
    maxIdx := 1;
    i := 1;
    if not Eof(f) then
    begin
        Read(f,minNum);
         maxNum:= minNum;
      while not Eof(f) do
       begin
          Read(f,num);
          if num < minNum then
            begin
              minNum := num;
              minIdx := i;
          end;
         if num > maxNum then
          begin
            maxNum := num;
            maxIdx := i;
         end;
        i := i + 1;
       end;
    end;

       Close(f);

    // Создаем временный файл
    Assign(tempF, tempFilePath);
    Rewrite(tempF);

    // Копируем элементы в новый файл с обменом min и max
    Assign(f, filePath);
    Reset(f);
     i := 1;
      while not Eof(f) do
        begin
             Read(f,num);
            if i = minIdx then
                Write(tempF, maxNum)
            else
                if i = maxIdx then
                  Write(tempF, minNum)
              else
                   Write(tempF, num);

         i:= i+1;

        end;

        Close(f);
        Close(tempF);
    // Перезаписываем исходный файл из временного
    Assign(f, filePath);
    Rewrite(f);
    Assign(tempF,tempFilePath);
    Reset(tempF);
    while not Eof(tempF) do
        begin
            Read(tempF,num);
            Write(f, num);
        end;

    Close(f);
    Close(tempF);

    Writeln('Минимальный и максимальный элементы поменяны местами.');
  except
    on E: Exception do
    begin
      Writeln('Ошибка при работе с файлом: ', E.Message);
      Halt(1);
    end;
  end;
end.