public class Player {
  public PVector pos;
  public PVector dir = new PVector(0, 0);
  
  public Player() {
    pos = new PVector((int)(w/2) * size, (int)(h/2) * size);
  }
  
  public PVector getPos() {
    return pos;
  }
  
  public PVector getDir() {
    return dir;
  }
  
  public void setDir(PVector newDir) {
    dir = newDir;
  }
  
  public void setDirX(int newDir) {
    dir.x = newDir;
  }
  
  public void setDirY(int newDir) {
    dir.y = newDir;
  }
  
  public void setPos(PVector newPos) {
    pos = newPos;
  }
  
  public void setPosX (int newPos) {
    pos.x = newPos;
  }
  
  public void setPosY(int newPos) {
    pos.y = newPos;
  }
  
  public void drawPlayer() {
    rect(pos.x, pos.y, 30, 30);
  }
}
