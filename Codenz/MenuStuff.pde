class MainMenu{
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
    
  public MainMenu(int scrWidth_, int scrHeight_){
    scrWidth  = scrWidth_;
    scrHeight = scrHeight_;
    startButton = new Button(scrWidth/7, scrHeight/6, (scrWidth/7)*5, (scrHeight/6), "START", color(255,255,255), color(0, 0, 0), color(127, 127, 127));
    bgColor = color(64, 64, 64);
  }
  
  public void firstRender(){
    background(bgColor);
    startButton.renderme(false);
  }
  
  public void render(int mousex, int mousey){
    startButton.renderme(startButton.isLocMe(mousex, mousey));
  }
  
  Button startButton;
  color bgColor;
  int scrWidth, scrHeight;
}
