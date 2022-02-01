/*
The purpose of this class is to display a starting image
*/

class firstScene {
  PImage image;
  secondScene secondSceneClass;
  firstScene() {
    rectMode(CENTER);
    image = loadImage("photo1.png");
    imageMode(CENTER);
    secondSceneClass = new secondScene();
  }

  void display() {
    background(color(35, 48, 84));
    fill(255);
    image(image, width/2, height/2, 506, 396);
  }
}
