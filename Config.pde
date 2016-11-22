class Config{
  String backgroundImage = "background  2.jpg";
  String workerImage = "worker (2).png";
  String[] recycleObjectImage = {"bottle3.png", "can3.png", "Newspaper3.png"};
  String[] recycleBinImage = {"brown4.png", "Yellow03.png", "blue4.png"};
  String[] fallObjectImage = {"brick2.png", "steel2 .png"};
  
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
  
  int gameBarHeight = 40;
  
  int workerSize = 100;
  int workerSpeed = 400;
  
  int[][] recycleBinLocation = {{100, 350},{400, 200},{600, 300}};
  int[][] recycleBinSize = {{80, 127},{100, 83},{100, 86}};
  
  int recycleObjectAnimationTime = 1000;
  
  int fallObjectCreateInterval = 500;
  int fallObjectSpeed = 200;
  
  int scoreRecycleBinCorrect = 50;
  int scoreRecycleBinWrong = -50;
}