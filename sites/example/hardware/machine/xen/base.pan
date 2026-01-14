############################################################
#
# structure template hardware/machine/xen/base
#
# RESPONSIBLE: Stephen Childs <childss@cs.tcd.ie>
#
############################################################

structure template hardware/machine/xen/base;

"location" = "";
"serialnumber" = "";

"cpu" = list(create("hardware/cpu/xen_vcpu"));

"harddisks" = dict("xvda", create("hardware/harddisk/scsi", "capacity", 20 * GB));

"ram" = list(create("hardware/ram/generic", "size", 256 * MB));

"cards/nic" = dict("eth0", create("hardware/nic/by_driver/xen-netfront"));

"cards/nic/eth0/hwaddr"              = undef;

"cards/nic/eth0/boot" = true;

