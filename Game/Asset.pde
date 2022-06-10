public class Asset {
  String name;
  float x;
  float y;
  float w;
  float h;
  Animation texture;

  public Asset(String n, float xcor, float ycor, float base, float length, ArrayList<PImage> imgs, String startImg) {
    name = n;
    x = xcor;
    y = ycor;
    texture = new Animation(imgs, startImg);
    w = base;
    h = length;
  }
  
  public void display(int startFrame, int numFrames) {
    texture.display(startFrame, numFrames, 1, x, y, w, h);
  }

  public void display(int startFrame, int numFrames, int delay) {
    texture.display(startFrame, numFrames, delay, x, y, w, h);
  }
}
