import processing.sound.*;
SoundFile shot;
SoundFile RT;
SoundFile IM;
SoundFile DOTF;
SoundFile youLose;
SoundFile youWin;
//the sound library link is in the slideshow from april 12

int state = 0;
//startscreen
Button startB;
//----------------------------------genral vars
Player p1;
ArrayList<Bullet> bulletList;
ArrayList<Alien> alienList;
ArrayList<Star> starList;
ArrayList<EBullet> ebulletList;
ArrayList<MBullet> mbulletList;
ArrayList<Shield> shieldList;
ArrayList<Mothership> mothershipList;


int overallSpeed;
int bulletSpeed;
int motherSpeed;

//alien motion, level globals
int alienSpeed;
int enemyFireRate;
int playerFireRate;

//alien icons
PImage tImage;
PImage [] alienIcons = new PImage[2];
Gif alienGif;
PImage motherIcon;
PImage playerIcon;
color green;

//timers, checkers
int trigger; //for restriciting from continouous fire to semiauto
int numAliens;

boolean state1Used = false;
boolean state2Used = false;
boolean state3Used = false;
boolean state4Used = false;
boolean state5Used = false;





void setup(){//     ------------------------------------------------------------- setup
  size(1920,1080); 
  background(100);
  textAlign(CENTER);
  rectMode(CENTER);
  startB = new Button(width/2, height/2, 500, 100, color(255,10,10));
  
  
  p1 = new Player();
  playerIcon = loadImage("player.png");
  playerIcon.resize(p1.pWidth, p1.pHeight);
  motherIcon = loadImage("mothership.png");
  motherIcon.resize(100,100);
  green = color(0,199,43);
  bulletList = new ArrayList<Bullet>();
  alienList = new ArrayList<Alien>();
  starList = new ArrayList<Star>();
  ebulletList = new ArrayList<EBullet>();
  mbulletList = new ArrayList<MBullet>();
  shieldList = new ArrayList<Shield>();
  mothershipList = new ArrayList<Mothership>();
  createAlienGrid(4,6,150, width/2, height/2);
  
  shot = new SoundFile(this, "shot.wav");
  RT = new SoundFile(this, "rollingThunder.mp3");
  IM = new SoundFile(this, "imperialMarch.mp3");
  DOTF = new SoundFile(this, "duelOfTheFates.mp3");
  youLose = new SoundFile(this, "losingSound.wav");
  youWin = new SoundFile(this, "winningSound.wav");
 
  //level globals
  alienSpeed = 3;
  motherSpeed = 15;
  enemyFireRate = 100000; //(the number for probability 5 out of it cnahnce each alien will shoot)
  playerFireRate = 500;   // number of milliseconds between shots
  
  bulletSpeed = 10;
  trigger = millis();
  
  //enemy gif
  imageMode(CENTER);
    for (int i=0; i<alienIcons.length; i++ ){
      alienIcons[i] = loadImage("alien" + i + ".png");
    }  
  alienGif = new Gif(alienIcons, 0.001, 4.0);  
  
  for(int i = 0; i<50; i++){
    starList.add(new Star( int(random(0,width)), int(random(0,height)), int(random(1,10)) ));
  }
  
  
  for(int i=0; i<4; i++){
    shieldList.add(new Shield( (i+1)*(width/5), height-150 ) );
  }
  
}//ends setup


void draw(){           //                                              --------------------------------------------------------draw
//println(state);

  if(state == 0){
        s0Draw();
  }//                                                                              endstate0-----------------------------------------
  
  if(state == 1){
     mainDraw();
     if(!IM.isPlaying()){
       IM.play();
     }
    if(alienList.size() == 0){//       levelup
        for (int i=shieldList.size()-1; i>=0; i--){
          shieldList.remove(i);
        }
        state = 2;
    }
      
    
  }//                                                ends state 1      --     --            --            --           --             --                -- 

if(state == 2){
   //text("lvl2", width/2, height/2);
   if(state2Used == false){
       createAlienGrid(7,5,100, width/2, height/2);
       p1.health = 100;
       p1.speed = 15;
       alienSpeed = 6;
       enemyFireRate = 50000;
       IM.pause();
         for(int i=0; i<3; i++){
           shieldList.add(new Shield( (i+1)*(width/4), height-150 ) );
         }
       state2Used = true;
   }//                                                           ends s2setup                      
   
   mainDraw();
    if(!DOTF.isPlaying()){
      DOTF.play();
    }
    
    if(alienList.size() == 0){//       levelup
        for (int i=shieldList.size()-1; i>=0; i--){
          shieldList.remove(i);
        }
        state = 3;
    }
   
 }//ends s2draw                                ----                           -------                      end2-------------                   ------------
 
 if(state == 3){
   //text("lvl3", width/2, height/2);
   if(state3Used == false){
     DOTF.pause();
     createAlienGrid(10,4,75, width/2, height/2);
     alienSpeed = 9;
     p1.health = 100;
     enemyFireRate = 30000;
     playerFireRate = 300;
     for(int i=0; i<2; i++){
           shieldList.add(new Shield( (i+1)*(width/3), height-150 ) );
         }
     mothershipList.add(new Mothership(0, 50));
     
     state3Used = true;
   }                                              //ends s3 setup
   

   
   
   mainDraw();
    if(!RT.isPlaying()){
      RT.play();
    }
    
   for(Mothership amothership : mothershipList){
     amothership.render();
     amothership.march();
     amothership.motherFire();
     amothership.shotDetector();
   }
   
    for (int i=mothershipList.size()-1; i>=0; i--){
     if (mothershipList.get(i).isAlive == false){
        mothershipList.remove(i); 
     }
  }
   
        if(alienList.size() == 0  &&   mothershipList.size() == 0){//       levelup
        for (int i=shieldList.size()-1; i>=0; i--){
          shieldList.remove(i);
        }
        state = 4;
    }
 }
                                            //---------------------------    end s3     ------------------------------------
 if(state == 4){
      background(0);
        for(Star astar : starList){
      astar.render();
    }
    fill(green);
   text("Congratulations! You Win!", width/2, height/2);
   if(!youWin.isPlaying()){
     youWin.play();
   }
 }
//                                           ---------                        end s4    ------------                   ----------                     -------------
 if(state == 5){
   background(0);
        for(Star astar : starList){
      astar.render();
    }
   textSize(75);
   fill(255,255,0);
   text("We have succeeded and Earth is Doomed.", width/2, height/2);
   text("Press 'H' to return Home.", width/2, height/2+150);
   if(state5Used == false){
   if(IM.isPlaying()){IM.pause();}
   if(DOTF.isPlaying()){DOTF.pause();}
   if(RT.isPlaying()){RT.pause();}
   state5Used = true;
   }
   if(!youLose.isPlaying()){
     youLose.play();
   }
   
 }//ends s5

}//ends draw                                            ------------------------------------------------------------------------------------------------------END DRAW

void keyPressed(){
  if (keyCode == LEFT){
    p1.mleft = true;
  }
  if(keyCode == RIGHT){
    p1.mright = true;
  }
  if(key == ' '){
    if( millis()-trigger>playerFireRate ){
    bulletList.add(new Bullet(p1.x, p1.y) );
    shot.play();
    trigger = millis();
    
    }
  }
  
  if(key == 'h' || key == 'H'){
    if(RT.isPlaying()){
      RT.pause();
    }
    if(youWin.isPlaying()){
      youWin.pause();
    }
    if(youLose.isPlaying()){
      youLose.pause();
    }
    state = 0;
    setup();
  }
}//end keypressed

void keyReleased(){
  if(keyCode == LEFT){
    p1.mleft = false;
  }
  if(keyCode == RIGHT){
    p1.mright = false;
  }
}//end keyrelease

void createAlienGrid(int columns, int rows, int gap, int xCenter, int yCenter){
  for(int j = 0; j<rows; j++){
  for(int i = 0; i<columns; i++ ){
    alienList.add(new Alien( xCenter-((gap*columns)/2)+(i*gap), yCenter-((gap*rows)/2)+(j*gap)) );
  }
  }  
}//ends grid

void mainDraw(){//                                                                                 main draw              - - - - - - -- - -- - - - - -- - 
    background(0);
     for(Star astar : starList){
      astar.render();
    }
    

  //player functions, followed by enhanced loops to operate arraylists in draw  
  p1.render();
  p1.pMotion();
  p1.hitDetector();
  for(Bullet abullet : bulletList){
    abullet.render();
    abullet.move();
    if(abullet.used == true){
    }
  }//ends bullet loop
  
  for(Alien aalien : alienList){
    aalien.render();
    aalien.shotDetector();
    aalien.march();
    alienGif.render(aalien.x, aalien.y);
    aalien.enemyFire();
  }
  
    for(EBullet aebullet : ebulletList){
    aebullet.render();
    aebullet.move();
    }//ends Ebullet loop
  
    for(MBullet ambullet : mbulletList){
    ambullet.render();
    ambullet.move();
    }//ends mbullet loop
                                            //removers
  for (int i=alienList.size()-1; i>=0; i--){
     if (alienList.get(i).isAlive == false){
        alienList.remove(i); 
     }
  }
  
  for (int i=bulletList.size()-1; i>=0; i--){
     if (bulletList.get(i).used == true){
        bulletList.remove(i); 
     } else if(bulletList.get(i).y<0){
       bulletList.remove(i);
     }
  }
  //println(bulletList.size());

  
   for (int i=ebulletList.size()-1; i>=0; i--){
     if (ebulletList.get(i).used == true){
        ebulletList.remove(i); 
     } else if(ebulletList.get(i).y>height){
       ebulletList.remove(i);
     }
  }
  
     for (int i=mbulletList.size()-1; i>=0; i--){
     if (mbulletList.get(i).used == true){
        mbulletList.remove(i); 
     } else if(mbulletList.get(i).y>height){
       mbulletList.remove(i);
     }
  }
  
  for (int i=shieldList.size()-1; i>=0; i--){
     if (shieldList.get(i).brightness<10){
        shieldList.remove(i); 
     }
  }
  
                                   //strength functions
  if(p1.health <1){
    state = 5;
  }
    fill(255);
    textSize(50);
    text("Health", width-350, 75);
    fill(green);
    rect(width-150, 50, 240, 90);
    fill(0);
    rect(width-150, 50, 220, 70);
    fill(green);
    rect(width-150, 50, p1.health*2, 50);
    
    for(Shield ashield : shieldList){
      ashield.render();
      ashield.impact();
    }
    
}//ends maindraw                               ------------------------------------------

void s0Draw(){
    background(0);
    for(Star astar : starList){
      astar.render();
    }

    //start button
    startB.render();
    fill(255);
    textSize(90);
    text("S T A R T", width/2, height/2+25 );
    if(startB.isPressed() == true){
      state = 1;
    }
    //other text
    fill(green);
    textSize(250);
    text("SPACE DEFENDER", width/2, 300);
    
    fill(0,2,200);
    textSize(30);
    text("A band of hostile alien invaders from the Andromeda galaxy have been causing chaos across the Milky Way, and are now", width/2, 700);
    text(" descending upon our solar system. You must destroy all aliens and their commander to save Earth. Arrows to move, spacebar to fire. Good Luck.", width/2, 750);
    

    
    //if(alienList.size() == 0){
    //  state = 1;
    //}
    
}
