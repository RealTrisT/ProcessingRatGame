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
  
  player.coord.x = 5;
  player.coord.y = 5;
  
  background(0);
  fill(color(255, 255, 255));
  pf.map.drawAll();
  pf.markedHexagons[5][5] |= pf.HEX_PLAYERD;
  pf.drawSingle(5, 5);
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
  if(!player.canMove)
    return;
  if(hover.valid_both() && !hover.equals(player.coord)){
    //SET DENSITY
    //player.path.setDensityArround(hover.x, hover.y);  //(1st generation)
    player.path.setGradientDensity(hover.x, hover.y);   //(2nd generation)
    
    
    //Draw Clicked
    pf.markedHexagons[hover.x][hover.y] ^= pf.HEX_BLOCKED;
    pf.drawSingle(hover.x, hover.y);
    
    
    Coord olderPos = player.moveNextLocation();                      //return older location
    if(player.isWinner()){
      player.canMove = false;
      return;
    }
    //Draw New Hex
    pf.markedHexagons[player.coord.x][player.coord.y] |= pf.HEX_PLAYERD;
    pf.drawSingle(player.coord.x, player.coord.y);
      
    //ReDraw Older hex
    pf.markedHexagons[olderPos.x][olderPos.y] &= ~pf.HEX_PLAYERD;
    pf.drawSingle(olderPos.x, olderPos.y);
    
    if(player.isLoser())
      player.canMove = false;
  }
}

void keyPressed(){
  player.walkingUpdateState(key, false);
  Coord nextStp = player.walkingGetNextLocation();
  if((pf.markedHexagons[nextStp.x][nextStp.y]&pf.HEX_BLOCKED) == 0){
    if(!nextStp.equals(player.coord)){
      pf.markedHexagons[player.coord.x][player.coord.y] &= ~pf.HEX_PLAYERD;
      pf.drawSingle(player.coord.x, player.coord.y);
    }
    player.walkingMove();
    pf.markedHexagons[player.coord.x][player.coord.y] |= pf.HEX_PLAYERD;
    pf.drawSingle(player.coord.x, player.coord.y);
  }
}

void keyReleased(){
  player.walkingUpdateState(key, true);
}
