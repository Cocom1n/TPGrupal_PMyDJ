private PImage fondo, hud;
private SpriteGestor spriteGestor;
private int estado;
private PVector origenEnemy, origen2;
private Nivel jugando;

void setup(){
  size(800, 600);
  imageMode(CENTER);
  this.fondo = loadImage("data/fondo.png");
  this.hud = loadImage("data/hud.png");
  estado = MaquinaEstados.INSTRUCCIONANDO;
  spriteGestor= new SpriteGestor();
  jugando = new Nivel();
}


void draw(){
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
      image(hud, width/2, height/2, width, height);
      String score = nf(jugando.player.getPuntaje(), 9);
      String vida = nf(jugando.player.getVida(), 2);
      text(vida, 675, 576);
      text(score, 155, 570); 
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

public void keyPressed(){

  if (keyCode == SHIFT && (estado == MaquinaEstados.INSTRUCCIONANDO)){
    estado = MaquinaEstados.JUGANDO;
  }
  if (keyCode == SHIFT && (estado == MaquinaEstados.FINAL)){
    estado = MaquinaEstados.INSTRUCCIONANDO;
  }
  
  if (key == 'w' || key == 'W') {
    jugando.player.arriba = true;
  }
  if (key == 's' || key == 'S') {
    jugando.player.abajo = true;
  }
  if (key == 'a' || key == 'A') {
    jugando.player.izqierda = true;
  }
  if (key == 'd' || key == 'D') {
    jugando.player.derecha = true;
  }
}

void mousePressed(){
  if(jugando.disparar.getPowerUp()){
      jugando.disparar.playerShootPu();
    }else{
      jugando.disparar.playerShoot();
    }  
}

void keyReleased(){
  if (key == 'w' || key == 'W') {
    jugando.player.arriba = false;
  }
  if (key == 's' || key == 'S') {
    jugando.player.abajo = false;
  }
  if (key == 'a' || key == 'A') {
    jugando.player.izqierda = false;
  }
  if (key == 'd' || key == 'D') {
    jugando.player.derecha = false;
  }
}
