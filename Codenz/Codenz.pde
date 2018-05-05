final int myWidth = 800;   //width of the window
final int myHeight = 600;  //height of the window


void setup(){
  mapInit();
}

void settings() {
  size(myWidth, myHeight);
}

void draw() {  //called every frame
  mapDraw();  
}

void mouseMoved(){
  /*println(*/mapGet(mouseX, mouseY);/*);*/
}
