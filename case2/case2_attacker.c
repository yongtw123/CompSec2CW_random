#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<unistd.h>
#define BUFFER_SIZE 100

int main(){
	char* file_path = "case2_attacker.txt";
	int fd;
	char buffer[100] = "Data synchronization test buffer.";
	fd = open(file_path, O_RDWR | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR | S_IROTH);
	if(fd == -1){
		printf("open file error!\n");
		return -1;
	}
	
	int ret_w;
	printf("Start to Write File\n");
	for(int i=0;i<100000;i++){
		ret_w = write(fd,buffer,100);
		if(ret_w == -1){
			printf("Open File Error!\n");
			return -1;
		}
	}

	printf("Write File Success\n");
	
	printf("Start to Repeatedly Sync Data!\n");

	printf("Synchronizion in process, press ctrl+c to terminate...\n");
	while(1){			
		sync();
	}

	return 0;

}
