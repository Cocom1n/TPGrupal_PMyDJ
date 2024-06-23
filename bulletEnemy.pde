class BulletEnemy extends GameObject{
  
  private PVector direccion;
  
  public BulletEnemy(PVector dire, PVector pos){
    setPos(pos);
    this.imagen = loadImage("data/bulletEnemy.png");
    setTam(new PVector(20,20));
    setVel(5);
    setDestruir(false);
    this.direccion = dire;
  }
  
  public void display(){
    image(imagen, getPos().x, getPos().y, getTam().x, getTam().y);
  }
  
  public void disparoEnemy(){
    getPos().add(PVector.mult(direccion,getVel()));
    //println(direccion + "||" + getPos());
    //getPos().x+=getVel();
    //PVector vel = direccion.mult(getVel());
    //getPos().add(vel);
    
    if (getPos().x >= width || getPos().x<=0){
      setDestruir(true);

    }
  }
}
