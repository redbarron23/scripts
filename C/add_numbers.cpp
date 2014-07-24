#include <iostream>
using namespace std;


void get_input_from_user(int& a, int& b); // prototype
void  calculate_total(int& a, int& b, int& c);
void print_Results(int& c);
int main()
{
    int numberOne=0, numberTwo=0;
    int total = 0;
    get_input_from_user(numberOne, numberTwo); 
    calculate_total(numberOne, numberTwo, total);
    print_Results(total);
    return 0;
}

void get_input_from_user(int& a, int& b)
{
   cout << "Please enter number one: ";
   cin >> a;
   cout << "Please enter number two: ";
   cin >> b;
}

void  calculate_total(int& a, int& b, int& c)
{
    c = a + b;
}

void print_Results(int& c)
{
   cout << endl;
   cout << "The total is: " << c;
   cout << endl;
}
