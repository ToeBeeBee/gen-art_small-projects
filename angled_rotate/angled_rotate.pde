float dt = 0;

//float currentLerpTime = 0;
float currentTime = 0;
float oldTime = 0;

Rotator r = new Rotator(250, 1500, true, 0);
Rotator r1 = new Rotator(250, 1500, true, 2);

void setup(){
  background(0,0,0);
  size(1080, 1080);
  currentTime = millis();
}



void draw(){
  background(255,255,255);
  currentTime = millis();
  dt = currentTime - oldTime;
  
  fill(0);
  noStroke();
  rect(0, 0, width, height);
  r.update();
  r.draw();
  r1.update();
  r1.draw();
  
  //float perc = currentLerpTime/1000;
  //perc = sin(perc* PI * 0.5);
  
  //rotate(PI);
  
  
  oldTime = currentTime;
  
  saveFrame();
}
