class Enemigo extends GameObject{
 
  private float angulo;
  
  public Enemigo(){
    setPos(new PVector(40, height/4));
    angulo=0;
  }
  
  public void display(){
    fill(222,22,2);
    circle(getPos().x,getPos().y,20);
    angulo+=0.05;
    getPos().y+=sin(angulo)*10;
  }
}
