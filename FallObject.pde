class FallObject{
  Config config = new Config();
  
  int objectType;
  float createTime;
  float x, y;
  float startX, startY;
  float angle;
  
  PImage objectImage;
  
  FallObject(int objectType, float angle, float gameTime){
    this.objectType = objectType;
    this.angle = angle;
    createTime = gameTime;
    
    startX = 400;
    startY = 40;
    x = startX;
    y = startY;
    angle = 0;
    
    objectImage = loadImage(config.fallObjectImage[objectType]);
  }
  
  void display(float gameTime){
    x = startX + (gameTime - createTime) / 1000 * config.fallObjectSpeed * cos(angle);
    y = startY + (gameTime - createTime) / 1000 * config.fallObjectSpeed * sin(angle);
    
    image(objectImage, x, y);
  }
  
}