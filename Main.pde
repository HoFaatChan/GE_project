class Main{
  
   private PFont titleFont;
   
   Boolean mouseOverStartButton;
   Boolean mouseOverIntsuctionButton;
   
   private PImage backgroundImage;
   private PImage startButtonImage;
   private PImage instructionButtonImage;
    
  Main(){
    titleFont = createFont( "Arial", 32, true);
    
    mouseOverStartButton = false;
    mouseOverIntsuctionButton = false;
    
    backgroundImage = loadImage(config.mainBackgroundImage);
    startButtonImage = loadImage(config.startButtonImage);
    instructionButtonImage = loadImage(config.instructionButtonImage);
  }
  

  void display(){
    image(backgroundImage, 0, 0);
    
    textFont(titleFont,64); 
    textAlign(CENTER); 
    fill(255, 50, 20);
    stroke(0);
    text("Construction Safty" ,config.titleTextX, config.titleTextY);
    
    createStartButton();
    createInstructionButton();
  }
  
  void createStartButton(){
    if(mouseX > config.startButtonX && mouseX < config.startButtonX + config.startButtonWidth){
      if(mouseY > config.startButtonY && mouseY < config.startButtonY + config.startButtonHeight){
        tint(150);
        image(startButtonImage, config.startButtonX, config.startButtonY, config.startButtonWidth, config.startButtonHeight);
        tint(255);
        
        mouseOverStartButton = true;
      }else {
        image(startButtonImage, config.startButtonX, config.startButtonY, config.startButtonWidth, config.startButtonHeight);
        
        mouseOverStartButton = false;
      }
    } else {
      image(startButtonImage, config.startButtonX, config.startButtonY, config.startButtonWidth, config.startButtonHeight);
      
      mouseOverStartButton = false;
    }
    
  }
  
  void createInstructionButton(){
    if(mouseX > config.instructionButtonX && mouseX < config.instructionButtonX + config.instructionButtonWidth){
      if(mouseY > config.instructionButtonY && mouseY < config.instructionButtonY + config.instructionButtonHeight){
        tint(150);
        image(instructionButtonImage, config.instructionButtonX, config.instructionButtonY, config.instructionButtonWidth, config.instructionButtonHeight);
        tint(255);
        
        mouseOverIntsuctionButton = true;
      }else {
        image(instructionButtonImage, config.instructionButtonX, config.instructionButtonY, config.instructionButtonWidth, config.instructionButtonHeight);
        
        mouseOverIntsuctionButton = false;
      }
    } else {
      image(instructionButtonImage, config.instructionButtonX, config.instructionButtonY, config.instructionButtonWidth, config.instructionButtonHeight);
      
      mouseOverIntsuctionButton = false;
    }
    
  }
}