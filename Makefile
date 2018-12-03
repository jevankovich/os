os.iso: isofiles/boot/grub/grub.cfg isofiles/boot/kernel.bin
	grub-mkrescue -o os.iso isofiles

%.o: %.asm
	nasm -felf64 -gdwarf $<

kernel.elf: boot.o multiboot.o linker.ld
	ld --nmagic --output=kernel.elf --script=linker.ld multiboot.o boot.o

isofiles/boot/kernel.bin: kernel.elf
	objcopy -O binary kernel.elf isofiles/boot/kernel.bin

.PHONY: clean
clean:
	rm -f boot.o multiboot.o kernel.elf isofiles/boot/kernel.bin os.iso
