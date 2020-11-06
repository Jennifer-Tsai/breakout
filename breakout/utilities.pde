void rectTactile(int x, int y, int w , int h) {
   if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
   fill(103, 207, 277);
  } else {
  fill(255);
  }
}

void resetCircle() {
  //for pause button 
  fill(255);
  circle(80, 80, 100);
  
}

void reset() {
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
  lives = 3;
  
  timer = 100;
  
  
}

//void manageBrick(int i) {
//  if (y[i] == 130) {
//    fill(0, 39, 247);
//  }
//  if (y[i] == 260) {
//    fill(255);
//  }
//  if (y[i] == 390) {
//  fill(9, 181, 188);
//  }
//  circle(x[i], y[i], brickd);
//  if (dist(ballx, bally, x[i], y[i]) <= balld/2 + brickd/2) {
//    score = score + 1;
//    vx = (ballx - x[i])/10;
//    vy = (bally - y[i])/10;
//    alive[i] = false;
//  }
//}

void arrayset() {
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
  
  
  
  
  
}
