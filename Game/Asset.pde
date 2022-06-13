public class Asset {
  String name;
  float x;
  float y;
  float w;
  float h;
  Animation[] texture;

  public Asset(String n, float xcor, float ycor, float base, float length, int sets, String imagePrefix, int frames) {
    name = n;
    x = xcor;
    y = ycor;
    texture = new Animation[sets];
    texture[0] = new Animation(imagePrefix, frames, base, length);
    w = base;
    h = length;
  }

  public void display(int set) {
    w = texture[set].w;
    h = texture[set].h;
    texture[set].display(1, x, y);
  }

  public void display(int set, int delay) {
    w = texture[set].w;
    h = texture[set].h;
    texture[set].display(delay, x, y);
  }
}
