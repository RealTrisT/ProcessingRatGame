void hexagonFillArray_Horizontal(float radius, float hexArry[]) {
  /*   hexArry[x] = cos(PI*2/6*CORNER) * radius   */
  /*   hexArry[y] = sin(PI*2/6*CORNER) * radius   */
    //hopefuly this stuff gets optimized and it doesn't actually do the 6 sines and cosines, but it's java so u never know,
    //    gladly in this program it's only gonna get used once so thas fine
  hexArry[0] = cos(0.0000000000000000000000000000000) * radius;
  hexArry[1] = sin(0.0000000000000000000000000000000) * radius;
  hexArry[2] = cos(1.0471975511965977461542144610932) * radius;
  hexArry[3] = sin(1.0471975511965977461542144610932) * radius;
  hexArry[4] = cos(2.0943951023931954923084289221863) * radius;
  hexArry[5] = sin(2.0943951023931954923084289221863) * radius;
  hexArry[6] = cos(3.1415926535897932384626433832795) * radius;
  hexArry[7] = sin(3.1415926535897932384626433832795) * radius;
  hexArry[8] = cos(4.1887902047863909846168578443727) * radius;
  hexArry[9] = sin(4.1887902047863909846168578443727) * radius;
  hexArry[10]= cos(5.2359877559829887307710723054658) * radius;
  hexArry[11]= sin(5.2359877559829887307710723054658) * radius;
}

void hexagonFillArray_Vertical(float radius, float hexArry[]) {
  float Radian30 = 0.52359877559829887307710723054658;
  /*   hexArry[x] = cos(PI*2/6*CORNER) * radius   */
  /*   hexArry[y] = sin(PI*2/6*CORNER) * radius   */
    //hopefuly this stuff gets optimized and it doesn't actually do the 6 sines and cosines, but it's java so u never know,
    //    gladly in this program it's only gonna get used once so thas fine
  hexArry[0] = cos(0.0000000000000000000000000000000+Radian30) * radius;
  hexArry[1] = sin(0.0000000000000000000000000000000+Radian30) * radius;
  hexArry[2] = cos(1.0471975511965977461542144610932+Radian30) * radius;
  hexArry[3] = sin(1.0471975511965977461542144610932+Radian30) * radius;
  hexArry[4] = cos(2.0943951023931954923084289221863+Radian30) * radius;
  hexArry[5] = sin(2.0943951023931954923084289221863+Radian30) * radius;
  hexArry[6] = cos(3.1415926535897932384626433832795+Radian30) * radius;
  hexArry[7] = sin(3.1415926535897932384626433832795+Radian30) * radius;
  hexArry[8] = cos(4.1887902047863909846168578443727+Radian30) * radius;
  hexArry[9] = sin(4.1887902047863909846168578443727+Radian30) * radius;
  hexArry[10]= cos(5.2359877559829887307710723054658+Radian30) * radius;
  hexArry[11]= sin(5.2359877559829887307710723054658+Radian30) * radius;
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
