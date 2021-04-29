void makeBricks() 
{
    for (int row = 1; row < 8; row++) 
    {
      for (int col = 1; col < 10; col++)
      {
        pushMatrix();
        translate(112, 100);
        bricks.add(new Brick((col / 11.0) * width, (row / 8.0) * (height/2),80, 40));
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
    if ( ball.pos.x > pos.x && ball.pos.x < pos.x + size.x && ball.pos.y > pos.y && ball.pos.y < pos.y + size.y) {
      bricks.remove(this);
    }
  }

  void drawBrick() 
  {    
    noFill();
    stroke(255);
    rect(pos.x, pos.y, size.x, size.y);
  }
}
