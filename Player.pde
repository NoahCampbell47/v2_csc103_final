class Player{
boolean mleft;
boolean mright;
int x;
int y;
int speed;
int pWidth;
int pHeight;
int hitRadius;
int health;



Player(){
  pWidth = 150;
  pHeight = 75;
  hitRadius = pWidth/2;
  x = width/2;
  y = height-pHeight/2;
  speed = 10;
  mleft = false;
  mright = false;
  health = 100;
}

void pMotion(){
  if(mleft == true){
    x -= speed;
  }
  if(mright == true){
    x += speed;
  }
}



void render(){
  fill(100,200,255);
  //rect(x,y,pWidth,pHeight);
  image(playerIcon,x,y);
}

void hitDetector(){
   for(EBullet aebullet : ebulletList){
     if(aebullet.x < x+hitRadius && aebullet.x > x-hitRadius
     && aebullet.y >height-pHeight){
       //println("ouch");
       health -=25;
       aebullet.used = true;
     }
  }
  
     for(MBullet ambullet : mbulletList){
     if(ambullet.x < x+hitRadius && ambullet.x > x-hitRadius
     && ambullet.y >height-pHeight){
       //println("ouch");
       health = int(health*0.5);
       ambullet.used = true;
     }
  }
  
  
  
}//ends hit checker




















}//ends class
