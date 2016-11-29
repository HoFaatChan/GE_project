class Config{
  String mainBackgroundImage = "StartBG.jpg";
  String gameBackgroundImage = "backgroundmain .jpg";
  String gameBarImage = "backgroundtopbar.jpg";
  String workerImage = "yyy.png";
  String[] recycleObjectImage = {"bottle3.png", "can3.png", "Newspaper3.png", "for brown.png", "For yellow.png", "For blue.png"};
  String[] recycleBinImage = {"brown4.png", "Yellow03.png", "blue4.png"};
  String[] fallObjectImage = {"brick2.png", "steel2 .png"};
  String gameOverImage = "Game_over.png";
  String gameCompleteImage = "mission-complete.jpg";
  String startButtonImage = "Game start  1.png";
  String instructionButtonImage = "how to play.png";
  
  float screenWidth = 800;
  float screenHeight = 600;
  
  int titleTextX = 400;
  int titleTextY = 100;
  int scoreTextX = 100;
  int scoreTextY = 25;
  
  int startButtonX = 300;
  int startButtonY = 450;
  int startButtonWidth = 200;
  int startButtonHeight = 50;
  
  int instructionButtonX = 300;
  int instructionButtonY = 520;
  int instructionButtonWidth = 200;
  int instructionButtonHeight = 50;
  
  int gameInstructionButtonX = 700;
  int gameInstructionButtonY = 10;
  int gameInstructionButtonWidth = 80;
  int gameInstructionButtonHeight = 20;
  
  int easyButtonX = 300;
  int easyButtonY = 250;
  int easyButtonWidth = 200;
  int easyButtonHeight = 50;
  
  int hardButtonX = 300;
  int hardButtonY = 400;
  int hardButtonWidth = 200;
  int hardButtonHeight = 50;
  
  int gameBarHeight = 40;
  
  int workerSize = 100;
  int workerSpeed = 400;
  
  int[][] recycleBinLocation = {{100, 350},{400, 200},{600, 300}};//{{x,y}, ...}
  int[][] recycleBinSize = {{92, 148},{100, 83},{100, 86}};//{{width,height}, ...}
  
  int recycleObjectAnimationTime = 1000;
  
  int[] fallObjectCreateInterval = {900, 500};
  float[] fallObjectSpeed = {200, 400};
  
  int scoreRecycleBinCorrect = 50;
  int scoreRecycleBinWrong = -100;
  int scoreHitFallObject = -10;
  
  int gameOverScore = -100;
  int gameCompleteScore = 1000;
}