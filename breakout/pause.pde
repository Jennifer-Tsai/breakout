void pause() {
  fill(255); 
  textSize(60); 
  text("PAUSE", 400, 300); 
  
  
}


void pauseClicks() {
   if (dist(mouseX, mouseY, 100, 100) < 50) {
     mode = GAME;
   }
  
}
