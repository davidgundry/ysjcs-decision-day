class Pipe {
 
  float x;
  float width;
  float gapOffset;
  float gapSize;
  color colour = color(125, 255, 125);
  int red, green, blue;
  
  Pipe(int x, int gapOffset, int gapSize, int width) {
    this.x = x;
    this.width = width;
    this.gapOffset = gapOffset;
    this.gapSize = gapSize;
    
    this.red = int(random(256));
    this.green = int(random(256));
    this.blue = int(random(256));
    
    //this.colour = color(this.red,this.green,this.blue);
  }
  
  void draw(int xOffset) {
    fill(colour);
    rect(x + xOffset, 0, width, gapOffset);
    float bottomY = gapOffset + gapSize;
    rect(x + xOffset, bottomY, width, height-bottomY);
  }
  
}
