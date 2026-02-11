structure template hardware/machine/200/49/Hp1/34;

"location" = "Room 200-48 Rack HP1 Shelf 34";
"serialnumber" = "a remplir";

# 'cpu' describes sockets, number of cores per socket is an attribute of
# the CPU description.
"cpu" = list(
    create("hardware/cpu/intel/xeon_e5420"),
    create("hardware/cpu/intel/xeon_e5420"),
);

"harddisks" = dict(
    "hda", create("hardware/harddisk/ide", "capacity", 40 * GB),
);

"ram" = list(
    create("hardware/ram/generic", "size", 4096 * MB),
);

"cards/nic" = dict(
    "eth0", create("hardware/nic/by_driver/tg3"),
    "eth1", create("hardware/nic/by_driver/tg3"),
);

"cards/nic/eth1/hwaddr" = "00:00:1A:1A:3B:EB"; #me NIC2
"cards/nic/eth0/hwaddr" = "00:00:1A:1A:3B:EA"; #me NIC1
"cards/nic/eth0/boot" = true; # me
