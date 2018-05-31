class Button{
    public Button(int x_, int y_, int w_, int h_, String text_, color fillColor_, color borderColor_, color fillColor_Hovered_){
      pos = new Coord(x_, y_);
      w = w_; h = h_; bttext = text_;
      fillColor = fillColor_;
      borderColor = borderColor_;
      fillColor_Hovered = fillColor_Hovered_;
    }
    Coord pos;
    int w, h;
    color borderColor;
    color fillColor;
    color fillColor_Hovered;
    String bttext;
    
    void renderme(boolean hovered){
      fill(hovered?fillColor_Hovered:fillColor);
      stroke(borderColor);
      rect(pos.x, pos.y, w, h);
      fill(0, 0, 0);
      textAlign(CENTER);
      text(bttext, pos.x+w/2, pos.y+h/2);
    }
    
    boolean isLocMe(int x, int y){
       return x >= pos.x && x <= pos.x+w && y >= pos.y && y <= pos.y+h;
    }
  }
