class ShootGestor extends GameObject{
  
  private ArrayList<Bullets> balasJ;
  PVector origen, direcc;
  
  public ShootGestor(){
    balasJ = new ArrayList<Bullets>();
    direcc = new PVector(0,0);
  }
  
  public void playerShoot(){
    origen = new PVector(width/2-10,height/2);
    direcc = new PVector(mira.x,mira.y);
    PVector d = PVector.sub(direcc,origen).normalize();
    //println(d);
    Bullets nuevabala = new Bullets(d, origen);
    balasJ.add(nuevabala);
  }
  public void cosoo(){
     for (int i = balasJ.size()-1; i >= 0; i--) {
      Bullets b = balasJ.get(i);
      b.disparoPlayer();
      b.display();
      if (b.getDestruir()) {
        balasJ.remove(i);
      }
    }
  }
}
