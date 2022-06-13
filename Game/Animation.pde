public class Animation {
  ArrayList<PImage> images;
  int frame;
  float w;
  float h;
  int currentTime;

  Animation(String imagePrefix, int frames, float w, float h) {
    images = new ArrayList<PImage>();
    for (int i = 0; i < frames; i++) {
      String filename = "Textures/" + imagePrefix;
      if (frames > 1) { 
        filename += nf(i, 4);
      }
      filename += ".png";
      PImage newFrame = loadImage(filename);
      images.add(newFrame);
    }
    this.w = w;
    this.h = h;
    currentTime = 0;
  }

  void display(int delay, float x, float y) {
    if (currentTime == 0) {
      frame = (frame+1) % images.size();
    }
    currentTime = (currentTime+1) % delay;

    PImage currentFrame = images.get(frame);
    image(currentFrame, x, y, currentFrame.width, currentFrame.height);
  }
}
