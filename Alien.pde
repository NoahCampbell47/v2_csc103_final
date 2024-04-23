class Alien{

boolean isAlive;
int x;
int y;
int killRadius;
int ebProb = 70;


Alien (int startX, int startY){
  x = startX;
  y = startY;
  rectMode(CENTER);
  isAlive = true;
  killRadius = 35;
}//ends constructor

void render(){
  if(isAlive == true){
    fill(0);
    //circle(x,y,50);
  }
}

void shotDetector(){
   for(Bullet abullet : bulletList){
     if(abullet.x < x+killRadius && abullet.x > x-killRadius
     && abullet.y < y+killRadius && abullet.y >y-killRadius){
       isAlive = false;
       //x = 5500;
       abullet.used = true;
     }
  }
}


void march(){
     x = x+alienSpeed;
    if(x<killRadius || x>width-killRadius && x<4000){
    alienSpeed = (alienSpeed*(-1));
  }
}

void enemyFire(){
  ebProb = int(random(0,enemyFireRate));
  if(ebProb <100){
    ebulletList.add(new EBullet(x,y));
  }
}


}//ends alien class
//galactic gargantua, death crab
