static class Collider{
  
  /* Colisiones enemigo 1*/
  public static boolean colisionBlasEnemigo1(ArrayList<Bullets> list, Enemigo1 b) {
    for (int i = 0; i < list.size(); i++) {
      Bullets a = list.get(i);
      if (dist(a.posicion.x, a.posicion.y, b.posicion.x, b.posicion.y) < (a.tamanio.x / 2 + b.tamanio.x / 2)) {
        list.remove(a);
        return true;
      }
    }
    return false;
  }
  public static boolean colisionAreaEnemigo1(Pescado a, Enemigo1 b) {
    if (dist(a.posicion.x, a.posicion.y, b.posicion.x, b.posicion.y) < (a.tamanio.x / 2 + b.tamanio.x / 2)) {
      return true;
    }
    return false;
  }
  
    /*colisiones enemigo 2*/
  public static boolean colisionAreaEnemigo2(Pescado a, ShootGestor b) {
    for(int i=0; i<b.BalasE.size();i++){
      if (dist(a.posicion.x, a.posicion.y, b.BalasE.get(i).getPos().x, b.BalasE.get(i).getPos().y) < (a.tamanio.x / 2 + b.BalasE.get(i).getTam().x / 2)) {
        println("dame pescado");
        return true;
      }
    }
    return false;
  }
  
  public static boolean colisionEntreBalas(ArrayList<Bullets> list2, Bullets b) {
    for (int i = 0; i < list2.size(); i++) {
      Bullets a = list2.get(i);
      if (dist(a.posicion.x, a.posicion.y, b.posicion.x, b.posicion.y) < (a.tamanio.x / 2 + b.tamanio.x / 2)) {
        list2.remove(a);  // Eliminar la bala de la lista
        return true;  // Colisión detectada
      }
    }
    return false;
  }
  
  /*Colisiones enemigo 3*/
  public static boolean colisionBlasEnemigo3(ArrayList<Bullets> list, Enemigo3 b) {
    for (int i = 0; i < list.size(); i++) {
      Bullets a = list.get(i);
      if (dist(a.posicion.x, a.posicion.y, b.posicion.x, b.posicion.y) < (a.tamanio.x / 2 + b.tamanio.x / 2)) {
        list.remove(a);  // Eliminar la bala de la lista
        return true;  // Colisión detectada
      }
    }
    return false;
  }
  
  public static boolean colisionAreaEnemigo3(Pescado a, SpawnerEnemigo b) {
    for(int i=0; i<b.enemigo3.size();i++){
      if (dist(a.posicion.x, a.posicion.y, b.enemigo3.get(i).getPos().x, b.enemigo3.get(i).getPos().y) < (a.tamanio.x / 2 + b.enemigo3.get(i).getTam().x / 2)) { 
        println("dame pescado");
        return true;
      }
    }
    return false;
  }
}
