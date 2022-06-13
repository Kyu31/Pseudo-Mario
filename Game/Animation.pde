public class Animation {
  ArrayList<PImage> images;
  int frame;
  float w;
  float h;
  int currentTime;

  Animation(ArrayList<PImage> imgs, String startImg) {
    images = imgs;
    imgs.add(loadImage("Textures/"+startImg+".png"));
    w = images.get(0).width;
    h = images.get(0).height;
    currentTime = 0;
  }

  void addFrames(String imagePrefix, int frames) {
    for (int i = 0; i < frames; i++) {
      String filename = "Textures/" + imagePrefix;
      if (frames > 1) { 
        filename += nf(i, 4);
      }
      filename += ".png";
      PImage newFrame = loadImage(filename);
      images.add(newFrame);
    }
  }

  void display(int startFrame, int frames, int delay, float x, float y) {
    if (currentTime == 0) {
      frame = (frame+1) % frames;
    }
    currentTime = (currentTime+1) % delay;

    PImage currentFrame = images.get(frame+startFrame);
    w = currentFrame.width;
    h = currentFrame.height;
    image(currentFrame, x, y, currentFrame.width, currentFrame.height);
  }
}
