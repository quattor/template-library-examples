structure template hardware/machine/one/base_not_so_small;

"location" = undef;
"serialnumber" = undef;

"model" = "ONE Virtual Machine";
"bios/version" = "0.5.1";
"bios/releasedate" = "01/01/2007";

"cpu" = list(
    create("hardware/cpu/intel_xeon_e5520_vm_quadcore"),
);

"harddisks" = dict(
    "vda", create("hardware/harddisk/sas", "capacity", 40 * GB),
);

"ram" = list(
    create("hardware/ram/generic", "size", 4 * GB),
);

"cards/nic" = dict(
    "eth0", create("hardware/nic/by_driver/bnx2"),
    "eth1", create("hardware/nic/by_driver/bnx2"),
);

"cards/nic/eth0/boot" = true;
