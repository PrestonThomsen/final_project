public class Platforms {
  public ArrayList<PVector> platPos = new ArrayList<PVector>();
  public int platLength = 50;
  public PVector location = new PVector();
  public boolean powerUp;
  public PVector dimension = new PVector();
  
  public Platforms(float xIn, int yIn) {
    location.x = xIn;
    location.y = yIn;
    dimension.x = playerLen*3;
    dimension.y = playerLen;
  }
  
  public Platforms(int x, int y, boolean status) {
    this(x, y);
    powerUp = status;
  }
  
  PVector locality() {
    return location;
  }
  
  PVector dimensions() {
    return dimension;
  }
  
  


}
