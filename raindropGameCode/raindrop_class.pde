class Raindrop {
  PVector vel, accel, loc;
  int diam;

  Raindrop(float x, float y) {
    vel= new PVector(random(-10, 10), random(-1, 1));
    accel= new PVector(0, .1511);
    loc= new PVector(x, y);
    diam=50;
  }
  void display() {
    fill(1, 240, 122);
    ellipse(loc.x, loc.y, diam, diam);
  }

  void fall() {
    loc.y+=vel.y;
    vel.add(accel);
  }

  void reset() {
    loc.y=0;
    vel.set(0, 10);
  }
  boolean isInContactWith(PVector c) {
    float dis=dist(loc.x, loc.y, c.x, c.y); 
    boolean e;
    if (dis<diam/2) {
      e=true;
    } else {
      e=false;
    }
    return e;
  }
}