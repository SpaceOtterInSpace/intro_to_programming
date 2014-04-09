void setup(){
  size(600,600,P3D);
}

void draw(){
  background(#C26CCE);
  noFill();
  text("i will making a writing utensil!",100,100);
  //fill(0,69,90);
  text("I can't find the updog",300,304);
  //stroke(0);
  

  translate(width/2, height/2, 200);
  rotateY(PI/5);
  rotateX(PI/9);
  box(10,20,20);
  //myWritingUtensil.write()

}
