#include <iostream>
#include <stdio.h>
using namespace std;
         // number of arguments             
int main(int argc, char* argv[])
                   // array of chars   argv[0] name of the command
{
    for (int i=0; i< argc; i++)
        for (int j=0, n=strlen(argv[i]); j < n; j++)
            printf("argv[%d][%d] is: %c\n", i, j, argv[i][j]);

    return 0;
}
