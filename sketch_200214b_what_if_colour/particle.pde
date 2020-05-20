class Particle {
  PVector pos = new PVector(random(width - 1), random(height - 1)); // position
  //PVector pos = new PVector(width/2, height/2); // position
  PVector vel = new PVector(0, 0); // velocity
  PVector acc = new PVector(0, 0); // acceleration
  PVector prevPos = pos.copy(); // previous position
  float maxSpeed = 1.5;
  float r = 2.0;
  float thetas = 0;
  float easing = 0.9;


  void update() {
    // keep current position
    prevPos.x = pos.x; 
    prevPos.y = pos.y; 

    // apply acceleration and velocitiy
    vel.add(acc); 
    vel.limit(maxSpeed); // limit velocity
    pos.add(vel); 

    // handle window edges
    if (pos.x >= width) pos.x = prevPos.x = 0;
    if (pos.x < 0) pos.x = prevPos.x = width - 1;
    if (pos.y >= height) pos.y = prevPos.y = 0;
    if (pos.y < 0) pos.y = prevPos.y = height - 1;
    // reset acceleration
    acc.mult(0);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void show(float sw, color sc) {
    //fill(sc);
    //noStroke();
    ////stroke(sc);
    ////strokeWeight(sw);

    ////line(pos.x, pos.y, prevPos.x, prevPos.y);
    //ellipse(pos.x, pos.y, sw, sw);

    //TRIANGLE
    float theta = vel.heading2D() + radians(90);
    thetas += (theta-thetas)* easing;
    noStroke();
    fill(sc);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -sw*1);
    vertex(-sw*0.5, sw*1);
    vertex(sw*0.5, sw*1);
    endShape();
    popMatrix();
  }

  void follow(PVector[] flowField) {
    // get the index in the flow field
    int x = floor(pos.x / scl);
    int y = floor(pos.y / scl);
    int index = x + y * cols;

    // get the force and apply it
    PVector force = flowField[index];
    applyForce(force);
  }
}
