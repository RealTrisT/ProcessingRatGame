final float mapstartX = 100;
final float mapstartY = 100;

final int mapWidth = 4;
final int mapHeight = 4;

final float hexR = 70;           //for radius

hexagon hex = new hexagon(hexR, 30, true);


void mapInit(){
  hex.ShortDiagonal = hexagonShortDiagonal(hexR);
  hex.Edge  = hexagonEdge(hexR);
  hex.TrianH  = hex.Edge/2;
}

void mapDraw(){
  for(int i = 0; i < int(float(mapHeight)/2+0.5)*mapWidth; i++){
    hex.Draw(
        mapstartX+       hex.ShortDiagonal*(i%mapWidth)
      , 
        mapstartY+       (i/mapWidth)*(hex.Edge+hexR*2)
    );
  }
  for(int i = 0; i < mapHeight/2*mapWidth; i++){
    hex.Draw(
      mapstartX+hex.ShortDiagonal/2+        hex.ShortDiagonal*(i%mapWidth)
     , 
      mapstartY+hex.Edge/2+hexR+            (i/mapWidth)*(hex.Edge+hexR*2)
    );
  }
}

coord mapGet(float x, float y){
  int resulty, resultx;
  float starty = mapstartY - hexR;
  float startx = mapstartX - hex.ShortDiagonal/2;
  float mousex = (x - startx);
  float mousey = (y - starty);
  
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

  coord returnal = new coord();
  if(resultx < 0 || resultx >= mapWidth || resulty < 0 || resulty >= mapHeight){
    returnal.x = -1;
    returnal.y = -1;
  }else{
    returnal.x = resultx;
    returnal.y = resulty;
  }
  return returnal;
}
