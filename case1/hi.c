#include<stdio.h>
#include <sys/types.h>
#include <unistd.h>
int main(void)
{
  printf("Hello world!\n");
  pid_t pid = getpid();
  printf("pid: %d\n", pid);

  //trigger divide by 0
  printf("1 over 0 is %d", 1/0);

  return 0;
}
