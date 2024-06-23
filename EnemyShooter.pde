class EnemyShooter extends GameObject{
 
  private float angulo;
 
  public EnemyShooter(){
    setPos(new PVector(width/3,40 ));
    angulo=0;
  }
  
  public void display(){
    fill(222,22,2);
    circle(getPos().x,getPos().y,20);
    angulo+=0.05;
    getPos().x+=cos(angulo)*10;
    
  }

}
