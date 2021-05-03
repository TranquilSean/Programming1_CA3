// mouse over Buttons

boolean over(int x, int y, int w, int h) 
{
  if (  
    ( mouseX > x - w/2 ) && ( mouseX < ( x + w/2 ) ) && 
    ( mouseY > y- h/2) && ( mouseY < ( y + h/2 ) ) 
    )  return true;
  return false;
}

void draw_button() {
  b1x= width/2 -100; 
  b1y= height - 200; 
  b1w=80; 
  b1h=30;
  b2x=width/2 + 100; 
  b2y= height - 200; 
  b2w=80; 
  b2h=30;
  strokeWeight(1);
  // button 1
  if ( over(b1x, b1y, b1w, b1h) ) stroke(0, 200, 200);     // border color
  else                            stroke(200, 0, 200);
  if ( set1 )   fill(180, 200, 200);                           // status fill color
  else          fill(120, 200, 200);
  rect(b1x, b1y, b1w, b1h);
  // button 2
  if ( over(b2x, b2y, b2w, b2h) ) stroke(0, 200, 200);    
  else                            stroke(200, 0, 200);
  if ( set2 )   fill(180, 200, 200);                           
  else          fill(120, 200, 200);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Song 1", b1x - b1w/4, b1y + b1h/4);
  text("Song 2", b2x - b2w/4, b2y + b2h/4);
}

void play_only_one(int j ) {
  for ( int i = 0; i < playlist.length; i++ ) 
  {
    if ( ! playlist[i].isPlaying() && ( i == j ) ) 
    {
      playlist[i].loop();  // if not play, start this one
      println("start "+j);
      buffer=playlist[i].mix;
    } else playlist[i].pause();                                               // stop the rest
  }
}

void pause_only_one(int i ) 
{
  if ( playlist[i].isPlaying() ) 
  {
    playlist[i].pause();
    println("stop "+ i);
  }
}
