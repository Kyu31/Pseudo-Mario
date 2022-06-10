public class Collectable extends Asset {
  int value;
  
  Collectable(int vals, String n, float xcor, float ycor, float base, float length, String startImg) {
    super(n, xcor, ycor, base, length, new ArrayList<PImage>(), startImg);
    value = vals;
  }

  public void event(Level lvl, Player player) {
    player.points += value;
    //remove collectable from collectables list
  }
}
