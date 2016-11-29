class Worker{
  
  float x;
  float y;
  private float previousTime;
  
  private char direction;
  
  private PImage worker; 
  
  Worker(){
    x = 400;
    y = config.screenHeight - config.workerSize;
    
    direction = 's';
    
    previousTime = 0;
  }
  
  void move(float gameTime){
    if(direction == 'd'){
      x = x + (gameTime - previousTime) / 1000 * config.workerSpeed;
    }else if (direction == 'a'){
      x = x - (gameTime - previousTime) / 1000 * config.workerSpeed;
    }
    
    if(x < 0) {
      x = 0;
    }else if(x > config.screenWidth - config.workerSize / 2) {
      x = config.screenWidth - config.workerSize / 2;
    }
    
    worker = loadImage(config.workerImage);
    image(worker, x, y, config.workerSize, config.workerSize);
    
    previousTime = gameTime;
  }
  //change direction to left or right
  void setDirection(char direction) {
    this.direction = direction;
  }
}