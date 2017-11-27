#include <stdio.h>
#include <string.h>
#include <sys/mman.h>

/*
void * mmap (void *addr,
             size_t len,
             int prot,
             int flags,
             int fd,
             off_t offset);
*/

#include "zonk.h"

typedef void (*func_t)(void);

int main(int argc ,char **argv)
{
	func_t func;
	void *mem = mmap((void*)0x10000,4096,PROT_READ|PROT_WRITE|PROT_EXEC,MAP_PRIVATE|MAP_ANONYMOUS,0,0);
	memset(mem,0xcc,zonk_len); // insert a lot of breakpoints :D

	printf("addr: %p\n",mem);
	memcpy(mem,zonk,zonk_len);
	func = mem;

	func();


	return 0;
}
