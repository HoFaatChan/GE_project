class Game{
  
   Config config = new Config();
   Worker worker;
   
   Boolean mouseOverIntsuctionButton;
   ArrayList<RecycleBin> recycleBinArray;
   ArrayList<RecycleObject> recycleObjectArray;
   ArrayList<RecycleObject> holdingObjectArray;
   ArrayList<FallObject> fallObjectArray;
   
   int recycleObjectHitCount;
   float lastFallObjectCreateTime;
   
   int score;
   
   PFont gameTextFont;
   
   Game() {
     worker = new Worker();
     
     gameTextFont = createFont( "Arial", 32, true);
     
     mouseOverIntsuctionButton = false;
     
     recycleObjectHitCount = 0;
     lastFallObjectCreateTime = 0;
     score = 0;
     
     fallObjectArray = new ArrayList<FallObject>();
     
     createRecycleBin();
     
     resetRecycleObject();
   }
   
   void run(float gameTime){
     FallObject currentFallObject;
     PImage backgroundImage;
     
     recycleObjectHitCount = 0;
     
     background(255);
     backgroundImage = loadImage(config.backgroundImage);
     float backgroundDisplacementX = 0 - (mouseX / config.screenWidth) * 100;
     image(backgroundImage, backgroundDisplacementX, 0, 900, 900);
     
     displayRecycleBin();
     
     workerControl(gameTime);
     
     recycleObjectControl(gameTime);
     
     
     if(gameTime - lastFallObjectCreateTime > config.fallObjectCreateInterval) {
       lastFallObjectCreateTime = gameTime;
       
       createBrickAndSteel(gameTime);
     }
     
     for(int i=0; i < fallObjectArray.size(); i++) {
       currentFallObject = fallObjectArray.get(i);
       
       currentFallObject.display(gameTime);
     }
     
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
     
     for(int i=0;i<config.recycleObjectImage.length;i++){
       recycleObjectArray.add(new RecycleObject(i));
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
   
   void createBrickAndSteel(float gameTime){
     float angle;
     
     angle = gameTime % 5000 / 5000 * PI;
       
     fallObjectArray.add(new FallObject(0, angle, gameTime));
   }
   
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
         
         if(recycleBin.hitText(targetX, targetY)) {
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
     rect(-1, 0, config.screenWidth + 2, config.gameBarHeight);
     
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
}