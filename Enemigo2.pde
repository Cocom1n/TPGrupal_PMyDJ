class Enemigo2 extends GameObject{
 
  private float angulo;
 
  public Enemigo2(){
    this.imagen = loadImage("alien3.png");
    setPos(new PVector(width/3+100,40 ));
    angulo=0;
  }
  
  public void display(){
    fill(222,22,2);
    circle(getPos().x,getPos().y,20);
    image(imagen, this.posicion.x, this.posicion.y);
    move();
  }
  public void move(){
  
    angulo+=0.05;
    getPos().x+=cos(angulo)*8;}

}
