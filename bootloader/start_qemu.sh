#!/bin/sh

qemu-system-i386 -machine q35 -fda ./build/disk.img -gdb tcp::1337 -S
