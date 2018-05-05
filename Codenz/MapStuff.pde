final float mapstartX = 100;
final float mapstartY = 100;

final int mapWidth = 4;
final int mapHeight = 4;

final float hexR = 70;           //for radius
float hexoffs[] = new float[12]; //offsets of the coorners
float hexSD;                     //for short diagonal
float hexE;                      //for edge
float hexT;                      //for tip, the distance from a short diagonal to the nearest, non-touching vertice

void mapInit(){
  hexagonFillArray_Vertical(hexR, hexoffs);
  hexSD = hexagonShortDiagonal(hexR);
  hexE  = hexagonEdge(hexR);
  hexT  = hexE/2;
  println("hexDiameter: " + hexR*2);
  println("hexSD: " + hexSD);
  println("hexE : " + hexE);
  println("hexT : " + hexT);
}

void mapDraw(){
  for(int i = 0; i < int(float(mapHeight)/2+0.5)*mapWidth; i++){
    hexagonDraw(
        mapstartX+       hexSD*(i%mapWidth)
      , 
        mapstartY+       (i/mapWidth)*(hexE+hexR*2)
      , 
        hexoffs
    );
  }
  for(int i = 0; i < mapHeight/2*mapWidth; i++){
    hexagonDraw(
      mapstartX+hexSD/2+        hexSD*(i%mapWidth)
     , 
      mapstartY+hexE/2+hexR+    (i/mapWidth)*(hexE+hexR*2)
     , 
      hexoffs
    );
  }
}

int mapGet(float x, float y){
  int resulty, resultx;
  float starty = mapstartY - hexR;
  float startx = mapstartX - hexSD/2;
  float mousex = (x - startx);
  float mousey = (y - starty);
  
  float solov = mousex%hexSD;  //so it's as if it's only one
  
  float thatconst = 0.57735026918962576450914878050196;
  //println(mousey);
  //println("map relative: (" + mousex + ", " + mousey + ")");
  
  resulty = int((mousey)/(hexE+hexT)); //get the raw squares
  //println(resulty);
  //println(solov);
  if(resulty%2 == 1){ //odd
    if(solov < (hexSD/2)){  //"growing" (downward)
        float height_;
        height_ = solov*(thatconst);
        height_ += (float(resulty))*(hexE+hexT);
        //println(height_ + "  -  " + mousey);
        //println(height_);
        //println(((height_ > mousey)?"ABOVE":"BELLOW"));
        resulty -= int(height_ > mousey);
    }else{                  //not
        float height_;
        height_ = (solov-hexSD/2)*(-thatconst) + hexT;
        height_ += (float(resulty))*(hexE+hexT);
        //println(height_ + "  -  " + mousey);
        //println(height_);
        //println(((height_ > mousey)?"ABOVE":"BELLOW"));
        resulty -= int(height_ > mousey);
    }
  }else{
    if(solov < (hexSD/2)){  //"growing" (downward)
        float height_;
        height_ = (solov-hexSD/2)*(-thatconst);
        height_ += /*starty + */(float(resulty))*(hexE+hexT);
        //println(height_ + "  -  " + mousey);
        //println(height_);
        //println(((height_ > mousey)?"ABOVE":"BELLOW"));
        resulty -= int(height_ > mousey);
    }else{                  //not
        float height_;
        height_ = solov*(thatconst) - hexT;
        height_ += /*starty + */(float(resulty))*(hexE+hexT);
        //println(height_ + "  -  " + mousey);
        //println(height_);
        //println(((height_ > mousey)?"ABOVE":"BELLOW"));
        resulty -= int(height_ > mousey);
    }
  }
  
  //println(resulty);  
  return resulty;
}
