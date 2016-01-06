import java.util.ArrayList;
PImage court;
int count = 100;
PVector mouse;   //declare a P
ArrayList<Raindrop> raindrops=new Arraylist<Raindrop>();
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
      Raindrop ball = raindrops.get(e);
    ball = new Raindrop(random(width), random(-height, 0));   //Initialize r. The parameters used are the initial x and y positions
  }
}

void draw() {
  if (start == 1) { //initial screen
    background (0); //background color
    textSize(32); //text size
    text("Play Hoops!", width/2, 200); //text will be "Play Pong"
    text("Press any Key to Start", width/2-100, 300); //text will be "Press any Key"
    if (keyPressed == true) { //if any key is pressed
      start = 2; //the game will start
    }
  }

  if (start ==2) { //when the game starts

    hoops(); //this will be the game that starts and the code for the game is below
  }
}
void hoops() {
  court();
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  
  for (int e =raindrops.size()-1; e>=0; e--) {
  Raindrop ball = raindrops.get(e);         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    ball.display();      //display the raindrop
  ball.fall();
    if (ball.isInContactWith(ca)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      ball.reset();                         //if it is, reset the raindrop
    }
    if (ball.loc.y > height + ball.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      ball.reset();                           //if it does, reset the raindrop
      score+=1;                    // add one to the score
    }
  }
  ca.display(); 
  ca.update();
  textSize(32);
  fill(0);
  text(score, width/2, 700);
  if (score>275) { //when the score is more than 275 aka player has missed more than 275 balls
    gameover();  //the player wins the game and it ends the game
  }
}

void gameover() { //code to end game
  background(0);
  textSize(48);
  fill(255);
  text("Game Over!", width/2, height/2);
}

void court() { //image for the background
  court=loadImage("court.jpg");
  image(court, 0, 0);
}