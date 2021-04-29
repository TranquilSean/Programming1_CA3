import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioInput ai;
AudioBuffer ab;

Player Player;
float pspeed = 5;
float theta;//Trees

void setup()
{
  size(500, 500, P3D);
  colorMode(HSB);
  
  minim = new Minim(this);
  ai = minim.getLineIn(Minim.MONO, 512, 44100, 16);
  ab = ai.mix;
  
  float xpos = width/2;
  float ypos = height/2;
  Player = new Player(xpos, ypos, 50, 5);

}

void draw()
{
  background(0);
  //Player.display();
  //Player.move();
  //Player.collision();
  drawTree();
}
