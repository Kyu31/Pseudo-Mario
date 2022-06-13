public class Screen {
  String[] screens;
  int current = 0;
  
  public Screen() {
    screens = new String[10];
    screens[0] = "start";
    screens[1] = "clickedStart";
    screens[2] = "firstStart";
    screens[3] = "lvl1";
    screens[4] = "secondStart";
    screens[5] = "lvl2";
    screens[6] = "thirdStart";
    screens[7] = "lvl3";
    screens[8] = "won";
    screens[9] = "lost";
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
      current++;
    } else if (current == 4) {
      PImage secondStart = loadImage("Menus/secondStart.png");
      secondStart.resize(800, 400);
      delay(2000);
      image(secondStart, 400, 200);
      fill(0);
      //current++;
    } else if (current == 6) {
      PImage thirdStart = loadImage("Menus/thirdStart.png");
      delay(2000);
      thirdStart.resize(800, 400);
      image(thirdStart, 400, 200);
      fill(0);
      //current++;
    } else if (current == 8) {
      PImage won = loadImage("Menus/Won.png");
      won.resize(800, 400);
      image(won, 400, 200);
      fill(0);
    } else if (current == 9) {
      PImage lost = loadImage("Menus/Lost.png");
      lost.resize(800, 400);
      image(lost, 400, 200);
      fill(0);
    }
  }
}
