#!/bin/sh

cargo bootimage
qemu-system-x86_64 -drive format=raw,file=target/x86_64-snail_os/debug/bootimage-snail_os.bin
