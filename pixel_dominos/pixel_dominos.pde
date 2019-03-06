



void setup(){
  size(1080, 1080);
  background(0, 0, 0);  
}

void speckledRectangle(PVector p1, PVector p2, boolean inverse){
  float squareHeight = p2.y - p1.y;
  float speckledFactor = map(squareHeight, 0, 100, 0, 1);
  rectMode(CORNERS);
  println(speckledFactor);
  rect(p1.x, p1.y, p2.x, p2.y);
  
  randomSeed((long)speckledFactor);
  for(int y = (int)p1.y; y < p2.y; y++){
    for(int x = (int)p1.x; x < p2.x; x++){
      if(random(0, 0.9) <= speckledFactor){
        set(x, y, color(0, 202, 0));
      }
    }
  }
}

void draw(){
  speckledRectangle(new PVector(100, 100), new PVector(width-100, 200), false);
  

}
