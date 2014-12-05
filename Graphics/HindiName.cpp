// Name in hindi
#include <graphics.h>
#include <iostream.h>
#include <conio.h>

struct Point { int x, y; } max, origin;

void draw(Point p, int color = WHITE) {
  putpixel(origin.x + p.x, origin.y - p.y, color);
}

void beizer(Point p[], int color = WHITE, float precision = 0.001f) {
  Point temp = {0,0};
  for(float u = 0; u <= 1; u += precision) {
    temp.x = (1 - u)*(1 - u)*(1 - u)*p[0].x + 3*(1 - u)*(1 - u)*u*p[1].x +
	     3*(1 - u)*u*u*p[2].x + u*u*u*p[3].x;
    temp.y = (1 - u)*(1 - u)*(1 - u)*p[0].y + 3*(1 - u)*(1 - u)*u*p[1].y +
	     3*(1 - u)*u*u*p[2].y + u*u*u*p[3].y;
    draw(temp, color);
  }
}



void init(int* gd, int* gm) {
  initgraph(gd, gm, "c:\\tc\\bgi");
  clrscr();
  max.x = getmaxx(); max.y = getmaxy();
  origin.x = max.x/2; origin.y = max.y/2;
  setbkcolor(BLUE); setcolor(CYAN);
  line(0,origin.y, max.x,origin.y);
  line(origin.x,0, origin.x,max.y);
  setcolor(RED);
}

int main(void) {
  int gd = DETECT, gm;
  Point controls[8][4] = {
    /* ee  */ { {30,50},{30,100},{80,100},{80,50} },
    /* duh */ { {80,40},{40,40},{40,10},{80,10} },
    /* va  */ { {130,40},{90,40},{90,10},{130,10} },
    /* ja  */ { {140,25},{140,0},{165,0},{165,25} },
    /* ya  */ { {170,50},{180,35},{190,25},{170,20}},
    /* ya  */ { {170,20},{170,0},{210,0},{210,20}},
    /* oo  */ { {220,75},{190,105},{190,50},{220,75} },
    /* tuh */ { {250,0},{250,25},{255,25},{280,25} }
  };

  init(&gd, &gm);

  // lakeer
  line(origin.x, origin.y - 50, origin.x + 300, origin.y - 50);

  // ee
  line(origin.x + 30, origin.y, origin.x + 30, origin.y - 50);
  beizer(controls[0], RED);

  // duh
  line(origin.x + 80, origin.y - 50, origin.x + 80, origin.y - 40);
  line(origin.x + 80, origin.y - 10, origin.x + 80, origin.y);
  beizer(controls[1], RED);

  // va
  line(origin.x + 130, origin.y - 50, origin.x + 130, origin.y);
  beizer(controls[2], RED);

  // ja
  line(origin.x + 165, origin.y - 25, origin.x + 180, origin.y - 25);
  beizer(controls[3], RED);

  // ya
  line(origin.x + 210, origin.y - 50, origin.x + 210, origin.y);
  beizer(controls[4], RED);
  beizer(controls[5], RED);

  // oo
  line(origin.x + 240, origin.y - 50, origin.x + 240, origin.y);
  line(origin.x + 220, origin.y - 75, origin.x + 240, origin.y - 50);
  beizer(controls[6], RED);

  // t
  line(origin.x + 280, origin.y - 50, origin.x + 280, origin.y);
  beizer(controls[7], RED);

  getch();
  return 0;
}
