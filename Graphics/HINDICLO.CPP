// Hindi Digital Clock

#include <iostream.h>
#include <conio.h>
#include <graphics.h>
#include <math.h>
#include <dos.h>
#include <time.h>

struct Point { int x, y; }origin, max;

void draw(Point p,int color = WHITE) {
  putpixel(origin.x + p.x, origin.y - p.y, color);
}

void beizer(Point p[], float precision = 0.01f, int color = WHITE) {
  Point temp = {0,0};
  for(float u = 0; u <= 1; u += precision) {
    temp.x = (1 - u)*(1 - u)*(1 - u)*p[0].x + 3*(1 - u)*(1 - u)*u*p[1].x +
	     3*(1 - u)*u*u*p[2].x + u*u*u*p[3].x;
    temp.y = (1 - u)*(1 - u)*(1 - u)*p[0].y + 3*(1 - u)*(1 - u)*u*p[1].y +
	     3*(1 - u)*u*u*p[2].y + u*u*u*p[3].y;
    draw(temp, color);
  }
}

void drawNumber(Point p, int v, int color = WHITE) {
  Point pc[4];
  setcolor(color);
  switch(v) {
    case 0 :
      ellipse(origin.x + p.x, origin.y - p.y - 10, 0, 360, 5, 10);
    break;
    case 1 :
      circle(origin.x + p.x + 5, origin.y - p.y - 15, 5);
      pc[0].x = p.x + 10; pc[0].y = p.y + 15;
      pc[1].x = p.x + 9;      pc[1].y = p.y + 10;
      pc[2].x = p.x + 5;      pc[2].y = p.y + 5;
      pc[3].x = p.x + 10; pc[3].y = p.y;
      beizer(pc);
    break;
    case 2 :
      circle(origin.x + p.x + 5, origin.y - p.y - 15, 3);
      pc[0].x = p.x + 8;     pc[0].y = p.y + 13;
      pc[1].x = p.x + 9;      pc[1].y = p.y + 10;
      pc[2].x = p.x + 5;      pc[2].y = p.y + 5;
      pc[3].x = p.x + 3;      pc[3].y = p.y;
      beizer(pc);
      circle(origin.x + p.x + 1, origin.y - p.y, 2);
      pc[0].x = p.x + 3;     pc[0].y = p.y + 2;
      pc[1].x = p.x + 5;      pc[1].y = p.y - 5;
      pc[2].x = p.x + 5;      pc[2].y = p.y - 5;
      pc[3].x = p.x + 15;      pc[3].y = p.y;
      beizer(pc);

    break;
    case 3 :
      pc[0].x = p.x ;     pc[0].y = p.y + 20;
      pc[1].x = p.x + 10;      pc[1].y = p.y + 20;
      pc[2].x = p.x + 10;      pc[2].y = p.y + 10;
      pc[3].x = p.x ;      pc[3].y = p.y + 10;
      beizer(pc);
      pc[0].x = p.x ;     pc[0].y = p.y + 10;
      pc[1].x = p.x + 10;      pc[1].y = p.y + 7;
      pc[2].x = p.x + 10;      pc[2].y = p.y + 3;
      pc[3].x = p.x - 5;      pc[3].y = p.y ;
      beizer(pc);
      pc[0].x = p.x - 5;     pc[0].y = p.y;
      pc[1].x = p.x;      pc[1].y = p.y + 5;
      pc[2].x = p.x + 10;      pc[2].y = p.y + 5;
      pc[3].x = p.x + 10;      pc[3].y = p.y - 5;
      beizer(pc);


    break;
    case 4 :
      pc[0].x = p.x - 15 ;     pc[0].y = p.y + 20;
      pc[1].x = p.x - 15;      pc[1].y = p.y + 10;
      pc[2].x = p.x + 20;      pc[2].y = p.y + 1;
      pc[3].x = p.x;      pc[3].y = p.y ;
      beizer(pc);
      pc[0].x = p.x + 15;     pc[0].y = p.y + 20;
      pc[1].x = p.x + 15;      pc[1].y = p.y + 10;
      pc[2].x = p.x - 20;      pc[2].y = p.y + 2;
      pc[3].x = p.x;      pc[3].y = p.y;
      beizer(pc);
    break;
    case 5 :
      pc[0].x = p.x ;     pc[0].y = p.y + 20;
      pc[1].x = p.x;      pc[1].y = p.y + 10;
      pc[2].x = p.x + 20;      pc[2].y = p.y + 10;
      pc[3].x = p.x + 20;      pc[3].y = p.y + 20;
      beizer(pc);
      pc[0].x = p.x + 20;     pc[0].y = p.y + 20;
      pc[1].x = p.x + 15;      pc[1].y = p.y + 2;
      pc[2].x = p.x + 10;      pc[2].y = p.y - 10;
      pc[3].x = p.x;      pc[3].y = p.y + 5;
      beizer(pc);
      pc[0].x = p.x;     pc[0].y = p.y + 5;
      pc[1].x = p.x + 10;      pc[1].y = p.y + 12;
      pc[2].x = p.x + 15;      pc[2].y = p.y + 10;
      pc[3].x = p.x + 24;      pc[3].y = p.y + 12;
      beizer(pc);
    break;
    case 6 :

      pc[0].x = p.x + 10;     pc[0].y = p.y + 20;
      pc[1].x = p.x;      pc[1].y = p.y + 20;
      pc[2].x = p.x;      pc[2].y = p.y + 10;
      pc[3].x = p.x + 10;      pc[3].y = p.y + 10;
      beizer(pc);

      pc[0].x = p.x + 10;     pc[0].y = p.y + 10;
      pc[1].x = p.x;      pc[1].y = p.y + 10;
      pc[2].x = p.x;      pc[2].y = p.y - 4;
      pc[3].x = p.x + 10;      pc[3].y = p.y + 4;
      beizer(pc);

      pc[0].x = p.x + 10;     pc[0].y = p.y + 4;
      pc[1].x = p.x + 5;      pc[1].y = p.y + 6;
      pc[2].x = p.x ;      pc[2].y = p.y + 2;
      pc[3].x = p.x + 7;      pc[3].y = p.y - 6;
      beizer(pc);
    break;
    case 7 :

      pc[0].x = p.x;     pc[0].y = p.y + 20;
      pc[1].x = p.x - 5;      pc[1].y = p.y + 12;
      pc[2].x = p.x - 5;      pc[2].y = p.y;
      pc[3].x = p.x + 5;      pc[3].y = p.y;
      beizer(pc);


      pc[0].x = p.x + 5;     pc[0].y = p.y;
      pc[1].x = p.x + 2;      pc[1].y = p.y + 13;
      pc[2].x = p.x;      pc[2].y = p.y + 7;
      pc[3].x = p.x - 2;      pc[3].y = p.y + 5;
      beizer(pc);
    break;
    case 8 :

      pc[0].x = p.x + 10;     pc[0].y = p.y + 20;
      pc[1].x = p.x - 7;      pc[1].y = p.y ;
      pc[2].x = p.x + 7;      pc[2].y = p.y - 5;
      pc[3].x = p.x + 15;      pc[3].y = p.y + 5;
      beizer(pc);
      line(
	origin.x + p.x, origin.y - (p.y + 20),
	origin.x + p.x + 10, origin.y - (p.y + 20)
      );
    break;
    case 9 :

      pc[0].x = p.x + 10;     pc[0].y = p.y + 20;
      pc[1].x = p.x;      pc[1].y = p.y + 20;
      pc[2].x = p.x;      pc[2].y = p.y + 10;
      pc[3].x = p.x + 10;      pc[3].y = p.y + 10;
      beizer(pc);

      pc[0].x = p.x + 10;     pc[0].y = p.y + 10;
      pc[1].x = p.x;      pc[1].y = p.y + 10;
      pc[2].x = p.x;      pc[2].y = p.y - 4;
      pc[3].x = p.x + 10;      pc[3].y = p.y;
      beizer(pc);

      line(
	origin.x + p.x + 10, origin.y - (p.y + 10),
	origin.x + p.x, origin.y - (p.y + 10)
      );

    break;
  }
}
void init(int* gd, int* gm) {
  initgraph(gd, gm, "c:\\tc\\bgi");
  setbkcolor(BLACK);
  setcolor(WHITE);
  max.x = getmaxx(); max.y = getmaxy();
  origin.x = max.x>>1; origin.y = max.y>>1;
}

int main(void) {
   int gd = DETECT , gm;
   int hour = 23;
   int min = 59;
   int sec = 54;
   int i = 10;
   // time_t t = time(NULL);

   init(&gd, &gm);


   Point p[] = {
     {-140,0}, {-100,0},
     {-60,0},{-20,0},
     {20,0},{60,0}
   };

  while(--i) {
     line(origin.x - 80,origin.y - 20, origin.x - 80, origin.y + 20);
     line(origin.x,origin.y - 20, origin.x, origin.y + 20);

     /*c = getch();
     if(c == 'y') {
       break;
     }*/
     // draw each number
     drawNumber(
       p[0], hour/10
     );
     drawNumber(
       p[1], hour%10
     );

     drawNumber(
       p[2], min/10
     );
     drawNumber(
       p[3], min%10
     );

     drawNumber(
       p[4], sec/10
     );
     drawNumber(
       p[5], sec%10
     );


     delay(1000);

     cleardevice();
     /*
     // erase each number

     drawNumber(
       p[0], hour/10, BLACK
     );
     drawNumber(
       p[1], hour%10, BLACK
     );

     drawNumber(
       p[2], min/10, BLACK
     );
     drawNumber(
       p[3], min%10, BLACK
     );

     drawNumber(
       p[4], sec/10, BLACK
     );
     drawNumber(
       p[4], sec%10, BLACK
     );
     */

     if(sec == 59) {
       if(min == 59) {
	 hour = (hour + 1)%24;
       }
       min = ( min + 1 )%60;
     }
     sec = ( sec + 1 )%60;
  }

  getch();
  closegraph();
  return 0;
}
