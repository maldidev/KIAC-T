nasm -f elf32 boot.asm -o boot.o
gcc -m32 -ffreestanding -c kernel.c -o kernel.o
ld -m elf_i386 -T linker.ld -o kiact.bin boot.o kernel.o
qemu-system-i386 -kernel kiact.bin