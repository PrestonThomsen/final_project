public class Platforms {
  public ArrayList<PVector> platPos = new ArrayList<PVector>();
  public int platLength = 50;
  public PVector location = new PVector();
  public boolean powerUp;
  public PVector dimension = new PVector();
  
  public Platforms(float xIn, float yIn) {
    location.x = xIn;
    location.y = yIn;
    dimension.x = playerLen*3;
    dimension.y = playerLen;
  }
  
  public Platforms(int x, int y, boolean status) {
    this(x, y);
    powerUp = status;
  }
  
  void setLocality(float inX) {
    location.x = inX;
  }
  
  void setLocality(float inX, float inY) {
    setLocality(inX);
    location.y = inY;
  }
  
  PVector locality() {
    return location;
  }
  
  PVector dimensions() {
    return dimension;
  }
  
  


}
