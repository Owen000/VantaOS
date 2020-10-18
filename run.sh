as --32 boot.s -o boot.o

gcc -m32 -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

ld -m elf_i386 -T linker.ld kernel.o boot.o -o VantaOS.bin -nostdlib

grub-file --is-x86-multiboot VantaOS.bin

mkdir -p isodir/boot/grub
cp VantaOS.bin isodir/boot/VantaOS.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o VantaOS.iso isodir

qemu-system-x86_64 -cdrom VantaOS.iso
