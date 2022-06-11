public class Screen {
  String[] screens;
  int current = 0;
  
  public Screen() {
    screens = new String[3];
    screens[0] = "start";
    screens[1] = "level";
    screens[2] = "end";
  }
  
  public void switchScreen(String newScreen) {
    if (newScreen.equals("start")) {
      current = 0;
    } else if (newScreen.equals("level")) {
      current = 1;
    } else if (newScreen.equals("end")) {
      current = 2;
    }
  }
  
  /*public void display(int index) {
    if (
  }*/
  
  
}
