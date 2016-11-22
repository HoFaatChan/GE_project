class RecycleObject{
  Config config = new Config();
  
  int objectType;
  float x;
  float y;
  float currentWidth;
  float currentHeight;
  
  float startX;
  float startY;
  float targetX;
  float targetY;
  float parabolaAngle;
  float startAnimationTime;
  
  Boolean isHit;
  Boolean isAnimationFinish;
  
  PImage objectImage;
  
  RecycleObject(int objectType){
    this.objectType = objectType;
    x = 50 + random(650);
    y = 500;
    
    startAnimationTime = 0;
    
    isHit = false;
    isAnimationFinish = false;
    
    objectImage = loadImage(config.recycleObjectImage[objectType]);
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
      x = workerX + config.workerSize * 3 / 4 + hitCount * 50;
      y = config.screenHeight - config.workerSize / 2 - currentHeight / 2;
    }
    
    image(objectImage, x, y, currentWidth, currentHeight);
  }
  
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
  
  void setThrowAnimation(float targetX, float targetY, float gameTime){
    startX = x;
    startY = y;
    this.targetX = targetX - currentWidth / 2;
    this.targetY = targetY + currentHeight / 2;
    
    if(targetY > config.screenHeight - config.workerSize) targetY = config.screenHeight - config.workerSize - currentHeight;
    
    parabolaAngle = asin((targetY - config.gameBarHeight) / (startY - config.gameBarHeight)) + PI / 2;
    
    isHit = false;
    
    startAnimationTime = gameTime;
  }
}