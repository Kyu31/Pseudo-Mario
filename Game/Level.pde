public class Level {
  ArrayList<Block> map;
  Player player;
  //ArrayList<Enemy> enemies;
  float[] start;
  float end; 

  public Level(ArrayList<Block> lvlmap, Player p1/*, ArrayList<Enemy> enemies*/, float[] startCoords, float endBoundary) {
    map = lvlmap;
    player = p1;
    //ArrayList<Enemy> enemies;
    start = startCoords;
    end = endBoundary;
  }

  public boolean isNearEdge() {
    return false;
  }

  public void scroll() {
  }
}
