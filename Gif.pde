class Gif{
  //vars
  PImage[] versions;
  float speed;
  float size;
  float index;
  
  //constructor
  Gif(PImage[] tempVersions, float tempSPeed, float tempSize){
    versions = tempVersions;
    speed = tempSPeed;
    size = tempSize;
    index = 0;
  }
  
  void next() {
//to adjsut spped of animation (by putting a value less than one, so you can do it at a visible rate <40fps)
    index += speed;
//starts it over if index goes past end of list
    if (index >= versions.length) {
      index=0;
    }
  }//ends next function
  
  void render(int x, int y) {
    imageMode(CENTER);

    int versionIndex = int(index);
    PImage icn = versions[versionIndex];
    image(icn, x, y, icn.width*size, icn.height*size);

    next();
  }//ends render

  
  
  
  
  
  
  
  
  
  
  
  
  
  
}//ends gif class
