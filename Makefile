BOOTLOADER = bootloader
KERNEL = kernel

all: 
	dd if=/dev/zero of=disk.img bs=512 count=2880
	nasm -f bin -o $(BOOTLOADER) $(BOOTLOADER).asm
	dd conv=notrunc if=$(BOOTLOADER) of=disk.img bs=512 count=1 seek=0
	nasm -f bin -o $(KERNEL) $(KERNEL).asm
	dd conv=notrunc if=$(KERNEL) of=disk.img bs=512 count=1 seek=1
	

clean:
	rm $(BOOTLOADER)
	rm disk.img
