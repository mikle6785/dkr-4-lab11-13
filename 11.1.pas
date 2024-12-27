uses GraphABC;
begin
   Circle(100,200,50);
   FloodFill(100,200,clred);
   Circle(500,200,50);
   FloodFill(500,200,clYellow);
 moveTo(150,200);
  lineTo(300,300);
  lineto(450,200);
  lineto(150,200);
  floodfill(250,250,clgreen);
  moveTo(150,200);
  lineTo(300,100);
  lineto(450,200);
  lineto(150,200);
  floodfill(250,150,clblue);
end.