static class ColliderUno {

  public static boolean manejarColision(ArrayList<Bullets> list, EnemigoUno b) {
    ArrayList<Bullets> sortedList = new ArrayList<Bullets>(list);
    sortedList.sort((a1, a2) -> Float.compare(a1.posicion.x, a2.posicion.x));

    for (int i = 0; i < sortedList.size(); i++) {
      Bullets a = sortedList.get(i);
      //if (b.posicion.x > a.posicion.x + a.tamanio.y) break; // No puede haber colisión más allá de esto
      // Verificación precisa
      if (dist(a.posicion.x, a.posicion.y, b.posicion.x, b.posicion.y) < (a.tamanio.x / 2 + b.tamanio.x / 2)) {
        // Colisión enemigo con bala
        //println("~(x_x)~ enemigoUno se murio");
        return true;
      }
    }
    return false;
  }

  public static boolean manejarColision(Pescado a, EnemigoUno b) {
    if (b.posicion.x > a.posicion.x + a.tamanio.y) {
      return false;
    } else {
      if (dist(a.posicion.x, a.posicion.y, b.posicion.x, b.posicion.y) < (a.tamanio.x / 2 + b.tamanio.x / 2)) {
        // Colision enemigo con pescado
        //println("(`w´)/ enemigoUno quito vida");
        return true;
      }
      return false;
    }
  }
  
  public static boolean manejarColision3(ArrayList<Bullets> list, Enemigo3 b) {
    for (int i = 0; i < list.size(); i++) {
      Bullets a = list.get(i);
      if (dist(a.posicion.x, a.posicion.y, b.posicion.x, b.posicion.y) < (a.tamanio.x / 2 + b.tamanio.x / 2)) {
        list.remove(a);  // Eliminar la bala de la lista
        return true;  // Colisión detectada
      }
    }
    return false;
  }

  public static boolean manejarColisionE3(Pescado a, SpawnerEnemigo b) {
     for(int i=0; i<b.enemigo3.size();i++){
       if (dist(a.posicion.x, a.posicion.y, b.enemigo3.get(i).getPos().x, b.enemigo3.get(i).getPos().y) < (a.tamanio.x / 2 + b.enemigo3.get(i).getTam().x / 2)) {
          println("dame pescado");
          return true;
       }
    }
  return false;
  }
  
}
