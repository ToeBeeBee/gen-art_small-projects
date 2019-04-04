import processing.pdf.*;
import controlP5.*;


ControlP5 cp5;
boolean ControllerDisplay = true;
boolean recording = false;

float AMPLITUDE = 100;
float FREQUENCY = 0.01;
float trailAmt = 20;
float trailOffset = 5;


void setup(){
  cp5 = new ControlP5(this);
  background(0);
  size(700, 700);
  
    cp5.addSlider("AMPLITUDE")
     .setPosition(100,100)
     .setSize(20,500)
     .setRange(1,1000)
     ;
     
    cp5.addSlider("FREQUENCY")
     .setPosition(50,100)
     .setSize(20,500)
     .setRange(1,45)
     ;
     
    cp5.addSlider("trailOffset")
     .setPosition(150,100)
     .setSize(20,500)
     .setRange(0, 50);
     ;
     
    cp5.addSlider("trailAmt")
     .setPosition(200,100)
     .setSize(20,500)
     .setRange(5,100)
     ;
}


void keyPressed(){
  if(key == ' '){
    ControllerDisplay = !ControllerDisplay;
    if(ControllerDisplay){
      cp5.show();
    } else if(!ControllerDisplay){
     cp5.hide();
    }
  }
  if(key == 'r'){
    recording = !recording;
  }
  if(key == 'f'){
    beginRecord(PDF, "PDF/sin_stripes.pdf");
  }
}


void drawSine(PVector p1, PVector p2, float res, float amp, float freq, float phase){

  beginShape();
    for(int i = 0; i < res; i++){
      PVector currentPoint = PVector.lerp(p1, p2, (float)i/res);
      currentPoint.x += sin((i+phase)*freq)*amp;
      vertex(currentPoint.x, currentPoint.y);
    }
  endShape();
  
}

void draw(){
  background(0);
  
  for(int i = 0; i < trailAmt; i++){
    stroke(255, 255, 255, 255*(1-((float)i/(float)trailAmt))); noFill();
    strokeWeight(1);
    
    drawSine(new PVector(width/2, 100), new PVector(width/2, height-100), 50, AMPLITUDE, FREQUENCY/100, (frameCount*1/FREQUENCY)+(i*trailOffset));
  }
  
  endRecord();
  if(recording){
    saveFrame("frames/f######.png");
  }
  

}
