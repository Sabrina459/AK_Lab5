ifneq ($(KERNELRELEASE),)
# kbuild part of makefile
obj-m   := lab5.o
ccflags-y += -g
else
# normal makefile
KDIR ?= /lib/modules/`uname -r`/build

default:
	$(MAKE) -C $(KDIR) M=$$PWD
	cp lab5.ko lab5.ko.unstripped
	$(CROSS_COMPILE)strip -dS lab5.o
clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean
endif
