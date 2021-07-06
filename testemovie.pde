import processing.video.*;
Movie myMovie;
Movie myMovieBg;
float sizeControl = 0;

void setup() {
  size(800, 600);
  myMovie = new Movie(this, "TnEAlice.m4v");
  myMovie.loop();
  myMovieBg = new Movie (this, "Alice.mp4");
  myMovieBg.loop();
  sizeControl= width/255;
  
}

void draw() {
  
  tint(255,255);
  image(myMovieBg,0,0,800,600);
  tint(255, (mouseX/sizeControl));
  image(myMovie,0,0,800,600);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
