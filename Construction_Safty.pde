import ddf.minim.*; 

Minim Mnm;
AudioPlayer mainBGM;
AudioPlayer gameBGM;
AudioPlayer clickSound;

Config config = new Config();

Main main;
Game game;
Instruction instruction;

private float startTime;
private float stopTime;
private float gameTime;

private Boolean gameStart;
private Boolean displayInstruction;
private Boolean isMainBGM;

void setup() {
  size(800, 600);
 
  Mnm = new Minim(this);
  mainBGM = Mnm.loadFile("BGM.wav");
  gameBGM = Mnm.loadFile("gameBGM.wav");
  clickSound = Mnm.loadFile("buttonSound.wav");
 
  main = new Main();
  game = new Game();
  instruction = new Instruction();
 
  startTime = 0;
  stopTime = 0;
   
 
  gameStart = false;
  displayInstruction = false;
  isMainBGM = true;
 
  mainBGM.loop();
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
     
      startTime = startTime + millis() - stopTime;
      
      if(isMainBGM) changeBGM();
      
      clickSound.rewind();
      clickSound.play();
   }
  }else if(!gameStart) {
    if(main.mouseOverStartButton) {
     gameStart = true;
     
     changeBGM();
     
     clickSound.rewind();
     clickSound.play();
    }else if(main.mouseOverIntsuctionButton){
      displayInstruction = true;
      
      clickSound.rewind();
      clickSound.play();
    }
  }else if(gameStart){
    if(game.displayDifficulty) {
      if(game.mouseOverEasyButton){
        game.displayDifficulty = false;
        
        game.gameDifficulty = 0;
        
        startTime = millis();
        
        clickSound.rewind();
        clickSound.play();
      }else if(game.mouseOverHardButton) {
        game.displayDifficulty = false;
        
        game.gameDifficulty = 1;
        
        startTime = millis();
        
        clickSound.rewind();
        clickSound.play();
      }
    }else if(game.checkGameFinish()) {
      game = new Game();
    }else if(game.mouseOverIntsuctionButton) {
      displayInstruction = true;
      
      stopTime = millis();
      
      game.mouseOverIntsuctionButton = false;
      
      clickSound.rewind();
      clickSound.play();
    }else{
      game.checkThrowLocation(mouseX, mouseY, gameTime);
    }
  }
  
}

void changeBGM() {
  mainBGM.close();
  
  gameBGM.loop();
  
  isMainBGM = false;
}