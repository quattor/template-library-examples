unique template common/opennebula/hypervisor;

include {'components/nfs/config'};
"/software/components/chkconfig/dependencies/pre" = append("nfs");

variable LIBVIRT_MAJORVERSION ?= 1;
include { 'quattor/functions/repository' };

variable QEMU_KVM_VERSION ?= '1.5.3-60.el7_0.2.ug.rbd.1';
# setup libvirt; incl the bridges for VSC
include 'common/libvirt/service';

