import processing.video.*;

PImage preFrame;
 
Capture video;
color trackColor;

float threshold = 25;

//Take a red object and change the background hue to a normal single color. If the red object moves, the point will move accordingly
 
void setup() {
  size(640, 480);
  video = new Capture(this,640,480);
  video.start();
  
  trackColor = color(255,0,0);
}

void captureEvent(Capture video){
  video.read();
}
 
void draw() {
  video.loadPixels();
  image(video,0,0);
  
  threshold = map(mouseX,0,width,0,100);
  
  float avgX = 0;
  float avgY = 0;
  
  int count = 0;
  
  for(int x = 0; x < video.width; x++){
    for(int y =0; y< video.height;y++){
      int loc = x + y * video.width;
      color currentColor = video.pixels[loc];
      float r = red(currentColor);
      float g = green(currentColor);
      float b = blue(currentColor);
      float r1 = red(trackColor);
      float g1 = green(trackColor);
      float b1 = blue(trackColor);
      
      float d = dist(r,g,b,r1,g1,b1);
      
      if(d < threshold){
        stroke(255);
        strokeWeight(1);
        point(x,y);
        avgX += x;
        avgY += y;
        count++;
      }
    }
  }
  
  if(count > 5){
    avgX = avgX / count;
    avgY = avgY / count;
    fill(trackColor);
    strokeWeight(2.0);
    stroke(0);
    ellipse(avgX,avgY,8,8);
  }
 
}

 void mousePressed(){
    int loc = mouseX + mouseY * video.width;
    trackColor = video.pixels[loc];
  }
