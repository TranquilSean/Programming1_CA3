class Player 
{
  color c;
  PVector pos;
  PVector size;
  float speed;
  float l, h;
  boolean GoLeft, GoRight = false;

  Player( float xpos, float ypos, float _w, float _h, float s) 
  {
    pos = new PVector(xpos, ypos);
    speed = s;
    l = _w;
    h = _h;
    size = new PVector(l, h);
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
    
    if ( pos.x - l/2 <= 0) 
    {
      pos.x= l/2;
    }
    if (pos.x + l/2 >width) 
    {
      pos.x = width - l/2;
    }
  }

  void move() 
  {
    if (GoLeft) pos.x -= 10;
    if (GoRight) pos.x += speed;
  }
}
