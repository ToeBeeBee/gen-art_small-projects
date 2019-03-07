int divs = 12;

ArrayList<domino> dominos = new ArrayList<domino>();

void setup(){
  size(1080, 1080);
  background(0, 0, 0);  
  noSmooth();
  for(int i = 0; i < divs; i++){
    dominos.add(new domino(width/2, ((width/2)-400)+(800/divs)*i, 8*i, 500, 800/divs));
  }
}

void draw(){
  //background(0,0,0);
  for(domino d : dominos){
    d.draw();
  }
  saveFrame("dominos/f######.png");
}
