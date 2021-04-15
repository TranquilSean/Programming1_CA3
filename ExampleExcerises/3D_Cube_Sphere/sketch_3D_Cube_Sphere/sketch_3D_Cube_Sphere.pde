import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

void setup()
{
  size(500, 500, P3D); //P3D needed for rendering 3D
  
  minim = new Minim(this);
  ai = minim.getLineIn(Minim.MONO, 512, 44100, 16);
  ab = ai.mix;
}

float theta = 0;
float speed = 0.02f;
float moveSpeed = 1;

float lerpAverage;

float z = 0;

Minim minim;
AudioInput ai;
AudioBuffer ab;

void draw()
{
  float sum = 0;
  for (int i = 0; i< ab.size(); i++)
  {
    sum += abs(ab.get(i));
  }
  float average = sum / (float) ab.size();
  lerpAverage = lerp(lerpAverage, average, 0.1f);
  background(0);
  stroke(0, 0, 255);
  strokeWeight(1);
  noFill();
  lights();
  //rotate(HALF_PI);// PI = 180
  
  pushMatrix();
  translate(width/4, height/2, z); // set origin give it (x, y, z)
  rotateZ(theta); //rotates around Z axis
  rotateY(theta);  //rotates around Y axis
  rotateX(theta);  //rotates around X axis
  box(100+ (lerpAverage * 400)); //draws a 3D Cube (size);
  popMatrix();
  
  pushMatrix();
  translate(width/1.5, height/2); //set origin
  rotate(theta); //rotates around Z axis
  rotateY(theta);  //rotates around Y axis
  rotateX(theta);  //rotates around X axis
  sphere(50); //draws sphere(radius);
  popMatrix();
  
  theta += speed;
  z -= moveSpeed;
}
