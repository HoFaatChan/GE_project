class RecycleBin{
  
  int objectType;
  float x;
  float y;
  int recycleBinWidth;
  int recycleBinHeight;
  
  private PImage recycleBin; 
  
  RecycleBin(int objectType){
    this.objectType = objectType;
    x = config.recycleBinLocation[objectType][0];
    y = config.recycleBinLocation[objectType][1];
    
    recycleBinWidth = config.recycleBinSize[objectType][0];
    recycleBinHeight = config.recycleBinSize[objectType][1];
    
    recycleBin = loadImage(config.recycleBinImage[objectType]);
  }
  
  void display() {
    image(recycleBin, x, y, recycleBinWidth, recycleBinHeight);
  }
  
  Boolean hitText(float targetX, float targetY) {
    if(targetX > x && targetX < x + recycleBinWidth) {
      if(targetY > y && targetY < y + recycleBinHeight) {
        return true; 
      }
    }
    
    return false;
  }
}