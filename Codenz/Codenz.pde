final int myWidth = 800;   //width of the window
final int myHeight = 600;  //height of the window

PlayingField pf;
Player player;

void setup(){
  pf = new PlayingField(11, 11, 50, 50, 25);
  player = new Player();
  player.walkingSetBorders(0, 0, 10, 10);
}

void settings() {
  size(myWidth, myHeight);
}

void draw() {  //called every frame
  background(0);
  textSize(50);
  pf.map.draw();
  pf.drawPoints_Debug();
  if(player.coord.x != -1){
    text("(" + player.coord.x + ", " + player.coord.y + ")", 50, 500);
  }
  Coordf loq = pf.loc(player.coord.x, player.coord.y);
  if(loq != null){fill(color(0, 255, 0));ellipse(loq.x, loq.y, 20, 20);}
}

void mouseMoved(){
  player.coord = pf.map.coords(mouseX, mouseY);
}

void keyPressed(){
  player.walkingUpdateState(key, false);
  player.walkingMove();
}

void keyReleased(){
  player.walkingUpdateState(key, true);
}
