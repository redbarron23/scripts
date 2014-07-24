#include <iostream>
using namespace std;

void print(int& x);

int main()
{
    int number = 50;
    cout << number << endl;
    print (number);   // you are passing number=50
    cout << number << endl;

    return 0;
}

void print(int& x)
{
   x = 5;
   cout << x << endl;
}
