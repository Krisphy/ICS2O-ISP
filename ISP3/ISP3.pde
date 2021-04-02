//December 16, 2019
//Krish Patel
//Ms.Krasteva
//ISP - How to make pizza
PFont font1;//Callibri font
PFont font2;//Pizza hut font
String GAME_STATE="ANIMATION";//Game Dev CPT; used to change what the viewer sees in relation to what actions they perform in varying game states; set to animation by default
int mazeColor=color(0);//The maze color which is to be used in coordinate with the get() function for collision
int monitorTimer=0;//A timer variable for the animation screens
int carX=0;//Movement variable for first car scene
int car2X=0;//Movement variable for second car scene
Boolean hintIndicator1=false;//Boolean used to indicate if the user has collided with a specific hint
Boolean hintIndicator2=false;//Boolean used to indicate if the user has collided with a specific hint
Boolean hintIndicator3=false;//Boolean used to indicate if the user has collided with a specific hint
Boolean mazeMoveUp=false;//Helped by Bernie Chen; This is put to true when the key is pressed and is set back to false when the user releases a key this makes movement smoother then just changing the variable in keyPressed
Boolean mazeMoveDown=false;
Boolean mazeMoveLeft=false;
Boolean mazeMoveRight=false;
final int defaultCharPosX=375;//Default character position X coordinate for the maze of learning
final int defaultCharPosY=52;//Default character position Y coordinate for the maze of learning
int charPosX=defaultCharPosX;//Moveable character position X being changed to the default at time of code starting
int charPosY=defaultCharPosY;//Moveable character position Y being changed to the default at time of code starting
Boolean collisionDetector=false;//Boolean used to detection collision in code
int pizzeriaTimer=0;//Timer variable for the final animation scene
//GAME VARIABLES
Boolean userSelectIngredient1=false;//Booleans to indicate wether or not the user has selected an ingredient
Boolean userSelectIngredient2=false;
Boolean userSelectIngredient3=false;
Boolean userSelectIngredient4=false;
Boolean userSelectIngredient5=false;
Boolean userSelectIngredient6=false;
Boolean userSelectIngredient7=false;
Boolean userSelectSauce=false;//Boolean to indicate wether or not the user has selected sauce
Boolean userSelectCheese=false;//Boolean to indicate wether or not the user has selected cheese
int timeCounter=0;//A helping variable for gameTimer, this is used as the divisor in a modulus to add one to gameTimer every 60 frames or 1 second
int gameTimer=0;//The timer of the game, useage described above
int score=0;//Score of the user while playing the game
int randomIngredientNum1=0;//Numerical values used to create a random topping for the user to put on the pizza (used with random())
int randomIngredientNum2=0;
String ingredient1="";//Used to convert the numerical values into a string value for the user to be able to see in the screen in the top right of the game
String ingredient2="";
Boolean pizzaSuccessMade=true;//Boolean to detect a correct pizza
int pizzaMakeScore=-1;//-1 to accomodate for the initial +1; Variable to keep track of how many successful pizzas the user has made
Boolean cheese=false;//Detects if the user successfully put cheese on the pizza
Boolean sauce=false;//Detects if the user successfully put sauce on the pizza
Boolean ingredient1Check=false;//Detects if the user successfully put the first randomized ingredient on the pizza
Boolean ingredient2Check=false;//Detects if the user successfully put the second randomized ingredient on the pizza
Boolean userSelectRandomIngredient1=false;//Booleans to indicate wether or not the user has selected the correct random ingredients
Boolean userSelectRandomIngredient2=false;
Boolean pepperoniStick=false;//Detects if the user sticked the varying ingredients on the pizza
Boolean mushroomStick=false;
Boolean onionsStick=false;
Boolean sausageStick=false;
Boolean baconStick=false;
Boolean olivesStick=false;
Boolean bellpepperStick=false;
Boolean cheeseStick=false;
Boolean sauceStick=false;
Boolean ingredient1Stick=false;//Detects if the user sticked the correct varying ingredients on the pizza
Boolean ingredient2Stick=false;
//Ingredient Variables
int pepperoniX;//Variables used to control the position of the toppings sprite in relation to the mouse or the center of the pizza
int pepperoniY;
int mushroomX;
int mushroomY;
int onionsX;
int onionsY;
int sausageX;
int sausageY;
int baconX;
int baconY;
int olivesX;
int olivesY;
int bellpepperX;
int bellpepperY;
int cheeseX;
int cheeseY;
int sauceX;
int sauceY;
void setup() {
  smooth();//Adds anti-aliasing to make the text look better
  size(800, 500);//Makes the graphics window 800 by 500
  font1 = createFont("Calibri", 32);
  font2 = createFont("Order Pizza.ttf", 26);
}
void draw() {//This changes what image the user sees based on what the game state is, Animation by default
  if (GAME_STATE.equals("ANIMATION")) {
    animationIntro();
  } else if (GAME_STATE.equals("MAIN_MENU")) {
    mainMenu();
  } else if (GAME_STATE.equals("GOODBYE")) {
    goodbye();
  } else if (GAME_STATE.equals("INSTRUCTIONS")) {
    instructions();  
  } else if (GAME_STATE.equals("MAZE")) {
    mazeLearning();
  } else if (GAME_STATE.equals("MINI_GAME")) {
    minigame();
  }else if(GAME_STATE.equals("MINI_GAME_DONE")){
    minigameAfterScreen(); 
  }
}
void animationIntro() {
  monitorTimer+=1;//Timer variable being added to
  backgroundBricks();
  fill(50);
  rectMode(CORNERS);//The monitor
  rect(60, 50, 70, 0);
  rectMode(CORNER);
  rect(50, 50, 700, 400, 16);
  fill(100);
  rect(75, 75, 650, 350, 16);
  fill(255);
  textFont(font1);
  textSize(28);
  text("Large pepperoni pizza", 85, 105);//Had to use multiple text functions because using \n in text will not give me the spacing I needed
  text("Large veggie-lovers pizza", 85, 135);
  text("Medium meat-lovers pizza", 85, 165);
  text("Small cheese pizza", 85, 195);
  text("+ Wedges and Creamy Garlic Dip", 85, 225);
  text("Pepperoni party pizza", 85, 255);
  text("Medium Hawaiian pizza", 85, 285);
  text("+ Fries and Coke", 85, 315);
  text("Small chicken mayo pizza", 85, 345);
  text("+ Onion rings", 85, 375);
  text(".... + 5 more", 85, 405);
  if (monitorTimer>=300) {
    animationCarScene1();
  }
}
void animationCarScene1() {
  carX-=3;
  noStroke();
  background(135, 206, 235);//Sky blue
  rectMode(CORNERS);
  fill(35);
  rect(0, 300, 800, 400);//The road and the sun being created
  fill(124, 252, 0);
  rect(-10, 400, 800, 500);//-10 to remove the stroke in that section
  strokeWeight(1);
  ellipseMode(CENTER);
  fill(249, 215, 28);
  ellipse(700, 100, 75, 75);//Sun
  for (int roadStripes=0; roadStripes<=800; roadStripes+=50) {//The road stripes
    strokeWeight(5);
    stroke(250, 210, 1);
    line(roadStripes, 350, roadStripes+25, 350);
  }
  ellipseMode(CENTER);//Drawing the car
  stroke(0);
  strokeWeight(1);
  rectMode(CORNERS);
  fill(255, 46, 46);
  arc(650+carX, 330, 80, 120, radians(180), radians(270));
  beginShape();
  vertex(685+carX, 330);
  vertex(650+carX, 330);
  vertex(650+carX, 270);
  vertex(685+carX, 270);
  vertex(705+carX, 230);
  vertex(755+carX, 230);
  vertex(775+carX, 270);
  vertex(810+carX, 270);
  vertex(810+carX, 330);
  endShape();
  fill(240, 150, 30);
  rect(810+carX, 270, 800+carX, 290);
  arc(640+carX, 290, 35, 35, radians(180), radians(270));
  fill(255);
  rect(800+carX, 290, 810+carX, 300);
  fill(180, 210, 240);
  quad(710+carX, 235, 722.5+carX, 235, 722.5+carX, 265, 695+carX, 265);
  quad(735+carX, 235, 735+carX, 265, 765+carX, 265, 750+carX, 235);
  line(728+carX, 230, 728+carX, 330);
  line(685+carX, 270, 685+carX, 330);
  rectMode(CORNER);
  rect(722.5+carX, 280, -10, 5);//Makes the rectangle extend to the left
  rect(735+carX, 280, 10, 5);
  line(775+carX, 270, 775+carX, 330);
  fill(255, 46, 46);
  rectMode(CORNERS);
  rect(605+carX, 325, 815+carX, 335);
  fill(0);
  strokeWeight(10);
  stroke(35);
  ellipse(765+carX, 330, 30, 30);
  ellipse(685+carX, 330, 30, 30);
  stroke(0);
  strokeWeight(1);
  fill(192, 192);
  ellipse(765+carX, 330, 25, 25);
  ellipse(685+carX, 330, 25, 25);
  line(685+carX, 270, 775+carX, 270);

  if (carX<=-800) {
    animationPhoneScene();
  }
}
void animationPhoneScene() {
  clear();//Drawing the phone
  strokeWeight(1);
  background(155, 0, 0);
  fill(225);
  rect(300, 50, 500, 450, 10);
  fill(175);
  rectMode(CORNER);
  rect(300, 50, 200, 65);
  rectMode(CORNERS);
  strokeWeight(10);
  stroke(25);
  noFill();
  rect(300, 50, 500, 450, 10);
  noStroke();
  fill(0);
  quad(350, 50, 450, 50, 430, 65, 370, 65);
  fill(145);
  ellipse(400, 84, 30, 30);
  strokeWeight(1);
  stroke(100);
  line(305, 65, 495, 65);
  stroke(0, 50, 255);
  strokeWeight(2);
  line(320, 80, 315, 85);
  line(315, 85, 320, 90);
  strokeWeight(1);
  fill(0);
  textFont(font1);
  textSize(14);
  text("Boss", 386, 111);
  fill(50, 215, 50);
  stroke(50, 215, 50);
  rectMode(CORNERS);
  rect(485, 130, 320, 160, 15);
  strokeWeight(4);
  line(484, 160, 482, 150);
  fill(255);
  text("I am going to be sick today.", 330, 150);
  fill(0, 100, 250);
  stroke(0, 100, 250);
  rect(320, 180, 435, 210, 15);
  line(321, 200, 319, 210);
  rect(320, 220, 490, 270, 15);
  line(321, 260, 319, 270);
  fill(255);
  text("Ok recover quick!", 330, 200);
  text("HEY WE NEED YOUR HELP AT THE PIZZARIA", 330, 230, 490, 350);
  rectMode(CORNERS);
  strokeWeight(1);
  stroke(0);
  rect(305, 430, 495, 445, 15);
  fill(125);
  text("Text Message", 310, 442);
  fill(75);
  if (monitorTimer>=1000) {
    animationCarScene2();
  }
}
void animationCarScene2() {
  clear();
  car2X+=3;
  noStroke();
  background(135, 206, 235);//Sky blue
  rectMode(CORNERS);
  fill(35);
  rect(0, 300, 800, 400);//Making the road and ground
  fill(124, 252, 0);
  rect(-10, 400, 800, 500);//-10 to remove stroke on left side
  strokeWeight(1);
  ellipseMode(CENTER);
  fill(249, 215, 28);
  ellipse(700, 100, 75, 75);//The sun
  for (int roadStripes=0; roadStripes<=800; roadStripes+=50) {
    strokeWeight(5);
    stroke(250, 210, 1);
    line(roadStripes, 350, roadStripes+25, 350);
  }
  ellipseMode(CENTER);
  stroke(0);
  strokeWeight(1);
  fill(255, 46, 46);//Drawing the car
  arc(-50+car2X, 330, 80, 120, radians(-90), radians(0));
  beginShape();
  vertex(-50+car2X, 330);
  vertex(-50+car2X, 270);
  vertex(-80+car2X, 270);
  vertex(-100+car2X, 230);
  vertex(-150+car2X, 230);
  vertex(-170+car2X, 270);
  vertex(-210+car2X, 270);
  vertex(-210+car2X, 330);
  endShape();
  fill(240, 150, 30);
  rect(-210+car2X, 270, -200+car2X, 290);
  arc(-40+car2X, 290, 35, 35, radians(-90), radians(0));
  fill(255);
  rect(-200+car2X, 290, -210+car2X, 300);
  fill(180, 210, 240);
  quad(-145+car2X, 235, -130+car2X, 235, -130+car2X, 265, -160+car2X, 265);
  quad(-120+car2X, 235, -120+car2X, 265, -90+car2X, 265, -105+car2X, 235);
  line(-125+car2X, 230, -125+car2X, 330);
  line(-80+car2X, 270, -80+car2X, 330);
  line(-170+car2X, 270, -170+car2X, 330);
  rectMode(CORNER);
  rect(-120+car2X, 280, 10, 5);
  rect(-130+car2X, 280, -10, 5);
  fill(255, 46, 46);
  rectMode(CORNERS);
  rect(-5+car2X, 325, -215+car2X, 335);
  fill(0);
  strokeWeight(10);
  stroke(35);
  ellipse(-75+car2X, 330, 30, 30);
  ellipse(-165+car2X, 330, 30, 30);
  stroke(0);
  strokeWeight(1);
  fill(192, 192);
  ellipse(-75+car2X, 330, 25, 25);
  ellipse(-165+car2X, 330, 25, 25);
  line(-175+car2X, 270, -50+car2X, 270);
  if (car2X>=800) {
    animationPizzeriaScene();
  }
}
void animationPizzeriaScene() {
  clear();
  backgroundBricks();
  pizzeriaTimer+=1;//Timer variable for the scene to make images and text pop in and out
  rectMode(CORNERS);
  noStroke();
  fill(0xffF1C27D);
  beginShape();
  vertex(50, 75);
  vertex(150, 75);
  vertex(150, 175);
  vertex(125, 200);
  vertex(50, 150);
  endShape(CLOSE);
  fill(150, 75, 0);
  rect(65, 75, 35, 135);
  fill(0xffF1C27D);
  ellipseMode(CENTER);
  ellipse(40, 125, 30, 30);
  rect(100, 125, 65, 250);
  pushMatrix();//Learned from processing.org
  translate(150, 75);
  rotate(radians(10));
  fill(165, 0, 0);
  arc(0, 0, 75, 35, radians(0), radians(90));
  popMatrix();
  pushMatrix();
  fill(190, 0, 0);
  translate(140, 75);
  arc(0, 0, 110, 30, radians(30), radians(270));
  popMatrix();
  fill(200, 0, 0);
  arc(93, 75, 115, 115, radians(180), radians(365));
  fill(0);
  ellipse(100, 110, 10, 20);
  ellipse(135, 110, 10, 20);
  fill(255);
  ellipse(100, 110, 4, 4);
  ellipse(135, 110, 4, 4);
  arc(115, 145, 50, 50, radians(0), radians(185));
  noFill();
  strokeWeight(3);
  stroke(0xffC68642);
  arc(120, 125, 15, 15, radians(25), radians(165)); 
  noStroke();
  fill(255);
  rectMode(CORNERS);
  rect(650, 0, 750, 75);
  noStroke();
  fill(#E0AC69);
  beginShape();
  vertex(750, 75);
  vertex(750, 150);
  bezierVertex(685, 225, 650, 200, 650, 125);
  vertex(650, 75);
  endShape(CLOSE);
  fill(#C9AB00);
  rect(725, 75, 750, 130);
  fill(#E0AC69);
  rect(700, 150, 735, 250);
  ellipse(750, 120, 30, 30);
  fill(255);
  arc(685, 140, 50, 50, 0, PI);
  fill(#02E2F5);
  ellipse(665, 110, 10, 20);
  ellipse(705, 110, 10, 20);
  noStroke();
  fill(#F5BD02);
  ellipse(705, 60, 30, 20);
  fill(#FF0000);
  beginShape();
  vertex(0, 200);
  vertex(150, 200);
  vertex(140, 450);
  vertex(40, 450);
  vertex(20, 300);
  endShape();
  fill(#03226F);
  ellipse(0, 250, 50, 100);
  rect(0, 250, 10, 400);
  rect(40, 450, 140, 500);
  fill(205);
  beginShape();
  vertex(800, 200);
  vertex(650, 200);
  vertex(660, 450);
  vertex(760, 450);
  vertex(780, 300);
  endShape();
  fill(255);
  ellipse(800, 250, 50, 100);
  rect(790, 250, 800, 400);
  fill(255);
  rect(660, 200, 755, 500);
  textSize(15);
  textAlign(LEFT, BASELINE);
  if (pizzeriaTimer<200) {
    beginShape();
    vertex(175, 150);
    vertex(200, 125);
    vertex(400, 125);
    vertex(400, 25);
    vertex(185, 25);
    vertex(185, 125);
    endShape(CLOSE);
    fill(0);
    text("Hey! What is the issue that you needed my help with?", 210, 35, 390, 125);
  }

  if (pizzeriaTimer>=200 && pizzeriaTimer<400) {
    beginShape();
    vertex(625, 25);
    vertex(400, 25);
    vertex(400, 140);
    vertex(615, 140);
    vertex(625, 155);
    endShape(CLOSE);
    fill(0);
    text("We have too many customers for our staff to keep up, we need as much help as we can get!", 410, 35, 625, 140);
  }
  if (pizzeriaTimer>=400) {
    beginShape();
    vertex(175, 150);
    vertex(200, 125);
    vertex(400, 125);
    vertex(400, 25);
    vertex(185, 25);
    vertex(185, 125);
    endShape(CLOSE);
    fill(0);
    text("Oh no! How will I learn to create pizzas quickly! I have no idea!", 210, 35, 390, 125);
  }
  if (pizzeriaTimer>=550) {
    GAME_STATE  = "MAIN_MENU";
  }
}
void backgroundBricks() {
  strokeWeight(1);//This method is called over and over again for background
  stroke(0);
  background(204, 142, 105);
  for (int i=0; i<100; i++) {//For loop which creates 20 lines of bricks which are offset from each other with a -50 in the x coordinate
    line(100*i, 0, 100*i, 25);
    line(100*i-50, 25, 100*i-50, 50);
    line(100*i, 50, 100*i, 75);
    line(100*i-50, 75, 100*i-50, 100);
    line(100*i, 100, 100*i, 125);
    line(100*i-50, 125, 100*i-50, 150);
    line(100*i, 150, 100*i, 175);
    line(100*i-50, 175, 100*i-50, 200);
    line(100*i, 200, 100*i, 225);
    line(100*i-50, 225, 100*i-50, 250);
    line(100*i, 250, 100*i, 275);
    line(100*i-50, 275, 100*i-50, 300);
    line(100*i, 300, 100*i, 325);
    line(100*i-50, 325, 100*i-50, 350);
    line(100*i, 350, 100*i, 375);
    line(100*i-50, 375, 100*i-50, 400);
    line(100*i, 400, 100*i, 425);
    line(100*i-50, 425, 100*i-50, 450);
    line(100*i, 450, 100*i, 475);
    line(100*i-50, 475, 100*i-50, 500);
    line(0, 25*i, 800, 25*i);
  }
}
void mainMenu() {
  clear();
  backgroundBricks();
  rectMode(CORNER);
  fill(255);
  rect(100, 15, 600, 150);
  rectMode(CORNERS);
  noStroke();
  fill(0xffF1C27D);
  beginShape();
  vertex(50, 150);
  vertex(150, 150);
  vertex(150, 250);
  vertex(125, 275);
  vertex(50, 225);
  endShape(CLOSE);
  fill(150, 75, 0);
  rect(65, 150, 35, 210);
  fill(0xffF1C27D);
  ellipseMode(CENTER);
  ellipse(40, 200, 30, 30);
  rect(100, 200, 65, 325);
  pushMatrix();//Learned from processing.org
  translate(150, 150);
  rotate(radians(10));//Drawing pizza character
  fill(165, 0, 0);
  arc(0, 0, 75, 35, radians(0), radians(90));
  popMatrix();
  pushMatrix();
  fill(190, 0, 0);
  translate(140, 150);
  arc(0, 0, 110, 30, radians(30), radians(270));
  popMatrix();
  fill(200, 0, 0);
  arc(93, 150, 115, 115, radians(180), radians(365));
  fill(0);
  ellipse(100, 185, 10, 20);
  ellipse(135, 185, 10, 20);
  fill(255);
  ellipse(100, 185, 4, 4);
  ellipse(135, 185, 4, 4);
  arc(115, 220, 50, 50, radians(0), radians(185));
  noFill();
  strokeWeight(3);
  stroke(0xffC68642);
  arc(120, 200, 15, 15, radians(25), radians(165));
  stroke(255);
  strokeWeight(10);
  quad(560, 385, 780, 385, 750, 250, 590, 250);
  rect(590, 250, 750, 90);
  strokeWeight(2);
  stroke(0);
  fill(200);
  quad(560, 385, 780, 385, 750, 250, 590, 250);
  rect(590, 250, 750, 90);
  fill(212, 155, 23);
  strokeWeight(10);
  stroke(0xffE1D800);
  ellipse(670, 320, 150, 115);
  fill(255);
  strokeWeight(1);
  stroke(0);
  if (mouseX>=250 && mouseX<=550 && mouseY<=230 && mouseY>=170) {//Detection if the mouse is hovering over the text box the fill changes
    fill(200);
  }
  rect(250, 170, 550, 230);
  fill(255);
  if (mouseX>=250 && mouseX<=550 && mouseY<=310 && mouseY>=250) {
    fill(200);
  }
  rect(250, 250, 550, 310);
  fill(255);
  if (mouseX>=250 && mouseX<=550 && mouseY<=390 && mouseY>=330) {
    fill(200);
  }
  rect(250, 330, 550, 390);
  fill(255);
  if (mouseX>=250 && mouseX<=550 && mouseY<=470 && mouseY>=410) {
    fill(200);
  }
  rect(250, 410, 550, 470);
  fill(0);
  textFont(font1);
  text("Mini-Game", 325, 210);
  text("The Maze of Learning", 260, 290);
  text("Instructions", 325, 370);
  text("Exit Game", 335, 450);
  textFont(font2);
  textAlign(CENTER, CENTER);//Learned from Processing reference website; used to change the position of the text in relation to the text function
  text("The Adventure of the Pizza Delivery Man", 100, 160, 700, 10);
  textAlign(LEFT, BASELINE);
  textSize(5);
}
void mouseReleased() {
  menuMouse();//Used for the mouse detection in main menu
  minigameMouseReleased();//Used for mouse detection in the mini game
}
void keyPressed() {
  if (key == 'a') {//Makes the character movement booleans true based on the users input
    mazeMoveLeft=true;
  }
  if (key == 'd') {
    mazeMoveRight=true;
  }
  if (key == 's') {
    mazeMoveDown=true;
  }
  if (key == 'w') {
    mazeMoveUp=true;
  }
  if(keyPressed == true && GAME_STATE.equals("MINI_GAME_DONE")){//Used for exiting the mini game after screen
     GAME_STATE="MAIN_MENU";
     pizzaMakeScore=0;
  }
}
void keyReleased() {
  if (key == 'a') {//Makes the character movement booleans false based on the users input (smoothens movement)
    mazeMoveLeft=false;
  }
  if (key == 'd') {
    mazeMoveRight=false;
  }
  if (key == 's') {
    mazeMoveDown=false;
  }
  if (key == 'w') {
    mazeMoveUp=false;
  }
}
void menuMouse() {
  if (mouseX>=250 && mouseX<=550 && mouseY<=470 && mouseY>=410 && GAME_STATE.equals("MAIN_MENU")) {//Based on the mouse position in main menu, change game state
    GAME_STATE = ("GOODBYE");
  }
  if (mouseX>=250 && mouseX<=550 && mouseY<=390 && mouseY>=330 && GAME_STATE.equals("MAIN_MENU")) {
    GAME_STATE = ("INSTRUCTIONS");
  }
  if (mouseX>=250 && mouseX<=550 && mouseY<=470 && mouseY>=410 && GAME_STATE.equals("INSTRUCTIONS")) {
    clear();
    background(204);
    GAME_STATE = ("MAIN_MENU");
  }
  if (mouseX>=250 && mouseX<=550 && mouseY<=310 && mouseY>=250 && GAME_STATE.equals("MAIN_MENU")) {
    GAME_STATE = ("MAZE");
    mazeMoveUp = false;//Resets the movement booleans to remove variable bugs
    mazeMoveDown = false;
    mazeMoveLeft = false;
    mazeMoveRight = false;
  } 
  if (mouseX>=250 && mouseX<=550 && mouseY<=230 && mouseY>=170 && GAME_STATE.equals("MAIN_MENU")) {
    GAME_STATE = ("MINI_GAME");
  }
}
void instructions() {
  backgroundBricks();
  fill(0);
  rectMode(CORNERS);
  textAlign(LEFT, BASELINE);
  textFont(font1);
  textSize(20);
  fill(0,150);
  rect(0,0,800,350);
  fill(255);
  text("Maze:\nThe Maze of Learning works by using w, a, s, and d to move up, left, down, and right respectively. If you collide with a wall you will be sent back to the start. You will only be able to go back to the main menu if you have gotten all three hints as indicated by the ?.\n\nGame of Testing:\nThe Game of testing or minigame works by having an order appear on the screen in the top right. The pizza will be assembled using the hints in the Maze of Learning. To select ingredients simply left-click them then click on the pizza on the pizza peel. If you have selected the correct ingredient it will be applied to the pizza, if you have selected the incorrect ingredient you will have to put it back where it was using left click. After finishing the pizza press anywhere on the screen to get the next order.", 10, 20, 790, 340);
  fill(255);
  if (mouseX>=250 && mouseX<=550 && mouseY>=410 & mouseY<=470) {//Hightlight the box if user hovers over it
    fill(200);
  }
  rect(250, 410, 550, 470);
  fill(0);
  textAlign(LEFT, BASELINE);
  textFont(font1);
  text("Back to main menu", 275, 450);
}
void mazeLearning() {
  clear();
  if (mazeMoveUp==true) {//If the movement variables are true they move the character in their respective directions
    charPosY-=5;
  }
  if (mazeMoveRight==true) {
    charPosX+=5;
  }
  if (mazeMoveDown==true) {
    charPosY+=5;
  }
  if (mazeMoveLeft==true) {
    charPosX-=5;
  }
  background(225);
  stroke(0);
  strokeWeight(10);//Drawing the maze
  line(0, 0, 400, 0);
  line(0, 0, 0, 500);
  line(0, 500, 400, 500);
  line(400, 0, 800, 0);
  line(800, 0, 800, 500);
  line(480, 500, 800, 500);
  strokeWeight(5);
  line(80, 100, 400, 100);
  line(400, 0, 400, 100);
  line(0, 200, 240, 200);
  line(240, 200, 240, 300);
  line(80, 200, 80, 300);
  line(0, 400, 80, 400);
  line(160, 300, 160, 500);
  line(240, 400, 400, 400);
  line(400, 400, 400, 500);
  line(320, 200, 320, 400);
  line(480, 100, 720, 100);
  line(480, 100, 480, 200);
  line(480, 200, 400, 200);
  line(400, 200, 400, 300);
  line(400, 300, 480, 300);
  line(480, 300, 480, 500);
  line(560, 100, 560, 400);
  line(640, 200, 640, 300);
  line(640, 300, 560, 300);
  line(720, 200, 800, 200);
  line(720, 200, 720, 300);
  line(640, 400, 640, 500);
  line(720, 400, 800, 400);
  textFont(font1);
  textAlign(LEFT, BASELINE);
  textSize(40);
  fill(45);//To make sure the user doesnt collide with text
  text("?", 30, 460);
  text("?", 430, 260);
  text("?", 350, 460);
  strokeWeight(1);
  stroke(50);
  line(80, 400, 80, 500);
  line(320, 400, 320, 500);
  line(480, 200, 480, 300);
  text(" <- Start", 240, 65);
  textSize(25);
  text("Make sure to get all three hints!", 40, 160);
  textSize(20);
  textAlign(CENTER, TOP);
  textLeading(18);//Processing.org taught me this; used to change the line spacing
  text("M\na\ni\nn\nM\ne\nn\nu\n|\nV", 440, 310);
  fill(255);
  rectMode(CORNERS);
  if (charPosX>0 && charPosX<80 && charPosY>400 && charPosY<500) {//If the user is in various specific positions, execute the hint procedure
    hint();
  } else if (charPosX>320 && charPosX<400 && charPosY>400 && charPosY<500) {
    hint();
  } else if (charPosX>400 && charPosX<480 && charPosY>200 && charPosY<300) {
    hint();
  }
  for (int i = 0; i < 20; i++) { //Helped by Warren Xu; this variable works by checking the get() value of every single bordering pixel of the character
    if (get(charPosX-10 + i, charPosY-10)==mazeColor) {//Top Side detection
      collisionDetector=true;
    }
    if (get(charPosX-10 + i, charPosY+10)==mazeColor) {//Bottom side detection
      collisionDetector=true;
    }
    if (get(charPosX-10, charPosY-10+ i)==mazeColor) {//Left Side Detection
      collisionDetector=true;
    }
    if (get(charPosX+10, charPosY-10+ i)==mazeColor) {//Right side Detection
      collisionDetector=true;
    }
  }
  if (charPosX>400 && charPosX<480 && charPosY>500 && hintIndicator1==true && hintIndicator2==true && hintIndicator3==true) {//If the user is in the position to go back to main menu and they have viewed all of the hints go to main menu
    GAME_STATE = "MAIN_MENU";
    collisionDetector=true;
  }
  if (charPosX>400 && charPosX<480 && charPosY>500 && (hintIndicator1==false || hintIndicator2==false || hintIndicator3==false)) {//If the user is in the position to go back to main menu and they have not viewed all of the hints go to the default position
    collisionDetector=true;
  }
  if (collisionDetector==true) {//If the user collides with the wall, reset the position of the user
    collisionDetector=false;
    charPosX=defaultCharPosX;
    charPosY=defaultCharPosY;
  }
  fill(255);
  stroke(45);
  rect(charPosX-10, charPosY+10, charPosX+10, charPosY-10);//The character model; drawn after the collision to make sure that the rectangle doesn't cover the pixel before get() can get its color
}
void hint() {
  textAlign(LEFT, BASELINE);
  textFont(font1);
  textSize(25);
  rectMode(CORNER);
  if (charPosX>0 && charPosX<80 && charPosY>400 && charPosY<500) {//If you are in a specific position on the board display this text
    fill(255);
    rect(50, 50, 700, 150);
    fill(0);
    text("Sauce is always first for a pizza. Sauce over cheese is a bad practice and is not appropriate for circular pizzas! Sauce distribution should also be conservative.", 75, 75, 675, 125);
    hintIndicator1=true;
  } else if (charPosX>320 && charPosX<400 && charPosY>400 && charPosY<500) {//If you are in a specific position on the board display this text
    fill(255);
    rect(50, 50, 700, 150);
    fill(0);
    text("Cheese is always after sauce, and should have enough cheese to cover 1-2 mm on top of the pizza. This amount is roughly equal to a even cover of finely shredded cheese atop the pizza.", 75, 75, 675, 125);
    hintIndicator2=true;
  } else if (charPosX>400 && charPosX<480 && charPosY>200 && charPosY<300) {//If you are in a specific position on the board display this text
    fill(255);
    rect(50, 250, 700, 200);
    fill(0);
    text("The toppings are always on top of the cheese to prevent the crust from becoming soggy due to watery vegetables such as mushrooms. Order of toppings should always be dry first with watery ingredients afterwards. Lastly if the customer desires seasonings such as oregano go as the last layer.", 75, 275, 675, 175);
    hintIndicator3=true;
  }
  rectMode(CORNERS);
}

void minigame() {
  clear();
  //Oven, TV, Background, and Table
  strokeWeight(1);
  stroke(0);
  noFill();
  background(168, 119, 90);
  for (int q=0; q<10; q++) {
    rectMode(CORNER);
    rect(0+100*q, 0, 100, 100);
    rect(0+100*q, 100, 100, 100);
    rect(0+100*q, 200, 100, 100);
    rect(0+100*q, 300, 100, 100);
    rect(0+100*q, 400, 100, 100);
  }
  fill(211);
  rectMode(CORNERS);
  rect(25, 275, 375, 475);
  stroke(0);
  strokeWeight(10);
  fill(75);
  rectMode(CORNER);
  rect(425, 25, 350, 175, 5);
  strokeWeight(1);
  fill(105, 107, 94);
  rect(425, 250, 100, 225);
  rectMode(CORNERS);
  rect(525, 235, 775, 490);
  pushMatrix();
  fill(255);
  textSize(60);
  textFont(font2);
  translate(610, 415);
  rotate(radians(315));
  text("OVEN", 0, 0);
  popMatrix();
  noFill();
  fill(211);
  //Ingredients Buckets
  stroke(150);
  strokeWeight(3);
  rect(25, 100, 375, 150);//Pepperoni (ingredient 1)
  rect(25, 150, 200, 200);//Mushrooms(ingredient 2)
  rect(200, 200, 375, 150);//Onions (ingredient 3)
  rect(25, 200, 200, 250);//Sausage (ingredient 4)
  rect(200, 200, 375, 250);//Bacon (ingredient 5)
  rect(25, 250, 200, 300);//Olives (ingredient 6)
  rect(200, 250, 375, 300);//Green Bell Peppers(ingredient 7)
  strokeWeight(1);
  stroke(0);
  rect(375, 100, 25, 25);//Cheese
  fill(220, 0, 0);
  rect(375, 100, 200, 25);//Sauce
  //Pizza Peel
  stroke(0);
  strokeJoin(ROUND);
  fill(#C19A6B);
  strokeWeight(2);
  arc(200, 340, 200, 75, radians(0), radians(360));
  beginShape();
  vertex(205, 465);
  vertex(205, 550);
  vertex(195, 550);
  vertex(195, 465);
  vertex(100, 465);
  vertex(100, 340);
  vertex(300, 340);
  vertex(300, 465);
  endShape(CLOSE);
  stroke(#C19A6B);
  fill(0);
  rect(102, 340, 298, 340);
  stroke(0);
  //Pizza
  fill(#bf8d3c);
  ellipseMode(CENTER);
  ellipse(200, 385, 150, 150);
  ellipse(200, 385, 130, 130);
  //Ingredient Markers
  textFont(font1);
  textSize(20);
  fill(0);
  text("Sauce", 210, 35, 375, 175);
  text("Cheese", 35, 35, 200, 175);
  text("Pepperoni",35, 110, 375, 150);
  text("Mushrooms",35, 160, 200, 200);
  text("Onions",210, 160, 375, 300);
  text("Sausage",35, 210, 200, 250);
  text("Bacon",210, 210, 375, 250);
  text("Olives",35, 260, 200, 300);
  text("Bell Pepper",210, 260, 375, 300);
  if (pizzaSuccessMade==true) {
    randomIngredientNum1 = (int)random(1, 8);//Using random() and (int) to get a number from 1 - 7 which will later be turned into a topping that the user has to put on the pizza
    randomIngredientNum2 = (int)random(1, 8);//Using random() and (int) to get a number from 1 - 7 which will later be turned into a topping that the user has to put on the pizza
    pizzaSuccessMade=false;//Reseting variables
    pizzaMakeScore+=1;
    userSelectIngredient1=false;
    userSelectIngredient2=false;
    userSelectIngredient3=false;
    userSelectIngredient4=false;
    userSelectIngredient5=false;
    userSelectIngredient6=false;
    userSelectIngredient7=false;
    userSelectSauce=false;
    userSelectCheese=false;
    cheese=false;
    sauce=false;
    ingredient1Check=false;
    ingredient2Check=false;
    userSelectRandomIngredient1=false;
    userSelectRandomIngredient2=false;
    pepperoniStick=false;
    mushroomStick=false;
    onionsStick=false;
    sausageStick=false;
    baconStick=false;
    olivesStick=false;
    bellpepperStick=false;
    cheeseStick=false;
    sauceStick=false;
    ingredient1Stick=false;
    ingredient2Stick=false;
  }
  timeCounter+=1;
  if (timeCounter%60==0) {//Using modulus and a variable that is +60 every second to make a gameTimer that is added to by 1 every second
    gameTimer+=1;
  }
  //if(pizzaMakeScore>=0){//Determining score
   score = 1000*pizzaMakeScore; 
 // }
  fill(255);
  text("Time Left: "+ (60-gameTimer), 450, 170);
  text("Press left click anywhere to confirm your pizza!", 435, 275, 525, 475);

  if (randomIngredientNum1==randomIngredientNum2 && randomIngredientNum2!=1) {//Failsafe to make sure the two numbers arent equal so they do not have the same topping twice
    randomIngredientNum2-=1;
  }
  if (randomIngredientNum1==randomIngredientNum2 && randomIngredientNum1!=1) {
    randomIngredientNum1-=1;
  }
  if (randomIngredientNum1==randomIngredientNum2 && randomIngredientNum1==1) {
    randomIngredientNum1+=1;
  }
  if (randomIngredientNum1==1) {//Changing the string ingredient1 based on the random number given by the code which is to be used later to display on the monitor
    ingredient1="Pepperoni";
  } else if (randomIngredientNum1==2) {
    ingredient1="Mushrooms";
  } else if (randomIngredientNum1==3) {
    ingredient1="Onions";
  } else if (randomIngredientNum1==4) {
    ingredient1="Sausage";
  } else if (randomIngredientNum1==5) {
    ingredient1="Bacon";
  } else if (randomIngredientNum1==6) {
    ingredient1="Olives";
  } else if (randomIngredientNum1==7) {
    ingredient1="Bell Pepper";
  }

  if (randomIngredientNum2==1) {//Changing the string ingredient1 based on the random number given by the code which is to be used later to display on the monitor
    ingredient2="Pepperoni";
  } else if (randomIngredientNum2==2) {
    ingredient2="Mushrooms";
  } else if (randomIngredientNum2==3) {
    ingredient2="Onions";
  } else if (randomIngredientNum2==4) {
    ingredient2="Sausage";
  } else if (randomIngredientNum2==5) {
    ingredient2="Bacon";
  } else if (randomIngredientNum2==6) {
    ingredient2="Olives";
  } else if (randomIngredientNum2==7) {
    ingredient2="Bell Pepper";
  }

  text(ingredient1+" , "+ingredient2, 450, 75);//Displaying the ingredient
  text("Score: "+score, 450, 100);//Displaying the score
  if (ingredient1.equals("Pepperoni")) {//Changing the value for the correct random ingredient to its respective ingredient
    userSelectRandomIngredient1=userSelectIngredient1;
  } else if (ingredient1.equals("Mushrooms")) {
    userSelectRandomIngredient1=userSelectIngredient2;
  } else if (ingredient1.equals("Onions")) {
    userSelectRandomIngredient1=userSelectIngredient3;
  } else if (ingredient1.equals("Sausage")) {
    userSelectRandomIngredient1=userSelectIngredient4;
  } else if (ingredient1.equals("Bacon")) {
    userSelectRandomIngredient1=userSelectIngredient5;
  } else if (ingredient1.equals("Olives")) {
    userSelectRandomIngredient1=userSelectIngredient6;
  } else if (ingredient1.equals("Bell Pepper")) {
    userSelectRandomIngredient1=userSelectIngredient7;
  }

  if (ingredient2.equals("Pepperoni")) {//Changing the value for the correct random ingredient to its respective ingredient
    userSelectRandomIngredient2=userSelectIngredient1;
  } else if (ingredient2.equals("Mushrooms")) {
    userSelectRandomIngredient2=userSelectIngredient2;
  } else if (ingredient2.equals("Onions")) {
    userSelectRandomIngredient2=userSelectIngredient3;
  } else if (ingredient2.equals("Sausage")) {
    userSelectRandomIngredient2=userSelectIngredient4;
  } else if (ingredient2.equals("Bacon")) {
    userSelectRandomIngredient2=userSelectIngredient5;
  } else if (ingredient2.equals("Olives")) {
    userSelectRandomIngredient2=userSelectIngredient6;
  } else if (ingredient2.equals("Bell Pepper")) {
    userSelectRandomIngredient2=userSelectIngredient7;
  }
  if (ingredient1.equals("Pepperoni")) {//Changing the value for the the boolean which indicates if the correct random ingredient sticks to its respective ingredient
    ingredient1Stick=pepperoniStick;
  } else if (ingredient1.equals("Mushrooms")) {
    ingredient1Stick=mushroomStick;
  } else if (ingredient1.equals("Onions")) {
    ingredient1Stick=onionsStick;
  } else if (ingredient1.equals("Sausage")) {
    ingredient1Stick=sausageStick;
  } else if (ingredient1.equals("Bacon")) {
    ingredient1Stick=baconStick;
  } else if (ingredient1.equals("Olives")) {
    ingredient1Stick=olivesStick;
  } else if (ingredient1.equals("Bell Pepper")) {
    ingredient1Stick=bellpepperStick;
  }

  if (ingredient2.equals("Pepperoni")) {//Changing the value for the the boolean which indicates if the correct random ingredient sticks to its respective ingredient
    ingredient2Stick=pepperoniStick;
  } else if (ingredient2.equals("Mushrooms")) {
    ingredient2Stick=mushroomStick;
  } else if (ingredient2.equals("Onions")) {
    ingredient2Stick=onionsStick;
  } else if (ingredient2.equals("Sausage")) {
    ingredient2Stick=sausageStick;
  } else if (ingredient2.equals("Bacon")) {
    ingredient2Stick=baconStick;
  } else if (ingredient2.equals("Olives")) {
    ingredient2Stick=olivesStick;
  } else if (ingredient2.equals("Bell Pepper")) {
    ingredient2Stick=bellpepperStick;
  }
  strokeWeight(1);
  rectMode(CENTER); 
  if (cheeseStick==true) {//All of these if statements makes it so that the ingredient either follows the mouse or is stuck to the pizza
    cheeseX=200;
    cheeseY=385;
  } else {
    cheeseX=mouseX;
    cheeseY=mouseY;
  }
  if (pepperoniStick==true) {
    pepperoniX=200;
    pepperoniY=385;
  } else {
    pepperoniX=mouseX;
    pepperoniY=mouseY;
  }
  if (mushroomStick==true) {
    mushroomX=200;
    mushroomY=385;
  } else {
    mushroomX=mouseX;
    mushroomY=mouseY;
  }
  if (onionsStick==true) {
    onionsX=200;
    onionsY=385;
  } else {
    onionsX=mouseX;
    onionsY=mouseY;
  }
  if (sausageStick==true) {
    sausageX=200;
    sausageY=385;
  } else {
    sausageX=mouseX;
    sausageY=mouseY;
  }
  if (baconStick==true) {
    baconX=200;
    baconY=385;
  } else {
    baconX=mouseX;
    baconY=mouseY;
  }
  if (olivesStick==true) {
    olivesX=200;
    olivesY=385;
  } else {
    olivesX=mouseX;
    olivesY=mouseY;
  }
  if (bellpepperStick==true) {
    bellpepperX=200;
    bellpepperY=385;
  } else {
    bellpepperX=mouseX;
    bellpepperY=mouseY;
  }
  if (userSelectSauce==true || sauceStick==true) {//Drawing the sauce
    if (sauceStick==true) {
      fill(200, 0, 0);
      ellipseMode(CENTER);
      ellipse(200, 385, 130, 130);
    }
    if (userSelectSauce==true) {
      fill(220, 0, 0);
      rectMode(CORNERS);
      rect(mouseX-25, mouseY-50, mouseX+25, mouseY+50);
      triangle(mouseX-10, mouseY+50, mouseX+10, mouseY+50, mouseX, mouseY+90);
      triangle(mouseX-25, mouseY+50, mouseX+25, mouseY+50, mouseX, mouseY+75);
    }
  }
  if (userSelectCheese==true || cheeseStick==true) {//Drawing the cheese
    fill(#FFA600, 150);
    ellipseMode(CENTER);
    ellipse(cheeseX, cheeseY, 130, 130);
  }
  if (userSelectIngredient1==true || pepperoniStick==true) {//Pepperoni
    fill(175, 0, 0);
    ellipseMode(CENTER);
    ellipse(pepperoniX, pepperoniY, 10, 10);
    ellipse(pepperoniX+20, pepperoniY+20, 10, 10);
    ellipse(pepperoniX+20, pepperoniY, 10, 10);
    ellipse(pepperoniX+20, pepperoniY-20, 10, 10);
    ellipse(pepperoniX, pepperoniY+20, 10, 10);
    ellipse(pepperoniX, pepperoniY-20, 10, 10);
    ellipse(pepperoniX-20, pepperoniY, 10, 10);
    ellipse(pepperoniX-20, pepperoniY+20, 10, 10);
    ellipse(pepperoniX-20, pepperoniY-20, 10, 10);
    ellipse(pepperoniX+40, pepperoniY, 10, 10);
    ellipse(pepperoniX-40, pepperoniY, 10, 10);
    ellipse(pepperoniX, pepperoniY+40, 10, 10);
    ellipse(pepperoniX, pepperoniY-40, 10, 10);
    ellipse(pepperoniX+35, pepperoniY+35, 10, 10);
    ellipse(pepperoniX-35, pepperoniY-35, 10, 10);
    ellipse(pepperoniX-35, pepperoniY+35, 10, 10);
    ellipse(pepperoniX+35, pepperoniY-35, 10, 10);
  } 
  if (userSelectIngredient2==true || mushroomStick==true) {//Mushrooms
    fill(#D3B782);
    rectMode(CENTER);
    rect(mushroomX+20, mushroomY+20, 40, 10);
    arc(mushroomX+20+20, mushroomY+20, 20, 30, radians(-90), radians(90));
    rect(mushroomX+20, mushroomY-20, 40, 10);
    arc(mushroomX+20+20, mushroomY-20, 20, 30, radians(-90), radians(90));
    pushMatrix();
    translate(mushroomX, mushroomY);
    rotate(radians(270));
    rect(0+20, 20, 40, 10);
    arc(0+20+20, 20, 20, 30, radians(-90), radians(90));
    rect(0+20, 0-20, 40, 10);
    arc(0+20+20, 0-20, 20, 30, radians(-90), radians(90));
    popMatrix();
    pushMatrix();
    translate(mushroomX, mushroomY);
    rotate(radians(180));
    rect(0+20, 20, 40, 10);
    arc(0+20+20, 20, 20, 30, radians(-90), radians(90));
    rect(0+20, 0-20, 40, 10);
    arc(0+20+20, 0-20, 20, 30, radians(-90), radians(90));
    popMatrix();
    pushMatrix();
    translate(mushroomX, mushroomY);
    rotate(radians(90));
    rect(0+20, 20, 40, 10);
    arc(0+20+20, 20, 20, 30, radians(-90), radians(90));
    rect(0+20, 0-20, 40, 10);
    arc(0+20+20, 0-20, 20, 30, radians(-90), radians(90));
    popMatrix();
  }
  if (userSelectIngredient3==true || onionsStick==true) {//Onions
    noFill();
    strokeWeight(4);
    stroke(185, 108, 147);
    pushMatrix();
    translate(onionsX, onionsY);
    for (int i=0; i<10; i++) {
      arc(0, 0, 20, 20, radians(-45), radians(45));
      arc(10, 0, 20, 20, radians(-45), radians(45));
      arc(20, 0, 20, 20, radians(-45), radians(45));
      arc(30, 0, 20, 20, radians(-45), radians(45));
      arc(40, 0, 20, 20, radians(-45), radians(45));
      rotate(0.65);
    }
    popMatrix();
    fill(0);
    strokeWeight(1);
    stroke(0);
  }
  if (userSelectIngredient4==true || sausageStick==true) {//Sausage
    fill(#906c3f);
    pushMatrix();
    translate(sausageX, sausageY);
    for (int i=0; i<10; i++) {
      ellipseMode(CENTER);
      ellipse(0, 0, 20, 20);
      ellipse(40, 0, 20, 20);
      rotate(0.65);
    }
    popMatrix();
  }
  if (userSelectIngredient5==true || baconStick==true) {//Bacon
    fill(#b41f1f);
    pushMatrix();
    translate(baconX, baconY);
    for (int i=0; i<10; i++) {
      rectMode(CORNERS);
      rect(+20, -5, +55, +5);
      rotate(0.65);
    }
    popMatrix();
  }
  if (userSelectIngredient6==true || olivesStick==true) {//Olives
    noFill();
    strokeWeight(4);
    stroke(50);
    pushMatrix();
    translate(olivesX, olivesY);
    for (int i=0; i<10; i++) {
      ellipseMode(CENTER);
      ellipse(0, 0, 10, 10);
      ellipse(20, 0, 10, 10);
      ellipse(40, 0, 10, 10);
      rotate(0.65);
    }
    popMatrix();
    fill(0);
    strokeWeight(1);
    stroke(0);
  }
  if (userSelectIngredient7==true || bellpepperStick==true) {//Green Bell Pepper
    fill(#456C3B);
    pushMatrix();
    translate(bellpepperX, bellpepperY);
    for (int i=0; i<10; i++) {
      rectMode(CENTER);
      rect(40, 0, 40, 5);
      rotate(0.65);
    }
    popMatrix();
  }

  if (ingredient1Check==true && ingredient2Check == true && cheese==true && sauce==true) {//If the pizza is complete it will turn the boolean for if a pizza is correctly made to true
    pizzaSuccessMade=true;
    ingredient1Check=false;
    ingredient2Check=false;
    sauce=false;
    cheese=false;
  }
  if (gameTimer>=60) {//If time is up the game will go into the after screen
    GAME_STATE="MINI_GAME_DONE";
    gameTimer=0;
    timeCounter=0;
  }
}

void minigameMouseReleased() {
  if (mouseX>200 && mouseX<375 && mouseY>25 && mouseY<100 && userSelectSauce==true) {//If the user presses on the sauce and they have it selected it will put it back;If the user presses on the sauce and they don't have anything selected it will pick it up.
    userSelectSauce=false;
  } else if (mouseX>200 && mouseX<375 && mouseY>25 && mouseY<100 && userSelectIngredient1==false && userSelectIngredient2==false && userSelectIngredient3==false && userSelectIngredient4==false && userSelectIngredient5==false && userSelectIngredient6==false && userSelectIngredient7==false && userSelectSauce==false && userSelectCheese==false) {
    userSelectSauce=true;
  }
  if (mouseX>25 && mouseX<200 && mouseY>25 && mouseY<100 && userSelectCheese==true) {//If the user presses on the cheese and they have it selected it will put it back;If the user presses on the cheese and they don't have anything selected it will pick it up.
    userSelectCheese=false;
  } else if (mouseX>25 && mouseX<200 && mouseY>25 && mouseY<100 && userSelectIngredient1==false && userSelectIngredient2==false && userSelectIngredient3==false && userSelectIngredient4==false && userSelectIngredient5==false && userSelectIngredient6==false && userSelectIngredient7==false && userSelectSauce==false && userSelectCheese==false) {
    userSelectCheese=true;
  }
  if (mouseX>25 && mouseX<375 && mouseY>100 && mouseY<150 && userSelectIngredient1==true) {//If the user presses on the ingredient and they have it selected it will put it back;If the user presses on the ingredient and they don't have anything selected it will pick it up.
    userSelectIngredient1=false;
  } else if (mouseX>25 && mouseX<375 && mouseY>100 && mouseY<150 && userSelectIngredient1==false && userSelectIngredient2==false && userSelectIngredient3==false && userSelectIngredient4==false && userSelectIngredient5==false && userSelectIngredient6==false && userSelectIngredient7==false && userSelectSauce==false && userSelectCheese==false) {
    userSelectIngredient1=true;
  }

  if (mouseX>25 && mouseX<200 && mouseY>150 && mouseY<200 && userSelectIngredient2==true) {//If the user presses on the ingredient and they have it selected it will put it back;If the user presses on the ingredient and they don't have anything selected it will pick it up.
    userSelectIngredient2=false;
  } else if (mouseX>25 && mouseX<200 && mouseY>150 && mouseY<200 && userSelectIngredient1==false && userSelectIngredient2==false && userSelectIngredient3==false && userSelectIngredient4==false && userSelectIngredient5==false && userSelectIngredient6==false && userSelectIngredient7==false && userSelectSauce==false && userSelectCheese==false) {
    userSelectIngredient2=true;
  }

  if (mouseX>200 && mouseX<375 && mouseY>150 && mouseY<200 && userSelectIngredient3==true) {//If the user presses on the ingredient and they have it selected it will put it back;If the user presses on the ingredient and they don't have anything selected it will pick it up.
    userSelectIngredient3=false;
  } else if (mouseX>200 && mouseX<375 && mouseY>150 && mouseY<200 && userSelectIngredient1==false && userSelectIngredient2==false && userSelectIngredient3==false && userSelectIngredient4==false && userSelectIngredient5==false && userSelectIngredient6==false && userSelectIngredient7==false && userSelectSauce==false && userSelectCheese==false) {
    userSelectIngredient3=true;
  }

  if (mouseX>25 && mouseX<200 && mouseY>200 && mouseY<250 && userSelectIngredient4==true) {//If the user presses on the ingredient and they have it selected it will put it back;If the user presses on the ingredient and they don't have anything selected it will pick it up.
    userSelectIngredient4=false;
  } else if (mouseX>25 && mouseX<200 && mouseY>200 && mouseY<250 && userSelectIngredient1==false && userSelectIngredient2==false && userSelectIngredient3==false && userSelectIngredient4==false && userSelectIngredient5==false && userSelectIngredient6==false && userSelectIngredient7==false && userSelectSauce==false && userSelectCheese==false) {
    userSelectIngredient4=true;
  }

  if (mouseX>200 && mouseX<375 && mouseY>200 && mouseY<250 && userSelectIngredient5==true) {//If the user presses on the ingredient and they have it selected it will put it back;If the user presses on the ingredient and they don't have anything selected it will pick it up.
    userSelectIngredient5=false;
  } else if (mouseX>200 && mouseX<375 && mouseY>200 && mouseY<250 && userSelectIngredient1==false && userSelectIngredient2==false && userSelectIngredient3==false && userSelectIngredient4==false && userSelectIngredient5==false && userSelectIngredient6==false && userSelectIngredient7==false && userSelectSauce==false && userSelectCheese==false) {
    userSelectIngredient5=true;
  }

  if (mouseX>25 && mouseX<200 && mouseY>250 && mouseY<300 && userSelectIngredient6==true) {//If the user presses on the ingredient and they have it selected it will put it back;If the user presses on the ingredient and they don't have anything selected it will pick it up.
    userSelectIngredient6=false;
  } else if (mouseX>25 && mouseX<200 && mouseY>250 && mouseY<300 && userSelectIngredient1==false && userSelectIngredient2==false && userSelectIngredient3==false && userSelectIngredient4==false && userSelectIngredient5==false && userSelectIngredient6==false && userSelectIngredient7==false && userSelectSauce==false && userSelectCheese==false) {
    userSelectIngredient6=true;
  }

  if (mouseX>200 && mouseX<375 && mouseY>250 && mouseY<300 && userSelectIngredient7==true) {//If the user presses on the ingredient and they have it selected it will put it back;If the user presses on the ingredient and they don't have anything selected it will pick it up.
    userSelectIngredient7=false;
  } else if (mouseX>200 && mouseX<375 && mouseY>250 && mouseY<300 && userSelectIngredient1==false && userSelectIngredient2==false && userSelectIngredient3==false && userSelectIngredient4==false && userSelectIngredient5==false && userSelectIngredient6==false && userSelectIngredient7==false && userSelectSauce==false && userSelectCheese==false) {
    userSelectIngredient7=true;
  }

  if (dist(mouseX, mouseY, 200, 385)<=65 && userSelectSauce==true && cheese==false && sauce==false) {//If the user presses on the pizza crust with sauce and there is no sauce or cheese applied, apply sauce
    sauce=true;
    sauceStick=true;
    userSelectSauce=false;
  }

  if (dist(mouseX, mouseY, 200, 385)<=65 && userSelectCheese==true && sauce==true && cheese==false) {//If the user presses on the pizza crust with cheese and there is cheese applied but there is sauce, apply cheese
    cheese=true;
    cheeseStick=true;
    userSelectCheese=false;
  }
  if (userSelectRandomIngredient1==true && dist(mouseX, mouseY, 200, 385)<=65 && sauce==true && cheese==true) {//If the user selects the pizza with the proper first random ingredient and sauce and cheese is applied, check what ingredient is correct then make it's sprite apply to the pizza
    if (ingredient1.equals("Pepperoni")) {//Checking which ingredient is correct to find out what sprite to apply
      pepperoniStick=true;
      userSelectIngredient1=false;
    }
    if (ingredient1.equals("Mushrooms")) {
      mushroomStick=true;
      userSelectIngredient2=false;
    }
    if (ingredient1.equals("Onions")) {
      onionsStick=true;
      userSelectIngredient3=false;
    }
    if (ingredient1.equals("Sausage")) {
      sausageStick=true;
      userSelectIngredient4=false;
    }
    if (ingredient1.equals("Bacon")) {
      baconStick=true;
      userSelectIngredient5=false;
    }
    if (ingredient1.equals("Olives")) {
      olivesStick=true;
      userSelectIngredient6=false;
    }
    if (ingredient1.equals("Bell Pepper")) {
      bellpepperStick=true;
      userSelectIngredient7=false;
    }
  }
  if (userSelectRandomIngredient2==true && dist(mouseX, mouseY, 200, 385)<=65 && sauce==true && cheese==true) {//If the user selects the pizza with the proper second random ingredient and sauce and cheese is applied, check what ingredient is correct then make it's sprite apply to the pizza
    if (ingredient2.equals("Pepperoni")) {//Checking which ingredient is correct to find out what sprite to apply
      pepperoniStick=true;
      userSelectIngredient1=false;
    }
    if (ingredient2.equals("Mushrooms")) {
      mushroomStick=true;
      userSelectIngredient2=false;
    }
    if (ingredient2.equals("Onions")) {
      onionsStick=true;
      userSelectIngredient3=false;
    }
    if (ingredient2.equals("Sausage")) {
      sausageStick=true;
      userSelectIngredient4=false;
    }
    if (ingredient2.equals("Bacon")) {
      baconStick=true;
      userSelectIngredient5=false;
    }
    if (ingredient2.equals("Olives")) {
      olivesStick=true;
      userSelectIngredient6=false;
    }
    if (ingredient2.equals("Bell Pepper")) {
      bellpepperStick=true;
      userSelectIngredient7=false;
    }
  }
  if (ingredient1Stick && sauce==true && cheese==true) {//If the first ingredient is applied and sauce and cheese is applied too, the first ingredient check is true
    ingredient1Check=true;
    userSelectRandomIngredient1=false;
    ingredient1Stick=false;
  }
  if (ingredient2Stick && sauce==true && cheese==true) {//If the first ingredient is applied and sauce and cheese is applied too, the second ingredient check is true
    ingredient2Check=true;
    userSelectRandomIngredient2=false;
    ingredient2Stick=false;
  }
}
void minigameAfterScreen() {
  clear();
  backgroundBricks();
  fill(0);
  textFont(font2);
  textAlign(LEFT,BASELINE);
  textSize(30);
  text("You made a valliant effort! Congratulations your score on this round of the pizza game was "+score, 400, 250, 700, 400);
  textFont(font1);
  text("Press press any key to go back to main menu!",60,430);
}
void goodbye() {
  clear();
  backgroundBricks();
  fill(0);
  textAlign(LEFT, BASELINE);
  textFont(font2);
  text("We are so sad to see you leave, hope you had fun!\nThank you for playing The Adventure of the Pizza Delivery Man made by Krish Patel!", 50, 50, 750, 450);
}
