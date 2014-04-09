public class WritingUtensil{
    color my_color;
    int body_height;
    int body_radius;
    int tip_height;
    int tip_radius;
    String name;
    PVector location; 
    float neck_slope ;
    PVector orientation; 
    Content content;
    
    public WritingUtensil(){
    }
    
  //returns the overall height of the writing utensil
  int height(){
  return 0;
  }
  
  //write puts pigment of contens on the screen
  //as of now it accepts no parameters
  void write(){
    //might be a good way to handle this..
    //write(1.0);
  }
  
  //write puts pigment of contens on the screen
  //accepts one parameter, that is the pressure being applied to the utensil
  void write (float pressureUsed){
    //call derteriorationRate and pass to a conten.derteriorate. e.g.:
    // conent.derteriorate(derteriorationRate());
  }
  
  // "removies" pigment from screen.
  // removes pigment by drawing the passed in background color
  // size of mark is going to be determined by the body radius
  //accpets one parameter, the color of the background
  void erase(color color_of_background){
    //might be a good way to handle this..
    //erase(color_of_background, 1.0);
  }
  
  //erase removes pigment from screen, and distorts the erase size based on pressure
  //accpets one parameter, the color of the background and the pressure applied
  void erase(color color_of_background, float pressure_used){
  }
  
  //derteriorationRate calculates how quickly the contens get used up
  //returns a float representation of that.
  float deteriorationRate(float pressure_used){
    return 0.0;
  }
  
  float contentVolume(){
     return 0.0;
  }
  
  float updateContentsVolume(){
  return contentVolume();
  }
  
  //draws the writing utensil shell to the screen
  void render(){
  }
  
  //set the content of the writing utensil to the passed in content
  // accepts one parameter, the content to set to
  void setContents(Content content){
  }
}
