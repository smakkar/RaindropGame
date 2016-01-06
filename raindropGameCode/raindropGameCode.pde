PImage court;
PImage nike;
PImage not;
PVector mouse;   //declare a P
ArrayList <Raindrop> raindrops = new ArrayList <Raindrop>();
Catcher ca;
int score;
float start;
// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test
//declaring variables

void setup() {
  start=1;
  size(1200, 800); // sets size of canvas 
  mouse = new PVector();    //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  ca=new Catcher(100); //initialize the cathcher
}


void draw() {
  if (start == 1) { //initial screen
    nike();
    textSize(32); //text size
    fill(240, 53, 0);
    text("Play Hoops!", 150, 250); //text will be "Play Pong"
    text("Press any Key to Start", 100, 500); //text will be "Press any Key"
    if (keyPressed == true) { //if any key is pressed
      start = 2; //the game will start
    }
  }

  if (start ==2) { //when the game starts

    hoops(); //this will be the game that starts and the code for the game is below
  }
}
void hoops() {                                  //code for the actual game
  raindrops.add(new Raindrop(random(width), 0));  //initialize the image
  court();                                //background image
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY

  for (int e =raindrops.size()-1; e>=0; e--) {
    Raindrop ball = raindrops.get(e);         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    ball.display();      //display the raindrop
    ball.fall();        //make the balls come down
    if (ball.isInContactWith(ca)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      ball.reset();                         //if it is, reset the raindrop
    }
    if (ball.loc.y > height + ball.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      ball.reset();                           //if it does, reset the raindrop
      score+=1;                    // add one to the score
    }
  }
  ca.display();  //display the catcher
  ca.update();   //update the catcher
  textSize(32);
  fill(0);
  text(score, width/2, 700);
  if (score>275) { //when the score is more than 275 aka player has missed more than 275 balls
    gameover();  //the player wins the game and it ends the game
  }
}

void gameover() { //code to end game
  not();    //backrgound for final screen
  textSize(48);
  fill(255);
  text("Game Over! You Dropped Too Many Balls!", 180, height/2);
}

void court() { //image for the background
  court=loadImage("court.jpg");
  image(court, 0, 0);
}

void nike() {                  //image for beginning of game
  nike=loadImage("nike.jpg");
  image(nike, 0, 0);
}

void not() {                 //image function for end of game background
  not=loadImage("not.jpg");
  image(not, 0, 0);
}