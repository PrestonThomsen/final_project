int spd = 20;
int w, h;
int size = 40;
PVector pos;
Player character = new Player();



void setup() {
  size(600, 800);
  w = width/size;
  h = height/size;
}

void draw() {
  
  
}

void moving() {
  if ((character.getPos().x == 0 && character.getPos().x ==-1) || (character.getPos().x == width && character.getPos().x ==1)) {
    if (character.getPos().x == 0 && character.getPos().x ==-1) {
      character.setPosX(width);
    }
    else if (character.getPos().x == 0 && character.getPos().x ==1) {
      character.setPosX(0);
    }
  }
}

void jumping() {
  
}

void keyPressed() {
   if(keyCode == LEFT){
    character.setDirX(-1);
  }
  else if(keyCode == RIGHT){
    character.setDirX(1);
  }
}
