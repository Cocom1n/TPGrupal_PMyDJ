class Gato extends GameObject{
  
  private SpriteGestor spriteGestor= new SpriteGestor();
  
  public Gato(){
    setPos(new PVector(width/2-10,height/2));
    setTam(new PVector(52,56));
  }
  
  public void display(){
    spriteGestor.animate(getPos(),getTam(),"data/cat1.png");
    
    //vector direcion hacia donde apuntaria el GATO
    PVector dire = PVector.sub(mira,player.getPos()).normalize();
    PVector vD = PVector.add(mira,dire);
    stroke(240, 197, 238);
    line(getPos().x,getPos().y,vD.x,vD.y);
  }
  
  public void mira(){
    
  }
  
  
}
