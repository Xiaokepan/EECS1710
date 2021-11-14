PImage img;
float Rmax = 10;
float gap = 2;
float dx = (2*Rmax+gap)*cos(PI/6);
float dy = (2*Rmax+gap)/2;


void setup(){
  img = loadImage("sea.jpg");
  size(1280,1544);
  img.loadPixels();

  smooth(8);

  colorMode(RGB);
  background(255);
  int x,y;
  color c;
  float r;

  for(int xi=0; xi<=width/dx; xi++){
    for(int yi=0; yi<=height/dy; yi++){

      x = int(xi*dx);
      y = int(yi*dy);
      if (int(xi+yi)%2!=0){
        int loc = x+y*img.width;
        loc = constrain(loc,0,img.pixels.length-1);
        c = convolution(x,y,3,img);
        if (brightness(c)>200)
          r = map(brightness(c),200,255,Rmax,0);
        else
          r = Rmax;

        draw_hex(x,y,r,c);
      }
    }
  }

}
void draw_hex(float x, float y, float r, color c){
  float Sr = r/cos(PI/6);
  noStroke();
  fill(c);
  pushMatrix();
  translate(x,y);
  beginShape();
  vertex(Sr,0);
  vertex(Sr*cos(PI/3), Sr*sin(PI/3));
  vertex(Sr*cos(PI/3*2), Sr*sin(PI/3*2));
  vertex(Sr*cos(PI), Sr*sin(PI));
  vertex(Sr*cos(PI/3*4),Sr*sin(PI/3*4));
  vertex(Sr*cos(PI/3*5),Sr*sin(PI/3*5));
  endShape(CLOSE);
  popMatrix();
}

color convolution(int x, int y,  int matrixsize, PImage img) {
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + img.width*yloc;
      loc = constrain(loc,0,img.pixels.length-1);
      rtotal += (red(img.pixels[loc]) / pow(matrixsize,2));
      gtotal += (green(img.pixels[loc]) / pow(matrixsize,2));
      btotal += (blue(img.pixels[loc]) / pow(matrixsize,2));
    }
  }

  rtotal = constrain(rtotal,0,255);
  gtotal = constrain(gtotal,0,255);
  btotal = constrain(btotal,0,255);
  

  return color(rtotal,gtotal,btotal);
}
void draw(){}
void keyPressed(){
  save("hexagon.png");
}
