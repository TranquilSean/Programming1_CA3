import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


Ball ball;

int mode = 0;
int lives = 5;
float screenshake;
float hue;
Minim minim;
AudioPlayer song;
AudioPlayer[] playlist;
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

boolean pause = true;
//===BUTTON===
int b1x, b1y, b1w, b1h;
int b2x, b2y, b2w, b2h;
boolean set2 = false;
boolean set1 = false;
void setup()
{
  size(1024, 1024, P3D); //P3D needed for rendering 3D
  colorMode(HSB);
  rectMode(CENTER);
  minim = new Minim(this);
  playlist = new AudioPlayer[2];
  playlist[0] = minim.loadFile("song1.mp3");
  playlist[1] = minim.loadFile("song2.mp3");
  for ( int i = 0; i < playlist.length; i++ ) {
    playlist[i].loop();
    playlist[i].pause();
    buffer = playlist[i].mix;
  }
  lerpedBuffer = new float[buffer.size()];

  fft = new FFT(width, 44100);

  ball = new Ball (width/2, height/2.5, 100);
}


void draw()
{
  background(0);
  strokeWeight(1);

  draw_button();

  //===Buffer===
  float sum = 0;
  for (int i = 0; i < buffer.size(); i ++)
  {
    sum += abs(buffer.get(i));
  }
  float average = sum / buffer.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  float c = map(lerpedAverage, 0, 1, 60, 200);

  switch(mode) {
  case 0: 
    break;
  case 1: 
    displaybackground01();
    break;
  case 2: 
    break;
  case 3: 
    ball.update();
    stroke(c, 255, 255);
    test();
    break;
  }
}

void test()
{
  for(int i = 0; i <= 360; i++){
      
  }
}

void screenShake () 
{ 
  translate(random(-screenshake, screenshake), random(-screenshake, screenshake));
  screenshake *= 0.9;
}

void keyPressed() 
{
  if (keyCode >= '0' && keyCode <= '7')
  {
    mode = keyCode - '0';
  }
}

void keyReleased() 
{
}

void mousePressed() 
{
  if ( over(b1x, b1y, b1w, b1h) ) {                          // button 1
    set1 = ! set1;
    if ( set1 ) {
      set2 = false;                                          // make option group logic unset others
      play_only_one(0);
    } else {
      pause_only_one(0);
    }
  }
  if ( over(b2x, b2y, b2w, b2h) ) {                          // button 2
    set2 = ! set2;
    if ( set2 ) {
      set1 = false;                                          // make option group logic unset others
      play_only_one(1);
    } else {
      pause_only_one(1);
    }
  }
}
