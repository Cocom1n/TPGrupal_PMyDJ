class SpawnerPower extends GameObject{
  private ArrayList <PowerUp> powerUp;
  private boolean crearPower;
  private boolean powerOn;
  
  public SpawnerPower(){
    powerUp =new ArrayList();
    powerUp.add(new PowerUp());
    crearPower = false;
    powerOn=false;
  }
  
  public void colocarPowerUp() {
    for (int i = powerUp.size() - 1; i >= 0; i--) {
      PowerUp power = powerUp.get(i);
      power.display();
      //println("powerUp is "+powerOn);
    }
  }
  
  public void eliminarPowerUp(){
    for (int i = powerUp.size() - 1; i >= 0; i--) {
      PowerUp power = powerUp.get(i);
      if (Collider.colisionGatoPowerUp(jugando.player,power)){
        powerOn=true;
        powerUp.remove(i);
        crearPower = true;
      }
      //  if (Collider.colisionBlasPowerUp(jugando.disparar.balasJ, power)==true) {
      //    PowerOn=true;
      //  powerup.remove(i);
      //  println("Chau (=^+_+^=)");
      //  CrearPower = true;
      //}
     }
   }
   public void crearPowerUp(){
     powerUp.add(new PowerUp());
     println("Aparecio un PowerUp (=^._.^=)");
     crearPower = false;
   }
        
    public boolean getCrearPower() {
    return this.crearPower;
  }
  public void setCrearPower(boolean crearPower) {
     this.crearPower=crearPower;
  }
   public boolean getPowerOn() {
    return this.powerOn;
  }
  public void setPowerOn(boolean crearPower) {
     this.powerOn=crearPower;
  }
}
