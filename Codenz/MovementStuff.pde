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
  void move(Coord coord_){
    if(left){               //--------------LEFT----------------
          if(up){  //if moving up
            coord_.x -= (coord_.y%2 == 0)?1:0;
            coord_.y--;
          }else if(down){ //if moving down
            coord_.x -= (coord_.y%2 == 0)?1:0;
            coord_.y++;
          }else{  //if moving to the sides
            coord_.x--;
          }
    }else if(right){              //--------------RIGHT----------------
          if(up){    //if moving up
            coord_.x += (coord_.y%2 == 0)?0:1;
            coord_.y--;
          }else if(down){ //if moving down
            coord_.x += (coord_.y%2 == 0)?0:1;
            coord_.y++;
          }else{   //if moving to the sides
            coord_.x++;
          }
    }
  }
  
}
