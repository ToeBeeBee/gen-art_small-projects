class Rotator {
  float currentLerpTime = 0;
  
  
  PVector pos;
  float radius = 10;
  float rotateRate = 500;
  boolean inverse = false;
  
  int direction = 0;
  
  
  PVector[] trailPos = new PVector[70];
  
  Rotator(float radius, float rate, boolean inv, int dir){
    this.radius = radius;
    this.rotateRate = rate;
    this.inverse = inv;
    this.direction = dir;
    
  }
  
  void update(){
       currentLerpTime += dt;
      
      if(currentLerpTime > rotateRate){
        currentLerpTime = 0;
        if(inverse){direction--;} else {direction++;} 
        if(direction > 3){ direction = 0; } else if(direction < 0){ direction = 3; }
      }
      float perc = currentLerpTime/rotateRate;
      perc = sin(perc* PI * 0.5);

      PVector pos1 = new PVector();
      PVector pos2 = new PVector();
      
      switch(direction){
        case 0:
          pos1.set((width/2)+radius, (height/2)-radius);
          pos2.set((width/2)+radius, (height/2)+radius);
          break;
        case 1:
          pos1.set((width/2)+radius, (height/2)+radius);
          pos2.set((width/2)-radius, (height/2)+radius);
          break;
        case 2:
          pos1.set((width/2)-radius, (height/2)+radius);
          pos2.set((width/2)-radius, (height/2)-radius);
          break;
        case 3:
          pos1.set((width/2)-radius, (height/2)-radius);
          pos2.set((width/2)+radius, (height/2)-radius);
          break;
      }
      
      if(inverse){PVector posTemp = pos2; pos2 = pos1; pos1 = posTemp;}
      
      pos = PVector.lerp(pos1, pos2, perc);
      trailPos[0] = pos;
      for(int i = trailPos.length-1; i > 0; i--){
        trailPos[i] = trailPos[i-1];
      }

  }
  
  void draw(){
    ellipseMode(CENTER);
    noFill();
    stroke(255,255,255, 240);
    strokeWeight(5);
    ellipse(pos.x, pos.y, 260, 260);
    
    
    for(int i = 0; i < trailPos.length-1; i++){
      if(trailPos[i] != null){
        float trailPercentage = 1-((float)i/ (float)trailPos.length);
        println(trailPercentage);
        strokeWeight(30);
        stroke(255,255,255, 30*(trailPercentage*trailPercentage));
        ellipse(trailPos[i].x, trailPos[i].y, 60*trailPercentage+80, 60*trailPercentage+80);
      }
    }
  }

}
