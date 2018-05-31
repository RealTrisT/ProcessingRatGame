final int mapWidth = 11;      //width in hexagons
final int mapHeight = 11;     //height in hexagons
final int mapHexRadius = 25;  //radius of the hexagons
final int mapXOffs = 50;      //map offset from left window border
final int mapYOffs = 50;      //map offset from top window border
        
//                 make up for map offsets            width of each cell      width in cells, -0.5 because of the half one in the end
//                           v                                  v                            v
final int myWidth  = int(mapXOffs*2  +  hexagonShortDiagonal((float)mapHexRadius)  *  (mapWidth-0.5));      //window width

//                 make up for map offsets         even cells                            odd cells
//                           v                          v                                    v
final int myHeight = int(mapYOffs*2  +  (mapHexRadius*2)*(mapHeight/2)  +  (mapHexRadius)*((mapHeight-1)/2));  //height of the window

MainMenu mainMenu;
PlayingField pf;
Player npc;
Coord hover;

void setup() {
  mainMenu = new MainMenu(myWidth, myHeight);
  hover    = new Coord();
  pf       = new PlayingField(mapWidth, mapHeight, mapXOffs, mapYOffs, mapHexRadius);
  npc      = new Player();
  npc.walkingSetBorders(0, 0, mapWidth-1, mapHeight-1);
  npc.canMove = true;

  npc.coord.x = mapWidth/2;
  npc.coord.y = mapHeight/2;

  background(0);
  fill(color(255, 255, 255));
  pf.map.drawAll();
  pf.markedHexagons[npc.coord.x][npc.coord.y] |= pf.HEX_PLAYERD;
  pf.drawSingle(npc.coord.x, npc.coord.y);
  //mainMenu.firstRender();
}

void settings() {
  size(myWidth, myHeight);
}

void draw() {  //called every frame
}

void mouseMoved() {
  Coord old = new Coord(hover);
  hover.set(pf.map.coords(mouseX, mouseY));
  if (!old.equals(hover)) {
    if (old.valid_both()) {
      pf.markedHexagons[old.x][old.y] &= ~pf.HEX_HOVERED;
      pf.drawSingle(old.x, old.y);
    }
    if (hover.valid_both()) {
      pf.markedHexagons[hover.x][hover.y] |= pf.HEX_HOVERED;
      pf.drawSingle(hover.x, hover.y);
    }
  }
  //mainMenu.render(int(mouseX), int(mouseY));
}

void mouseClicked() {
  if (!npc.canMove)
    return;
  if (hover.valid_both() && !hover.equals(npc.coord)) {
    //SET DENSITY
    //npc.path.setDensityArround(hover.x, hover.y);  //(1st generation)
    npc.path.setGradientDensity(hover.x, hover.y);   //(2nd generation)


    //Draw Clicked
    pf.markedHexagons[hover.x][hover.y] ^= pf.HEX_BLOCKED;
    pf.drawSingle(hover.x, hover.y);


    Coord olderPos = npc.moveNextLocation();                      //return older location
    if (npc.isWinner()) {
      npc.canMove = false;
      return;
    }
    //Draw New Hex
    pf.markedHexagons[npc.coord.x][npc.coord.y] |= pf.HEX_PLAYERD;
    pf.drawSingle(npc.coord.x, npc.coord.y);

    //ReDraw Older hex
    pf.markedHexagons[olderPos.x][olderPos.y] &= ~pf.HEX_PLAYERD;
    pf.drawSingle(olderPos.x, olderPos.y);

    if (npc.isLoser())
      npc.canMove = false;
  }
}

void keyPressed() {
  npc.walkingUpdateState(key, false);
  Coord nextStp = npc.walkingGetNextLocation();
  if ((pf.markedHexagons[nextStp.x][nextStp.y]&pf.HEX_BLOCKED) == 0) {
    if (!nextStp.equals(npc.coord)) {
      pf.markedHexagons[npc.coord.x][npc.coord.y] &= ~pf.HEX_PLAYERD;
      pf.drawSingle(npc.coord.x, npc.coord.y);
    }
    npc.walkingMove();
    pf.markedHexagons[npc.coord.x][npc.coord.y] |= pf.HEX_PLAYERD;
    pf.drawSingle(npc.coord.x, npc.coord.y);
  }
}

void keyReleased() {
  npc.walkingUpdateState(key, true);
}
