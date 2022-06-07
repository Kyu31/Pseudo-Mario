public class Map {
  ArrayList<Block> map = new ArrayList<Block>();
  String[] lines;
  
  public Map(String filename) {
    lines = loadStrings(filename);
    map = new ArrayList<Block>();
    int indexOfSpace = lines[0].indexOf(' ');
    int rows = Integer.parseInt(lines[0].substring(0, indexOfSpace)) - 2;
    int cols = Integer.parseInt(lines[0].substring(indexOfSpace + 1));
    System.out.println(cols);
    for (int r = 0; r <= rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (lines[r + 1].charAt(c) == 'f') {
          System.out.println(lines[r + 1].length());
          map.add(new Brick(null, c + 8 + (c * 16), 300 - (rows - r * 16)));
        }
      }
    }
  }
}

//int rows = input.nextInt() - 2;
    //int cols = input.nextInt();
    //for (int r = 0; r < rows; r++) {
      //for (int c = 0; c < cols; c++) {
        //if (input.nextChar() == 'f') {
          //map.add(new Brick(null, c + 8 + (c * 16), height - (rows - r * 16)));
        //}
      //}
    //}
