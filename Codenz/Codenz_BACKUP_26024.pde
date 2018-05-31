final int mapWidth = 11;      //width in hexagons
final int mapHeight = 11;     //height in hexagons
final int mapHexRadius = 25;  //radius of the hexagons
final int mapXOffs = 50;      //map offset from left window border
final int mapYOffs = 50;      //map offset from top window border
final int numBlockHex = 5;    //number of blocked hexs at start
        
//                 make up for map offsets            width of each cell      width in cells, -0.5 because of the half one in the end
//                           v                                  v                            v
final int myWidth  = int(mapXOffs*2  +  hexagonShortDiagonal((float)mapHexRadius)  *  (mapWidth-0.5));      //window width

//                 make up for map offsets         even cells                            odd cells
//                           v                          v                                    v
final int myHeight = int(mapYOffs*2  +  (mapHexRadius*2)*(mapHeight/2)  +  (mapHexRadius)*((mapHeight-1)/2));  //height of the window

final char GAMESTATE_START = 0;
final char GAMESTATE_PLAYN = 1;
final char GAMESTATE_ENDED = 2;
char gameState = 0;

MainMenu mainMenu;
PlayingField pf;
Player npc;
Coord hover;


void setInitialBlocks(){                                //Set some randomBlocks at start
  Coord randomHex = new Coord();
  randomHex.x = (int)random(mapWidth);
  randomHex.y = (int)random(mapHeight);
  
  for(int i = 0;i<numBlockHex;i++){
    do{
      randomHex.x = (int)random(mapWidth);
      randomHex.y = (int)random(mapHeight);
    }while(randomHex.equals(npc.coord));
    pf.markedHexagons[randomHex.x][randomHex.y] ^= pf.HEX_BLOCKED;
    pf.drawSingle(randomHex.x, randomHex.y);
    npc.path.setGradientDensity(randomHex.x, randomHex.y);
  } 
}

void setup() {
  mainMenu = new MainMenu(myWidth, myHeight);
  hover    = new Coord();
  pf       = new PlayingField(mapWidth, mapHeight, mapXOffs, mapYOffs, mapHexRadius);
  npc      = new Player();
  npc.walkingSetBorders(0, 0, mapWidth-1, mapHeight-1);

<<<<<<< HEAD
  mainMenu.firstRender();
=======
  npc.coord.x = mapWidth/2;
  npc.coord.y = mapHeight/2;

  background(0);
  fill(color(255, 255, 255));
  pf.map.drawAll();
  pf.markedHexagons[npc.coord.x][npc.coord.y] |= pf.HEX_PLAYERD;
  pf.drawSingle(npc.coord.x, npc.coord.y);
  
  setInitialBlocks();
  //mainMenu.firstRender();
>>>>>>> da2dce8b6ecf2c0ea489ab367887684a7c708b0b
}

void settings() {
  size(myWidth, myHeight);
}

void draw() {  //called every frame
}

void startPlaying(){
  npc.canMove = true;
  npc.coord.x = mapWidth/2;
  npc.coord.y = mapHeight/2;
  background(0);
  fill(color(255, 255, 255));
  pf.map.drawAll();
  pf.markedHexagons[npc.coord.x][npc.coord.y] |= pf.HEX_PLAYERD;
  pf.drawSingle(npc.coord.x, npc.coord.y);
  
  gameState = GAMESTATE_PLAYN;
}

void gameMouseMoved(){
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
}

void gameMouseClicked(){
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

void mouseMoved() {
  if(gameState == GAMESTATE_PLAYN){
    gameMouseMoved();    
  }else if(gameState == GAMESTATE_START){
    mainMenu.render(int(mouseX), int(mouseY));
  }else if(gameState == GAMESTATE_ENDED){
  }
}

void mouseClicked(){
  if(gameState == GAMESTATE_PLAYN){
    gameMouseClicked();
  }else if(gameState == GAMESTATE_START){
    mainMenu.clicko(int(mouseX), int(mouseY));
  }else if(gameState == GAMESTATE_ENDED){
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
