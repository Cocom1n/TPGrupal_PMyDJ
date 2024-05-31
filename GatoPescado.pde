PVector mira, gato, enemigo;
float angulo;
void setup(){
  size(700,700);
  mira = new PVector(0,0);
  gato = new PVector(width/2,height/2);
  enemigo = new PVector(40,50);
  angulo=0;
}

void draw(){
  background(255);
  stroke(0);
  fill(200,150,255);
  circle(gato.x,gato.y,20);
  fill(222,22,2);
  circle(enemigo.x,enemigo.y,20);

  noFill();
  circle(gato.x,gato.y,200);
  
  circle(mira.x,mira.y,15);
  //vector direcion hacia donde apuntaria el GATO
  PVector dire = PVector.sub(mira,gato).normalize();
  PVector vD = PVector.add(mira,dire);
  stroke(240, 197, 238);
  line(gato.x,gato.y,vD.x,vD.y);
  
  //enemigo ej
  angulo+=0.05;
  enemigo.y+=sin(angulo)*15;
     
   
}

void mouseMoved() {
  mira.set(mouseX, mouseY);
}
