class PowerUp extends GameObject{

 
    public PowerUp(){
    this.imagen = loadImage("data/powerUp.png");
    setPos(new PVector(random(100,700),random(100,500) ));
    setTam(new PVector(50,50));
    
  }
  
  public void display(){
    image(imagen,getPos().x, getPos().y);
  }
  
}
