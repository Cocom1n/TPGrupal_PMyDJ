private PImage fondo;
private SpriteGestor spriteGestor;
private int estado;
private PVector OrigenEnemy;
private long tiempoInicial;
private int tiempo;
private long tiempoInicial2;
private int timeD;
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
  switch(estado) {
  case MaquinaEstados.INSTRUCCIONANDO:
    {
      spriteGestor.animate(new PVector(width/2, height/2), new PVector(800, 600), "data/catfish.jpg");
      break;
    }

  case MaquinaEstados.JUGANDO:
    {
      image(fondo, width/2, height/2, width, height);
      jugando.mostrarJuego();
      jugando.tiempoRespawn(1000);
      jugando.disparo(500);
      break;
    }
    
  case MaquinaEstados.FINAL:
    {
      spriteGestor.animate(new PVector(width/2,height/2),new PVector(800,600),"data/end.jpg");
      break;
    }
  }
}

public void keyPressed() {

  if (keyCode == SHIFT && (estado == MaquinaEstados.INSTRUCCIONANDO)){
    estado = MaquinaEstados.JUGANDO;
  }
}

void mousePressed() {
  jugando.disparar.playerShoot();
}
