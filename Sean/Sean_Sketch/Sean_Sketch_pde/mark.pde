void displaybackground01() {
  float c2 = map(lerpedAverage, 0, 1, 1, 255);
  
  for (int i = 0; i < buffer.size(); i ++)
  {
    float c = map(i, 0, buffer.size(), 0, 255);
    stroke(c, 255, 255);
    fill(c, 255, 255);
    lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
    float s = lerpedBuffer[i] * width;  //sample  1

    line(i, height, i, height - s);     //bottom of screen
    line(i, 0, i, s);                  //top of screen
    line(width, i, width+s, i);         //rightside
    line(0, i, s, i);                   //leftside

    noStroke();
    fill(c, 255, 255);
    ellipse(width/2, height/2, lerpedAverage * 1000, lerpedAverage * 1000);
  }
  pushMatrix();
  noFill();
  stroke(c2, 255, 255);
  strokeWeight(1);
  lights();
  translate(width/2, height/2); //set origin
  rotate(theta); //rotates around Z axis
  rotateY(theta);  //rotates around Y axis
  rotateX(theta);  //rotates around X axis
  sphere(lerpedAverage * 750); //draws sphere(radius);
  popMatrix();

  //Boxes
  pushMatrix(); //bottom left
  translate(width/6, height/1.2); // set origin give it (x, y, z)
  rotateZ(theta); //rotates around Z axis
  rotateY(theta);  //rotates around Y axis
  rotateX(theta);  //rotates around X axis
  box(50+ (lerpedAverage * 400)); //draws a 3D Cube (size);
  popMatrix();

  pushMatrix(); //top left
  translate(width/6, height/6); // set origin give it (x, y, z)
  rotateZ(theta); //rotates around Z axis
  rotateY(theta);  //rotates around Y axis
  rotateX(theta);  //rotates around X axis
  box(50+ (lerpedAverage * 400)); //draws a 3D Cube (size);
  popMatrix();

  pushMatrix();
  translate(width/1.2, height/6); // set origin give it (x, y, z)
  rotateZ(theta); //rotates around Z axis
  rotateY(theta);  //rotates around Y axis
  rotateX(theta);  //rotates around X axis
  box(50+ (lerpedAverage * 400)); //draws a 3D Cube (size);
  popMatrix();

  pushMatrix();
  translate(width/1.2, height/1.2); // set origin give it (x, y, z)
  rotateZ(theta); //rotates around Z axis
  rotateY(theta);  //rotates around Y axis
  rotateX(theta);  //rotates around X axis
  box(50+ (lerpedAverage * 400)); //draws a 3D Cube (size);
  popMatrix();

  theta += speed * lerpedAverage;
  z -= moveSpeed;
}
