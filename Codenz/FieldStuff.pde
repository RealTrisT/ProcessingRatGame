class PlayingField{
  
  final char HEX_HOVERED = 0x1;
  final char HEX_BLOCKED = 0x2;
  final char HEX_PLAYERD = 0x4;
  
  public PlayingField(int width_, int height_, float x_, float y_, float radius_){
    hex = new hexagon(radius_, 30, false);
    points = new Coordf[width_*2][height_];
    markedHexagons = new char[width_][height_];
    map = new Map(width_, height_, x_, y_, radius_);
    w = width_;
    h = height_; //<>//
    for(int y = 0; y < height_; y++){
      for(int x = 0; x < width_*2; x++){
        points[x][y] = new Coordf(
          x_+x*hex.ShortDiagonal/2,
          y_+y*(hex.Edge + hex.TrianH)
        );
    } }
  }
  
  Coordf loc(int x, int y){
    return (x < 0 || y < 0)?null:points[x*2 + y%2][y];
  }
  
  void drawSingle(int x, int y){
    if(((markedHexagons[x][y])&(HEX_PLAYERD)) != 0){
      fill(color(104, 8, 142));
    }else if(((markedHexagons[x][y])&(HEX_BLOCKED)) != 0){
      fill(color(255, 0, 0));
    }else if(((markedHexagons[x][y])&(HEX_HOVERED)) != 0){
      fill(127);
    }else{
      fill(255);
    }
    map.drawSingle(x, y);
  }
  
  void drawPoints_Debug(){
    ellipseMode(CENTER);  // Set ellipseMode to CENTER
    fill(color(255, 0, 0));
    for(int y = 0; y < h; y++){
      for(int x = 0; x < w*2; x++){
        ellipse(points[x][y].x, points[x][y].y, 5, 5);
      }
    }
  }
  
  Map map;
  hexagon hex;
  Coordf points[][];
  char markedHexagons[][];
  int w, h;
}
