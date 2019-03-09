class Ball {

  PVector pos;
  PVector velocity = new PVector();
  float speed = 61;
  float size;
  
  color c = color(255, 255, 255);
  
  PGraphics trailCanvas;
  
  Ball(){
    velocity.set(0.07*speed, 0.93*speed);
    trailCanvas = createGraphics((int) (width*0.66), (int)(height*0.66));
    
    pos = new PVector((0), 0);
    
    size = trailCanvas.width/5;
  }
  
  void inverseCheck(){
    if(trailCanvasAverage() > 255.5){
        c = color(0, 0, 0);   
    } else if(trailCanvasAverage() <= 0){
        c = color(255, 255, 255);
    }
  }
  
  void boundryCheck(){
    if(pos.x > trailCanvas.width || pos.x < 0){
      velocity.x = -velocity.x;
    }
    if(pos.y > trailCanvas.height || pos.y < 0){
      velocity.y = -velocity.y;
    }
  }
  
  void update(){
    pos.add(velocity);
    boundryCheck();
    

      inverseCheck();
 
  }
  
  float trailCanvasAverage(){
    float totalColour = 0;
    trailCanvas.beginDraw();
    trailCanvas.loadPixels();
    
    for(int i = 0; i < trailCanvas.pixels.length; i++){
        color col = trailCanvas.pixels[i];
        float colourAverage = (red(col) + green(col) + blue(col))/3;
        totalColour += colourAverage;
    }
    totalColour = totalColour / trailCanvas.pixels.length;
    trailCanvas.endDraw();
    
    println(totalColour);
    return totalColour;
  }
  
  void drawPixelSpot(PGraphics canvas, PVector p){
      canvas.beginDraw();
      for(int i = 0; i < size; i++){
        for(int j = 0; j < size; j++){
          if(true){
            canvas.set((int)(p.x-size/2)+i, (int)(p.y-size/2)+j, c);
          }
        }
      }
      canvas.endDraw();
  }
  
  void drawTrail(){
    drawPixelSpot(trailCanvas, pos);
  }
  
  void draw(){
    drawPixelSpot(trailCanvas, pos);
    
    image(trailCanvas, (width/2)-(trailCanvas.width/2), (height/2)-(trailCanvas.height/2));
  }

}
