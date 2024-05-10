class Bird {
  float x, y;
  float yVelocity = 0;
  float radius = 10;
  
  float xVelocity = 1;
  float gravity = 0.2;
  float friction = -0.9;
  float jumpSpeed = -5;
  
  color colour = color(100, 0, 100);
 
  Bird(float x, float y) {
    this.x = x;
    this.y = y;
  } 
  
  void move() {
    yVelocity += gravity;
    x += xVelocity;
    y += yVelocity;
  }
  
  void flap() {
     yVelocity = jumpSpeed; 
  }
  
  void checkForCollision(ArrayList<Pipe> pipes) {
    if (y < 0 || y > height) {
      level.gameOver();
    }
    for (Pipe pipe : pipes) {
      //TODO: This collides a bounding box around the bird, not a circle
      if (x + radius > pipe.x && x - radius < pipe.x + pipe.width && 
        (y - radius < pipe.gapOffset || y + radius > pipe.gapOffset + pipe.gapSize)) {
        level.gameOver();
      }
    }
  }
  
  void draw(int xOffset) {    
    fill(colour);
    ellipse(x + xOffset, y, radius*2, radius*2);
  }
}
