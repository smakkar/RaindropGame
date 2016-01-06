class Catcher {  //creating the catcher
  PVector loc;
  int diam;
  PImage hoop;

  Catcher (int tdiam) {
    loc=new PVector() ;
    diam=tdiam;
    hoop = loadImage("hoop.jpg");
  }

  void display() {
     image(hoop, loc.x, loc.y);
    
  }

  void update() {
    loc.set(mouseX, mouseY);
  }
}