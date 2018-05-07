class Player{
  public Player(){
    coord = new Coord();
    pos = new Coordf();
    movement = new HexagonMovement(0, 0, 0, 0);
  }
  void walkingSetBorders(int xmin_, int ymin_, int xmax_, int ymax_){
    movement.maxleft   = xmin_;
    movement.maxright  = xmax_;
    movement.maxtop    = ymin_;
    movement.maxbottom = ymax_;
  }
  void walkingUpdateState(char key_, boolean released_){
    movement.updateState(key_, released_, coord);
  }
  void walkingMove(){
    if(canMove){
      movement.move(coord);
      movement.updateState(coord);
    }
  }
  Coord walkingGetNextLocation(){
    Coord result = new Coord(coord);
    movement.move(result);
    return result;
  }
  
  HexagonMovement movement;
  boolean canMove;
  Coord coord;
  Coordf pos;
}
