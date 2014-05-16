//Jacqui's Code,

Planet earth;
Planet sun;
//PShape otter;
PImage otters;
PImage img;

ArrayList<Meteor> mets;

void setup() {
  size(600,600);
  frameRate(25);
  img = loadImage("Nebula_fractal.jpg");
  img.resize(600,600);
  background(img);
  //background(255);
  earth = new Planet();
  earth.name = "Earth";
  //earth.myColor = color(0, 0, 255);
  //earth.dx = earth.dy = -1;
  earth.loc[0] = 58;

  sun = new Planet();
  sun.name = "Sun";
  sun.mySize = 150;
  sun.dx = sun.dy = 1;
  
  //otter = loadShape("otter_space.svg");
  //otters = loadImage("otter_space.png");
  //otter.resize(50,50);

  mets = new ArrayList<Meteor>();
}

void draw() {
  //background(255);
  background(img);
  sun.drawPlanet();// give it mets as a parameter
  earth.drawPlanet();//same comment as above
  earth.checkPlanetBounce(sun);
  //otter = loadImage("http://fc09.deviantart.net/fs51/f/2009/324/3/6/Space_Otter_by_TheEvilGenius.jpg");
  //otter.resize(70,70);
  //shape(otter,30,40,30,30);
  //image(otters,100,100,50,50);


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

