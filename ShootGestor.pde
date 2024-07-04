class ShootGestor extends GameObject{
  
  private ArrayList<Bullets> balasJ;
  private ArrayList<Bullets> balasE;
  private ArrayList<Bullets> balasP;
  private ArrayList<Bullets> balasE2;
  PVector origen, direcc;
  private boolean poweUp;
  
  public ShootGestor(){
    balasJ = new ArrayList<Bullets>();
    balasE = new ArrayList<Bullets>();
    balasP = new ArrayList<Bullets>();
    balasE2 = new ArrayList<Bullets>();
    direcc = new PVector(0,0);
    poweUp=false;
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
    balasP.add(nuevabala);
  }
  
  public void spawnBalaPu(){
     for (int i = balasP.size()-1; i >= 0; i--) {
      Bullets b = balasP.get(i);
      b.disparoPlayer();
      b.display(3);
      if (b.getDestruir()) {
        balasP.remove(i);
      }
    }
  }
  
  /* disparo enemigo*/
  
  public void EnemyShoot(){
    PVector d = PVector.sub(jugando.player.getPos(),origenEnemy).normalize();
    Bullets nuevabala = new Bullets(d, origenEnemy);
    balasE.add(nuevabala);
  }
  public void spawnerShoot(){
     for (int i = balasE.size()-1; i >= 0; i--) {
      Bullets b = balasE.get(i);
      b.disparoPlayer();
      b.display(2);
      
      if (b.getPos().x >= width-50 || b.getPos().x<=0 || b.getPos().y >= height  || b.getPos().y<=0 ){
        balasE.remove(i);
      }
      if ( Collider.colisionAreaEnemigo2(jugando.player,this) == true ) {
        balasE.remove(i);
        jugando.player.quitarVida();
      }
      if(Collider.colisionEntreBalas(jugando.disparar.balasJ,b)==true){
        balasE.remove(i);
      }
      if(Collider.colisionEntreBalas(jugando.disparar.balasP,b)==true){
        balasE.remove(i);
      }
    }
  }
  
  public void EnemyShoot2(){
    PVector d = PVector.sub(jugando.player.getPos(),origen2).normalize();
    Bullets nuevabala = new Bullets(d, origen2);
    balasE2.add(nuevabala);
  }
  
  public void spawnerShoot2(){
    for (int i = balasE2.size()-1; i >= 0; i--) {
      Bullets b = balasE2.get(i);
       b.disparoPlayer();
      b.display(2);
      if (b.getPos().x >= width-50 || b.getPos().x<=0 || b.getPos().y >= height  || b.getPos().y<=0 ){
        balasE2.remove(i);
      }
      if ( Collider.colisionAreaEnemigo2(jugando.player,this) == true ) {
        balasE2.remove(i);
        jugando.player.quitarVida();
      }
      if(Collider.colisionEntreBalas(jugando.disparar.balasJ,b)==true){
        balasE2.remove(i);
      }
      if(Collider.colisionEntreBalas(jugando.disparar.balasP,b)==true){
        balasE2.remove(i);
      }
    }
  }

/* metodos accesores de PowerUp */
  public boolean getPowerUp() {
    return this.poweUp;
  }
  public void setPowerUp(boolean Activar) {
     this.poweUp=Activar;
  }
}
