program FileIO;

uses System.IO;

var
  filetext: StreamWriter;
  fileread: StreamReader;
  a: string;
  i: integer;
  filePath: string;

begin
  filePath := 'E:\text1.txt'; // Путь к файлу

   // Запись в файл
  filetext := new StreamWriter(filePath);
  for i := 1 to 10 do
  begin
    filetext.WriteLine(i);
  end;
  filetext.Close();

  // Чтение из файла
  fileread := new StreamReader(filePath);
  while not fileread.EndOfStream do // Используем EndOfStream для правильного чтения
  begin
    a := fileread.ReadLine();
    Writeln(a);
  end;
  fileread.Close();
end.