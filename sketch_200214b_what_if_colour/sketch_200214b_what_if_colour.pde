/*
Colour Palette
 [12:30, 2/14/2020] Avni Jain: yellow - #E3DA9C
 [12:30, 2/14/2020] Avni Jain: pink - #DFC3B2
 [12:31, 2/14/2020] Avni Jain: orange #ECBB71
 blue: #C6B4C6
 */

float inc = 0.03;
float scl = 10;
int cols, rows;
float zoff = 0;
Particle[] particles;
PVector[] flowField;
boolean saveOneFrame = false;
PVector v1;
float wid;

void setup()
{
  size(2020, 1280, P2D);
  //fullScreen(FX2D);
  frameRate(30);
  cols = floor(width / scl);
  rows = floor(height / scl);
  smooth(8);
  particles = new Particle[700];
  for (int i = 0; i < particles.length; ++i)
    particles[i] = new Particle();

  flowField = new PVector[cols * rows];
}

void draw()
{
  noStroke();
  //fill(5, 25, 40, 1);
  fill(20, 90);
  rect(-10, -10, width+10, height+10);

  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      // set the vector in the flow field
      int index = x + y * cols; 
      float angle = noise(xoff, yoff, zoff) * TWO_PI * 2;
      float col = map(noise(xoff, yoff, zoff), 0, 1, 0, 150);
      wid = map(noise(xoff, yoff, zoff), 0, 1, 0.1, 1.5);
      //println(noise(xoff, yoff, zoff));
      PVector v = PVector.fromAngle(angle);
      v.setMag(1); // set the power of the field on the particle
      flowField[index] = v;
      colorMode(HSB);
      noStroke();
      //stroke(col, 200, col, 50);
      fill(col, 10);
      xoff += inc;

      v1 = PVector.fromAngle(angle);
      pushMatrix();
      translate(x*scl, y*scl);
      rotate(v1.heading());
      //strokeWeight(wid);
      //stroke(0.1);
      //line(0, 0, scl+10, 0);
      rect(0, 0, scl+30, 10);
      popMatrix();
    }
    yoff += inc;
    zoff += 0.00009; // rate the flow field changes
  }

  // update and draw the particles
  for (int i = 0; i < particles.length; i++) {
    color val;
    float size;
    particles[i].follow(flowField);
    particles[i].update();
    if ((i>0)&&(i<particles.length/4)) {
      val= #ECBB71;
    } else if ((i>particles.length/4)&&(i<particles.length/3)) {
      val= #DFC3B2;
    } else if ((i>particles.length/3)&&(i<particles.length/2)) {
      val= #E3DA9C;
    } else {
      val = #C6B4C6;
    }

    if (i%5 == 0) {
      size = 3;
    } else if (i%3 == 0) {
      size = 6;
    } else if (i%2==0 ) {
      size = 9;
    } else {
      size= 15;
    }
    //particles[i].show(i*0.04, particles[i].pos.heading()*255); 
    particles[i].show(size, val);
  }
  //saveFrame("frames/frame-#####.tiff");
}
