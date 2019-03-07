class domino {

  PVector pos;
  float delayTillStart;
  float w;
  float h;
  
  boolean playing = false;
  boolean black = false;
  
  float tip = 0;
  PVector p1;
  PVector p2;
  
  domino(float x, float y, float delay, float w, float h){
    this.pos = new PVector(x, y);
    this.delayTillStart = delay;
    this.w = w;
    this.h = h;
  }
  
  void speckledRectangle(PVector p1, PVector p2, boolean inverse){ 
  float squareHeight = p2.y - p1.y;
  float speckledFactor = map(squareHeight, 0, h, 0, 1);
  rectMode(CORNERS);
  println(speckledFactor);
  
  noStroke(); 
  if(!inverse){fill(0, 0, 0);} else {fill(255, 255, 255);}
  rect(p1.x, p1.y, p2.x, p2.y);
  
  strokeWeight(1);
  noFill();
  
  randomSeed((long)(speckledFactor*pos.y));
  for(int y = (int)p1.y; y < p2.y; y++){
    for(int x = (int)p1.x; x < p2.x; x++){
      if(random(0, 1) <= speckledFactor){
        if(inverse){stroke(0, 0, 0);}else{stroke(255, 255, 255);}
        point(x, y);
      }
      }
    }
  }
  
  void update(){
    if(tip >= 0 && playing){
      tip+= 0.03;
    }
    if(tip >= HALF_PI && playing){
      black = !black;
      tip = 0;
    }
    
    p1 = new PVector(0,0);
    p1.sub(w/2, 0);
    p1.add(pos);
    
    p2 = new PVector(0,0);
    p2.add(w/2, h*sin(tip));
    p2.add(pos);
    

  }
  
  void draw(){
    update();
    
    if(frameCount > delayTillStart){
      playing = true;
    }
    
    speckledRectangle(
    new PVector(p1.x, p1.y),
    new PVector(p2.x, p2.y),
    black);
  }

}
