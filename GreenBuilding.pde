Config config = new Config();

Main main;
Game game;
Instruction instruction;

Boolean gameStart;
Boolean displayInstruction;

void setup() {
 size(800, 600);
 
 main = new Main();
 game = new Game();
 instruction = new Instruction();
 
 gameStart = false;
 displayInstruction = false;
 
}

void draw() {
  if(displayInstruction){
    instruction.display();
  }else if(gameStart) {  
    game.run();
  } else {
    main.display();
  }
  
  
}

void mouseReleased() {
  if(!gameStart) {
    if(main.mouseOverStartButton) {
     gameStart = true; 
    }else if(main.mouseOverIntsuctionButton){
      displayInstruction = true;
    }
  }else {
    if(game.mouseOverIntsuctionButton){
      displayInstruction = true;
    }
  }
  
  if(displayInstruction){
   if(instruction.mouseOverStartButton){
     displayInstruction = false;
     
     gameStart = true;
     
     instruction.reset();
   }
  }
}