final int myWidth = 800;   //width of the window
final int myHeight = 600;  //height of the window

PlayingField pf;
Player player;
Coord hover;

void setup(){
  hover = new Coord();
  pf = new PlayingField(11, 11, 50, 50, 25);
  player = new Player();
  player.walkingSetBorders(0, 0, 10, 10);
  player.canMove = true;
  
  player.coord.x = 0;
  player.coord.y = 0;
  
  background(0);
  fill(color(255, 255, 255));
  pf.map.drawAll();
}

void settings() {
  size(myWidth, myHeight);
}

void draw() {  //called every frame
}

void mouseMoved(){
  Coord old = new Coord(hover);
  hover.set(pf.map.coords(mouseX, mouseY));
  if(!old.equals(hover)){
    if(old.valid_both()){
      pf.markedHexagons[old.x][old.y] &= ~pf.HEX_HOVERED;
      pf.drawSingle(old.x, old.y);
    }
    if(hover.valid_both()){
      pf.markedHexagons[hover.x][hover.y] |= pf.HEX_HOVERED;
      pf.drawSingle(hover.x, hover.y);
    }
  }
}

void mouseClicked(){
  /*if(hover.x != -1 && hover.y != -1 && !hover.equals(player.coord)){
    boolean currhex = !pf.markedHexagons[hover.x][hover.y]; 
    pf.markedHexagons[hover.x][hover.y] = currhex;
    fill((currhex)?color(255, 0, 0):127);
    pf.map.drawSingle(hover.x, hover.y);
  }*/
}

void keyPressed(){
  /*player.walkingUpdateState(key, false);
  Coord nextStp = player.walkingGetNextLocation();
  if(!pf.markedHexagons[nextStp.x][nextStp.y]){
    fill((hover.equals(player.coord))?127:255);
    pf.map.drawSingle(player.coord.x, player.coord.y);
    player.walkingMove();
    fill(color(104, 8, 142));
    pf.map.drawSingle(player.coord.x, player.coord.y);
  }*/
}

void keyReleased(){
  player.walkingUpdateState(key, true);
}
