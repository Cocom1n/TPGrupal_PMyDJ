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
     }
   }
   public void crearPowerUp(){
     powerUp.add(new PowerUp());
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
