void addBird() {
  Bird bird = new Bird(level.xPosition, height/2);
  level.birds.add(bird);
  level.xPosition += bird.radius*2;
}

void addPipe(int gapOffset, int gapSize) {
   int width = 50;
   level.pipes.add(new Pipe(level.xPosition, gapOffset, gapSize, width));
   level.xPosition += width;
}

void addPipe() {
   int gapOffset = 50;
   int gapSize = 500;
   int width = 50;
   level.pipes.add(new Pipe(level.xPosition, gapOffset, gapSize, width));
   level.xPosition += width;
}

void addGap(int width) {
  level.xPosition += width;
}

void addFinish() {
  if (level.finishPosition == -1)
    level.finishPosition = level.xPosition;
  level.xPosition += level.finishWidth;
} 
