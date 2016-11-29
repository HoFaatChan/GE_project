class FallObject{
  
  int objectType;
  float x, y;
  private float createTime;
  private float startX, startY;
  private float angle;
  private float speed;
  
  private int objectWidth;
  
  Boolean isHit;
  
  private PImage objectImage;
  
  FallObject(int objectType, float startX, float startY, float angle, float gameTime, float speed){
    this.objectType = objectType;
    this.angle = angle;
    this.speed = speed;
    createTime = gameTime;
    
    this.startX = startX;
    this.startY = startY;
    x = startX;
    y = startY;
    
    objectImage = loadImage(config.fallObjectImage[objectType]);
    
    objectWidth = objectImage.width;
    
    isHit = false;
  }
  
  void display(float gameTime){
    x = startX + (gameTime - createTime) / 1000 * speed * cos(angle);
    y = startY + (gameTime - createTime) / 1000 * speed * sin(angle);
    
    image(objectImage, x, y);
  }
  
}