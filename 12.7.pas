program SumOfNumbersWithFiveDivisors;

var
  filePathIn, filePathOut: string;
  fileIn, fileOut: Text;
  n, i: Int64;
  sum: Int64;
  isPrime: boolean;
  numElements: integer;
begin
  filePathIn := 'E:\z3.in';
  filePathOut := 'E:\z3.out';
  sum := 0;

  try
    // Попытка открыть входной файл для чтения
    Assign(fileIn, filePathIn);
     try
      Reset(fileIn);
    except
          on E: Exception do
          begin
            Writeln('Файл ', filePathIn, ' не найден. Создаю новый файл.');
            Rewrite(fileIn);
            Write('Введите число n: ');
            Readln(n);
              WriteLn(fileIn,n);
           Close(fileIn);
           Assign(fileIn, filePathIn);
           Reset(fileIn);
            end;
     end;
     Readln(fileIn,n);
     Close(fileIn);

    // Находим числа с 5 делителями и суммируем их
    for i := 2 to Trunc(Sqrt(n)) do
    begin
        isPrime := true;
        for var j:= 2 to Trunc(Sqrt(i)) do
          if (i mod j) = 0 then
           begin
             isPrime:= false;
               break;
           end;
         if isPrime then
         begin
            if (i*i*i*i <= n) then
                sum:=sum + i*i*i*i;

          end;
    end;


    // Запись результата в выходной файл
    Assign(fileOut, filePathOut);
    Rewrite(fileOut);
    Writeln(fileOut, sum);
    Close(fileOut);

    Writeln('Сумма чисел с 5 делителями записана в файл ', filePathOut);
  except
    on E: Exception do
    begin
      Writeln('Ошибка при работе с файлом: ', E.Message);
      Halt(1);
    end;
  end;
end.