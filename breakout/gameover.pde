void gameover() {
  background(56, 54, 255); 
  
  //gifs
  image(gif2[f2], 0, 0, width, height); 
  f2 = f2 + 1; 
  if (f2 == frame2) {
    f2 = 0; 
  }
  
  //win or loose text
  textSize(50);
  fill(255);
  if(score == 15) {
  textFont(sunsetboulevard);
  text("YOU WIN", 400, 250);
  win.play();
  
  } else {
   textFont(sunsetboulevard);
   text("YOU LOOSE", 400, 250);
   fail.play();
   
  }
  
  //back to intro 
  rectTactile(550, 450, 150, 70);
  stroke(0); 
  strokeWeight(5); 
  rect(550, 450, 150, 70);
  fill(0);
  textSize(40);
  textFont(ariel);
  text("Back", 625, 480); 
  
}


void gameoverClicks() {
  reset();
  arrayset();
  
  //back button
  if (mouseX > 550 && mouseX < 700 && mouseY > 450 && mouseY < 520) {
    mode = INTRO;
    intro.rewind();
   }

}
