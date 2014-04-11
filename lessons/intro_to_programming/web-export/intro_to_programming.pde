//Jacqui's Code,

Planet earth;
Planet sun;

ArrayList<Meteor> mets;

void setup() {
  size(600, 600);
  frameRate(25);
  background(255);
  earth = new Planet();
  earth.name = "Earth";
  earth.myColor = color(0, 0, 255);
  earth.dx = earth.dy = -5;
  earth.loc[0] = 58;

  sun = new Planet();
  sun.name = "Sun";
  sun.mySize = 150;
  sun.dx = sun.dy = 5;

  mets = new ArrayList<Meteor>();
}

void draw() {
  background(255);

  sun.drawPlanet();// give it mets as a parameter
  earth.drawPlanet();//same comment as above
  earth.checkPlanetBounce(sun);
  

  for ( Meteor met : mets) {
    met.drawPlanet();
    
      //create a new function with the inputs being the x,y of the planets
  met.checkPlanetBounce(sun);
  met.checkPlanetBounce(earth);
  for(Meteor othermet: mets){
  if(met != othermet){
  met.checkPlanetBounce(othermet);
  }
  }
  

  }
}

void mouseClicked() {
  mets.add( new Meteor() );
}

void keyPressed() {
  if ( key == 'd' ){
    if ( !mets.isEmpty() ) {
      mets.remove(0);
    }
  } else if ( key == 'f' ) {
    for ( int i = 0; i < mets.size(); i++) {
      Meteor met = (Meteor) mets.get(i);
      if ( !met.followMouse ){
        met.followMouse = true;
        break;
      }
    }
  } else if ( key == 's' ) {
    for ( int i = 0; i < mets.size(); i++) {
      Meteor met = (Meteor) mets.get(i);
      if ( met.followMouse ){
        met.followMouse = false;
        break;
      }
    }
  }
}

public class Planet{
  float[] loc;
  color myColor;
  float mySize;
  float dx, dy;
  String name;

  
  public Planet(){
    println("making an planet");
    loc = new float[2];
    assignDefaultValues();
  }
  
  void assignDefaultValues(){
    println("assigning values");
    name = "a planet";
    loc[0] = random(100,500);
    loc[1] = random(100,500);
    myColor = color(255,255,0);
    mySize = 50;
    dx = dy = 10;
    
  }
  
  boolean isCollidingX(int x0, int x1) {
    if ( loc[0] + mySize / 2 >= x0 || loc[0] - mySize / 2 <= x1 )
      return true;
    return false;
  }

  boolean isCollidingY(int y0, int y1) {
    if ( loc[1] + mySize / 2 >= y0 || loc[1] - mySize / 2 <= y1 )
      return true;
    return false;
  }

  void checkEdgeBounce() {
        if (  isCollidingX(width,0)) 
      dx *= -1;
    if ( isCollidingY(height, 0) ) 
      dy *= -1;
  }
  
  //create a new function with the inputs being the x,y of the planets
  void checkPlanetBounce(Planet planet) {
    float a, b, c;
    a = planet.loc[0] - loc[0];
    b = planet.loc[1] - loc[1];
    c = sqrt(pow(a,2) + pow(b,2));
  if (c <= mySize/2 + planet.mySize/2){
    dx *= -1;
    dy *= -1;
    planet.dx *= -1;
    planet.dy *= -1;
    println("a"+a+"   b"+b+"   c"+c);
    //earth.dx *= -1;
    //earth.dy *= -1;
  }
  }
  //I'm still working on a for loop that will cyle through all the planets including the meteors
 
  
  void drawPlanet(){
    fill(myColor);
    ellipse(loc[0], loc[1], mySize, mySize);
    checkEdgeBounce();
    /*for(met:mets){
      if(isColliding*/
      
    loc[0] += dx;
    loc[1] += dy;
    
  }
}

public class Meteor extends Planet {
  
  boolean followMouse;
  
  public Meteor(){
    super();
    println("actually im a meteor");
    
    myColor = color( random(255), random(255), random(255),80 );
    
    dx = (int) 10;//random(3, 17);
    dy = (int) 10;//random(3, 17);
    
    followMouse = false;
  }
  
  void drawPlanet(){
    if ( followMouse ) {
      fill(myColor);
      loc[0] = mouseX;
      loc[1] = mouseY;
      text("Mooo", loc[0], loc[1]);//I just changed this to see what would happen and decided to leave it
    }
    else{
      super.drawPlanet();
    }
    
  }
  
}

