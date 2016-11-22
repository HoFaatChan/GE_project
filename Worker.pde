class Worker{
  Config config = new Config();
  
  float x;
  float y;
  float previousTime;
  
  char direction;
  
  PImage worker; 
  
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
      x = config.screenWidth - config.workerSize / 2
    }
    
    worker = loadImage(config.workerImage);
    image(worker, x, y, config.workerSize, config.workerSize);
    
    previousTime = gameTime;
  }
  
  void setDirection(char direction) {
    this.direction = direction;
  }
}