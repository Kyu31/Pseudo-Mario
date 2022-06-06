public class Map {
  ArrayList<Block> map;
  BufferedReader reader;
  String line;
  
  public Map(String filename) {
    reader = createReader(filename);    
    try {
      line = reader.readLine();
      int indexOfSpace = line.indexOf(' ');
      int rows = Integer.parseInt(line.substring(0, indexOfSpace));
      int cols = Integer.parseInt(line.substring(indexOfSpace));
      for (int r = 0; r < rows; r++) {
        for (int c = 0; c < cols; c++) {
          if (reader.readLine().charAt(c) == 'f') {
            map.add(new Brick(null, c + 8 + (c * 16), height - (rows - r * 16)));
          }
        }
      }
    } catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line == null) {
      // Stop reading because of an error or file is empty
      noLoop();  
    } else {
      String[] pieces = split(line, TAB);
      int x = int(pieces[0]);
      int y = int(pieces[1]);
      point(x, y);
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
