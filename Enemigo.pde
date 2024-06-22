class Enemigo extends GameObject{
  private PVector posicion;
  private PVector velocidad;
  private float timer;
  //private SpriteGestor spriteGestor= new SpriteGestor();
  
  public Enemigo(){
    this.posicion = new PVector(40, height/3);
    this.velocidad = new PVector(0,height/20);
    this.imagen = loadImage("alien1.png");
    timer = 0.0;
  }
  
  public void display(){
    fill(222,22,2);
    image(imagen, this.posicion.x, this.posicion.y);
  }
  
  public void move(){
    timer += Time.getDeltaTime(frameRate);
    this.posicion.x += this.velocidad.y * Time.getDeltaTime(frameRate);
    this.posicion.y += (6*sin(timer*2));
  }
  
}
