public class Goomba extends Enemy {
  public Goomba(float xcor, float ycor) {
    super("goomba", xcor, ycor, sizeUnit, sizeUnit, 2, "goomba", 2, 100);
    texture[1] = new Animation("goomba_death", 1, sizeUnit, sizeUnit);
  }


  public void hitBoundary(Level lvl) {
    if (x < w/2) {
      x = w/2;
      xSpeed = -xSpeed;
    }
    if (x > lvl.end-w/2) {
      x = lvl.end-w/2;
      xSpeed = -xSpeed;
    }
    if (y > height-h/2) {
      lives = 0;
    }
    
    for (Block block : lvl.map) {
      sideColliding = sideColliding(block);
      if (sideColliding.equals("bottom") && ySpeed >= 0) {
        isOnFloor = true;
        ySpeed = 0;
      }
      if (sideColliding.equals("top") && ySpeed <= 0) {
        ySpeed = 0;
      }
      if (sideColliding.equals("right") || sideColliding.equals("left")) {
        xSpeed = -xSpeed;
      }
      if (!sideColliding.equals("bottom") && ySpeed > 0) {
        isOnFloor = false;
      }
    }
  }
  
  public void display(){
    if(lives == 0){
      super.display(1);
    } else{
     super.display(0, 3); 
    }
  }
}
