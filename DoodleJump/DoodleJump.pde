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
  pos.y = height-200;
  rectMode(CENTER);
  platList.add(new Platforms(200, 500));
  platList.add(new Platforms(400, 600));
  platList.add(new Platforms(400, 400));
  platList.add(new Platforms(400, 300));
  platList.add(new Platforms(500, 100));
  platList.add(new Platforms(500, 700));
  //generatePlatforms(3, 0);
  //generatePlatforms(3, 200);
  //generatePlatforms(3, 400);
  //generatePlatforms(3, 600);
  
  //for (int i = 0; i < platList.size(); i++) {
  //  for (int innerI = 0; innerI < platList.size(); innerI++) {
  //    //if ((platList.get(i).locality().x-playerLen*1.5 <= platList.get(innerI).locality().x+playerLen*1.5 && platList.get(i).locality().y-playerLen*0.5 <= platList.get(innerI).locality().y+playerLen*0.5 
  //    //&& platList.get(i).locality().y+playerLen*0.5 >= platList.get(innerI).locality().y-playerLen*0.5 && platList.get(i).locality().x+playerLen*1.5 <= platList.get(innerI).locality().x-playerLen*1.5)
      
  //    //)
      
      
      
  //    if (platList.get(i).locality().y-playerLen*0.5 >= platList.get(innerI).locality().y-playerLen*0.5 && platList.get(i).locality().x-playerLen*1.5 <= platList.get(innerI).locality().x+playerLen*1.5
  //    || ) 
      
  //    {
  //      platList.remove(innerI);
  //    }
  //  }
  //}
}


void draw() {
  background(255);


  fill(175);
  rectMode(CENTER);
  stroke(0);
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
  
  //for (int i = 0; i < platList.size(); i++) {
  //  for (int innerI = 0; innerI < platList.size(); innerI++) {
  //    if (isRectangleOverlap(platList.get(i).locality(), platList.get(innerI).locality())) {
  //      platList.remove(innerI);
  //    }
  //  }
  //}
  
  if (speed < -1) {
    movingUp();
  }
  
  System.out.println(speed);
  
  if (dir.y > 0  && speed > 11) {
    movingDown();
  }
  
  if (platList.get(platList.size()-1).locality().y > -100) {
    generatePlatforms( -200);
  }
  
  
}

//boolean isRectangleOverlap(PVector first, PVector second) {
//  float left1 = first.x-playerLen*1.5;
//  float right1 = left1+playerLen*3;
//  float top1 = first.y-playerLen*0.5;
//  float bottom1 = top1+playerLen;
  
//  float left2 = second.x-playerLen*1.5;
//  float right2 = left2+playerLen*3;
//  float top2 = second.y-playerLen*0.5;
//  float bottom2 = top2+playerLen;
  
//  return (left1 < right2 && right1 > left2 && top1 < bottom2 && bottom1 > top2);
//}



void generatePlatforms(int segment) {
  float randomx = random(0, width);
  float randomy = random(segment, segment+300);
  
  
  for (int i = 0; i < platList.size()-1; i++) {
    float left1 = randomx-playerLen*1.5;
    float right1 = left1+playerLen*3;
    float top1 = randomy-playerLen*0.5;
    float bottom1 = top1+playerLen;
  
    float left2 = platList.get(i).locality().x-playerLen*1.5;
    float right2 = left2+playerLen*3;
    float top2 = platList.get(i).locality().y-playerLen*0.5;
    float bottom2 = top2+playerLen;
    
    if (!(left1 < right2 && top1 > bottom2 && bottom1 < top2
    || right1 > left2 && top1 > bottom2 && bottom1 < top2
    || left1 < right2 && right1 > left2 && top1 > bottom2
    || left1 < right2 && right1 > left2 && bottom1 < top2))
    {
      platList.add(new Platforms(randomx, randomy));
    }
  }
}



void movingUp() {
  for(Platforms individual: platList) {
    individual.setLocality(individual.locality().x, individual.locality().y - speed*0.25);
  }
}

void movingDown() {
  for(Platforms individual: platList) {
    individual.setLocality(individual.locality().x, individual.locality().y + 1);
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
