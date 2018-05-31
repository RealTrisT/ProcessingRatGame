class EndMenu{    
  public EndMenu(int scrWidth_, int scrHeight_){
    scrWidth  = scrWidth_;
    scrHeight = scrHeight_;
    restartButton = new Button(scrWidth/7,  (scrHeight/6) * 2    , (scrWidth/7)*5, (scrHeight/6), "RESTART", color(255,255,255), color(0, 0, 0), color(127, 127, 127));
    exitButton    = new Button(scrWidth/7, (scrHeight/6) * 4, (scrWidth/7)*5, (scrHeight/6), "EXIT", color(255,255,255), color(0, 0, 0), color(127, 127, 127));
    bgColor = color(64, 64, 64);
  }
  
  public void render(int mousex, int mousey){
    background(bgColor);
    restartButton.renderme(restartButton.isLocMe(mousex, mousey));
    exitButton.renderme(exitButton.isLocMe(mousex, mousey));
    
    textSize(30);
    if(npc.isWinner()){fill(0, 102, 0); text("YOU WON",scrWidth/2,(scrHeight/6));}
    else{fill(200, 0, 0);text("YOU LOST",scrWidth/2,(scrHeight/15)*2);textSize(20);text("You are bad",scrWidth/2,(scrHeight/15)*3);}
    textSize(12);
      
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
