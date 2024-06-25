class SpawnerEnemigo extends GameObject{
  /** Indica la lista de enemigos */
  private ArrayList <Enemigo1> enemigos;
  private ArrayList <Enemigo3> enemigo3;
  private boolean sePuedeCrear;
  
  public SpawnerEnemigo(){
    enemigos =new ArrayList();
    enemigos.add(new Enemigo1());
    
    enemigo3 =new ArrayList();
    enemigo3.add(new Enemigo3(int(random(1,5))));
    
    sePuedeCrear = false;
  }
  
  public void colocarEnemigo(Gato gato) {
    if(enemigos.size() == 0 ){
      enemigos.add(new Enemigo1());
    }
    for (int i = enemigos.size() - 1; i >= 0; i--) {
      Enemigo1 enemigo = enemigos.get(i);
      enemigo.display();
      enemigo.move();
      if (Collider.colisionBlasEnemigo1(jugando.disparar.balasJ, enemigo)) {
        gato.setPuntaje(gato.getPuntaje() + 10);
        enemigos.remove(i);
        println("~(x_x)~ enemigo1 se murio");
      }
    }
    
    for (int i = enemigo3.size() - 1; i >= 0; i--) {
      Enemigo3 enemy = enemigo3.get(i);
      enemy.display();
      enemy.actualizar();
      if (Collider.colisionBlasEnemigo3(jugando.disparar.balasJ, enemy)) {
        gato.setPuntaje(gato.getPuntaje() + 30);
        enemigo3.remove(i);
        println("(=^+_+^=) Enemigo1 se murio");
        sePuedeCrear = true;
      }
    }
    String score = nf(gato.getPuntaje(), 9);
    text("Puntaje " + score, 60, 576); 
  }
  
  public void eliminarEnemigo(Pescado area, Gato gato){
    for (int i = enemigo3.size() - 1; i >= 0; i--) {
      Enemigo3 enemy = enemigo3.get(i);
      if(enemy.getX() > 11.5 && sePuedeCrear == false|| Collider.colisionAreaEnemigo3(area,this) == true && sePuedeCrear == false){
        gato.quitarVida();
        println(gato.getVida());
        enemigo3.remove(i);
        println("Chau (=^+_+^=)");
        sePuedeCrear = true;
      }
    }
    
    for (int i = enemigos.size() - 1; i >= 0; i--) {
      Enemigo1 enemigo = enemigos.get(i);
      if (Collider.colisionAreaEnemigo1(area, enemigo) == true) {
        gato.quitarVida();
        enemigos.remove(i);
        println("(`w´)/ enemigoUno quito vida");
      }
    }
    
    textSize(25);
    fill(0, 408, 612);
    text("Vida", 600, 576); 
    text(gato.getVida(), 675, 576);
  }
   
   public void crearEnemigo(){
     enemigo3.add(new Enemigo3(int(random(1,5))));
     println("Holi (=^._.^=)");
     sePuedeCrear = false;
   }
  
  public boolean getSePuedeCrear() {
    return this.sePuedeCrear;
  }
  public void setSePuedeCrear(boolean sePuedeCrear) {
     this.sePuedeCrear=sePuedeCrear;
  }
}
