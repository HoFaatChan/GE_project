class RecycleObject{
  
  int objectType;
  float x;
  float y;
  float currentWidth;
  float currentHeight;
  
  private float startX;
  private float startY;
  private float targetX;
  private float targetY;
  private float parabolaAngle;
  private float startAnimationTime;
  
  Boolean isHit;
  Boolean isAnimationFinish;
  
  private PImage objectImage;
  
  RecycleObject(int objectTypeNumber){
    this.objectType = objectTypeNumber % 3;
    x = 50 + random(650);
    y = 500;
    
    startAnimationTime = 0;
    
    isHit = false;
    isAnimationFinish = false;
    
    objectImage = loadImage(config.recycleObjectImage[objectTypeNumber]);
    currentWidth = objectImage.width;
    currentHeight = objectImage.height;
  }
  
  void display(float workerX,int hitCount, float gameTime){
    if(startAnimationTime != 0){
      if(gameTime - startAnimationTime >= config.recycleObjectAnimationTime + 200) {      
        isAnimationFinish = true;
      }else {
        x = startX + (targetX - startX) * (gameTime - startAnimationTime) / (config.recycleObjectAnimationTime + 200);
        y = startY - (startY - config.gameBarHeight) * sin(parabolaAngle * (gameTime - startAnimationTime) / config.recycleObjectAnimationTime) ;
      }
    }else if(isHit) {
      x = workerX + config.workerSize * 3 / 4 + hitCount * 70;
      y = config.screenHeight - config.workerSize / 2 - currentHeight / 2;
    }
    
    image(objectImage, x, y, currentWidth, currentHeight);
  }
  //check if the object collide with worker
  Boolean hitTest(float workerX){
    if(startAnimationTime != 0) return false;
    
   if(x > workerX - config.workerSize / 2 && x < workerX + config.workerSize / 2){
      isHit = true;
      
      currentWidth = currentWidth / 2;
      currentHeight = currentHeight / 2;
      
      return true;
   }
   
   return false;
  }
  //set start and end point of throw animation
  void setThrowAnimation(float mouseTargetX, float mouseTargetY, float gameTime){
    startX = x;
    startY = y;
    this.targetX = mouseTargetX - currentWidth / 2;
    this.targetY = mouseTargetY + currentHeight / 2;
    
    if(targetY > config.screenHeight - config.workerSize) targetY = config.screenHeight - config.workerSize - currentHeight;
    
    parabolaAngle = asin((targetY - config.gameBarHeight) / (startY - config.gameBarHeight)) + PI / 2;
    
    isHit = false;
    
    startAnimationTime = gameTime;
  }
}