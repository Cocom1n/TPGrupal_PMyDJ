class EnemigoUno extends GameObject {
  private float timer;
  private int spawn;

  public EnemigoUno() {
    this.imagen = loadImage("alien2.png");
    setPos(new PVector(0, height/3));
    setVel(height/30);
    setTam(new PVector(50, 50));
    setDestruir(false);
    timer = 0.0;
    spawn = int(random(1,3));
    if(spawn == 2){
      setPos(new PVector(width, height/3));
    }
  }

  public void display() {
      image(imagen, this.posicion.x, this.posicion.y);
  }

  public void move() {
    timer += Time.getDeltaTime(frameRate);
    if (spawn == 1) {
      this.posicion.x += this.velocidad * Time.getDeltaTime(frameRate);
      this.posicion.y += (2.5 * sin(timer));
    } else {
      this.posicion.x -= this.velocidad * Time.getDeltaTime(frameRate);
      this.posicion.y += (2.5 * sin(timer));
    }
  }
}
