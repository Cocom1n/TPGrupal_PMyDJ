class Enemigo extends GameObject{
  private float timer;
  //private SpriteGestor spriteGestor= new SpriteGestor();
  
  public Enemigo(){
    this.imagen = loadImage("alien1.png");
    setPos(new PVector(40, height/3));
    setVel(height/30);
    setTam(new PVector(50,50));
    setDestruir(false);
    timer = 0.0;
  }
  
  public void display(){
    fill(222,22,2);
    ellipse(posicion.x,posicion.y,tamanio.x,tamanio.y);
    image(imagen, this.posicion.x, this.posicion.y);
    
  }
  
  public void move(){
    timer += Time.getDeltaTime(frameRate);
    this.posicion.x += this.velocidad * Time.getDeltaTime(frameRate);
    this.posicion.y += (2.5 * sin(timer));
  }
  
}
