#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<unistd.h>
#define BUFFER_SIZE 100

int main(){

	printf("Start to Repeatedly Sync Data!\n");

	printf("Synchronizion in process, press ctrl+c to terminate...\n");

	while(1){			
		sync();
	}

	return 0;

}
