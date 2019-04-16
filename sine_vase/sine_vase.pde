float divisions = 300;

void setup(){
  size(1080, 1080);
  background(0);
  frameRate(60);
}

void draw(){
  background(0);
  
  noFill(); stroke(255); strokeWeight(2);
  translate(width/2, height/2);
  beginShape();
  for(int i = 0; i < divisions; i++){
      vertex(sin((frameCount*0.01)+((float)i/divisions)*TWO_PI*30)*((1+sin((frameCount+i)*0.015)/2)*200), (i)+cos((frameCount*0.01)+((float)i/divisions)*TWO_PI*30)*((1+sin((frameCount+i)*0.015)/2)*100) - (divisions/2));
  }
  endShape();
  
  saveFrame("out/frame######.png");
}
