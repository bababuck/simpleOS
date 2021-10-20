all: boot

boot: compile
	../qemu/x86_64-softmmu/qemu-system-x86_64 -drive format=raw,file=build/boot_sect_simple.bin

compile:
	rm -rf build
	mkdir build
	nasm -f bin test.asm -o build/boot_sect_simple.bin



