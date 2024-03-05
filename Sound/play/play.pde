import processing.sound.*;

SoundFile song;

void setup() {
  size(640, 360);
  song = new SoundFile(this, "Birth_of_Life.mp3");
  song.play();
}

void draw() {
}

boolean playing = true;

void mousePressed() {
  if (playing) {
    song.stop();
    playing = false;
  } else {
    song.play();
    playing = true;
  }
}
