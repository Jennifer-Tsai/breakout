//Jennifer Tsai
//Breakout 
//1-2A
//Oct 27, 2020


//mode framework 
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;
final int UTILITIES = 5;
final int KEYBOARD = 6;

//entity variables 
float px, py, pd; //paddle
float ballx, bally, balld; //ball
float vx, vy; //ball velocity 

//keyboard variables
boolean leftkey;
boolean rightkey;

//score and lives
int score;
int lives; 

//arrays 
int[] x;
int[] y; 
int brickd; 
int n; //number of bricks 
int tempx;
int tempy; 
boolean[]alive;

//gifs
PImage [] gif;
int frame;
int f;

PImage [] gif2;
int frame2;
int f2;

//timer 
int timer;

//music
Minim minim;
AudioPlayer intro, paddle, wall, loose, fail, win;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//fonts
PFont sunsetboulevard;
PFont ariel; 


void setup() {
  size(800, 600,FX2D);
  mode = INTRO;
  
  //load animated gif
  frame = 15; 
  gif = new PImage[frame]; //how many frames u hv 
  int g = 0;
  while(g < 15) {
  gif[g] = loadImage("frame_"+g+"_delay-0.03s.gif");
  g = g + 1;
  }
  
  frame2 = 10; 
  gif2 = new PImage[frame2]; //how many frames u hv 
  int j = 0;
  while(j < 10) {
  gif2[j] = loadImage("light_"+j+"_delay-0.08s.gif");
  j = j + 1;
  }
  
  //timer 
  timer = 100;
  
  //paddle
  px = width/2;
  py = height;
  pd = 130;
  
  //ball
  ballx = width/2;
  bally = 519;
  balld = 30;
  
  //movements 
  vx = random(-5, 5);
  vy = random(-5, 5);
  
  //keyboard 
  leftkey = false;
  rightkey = false; 
  
  //score 
  score = 0;
  
  //lives
  lives = 3; 
  
  //arrays
  n = 15;
  x = new int[n]; 
  y = new int[n]; 
  alive = new boolean[n]; 
  brickd = 70; 
  
  tempx = 200;
  tempy = 130;
  
  int i = 0;
  while(i < n) {
  x[i] = tempx;
  y[i] = tempy;
  alive[i] = true; 
  tempx = tempx + 120;
  if (tempx == 800) { 
    tempy = tempy + 130;
    tempx = 200;
  } 
  i = i + 1;
  
  }
  
  //minim
  minim = new Minim(this);
  intro = minim.loadFile("intro.wav");
  paddle = minim.loadFile("paddle.wav");
  wall = minim.loadFile("wall.wav");
  loose = minim.loadFile("loose.wav");
  fail = minim.loadFile("failure.wav");
  win = minim.loadFile("win.wav");
  
  //font-bottom sentence 
  sunsetboulevard=createFont("Sunset Boulevard.otf", 110); 
  ariel=createFont("Ariel-Black", 40);
  
}



void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error : " + mode);
  }
    
  
}
