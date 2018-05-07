class Map{
  public Map(int w_, int h_, float x_, float y_, float hexrad){
    w = w_; h = h_; startx = x_; starty = y_;
    hex = new hexagon(hexrad, 30, true); //change that hardcoded 30
  }
  
  float startx, starty;
  int w, h;
  hexagon hex;

  void draw(){
    fill(color(255, 255, 255));
    for(int i = 0; i < int(float(h)/2+0.5)*w; i++){
      hex.Draw(
          startx+       hex.ShortDiagonal*(i%w)
        , 
          starty+       (i/w)*(hex.Edge+hex.radius*2)
      );
    }
    for(int i = 0; i < h/2*w; i++){
      hex.Draw(
        startx+hex.ShortDiagonal/2+        hex.ShortDiagonal*(i%w)
       , 
        starty+hex.Edge/2+hex.radius+            (i/w)*(hex.Edge+hex.radius*2)
      );
    }
  }
  
  Coord coords(float x, float y){
    int resulty, resultx;
    float efstarty = starty - hex.radius;
    float efstartx = startx - hex.ShortDiagonal/2;
    float mousex = (x - efstartx);
    float mousey = (y - efstarty);
    
    float solov = mousex%hex.ShortDiagonal;  //so it's as if it's only one
    
    float thatconst = 0.57735026918962576450914878050196;
    
    resulty = int((mousey)/(hex.Edge+hex.TrianH)); //get the raw squares
    
    float height_;
    if(resulty%2 == 1){ //odd
      if(solov < (hex.ShortDiagonal/2)){  //"growing" (downward)
          height_ = solov*(thatconst)
                    +(float(resulty))*(hex.Edge+hex.TrianH);
      }else{                  //not
          height_ = (solov-hex.ShortDiagonal/2)*(-thatconst) + hex.TrianH
                    + (float(resulty))*(hex.Edge+hex.TrianH);
      }
    }else{  //even
      if(solov < (hex.ShortDiagonal/2)){  //"growing" (downward)
          height_ = (solov-hex.ShortDiagonal/2)*(-thatconst)
                    +(float(resulty))*(hex.Edge+hex.TrianH);
      }else{                  //not
          height_ = solov*(thatconst) - hex.TrianH
                    + (float(resulty))*(hex.Edge+hex.TrianH);
      }
    }
    resulty -= int(height_ > mousey);
   
           //shit fucking language won't even cast an int properly fucking niggers
    resultx = floor((mousex - ((resulty%2==1)?(hex.ShortDiagonal/2):(0)))/hex.ShortDiagonal);  
  
    Coord returnal = new Coord();
    if(resultx < 0 || resultx >= w || resulty < 0 || resulty >= h){
      returnal.x = -1;
      returnal.y = -1;
    }else{
      returnal.x = resultx;
      returnal.y = resulty;
    }
    return returnal;
  }
}
