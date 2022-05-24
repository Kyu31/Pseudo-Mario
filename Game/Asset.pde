public class Asset {
  String name;
  float x;
  float y;
  PImage texture;
  float[] hitbox;
  
  public void display() {
    
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
    
  }
}
