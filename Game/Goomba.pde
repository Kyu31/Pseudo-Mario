public class Goomba extends Enemy {
  public Goomba(float xcor, float ycor) {
    super("goomba", xcor, ycor, "Textures/goomba0000.png", 100);
    texture.addFrames("Textures/goomba0001.png", 1);
  }
}
