public class Screen {
  String[] screens;
  int current = 0;

  public Screen() {
    screens = new String[10];
    screens[0] = "start";
    screens[1] = "clickedStart";
    screens[2] = "firstStart";
    screens[3] = "lvl1";
    //screens[4] = "secondStart";
    screens[4] = "lvl2";
    //screens[5] = "thirdStart";
    screens[5] = "lvl3";
    screens[6] = "won";
    screens[7] = "lost";
  }

  public void display() {
    Timer starttimer = new Timer();
    if (current == 0) {
      PImage start = loadImage("Menus/Start.png");
      start.resize(800, 400);
      image(start, 400, 200);
      fill(0);
    } else if (current == 1) {
      PImage clickedStart = loadImage("Menus/clickedStart.png");
      clickedStart.resize(800, 400);
      image(clickedStart, 400, 200);
      fill(0);
    } else if (current == 2) {
      PImage firstStart = loadImage("Menus/firstStart.png");
      firstStart.resize(800, 400);
      image(firstStart, 400, 200);
      fill(0);
      current++;
      /*} else if (current == 4) {
       PImage secondStart = loadImage("Menus/SecondStart.png");
       secondStart.resize(800, 400);
       image(secondStart, 400, 200);
       while (starttimer.countdown >= 0) {
       image(secondStart, 400, 200);
       starttimer.countdown--;
       fill(0);
       }
       starttimer.countdown = 3600;
       //current++;
       } else if (current == 6) {
       PImage thirdStart = loadImage("Menus/thirdStart.png");
       thirdStart.resize(800, 400);
       while (starttimer.countdown >= 0) {
       image(thirdStart, 400, 200);
       fill(0);
       starttimer.countdown--;
       }
       starttimer.countdown = 3600;
       current++;*/
    } else if (current == 6) {
      PImage won = loadImage("Menus/Won.png");
      won.resize(800, 400);
      image(won, 400, 200);
      fill(0);
    } else if (current == 7) {
      PImage lost = loadImage("Menus/Lost.png");
      lost.resize(800, 400);
      image(lost, 400, 200);
      fill(0);
    }
  }
}
