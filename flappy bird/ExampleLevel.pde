void createExample1() {
  addBird();
  addGap(200);
  for (int i=0;i<100;i++)
  {
    int gap = (int) random(250, height - 50);
    addPipe((int) random(10, height-gap -10), gap);
    addGap(100);
  }
  addFinish();
}

void createExample2() {
  addBird();
  addGap(200);
  addPipe();
  addGap(100);
  addPipe();
  addGap(100);
  addPipe();
  addGap(100);
  addFinish();
}
