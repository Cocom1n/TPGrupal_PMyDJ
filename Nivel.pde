class Nivel{
  //private Gato player;
  private Pescado area;
  private ShootGestor disparar;
  private SpawnerEnemigo spawnerEnemigo;
  private Enemigo2 enemigo2;
  
  public Nivel(){
    //player = new Gato();
    enemigo2= new Enemigo2();
    //spriteGestor= new SpriteGestor();
    area = new Pescado();
    disparar = new ShootGestor();
    spawnerEnemigo = new SpawnerEnemigo();
  }
  
  public int mostrarJuego(Gato player){
    OrigenEnemy= new PVector(enemigo2.getPos().x, enemigo2.getPos().y);
    area.display();
    player.display();
    enemigo2.display();
    spawnerEnemigo.colocarEnemigo(player);
    disparar.spawnBalaJugador();
    spawnerEnemigo.eliminarEnemigo(area, player);
    disparar.proyectil();

    if(player.getVida() == 0){
      println("vidas " + player.getVida());
      return 3;
    }
    return 2;
  }
  
  public void disparo(int tiempoDisparo){
   if(millis()>=tiempoInicial2+tiempoDisparo && spawnerEnemigo.getSePuedeCrear() == true){
      timeD++;
      if(timeD==3){
        disparar.EnemyShoot();
        timeD=0;
      }
      tiempoInicial2=millis();
    }
  }

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
}
