Level level;

void settings() {
  size(1024, 768);
}

void setup() {
  level = new Level();
  createExample2();
}

void draw() {
  level.update();
  level.draw();
}

void mousePressed() {
  level.playerClick(); 
}

void keyPressed() {
  if (key == 'p')
     level.pause(); 
}
