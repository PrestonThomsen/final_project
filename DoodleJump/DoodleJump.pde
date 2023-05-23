int spd = 20;
int w, h;
int size = 40;
Player character = new Player();



void setup() {
  size(600, 800);
  w = width/size;
  h = height/size;
}

void moving() {
  if ((character.getPos().x == 0 && character.getPos().x ==-1) || (character.getPos().x == width && character.getPos().x ==1)) {
    if (character.getPos().x == 0 && character.getPos().x ==-1) {
      character.getPos().x = width;
    }
    else if (character.getPos().x == 0 && character.getPos().x ==1) {
      character.getPos().x = 0;
    }
  }
}

void jumping() {
  
}

void keyPressed() {
   if(keyCode == LEFT){
    character.getDir().x = -1;
    character.getDir().y = 0;
  }
  else if(keyCode == RIGHT){
    character.getDir().x = 1;
    character.getDir().y = 0;
  }
}
