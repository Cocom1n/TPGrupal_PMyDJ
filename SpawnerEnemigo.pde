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

  public void colocarEnemigo(Gato gato, int dificultad) {
    
    if (dificultad == 1){
      /* SPAWN ENEMIGO 1 */
      if(enemigos.size() == 0 ){
        enemigos.add(new Enemigo1());
      }
      for (int i = enemigos.size() - 1; i >= 0; i--) {
        Enemigo1 enemigo = enemigos.get(i);
        enemigo.display();
        enemigo.move();
        if (Collider.colisionBlasEnemigo1(jugando.disparar.balasJ, enemigo)||Collider.colisionBlasEnemigo1(jugando.disparar.balasP, enemigo)) {
          gato.setPuntaje(gato.getPuntaje() + 10);
          enemigos.remove(i);
          //println("~(x_x)~ enemigo1 se murio");
        }
        if(enemigo.getDestruir()){
          enemigos.remove(i);
        }
      }
    }
    
    if (dificultad == 2){
      /* SPAWN ENEMIGO 1 */
      if(enemigos.size() == 0 ){
        enemigos.add(new Enemigo1());
      }
      for (int i = enemigos.size() - 1; i >= 0; i--) {
        Enemigo1 enemigo = enemigos.get(i);
        enemigo.display();
        enemigo.move();
        if (Collider.colisionBlasEnemigo1(jugando.disparar.balasJ, enemigo)||Collider.colisionBlasEnemigo1(jugando.disparar.balasP, enemigo)) {
          gato.setPuntaje(gato.getPuntaje() + 10);
          enemigos.remove(i);
          //println("~(x_x)~ enemigo1 se murio");
        }
        if(enemigo.getDestruir()){
          enemigos.remove(i);
        }
      }
      /* SPAWN ENEMIGO 3 */
      for (int i = enemigo3.size() - 1; i >= 0; i--) {
        Enemigo3 enemy = enemigo3.get(i);
        enemy.move();
        enemy.display();
        if (Collider.colisionBlasEnemigo3(jugando.disparar.balasJ, enemy)||Collider.colisionBlasEnemigo3(jugando.disparar.balasP, enemy)) {
          gato.setPuntaje(gato.getPuntaje() + 30);
          enemigo3.remove(i);
          //println("(=^+_+^=) Enemigo1 se murio");
          sePuedeCrear = true;
        }
      }
    }
  }
  
  public void eliminarEnemigo(Gato gato){
    for (int i = enemigo3.size() - 1; i >= 0; i--) {
      Enemigo3 enemy = enemigo3.get(i);
      if(enemy.getX() > 11.5 && sePuedeCrear == false){
        enemigo3.remove(i);
        //println("enemigo3 coliciono con el borde (=^+_+^=)");
        sePuedeCrear = true;
      }
      if(Collider.colisionAreaEnemigo3(gato,enemy) == true && sePuedeCrear == false){
        gato.quitarVida();
        enemigo3.remove(i);
        //println("enemigo3 coliciono con el Jugador (=^+_+^=)");
        sePuedeCrear = true;
      }
    }
    
    for (int i = enemigos.size() - 1; i >= 0; i--) {
      Enemigo1 enemigo = enemigos.get(i);
      if (Collider.colisionAreaEnemigo1(jugando.player, enemigo) == true) {
        gato.quitarVida();
        enemigos.remove(i);
        //println("(`w´)/ enemigo1 coliciono con jugador");
      }
    }
  }
   
  public void crearEnemigo(){
    enemigo3.add(new Enemigo3(int(random(1,5))));
    println("Nuevo enemigo3 (=^._.^=)");
    sePuedeCrear = false;
  }
  
  public boolean getSePuedeCrear() {
    return this.sePuedeCrear;
  }
  public void setSePuedeCrear(boolean sePuedeCrear) {
     this.sePuedeCrear=sePuedeCrear;
  }
}
