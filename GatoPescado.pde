
private PVector mira;
private Gato player;
private Pescado area;
private PImage fondo;
private int estado;
private SpriteGestor spriteGestor;
private ShootGestor disparar;
private SpawnerEnemigoUno spawnerEnemigoUno;
private SpawnerEnemigo spawnerEnemigo;
private EnemyShooter enemigo2;
private Shooter EDisparo;
private PVector OrigenEnemy;
private long tiempoInicial;
private int tiempo;

void setup() {
  size(800, 600);
  imageMode(CENTER);
  this.fondo = loadImage("data/fondo.png");
  estado = MaquinaEstados.INSTRUCCIONANDO;
  player = new Gato();
  spawnerEnemigoUno = new SpawnerEnemigoUno();
  enemigo2= new EnemyShooter();
  EDisparo= new Shooter();
  spriteGestor= new SpriteGestor();
  area = new Pescado();
  mira = new PVector(0, 0);
  disparar = new ShootGestor();
  spawnerEnemigo = new SpawnerEnemigo();
}


void draw() {

  OrigenEnemy= new PVector(enemigo2.getPos().x, enemigo2.getPos().y);
  switch(estado) {
  case MaquinaEstados.INSTRUCCIONANDO:
    {
      spriteGestor.animate(new PVector(width/2, height/2), new PVector(800, 600), "data/catfish.jpg");
      break;
    }
    /* Muestra la pantalla para jugar */
  case MaquinaEstados.JUGANDO:
    {
      image(fondo, width/2, height/2, width, height);
      area.display();
      player.display();
      spawnerEnemigoUno.colocarEnemigo();
      spawnerEnemigoUno.eliminarEnemigo(area);
      spawnerEnemigo.colocarEnemigo();
      disparar.cosoo();
      spawnerEnemigo.eliminarEnemigo();
      tiempoRespawn(1000);
      EDisparo.proyectil();
      enemigo2.display();
      circle(mira.x, mira.y, 15);

      break;
    }
  }
}

public void tiempoRespawn(int tiempoEspera) {
  if (millis()>=tiempoInicial+tiempoEspera && spawnerEnemigo.getSePuedeCrear() == true) {
    tiempo++;
    if (tiempo==5) {
      spawnerEnemigo.crearEnemigo();
      tiempo=0;
    }
    tiempoInicial=millis();
  }
}

void mouseMoved() {
  mira.set(mouseX, mouseY);
}

public void keyPressed() {
  if (keyCode == BACKSPACE) {
    EDisparo.EnemyShoot();
  }
  if (keyCode == SHIFT && (estado == MaquinaEstados.INSTRUCCIONANDO)) {
    estado = MaquinaEstados.JUGANDO;
  }
}

void mousePressed() {
  disparar.playerShoot();
}
