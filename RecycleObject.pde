class RecycleObject{
  Config config = new Config();
  
  int objectType;
  float x;
  float y;
  float currentWidth;
  float currentheight;
  
  float startX;
  float startY;
  float targetX;
  float targetY;
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
    currentheight = objectImage.height;
  }
  
  void display(float workerX,int hitCount, float gameTime){
    if(startAnimationTime != 0){
      if(gameTime - startAnimationTime >= config.recycleObjectAnimationTime) {
        x = targetX;
        y = targetY;
        
        isAnimationFinish = true;
      }else {
        x = startX + (targetX - startX) * (gameTime - startAnimationTime) / config.recycleObjectAnimationTime;
        y = startY + (targetY - startY) * (gameTime - startAnimationTime) / config.recycleObjectAnimationTime;
      }
    }else if(isHit) {
      x = workerX + config.workerSize * 3 / 4 + hitCount * 50;
      y = 525;
    }
    
    image(objectImage, x, y, currentWidth, currentheight);
  }
  
  Boolean hitTest(float workerX){
    if(startAnimationTime != 0) return false;
    
   if(x > workerX - config.workerSize / 2 && x < workerX + config.workerSize / 2){
      isHit = true;
      
      currentWidth = currentWidth / 2;
      currentheight = currentheight / 2;
      
      return true;
   }
   
   return false;
  }
  
  void setThrowAnimation(float targetX, float targetY, float gameTime){
    startX = x;
    startY = y;
    this.targetX = targetX;
    this.targetY = targetY;
    
    isHit = false;
    
    startAnimationTime = gameTime;
  }
}