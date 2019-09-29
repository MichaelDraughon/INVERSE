class Door {
  public float x;
  public float y;
  public float h;
  public float w;
  public Door(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }
  
  public void show() {
    stroke(255);
    strokeWeight(1);
    fill(115, 73, 1);
    rect(x, y, w, h);
  }
  
  public void unlock(Viewer v) {
    if (v.rays[0].x > x && v.rays[0].x < x + w && v.rays[0].y > y && v.rays[0].y < y + h) {
      x = -100;
      y = -100;
      w = 1;
      h = 1;
      v.items.remove("Key");
    }
  }
}
