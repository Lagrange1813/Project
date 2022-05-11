#include <stdio.h>
#include <string.h>
#define ruleMax 2359
#define ruleMin 0000
#define level 0

struct user
{
    char country[5];
    char phone[12];
    char name[100];
    int time;
    char flag;
};

struct vote
{
    char name[100];
    int cnt;
};

int main()
{
    struct user list[1000];
    struct vote lie[100];
    int i = 0;
    int t;
    scanf("%s %s %s %d", list[i].country, list[i].phone, list[i].name, &list[i].time);
    list[0].flag = 1;
    while (getchar() != '\n')
    {
        i++;
        scanf("%s %s %s %d", list[i].country, list[i].phone, list[i].name, &list[i].time);
        list[i].flag = 1;
        for (t = 0; t < i; t++)
        {
            if (strcmp(list[t].phone, list[i].phone) == 0)
                list[i].flag = 0;
        }
    }
    //printf("%d",i);
    for (t = 0; t <= i; t++)
    {
        if (list[t].time > ruleMax || list[t].time < ruleMin)
            list[t].flag = 0;
    }
    for (t = 0; t <= i; t++)
    {
        lie[t].cnt = 0;
    }
    /* printf("%d\n", i + 1);
    for (t = 0; t <= i; t++)
    {
        if (list[t].flag == 1)
            printf("%s %s %d\n", list[t].name, list[t].phone, list[t].time);
    } */
    int m;
    int c = 0;
    for (t = 0; t <= i; t++)
    {
        int flag = 0;
        if (list[t].flag == 1)
        {
            for (m = 0; m < t; m++)
            {
                if (strcmp(lie[m].name, list[t].name) != 0)
                    flag++;
                else
                {
                    if (strcmp(list[t].country, "+86") == 0)
                        lie[m].cnt += 2;
                    else
                        lie[m].cnt++;
                }
            }
            if (flag == m)
            {
                strcpy(lie[c].name, list[t].name);
                if (strcmp(list[t].country, "+86") == 0)
                    lie[m].cnt += 2;
                else
                    lie[m].cnt++;
                c++;
            }
        }
    }
    /*  printf("%d\n",c);
    for (t = 0; t < c; t++)
    {
        printf("%s\n",lie[t].name);
    } */
    //c=2;
    int x,y;
    char name[100];
    for (x = 0; x < c-1; x++)
    {
        for (t = 0; t < c-x-1; t++)
        {
            if (lie[t].cnt > lie[t+1].cnt)
            {
                y=lie[t].cnt;
                lie[t].cnt=lie[t+1].cnt;
                lie[t+1].cnt=y;
                strcpy(name, list[t].name);
                strcpy(lie[t].name, list[t+1].name);
                strcpy(lie[t+1].name, name);
            }
        }
    }
    for (t = c-1; t >= 0; t--)
        printf("%s %d\n", lie[t].name, lie[t].cnt);

    printf("晋级名单为");
    for (t = 0; t < c; t++)
    {
        if (lie[t].cnt > level)
            printf("%s ", lie[t].name);
    }
    printf("\n");
    printf("下面您可以查询投票记录\n");
    char phone[100];
    scanf("%s",phone);
    for(t=0;t<=i;t++){
        if(strcmp(list[t].phone,phone)==0){
            if (list[t].flag==1)
                printf("%s %s %s %d\n",list[t].country,list[t].phone,list[t].name,list[t].time);
            else
                printf("您的投票无效 %s %s %s %d\n",list[t].country,list[t].phone,list[t].name,list[t].time);
        }
    }
    return 0;
}
