public class Asset {
  public String name;
  public float x;
  public  float y;
  public PImage texture;
  public boolean shouldDisplay = true;

  public Asset(String n, float xcor, float ycor, String img) {
    name = n;
    x = xcor;
    y = ycor; 
    texture = loadImage(img);
  }

  public void display() {
    if (shouldDisplay) {
      image(texture, x, y);
    }
  }
}
