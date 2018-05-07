class Coord{
  public Coord(){
    x = y = -1;
  }
  public Coord(int x_, int y_){
    x = x_; y = y_;
  }
  public Coord(Coord other){ //copy constructor
    x = other.x;
    y = other.y;
  }
  int x, y;
}

class Coordf{
  public Coordf(){
    x = y = -1;
  }
  public Coordf(float x_, float y_){
    x = x_; y = y_;
  }
  public Coordf(Coordf other){ //copy constructor
    x = other.x;
    y = other.y;
  }
  float x, y;
}
