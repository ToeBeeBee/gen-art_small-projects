import controlP5.*;

ControlP5 cp5;
boolean ControllerDisplay = true;

float radarRadius = 1050;
float radarOffset = 0;
float radarOffsetInc = 0;
float lineDiv = 16;
float spokes = 1;

void setup(){
  cp5 = new ControlP5(this);
  background(0);
  size(1080, 1920);
  
    cp5.addSlider("spokes")
     .setPosition(100,100)
     .setSize(20,500)
     .setRange(1,100)
     .setNumberOfTickMarks(100)
     ;
     
    cp5.addSlider("lineDiv")
     .setPosition(50,100)
     .setSize(20,500)
     .setRange(1,100)
     .setNumberOfTickMarks(100)
     ;
     
    cp5.addSlider("radarOffsetInc")
     .setPosition(150,100)
     .setSize(20,500)
     .setRange(0,100)
     ;
}

void setupLinePattern(){
  float lineLength = radarRadius/lineDiv;
  float spokeAngle = TWO_PI/spokes;
  
    for(int i = 0; i < lineDiv; i++){
      float r1 = lineLength*i;
      float r2 = (lineLength*i)+lineLength;
      println(r1);
      float currentOffset = i*radarOffset;
        for(int j = 0; j < spokes; j++){
          PVector p1 = new PVector();
          PVector p2 = new PVector();
          p1.x = width/2 + (r1*cos((spokeAngle*j)+currentOffset))-500;
          p1.y = height/2 + (r1*sin((spokeAngle*j)+currentOffset));
          p2.x = width/2 + (r2*cos((spokeAngle*j)+currentOffset))-500;
          p2.y = height/2 + (r2*sin((spokeAngle*j)+currentOffset));
          //listList.add(new GlowLine());
          line(p1.x, p1.y, p2.x, p2.y);
        }
    }
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
}

void draw(){
  background(0);
  
  ellipseMode(RADIUS);
  fill(255, 255, 255, 50);
  noStroke();
  //ellipse(width/2, height/2, radarRadius, radarRadius);
  noFill(); stroke(255,255,255);
  strokeWeight(2);
  radarOffset += radarOffsetInc/10000;
  setupLinePattern();
  
  if(!ControllerDisplay){
    saveFrame("story/f######.png");
  }
}
