void intro() {
  background(18, 105, 252);
  intro.play();
  
  //gifs 
  image(gif[f], 0, 0, width, height); 
  f = f + 1; 
  if (f == frame) {
    f = 0; 
  }
  
  //game title 
  fill(255);
  textSize(110);
  textAlign(CENTER, CENTER);
  textFont(sunsetboulevard);
  text("BREAKOUT", 400, 230); 
  
  //start button 
  fill(255);
  rectTactile(420, 400, 200, 100); 
  strokeWeight(5);
  rect(420, 400, 200, 100);
  
  fill(0);
  textSize(40);
  textAlign(CENTER, CENTER);
  textFont(ariel);
  text("Start", 515, 445);
  
  
}


void introClicks() {
  //start button
  if (mouseX > 420 && mouseX < 620 && mouseY > 400 && mouseY < 500) {
    mode = GAME;
  }
  
}
