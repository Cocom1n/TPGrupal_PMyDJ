class Nivel{
  private Gato player;
  private ShootGestor disparar;
  private SpawnerEnemigo spawnerEnemigo;
  private Enemigo2 enemigo2;
  private SpawnerPower powerup;
  private long tiempoInicial;
  private int tiempo;
  private long tiempoInicial2;
  private int timeD;
  private long tiempoInicial3;
  private int timeS;
  private long tiempoInicial4;
  private int timeActive;
  
  public Nivel(){
    player = new Gato();
    enemigo2= new Enemigo2();
    disparar = new ShootGestor();
    spawnerEnemigo = new SpawnerEnemigo();
    powerup= new SpawnerPower();
  }
  
  public int mostrarJuego(){
    origenEnemy= new PVector(enemigo2.getPos().x, enemigo2.getPos().y);
    player.display();
    player.mover();
    enemigo2.display();
    spawnerEnemigo.colocarEnemigo(player);
    disparar.spawnBalaPu();
    disparar.spawnBalaJugador();
    spawnerEnemigo.eliminarEnemigo(player);
    disparar.spawnerShoot();
    powerup.colocarPowerUp();
    powerup.eliminarPowerUp();
    
    tiempoRespawn(1000);
    disparo(1000);
    tiempoPower(1000);
    tiempoPowerActive(1000);

    if(player.getVida() == 0){
      println("vidas " + player.getVida());
      return 3;
    }
    return 2;
  }
  
  public void disparo(int tiempoDisparo){
   if(millis()>=tiempoInicial2+tiempoDisparo && spawnerEnemigo.getSePuedeCrear() == true){
      timeD++;
      if(timeD==5){
        disparar.EnemyShoot();
        timeD=0;
      }
      tiempoInicial2=millis();
    }
  }
/*enemigo3*/
public void tiempoRespawn(int tiempoEspera){
  if(millis()>=tiempoInicial+tiempoEspera && spawnerEnemigo.getSePuedeCrear() == true){
    tiempo++;
    if(tiempo==5){
     spawnerEnemigo.crearEnemigo();
      tiempo=0;
    }
    tiempoInicial=millis();
  }
}

/*tiempo enemigo 1*/
public void tiempoPower(int tiempoSpawn){
  if(millis()>=tiempoInicial3+tiempoSpawn && powerup.getCrearPower() == true && powerup.getPowerOn() == false){
    timeS++;
    if(timeS==5){  
     powerup.crearPowerUp();
      timeS=0;
    }
    tiempoInicial3=millis();
  }
}

/*powerup*/
public void tiempoPowerActive(int tiempoActivo){
  if(powerup.getPowerOn() == true){
    disparar.setPowerUp(true);
  }
  if(millis()>=tiempoInicial4+tiempoActivo && powerup.getPowerOn() == true){
    timeActive++;
    if(timeActive==5){
      disparar.setPowerUp(false);
      powerup.setPowerOn(false);
      timeActive=0;
    }
    tiempoInicial4=millis();
  }
}
}
