static class Collider{
  
  /* Colisiones enemigo 1*/
  public static boolean colisionBlasEnemigo1(ArrayList<Bullets> list, Enemigo1 enemig) {
    ArrayList<Bullets> sorteador = new ArrayList<Bullets>(list);
    sorteador.sort((a1,a2) -> Float.compare(a1.posicion.x,a2.posicion.x));
    for (int i = 0; i < sorteador.size(); i++) {
      Bullets a = sorteador.get(i);
      Enemigo1 b = enemig;
      if(enemig.getSpawn() == 1){
        if(a.posicion.x < b.posicion.x-60)break;
        if (dist(a.posicion.x, a.posicion.y, b.posicion.x, b.posicion.y) < (a.tamanio.x / 2 + b.tamanio.x / 2)) {
          list.remove(a);
          return true;
        }
      }else{
        if(a.posicion.x > b.posicion.x+60)break;
        if (dist(a.posicion.x, a.posicion.y, b.posicion.x, b.posicion.y) < (a.tamanio.x / 2 + b.tamanio.x / 2)) {
          list.remove(a);
          return true;
        }
      }
    }
    return false;
  }
  
  public static boolean colisionAreaEnemigo1(Gato a, Enemigo1 b) {
    if (dist(a.posicion.x, a.posicion.y, b.posicion.x, b.posicion.y) < (a.tamanio.x / 2 + b.tamanio.x / 2)) {
      return true;
    }
    return false;
  }
  
    /*colisiones enemigo 2*/
  public static boolean colisionAreaEnemigo2(Gato a, ShootGestor b) {
    ArrayList<Bullets> sorteador = new ArrayList<Bullets>(b.balasE);
    sorteador.sort((a1,a2) -> Float.compare(a1.posicion.x,a2.posicion.x));
    for(int i=0; i< sorteador.size();i++){
      Bullets bala = sorteador.get(i);
      if(a.posicion.y < bala.posicion.y)break;
      if (dist(a.posicion.x, a.posicion.y, bala.getPos().x, bala.getPos().y) < (a.tamanio.x / 2 + bala.getTam().x / 2)) {
        println("dame pescado");
        return true;
      }
    }
    return false;
  }
  
  public static boolean colisionEntreBalas(ArrayList<Bullets> list2, Bullets b) {
    ArrayList<Bullets> sorteador = new ArrayList<Bullets>(list2);
    sorteador.sort((a1,a2) -> Float.compare(a1.posicion.x,a2.posicion.x));
    for (int i = 0; i < sorteador.size(); i++) {
      Bullets a = sorteador.get(i);
      if(a.posicion.y < b.posicion.y)break;
      if (dist(a.posicion.x, a.posicion.y, b.posicion.x, b.posicion.y) < (a.tamanio.x / 2 + b.tamanio.x / 2)) {
        list2.remove(a);  // Eliminar la bala de la lista
        return true;  // Colisión detectada
      }
    }
    return false;
  }
  
  /*Colisiones enemigo 3*/
   public static boolean colisionBlasEnemigo3(ArrayList<Bullets> bullet, Enemigo3 w){
    ArrayList<Bullets> sort = new ArrayList <Bullets>(bullet);
    ArrayList<Enemigo3> enemigo3 = new ArrayList <Enemigo3>();
    enemigo3.add(w);
    sort.sort((a, b) -> Float.compare(a.posicion.x, b.posicion.x));
    enemigo3.sort((a, b) -> Float.compare(a.posicion.x, b.posicion.x));
      for (int i = 0; i < sort.size(); i++) {
        Bullets bala = sort.get(i);
        //println("hola");
        for (int j = 0; j < enemigo3.size(); j++) {
          Enemigo3 enemy3 = enemigo3.get(j);
            if (enemy3.posicion.x > bala.posicion.x+bala.tamanio.x) {
              break;
            }
            if (dist(bala.posicion.x, bala.posicion.y, enemy3.posicion.x, enemy3.posicion.y) < (bala.tamanio.x / 2 + enemy3.tamanio.x / 2)) {
              bullet.remove(bala);
              return true;
            }
        }
      }
    return false;
  }
  
 public static boolean colisionAreaEnemigo3(Gato q, Enemigo3 w){
    ArrayList<Gato> gato = new ArrayList <Gato>();
    gato.add(q);
    ArrayList<Enemigo3> enemigo3 = new ArrayList <Enemigo3>();
    enemigo3.add(w);
    gato.sort((a, b) -> Float.compare(a.posicion.x, b.posicion.x));
    enemigo3.sort((a, b) -> Float.compare(a.posicion.x, b.posicion.x));
      for (int i = 0; i < gato.size(); i++) {
        Gato gat = gato.get(i);
        for (int j = 0; j < enemigo3.size(); j++) {
          Enemigo3 enemy3 = enemigo3.get(j);
            if (enemy3.posicion.x > gat.posicion.x+gat.tamanio.x) {
              break;
            }
            if (dist(gat.posicion.x, gat.posicion.y, enemy3.posicion.x, enemy3.posicion.y) < (gat.tamanio.x / 2 + enemy3.tamanio.x / 2)) {
              println("dame pescado");
              return true;
            }
        }
      }
    return false;
  }
 /*Colisiones PowerUp*/
 public static boolean colisionGatoPowerUp(Gato a, PowerUp b){
   ArrayList<PowerUp> powerup = new ArrayList <PowerUp>();
   powerup.add(b);
   powerup.sort((a1,a2) -> Float.compare(a1.posicion.x,a2.posicion.x));
   for (int i = 0; i < powerup.size(); i++) {
     PowerUp power = powerup.get(i);
     Gato gato = a;
     if(gato.posicion.x > power.posicion.x+power.tamanio.x/2)break;
     if (dist(gato.posicion.x, gato.posicion.y, power.posicion.x, power.posicion.y) < (gato.tamanio.x / 2 + power.tamanio.x / 2)) {
       return true;
      }
   }
   return false;
 }
}
