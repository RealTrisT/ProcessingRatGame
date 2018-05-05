class PlayingField{
  public PlayingField(int width_, int height_, float x_, float y_, float radius_){
    hex = new hexagon(radius_, 30, false);
    points = new coordf[width_*2][height_];
    w = width_;
    h = height_;
    for(int y = 0; y < height_; y++){
      for(int x = 0; x < width_*2; x++){
        points[x][y].x = x_+x*hex.ShortDiagonal/2;
        points[x][y].y = y_+y*(hex.Edge + hex.TrianH);
      }
    }
  }
  
  void drawPoints_Debug(){
    ellipseMode(CENTER);  // Set ellipseMode to CENTER
    fill(color(255, 0, 0));
    for(int y = 0; y < w; y++){
      for(int x = 0; x < h*2; x++){
        ellipse(points[x][y].x, points[x][y].y, 5, 5);
      }
    }
  }
  
  hexagon hex;
  coordf points[][];
  int w, h;
}
