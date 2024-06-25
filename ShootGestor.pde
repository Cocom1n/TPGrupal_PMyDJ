class ShootGestor extends GameObject{
  
  private ArrayList<Bullets> balasJ;
  private ArrayList<Bullets> BalasE;
  private Pescado pescado;
  PVector origen, direcc;
  
  public ShootGestor(){
    balasJ = new ArrayList<Bullets>();
    BalasE = new ArrayList<Bullets>();
    pescado = new Pescado();
    direcc = new PVector(0,0);
  }
  
  public void playerShoot(){
    origen = new PVector(width/2-10,height/2);
    direcc = new PVector(mouseX,mouseY);
    PVector d = PVector.sub(direcc,origen).normalize();
    //println(d);
    Bullets nuevabala = new Bullets(d, origen);
    balasJ.add(nuevabala);
  }
  public void cosoo(){
     for (int i = balasJ.size()-1; i >= 0; i--) {
      Bullets b = balasJ.get(i);
      b.disparoPlayer();
      b.display();
      if (b.getDestruir()) {
        balasJ.remove(i);
      }
    }
  }
  
  /* disparo enemigo*/
  
  public void EnemyShoot(){
    
    direcc = new PVector(width/2-10,height/2);
    PVector d = PVector.sub(direcc,OrigenEnemy).normalize();
    Bullets nuevabala = new Bullets(d, OrigenEnemy);
    BalasE.add(nuevabala);
  }
  public void proyectil(){
     for (int i = BalasE.size()-1; i >= 0; i--) {
      Bullets b = BalasE.get(i);
      b.disparoPlayer();
      b.display();
       if ( Collider.manejarColisionE2(pescado,this) == true ) {
        BalasE.remove(i);
        println("golpeo jugador");
      }else if(Collider.manejarColisionB2(disparar.balasJ,b)==true){
        BalasE.remove(i);
      }
    }
  }
}
