class hexagon{
  public hexagon(float radius_, float angle_, boolean init_){
    angle = angle_;
    radius = radius_;
    diameter = radius_*2;
    ShortDiagonal = hexagonShortDiagonal(radius_);
    Edge = hexagonEdge(radius_);
    TrianH = Edge/2;
    if(init_){
      offs = new float[12];
      hexagonFillArray(radius, offs, angle);
    }    
  }
  void init(float angle){
    offs = new float[12];
    hexagonFillArray(radius, offs, angle);
  }
  void Draw(float x, float y){
    beginShape();
    for(int i = 0; i < 12; i+=2){
      vertex(x+offs[i], y+offs[i+1]);
    }
    endShape(CLOSE);
  }

  float offs[]; //offsets of the coorners
  float angle, radius, diameter;
  float ShortDiagonal;             //for short diagonal
  float Edge;                      //for edge
  float TrianH;                    //for tip, the distance from a short diagonal to the nearest, non-touching vertice
}

void hexagonFillArray(float radius, float hexArry[], float angle) {
  float Radian = angle/(180/PI);
  /*   hexArry[x] = cos(PI*2/6*CORNER) * radius   */
  /*   hexArry[y] = sin(PI*2/6*CORNER) * radius   */
    //hopefuly this stuff gets optimized and it doesn't actually do the 6 sines and cosines, but it's java so u never know,
    //    gladly in this program it's only gonna get used once so thas fine
  hexArry[0] = cos(0.0000000000000000000000000000000+Radian) * radius;
  hexArry[1] = sin(0.0000000000000000000000000000000+Radian) * radius;
  hexArry[2] = cos(1.0471975511965977461542144610932+Radian) * radius;
  hexArry[3] = sin(1.0471975511965977461542144610932+Radian) * radius;
  hexArry[4] = cos(2.0943951023931954923084289221863+Radian) * radius;
  hexArry[5] = sin(2.0943951023931954923084289221863+Radian) * radius;
  hexArry[6] = cos(3.1415926535897932384626433832795+Radian) * radius;
  hexArry[7] = sin(3.1415926535897932384626433832795+Radian) * radius;
  hexArry[8] = cos(4.1887902047863909846168578443727+Radian) * radius;
  hexArry[9] = sin(4.1887902047863909846168578443727+Radian) * radius;
  hexArry[10]= cos(5.2359877559829887307710723054658+Radian) * radius;
  hexArry[11]= sin(5.2359877559829887307710723054658+Radian) * radius;
}

float hexagonShortDiagonal(float radius){
  //              cos(30)           *       diameter
  return 0.86602540378443864676372317075294*2*radius;
}

float hexagonEdge(float radius){
  // sin(30)*diameter
  return 0.5*2*radius;
}

void hexagonDraw(float x, float y, float hexArry[]){
  beginShape();
  for(int i = 0; i < 12; i+=2){
    vertex(x+hexArry[i], y+hexArry[i+1]);
  }
  endShape(CLOSE);
}
