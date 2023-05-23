public class Player {
  public int downMomentum = 0;
  public PVector pos;
  public PVector dir = new PVector(-1, 0);
  
  public Player() {
    pos = new PVector((int)(w/2) * size, (int)(h/2) * size);
  }
  
  public PVector getPos() {
    return pos;
  }
  
  public PVector getDir() {
    return dir;
  }
  
  public void setPos(PVector newPos) {
    pos = newPos;
  }
  
  public void drawPlayer() {
    rect(pos.x, pos.y, 30, 30);
  }
}
