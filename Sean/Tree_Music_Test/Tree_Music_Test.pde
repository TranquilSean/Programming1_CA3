import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
AudioBuffer buffer;

float lerpedAverage = 0;
float[] lerpedBuffer;
float x, y, theta;

void setup()
{
  size(1024, 1024, P3D);
  colorMode(HSB);
  rectMode(CENTER);
  
  minim = new Minim(this);
  player = minim.loadFile("Etherwood.mp3", width);
  player.play();
  buffer = player.mix;
  
  lerpedBuffer = new float[buffer.size()];
}

void draw()
{
  background(0);

  //===Buffer===
  float sum = 0;
  for (int i = 0; i < buffer.size(); i ++)
  {
    sum += abs(buffer.get(i));
  }
  
  float average = sum / buffer.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  
  //TREE CODE put into Draw
  float angle = map(lerpedAverage, 0, 1, 5, 90);
  float c = map(lerpedAverage, 0, 1, 1, 255);
  drawTree(angle,c, 150);

}

void keyPressed()
{
  if (keyCode == ' ')
  {
    if ( player.isPlaying() )
    {
      player.pause();
    } else
    {
      //player.rewind();
      player.play();
    }
  }
}
