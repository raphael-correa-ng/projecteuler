/*
#------------------------------------------------------------------------------
# PROJECT EULER
# PROBLEM 45
#------------------------------------------------------------------------------
# Triangle, pentagonal, and hexagonal numbers are generated by the following
# formulae:
#
# Triangle	 	Tn=n(n+1)/2	 	1, 3, 6, 10, 15, ...
# Pentagonal	 	Pn=n(3n1)/2	 	1, 5, 12, 22, 35, ...
# Hexagonal	 	Hn=n(2n1)	 	1, 6, 15, 28, 45, ...
# It can be verified that T285 = P165 = H143 = 40755.
#
# Find the next triangle number that is also pentagonal and hexagonal.
#------------------------------------------------------------------------------
# SOLUTION: 1533776805
#------------------------------------------------------------------------------
*/

#include <iostream>
using namespace std;

int main(){
	unsigned long long trig = 0;
	unsigned long long pent = 0;
	unsigned long long hexa = 0;
	
	for(unsigned int i = 144; true; i++){
		hexa = i*(2*i-1);
		
		for(unsigned int j = 165*i/143; pent <= hexa; j++){
			pent = j*(3*j-1)/2;
			if(pent != hexa) continue;
			for(unsigned int k = 285*j/165; trig <= pent; k++){
				trig = k*(k+1)/2;
				if(trig != pent) continue;
				cout << i << " " << j << " " << k << endl;
				cout << trig << endl;
				return 0;
			}
		}
	}
}