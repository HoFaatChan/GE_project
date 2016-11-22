Config config = new Config();

Main main;
Game game;
Instruction instruction;

float startTime;
float stopTime;
float gameTime;

Boolean gameStart;
Boolean displayInstruction;

void setup() {
  size(800, 600);
 
  main = new Main();
  game = new Game();
  instruction = new Instruction();
 
  startTime = 0;
  stopTime = 0;
   
 
  gameStart = false;
  displayInstruction = false;
 
}

void draw() {
  gameTime = millis() - startTime; 
  
  if(displayInstruction){
    instruction.display();
  }else if(gameStart) {  
    game.run(gameTime);
  } else {
    main.display();
  }
  
  
}

void mouseReleased() {
  gameTime = millis() - startTime;
  
  if(displayInstruction){
    if(instruction.mouseOverStartButton){
      displayInstruction = false;
     
      gameStart = true;
     
      instruction.reset();
     
      if(startTime == 0) {
        startTime = millis();
      }else {
        startTime = startTime + millis() - stopTime;
      }
   }
  }else if(!gameStart) {
    if(main.mouseOverStartButton) {
     gameStart = true; 
     
     startTime = millis();
    }else if(main.mouseOverIntsuctionButton){
      displayInstruction = true;
    }
  }else if(gameStart){
    if(game.mouseOverIntsuctionButton){
      displayInstruction = true;
      
      stopTime = millis();
      
      game.mouseOverIntsuctionButton = false;
    }else{
      game.checkThrowLocation(mouseX, mouseY, gameTime);
    }
  }
  
  
}