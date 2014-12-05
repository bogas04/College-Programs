// Smiley
#include <graphics.h>
#include <iostream.h>
#include <conio.h>
#include <math.h>

struct Point { int x, y; }origin, max;

void draw(Point p, int color = WHITE) {
  putpixel(origin.x + p.x, origin.y - p.y, color);
}

void beizer(Point p[], int color = YELLOW, float precision = 0.01f) {
  Point temp = {0,0};
  for(float u = 0; u <= 1; u += precision) {
    temp.x = pow((1 - u),3)*p[0].x + 3*pow((1 - u),2)*u*p[1].x +
	     3*(1 - u)*pow(u,2)*p[2].x + pow(u,3)*p[3].x;
    temp.y = pow((1 - u),3)*p[0].y + 3*pow((1 - u),2)*u*p[1].y +
	     3*(1 - u)*pow(u,2)*p[2].y + pow(u,3)*p[3].y;
    draw(temp, color);
  }
}

void draw8(Point center,Point p, int color = YELLOW) {
  center.x += origin.x;
  center.y = (origin.y - center.y);
  putpixel(center.x + p.x, center.y - p.y, color);
  putpixel(center.x - p.x, center.y - p.y, color);
  putpixel(center.x + p.x, center.y + p.y, color);
  putpixel(center.x - p.x, center.y + p.y, color);
  putpixel(center.x + p.y, center.y - p.x, color);
  putpixel(center.x - p.y, center.y - p.x, color);
  putpixel(center.x + p.y, center.y + p.x, color);
  putpixel(center.x - p.y, center.y + p.x, color);
}
void drawCircle(Point center, int radius, int color = YELLOW) {
  Point temp = {0, radius};
  Point temp2;
  float d = (5/4.0) - radius;

  while(temp.y >= temp.x) {
    draw8(center, temp, color);
    if(d <= 0) {
      d += (2*temp.x + 3);
    } else {
      d += (2*temp.x - 2*temp.y + 5);
      temp.y--;
    }
    temp.x++;
  }
}
void init(int* gd, int* gm) {
  initgraph(gd, gm, "c:\\tc\\bgi");
  origin.x = getmaxx()/2; origin.y = getmaxy()/2;
  max.x = getmaxx(); max.y = getmaxy();
  setbkcolor(BLUE);
  line(origin.x, 0, origin.x, max.y);
  line(0, origin.y, max.x, origin.y);
  clrscr();
}

int main(void) {
  int gd = DETECT, gm, i;
  // Point center = {50, 50};
  init(&gd, &gm);
  // drawCircle(center, 100, YELLOW);

  Point controls[] = {
    {-70,-30},
    {-30,-90},
    {30,-90},
    {70,-30}
  };
  Point centers[] = {
    {0,0},
    {-40,30},
    {40,30}
  };
  int radii[] = {
    100,
    20,
    20
  };
  for(i = 0; i < 3; i++) {
    drawCircle(centers[i], radii[i], YELLOW);
  }

  setfillstyle(SOLID_FILL,YELLOW);
  floodfill(origin.x, origin.y - 1, YELLOW);

  setfillstyle(SOLID_FILL,WHITE);
  floodfill(origin.x + 41,origin.y - 31,YELLOW);
  floodfill(origin.x - 41,origin.y - 31,YELLOW);

  beizer(controls, RED, 0.005);


  getch();
  return 0;
}
