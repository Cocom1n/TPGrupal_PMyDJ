class SpawnerEnemigoUno extends GameObject {

  private ArrayList <EnemigoUno> enemigos;

  public SpawnerEnemigoUno() {
    enemigos =new ArrayList();
    enemigos.add(new EnemigoUno());
  }

  public void colocarEnemigo() {
    if(enemigos.size() == 0){
      enemigos.add(new EnemigoUno());
    }
    for (int i = enemigos.size() - 1; i >= 0; i--) {
      EnemigoUno enemigo = enemigos.get(i);
      enemigo.display();
      enemigo.move();
      if (ColliderUno.manejarColision(disparar.balasJ, enemigo)) {
        enemigos.remove(i);
        println("~(x_x)~ enemigoUno se murio");
      }
    }
  }

  public void eliminarEnemigo(Pescado area) {
    for (int i = enemigos.size() - 1; i >= 0; i--) {
      EnemigoUno enemigo = enemigos.get(i);
      if (ColliderUno.manejarColision(area, enemigo) == true) {
        enemigos.remove(i);
        println("(`w´)/ enemigoUno quito vida");
      }
    }
  }
}
