#include <iostream>
using namespace std;

int factorial(int ); //prototype variable_name is optional i.e. num

int main() 
{
    int num;  // this feeds into factorial
    cout << "Type in an integer: ";
    cin >> num;
    cout << factorial(num) << endl; // cout function name along with  w/ parametre

    return 0;
}

int factorial(int count)  // notice this variable is different than num
{
    if (count <= 1 ) // base case
        return 1;
    else {
        return (count * factorial(count -1));  // this is the recursive function calling itself
    }
}
