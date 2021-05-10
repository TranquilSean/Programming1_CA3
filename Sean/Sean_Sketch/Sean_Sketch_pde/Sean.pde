float cx, cy;
float _x, _y;
float r = 150;
void lines(float _r2)
{

  cx = width/2;
  cy = height/2;
  float r2 = _r2;

  fill(0);
  noStroke();
  //rect(width/2, height/2, width, height);
  for (int i = 0; i < 360; i++)
  {
    theta = map(i, 0, 360, 0, TWO_PI);
    float c = map(i, 0, 360, 0, 255);
    strokeWeight(3);
    stroke(c, 255, 255);
    x = cx + sin(theta) * (r2);
    y = cy + cos(theta) * (r2);
    _x = cx + sin(theta ) * width/2.5;
    _y = cy + cos(theta ) * height/2.5;

    line(x, y, _x + random(-1, 1), _y);
  }
}
