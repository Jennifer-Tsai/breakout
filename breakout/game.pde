void game() {
  background(0);
  intro.play();
 
  
  //draw paddle 
  fill(0, 202, 255); 
  stroke(255); 
  circle(px, py, pd);

  //move paddle
  if (leftkey == true) {
    px = px - 5;
  }

  if (rightkey == true) {
    px = px + 5;
  }

  //paddle limits 
  if (px <= 60) {
    px = 60;
  }

  if (px >= 740) {
    px = 740;
  }

  //ball
  fill(142, 255, 246); 
  stroke(255);
  strokeWeight(5);
  circle(ballx, bally, balld); 
  if (timer < 0) {
  ballx = ballx + vx;
  bally = bally + vy;
  }
  timer = timer - 1; 

  if (bally > 585) {
    lives = lives - 1;
    loose.play();
    loose.rewind();
    ballx = 400;
    bally = 519;
    balld = 30; 
    timer = 100;
    vx = 5;
    vy = 1;
  }
  
  //bouncing
  if (bally < balld/2 || bally > height-balld/2) {
    vy = vy * -1;
  }

  if (ballx < balld/2 || ballx > width-balld/2) {
    vx = vx * -1;
  }

  //colliding
  if (dist(px, py, ballx, bally) <= pd/2 + balld/2) {
    paddle.play();
    paddle.rewind();
    vx = (ballx - px)/10;
    vy = (bally - py)/10;
  }
  if (bally == 519) {
    paddle.pause();
    
  }
   
  //ball limits 
  if (ballx <= 15) {
    ballx = 15;
  }

  if (ballx >= 785) {
    ballx = 785;
  }

  if (bally >= 585) {
    bally = 585;
  }

  //pause button
  fill(255);
  circle(80, 80, 100); 
  stroke(0);
  line(95, 60, 95, 105);
  line(65, 60, 65, 105); 

  //texts
  strokeWeight(5); 
  textSize(30); 
  text("Score: " + score, width/3.5, 40);
  text("Lives: " + lives, width/2, 40); 
  
  //while loops
  int i = 0; 
  while (i < n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i = i + 1;
  }
  
  //score
  if (score == 15) {
    mode = GAMEOVER;
  }
  
  //livess
  if (lives == 0) mode = GAMEOVER;
   
  if (mode == GAMEOVER) {
    lives = 3;
  }
 
}



void gameClicks() {
  if (dist(mouseX, mouseY, 80, 80) < 50) {
    mode = PAUSE;
    resetCircle();
    intro.pause();
    intro.rewind();
    fill(0);
    triangle(65, 60, 105, 85, 65, 115);
  } 

}


void manageBrick(int i) {
  if (y[i] == 130) {
    fill(0, 39, 247);
  }
  if (y[i] == 260) {
    fill(255);
  }
  if (y[i] == 390) {
  fill(9, 181, 188);
  }
  circle(x[i], y[i], brickd);
  if (dist(ballx, bally, x[i], y[i]) <= balld/2 + brickd/2) {
    score = score + 1;
    wall.play();
    wall.rewind();
    vx = (ballx - x[i])/10;
    vy = (bally - y[i])/10;
    alive[i] = false;
  }

}
  
