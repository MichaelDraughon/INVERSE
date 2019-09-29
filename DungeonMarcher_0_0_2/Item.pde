class Item{
  public int type;
  public float x;
  public float y;
  public float size;
  public Item(int type_, float x_, float y_, float size_) {
    type = type_;
    x = x_;
    y = y_;
    size = size_;
    if (type > 0) {
      System.err.print("ERR: Item type does not exist");
    }
  }
  
  public void show() {
    stroke(255);
    fill(235, 168, 52);
    strokeWeight(1);
    rect(x, y, size, size);
  }
  
  public void collect(Viewer v) {
    String[] items = {"Key"};
    if (v.rays[0].x > x && v.rays[0].x < x + size && v.rays[0].y > y && v.rays[0].y < y + size) {
      v.items.add(items[type]);
      x = -100;
      y = -100;
      size = 1;
    }
  }
}
