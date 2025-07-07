#include <stdio.h>
#include <math.h>
#include "my_func.h"

float absoluto(float num)
{
   fabs(num);
}
int main()
{
    float x = -5;
    float y = 10;
    printf("Absolute value of %f is %f\n", x, absoluto(x));
    printf("Absolute value of %f is %f\n", y, absoluto(y));
    return 0;
}