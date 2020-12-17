BOOTLOADER=bootloader
KERNEL=kernel
BOOTDISK=disk
BUILDDIR = ./build

all: bootloader kernel bootdisk

bootloader:
	nasm -f bin $(BOOTLOADER).asm -o $(BUILDDIR)/$(BOOTLOADER).o

kernel:
	nasm -f bin $(KERNEL).asm -o $(BUILDDIR)/$(KERNEL).o

bootdisk: $(BUILDDIR)/$(BOOTLOADER).o $(BUILDDIR)/$(KERNEL).o
	dd if=/dev/zero of=$(BUILDDIR)/$(BOOTDISK).img bs=512 count=2880
	dd conv=notrunc if=$(BUILDDIR)/$(BOOTLOADER).o of=$(BUILDDIR)/$(BOOTDISK).img bs=512 count=1 seek=0
	dd conv=notrunc if=$(BUILDDIR)/$(KERNEL).o of=$(BUILDDIR)/$(BOOTDISK).img bs=512 count=1 seek=1
	

clean:
	rm $(BUILDDIR)/$(BOOTLOADER).o
	rm $(BUILDDIR)/$(KERNEL).o
	rm $(BUILDDIR)/$(BOOTDISK).img
