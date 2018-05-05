final int myWidth = 800;   //width of the window
final int myHeight = 600;  //height of the window

final float mapstartX = 100;
final float mapstartY = 100;

final float hexR = 25;           //for radius
float hexoffs[] = new float[12]; //offsets of the coorners
float hexSD;                     //for short diagonal
float hexE;                      //for edge

void setup(){
  hexagonFillArray_Vertical(hexR, hexoffs);
  hexSD = hexagonShortDiagonal(hexR);
  hexE  = hexagonEdge(hexR);
}

void settings() {
  size(myWidth, myHeight);
}

void drawMap(){
  for(int i = 0; i < 66/*11*6*/; i++){
    hexagonDraw(mapstartX+hexSD*(i%11), mapstartY+(i/11)*(hexE+hexR*2), hexoffs);
  }
  for(int i = 0; i < 55/*11*5*/; i++){
    hexagonDraw(mapstartX+hexSD/2+hexSD*(i%11), mapstartY+hexE/2+hexR+(i/11)*(hexE+hexR*2), hexoffs);
  }
}

void draw() {  //called every frame

  
}
