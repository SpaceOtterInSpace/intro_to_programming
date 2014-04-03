public class Planet{
  int[] loc;
  color myColor;
  int mySize;
  int dx, dy;
  String name;
  
  public Planet(){
    println("making an planet");
    loc = new int[2];
    assignDefaultValues();
  }
  
  void assignDefaultValues(){
    println("assigning values");
    name = "a planet";
    loc[0] = 100;
    loc[1] = 200;
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
  void checkPlanetBounce() {
  if (pow(pow(sun.loc[1] - earth.loc[1],2) + pow(sun.loc[0] - earth.loc[0],2),0.5) < sun.mySize/2 + earth.mySize/2) 
    sun.dx *= -1;
    //sun.dy *= -1;
    earth.dx *= -1;
    //earth.dy *= -1;
  }
  //I'm still working on a for loop that will cyle through all the planets including the meteors
  
  
  void drawPlanet(){
    fill(myColor);
    ellipse(loc[0], loc[1], mySize, mySize);
    checkEdgeBounce();
    checkPlanetBounce();
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
    
    dx = (int) random(3, 17);
    dy = (int) random(3, 17);
    
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
