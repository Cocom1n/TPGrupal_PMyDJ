 
class Shooter extends GameObject{
      private Pescado pescado;
      private Gato gato;
  private ArrayList<BulletEnemy> BalasE;
 

  PVector direcc;
 
  public Shooter(){
    gato = new Gato();
    pescado = new Pescado();
    BalasE = new ArrayList<BulletEnemy>();
    direcc = new PVector(0,0);
  }
  
  public void EnemyShoot(){
    
    direcc = new PVector(width/2-10,height/2);
    PVector d = PVector.sub(direcc,OrigenEnemy).normalize();
    //println(d);
    BulletEnemy nuevabala = new BulletEnemy(d, OrigenEnemy);
    BalasE.add(nuevabala);
  }
  public void proyectil(){
     for (int i = BalasE.size()-1; i >= 0; i--) {
      BulletEnemy b = BalasE.get(i);
      b.disparoEnemy();
      b.display();
       if ( ColliderUno.manejarColisionE2(pescado,this) == true ) {
        BalasE.remove(i);
        println("golpeo jugador");
      }else if(ColliderUno.manejarColisionB2(disparar.balasJ,b)==true){
        BalasE.remove(i);
      }
    }
  }
}
