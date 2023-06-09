int spd = 20;
int w, h;
int size = 40;
PVector pos;
float playerLen = 40;
PVector dir = new PVector(0, 0);
Player character = new Player();
ArrayList<Platforms> platList = new ArrayList<Platforms>();
float gravity = 0.1; 
float speed = 0;
boolean floorIsLava = false;
boolean dead = false;
PImage doodleR;
PImage doodleL;
PImage backdrop;
int direction;
int score;

void died() {
  if (dead) {
    platList = new ArrayList<Platforms>();
    pos.x = width/2;
    pos.y = height-200;
    score = 0;
    rectMode(CENTER);
    platList.add(0, new Platforms(width/2, height));
    platList.add(0, new Platforms(100, 700));
    platList.add(0, new Platforms(350, 550));
    platList.add(0, new Platforms(500, 350));
    platList.add(0, new Platforms(200, 200));
    platList.add(0, new Platforms(410, 80));
    //for (int i = 0; i < height/10 + 3; i++) {
    //  if (random(0,5) == 0) {
    //    generatePlatforms(i*10);
    //  }
    //}
    dead = false;
  }
}

void setup() {
  size(600, 800);
  pos.x = width/2;
  pos.y = height-200;
  rectMode(CENTER);
  platList.add(0, new Platforms(width/2, height));
  platList.add(0, new Platforms(100, 700));
  platList.add(0, new Platforms(350, 550));
  platList.add(0, new Platforms(500, 350));
  platList.add(0, new Platforms(200, 200));
  platList.add(0, new Platforms(410, 80));
  doodleR = loadImage("pngwing.com.png");
  doodleL = loadImage("pngwing.com left.png");
  backdrop = loadImage("ScreenShot.png");
}


void draw() {
  background(backdrop);
  fill(128, 0, 0);
  textSize(30);
  int scoreSize = 130;
  if (score >= 99) scoreSize = 150;
  text("Score: "+score, scoreSize, 45);
  fill(175);
  rectMode(CENTER);
  stroke(0);
  if (direction < 0) {
    image(doodleL, pos.x, pos.y, playerLen, playerLen);
  }
  else image(doodleR, pos.x, pos.y, playerLen, playerLen);

  pos.y = pos.y + speed;
  speed = speed + gravity;
  if (speed >= 0) dir.y = -1;
  
  if (pos.y > height && floorIsLava) {
    dead = true;
  }
  died();
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
    if (individual.specialGive()) {
      fill(100, 0, 0);
      rect(individual.locality().x, individual.locality().y, individual.dimensions().x, individual.dimensions().y);
    }
    else rect(individual.locality().x, individual.locality().y, individual.dimensions().x, individual.dimensions().y);
    /*
    Width:
    pos.x >= (individual.locality().x-playerLen*1.5) && pos.x <= (individual.locality().x+playerLen*1.5)
    
    Height:
    pos.y >= individual.locality().y -playerLen*1.5 && pos.y <= individual.locality().y +playerLen*1.5
    
    */
    
     if (pos.x+playerLen*0.5 >= (individual.locality().x-playerLen*1.5) && pos.x-playerLen*0.5 <= (individual.locality().x+playerLen*1.5)
      && pos.y+playerLen*0.5 >= individual.locality().y -playerLen*0.5 && pos.y+playerLen*0.5 <= individual.locality().y +playerLen*0.5
      && dir.y < 0) {
        if (individual.specialGive()) speed = -100;
        impact(individual.locality().y-(playerLen*0.5));
        dir.y = 1;
      }
  }
  
  //if (speed < 0) {
  //  movingUp();
  //}
  
  if (pos.y < 400) {
    for(Platforms individual: platList) {
      individual.setLocality(individual.locality().x, individual.locality().y - (pos.y-400)*0.01);
    }
  }
  
  if (dir.y > 0  && pos.y < 400) {
    movingDown();
  }
  
  if ((platList.get(0).locality().y > -30)) {
    platList.add(0, new Platforms(random(0, width), -120));
  }

  clearTheOld();
}

void generatePlatforms(int segment) {
  float randomx = random(0, width);
  platList.add(0, new Platforms(randomx, segment));
}

void clearTheOld() {
  for (int i = 0; i < platList.size()-1; i++) {
    if (platList.get(i).locality().y >= 900) {
      platList.remove(i);
    }
  }
  if (!floorIsLava) floorIsLava = true;
}

void movingUp() {
  for(Platforms individual: platList) {
    individual.setLocality(individual.locality().x, individual.locality().y - speed);
    speed = 0;
  }
}

void movingDown() {
  for(Platforms individual: platList) {
    individual.setLocality(individual.locality().x, individual.locality().y + 1);
  }
}


void impact(float location) {
  speed = -6; //Jump Height
  dir.y = 1;
  pos.y = location-(playerLen*0.5);
  score++;
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
    direction = -2;
  }
  else if(keyCode == RIGHT){
    dir.x = 2;
    direction = 2;
  }
}
