public class Screen {
  String[] screens;
  int current = 0;
  
  public Screen() {
    screens = new String[9];
    screens[0] = "start";
    screens[1] = "clickedStart";
    screens[2] = "firstStart";
    screens[3] = "lvl1";
    screens[4] = "secondStart";
    screens[5] = "lvl2";
    screens[6] = "thirdStart";
    screens[7] = "lvl3";
    screens[8] = "end";
  }
  
  public void display() {
    if (current == 0) {
      PImage start = loadImage("Menus/Start.png");
      start.resize(800, 400);
      image(start, 400, 200);
      fill(0);
    } else if (current == 1) {
      PImage clickedStart = loadImage("Menus/ClickedStart.png");
      clickedStart.resize(800, 400);
      image(clickedStart, 400, 200);
      fill(0);
    } else if (current == 2) {
      PImage firstStart = loadImage("Menus/firstStart.png");
      firstStart.resize(800, 400);
      image(firstStart, 400, 200);
      fill(0);
      delay(15);
      current = 3;
    } else if (current == 4) {
      PImage secondStart = loadImage("Menus/secondStart.png");
      secondStart.resize(800, 400);
      image(secondStart, 400, 200);
      fill(0);
      delay(15);
      current = 5;
    } else if (current == 6) {
      PImage secondStart = loadImage("Menus/thirdStart.png");
      secondStart.resize(800, 400);
      image(secondStart, 400, 200);
      fill(0);
      delay(15);
      current = 7;
    }
  }
  
  
}
