class Instruction{
  Config config = new Config();
  
  PFont instructionTextFont;
  Boolean mouseOverStartButton;
  
  Instruction() {
    instructionTextFont = createFont( "Arial", 32, true);
    
    mouseOverStartButton = false;
  }
  
  void display(){
    fill(200, 200, 200, 50);
    stroke(0);
    
    rect(50, 50, config.screenWidth - 50 * 2, config.screenHeight - 50 * 2);
    
    fill(0, 255, 100);
    stroke(0);
    text("Instruction" ,config.titleTextX, config.titleTextY);
    
    //Display instruction text here
    textFont(instructionTextFont,24);
    text("text of game instruction" ,config.titleTextX, config.titleTextY + 100);
    
    
    createStartButton();
  }
  
  void createStartButton(){
    if(mouseX > config.startButtonX && mouseX < config.startButtonX + config.startButtonWidth){
      if(mouseY > config.startButtonY && mouseY < config.startButtonY + config.startButtonHeight){
        fill(200);
        rect(config.startButtonX, config.startButtonY, config.startButtonWidth, config.startButtonHeight);
        
        mouseOverStartButton = true;
      }else {
        fill(255);
        rect(config.startButtonX, config.startButtonY, config.startButtonWidth, config.startButtonHeight);
        
        mouseOverStartButton = false;
      }
    } else {
      fill(255);
      rect(config.startButtonX, config.startButtonY, config.startButtonWidth, config.startButtonHeight);
      
      mouseOverStartButton = false;
    }
    
    
    fill(66, 204, 255);
    textFont(instructionTextFont,32);
    
    text("Game Start" ,config.startButtonX + config.startButtonWidth / 2, config.startButtonY + config.startButtonHeight * 2 / 3);
    
  }
  
  void reset(){
    mouseOverStartButton = false;
  }
}