class Enemigo3 extends GameObject{
   private SpriteGestor spriteGestor= new SpriteGestor();
   private int escala;
   private float a; // Coeficiente cuadrático de la parábola
   private float b; // Coeficiente lineal de la parábola
   private float c; // Altura máxima de la parábola (punto más alto
   private float x; // Tiempo inicial
   //private float aumentoTiempo; // Incremento de tiempo
   private float y;
   private int lugarAparicion;
  
  public Enemigo3(int lugarAparicion){
    this.lugarAparicion=lugarAparicion;
    posicion = (new PVector(0,0));
    tamanio = (new PVector(56,56));
    escala= 20;
    a = 0.2;
    b = 0;
    c = 0;
    x = -11.5;
    velocidad = 3;
    y =0;
  }
  
  public void display(){
    spriteGestor.animate(posicion,tamanio,"enemigo3.png");
  }
  
  void move(){
    if(lugarAparicion==1){
      y = a * sq(x) + b * x + c;
      posicion = (new PVector(width/4+50 + x * escala, height-50 - y * escala));
    }
    if(lugarAparicion==2){
      y = a * sq(x) + b * x + c;
      posicion = (new PVector(width/2+150 - x * escala, height-50 - y * escala));
    }
    if(lugarAparicion==3){
      y = a * -sq(x) + b * x + c;
      posicion = (new PVector(width/4+50 + x * escala, height/4-50 - y * escala));
    }
    if(lugarAparicion==4){
      y = a * -sq(x) + b * x + c;
      posicion = (new PVector(width/2+150 - x * escala, height/4-50 - y * escala));
    }
    x += velocidad * Time.getDeltaTime(frameRate);
  }
  
   public float getX(){
    return this.x;
  }
  public void setX(float x){
     this.x=x;
  }

  public float getY(){
    return this.y;
  }
  public void setY(float y){
     this.y=y;
  }
  
  public int getEscala(){
    return this.escala;
  }
  public void setEscala(int escala){
     this.escala=escala;
  }

}
