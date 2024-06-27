class SpawnerPower extends GameObject{
  /** Indica la lista de enemigos */
  private ArrayList <PowerUp> powerup;
  private boolean CrearPower;
  private boolean PowerOn;
  
   public SpawnerPower(){
    powerup =new ArrayList();
    powerup.add(new PowerUp());
    CrearPower = false;
    PowerOn=false;
    
  }
  
  public void colocarPowerUp() {
    for (int i = powerup.size() - 1; i >= 0; i--) {
      PowerUp power = powerup.get(i);
      power.display();
      println("powerUp is "+PowerOn);
    }
  }
  
   public void eliminarPowerUp(){
     for (int i = powerup.size() - 1; i >= 0; i--) {
      PowerUp power = powerup.get(i);
        if (Collider.colisionBlasPowerUp(jugando.disparar.balasJ, power)==true) {
          PowerOn=true;
        powerup.remove(i);
        println("Chau (=^+_+^=)");
        CrearPower = true;
      }
     }
     
   }
   public void crearPowerUp(){
      powerup.add(new PowerUp());
          println("Holi (=^._.^=)");
          CrearPower = false;
        }
        
    public boolean getCrearPower() {
    return this.CrearPower;
  }
  public void setCrearPower(boolean CrearPower) {
     this.CrearPower=CrearPower;
  }
   public boolean getPowerOn() {
    return this.PowerOn;
  }
  public void setPowerOn(boolean CrearPower) {
     this.PowerOn=CrearPower;
  }
}
