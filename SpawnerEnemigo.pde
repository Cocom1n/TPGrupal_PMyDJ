class SpawnerEnemigo extends GameObject{
  /** Indica la lista de enemigos */
  private ArrayList <Enemigo3> enemigo3;
  private boolean sePuedeCrear;
  private Pescado pescado;
  private Gato gato;
  
   public SpawnerEnemigo(){
    enemigo3 =new ArrayList();
    enemigo3.add(new Enemigo3(int(random(1,5))));
    pescado = new Pescado();
    sePuedeCrear = false;
    gato = new Gato();
  }
  
  public void colocarEnemigo() {
    for (int i = enemigo3.size() - 1; i >= 0; i--) {
      Enemigo3 enemy = enemigo3.get(i);
      enemy.display();
      enemy.actualizar();
      if (Collider.manejarColision3(disparar.balasJ, enemy)) {
        enemigo3.remove(i);
        println("Chau (=^+_+^=)");
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
        
        public boolean getSePuedeCrear() {
    return this.sePuedeCrear;
  }
  public void setSePuedeCrear(boolean sePuedeCrear) {
     this.sePuedeCrear=sePuedeCrear;
  }
}
