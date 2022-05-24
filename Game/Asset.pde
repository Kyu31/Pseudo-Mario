public class Asset {
  String name;
  float x;
  float y;
  PImage texture;
  float[] hitbox;
  
  Asset(String n, float xcor, float ycor, PImage img, float[] hits) {
    name = n;
    x = xcor;
    y = ycor; 
    texture = img; 
    hitbox = hits;
  }
  
  public void display() {
    image(texture, x, y);
  }
  
  public String getTheName() {
    return name;
  }
  
  public int getX() {
    return (int)x;
  }
  
  public int getY() {
    return (int)y;
  }
  
  public int getWidth() {
    return texture.width;
  }
  
  public int getHeight() {
    return texture.height;
  }
  
  public void setTexture(PImage img) {
    texture = img;
  }
}
