class Enemigo2 extends GameObject{
 
  private float angulo;
  private PVector pos2;
 
  public Enemigo2(){
    //this.imagen = loadImage("data/enemigo2.png");
    setPos(new PVector(width/3+100,35 ));
    setTam(new PVector(48,53));
    pos2 = (new PVector(width/3+100,530 ));
    angulo=0;
  }
  
  public void display(){
    this.imagen = loadImage("data/enemigo2.png");
    image(imagen.get(0,0,48,53),getPos().x, 34, getTam().x*1.3,getTam().y*1.3);
    move();
  }
  
  public void display2(){
    this.imagen = loadImage("data/enemigo2Flip.png");
    image(imagen.get(0,0,48,53),pos2.x, pos2.y, getTam().x*1.3,getTam().y*1.3);
    move2();
  }
  
  public void move(){
    angulo+=0.05;
    getPos().x+=cos(angulo)*8;
  }
  
  public void move2(){
    angulo+=0.05;
    pos2.x+=cos(angulo)*8;
  }

}
