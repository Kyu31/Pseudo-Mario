public class Animation {
  ArrayList<PImage> images;
  int frame;
  int currentTime;

  Animation(ArrayList<PImage> imgs) {
    images = imgs;
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
    if(currentTime == 0){
    frame = (frame+1) % frames;
    }
    currentTime = (currentTime+1) % delay;

    image(images.get(frame + startFrame), x, y);
  }
}
