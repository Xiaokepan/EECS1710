int peoplenum = 30;
PVector[] position = new PVector[peoplenum];
int[] size = new int[peoplenum];


void setup() { 
  size(800, 600, P2D);
  
  for(int n = 0; n < peoplenum; n ++){
    
    position[n] = new PVector(random(800),random(600));
    size[n] = 10;
  }
  
  ellipseMode(CENTER);
}  
  void draw() {
   background(127);
  
  
   for(int n = 0; n < peoplenum; n ++){
    
   position[n].x = random(10)- 5 + position[n].x;
   position[n].y = random(10)- 5 + position[n].y;
     
   ellipse(position[n].x,position[n].y,size[n],size[n]);
  
   for(int i = 0; i < peoplenum; i ++){
     if(i == n){
     }
     
     else{
        if(position[n].dist(position[i]) < size[n]){
       size[n] = size[n] + 3;
       size[i] = 10;
       position[i].x = random(800);
       position[i].y = random(600);}
     }}}
   }
