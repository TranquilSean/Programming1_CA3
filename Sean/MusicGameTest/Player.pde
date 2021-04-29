class Player {
  float px;
  float py;
  float pr;
  float pspeed = 5;

  Player(float xpos, float ypos, float radius, float speed) {

    px = xpos;
    py = ypos;
    pr = radius;
    pspeed = speed;
  }

  void display() {

    pushMatrix();
    //translate(width/4, height/2);
   // rotateX(40);
    fill(255);//green colour
    stroke(40, 200, 120);
    strokeWeight(4);
    line(px, py, px-pr/2, py);
    noStroke();
    fill(100, 200, 200);//green colour
   // ellipse(px, py, pr/2, pr/2);
    triangle( px-pr/3, py, px-pr/4, py-pr/2, px+pr/2, py);
    fill(100, 200, 150);//green colour
    triangle( px-pr/3, py, px-pr/2, py+pr/2, px+pr/2, py);
    popMatrix();
    
  }

  void move()
  {
    if (keyPressed)
    {
      if (key == 'd') { 
        Player.px += pspeed;
      }
      if (key == 'a') { 
        Player.px -= pspeed;
      }
      if (keyCode == LEFT) { 
        Player.px -= pspeed;
      }
      if (keyCode == RIGHT) { 
        Player.px += pspeed;
        ;
      }
    }
  }
  void collision() 
  {
    //===STOP SHIP GOING OFF SCREEN===
    if (py - pr/2< 0) 
    {
      py = pr/2;
    } else if (py + pr/2 > height) 
    {
      py = height-pr/2;
    } else if (px - pr/2 <= 0) {
      px = pr/2;
    } else if (px + pr/2 > width) 
    {
      px= width-pr/2;
    }
  }
}
