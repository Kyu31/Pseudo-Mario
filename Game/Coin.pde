public class Coin extends Collectable{
  
  public Coin(float x, float y){
    super(200, "coin", x, y, sizeUnit, sizeUnit, 1, "coin", 1);
  } 
  
  public void event(Player player) {
    player.numCoins++;
  }
}
