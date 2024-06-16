class Pescado extends GameObject{
  
  public Pescado(){
    this.imagen = loadImage("data/fish.png");
    setPos(new PVector(width/2,height/2));
    setTam(new PVector(212,212));
  }
  
  public void display(){
    //tengo que arreglar la imagen
    image(imagen.get(0,0,212,212),getPos().x, getPos().y, getTam().x,getTam().y);
  }
}
