class SpriteGestor extends GameObject {
  
/** Declaracion de atributos */
  protected int xFrame; 
  protected int yFrame;
  protected int widthFrame;
  protected int heightFrame;     
  private float xFrameFloat;
  private float nextxFrameFloat;  
  private float velTransicion;
  
  /* Constructor por defecto */
  public SpriteGestor() {
   this.widthFrame=0;
   this.heightFrame=0;
   this.xFrame=0;
   this.yFrame=0;
   this.xFrameFloat=0;
   this.nextxFrameFloat=widthFrame;
   this.velTransicion=3;
  }
  
  public void animate(PVector pos, PVector tam, String imagen){
    imageMode(CENTER);
    PImage coso = loadImage(imagen);
    this.widthFrame=int(tam.x);
     this.heightFrame=int(tam.y);
    setTam(tam);
    image(coso.get(this.xFrame, yFrame, widthFrame, heightFrame), pos.x, pos.y);
    xFrameFloat+=(tam.x * velTransicion * Time.getDeltaTime(frameRate));
    if (xFrameFloat>=nextxFrameFloat) {
     this.xFrame+=tam.x;
     nextxFrameFloat=xFrame + tam.x;
     if (this.xFrame>=coso.width) {
       this.xFrame=0;
       this.xFrameFloat=0;
       this.nextxFrameFloat=tam.x;
       }
     }
  }
}
