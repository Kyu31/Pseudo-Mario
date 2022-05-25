public class Asset {
  private String name;
  private float x;
  private float y;
  private PImage texture;

  public Asset(String n, float xcor, float ycor, String img) {
    name = n;
    x = xcor;
    y = ycor; 
    texture = loadImage(img);
  }

  public void display() {
    image(texture, x, y);
  }

  public String getName() {
    return name;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public int getWidth() {
    return texture.width;
  }

  public int getHeight() {
    return texture.height;
  }
  
  public PImage getTexture() {
    return texture;
  }

  public void setTexture(String img) {
    texture = loadImage(img);
  }
}
