class Viewer {
  public int numRays;
  public Ray[] rays;
  public ArrayList<String> items = new ArrayList<String>();

  public Viewer(int numRays_) {
    numRays = numRays_;
    rays = new Ray[numRays];
    for (int i=0; i<numRays; i++) {
      rays[i] = new Ray(50, 50, i * (PI / (rays.length / 2)), 0);
    }
  }
  public void move(float x, float y) {
    for (Ray r : rays) {
      r.move(x, y);
    }
  }

  public Ray get(int place) {
    return rays[place];
  }

  public void isIntersectingWall(Boundary[] b) {
    float x = rays[0].x;
    float y = rays[0].y;
    Ray[] r = new Ray[10];
    for (int i=0; i < r.length; i++) {
      r[i] = new Ray(x, y, (TAU / 10) * i, 3);
    }
    for (Ray R : r) {
      if (R.intersectingArr(b)) {
        move(50,50);
      }
    }
  }

  public void renderArrowMovement(Boundary[] b) {
    fill(127);
    stroke(127);
    beginShape();

    for (int i=0; i<rays.length; i++) {
      for (int j=0; j<40; j++) {
        // Checking for Intersections
        if (rays[i].intersectingArr(b)) {

          // Ray will stop moving once it sees that it has intersected a line
          rays[i].stopMarching();
        } else if (rays[i].r * cos(rays[i].t) + rays[i].x > 1.5 * width || 
          rays[i].r * cos(rays[i].t) + rays[i].x < -0.5 * width || 
          rays[i].r * sin(rays[i].t) + rays[i].y > 1.5 * height || 
          rays[i].r * sin(rays[i].t) + rays[i].y < -0.5 * height) {

          // Ray will stop marching if it gets too long
          rays[i].stopMarching();
        }

        // Marching the ray
        if (rays[i].marching) {
          if (keyPressed) {
            if (keyCode == UP) {
              rays[i].move(rays[i].x, rays[i].y - 0.1);
            } else if (keyCode == DOWN) {
              rays[i].move(rays[i].x, rays[i].y + 0.1);
            } else if (keyCode == LEFT) {
              rays[i].move(rays[i].x - 0.1, rays[i].y);
            } else if (keyCode == RIGHT) {
              rays[i].move(rays[i].x + 0.1, rays[i].y);
            }
          } 
          rays[i].march(bounds);
        } else {
          if (keyPressed) {
            if (keyCode == UP) {
              rays[i].move(rays[i].x, rays[i].y - 0.1);
            } else if (keyCode == DOWN) {
              rays[i].move(rays[i].x, rays[i].y + 0.1);
            } else if (keyCode == LEFT) {
              rays[i].move(rays[i].x - 0.1, rays[i].y);
            } else if (keyCode == RIGHT) {
              rays[i].move(rays[i].x + 0.1, rays[i].y);
            }
          }
        }
      }
    }
    strokeWeight(3);
    for (int i=0; i<rays.length; i++) {

      //Displaying the endpoint of the ray
      stroke(255, 100, 50);

      stroke(255);
      vertex(rays[i].r * cos(rays[i].t) + rays[i].x, rays[i].r * sin(rays[i].t) + rays[i].y);

      //Resetting each ray so that the while thing can happen again next frame
      rays[i].resetR();
      rays[i].beginMarching();
    }
    endShape();
    stroke(255, 50, 60);
    strokeWeight(8);
    point(rays[0].x, rays[0].y);

    fill(255, 255, 0);
    String itemList = "";
    for (String item : items) {
      itemList = itemList + item + " ";
    }
    textSize(20);
    text("Items: " + itemList, 20, 20);
  }
}
