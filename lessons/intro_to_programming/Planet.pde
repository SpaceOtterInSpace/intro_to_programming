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
    loc[0] = random(100,width-100);
    loc[1] = random(100,width-100);
    //myColor = color(255,255,0);
    mySize = random(10,100);
    dx = dy = random(-5,5);
    
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

 
  
  void drawPlanet(){
    fill(myColor);
    otters = loadImage("otter_space.png");
    image(otters,loc[0],loc[1],mySize,mySize);
    //ellipse(loc[0], loc[1], mySize, mySize);
    checkEdgeBounce();
    /*for(met:mets){
      if(isColliding*/
      
    loc[0] += dx;
    loc[1] += dy;
    
  }
}

public class Otters extends Planet{
  void drawPlanet(){
    otters = loadImage("otter_space.png");
    image(otters,loc[0],loc[1],100,100);
  }
}
  

public class Meteor extends Planet {
  
  boolean followMouse;
  
  public Meteor(){
    super();
    println("actually im a meteor");
    
    //myColor = color( random(255), random(255), random(255),80 );
    
    dx = (int) 1;//random(3, 17);
    dy = (int) 1;//random(3, 17);
    
    followMouse = false;
  }
  
  void drawPlanet(){
    if ( followMouse ) {
      //fill(myColor);
      loc[0] = mouseX;
      loc[1] = mouseY;
      otters = loadImage("otter_space.png");
      image(otters,loc[0],loc[1],50,50);
      //text("Mooo", loc[0], loc[1]);//I just changed this to see what would happen and decided to leave it
    }
    else{
      super.drawPlanet();
    }
    
  }
  
}
