############################################################
#
# RESPONSIBLE: Charles Loomis <charles.loomis@cern.ch>
#
############################################################

structure template hardware/machine/200/49/Ibm1/41;

"location" = "200/49/Ibm1/39";
"serialnumber" = "KKWMZ8G";

"cpu" = list(
    create("hardware/cpu/amd/opteron_275"),
    create("hardware/cpu/amd/opteron_275"),
    create("hardware/cpu/amd/opteron_275"),
    create("hardware/cpu/amd/opteron_275"),
);

"harddisks" = dict(
    "sda", create("hardware/harddisk/sata", "capacity", 80 * GB),
);

"ram" = list(
    create("hardware/ram/generic", "size", 8192 * MB),
);

"cards/nic" = dict(
    "eth0", create("hardware/nic/broadcom/bcm5700"),
    "eth1", create("hardware/nic/broadcom/bcm5700"),
);

"cards/nic/eth0/hwaddr" = "00:11:25:C4:21:02";
"cards/nic/eth1/hwaddr" = "00:11:25:C4:21:03";

"cards/nic/eth1/boot" = true;
