enum GameState {
  PLAYING,
  GAMEOVER,
  WIN,
  PAUSED
}

class Level {
  ArrayList<Bird> birds = new ArrayList<Bird>();
  ArrayList<Pipe> pipes = new ArrayList<Pipe>();
  int finishPosition = -1;
  GameState state = GameState.PLAYING;
  int finishWidth = 20;
  int xPosition = 0;
  float score;
  
  void pause() {
    if (state == GameState.PLAYING)
      state = GameState.PAUSED;
    else if (state == GameState.PAUSED)
      state = GameState.PLAYING;
  }
  
  void update() {
    if (state == GameState.PLAYING) {
      score += (1f/60f);
      for (Bird bird : birds) {
        bird.checkForCollision(pipes);
        bird.move();
      }
    }
    if (birds.get(0).x > finishPosition)
      state = GameState.WIN;
  }
  
  void gameOver() {
    state = GameState.GAMEOVER;
  }
  
  void playerClick() {
    if (state == GameState.PLAYING)
    {
      for (Bird bird : birds) {
        bird.flap();
      }
    }
    else if (state == GameState.GAMEOVER || state == GameState.WIN) {
      frameCount = -1;
    }
  }
  
  void draw() {
    int xOffset = width/6 + (int) -birds.get(0).x;
    background(0);
    for (Pipe pipe : pipes) {
      pipe.draw(xOffset);  
    }
    for (Bird bird : birds) {
      bird.draw(xOffset);  
    }
    if (state == GameState.GAMEOVER) {
      fill(255,255,255);
      textSize(width/10);
      text("Game Over", width/2, height/2);
      text("Score " + (int) score, width/2, height/2 + (width/10));
    }
    else if (state == GameState.WIN) {
      fill(255,255,255);
      textSize(width/10);
      text("Win", width/2, height/2);
      text("Score " + (int) score, width/2, height/2 + (width/10));
    }
    else if (state == GameState.PAUSED) {
      fill(255,255,255);
      textSize(width/30);
      text("Press (p) to resume", width/2, height/2);
    }
    
    fill(255, 255, 0);
    rect(finishPosition + xOffset, 0, finishWidth, height);
    
    fill(255, 255, 255);
    textSize(width/10);
    text((int) score, 0, height);
    
  }
}
