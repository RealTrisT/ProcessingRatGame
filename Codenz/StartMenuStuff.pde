class StartMenu{    
  public StartMenu(int scrWidth_, int scrHeight_){
    scrWidth  = scrWidth_;
    scrHeight = scrHeight_;
    startButton = new Button(scrWidth/7, scrHeight/6, (scrWidth/7)*5, (scrHeight/6), "START", color(255,255,255), color(0, 0, 0), color(127, 127, 127));
    bgColor = color(64, 64, 64);
  }
  
  public void firstRender(){
    background(bgColor);
    render(-1, -1);
  }
  
  public void render(int mousex, int mousey){
    startButton.renderme(startButton.isLocMe(mousex, mousey));
  }
  
  public void clicko(int mousex, int mousey){
    if(startButton.isLocMe(mousex, mousey))startPlaying();
  }
  
  Button startButton;
  color bgColor;
  int scrWidth, scrHeight;
}
