class HexagonMovement{
  public HexagonMovement(int maxleft_, int maxright_, int maxtop_, int maxbottom_){
    maxleft   = maxleft_;
    maxright  = maxright_;
    maxtop    = maxtop_;
    maxbottom = maxbottom_;
    key_up    = 'w';
    key_left  = 'a';
    key_down  = 's';
    key_right = 'd';
    right = left = up = down = false;
  }
  
  public HexagonMovement(HexagonMovement other){ //copy constructor
    maxleft = other.maxleft;
    maxright = other.maxright;
    maxtop = other.maxtop;
    maxbottom = other.maxbottom;
    key_up = other.key_up;
    key_down = other.key_down;
    key_left = other.key_left;
    key_right = other.key_right;
    right = other.right;
    left = other.left;
    up = other.up;
    down = other.down;
  }
  
  //For Move Type
  public final int NONE = -1;
  public final int UP_RIGHT = 0;
  public final int UP_LEFT = 1;
  public final int DOWN_RIGHT = 2;
  public final int DOWN_LEFT = 3;
  public final int SIDE_RIGHT = 4;
  public final int SIDE_LEFT = 5;
  
  private int maxleft, maxright, maxtop, maxbottom;
  private boolean right, left, up, down;
  char key_up, key_down, key_left, key_right;

  //coord will not be changed
  void updateState(char key_, boolean released_, Coord coord_){
    if(key_ == key_up){                       //--------------UP------------------
          up = (coord_.y != maxtop)?!released_:false;
    }else if(key_ == key_left){               //--------------LEFT----------------
          left = (coord_.x != maxleft || (coord_.y%2!=0 && (up || down)))?!released_:false;
          if(right)if(left)right = false;
    }else if(key_ == key_down){               //--------------DOWN-----------------
          down = (coord_.y != maxbottom)?!released_:false;
    }else if(key_ == key_right){              //--------------RIGHT----------------
          right = (coord_.x != maxright || (coord_.y%2!=1 && (up || down)))?!released_:false;
          if(left)if(right)left = false;
    }
  }
  
  void updateState(Coord coord_){
    if(coord_.y == maxtop)   up = false;
    if(coord_.y == maxbottom)down = false;
    if(coord_.x == maxleft)  left = false;
    if(coord_.x == maxright) right = false;
  }  
  
  //key_ - key that was pressed
  //coord - coord to change
  //doesn't matter if the coords are inverted, since we're just checking if they're not equal to the borders
  void move_key(Coord coord_){
    if(left){               //--------------LEFT----------------
          if(up)  //if moving up
            move(coord_, UP_LEFT);
          else if(down) //if moving down
            move(coord_, DOWN_LEFT);
          else  //if moving to the sides
            move(coord_, SIDE_LEFT);
          
    }else if(right){              //--------------RIGHT----------------
          if(up)    //if moving up
            move(coord_, UP_RIGHT);
          else if(down) //if moving down
            move(coord_, DOWN_RIGHT);
          else   //if moving to the sides
            move(coord_, SIDE_RIGHT);
    }     
   }
   
  //Is Within Bounds
  boolean isValidField(Coord coord) {return (coord.x<=maxright && coord.x>=0 && coord.y<=maxbottom && coord.y>=0)? true:false;}
   
  //Move in any of the six possible directons

  void move(Coord coord_, int move_type){
    switch(move_type){
      case UP_RIGHT:
        coord_.x += (coord_.y%2 == 0)?0:1;
        coord_.y--;
        break;
      case UP_LEFT:
        coord_.x -= (coord_.y%2 == 0)?1:0;
        coord_.y--;
        break;
      case DOWN_LEFT:
        coord_.x -= (coord_.y%2 == 0)?1:0;
        coord_.y++;
        break;
      case DOWN_RIGHT:
        coord_.x += (coord_.y%2 == 0)?0:1;
        coord_.y++;
        break;
      case SIDE_RIGHT:
        coord_.x++;
        break;
      case SIDE_LEFT:
        coord_.x--;
        break;
    }
  }
}
