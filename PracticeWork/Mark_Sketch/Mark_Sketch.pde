import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
AudioBuffer buffer;
AudioInput ai;
FFT fft;

float lerpedAverage = 0;
float[] lerpedBuffer;
float[] lerpedFFT;
float x, y;
float theta = 0;
float speed = 0.02f;
float moveSpeed = 1;
float z = 0;

void setup()
{
   size(1000, 1000, P3D); //P3D needed for rendering 3D
  colorMode(HSB);
  rectMode(CENTER);
  minim = new Minim(this);
  player = minim.loadFile("La Dee Da.mp3", width);
  player.play();
  //ai = minim.getLineIn(Minim.MONO, width, 44100, 16);
  buffer = player.mix;
  lerpedBuffer = new float[buffer.size()];
  //fft = new FFT(width, 44100);
}

int mode = 0;

void draw()
{
  background(0);
  strokeWeight(1);

  //===Buffer===
  float sum = 0;
  for (int i = 0; i < buffer.size(); i ++)
  {
    sum += abs(buffer.get(i));
  }

  noStroke();
  float average = sum / buffer.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  float c2 = map(lerpedAverage, 0, 1, 0, 255);


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
      fill(c2, 255, 255);
      //ellipse(width/2, height/2, lerpedAverage * 1000, lerpedAverage * 1000);
      
  }
        pushMatrix();
      noFill();
      stroke(0, 255, 255);
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
  
  theta += speed;
  z -= moveSpeed;
}
