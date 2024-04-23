class EBullet{

  //vars
  int x;
  int y;
  int speed;
  boolean used = false;
  
  //constructor
  EBullet(int startX, int startY){
    x = startX;
    y = startY;
    speed = bulletSpeed;
    rectMode(CENTER);
  }
  
  void render(){
    if (used == false){
      fill(0,0,255);
    rect(x,y,10,30);
  }
  }
  
  void move(){
    if (used == false){
    y +=speed;
    }
  }
  
  
  
  
  
}//ends bullet class
