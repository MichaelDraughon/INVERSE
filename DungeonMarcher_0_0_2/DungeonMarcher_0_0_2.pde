public Boundary bound1 = new Boundary(-50, 100, 500, 100.1);
public Boundary bound2 = new Boundary(100, 300, 700, 150);
public Boundary[] bounds = new Boundary[]{bound1, bound2};
Viewer v = new Viewer(595);
Item k = new Item(0, 100, 400, 20);
Door d = new Door(750, 500, 50,100);
void setup() {
  size(800, 600);
}

void draw() {
  println(frameRate);
  background(0);
  
  k.show();
  d.show();
  v.renderArrowMovement(bounds);
  v.isIntersectingWall(bounds);
  k.collect(v);
  
  if (v.items.contains("Key")) {
    d.unlock(v);
  }
}
