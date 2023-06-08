int spd = 20;
int w, h;
int size = 40;
PVector pos;
float playerLen = 30;
PVector dir = new PVector(0, 0);
Player character = new Player();
ArrayList<Platforms> platList = new ArrayList<Platforms>();
float gravity = 0.1; 
float speed = 0;

void setup() {
  size(600, 800);
  pos.x = width/2;
  pos.y = height/2;
  platList.add(new Platforms(200, 500));
  platList.add(new Platforms(400, 600));
  platList.add(new Platforms(500, 100));
  platList.add(new Platforms(90, height-30));
}


void draw() {
  background(255);

  fill(175);
  stroke(0);
  rectMode(CENTER);
  rect(pos.x, pos.y, playerLen, playerLen);

  pos.y = pos.y + speed;
  speed = speed + gravity;
  if (speed >= 0) dir.y = -1;

  // If square reaches the bottom
  if (pos.y > height) {
    impact(height);
  }
  
  pos.x += dir.x;
  
  if (pos.x <= 0) {
    pos.x = width;
  }
  else if(pos.x >= width) {
    pos.x = 0;
  }
  
  
  
  for(Platforms individual: platList) {
    rect(individual.locality().x, individual.locality().y, individual.dimensions().x, individual.dimensions().y);
    /*
    Width:
    pos.x >= (individual.locality().x-playerLen*1.5) && pos.x <= (individual.locality().x+playerLen*1.5)
    
    Height:
    pos.y >= individual.locality().y -playerLen*1.5 && pos.y <= individual.locality().y +playerLen*1.5
    
    */
    
     if (pos.x+playerLen*0.5 >= (individual.locality().x-playerLen*1.5) && pos.x-playerLen*0.5 <= (individual.locality().x+playerLen*1.5)
      && pos.y+playerLen*0.5 >= individual.locality().y -playerLen*0.5 && pos.y+playerLen*0.5 <= individual.locality().y +playerLen*0.5
      && dir.y < 0) {
        impact(individual.locality().y-(playerLen*0.5));
        dir.y = 1;
      }
  }
  
  
  
  
}


void impact(float location) {
  speed = -8; //Jump Height
  dir.y = 1;
  pos.y = location-(playerLen*0.5);
}


void keyReleased() {
   if(keyCode == LEFT){
    dir.x = 0;
  }
  else if(keyCode == RIGHT){
    dir.x = 0;
  }
}

void keyPressed() {
   if(keyCode == LEFT){
    dir.x = -2;
  }
  else if(keyCode == RIGHT){
    dir.x = 2;
  }
}
