class SpawnerEnemigo extends GameObject{
  /** Indica la lista de enemigos */
  private ArrayList <Enemigo3> enemigo3;
  private boolean sePuedeCrear;
  //private Enemigo3 enemy3;
  private Pescado pescado;
  private ShootGestor shootGestor;
  
   public SpawnerEnemigo(){
    enemigo3 =new ArrayList();
    enemigo3.add(new Enemigo3(int(random(1,5))));
    pescado = new Pescado();
    shootGestor = new ShootGestor();
    sePuedeCrear = false;
  }
  
  public void colocarEnemigo(){
    for(int i=0; i<enemigo3.size();i++){
      enemigo3.get(i).display();
      enemigo3.get(i).actualizar();
    }
  }
  
   public void eliminarEnemigo(){
      for(int i=0; i<enemigo3.size();i++){
        println(ColliderUno.manejarColision3(shootGestor.balasJ,this));
        if(enemigo3.get(i).getX() > 11.5 && sePuedeCrear == false|| ColliderUno.manejarColisionE3(pescado,this) == true && sePuedeCrear == false || ColliderUno.manejarColision3(shootGestor.balasJ,this) == true && sePuedeCrear == false){
          enemigo3.remove(i);
          println("Chau (=^+_+^=)");
          sePuedeCrear = true;
        }
      }
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
