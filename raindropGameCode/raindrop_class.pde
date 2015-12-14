class Raindrop {
  PVector vel, accel, loc;
  float diameter;

  Raindrop(float x, float y) {
    vel= new PVector(random(-10, 10), random(-10, 10));
    acc= new PVector(0, .1511);
    loc= new PVector(x, y);
    diam=12;
  }
  void display() {
    fill(1, 240, 122);
    ellipse(loc.x, loc.y, diam, diam);
  }

  void drop() {
    loc.y+=vel.y;
    vel.add(accel);
  }

void beginning() {