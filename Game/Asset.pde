public class Asset {
  String name;
  float x;
  float y;
  float w;
  float h;
  Animation texture;

  public Asset(String n, float xcor, float ycor, ArrayList<PImage> imgs, String startImg) {
    name = n;
    x = xcor;
    y = ycor;
    texture = new Animation(imgs, startImg);
    w = texture.images.get(texture.frame).width;
    h = texture.images.get(texture.frame).height;
  }

  public void display(int startFrame, int numFrames, int delay) {
    texture.display(startFrame, numFrames, delay, x, y);
  }
}
