public class Asset {
  String name;
  float x;
  float y;
  float w;
  float h;
  Animation texture;

  public Asset(String n, float xcor, float ycor, String imgPrefix, int frames) {
    name = n;
    x = xcor;
    y = ycor;
    texture = new Animation(imgPrefix, frames);
    w = texture.images[texture.frame].width;
    h = texture.images[texture.frame].height;
  }

  public void display() {
    texture.display(x, y);
  }
}
