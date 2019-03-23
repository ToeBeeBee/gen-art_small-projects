class wobbler {

PVector pos = new PVector();

float startIter;
float iter;

float minSize = 20;
float maxSize = 340;

  wobbler(float x, float y, float startIter){
    pos.x = x;
    pos.y = y;
    
    this.startIter = startIter;
    this.iter = startIter*-0.045;
  }

  void update(){
    iter += 0.04;
  }
  
  void draw(){
    update();
    println((float)startIter);
    strokeWeight(1.5);
    noFill(); stroke(255,255,255, lerp(0, 255, 1-(float)startIter/110.0));
    //fill(255,255,255, 10); noStroke();
    ellipseMode(CENTER);
    ellipse(pos.x, pos.y, minSize+((maxSize-minSize)*((1+sin(iter))/2)), minSize+((maxSize-minSize)*((1+cos(iter))/2)));
  }
}
