public class Platforms {
  public ArrayList<ArrayList<PVector>> platPos = new ArrayList<ArrayList<PVector>>();
  public int platLength = 50;
  
  void createPlatform(int x, int y) {
    rect(x, y, x+60, y+20);
  }
  
  int numberOfPlatforms() {
    int randomHolding = (int) (Math.random() * 5);
    return randomHolding;
  }
  
  void populateList(int lowerY, int upperY) {
    
    for (int x = numberOfPlatforms(); x > 0; x--) {
      ArrayList holding = new ArrayList<PVector>;
      PVector locationHolding = new PVector(((int) ((upperY-lowerY)*Math.random())), ((int) (Math.random()*length)));
      if (Math.random()*2 ==0) int thing = -1;
        else int thing = 1;
      PVector dirrectionHolding = new PVector (thing, 0);
      platPos.add(locationHolding);
      platPos.add(dirrectionHolding);
    }
    
    
  }
  
  void theRunningMan() {
    for (int x = numberOfPlatforms(); x > 0; x--) {
      
    }
    
  }


}
