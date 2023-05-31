int spd = 20;
int w, h;
int size = 40;
PVector pos;
PVector dir = new PVector(0, 0);
Player character = new Player();



void setup() {
  size(600, 800);
  w = width/size;
  h = height/size;
}

void draw() {
  
  
}

void moving() {
  if ((pos.x == 0 && pos.x ==-1) || (pos.x == width && pos.x ==1)) {
    if (pos.x == 0 && pos.x ==-1) {
      pos.x = width;
    }
    else if (pos.x == 0 && pos.x ==1) {
      pos.x= 0;
    }
  }
}

void jumping() {
  
}

void keyPressed() {
   if(keyCode == LEFT){
    dir.x = -1;
  }
  else if(keyCode == RIGHT){
    dir.x = 1;
  }
}
