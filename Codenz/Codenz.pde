final int myWidth = 800;   //width of the window
final int myHeight = 600;  //height of the window

PlayingField pf;

void setup(){
  pf = new PlayingField(11, 11, 50, 50, 25);
}

void settings() {
  size(myWidth, myHeight);
}

void draw() {  //called every frame
  pf.map.mapDraw();
  pf.drawPoints_Debug();
}

void mouseMoved(){
  coord nigger = pf.map.mapGet(mouseX, mouseY);
  println(nigger.x, nigger.y);
}
