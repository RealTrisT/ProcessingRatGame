class StartMenu{    
  public StartMenu(int scrWidth_, int scrHeight_){
    scrWidth  = scrWidth_;
    scrHeight = scrHeight_;
    startButton = new Button(scrWidth/7, 4*(scrHeight/6), (scrWidth/7)*5, (scrHeight/6), "START", color(255,255,255), color(0, 0, 0), color(127, 127, 127));
    bgColor = color(64, 64, 64);
  }
  
  public void firstRender(){
    background(bgColor);
    render(-1, -1);
  }
  
  public void render(int mousex, int mousey){
    startButton.renderme(startButton.isLocMe(mousex, mousey));
    
    fill(255, 153, 0); 
    textSize(30);
    text("TRAP THE MOUSE",scrWidth/2,(scrHeight/10)*2);
    textSize(13);
    text("© 2018 All Rights Reserved",scrWidth/2,(scrHeight/10)*3);
    textSize(12);
  }
  
  public void clicko(int mousex, int mousey){
    if(startButton.isLocMe(mousex, mousey))startPlaying();
  }
  
  Button startButton;
  color bgColor;
  int scrWidth, scrHeight;
}
