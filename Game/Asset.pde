public class Asset {
  String name;
  float x;
  float y;
  float w;
  float h;
  PImage texture;

  public Asset(String n, float xcor, float ycor, String img) {
    name = n;
    x = xcor;
    y = ycor;
    texture = loadImage(img);
    w = texture.width;
    h = texture.height;
  }

  public void display() {
    image(texture, x,y);
  }
}
