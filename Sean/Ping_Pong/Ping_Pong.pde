ArrayList <Brick> bricks = new ArrayList <Brick>();
Ball ball;
Player player;

int lives = 5;
float screenshake;

void setup() 
{
  size(1024, 800);
  background(55);

  player= new Player( width/2, height-20, 60, 10, 5);
  ball = new Ball (width/2, height/2.5, 10);
  makeBricks();
}

void draw() 
{
  background(55);
  //noStroke();
  fill(0, 60);

  screenShake();
  player.update();
  ball.update();
  for (int i = 0; i < bricks.size(); i++) 
  {
    stroke(255);
    bricks.get(i).update();
  }
}


void screenShake () 
{ 
  translate(random(-screenshake, screenshake), random(-screenshake, screenshake));
  screenshake *= 0.9;
}

void keyPressed() 
{
  if (key == 'a') 
  { 
    player.GoLeft = true;
  }
  if (key == 'd') { 
    player.GoRight = true;
  }
}
void keyReleased() 
{
  if (key == 'a') 
  { 
    player.GoLeft = false;
  }
  if (key == 'd')
  { 
    player.GoRight = false;
  }
}
