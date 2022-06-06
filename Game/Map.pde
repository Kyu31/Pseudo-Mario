public class Map {
  ArrayList<Block> map;
  
  public Map(String filename) {
    File text = new File(filename);
    Scanner input = new Scanner(text);
    int rows = input.nextInt() - 2;
    int cols = input.nextInt();
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (input.nextChar() == 'f') {
          map.add(new Brick(null, c + 8 + (c * 16), height - (rows - r * 16));
        }
      }
    }
}
