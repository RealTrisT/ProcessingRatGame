class EndMenu{    
  public EndMenu(int scrWidth_, int scrHeight_){
    scrWidth  = scrWidth_;
    scrHeight = scrHeight_;
    restartButton = new Button(scrWidth/7,  scrHeight/6     , (scrWidth/7)*5, (scrHeight/6), "RESTART", color(255,255,255), color(0, 0, 0), color(127, 127, 127));
    exitButton    = new Button(scrWidth/7, (scrHeight/6) * 3, (scrWidth/7)*5, (scrHeight/6), "EXIT", color(255,255,255), color(0, 0, 0), color(127, 127, 127));
    bgColor = color(64, 64, 64);
  }
  
  public void firstRender(){
    background(bgColor);
    restartButton.renderme(false);
    exitButton.renderme(false);
  }
  
  public void render(int mousex, int mousey){
    restartButton.renderme(restartButton.isLocMe(mousex, mousey));
    exitButton.renderme(exitButton.isLocMe(mousex, mousey));
  }
  
  public void clicko(int mousex, int mousey){
    if(restartButton.isLocMe(mousex, mousey))startPlaying();
    else if(exitButton.isLocMe(mousex, mousey))exit();
  }
  
  boolean Victory;
  Button restartButton, exitButton;
  color bgColor;
  int scrWidth, scrHeight;
}
