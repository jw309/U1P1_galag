PImage ss1;
PImage bg;
PImage enemy1;

int bulletx=400;
int score=0;
int bullety=400;
int bulletx1=0;
int bullety1=0;
int bullet=100;
float sine=0;

float enemyx;
float enemyy;

boolean x=false;
boolean drawEnemy =true;
boolean y=true;
boolean z=true;

void setup()
{
  size(800, 800);
  ss1=loadImage("spaceship1.png");
  enemy1=loadImage("enemy1.png");
  bg=loadImage("br.jpg");
  enemyx=random(0, 750);
  enemyy=random(0, 400);
  bg.resize(800, 800);

}

void draw()
{
  background(bg);
  fill(#FFB529);
  ellipse(bulletx, bullety, 10, 20);
  //ellipse(bulletx1, bullety1, 10, 20);
  image(ss1, mouseX-25, mouseY-25, 50, 50);
   text("score : " + score, 100, 100);
   textSize(25);
  if(bullet<0) y=false;
  if(x&&y)
  {
   
    bullety=bullety-45;
    /*if(bullety<50){
      bullety1=bullety1-40;
    }
    else{
      bulletx1=mouseX; 
      bullety1=mouseY;
    }*/
    if((enemyx<bulletx&&bulletx<(enemyx+50)&&enemyy<bullety&&bullety<(enemyy+50))||(enemyx<bulletx1&&bulletx1<(enemyx+50)&&enemyy<bullety1&&bullety1<(enemyy+50))){ 
      x=false;
      //drawEnemy=false;
      enemyx=random(0, 750);
      enemyy=random(0, 400);
      score+=100;
    }
    else if(bullety<0)  x= false; 
    //else if(bullety1<0) x=false;
    
  }
  else  
  {
    bulletx=mouseX;
    bullety=mouseY;
    bulletx1=mouseX;
    bullety1=mouseY;
  }
  
  if(enemyx>800) enemyx=0;
  else  enemyx+=10;
  enemyy = enemyy+sin(sine)*15;
  sine+=0.3;
  if(drawEnemy)
  {
     image(enemy1, enemyx, enemyy, 70, 70);
  }
  if(bullet<=0) 
  {
      bullet=0; 
      drawEnemy=false;
      text("GAME OVER!! FINAL SCORE : " + score, 200, 400);
      //gameover(score); 
  }
  text("bullet left : " + bullet, 400, 100);
  /*if(enemyx<(mouseX)&&bulletx<(mouseX+50)&&enemyy<(mouseY)&&bullety<(mouseY+50))
  {
    z= false;
    text("Game Over", 400, 400);
  }*/
}

void keyPressed()
{
  if(key == 'a'||key == 'ㅁ')  x=true;  bullet--;
}
/*
void gameover(int sore)
{
   int i=0;
  for(i=1; i<50; i++)
  {
    text("GAME OVER!! FINAL SCORE : " + sore, 400, 400);
    
    textSize(i);
    delay(5);
  }
}*/
