#include <iostream>
using namespace std;
// http://youtu.be/NvVYd08NUXI

void counter(int);
 
int main() 
{
    int num;
    cout << "Type in an integer: ";
    cin >> num;

    counter(num);

    return 0;
}

void counter(int count)
{
    if (count >= 1) 
    {
        // recursion first prints N...1
        //cout << "Number: " << count << endl;
        //counter(count -1);

        // recursion first prints 1...
        counter(count -1);
        cout << "Number: " << count << endl;
    }
}
