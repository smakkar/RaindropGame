class Raindrop {
  PVector loc, vel, acc;
  float diam;
  color c;

  Raindrop(float x, float y) {
    diam = random(20, 50);
    loc = new PVector(random(diam, width-diam), 0);
    vel= new PVector(0, random(15));
    c = color(255, 233, 101);
  }

  //after declaring fields and setting up constructors, you can define your methods
  void display() {
    fill(c);
    noStroke();
    for (int i = 2; i < diam/2; i++ ) {
      ellipse(loc.x, loc.y + i*4, i*2, i*2);
    }
  }
  void fall() {
    vel.limit(5);
    loc.add(vel);
  }

  void reset() {
    loc.y=0;
    loc.add(vel);
  }

  boolean isInContactWith(Catcher thing) {
    if (ca.loc.dist(loc) < ca.diam/2 + diam/2 ) {
      return true;    //if it hits any part of the catcher reset the raindrop
    } else { 
      return false;
    }
  }
}