class Enemigo3 extends GameObject{
   private SpriteGestor spriteGestor= new SpriteGestor();
   private int escala;
   private float a; // Coeficiente cuadrático de la parábola
   private float b; // Coeficiente lineal de la parábola
   private float c; // Altura máxima de la parábola (punto más alto
   private float x; // Tiempo inicial
   private float aumentoTiempo; // Incremento de tiempo
   private float y;
   private int lugarAparicion;
  
  public Enemigo3(){
    tamanio = (new PVector(50,50));
    velocidad = 1;
    escala= 20;
    a = 0.2;
    b = 0;
    c = 0;
    x = -11.5;
    aumentoTiempo = 0.09;
    y =0;
    lugarAparicion = 1;
  }
  
  public void display(){
    if(lugarAparicion==1){
      y = a * sq(x) + b * x + c;
      posicion = (new PVector(width/4+50 + x * escala, height-50 - y * escala));
      spriteGestor.animate(posicion,tamanio,"alien1.png");
    }
    if(lugarAparicion==2){
      y = a * sq(x) + b * x + c;
      posicion = (new PVector(width/2+150 - x * escala, height-50 - y * escala));
      spriteGestor.animate(posicion,tamanio,"alien1.png");
    }
    if(lugarAparicion==3){
      y = a * -sq(x) + b * x + c;
      posicion = (new PVector(width/4+50 + x * escala, height/4-50 - y * escala));
      spriteGestor.animate(posicion,tamanio,"alien1.png");
    }
    if(lugarAparicion==4){
      y = a * -sq(x) + b * x + c;
      posicion = (new PVector(width/2+150 - x * escala, height/4-50 - y * escala));
      spriteGestor.animate(posicion,tamanio,"alien1.png");
    }
    
  }
  
  void actualizar(){
    x += aumentoTiempo;
    if (x> 11.5){
      x=-11.5;
      lugarAparicion = int(random(1,5));
    }
  }
}
