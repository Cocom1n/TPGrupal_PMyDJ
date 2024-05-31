PVector mira, gato;
void setup(){
  size(700,700);
  mira = new PVector(0,0);
  gato = new PVector(width/2,height/2);
}

void draw(){
  background(255);
  stroke(0);
  fill(200,150,255);
  circle(gato.x,gato.y,20);
  noFill();
  circle(gato.x,gato.y,200);
  
  circle(mira.x,mira.y,15);
  //vector direcion hacia donde apuntaria el GATO
  PVector dire = PVector.sub(mira,gato).normalize();
  PVector vD = PVector.add(mira,dire);
  stroke(240, 197, 238);
  line(gato.x,gato.y,vD.x,vD.y);
   
}

void mouseMoved() {
  mira.set(mouseX, mouseY);
}
