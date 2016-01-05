int count = 100;
PVector mouse;   //declare a P
Raindrop [] r= new Raindrop [count];      //declare a new Raindrop called r
Catcher ca;
int score;
float start;
// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  start=1;
  size(1200, 800); // sets size of canvas 
  mouse = new PVector();    //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  ca=new Catcher(100);
  for (int i =0; i < count; i++) {
    r[i] = new Raindrop(random(width), random(-height, 0));   //Initialize r. The parameters used are the initial x and y positions
  }
}

void start() {

if (start == 1){ //initial screen

background (0); //background color

textSize(32); //text size

text("Play Pong!",width/2-100,200); //text will be "Play Pong"

text("Surya Makkar",width/2-100,500); //text will be "Surya Makkar"

text("Press any Key to Start",width/2-100,300); //text will be "Press any Key"

if (keyPressed == true) { //if any key is pressed

start = 2; //the game will start

}

}

if (start ==2){ //when the game starts

draw(); //this will be the game that starts and the code for the game is below

}

}
void draw() {
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(0, 200, 255);
  for (int i=0; i<count; i++) {
    r[i].fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r[i].display();      //display the raindrop
    if (r[i].isInContactWith(ca)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r[i].reset();                         //if it is, reset the raindrop
    }
    if (r[i].loc.y > height + r[i].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r[i].reset();                           //if it does, reset the raindrop
            score+=1;
    }
  }
  ca.display();
  ca.update();
  textSize(32);
  fill(0);
  text(score, width/2, 700);
  if (score>200){
    game();
  }
}

void game(){
  background(0);
    textSize(48);
    fill(255);
  text("Game Over!",width/2,height/2);
}