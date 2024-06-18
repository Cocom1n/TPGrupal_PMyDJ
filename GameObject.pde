abstract class GameObject{
  protected PVector posicion;
  protected PVector tamanio;
  protected float velocidad;
  protected Boolean destruir;
  protected PImage imagen;
  
  
  public void setPos(PVector p){
    this.posicion = p;
  }
  public PVector getPos(){
    return this.posicion;
  }
  
  public void setTam(PVector t){
    this.tamanio = t;
  }
  public PVector getTam(){
    return this.tamanio;
  }
  
  public void setVel(float v) { 
    this.velocidad=v; 
  }
  public float getVel() { 
    return this.velocidad; 
  }
  
  public boolean getDestruir() {
    return destruir;
  }
  public void setDestruir(boolean valor) {
    destruir = valor;
  }
  
}
