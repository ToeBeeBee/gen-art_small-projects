wobbler w;

wobbler[] wList = new wobbler[110];

void setup(){
  size(1080, 1080);
  background(0);
  
  for(int i = 0; i < wList.length; i++){
    wList[i] = new wobbler((width/2)+(i*5)-220, (height/2)+(i*-6)+270, i);
  }
}

void draw(){
  background(0);
  
  for(wobbler w : wList){
    w.draw();
  }
  
  saveFrame("out/f######.png");
}
