all: boot

boot: compile
	./qemu/x86_64-softmmu/qemu-system-x86_64 -drive format=raw,file=boot_sect_simple.bin

compile:
	nasm -f bin test.asm -o boot_sect_simple.bin



