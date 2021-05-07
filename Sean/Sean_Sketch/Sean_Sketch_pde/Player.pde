class Player 
{
  color c;
  PVector pos;
  PVector size;
  float speed;
  float l;
  boolean GoLeft, GoRight = false;

  Player( float xpos, float ypos, float w, float h, float s) 
  {
    pos = new PVector(xpos, ypos);
    size = new PVector(w, h);
    speed = s;
    l = w;
  }

  void update() 
  {
    display();
    move();
  }

  void display() 
  {
    stroke(0);
    fill(255);
    rect(pos.x, pos.y, size.x, size.y);

    if ( pos.x <= 0) 
    {
      pos.x= 0;
    }
    if (pos.x + l >width) 
    {
      pos.x = width - l;
    }
  }

  void move() 
  {
    if (GoLeft) pos.x -= 10;
    if (GoRight) pos.x += speed;
  }
}
