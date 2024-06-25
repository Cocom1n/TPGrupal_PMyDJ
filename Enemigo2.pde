class Enemigo2 extends GameObject{
 
  private float angulo;
 
  public Enemigo2(){
    this.imagen = loadImage("data/enemigo2.png");
    setPos(new PVector(width/3+100,35 ));
    setTam(new PVector(48,53));
    angulo=0;
  }
  
  public void display(){
    image(imagen.get(0,0,48,53),getPos().x, getPos().y, getTam().x*1.3,getTam().y*1.3);
    move();
  }
  
  public void move(){
    angulo+=0.05;
    getPos().x+=cos(angulo)*8;
  }

}
