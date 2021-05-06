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
    _x = cx + sin(theta ) * width/2;
    _y = cy + cos(theta ) * height/3;

    line(x, y, _x + random(-1,1), _y);
    
  }
}

void drawTree(float sample, float colour, float lenght) 
{
  float a = sample;
  float l = lenght;
  float c = colour;
  theta = radians(a);
  stroke(c, 200, 220);
  strokeWeight(1);
  pushMatrix();
  translate(width/2, height/2 + 150);
  line(0, 0, 0, -l);
  translate(0, -l);
  branch(l, c);
  popMatrix();
  
}
void branch(float h, float c) {
  h *= 0.735;
  
  strokeWeight(1);
  if (h < 5) {
    noStroke();
    fill(160, random(180,220), random(180,220));//greencolor
    ellipse(0, 0, 5,5);
  } else {
    
    pushMatrix(); // Save the current state of transformation (i.e. where are we now)
    stroke(c, 200, 220);
    strokeWeight(1);
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h,c);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    // Left Branch
    
    pushMatrix();
    stroke(c, 200, 220);
    strokeWeight(2);
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h,c);
    popMatrix();
  }
}
