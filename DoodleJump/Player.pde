public class Player {
  
  public Player() {
    pos = new PVector((int)(w/2) * size, (int)(h/2) * size);
  }
  
  
  public void drawPlayer() {
    rect(pos.x, pos.y, 30, 30);
  }
}
