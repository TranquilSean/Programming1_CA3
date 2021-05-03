class Ball 
{
  PVector pos;
  PVector vel;
  float r;

  Ball(float xpos, float ypos, float  radius ) 
  {
    pos = new PVector(xpos, ypos, 0); 
    vel = new PVector(2, -3);
    r = radius;
  }

  void update() 
  {
    display();
    move();
    checkEdges();
  }

  void display() {
    fill(255, 0, 255);
    noStroke();
    ellipse(pos.x, pos.y, r, r);
    translate(random(100, width-100),random(100, height-100));
    sphere(100);
    
  }

  void move() 
  {
    pos.add(vel); //Adding Velocity Vector to move Ball
  }

  void checkEdges()
  {
    if ((pos.x + r/2> width) || (pos.x - r/2 < 0)) //Ball Collides with sides
    { 
      vel.x *= -1;
      screenshake = 10;
    }
    if ( pos.y - r/2 < 0 || pos.y +r/2 > height) //Ball Collides with Top
    { 
      vel.y *= -1;
      screenshake = 10;
    }
  }
}
