class MBullet{

  //vars
  int x;
  int y;
  int speed;
  boolean used = false;
  
  //constructor
  MBullet(int startX, int startY){
    x = startX;
    y = startY;
    speed = 25;
    rectMode(CENTER);
  }
  
  void render(){
    if (used == false){
      fill(255,255,0);
    rect(x,y,10,30);
  }
  }
  
  void move(){
    if (used == false){
    y +=speed;
    }
  }
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}//ends bullet class
