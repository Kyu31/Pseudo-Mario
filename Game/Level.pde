public class Level {
  //ArrayList<Block> map;
  Player player;
  //ArrayList<Enemy> enemies;

  public Level(/*ArrayList<Block> lvlmap,*/Player p1/*, ArrayList<Enemy> enemies*/) {
    //map = lvlmap;
    player = p1;
    //ArrayList<Enemy> enemies;
  }

  public boolean isNearEdge() {
    return false;
  }
  
  public void scroll() {
  }
}
