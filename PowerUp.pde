class PowerUp extends GameObject{

 
    public PowerUp(){
    this.imagen = loadImage("data/enemigo2.png");
    setPos(new PVector(width/5+100,100 ));
    setTam(new PVector(48,53));
    
  }
  
  public void display(){
    circle(getPos().x, getPos().y,25);
    move();
  }
  
  public void move(){
   
  }

}
