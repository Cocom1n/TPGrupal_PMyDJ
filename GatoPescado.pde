private PVector mira, enemigo;
private float angulo;
private Gato player;
private Pescado area;
private PImage fondo;
private int estado;
private SpriteGestor spriteGestor;

void setup(){
  size(800,600);
  imageMode(CENTER);
  this.fondo = loadImage("data/fondo.png");
  estado = MaquinaEstados.INSTRUCCIONANDO;
  player = new Gato();
  spriteGestor= new SpriteGestor();
  area = new Pescado();
  mira = new PVector(0,0);
  
  enemigo = new PVector(40, height/4);
  angulo=0;
}

void draw(){
  
  
  switch(estado){
    case MaquinaEstados.INSTRUCCIONANDO:{
      spriteGestor.animate(new PVector(width/2,height/2),new PVector(800,600),"data/catfish.jpg");
      //image(gameMenu,width/2,height/2, width, height);  
      break;
    }
    /* Muestra la pantalla para jugar */
    case MaquinaEstados.JUGANDO:{
      image(fondo, width/2,height/2,width,height);
      area.display();
      player.display();
      
      //ej enemigo
      fill(222,22,2);
      circle(enemigo.x,enemigo.y,20);
      angulo+=0.05;
      enemigo.y+=sin(angulo)*10;
      circle(mira.x,mira.y,15);
      break;
    }
  }
 
}

void mouseMoved() {
  mira.set(mouseX, mouseY);
}

public void keyPressed() {
  if (keyCode == SHIFT && (estado == MaquinaEstados.INSTRUCCIONANDO)){
    estado = MaquinaEstados.JUGANDO;
  }
}
