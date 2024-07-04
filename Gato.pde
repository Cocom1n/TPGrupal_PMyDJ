class Gato extends GameObject{
  
  private SpriteGestor spriteGestor= new SpriteGestor();
  private int vida;
  private int puntaje;
  private boolean arriba,abajo, izqierda, derecha;
  
  public Gato(){
    setPos(new PVector(width/2-10,height/2));
    setTam(new PVector(52,56));
    setVel(5);
    this.imagen = loadImage("data/mira.png");
    vida=3;
    puntaje = 0;
  }
  
  public void display(){
    if(!jugando.powerup.getPowerOn()){
      spriteGestor.animate(getPos(),getTam(),"data/cat1.png");
    } else {
      spriteGestor.animate(getPos(),getTam(),"data/cat2.png");
    }
    
    image(imagen,mouseX,mouseY);
  }
  
  public void mover(){
    if (arriba) {
      if(getPos().y-getTam().y/2 >0){
        getPos().y -= getVel();
      }
      
    }
    if (abajo) {
      if(getPos().y+getTam().y+10 < height){
        getPos().y += getVel();
      }
    }
    if (izqierda) {
      if(getPos().x-getTam().x/2 > 0){
        getPos().x -= getVel();
      }
    }
    if (derecha) {
      if(getPos().x+getTam().x/2 < width){
        getPos().x += getVel();
      }
    }
  }
  
  public void quitarVida(){
    vida=vida-1;
  }
  
  public void reset(){
    puntaje = 0;
    vida=3;
    setPos(new PVector(width/2-10,height/2));
  }
  //------ Metodos Accesores -----// 
  
  /** devuelve la vida del jugador */
  public int getVida(){
    return this.vida; 
  }
  /** asigna la vida del jugador */
  public void setVida(int vida){
    this.vida=vida; 
  }
  
  public void setPuntaje(int puntaje){
    this.puntaje = puntaje;
  }
  
  public int getPuntaje(){
    return this.puntaje;
  }
}
