class ShootGestor extends GameObject{
  
  private ArrayList<Bullets> balasJ;
  private ArrayList<Bullets> BalasE;
  private ArrayList<Bullets> BalasPu;
  PVector origen, direcc;
  private boolean PoweUp;
  
  public ShootGestor(){
    balasJ = new ArrayList<Bullets>();
    BalasE = new ArrayList<Bullets>();
    BalasPu = new ArrayList<Bullets>();
    direcc = new PVector(0,0);
    PoweUp=false;
  }
  
  public void playerShoot(){
    origen = new PVector(jugando.player.getPos().x,jugando.player.getPos().y);
    direcc = new PVector(mouseX,mouseY);
    PVector d = PVector.sub(direcc,origen).normalize(); //calcula la direccion normalizada para el disparo
    Bullets nuevabala = new Bullets(d, origen);
    balasJ.add(nuevabala);
  }
  public void spawnBalaJugador(){
     for (int i = balasJ.size()-1; i >= 0; i--) {
      Bullets b = balasJ.get(i);
      b.disparoPlayer();
      b.display(1);
      if (b.getDestruir()) {
        balasJ.remove(i);
      }
    }
  }
  
  public void playerShootPu(){
    origen = new PVector(jugando.player.getPos().x,jugando.player.getPos().y);
    direcc = new PVector(mouseX,mouseY);
    PVector d = PVector.sub(direcc,origen).normalize(); //calcula la direccion normalizada para el disparo
    Bullets nuevabala = new Bullets(d, origen);
    BalasPu.add(nuevabala);
  }
  
  public void spawnBalaPu(){
     for (int i = BalasPu.size()-1; i >= 0; i--) {
      Bullets b = BalasPu.get(i);
      b.disparoPlayer();
      b.display(3);
      if (b.getDestruir()) {
        BalasPu.remove(i);
      }
    }
  }
  
  /* disparo enemigo*/
  
  public void EnemyShoot(){
    PVector d = PVector.sub(jugando.player.getPos(),OrigenEnemy).normalize();
    Bullets nuevabala = new Bullets(d, OrigenEnemy);
    BalasE.add(nuevabala);
  }
  public void proyectil(){
     for (int i = BalasE.size()-1; i >= 0; i--) {
      Bullets b = BalasE.get(i);
      b.disparoPlayer();
      b.display(2);
      if ( Collider.colisionAreaEnemigo2(jugando.player,this) == true ) {
        BalasE.remove(i);
        jugando.player.quitarVida();
        println("golpeo jugador");
      }
      if(Collider.colisionEntreBalas(jugando.disparar.balasJ,b)==true){
        BalasE.remove(i);
      }
      if(Collider.colisionEntreBalas(jugando.disparar.BalasPu,b)==true){
        BalasE.remove(i);
      }
    }
  }
/* metodos accesores de PowerUp */
  public boolean getPowerUp() {
    return this.PoweUp;
  }
  public void setPowerUp(boolean Activar) {
     this.PoweUp=Activar;
  }
}
