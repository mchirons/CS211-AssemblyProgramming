#include<stdio.h>
#include <stdlib.h>
#include "mystery.h"


int num[200];

int add(int a, int b){
	return a + b;
}

int dothething(int n){
	int x;
	int result;

	if (num[n] != -1){
		result =  num[n];
	}
	else{
	 	x = -1;
	 	if (n == 0){
	 		x = 0;
	 		//L9
	 	}
	 	else{
	 		if (n == 1){
	 			x = 1;
	 			//L9
	 		}
	 		else {
	 			x = add(dothething(n - 1), dothething(n - 2));
	 		}
	 	}
	 	if (num[n] == -1){
	 		num[n] = x;
	 	}
	 	
	 	result = num[n];
	 	
	}
	return result;
	
	
		

}

int main(int argc, char **argv){

	int n = atoi(argv[1]);
	
	int i;

	for (i = 0; i < 200; i++){
		num[i] = -1;
	}
	
	printf("Value: %d\n", dothething(n));

	return 0;
}
