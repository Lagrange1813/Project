#include<stdio.h>
int main()
{
    char a[100];
    char b[100];
    scanf("%s %s",a,b);
    printf("%s %s",a,b);
    while(getchar()!='\n'){
        scanf("%s %s",a,b);
        printf("%s %s",a,b);
    }
    return 0;
}