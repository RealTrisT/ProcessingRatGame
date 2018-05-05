class PlayingField{
  public PlayingField(int width_, int height_, float x_, float y_, float radius_){
    hex = new hexagon(radius_, 30, false);
    points = new coordf[width_*2][height_];
    w = width_;
    h = height_; //<>//
    for(int y = 0; y < height_; y++){
      for(int x = 0; x < width_*2; x++){
        points[x][y] = new coordf(
          x_+x*hex.ShortDiagonal/2,
          y_+y*(hex.Edge + hex.TrianH)
        );
      }
    }
    map = new Map(w, h, x_, y_, radius_);
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
  coordf points[][];
  int w, h;
}
