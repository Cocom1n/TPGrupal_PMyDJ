private PVector mira;
private Gato player;
private Pescado area;
private Enemigo enemigo1;
private EnemyShooter enemigo2;
private PImage fondo;
private int estado;
private SpriteGestor spriteGestor;
private ShootGestor disparar;
private Shooter EDisparo;
private PVector OrigenEnemy;

void setup(){
  size(800,600);
  imageMode(CENTER);
  this.fondo = loadImage("data/fondo.png");
  estado = MaquinaEstados.INSTRUCCIONANDO;
  player = new Gato();
  enemigo1 = new Enemigo();
  enemigo2= new EnemyShooter();
  EDisparo= new Shooter();
  spriteGestor= new SpriteGestor();
  area = new Pescado();
  mira = new PVector(0,0);
 
  disparar = new ShootGestor();
}

void draw(){
  
   OrigenEnemy= new PVector(enemigo2.getPos().x,enemigo2.getPos().y);
  switch(estado){
    case MaquinaEstados.INSTRUCCIONANDO:{
      spriteGestor.animate(new PVector(width/2,height/2),new PVector(800,600),"data/catfish.jpg");
      break;
    }
    /* Muestra la pantalla para jugar */
    case MaquinaEstados.JUGANDO:{
      image(fondo, width/2,height/2,width,height);
      area.display();
      player.display();
      enemigo1.display();
      EDisparo.proyectil();
      enemigo2.display();
      circle(mira.x,mira.y,15);
      disparar.cosoo();
      break;
    }
  }
    
 
}

void mouseMoved() {
  mira.set(mouseX, mouseY);
}

public void keyPressed() {
  if(keyCode == BACKSPACE){
   EDisparo.EnemyShoot();
  } 
  if (keyCode == SHIFT && (estado == MaquinaEstados.INSTRUCCIONANDO)){
    estado = MaquinaEstados.JUGANDO;
  }
}

void mousePressed() {

  disparar.playerShoot();
}
