all:
	nasm zonk.asm
	xxd -i zonk > zonk.h
	gcc -ggdb loader.c -o loader

