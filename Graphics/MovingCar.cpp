// Indian Flag
#include <graphics.h>
#include <iostream.h>
#include <conio.h>
#include <math.h>
#include <dos.h>

struct Point { int x,y; }origin, max;
class Polygon {
  private :
  Point* points;
  int size;
  int color;
  public :
  Polygon(Point p[], int s, int c = WHITE) {
    points = p;
    size = s;
    color = c;
  }
  void draw(int);
  void shift(int, int);
};
void Polygon :: draw(int color = WHITE) {
  setcolor(color);
  for(int i = 0; i < size; i++) {
    line(origin.x + points[i].x,origin.y - points[i].y,
	 origin.x + points[(i + 1)%size].x,origin.y - points[(i + 1)%size].y);
  }
  setcolor(WHITE);
}
void Polygon :: shift(int x = 1, int y = 0) {
  for(int i = 0; i < size; i++) {
    points[i].x += x;
    points[i].y += y;
  }
}

class Circle {
  private:
  Point center;
  int radius;
  int color;
  int flip;
  public:
  Circle(Point p, int r, int c) {
    center = p;
    radius = r;
    color = c;
    flip = 0;
  }
  void draw(int color = WHITE) {
    float rbyroot2 = radius/sqrt(2);
    setcolor(color);
    if(flip % 2 == 0) {
      line(origin.x + (center.x + rbyroot2),origin.y - (center.y + rbyroot2),
	origin.x + (center.x - rbyroot2),origin.y - (center.y - rbyroot2)
      );
      line(origin.x + (center.x - rbyroot2),origin.y - (center.y + rbyroot2),
	origin.x + (center.x + rbyroot2),origin.y - (center.y - rbyroot2)
      );
    } else {
      line(origin.x + center.x, origin.y - (center.y + radius),
      origin.x + center.x, origin.y - (center.y - radius));
    }
    circle(origin.x + center.x, origin.y - center.y, radius);
    setcolor(WHITE);
  }
  void shift(int x = 1, int y = 0) {
    center.x += x;
    center.y += y;
    flip++;
  }
};

void init(int* gd,int *gm) {
  initgraph(gd, gm, "c:\\tc\\bgi");
  setbkcolor(BLACK);
  setcolor(WHITE);
  clrscr();
  max.x = getmaxx();
  max.y = getmaxy();
  origin.x = max.x/2;
  origin.y = max.y/2;
}

int main(void) {
  int gd = DETECT, gm;
  init(&gd, &gm);

  Point car_chasis[] = {
    {0,0},{0,50},{50,50},{50,100},
    {160,100},{220,50},{270,50},{270,0}
  };

  Point car_wheels[] = {
    {50,0},{210,0}
  };

  Point car_windows[2][4] = {
    { {55,50},{55,95},{130,95},{130,50} },
    { {135,50},{135,95},{155,95},{210,50}}
  };

  Polygon windows[] = {
    Polygon(car_windows[0],4),
    Polygon(car_windows[1],4)
  };

  Circle wheels[] = {
    Circle(car_wheels[0],20,BLACK),
    Circle(car_wheels[1],20,BLACK)
  };
  Polygon chasis = Polygon(car_chasis,8,BLACK);

  chasis.shift(-200);
  windows[0].shift(-200);
  windows[1].shift(-200);
  wheels[0].shift(-200);
  wheels[1].shift(-200);

  for(int frames = 0; frames < 60; frames++) {

    chasis.draw(BLACK);
    windows[0].draw(BLACK);
    windows[1].draw(BLACK);
    wheels[0].draw(BLACK);
    wheels[1].draw(BLACK);

    delay(100);

    chasis.draw(LIGHTGRAY);
    windows[0].draw(LIGHTGRAY);
    windows[1].draw(LIGHTGRAY);
    wheels[0].draw(LIGHTGRAY);
    wheels[1].draw(LIGHTGRAY);

    chasis.shift(5);
    windows[0].shift(5);
    windows[1].shift(5);
    wheels[0].shift(5);
    wheels[1].shift(5);
  }
  getch();
  closegraph();
  return 0;
}
