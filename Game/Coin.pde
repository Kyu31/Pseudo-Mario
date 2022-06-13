public class Coin extends Collectable {

  public Coin(float x, float y) {
    super(200, "coin", x, y, sizeUnit, sizeUnit, 1, "coin", 1);
  }

  public boolean event(Player player) {
    if (!(player.sideColliding(this).equals("none"))) {
      player.points += value;
      player.numCoins++;
      return true;
    } else {
      return false;
    }
  }
}
