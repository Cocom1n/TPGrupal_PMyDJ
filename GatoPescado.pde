private PImage fondo;
private SpriteGestor spriteGestor;
private int estado;
private PVector OrigenEnemy;
private Nivel jugando;

void setup() {
  size(800, 600);
  imageMode(CENTER);
  this.fondo = loadImage("data/fondo.png");
  estado = MaquinaEstados.INSTRUCCIONANDO;
  spriteGestor= new SpriteGestor();
  jugando = new Nivel();
}


void draw() {
  fill(230, 113, 164);
  switch(estado) {
  case MaquinaEstados.INSTRUCCIONANDO:
    {
      spriteGestor.animate(new PVector(width/2, height/2), new PVector(800, 600), "data/catfish.jpg");
      jugando.player.reset();
      break;
    }

  case MaquinaEstados.JUGANDO:
    {
      image(fondo, width/2, height/2, width, height);
      estado = jugando.mostrarJuego();
      break;
    }
    
  case MaquinaEstados.FINAL:
    {
      spriteGestor.animate(new PVector(width/2,height/2),new PVector(800,600),"data/end.jpg");
      String score = nf(jugando.player.getPuntaje(), 9);
      textSize(30);
      text("Maximo Puntaje", 20, height * .4); 
      text(score, 50, height * .5);
      text("Ánimo bro! (^0^)/", 20, height * .6); 
      break;
    }
  }
}

public void keyPressed() {

  if (keyCode == SHIFT && (estado == MaquinaEstados.INSTRUCCIONANDO)){
    estado = MaquinaEstados.JUGANDO;
  }
  if (keyCode == SHIFT && (estado == MaquinaEstados.FINAL)){
    estado = MaquinaEstados.INSTRUCCIONANDO;
  }
}

void mousePressed() {
  jugando.disparar.playerShoot();
}
