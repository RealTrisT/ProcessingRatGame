class Player{
  public Player(){
    coord = new Coord();
    pos = new Coordf();
    movement = new HexagonMovement(0, 0, 0, 0);
    isWinner = false;
    path = new PathFinding(movement);
  }
  void walkingSetBorders(int xmin_, int ymin_, int xmax_, int ymax_){
    movement.maxleft   = xmin_;
    movement.maxright  = xmax_;
    movement.maxtop    = ymin_;
    movement.maxbottom = ymax_;
    
    path.resetAllDensity();  //this is needed because the matrix density needs to be allocated
  }; 
    
  void walkingUpdateState(char key_, boolean released_){
    movement.updateState(key_, released_, coord);
  }
  void walkingMove(){
    if(canMove){
      movement.move_key(coord);
      movement.updateState(coord);
    }
  }
  Coord walkingGetNextLocation(){
    Coord result = new Coord(coord);
    movement.move_key(result);
    return result;
  }
  
  //move to next best location
  Coord moveNextLocation(){
    int positionToMove;
    Coord oldCoord = new Coord(coord);    
    positionToMove = path.getNextPosition(coord); 
    
    if(positionToMove == movement.NONE){      //game won    
     isWinner = true;
     return oldCoord;
    }
    
    movement.move(coord,positionToMove);                                               
    return oldCoord;                        //RETURN OLD LOCATION
  }
  
  
  boolean isLoser(){
    if(coord.x == movement.maxleft || coord.x == movement.maxright || coord.y == movement.maxtop || coord.y == movement.maxbottom) 
      return true;
    return false;
  }
  
  boolean isWinner()  {return isWinner;};
  
  HexagonMovement movement;
  PathFinding path;
  boolean canMove;
  boolean isWinner;
  Coord coord;
  Coordf pos;
}
