public class Map {
  ArrayList<Block> map = new ArrayList<Block>();
  String[] lines;
  int rows;
  int cols;

  public Map(String filename) {
    lines = loadStrings(filename);
    map = new ArrayList<Block>();
    map.add(new Castle(null, sizeUnit*2+sizeUnit/2, height-sizeUnit*4));
    int indexOfSpace = lines[0].indexOf(' ');
    rows = Integer.parseInt(lines[0].substring(0, indexOfSpace)) - 2;
    cols = Integer.parseInt(lines[0].substring(indexOfSpace + 1));
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (lines[r+1].charAt(c) == 'b') {
          map.add(new Brick(null, sizeUnit/2 + c*sizeUnit, height-rows*sizeUnit + (r-1)*sizeUnit));
        }
        if (lines[r+1].charAt(c) == 'f') {
          map.add(new Floor(sizeUnit/2 + c*sizeUnit, height-rows*sizeUnit + (r-1)*sizeUnit));
        }
      }
    }
  }
}
