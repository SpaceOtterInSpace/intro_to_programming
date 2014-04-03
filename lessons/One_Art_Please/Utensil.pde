public class Utensil{
  color myColor;
  float bodyHeight;
  float bodyRadius;
  float tipHeight;
  float tipRadius;
  String name;
  int[] loc;
  float neckSlope;
  //float orientation;
  String content;
  
  public Utensil(){
    println("making stuff");
    loc = new int[2];
    assignDefaultValues();
}

void assignDefaultValues(){
  name = "a utensil";
  loc[0] = 100;
  loc[1] = 200;
  myColor = color(255,255,0);
  bodyHeight = 50;
  bodyRadius = 50;
  tipHeight = 10;
  tipRadius = 5;
  neckSlope = 4;
  content = "stuff";
}
}
