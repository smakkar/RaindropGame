class Raindrop {            //creating the raindrops
  PVector vel, accel, loc;
  int diam;
  PImage ball;
  //declaring variables

  Raindrop(float x, float y) {
    vel= new PVector(random(-3, 3), random(-1, 1));    //speed of the raindrops
    accel= new PVector(0, .1511);              //acceleration of raindrops
    loc= new PVector(x, y);            //location of raindrops
    diam=50;
    ball = loadImage("ball.jpg");        //ball image will be the raindrop
  }
  void display() {
    image(ball, loc.x, loc.y);        //display the image as the raindrops
  }

  void fall() {            //make the raindrops actually drop
    loc.y+=vel.y;           //the y location in respect to y velocity   
    vel.add(accel);        //add acceleration to the velocity
  }

  void reset() {        //to reset the raindrop
    loc.y=0;
    vel.set(0, 10);
  }
  boolean isInContactWith(Catcher ca) {              //when the raindrop hits the catcher
    float dis=dist(loc.x, loc.y, mouse.x, mouse.y); 
    boolean e;
    if (dis< diam/2 + ca.diam) {      //if the raindrop hits the catcher
      e=true;                  //raindrop goes away
    } else {
      e=false;              //raindrop doesn't go away
    }
    return e;
  }
}