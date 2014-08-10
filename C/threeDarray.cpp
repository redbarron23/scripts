#include <iostream>
using namespace std;

// https://www.youtube.com/watch?v=a8prMOOuUoU
int main()
{
    int X=3, Y=3, Z=3, iCount=0;
    int ***arr3D = new int**[X];

    //.......................   Dynamic Allocation
    for(int i=0; i<X; i++)
    {
        arr3D[i] = new int*[Y]; // ............... Allocating every Y Column Corresponds to X[i] Row

        for(int j=0; j<Y; j++)
        {
            arr3D[i][j] = new int[Z]; //........... Allocating every Z Corresponds to X[i] Row and Y[i] Column

            for(int k=0; k<Z; k++,iCount++)
            {
                arr3D[i][j][k] = iCount; //......... Initializing array
            }
        }
    }

    //............................................. Print Array
    

    for (int i=0; i<X; i++)
    {
        for(int j=0; j<Y; j++)
        {
            for(int k=0; k<X; k++)
            {
                cout << "arr3D [" <<i << "][" << j << "][" <<k << "] : " << arr3D[i][j][k] << endl;
            }
        }
    }


    // .............................................. DeAllocation of 3D Array
    
    for(int i=0; i<X; i++)
    {
        for(int j=0;j<Y;j++)
        {
            delete [] arr3D[i][j]; //....................Delete Row corresponding to RowX[i] and Column Y[j]
        }

        delete [] arr3D[i]; // ....................... Delete Rows X
    }

    delete [] arr3D; // ............................. Delete Rows X

    //system("pause");
    return 0;

}
