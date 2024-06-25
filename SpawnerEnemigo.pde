class SpawnerEnemigo extends GameObject{
  /** Indica la lista de enemigos */
  private ArrayList <Enemigo1> enemigos;
  private ArrayList <Enemigo3> enemigo3;
  private boolean sePuedeCrear;
  private Pescado pescado;
  private Gato gato;
  
   public SpawnerEnemigo(){
    enemigos =new ArrayList();
    enemigos.add(new Enemigo1());
    
    enemigo3 =new ArrayList();
    enemigo3.add(new Enemigo3(int(random(1,5))));
    
    pescado = new Pescado();
    sePuedeCrear = false;
    gato = new Gato();
  }
  
  public void colocarEnemigo() {
    
    if(enemigos.size() == 0 ){
      enemigos.add(new Enemigo1());
    }
    for (int i = enemigos.size() - 1; i >= 0; i--) {
      Enemigo1 enemigo = enemigos.get(i);
      enemigo.display();
      enemigo.move();
      if (Collider.manejarColision(jugando.disparar.balasJ, enemigo)) {
        enemigos.remove(i);
        println("~(x_x)~ enemigo1 se murio");
      }
    }
    
    for (int i = enemigo3.size() - 1; i >= 0; i--) {
      Enemigo3 enemy = enemigo3.get(i);
      enemy.display();
      enemy.actualizar();
      if (Collider.manejarColision3(jugando.disparar.balasJ, enemy)) {
        enemigo3.remove(i);
        println("(=^+_+^=) Enemigo1 se murio");
        sePuedeCrear = true;
      }
    }
  }
  
   public void eliminarEnemigo(){
     for (int i = enemigo3.size() - 1; i >= 0; i--) {
       Enemigo3 enemy = enemigo3.get(i);
       if(enemy.getX() > 11.5 && sePuedeCrear == false|| Collider.manejarColisionE3(pescado,this) == true && sePuedeCrear == false){
         gato.quitarVida();
         println(gato.getVida());
         enemigo3.remove(i);
         println("Chau (=^+_+^=)");
         sePuedeCrear = true;
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
   
   public void eliminarEnemigo(Pescado area) {
    for (int i = enemigos.size() - 1; i >= 0; i--) {
      Enemigo1 enemigo = enemigos.get(i);
      if (Collider.manejarColision(area, enemigo) == true) {
        enemigos.remove(i);
        println("(`w´)/ enemigoUno quito vida");
      }
    }
  }
        
       
        
        public boolean getSePuedeCrear() {
    return this.sePuedeCrear;
  }
  public void setSePuedeCrear(boolean sePuedeCrear) {
     this.sePuedeCrear=sePuedeCrear;
  }
}
