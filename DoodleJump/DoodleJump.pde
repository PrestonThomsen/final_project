PVector dir = new PVector(-1, 0);
PVector pos;
int spd = 20;
int gravFoll = 0;
int w, h;
int size = 40;
ArrayList<PVector> platPos = new ArrayList<PVector>();
int platLength = 50;



void setup() {
  size(600, 800);
  w = width/size;
  h = height/size;
  pos = new PVector((int)(w/2) * size, (int)(h/2) * size);
}

void createPlatform() {
  platPos.add(
}


void keyPressed() {
   if(keyCode == LEFT){
    dir.x = -1;
    dir.y = 0;
  }
  else if(keyCode == RIGHT){
    dir.x = 1;
    dir.y = 0;
  }
}
