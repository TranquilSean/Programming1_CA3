import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim; // Minim Library
AudioPlayer player; // Playing audio
AudioBuffer buffer; // Gives access to the samples
AudioInput input;

void setup()
{
  size(1024, 512);

  minim = new Minim(this);
  player = minim.loadFile("blackpink.mp3", width);
  player.play();
  
  //input = minim.getLineIn(Minim.MONO, width, 44100, 16); // 8 bits in a byte - read cd quality from the microphone
  
  //buffer = player.mix;
  buffer = player.mix;
  colorMode(HSB);
}

float smoothedAverage = 0;

void draw()
{
  background(0);
  stroke(255);
  float sum = 0;
  for (int i = 0; i < buffer.size(); i ++) // buffer.size will be 1024
  {
    float c = map(i, 0, buffer.size(), 0, 255); 
    stroke(c, 255, 255);
    float sample = buffer.get(i) * (height / 2);  // buffer[i]
    line(i, height / 2 - sample, i, (height / 2) + sample); // Symetrical!
    
    // buffer.get(i) - The actual sample. These values go between -1 and +1
    // Get the average of all these samples!
    // abs() - To get the absolute value
    sum += abs(buffer.get(i)); // makes negative positive
  }
  float average = sum / buffer.size();
  smoothedAverage = lerp(smoothedAverage, average, 0.1);
  ellipse(100, 50, average * 400, average * 400);  
  ellipse(300, 50, smoothedAverage * 400, smoothedAverage * 400);  
  
}
