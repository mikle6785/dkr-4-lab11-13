program FindMaxLenStringsAndReverse;

var
    filePathIn, filePathOut: string;
    fIn, fOut: file of char;
    c: char;
    line: string;
    maxLen: integer;
    maxLenStrings: array of string;
    i, j, numSymbols, count: integer;
begin
    filePathIn := 'E:\string2.txt';
    filePathOut := 'E:\string2_out.txt';
    maxLen := 0;
    count := 0;

    try
        // Попытка открыть файл для чтения
        Assign(fIn, filePathIn);
        try
            Reset(fIn); // Открываем файл, если он существует
        except
            on E: Exception do
            begin
                Writeln('Файл ', filePathIn, ' не найден. Создаю новый файл.');
                Rewrite(fIn); // Создаем новый файл для записи
                  Write('Сколько символов записать в файл (k)? ');
                Readln(numSymbols);
                 Writeln('Введите ', numSymbols, ' символов:');
                for i := 1 to numSymbols do
                    begin
                        Read(c);
                         Write(fIn, c);
                  end;
                Close(fIn);
                   Assign(fIn,filePathIn);
                   Reset(fIn);
            end;
        end;


      // Находим максимальную длину строки и записываем строки этой длины

       while not Eof(fIn) do
          begin
            i:=0;
            line := '';
             while (not Eof(fIn))  do
               begin
                  read(fIn,c);
                   if c = #13 then break
                  else  begin
                      line := line + c;
                    i:= i+1;
                    end;
              end;
                 if length(line) > maxLen then
                    begin
                      maxLen := length(line);
                        count := 1;
                        SetLength(maxLenStrings, count);
                        maxLenStrings[0] := line;
                    end
                   else
                       if length(line) = maxLen then
                            begin
                                 count := count+1;
                                  SetLength(maxLenStrings, count);
                                 maxLenStrings[count - 1] := line;
                            end;

          end;


        Close(fIn);


        // Запись в выходной файл в обратном порядке
        Assign(fOut, filePathOut);
        Rewrite(fOut);
          for i := count - 1 downto 0 do
            begin
                for j := 1 to Length(maxLenStrings[i]) do
                  begin
                      Write(fOut,maxLenStrings[i][j]);
                    end;
                write(fOut, #13);
           end;
        Close(fOut);

        Writeln('Строки максимальной длины (в обратном порядке) записаны в файл ', filePathOut);

    except
        on E: Exception do
        begin
            Writeln('Ошибка при работе с файлом: ', E.Message);
            Close(fIn);
           Halt(1);
        end;
    end;
    Readln;
end.3532
3
