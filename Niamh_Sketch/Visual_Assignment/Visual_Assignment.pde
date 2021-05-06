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

Tree tr;

float lerpedAverage = 0;

float[] lerpedBuffer;

float x = 0;

void setup()
{
  size(512, 512);
  colorMode(HSB);
  minim = new Minim(this);
  player = minim.loadFile("still.mp3", width);
  player.play();
  buffer = player.mix;

  lerpedBuffer = new float[buffer.size()];
  tr = new Tree(20, 100, 100);
  tr.drawTree();
}



void draw()
{
   float sum = 0;
  for (int i = 0; i < buffer.size(); i ++)
  {
    sum += abs(buffer.get(i));
  }

  fill(map(lerpedAverage, 0, 1, 0, 255), 255, 255);
  float average = sum / buffer.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  background(0);
  float halfH = height / 2;
  
   
    noFill();
    strokeWeight(lerpedAverage * 75);
    stroke(map(lerpedAverage, 0, 1, 0, 255), 255, 255);
    //rectMode(CENTER);
    println(lerpedAverage);
    //rect(width / 13, height/13, lerpedAverage * width * 5, lerpedAverage * width * 5);
    rect(width/13, height/13, 473-width/13, 473-width/13);
    fill(map(lerpedAverage, 0, .1, 0, 255), map(lerpedAverage, 0, .1, 0, 255), map(lerpedAverage, 0, .1, 0, 255));
    tr.drawTree();
}
