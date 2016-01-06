class Raindrop {
  PVector vel, accel, loc;
  int diam;
  PImage ball;

  Raindrop(float x, float y) {
    vel= new PVector(random(-10, 10), random(-1, 1));
    accel= new PVector(0, .1511);
    loc= new PVector(x, y);
    diam=50;
    ball = loadImage("ball.jpg");
  }
  void display() {
    image(ball, loc.x, loc.y);
  }

  void fall() {
    loc.y+=vel.y;
    vel.add(accel);
  }

  void reset() {
    loc.y=0;
    vel.set(0, 10);
  }
  boolean isInContactWith(Catcher ca) {
    float dis=dist(loc.x, loc.y, mouse.x, mouse.y); 
    boolean e;
    if (dis< diam/2 + ca.diam) {
      e=true;
    } else {
      e=false;
    }
    return e;
  }
}