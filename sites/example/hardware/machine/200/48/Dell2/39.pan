############################################################
#
# RESPONSIBLE: Charles Loomis <charles.loomis@cern.ch>
#
############################################################

structure template hardware/machine/200/48/Dell2/39;

"location" = "200/48/Dell2/39";
"serialnumber" = "9RTTL2J";

"cpu" = list(
    create("hardware/cpu/intel/xeon_e5140"),
    create("hardware/cpu/intel/xeon_e5140"),
);

"harddisks" = dict(
    "sda", create("hardware/harddisk/sata", "capacity", 80 * GB),
);

"ram" = list(
    create("hardware/ram/generic", "size", 8192 * MB),
);

"cards/nic" = dict(
    "eth0", create("hardware/nic/by_driver/tg3"),
    "eth1", create("hardware/nic/by_driver/tg3"),
);

"cards/nic/eth0/hwaddr" = "00:15:c5:ea:b0:10";
"cards/nic/eth1/hwaddr" = "00:15:c5:ea:b0:0e";

"cards/nic/eth1/boot" = true;
