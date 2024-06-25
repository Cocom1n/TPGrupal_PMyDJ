class Bullets extends GameObject{
  
  private PVector direccion;
  
  public Bullets(PVector dire, PVector pos){
    setPos(pos);
    setTam(new PVector(0,00));
    setVel(5);
    setDestruir(false);
    this.direccion = dire;
  }
  
  public void display(int tipo){
    switch(tipo){
      case 1:{
        this.imagen = loadImage("data/bullet.png");
        setTam(new PVector(20,20));
        break;
      }
      case 2:{
        this.imagen = loadImage("data/bulletEnemy.png");
        setTam(new PVector(30,30));
        break;
      }
      case 3:{
        this.imagen = loadImage("data/bullet.png");
        setTam(new PVector(60,60));
        break;
      }
    }
    image(imagen, getPos().x, getPos().y, getTam().x, getTam().y);
  }
  
  public void disparoPlayer(){
    getPos().add(PVector.mult(direccion,getVel()));
    if (getPos().x >= width || getPos().x<=0){
      setDestruir(true);
    }
  }
}
