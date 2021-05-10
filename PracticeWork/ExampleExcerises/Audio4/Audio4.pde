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
float x, y, theta;

void setup()
{
  size(512, 512, P2D);
  colorMode(HSB);
  rectMode(CENTER);
  minim = new Minim(this);
  player = minim.loadFile("Alive-Sia.mp3", width);
  //player.play();
  //ai = minim.getLineIn(Minim.MONO, width, 44100, 16);
  buffer = player.mix;
  lerpedBuffer = new float[buffer.size()];
  fft = new FFT(width, 44100);
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


    switch(mode) {
    case 0:  //Waveform

      line(i, height / 2 - s, height/2 + s, i);

      break;
    case 1: 

      line(i, height / 2 - s, i, height/2 + s); 

      break;
    case 2: //===Lines on Sides===

      line(i, height, i, height - s);     //bottom of screen
      line(i, 0, i, s);                  //top of screen
      line(width, i, width+s, i);         //rightside
      line(0, i, s, i);                   //leftside

      break;
    case 3: //===Circle===
      noStroke();
      fill(c2, 255, 255);
      ellipse(width/2, height/2, lerpedAverage * 1000, lerpedAverage * 1000);

      break;

    case 4:
      noFill();
      stroke(c2, 255, 255);
      rect(width/2, height/2, lerpedAverage * 1000, lerpedAverage * 1000);
      break;
    default: 
      ;
    }
  }

  if (mode == 5)
  {
    // === FFT=====
    fft.window(FFT.HAMMING);
    fft.forward(buffer);

    for (int i = 0; i < fft.specSize(); i ++)
    {
      float c3 = map(i, 0, fft.specSize(), 0, 255);   //colour
      stroke(c3, 255, 255);
      float sample = 5 + fft.getBand(i)*2;

      float theta = map(i, 0, fft.specSize(), 0, TWO_PI);   //Why? fft.specSize/2
      float r = 100;
      x = width/2 + sin(theta) * r;
      y = height/2 + cos(theta) * r;

      line(x, y - sample, x, y + sample);
    }
  }
}

void keyPressed()
{
  // Set the value of which based on which key was pressed
  if (keyCode >= '0' && keyCode <= '7')
  {
    mode = keyCode - '0';
  }
  if (keyCode == ' ')
  {
    if ( player.isPlaying() )
    {
      player.pause();
    } else
    {
      player.rewind();
      player.play();
    }
  }
}
