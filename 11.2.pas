uses GraphABC;
begin
 moveTo(200,400);
  lineTo(150,200);
  lineTo(350,400);
  Circle(150,200,25);
  FloodFill(150,200,clblue);
  moveTo(200,400);
  lineTo(350,400);
  moveTo(425,400);
   lineTo(475,200);
  lineTo(275,400);
  Circle(475,200,25);
  FloodFill(475,200,clgreen);
  moveTo(425,400);
  lineTo(200,400);
  //3
  moveTo(350,400);
  lineTo(313,200);
  lineTo(275,400);
  Circle(313,200,25);
  FloodFill(313,200,clred);
  
  //pokras
 floodfill(200,380,clblue);
 floodfill(425,380,clgreen);
 floodfill(325,380,clred);
 floodfill(315,350,clred);
 floodfill(280,380,clred);
 floodfill(345,380,clred);
 
 
 
 
  
  
  
  
  
  
end.