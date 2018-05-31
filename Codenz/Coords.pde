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
  Coord set(Coord other){
    x = other.x;
    y = other.y;
    return this;
  }
  boolean equals(Coord other){
    return x == other.x && y == other.y;
  }
  boolean valid_both(){
    return (x != -1 && y != -1);
  }
  boolean valid_either(){
    return x != -1 || y != -1;
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
  Coordf set(Coordf other){
    x = other.x;
    y = other.y;
    return this;
  }
  boolean equals(Coordf other){
    return x == other.x && y == other.y;
  }
  float x, y;
}
