class Mothership{
  
int x;
int y;
int speed;
int mbProb = 70;
boolean isAlive = true;
int hits;

Mothership(int X, int Y){
  x = X;
  y = Y;
  speed = 15;
  int hits = 0;
}


void render(){
  image(motherIcon, x, y);
  //fill(255,255,0);
  //circle(x,y,50);
}

void march(){
     x = x+motherSpeed;
    if(x<0 || x>width){
    motherSpeed = (motherSpeed*(-1));
  }
}

void motherFire(){
  mbProb = int(random(0,500));
  if(mbProb <5){
    mbulletList.add(new MBullet(x,y));
  }
}


void shotDetector(){
   for(Bullet abullet : bulletList){
     if(abullet.x < x+50 && abullet.x > x-50
     && abullet.y < y+35 && abullet.y >y-35){
       if(motherSpeed>0){
          motherSpeed -=1;
       }
       else if(motherSpeed<0){
         motherSpeed +=1;
       }
       abullet.used = true;
       hits+=1;
     }//endsmain if
  }//ends blist
  
  if(hits>15){
    isAlive = false;
  }
}//ends sd


















}//ends class
