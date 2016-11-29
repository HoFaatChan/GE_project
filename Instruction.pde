class Instruction{
  
  private PFont instructionTextFont;
  Boolean mouseOverStartButton;
  
  PImage startButtonImage;
  
  Instruction() {
    instructionTextFont = createFont( "Arial", 32, true);
    
    startButtonImage = loadImage(config.startButtonImage);
    
    mouseOverStartButton = false;
  }
  
  void display(){
    fill(200, 200, 200);
    stroke(0);
    
    rect(50, 50, config.screenWidth - 50 * 2, config.screenHeight - 50 * 2);
    
    fill(0, 50, 180);
    stroke(0);
    text("Instruction" ,config.titleTextX, config.titleTextY);
    
    //Display instruction text here
    textFont(instructionTextFont,24);
    text("1. Player needs to control a construction worker to throw different" , 400, config.titleTextY + 70);
    text("waste into the correct bins. " ,230, config.titleTextY + 100);
    
    text("2. If wrong bin is chosen, the points will be deducted." , 336, config.titleTextY + 150);
    
    text("3. Player also needs to move left and right tododge the steels " , 385, config.titleTextY + 200);
    text("and bricks. " , 150, config.titleTextY + 230);
    
    text("4. If the worker is hit by those things, the points will be deducted." , 400, config.titleTextY + 280);
    
    text("5. Press 'A' and 'D' to move the worker." , 265, config.titleTextY + 330);
    
    createStartButton();
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
  
  void reset(){
    mouseOverStartButton = false;
  }
}