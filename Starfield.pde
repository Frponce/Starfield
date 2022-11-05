Particle [] stars = new Particle[1000];
String txt;
float y = 0;
void setup()
{
 size(500, 500, P3D);
    String [] lines = loadStrings("space.txt");
    txt = join(lines, "\n");
    y = height/2;
  
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Particle();
    stars[0] = new OddballParticle();
  }
}
void draw()
{
 
  background(0);
 
  translate(width/2, height/2);
  
  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
    stars[i].update();
    
    stars[0].show();
    stars[0].update();
    
    
  }
  
  fill(#FFE81F);
  textSize(25);
  textAlign(CENTER);
  rotateX(PI/4);
 text(txt,-width/2,y,width,height*10);
  y--;
  
}
class Particle
{
  float myX, myY, myZ;
  int myC;
  float x, y, z;

  Particle() {
    x = (int)(Math.random()*width)-width;     //random(-width, width);   //(int)(Math.random()*width);
    y = (int)(Math.random()*height)-height;   //random(-height,height);  //(int)(Math.random()*height);
    z = (int)(Math.random()*width);           //random(width);           //(int)(Math.random()*width);
  }
  void update() {
    z = z - 5;
    if (z < 1) {
      z = width;
      x = random(-width, width);  
      y = random(-height, height);
    }
  }

  void show() {
    fill(255);
    noStroke();

    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, width);

    float s = map(z, 0, width, 8, 0);
    ellipse(sx, sy, s, s);
  }
}



class OddballParticle extends Particle//inherits from Particle
{
 
  
  OddballParticle() {
    myX =  random(-width, width);   //(int)(Math.random()*width);
    myY = random(-height,height);  //(int)(Math.random()*height);
    myZ = random(width);           //(int)(Math.random()*width);
  }
  void update() {
    myZ = myZ - 5;
    if (myZ < 1) {
      myZ = width;
      myX = random(-width, width);  
      myZ = random(-height, height);
    }
  }
    void show() {
      fill(54, 117, 136);
      noStroke();

      float h = map(myX / myZ, 0, 1, 0, width);
      float k = map(myY / myZ, 0, 1, 0, width);

      float i = map(myZ, 0, width, 4, 0);
      ellipse(h, k, i, i);
    }
  }
