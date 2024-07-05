class Enemigo1 extends GameObject {
  private float timer;
  private int spawn;

  public Enemigo1() {
    setPos(new PVector(0, height/3));
    setVel(height/10);
    setTam(new PVector(110,47));
    setDestruir(false);
    timer = 0.0;
    spawn = int(random(1,3));
    if(spawn == 2){
      setPos(new PVector(width, height/3));
    }
  }

  public void display() {
    if(spawn == 1){
      spriteGestor.animate(getPos(),getTam(),"data/enemigo1.png");
    }else{
      spriteGestor.animate(getPos(),getTam(),"data/enemigo1Flip.png");
    }
  }

  public void move() {
    timer += Time.getDeltaTime(frameRate);
    if (spawn == 1) {
      this.posicion.x += this.velocidad * Time.getDeltaTime(frameRate);
      this.posicion.y += (2.5 * sin(timer));
      if(this.posicion.x >= width+50){
      this.setDestruir(true);
    }
    } else {
      this.posicion.x -= this.velocidad * Time.getDeltaTime(frameRate);
      this.posicion.y += (2.5 * sin(timer));
      if(this.posicion.x <= -50){
        this.setDestruir(true);
      }
    }
  }
  
  public int getSpawn(){
    return this.spawn;
  }
}
