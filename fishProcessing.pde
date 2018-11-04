 //<>// //<>//
PFont alarmFont;
PFont buttonFont;

PImage backgroundImage;

// Other variables

int taskNumber;

// Task 1 variables
float mousePosX;
float mousePosY;
boolean mouseDown;  // This is tells us if the mouse button still pressed
boolean atDestination;  // This will tell us if the block is at its desination
float objectPosX;  // These are the co-ordinates of the object to be reached
float objectPosY;
float mouseBoxPosX;
float mouseBoxPosY;

//Task 2 variables
final int noOfFish=10;

int personColor=100;
int carColor=200;
int personX=20;
int personY=20;

int moveX=0;
int moveY=0;

int [][]fishXY = new int [noOfFish][2];
int [][]fishProperties=new int [noOfFish][2];
PFont textFonts;
PImage fish;



void draw()
{
  background(backgroundImage);
  text("Use arrow keys to get fish across the screen", 200, 200);
  displayPerson();
  moveFish();
  checkForCollision();
}

void setup()
{
  size(1000, 650);
  backgroundImage=loadImage("seabed.png");
}
//_______________________________________




void keyPressed() {
  // Firstly change the alarm clock
  if (key==CODED)
  {
    switch (keyCode)
    {
    case UP :
      moveX=0;
      moveY-=1;
      break;
    case DOWN:
      moveX=0;
      moveY+=1;
      break;
    case LEFT:
      moveX-=1;
      moveY=0;
      break;
    case RIGHT:
      moveX+=1;
      moveY=0;
    }
  }
}

void displayComplete() {
  text("You have won!!!",100,100);
}

void checkForCollision() {
  for (int i =0; i<noOfFish; i++) {
    // small fish are 51x27
    if (personX>=fishXY[i][0] && personX<=fishXY[i][0]+80) {
      if (personY>=fishXY[i][1] && personY<=fishXY[i][1]+50) {
        personX=20;
        personY=20;
      }
    }
  }
}

void displayPerson() {
  PImage you;
  you=loadImage("you.png");
  personX+=moveX;
  personY+=moveY;
  if (personY<10) {
    personY=10;
  }
  if (personX>width)
  {
    displayComplete();
  }
  image(you, personX, personY);
}


void displayFish() {
  for (int i =0; i<noOfFish; i++) {
    fish=loadImage(str(fishProperties[i][0])+".png");
    image(fish, fishXY[i][0], fishXY[i][1]);
  }
}
void  createFishDetails(int numberOfFish) {
  // create the fish co-ordinates
  fishXY[numberOfFish][1]=int(random(0, 60)*10);
  fishXY[numberOfFish][0]=960;
  // fish properties are the colours of the fish and the speed at which they move
  fishProperties[numberOfFish][0]=int(random(1, 6));
  fishProperties[numberOfFish][1]=int(random(1, 4));
}

void generateFish() {
  // If the fish have co-ordinates of zero then regenerate their co-ordinates - but they are coming in
  // from the right hand of the screen
  for (int i =0; i<noOfFish; i++) {
    createFishDetails(i);
  }
}


void moveFish() {
  // The fish is moving relative to it's speed
  for (int i =0; i<noOfFish; i++) {
    fishXY[i][0]-=fishProperties[i][1];
    if (fishXY[i][0]<=100) {
      createFishDetails(i);
    }
  }
  displayFish();
}