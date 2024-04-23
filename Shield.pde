class Shield{
  int x;
  int y;
  int w;
  int h;
  int brightness;
  
  //constructor
  Shield(int X, int Y){
    x = X;
    y = Y;
    w = 150;
    h = 75;
    brightness = 255;
  }
  
  void render(){
    fill(brightness,0,0);
    rect(x,y,w,h);    
    println(brightness);
  }
  
  void impact(){
   for(EBullet aebullet : ebulletList){
     if(aebullet.x < x+w/2 && aebullet.x > x-w/2
     && aebullet.y <y+h/2 && aebullet.y > y-h/2){
       println("ouch");
       brightness -=25;
       aebullet.used = true;
     }
  }
  
   for(Bullet abullet : bulletList){
     if(abullet.x < x+w/2 && abullet.x > x-w/2
     && abullet.y <y+h/2 && abullet.y > y-h/2){
       println("ouch");
       brightness -=25;
       abullet.used = true;
     }
  }

}//ends impact

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}//ends class
