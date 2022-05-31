public class Level {
  ArrayList<Block> map;
  Player player;
  //ArrayList<Enemy> enemies;
  float end; 

  public Level(ArrayList<Block> lvlmap, Player p1/*, ArrayList<Enemy> enemies*/) {
    map = lvlmap;
    player = p1;
    //ArrayList<Enemy> enemies;
    
    end = 800;
    //boundaries = new float[2];
    //boundaries[0] = 0;
    //for(Block block : map){
    // if(block.name.equals("Flag")){
    //   boundaries[1] = block.x + 100;
    // }
    //}
  }

  public boolean isNearEdge() {
    return false;
  }
  
  public void scroll() {
  }
}
