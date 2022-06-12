public class Screen {
  String[] screens;
  int current = 0;
  
  public Screen() {
    screens = new String[5];
    screens[0] = "start";
    screens[1] = "clickedStart";
    screens[2] = "secondStart";
    screens[3] = "level";
    screens[4] = "end";
  }
  
  public void switchScreen(String newScreen) {
    if (newScreen.equals("start")) {
      current = 0;
    } else if (newScreen.equals("clickedStart")) {
      current = 1;
    } else if (newScreen.equals("secondStart")) {
      current = 2;
    } else if (newScreen.equals("level")) {
      current = 3;
    } else if (newScreen.equals("end")) {
      current = 4;
    }
  }
  
  public void display() {
    if (current == 0) {
      PImage start = loadImage("Start.png");
      start.resize(800, 400);
      image(start, 400, 200);
      fill(0);
    } else if (current == 1) {
      PImage clickedStart = loadImage("ClickedStart.png");
      clickedStart.resize(800, 400);
      image(clickedStart, 400, 200);
      fill(0);
    } else if (current == 2) {
      PImage secondStart = loadImage("SecondStart.png");
      secondStart.resize(800, 400);
      image(secondStart, 400, 200);
      fill(0);
    }
  }
  
  
}
