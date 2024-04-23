class Bullet{

  //vars
  int x;
  int y;
  int speed;
  boolean used = false;
  
  //constructor
  Bullet(int startX, int startY){
    x = startX;
    y = startY;
    speed = bulletSpeed;
    rectMode(CENTER);
  }
  
  void render(){
    if (used == false){
      fill(green);
    rect(x,y,10,30);
  }
  }
  
  void move(){
    if (used == false){
    y -=speed;
    }
  } 
  
  
  
}//ends bullet class
