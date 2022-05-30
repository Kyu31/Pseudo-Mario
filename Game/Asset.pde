public class Asset {
  public String name;
  public float x;
  public  float y;
  public PImage texture;

  public Asset(String n, float xcor, float ycor, String img) {
    name = n;
    x = xcor;
    y = ycor; 
    texture = loadImage(img);
  }

  public void display() {
    image(texture, x, y);
  }
}
