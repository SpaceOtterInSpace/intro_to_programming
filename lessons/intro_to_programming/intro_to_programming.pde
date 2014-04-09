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

