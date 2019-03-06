PVector pointOne = new PVector(200, 850);
PVector pointTwo;
PVector pointPos;
PVector oldPointPos;

float iter = 0;

PVector[] lineArray = new PVector[280];

void setup(){
  size(1080, 1080);
  background(0, 0, 0);
  
  pointTwo = new PVector(width-200, 700);
  
  pointPos = PVector.sub(pointTwo, pointOne);
  
}

void drawSpeckleLine(PVector pos, float l, float angle, float speckledFactor){
  noFill();
  stroke(0, 0, 100);
  strokeWeight(20);
  strokeCap(ROUND);
  line(pos.x, pos.y-(l/2), pos.x, pos.y+(l/2));
  
  PVector pos1 = new PVector(pos.x-10, pos.y-(l/2)-10);
  PVector pos2 = new PVector(pos.x+10, pos.y+(l/2)+10);
  
  randomSeed((long)speckledFactor);
  for(int y = (int)pos1.y; y < pos2.y; y++){
    for(int x = (int)pos1.x; x < pos2.x; x++){
      if(random(0, 0.9) <= speckledFactor){
        set(x, y, color(0, 0, 0));
      }
    }
  }
}

void draw(){
  background(0);
  
  pointPos = PVector.lerp(pointOne, pointTwo, (1+sin(iter*0.05))/2);
  lineArray[0] = pointPos;
  
  
  for(int i = lineArray.length-1; i >= 0; i--){
      colorMode(HSB, 360, 100, 100);
      float lineOpacity = (i/(float)lineArray.length);
      
      if(lineArray[i] != null){
        drawSpeckleLine(lineArray[i], 200, 0, lineOpacity);
      
        lineArray[i].x = lineArray[i].x+0.1;
        lineArray[i].y = lineArray[i].y-2;
      }
      

      
      println(i/(float)lineArray.length);
  }
  
  //if(iter%10 == 0){
    for(int i = lineArray.length-2; i >= 0; i--){
      lineArray[i+1] = lineArray[i];
    }
  //}
  

  iter += 0.5;
  //saveFrame("out/wave######.png");
}
