public class Platforms {
  public ArrayList<PVector> platPos = new ArrayList<PVector>();
  public int platLength = 50;
  public ArrayList<boolean> powerUpPos = new ArrayList<boolean>;
  
  void createPlat(int index) {
    rect(platPos.get(index).x, platPos.get(index).y, platPos.get(index).x+60, platPos.get(index).y+20);
  }
  
  int numberOfPlatforms() {
    int randomHolding = (int) (Math.random() * 5);
    return randomHolding;
  }
  
  void populateList(int lowerY, int upperY) {
    
    for (int x = numberOfPlatforms(); x > 0; x--) {
      PVector locationHolding = new PVector(((int) ((upperY-lowerY)*Math.random())), ((int) (Math.random()*length)));
      holding.add(locationHolding);
    }
  }
  
  void powerUp() {
    
  }
  
  void populateWorld() {
    for (int i = 0; i < platPos.size(); i++) {
      createPlat(i);
    }
  }
  
  void theRunningMan() {
    for (int x = numberOfPlatforms(); x > 0; x--) {
      createPlat()
    }
  }


}
