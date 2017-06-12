################################################################################
# RESPONSIBLE: Jerome Pansanel <jerome.pansanel@iphc.cnrs.fr
#
###############################################################################

structure template hardware/machine/200/48/Dell2/44;

"location" = "200/48/Dell2/44";
"serialnumber" = "8RTTL2L";

"cpu" = list(
    create("hardware/cpu/intel/xeon_e5_2440"),
    create("hardware/cpu/intel/xeon_e5_2440"),
);

"harddisks" = dict(
    "sda", create("hardware/harddisk/sata", "capacity", 1000 * GB),
);

"ram" = list(
    create("hardware/ram/generic", "size", 262144 * MB),
);

"cards/nic" = dict(
    "eth0", create("hardware/nic/by_driver/bnx2x"),
    "eth1", create("hardware/nic/by_driver/bnx2x"),
);

"cards/nic/eth0/hwaddr" = "00:15:C5:EB:5D:A1";
"cards/nic/eth1/hwaddr" = "00:15:C5:EB:5D:A2";

"cards/nic/eth0/boot" = true;
