class Game{
  
   Config config = new Config();
   
   Boolean mouseOverIntsuctionButton;
   
   PFont gameTextFont;
   
   Game() {
     gameTextFont = createFont( "Arial", 32, true);
     
     mouseOverIntsuctionButton = false;
   }
   
   void run(){
     background(255);
     
     
     fill(200, 0, 0);
     ellipse(sin(radians(millis())) * 100 + mouseX, cos(radians(millis())) * 100 + mouseY, 50, 50);
     
     createGameBar();
   }
   
   void createGameBar(){
     fill(200);
     stroke(0);
     rect(-1, 0, config.screenWidth + 2, 50);
     
    if(mouseX > config.gameInstructionButtonX && mouseX < config.gameInstructionButtonX + config.gameInstructionButtonWidth){
      if(mouseY > config.gameInstructionButtonY && mouseY < config.gameInstructionButtonY + config.gameInstructionButtonHeight){
        fill(200);
        rect(config.gameInstructionButtonX, config.gameInstructionButtonY, config.gameInstructionButtonWidth, config.gameInstructionButtonHeight);
        
        mouseOverIntsuctionButton = true;
      }else {
        fill(255);
        rect(config.gameInstructionButtonX, config.gameInstructionButtonY, config.gameInstructionButtonWidth, config.gameInstructionButtonHeight);
        
        mouseOverIntsuctionButton = false;
      }
    } else {
      fill(255);
      rect(config.gameInstructionButtonX, config.gameInstructionButtonY, config.gameInstructionButtonWidth, config.gameInstructionButtonHeight);
      
      mouseOverIntsuctionButton = false;
    }
    
    fill(238, 221, 22);
    textFont(gameTextFont,12);
    
    text("How To Play" ,config.gameInstructionButtonX + config.gameInstructionButtonWidth / 2, config.gameInstructionButtonY + config.gameInstructionButtonHeight * 2 / 3);
   }
}