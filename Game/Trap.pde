public class Trap extends Block {
  public Trap(Collectable contains, float xcor, float ycor, float base, float length, int sets, String imagePrefix, int frames) {
    super(contains, false, true, "trap", xcor, ycor, base, length, sets, imagePrefix, frames);
  }
}
