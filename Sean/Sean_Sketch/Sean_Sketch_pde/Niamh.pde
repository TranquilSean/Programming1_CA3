void boxBorder()
{
  noFill(); 
  strokeWeight(lerpedAverage * 75);
  stroke(map(lerpedAverage, 0, 1, 0, 255), 255, 255);
  rect(width/2, height/1.5, 473-width/13, 473-width/13);
  fill(map(lerpedAverage, 0, .1, 0, 255), map(lerpedAverage, 0, .1, 0, 255), map(lerpedAverage, 0, .1, 0, 255));
}


void drawTree(float angle, float colour, float lenght)
{
  float l = lenght;
  float c = colour;
  theta = radians(angle);

  pushMatrix();
  //frameRate(100);
  stroke( c, 200, 220);
  strokeWeight(3);
  translate(width/2, height/1.2);
  line(0, 0, 0, -l);
  translate(0, -l);
  branch(l, c);
  popMatrix();
}

void branch(float h, float c) {
  h *= 0.75;

  strokeWeight(2);
  if (h < 20) {
    noStroke();
    fill(map(lerpedAverage, 0, 1, 0, 255), 255, 255);//greencolor
    ellipse(0, 0, h, h);
  } else {

    //println("Going to pushMatrix");
    pushMatrix(); // Save the current state of transformation (i.e. where are we now)
    stroke(c, 200, 220);
    strokeWeight(2);
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h, c);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    // Left Branch

    pushMatrix();
    stroke(c, 200, 220);
    strokeWeight(2);
    rotate(-theta);
    line(0, 0, 0, -h);  
    translate(0, -h);
    branch(h, c);
    popMatrix();
  }

}
