class Catcher {  //creating the catcher
  PVector loc; 
  int diam;
  PImage catcher;    //the catcher will be an image

  Catcher (int tdiam) {    //creating the catcher
    loc=new PVector() ;    //location of the catcher is a 
    diam=tdiam;
    catcher = loadImage("lantern.png");
  }

  void display() {
    image(catcher, loc.x, loc.y);    //image as catcher
  }

  void update() {      
    loc.set(mouseX-25, mouseY-25);    //where the raindrops will hit the catcher
  }
}