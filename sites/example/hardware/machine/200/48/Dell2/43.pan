################################################################################
# RESPONSIBLE: Jerome Pansanel <jerome.pansanel@iphc.cnrs.fr
#
###############################################################################

structure template hardware/machine/200/48/Dell2/43;

"location" = "200/48/Dell2/43";
"serialnumber" = "8RTTL2K";

"cpu" = list(
    create("hardware/cpu/intel/xeon_e5_2440"),
    create("hardware/cpu/intel/xeon_e5_2440"),
);

"harddisks" = dict(
    "sda", create("hardware/harddisk/sata", "capacity", 1000 * GB),
);

"ram" = list(
    create("hardware/ram/generic", "size", 65536 * MB),
);

"cards/nic" = dict(
    "eth0", create("hardware/nic/by_driver/bnx2"),
    "eth1", create("hardware/nic/by_driver/bnx2"),
    "eth2", create("hardware/nic/by_driver/bnx2"),
);

"cards/nic/eth0/hwaddr" = "00:15:C5:EB:5D:9C";
"cards/nic/eth1/hwaddr" = "00:15:C5:EB:5D:9D";
"cards/nic/eth2/hwaddr" = "00:15:C5:EB:5D:9E";

"cards/nic/eth0/boot" = true;
