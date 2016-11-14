class Worker{
  Config config = new Config();
  
  float x;
  float y;
  float previousTime;
  
  PImage worker; 
  
  Worker(){
    x = 400;
    y = config.screenHeight - config.workerSize;
    
    previousTime = 0;
  }
  
  void move(float gameTime){
    if(previousTime != 0){
      if(mouseX - config.workerSize / 2 > x){
        x = x + (gameTime - previousTime) / 1000 * config.workerSpeed;
        
        if(x > mouseX - config.workerSize / 2) x = mouseX - config.workerSize / 2;
      }else if (mouseX - config.workerSize / 2 < x){
        x = x - (gameTime - previousTime) / 1000 * config.workerSpeed;
        
        if(x < mouseX - config.workerSize / 2) x = mouseX - config.workerSize / 2;
      }
    }
    
    worker = loadImage(config.workerImage);
    image(worker, x, y, config.workerSize, config.workerSize);
    
    previousTime = gameTime;
  }
}