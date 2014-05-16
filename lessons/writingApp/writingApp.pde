
WritingUtensil my_utensil;

void setup(){
  size(600,600,P3D);
  frameRate(25);
  my_utensil = new WritingUtensil();
  my_utensil.my_color = color(100,200,255);
  my_utensil.location = new PVector(width/2,height/2,100);
  my_utensil.orientation = new PVector(PI/5,0,0);
  background(100);
}

void draw(){
  background(100);
  my_utensil.spin(new PVector(PI/100,0,PI/100));
  my_utensil.render(true);
  //my_utensil.location = new PVector(mouseX,mouseY,100);
}

/*void keyPressed() {
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
*/
