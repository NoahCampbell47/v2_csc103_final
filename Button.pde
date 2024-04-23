class Button{
  
  int x;
  int y;
  int w;
  int h;
  color c;
  
  Button(int xpos, int ypos, int bWidth,int bHeight, color bColor){
    x = xpos; 
    y = ypos;
    w = bWidth;
    h = bHeight;
    c = bColor;
  }
  
  void render(){
    fill(color(c));
   rectMode(CENTER);
   rect(x,y,w,h);
  }
  
  boolean isPressed(){
   if(mousePressed == true &&   mouseX>(x-(w/2))  &&  mouseX<(x+(w/2))   &&  mouseY>(y-(h/2))  &&  mouseY<(y+(h/2))     ){
     return(true);
   }
   else{
     return(false);
   }
  }
  

  
  
}//ends button class
