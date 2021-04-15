void setup()
{
  size (512, 512);
  colorMode(HSB);
}

float y = 100;
float lerpedY = 100;

void draw()
{
  float c = map(mouseX, 0, width, 0, 255);
  background(c, 255, 255);
  
  float t = map(mouseX, 0, width, 0, 1);
  
  float x = lerp(100, 400, t);
  // a + (b-a) t
  
  fill(0);
  ellipse(x, height/2, 100, 100);
  
  ellipse(300, y, 60, 60);
  y += random(-5,5);
  
  ellipse(400, lerpedY, 60, 60);
  lerpedY = lerp(lerpedY, y, 0.1f);
}
