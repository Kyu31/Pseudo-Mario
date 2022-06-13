public class Coin extends Collectable{
  
  public Coin(float x, float y){
    super(50, "coin", x, y, sizeUnit, sizeUnit, "Coin");
  } 
  
  public void event(Player player) {
    player.numCoins++;
  }
}
