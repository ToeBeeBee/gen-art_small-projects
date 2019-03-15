float SMALL_RAD = 350;
float LARGE_RAD = 850;

float RAD_DIFF = LARGE_RAD-SMALL_RAD;

float circleSize = SMALL_RAD;
float iter = 0;

float[] iterHistory = new float[100];

void setup(){
  background(0,0,0);
  size(1080, 1080);
  //noLoop();
}

void sinCircle(float x, float y, float iter){
  float divs = 200;
  
  float circleMult = (1+sin(PI+HALF_PI+iter))/2;
  circleSize = SMALL_RAD+(RAD_DIFF*circleMult);
  
  
  strokeWeight(10+(20*(circleMult)));
  
  beginShape();
  for(int i = 0; i < divs; i++){
    float offsetSin = (sin((iter*8)+i*0.5)*10)*(1-circleMult);
    float offsetCos = (cos((iter*8)+i*0.5)*10)*(1-circleMult);
    vertex(
    (x+cos((TWO_PI/divs)*i)*(circleSize/2))+offsetCos,
    (y+sin((TWO_PI/divs)*i)*(circleSize/2))+offsetSin);
  }
  endShape(CLOSE);
}

void draw(){
  background(0,0,0);
  

  
  iterHistory[0] = iter;
  for(int i = iterHistory.length-1; i > 0; i--){
    iterHistory[i] = iterHistory[i-1];
  }


  strokeJoin(ROUND);
  for(int i = 0; i < iterHistory.length; i++){
    if(i == 0){
      noFill(); stroke(255, 255, 255, 150);
    } else {
      noFill(); stroke(255, 255, 255, 20*(1-((float) i / (float) iterHistory.length)));
    }
    if(iterHistory[i] != 0){
      sinCircle(width/2, height/2, iterHistory[i]);
    }
  }
  
  println(iterHistory);

  iter += 0.025;
  saveFrame("out/frame######.png");
}
