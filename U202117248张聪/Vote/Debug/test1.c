#include <stdio.h>
int main()
{
    int lie[5]={2,3,5,1,4};
    int x,t,y;
    int c=5;
    for (x = 0; x < c - 1; x++)
    {
        for (t = 0; t < c - x-1; t++)
        {
            if (lie[t] > lie[t + 1])
            {
                y = lie[t];
                lie[t] = lie[t + 1];
                lie[t + 1] = y;
            }
        }
    }
    for(x=0;x<5;x++)
        printf("%d",lie[x]);
    return 0;
}