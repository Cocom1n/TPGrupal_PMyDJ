class Reproductor{
 
  public Reproductor(){
  }
  /** Metodo playSonido */
  public void playSonido(AudioPlayer sonido){
    if(!sonido.isPlaying()){
      sonido.setGain(-10);
      sonido.play(1);
    }
  }
  public void stopSonido(AudioPlayer sonido){
   sonido.pause(); 
  }
}
