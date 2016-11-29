class Game{
  
   private Worker worker;
   
   Boolean mouseOverIntsuctionButton;
   Boolean mouseOverEasyButton;
   Boolean mouseOverHardButton;
   Boolean displayDifficulty;
   
   private ArrayList<RecycleBin> recycleBinArray;
   private ArrayList<RecycleObject> recycleObjectArray;
   private ArrayList<RecycleObject> holdingObjectArray;
   private ArrayList<FallObject> fallObjectArray;
   
   private float lastFallObjectCreateTime;
   
   private int score;
   
   int gameDifficulty;
   
   private PFont gameTextFont;
   private PImage backgroundImage;
   private PImage gameBarImage;
   
   Game() {
     worker = new Worker();
     
     gameTextFont = createFont( "Arial", 32, true);
     
     mouseOverIntsuctionButton = false;
     mouseOverEasyButton = false;
     mouseOverHardButton = false;
     displayDifficulty = true;
     
     gameDifficulty = 0;
     lastFallObjectCreateTime = 0;
     score = 0;
     
     backgroundImage = loadImage(config.gameBackgroundImage);
     gameBarImage = loadImage(config.gameBarImage);
     fallObjectArray = new ArrayList<FallObject>();
     
     createRecycleBin();
     
     resetRecycleObject();
   }
   
   void run(float gameTime){
     
     if(displayDifficulty) {
       image(backgroundImage, 0, config.gameBarHeight, 800, 630);
       
       createGameBar();
       
       createLevelButton();
       
       return;
     }else if(checkGameFinish()) {
       createGameBar();
       
       displayGameFinishMessage();
       
       return;
     }
     image(backgroundImage, 0, config.gameBarHeight, 800, 630);
     
     displayRecycleBin();
     
     workerControl(gameTime);
     
     recycleObjectControl(gameTime);
     
     fallObjectControl(gameTime);
     
     clearFinishedObject();
     
     createGameBar();
   }
   
   
   void createRecycleBin() {
     recycleBinArray = new ArrayList<RecycleBin>();
     
     for(int i=0;i<config.recycleBinImage.length;i++){
       recycleBinArray.add(new RecycleBin(i));
     }
   }
   
   void displayRecycleBin() {
     RecycleBin recycleBin;
     
     for(int i=0;i<recycleBinArray.size();i++){
       recycleBin = recycleBinArray.get(i);
       
       recycleBin.display();
     }
   }
   
   void workerControl(float gameTime) {
     if(keyPressed) {
       if (key == 'a' || key == 'A') {
         worker.setDirection('a');
       } else if(key == 'd' || key == 'D') {
         worker.setDirection('d');
       }
     } else {
       worker.setDirection('s');
     }
     
     worker.move(gameTime);
   }
   
   void resetRecycleObject(){
     recycleObjectArray = new ArrayList<RecycleObject>();
     holdingObjectArray = new ArrayList<RecycleObject>();
     
     for(int i=0;i<config.recycleObjectImage.length / 2;i++){
       recycleObjectArray.add(new RecycleObject(floor(random(6))));
     }
   }
   
   void recycleObjectControl(float gameTime) {
     RecycleObject currentObject;
     
     if(recycleObjectArray.size() == 0 && holdingObjectArray.size() == 0) resetRecycleObject();
     
     for(int i=0; i < recycleObjectArray.size(); i++) {
       currentObject = recycleObjectArray.get(i);
       
       if(!currentObject.isHit) {
         if(currentObject.hitTest(worker.x)){
           holdingObjectArray.add(currentObject);
           
           recycleObjectArray.remove(i);
           
           i--;
         }
       }
       
       currentObject.display(worker.x, i, gameTime);
     }
     
     for(int i=0; i < holdingObjectArray.size(); i++) {
       currentObject = holdingObjectArray.get(i);
       
       currentObject.display(worker.x, i, gameTime);
     }
   }
   
   void fallObjectControl(float gameTime) {
     FallObject currentFallObject;
     
     if(gameTime - lastFallObjectCreateTime > config.fallObjectCreateInterval[gameDifficulty]) {
       lastFallObjectCreateTime = gameTime;
       
       createBrickAndSteel(gameTime);
     }
     
     for(int i=0; i < fallObjectArray.size(); i++) {
       currentFallObject = fallObjectArray.get(i);
       
       currentFallObject.display(gameTime);
     }
     
     checkWorkerHitFallObject();
   }
   
   void createBrickAndSteel(float gameTime){
     int ObjectType;
     float startX;
     float startY;
     
     if(gameDifficulty == 0) {
       ObjectType = floor(random(2));
       
       startX = random(config.screenWidth);
       startY = 0;
       
       fallObjectArray.add(new FallObject(ObjectType, startX, startY, PI / 2, gameTime, config.fallObjectSpeed[gameDifficulty]));
     }else if(gameDifficulty == 1) {
       ObjectType = floor(random(2));
       
       startX = random(config.screenWidth);
       startY = config.gameBarHeight;
       
       fallObjectArray.add(new FallObject(ObjectType, startX, startY, PI / 2, gameTime, config.fallObjectSpeed[gameDifficulty]));
     }
     //float angle;
     
     //angle = gameTime % 5000 / 5000 * PI;
       
     //fallObjectArray.add(new FallObject(0, angle, gameTime));
   }
   
   void checkWorkerHitFallObject() {
     FallObject currentFallObject;
     
     for(int i=0; i < fallObjectArray.size(); i++) {
       currentFallObject = fallObjectArray.get(i);
       
       if(currentFallObject.y < config.screenHeight - config.workerSize) continue;
       if(currentFallObject.isHit == true) continue;
       
       if(currentFallObject.y < config.screenHeight) {
         if(currentFallObject.x + currentFallObject.objectWidth / 2 > worker.x && currentFallObject.x + currentFallObject.objectWidth / 2 < worker.x + config.workerSize) {
           score += config.scoreHitFallObject;
           
           currentFallObject.isHit = true;
         }else if(worker.x + config.workerSize / 2 > currentFallObject.x && worker.x + config.workerSize / 2 < currentFallObject.x + currentFallObject.objectWidth){
           score += config.scoreHitFallObject;
           
           currentFallObject.isHit = true;
         }
       }
     }
   }
   //clear finish recyele object and fallobject that is outside the screen
   void clearFinishedObject(){
     RecycleObject currentObject;
     FallObject currentFallObjecct;
     
     for(int i=0; i < recycleObjectArray.size(); i++) {
       currentObject = recycleObjectArray.get(i);
       
       if(currentObject.isAnimationFinish) recycleObjectArray.remove(i);
     }
     
     for(int i=0; i < fallObjectArray.size(); i++) {
       currentFallObjecct = fallObjectArray.get(i);
       
       if(currentFallObjecct.x < 0 || currentFallObjecct.x > config.screenWidth + 100) {
         if(currentFallObjecct.y < 0 || currentFallObjecct.y > config.screenWidth + 100) {
           fallObjectArray.remove(i);
           
           i--;
         }
       }
       
     }
   }
   //handle mouse released event
   void checkThrowLocation(float targetX, float targetY, float gameTime){
     RecycleObject currentObject;
     RecycleBin recycleBin;
     
     if(holdingObjectArray.size() > 0) {
       currentObject = holdingObjectArray.get(0);
       
       currentObject.setThrowAnimation(targetX, targetY, gameTime);
     
       holdingObjectArray.remove(0);
       
       recycleObjectArray.add(currentObject);
       
       for(int i=0; i<recycleBinArray.size(); i++) {
         recycleBin = recycleBinArray.get(i);
         
         if(recycleBin.hitTest(targetX, targetY)) {
           if(currentObject.objectType == recycleBin.objectType) {
             score += config.scoreRecycleBinCorrect; 
           }else {
             score += config.scoreRecycleBinWrong;
           }
         }
       }
     }
   }
   
   void createGameBar(){
     fill(200);
     stroke(0);
     image(gameBarImage, 0, 0);
     
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
    
    fill(0);
    stroke(0);
    textFont(gameTextFont,18);
    text("Score :", config.scoreTextX, config.scoreTextY);
    float wordWidth = textWidth("Score :" + score);
    text(score, config.scoreTextX + wordWidth + 5, config.scoreTextY);
   }
   
   void createLevelButton() {
     stroke(0);
     if(mouseX > config.easyButtonX && mouseX < config.easyButtonX + config.easyButtonWidth){
       if(mouseY > config.easyButtonY && mouseY < config.easyButtonY + config.easyButtonHeight){
         fill(200);
         rect(config.easyButtonX, config.easyButtonY, config.easyButtonWidth, config.easyButtonHeight, 4);
         
         mouseOverEasyButton = true;
       }else {
         fill(255);
         rect(config.easyButtonX, config.easyButtonY, config.easyButtonWidth, config.easyButtonHeight, 4);
        
         mouseOverEasyButton = false;
       }
    }else {
      fill(255);
      rect(config.easyButtonX, config.easyButtonY, config.easyButtonWidth, config.easyButtonHeight, 4);
      
      mouseOverEasyButton = false;
    }
     
    if(mouseX > config.hardButtonX && mouseX < config.hardButtonX + config.hardButtonWidth){
      if(mouseY > config.hardButtonY && mouseY < config.hardButtonY + config.hardButtonHeight){
        fill(200);
        rect(config.hardButtonX, config.hardButtonY, config.hardButtonWidth, config.hardButtonHeight, 4);
        
        mouseOverHardButton = true;
      }else {
        fill(255);
        rect(config.hardButtonX, config.hardButtonY, config.hardButtonWidth, config.hardButtonHeight, 4);
        
        mouseOverHardButton = false;
      }
    }else {
      fill(255);
      rect(config.hardButtonX, config.hardButtonY, config.hardButtonWidth, config.hardButtonHeight, 4);
      
      mouseOverHardButton = false;
    }
    
    fill(255, 25, 125);
    stroke(0);
    textFont(gameTextFont,60);
    text("Select  difficulty", config.screenWidth / 2, 150);
    
    fill(0);
    stroke(0);
    textFont(gameTextFont,24);
    text("EASY", config.easyButtonX + config.easyButtonWidth / 2, config.easyButtonY + config.hardButtonHeight / 2 + 10);
    text("HARD", config.hardButtonX + config.hardButtonWidth / 2, config.hardButtonY + config.hardButtonHeight / 2 + 10);
   }
   
   Boolean checkGameFinish() {
     if(score < config.gameOverScore) return true;
     if(score > config.gameCompleteScore) return true;
     
     return false;
   }
   
   void displayGameFinishMessage() {
     PImage gameFinishImage;
     
     if(score < config.gameOverScore){
       gameFinishImage = loadImage(config.gameOverImage);
       
       image(gameFinishImage, 0, 0, config.screenWidth, config.screenHeight);
     }else if(score >= config.gameCompleteScore){
       gameFinishImage = loadImage(config.gameCompleteImage);
       
       image(gameFinishImage, 0, 0, config.screenWidth, config.screenHeight);
     }
     
     fill(0);
     stroke(0);
     textFont(gameTextFont,36);
     text("Click to restart!", config.screenWidth / 2, 500);
   }
}