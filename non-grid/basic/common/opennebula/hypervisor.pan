unique template common/opennebula/hypervisor;

variable LIBVIRT_MAJORVERSION ?= 1;
include 'quattor/functions/repository';

variable QEMU_KVM_VERSION ?= '1.5.3-60.el7_0.2.ug.rbd.1';
include 'common/libvirt/service';

