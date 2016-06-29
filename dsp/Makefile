#
# Makefile for dstar.o
#

CCS_DIR = /home/pi/ti-tools
CC = /home/pi/TI_CGT_C5500_3.3.6/bin/cl55
LD = $(CC)
TOKLI_DIR = ../../tokliBIOS
TINKERNEL = ../../tinkernel/tinkernel.out

#
# compiler options
#
INCD =	-i$(TOKLI_DIR) \
	-i$(CCS_DIR)/cgtools-c5500-v2.56/include \
	-i$(CCS_DIR)/bios_5_03/ti/bios/include \
	-i$(CCS_DIR)/ccs221_content/c5500/xdais/include \
	-i$(CCS_DIR)/ccs221_content/c5500/xdais/src/api

CFLAGS = -q -ml -vcpu:2 -O2 --symdebug:none

#
# linker options
#
LIBD =	-i$(CCS_DIR)/cgtools-c5500-v2.56/lib \
	-i$(CCS_DIR)/bios_5_03/ti/bios/lib \
	-i$(CCS_DIR)/ccs221_content/c5500/rtdx/lib

LDFLAGS = -z -x -r -cr

LIBS =	-llnknone.a55L \
	-ldrivers.a55L \
	-lsioboth.a55L \
	-lbios1510.a55L \
	-lbios.a55L \
	-lrtdxx.lib \
	-lrts55x.lib

all: dstar.o

clean:
	-rm -f dstar.obj dstar.o dummy_kernel.obj

%.obj: %.c
	$(CC) $(CFLAGS) $(INCD) $<
%.obj: %.asm
	$(CC) $(CFLAGS) $(INCD) $<

dstar.o: dstar.obj 51e1.obj 51e1-data.obj dummy_kernel.obj
	$(LD) $(LDFLAGS) $+ dummy.cmd $(LIBD) $(LIBS) -o $@
	coff_unresolve -s .tinkernel $@

dummy_kernel.obj: $(TINKERNEL)
	gen_dummy_kernel $< -o $@

$(TINKERNEL):
	@echo
	@echo '************************************************'
	@echo '$(TINKERNEL) not found.'
	@echo '************************************************'
	@echo
	@exit 1
