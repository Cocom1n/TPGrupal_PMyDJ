class Bullets extends GameObject{
  
  private PVector direccion;
  
  public Bullets(PVector dire, PVector pos){
    setPos(pos);
    this.imagen = loadImage("data/bullet.png");
    setTam(new PVector(20,20));
    setVel(5);
    setDestruir(false);
    this.direccion = dire;
  }
  
  public void display(){
    image(imagen, getPos().x, getPos().y, getTam().x, getTam().y);
  }
  
  public void disparoPlayer(){
    getPos().add(PVector.mult(direccion,getVel()));
    if (getPos().x >= width || getPos().x<=0){
      setDestruir(true);
    }
  }
}
