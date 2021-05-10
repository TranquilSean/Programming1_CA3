class Ball 
{
  PVector pos;
  PVector vel;
  float r;

  Ball(float xpos, float ypos, float  radius ) 
  {
    pos = new PVector(xpos, ypos); 
    vel = new PVector(3, 3);
    r = radius;
  }

  void update() 
  {
    display();
    move();
    checkEdges();
  }

  void display() {
    fill(0, 255,255);
    ellipse(pos.x, pos.y, r, r);
  }

  void move() 
  {
    pos.add(vel); //Adding Velocity Vector to move Ball
  }

  void checkEdges()
  {
    if ((pos.x + 5 > width) || (pos.x - 5 < 0)) //Ball Collides with sides
    { 
      vel.x *= -1;
    }
    if ( pos.y - 5 < 0) //Ball Collides with Top
    { 
      vel.y *= -1;
    }
    if ( pos.y > height) //Ball Goes off Screen
    { 
      vel.y *= -1;
      fill(255, 0, 0); 
      screenshake = 10;
      pos.x = random(20, width-20);
      pos.y = 20;
    }

    if ( pos.x > player.pos.x - player.l/2 && pos.x < player.pos.x + player.l/2  && pos.y > player.pos.y - player.h/2)
    {
      vel.y *= -1;
    }
  }
}
