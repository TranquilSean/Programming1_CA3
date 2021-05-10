void makeBricks() 
{
  for (int row = 1; row < 8; row++) 
  {
    for (int col = 1; col < 10; col++)
    {
      pushMatrix();
      translate(112, 100);
      bricks.add(new Brick((col / 11.0) * width, (row / 8.0) * (height/2), 80, 40));
      popMatrix();
    }
  }
}

class Brick 
{
  PVector pos;
  PVector size;

  Brick (float _x, float _y, float _w, float _h) 
  {
    pos = new PVector(_x, _y);
    size = new PVector(_w, _h);
  }

  void update() 
  {
    drawBrick();
    float halfW = size.x/2;
    float halfL= size.y/2;
    float ballX = ball.pos.x;
    float ballY = ball.pos.y;



    if ( ballX > pos.x - halfW && ballX < pos.x + halfW && ballY > pos.y - halfL && ballY < pos.y + halfL) {
      bricks.remove(this);
      screenshake = 5;
      ball.vel.y *= -1;
    }
  }

  void drawBrick() 
  {     
      float c2 = map(player.pos.x, 0, width, 0, 255);
    fill(c2, 255, 255);
    rect(pos.x, pos.y, size.x, size.y);
  }
}
