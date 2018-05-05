final int myWidth = 800;   //width of the window
final int myHeight = 600;  //height of the window

PlayingField pf;
coord hovva;

void setup(){
  pf = new PlayingField(11, 11, 50, 50, 25);
  hovva = new coord(-1, -1);
}

void settings() {
  size(myWidth, myHeight);
}

void draw() {  //called every frame
  background(0);
  textSize(50);
  pf.map.mapDraw();
  pf.drawPoints_Debug();
  if(hovva.x != -1){
    text("(" + hovva.x + ", " + hovva.y + ")", 50, 500);
  }
}

void mouseMoved(){
  hovva = pf.map.mapGet(mouseX, mouseY);
}
