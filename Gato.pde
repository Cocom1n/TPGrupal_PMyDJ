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
    spriteGestor.animate(getPos(),getTam(),"data/cat1.png");
    image(imagen,mouseX,mouseY);
  }
  
  public void mover(){
    if (arriba) {
      getPos().y -= getVel();
    }
    if (abajo) {
      getPos().y += getVel();
    }
    if (izqierda) {
      getPos().x -= getVel();
    }
    if (derecha) {
      getPos().x += getVel();
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
