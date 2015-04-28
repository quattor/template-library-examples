unique template site/one/common;

final variable LIBVIRT_VERSION = "1.1.1-29.el7";
final variable QEMU_KVM_RHEV = true;

include 'site/one/hypervisor';
include 'site/ceph/client/libvirt';

include 'common/opennebula/oneadmin';
include 'site/one/variables';
include 'common/opennebula/common';
