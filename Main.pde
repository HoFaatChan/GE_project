class Main{
  
   PFont titleFont;
   
   Boolean mouseOverStartButton;
   Boolean mouseOverIntsuctionButton;
   
   Config config = new Config();
    
  Main(){
    titleFont = createFont( "Arial", 32, true);
    
    mouseOverStartButton = false;
    mouseOverIntsuctionButton = false;
    
  }
  

  void display(){
    background(225);
    
    textFont(titleFont,64); 
    textAlign(CENTER); 
    fill(0, 255, 100);
    stroke(0);
    text("Construction Safty" ,config.titleTextX, config.titleTextY);
    
    createStartButton();
    createInstructionButton();
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
    textFont(titleFont,32);
    
    text("Game Start" ,config.startButtonX + config.startButtonWidth / 2, config.startButtonY + config.startButtonHeight * 2 / 3);
    
  }
  
  void createInstructionButton(){
    if(mouseX > config.instructionButtonX && mouseX < config.instructionButtonX + config.instructionButtonWidth){
      if(mouseY > config.instructionButtonY && mouseY < config.instructionButtonY + config.instructionButtonHeight){
        fill(200);
        rect(config.instructionButtonX, config.instructionButtonY, config.instructionButtonWidth, config.instructionButtonHeight);
        
        mouseOverIntsuctionButton = true;
      }else {
        fill(255);
        rect(config.instructionButtonX, config.instructionButtonY, config.instructionButtonWidth, config.instructionButtonHeight);
        
        mouseOverIntsuctionButton = false;
      }
    } else {
      fill(255);
      rect(config.instructionButtonX, config.instructionButtonY, config.instructionButtonWidth, config.instructionButtonHeight);
      
      mouseOverIntsuctionButton = false;
    }
    
    fill(238, 221, 22);
    textFont(titleFont,24);
    
    text("How To Play" ,config.instructionButtonX + config.instructionButtonWidth / 2, config.instructionButtonY + config.instructionButtonHeight * 2 / 3);
  }
}