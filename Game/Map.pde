public class Map {
  ArrayList<Block> map = new ArrayList<Block>();
  String[] lines;
  int rows = 0;
  int cols = 1600;
  
  public Map(String filename) {
    lines = loadStrings(filename);
    map = new ArrayList<Block>();
    map.add(new Castle(null, 40, 368-16*2));
    //map.add(new Flag(false, "flag", 800 - (5 * 16), 368-16*2));
    int indexOfSpace = lines[0].indexOf(' ');
    rows = Integer.parseInt(lines[0].substring(0, indexOfSpace)) - 2;
    cols = Integer.parseInt(lines[0].substring(indexOfSpace + 1));
    for (int r = 0; r <= rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (lines[r + 1].charAt(c) == 'b') {
          map.add(new Brick(null, c + 8 + (c * 15), 300 - (rows - (r + 2.5) * 16)));
        }
      }
    }
  }
}
