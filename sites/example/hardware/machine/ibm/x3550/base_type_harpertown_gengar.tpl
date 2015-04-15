structure template hardware/machine/ibm/x3550/base_type_harpertown_gengar;

"location" = undef;
"serialnumber" = undef;
"site" = "Rectoraat";
"type" = "7978";
"model" = "L2G";
"vendor" = "IBM";
"bios/version" = "-[GFE149BUS-1.17]-";
"bios/releasedate" = "02/14/2011";

"cpu" = list(create("hardware/cpu/intel_xeon_L5420"),
             create("hardware/cpu/intel_xeon_L5420"));

"harddisks" = nlist("sda", create("hardware/harddisk/sas", "capacity", 146*GB));

"ram" = list(create("hardware/ram/generic", "size", 2048*MB),
             create("hardware/ram/generic", "size", 2048*MB),
             create("hardware/ram/generic", "size", 2048*MB),
             create("hardware/ram/generic", "size", 2048*MB),
             create("hardware/ram/generic", "size", 2048*MB),
             create("hardware/ram/generic", "size", 2048*MB),
             create("hardware/ram/generic", "size", 2048*MB),
             create("hardware/ram/generic", "size", 2048*MB),
             );

"cards/nic" = nlist("eth0", create("hardware/nic/bnx2"), "eth1", create("hardware/nic/bnx2"));

"cards/nic/eth0/hwaddr" = undef;

"cards/nic/eth0/boot" = true;

"cards/nic/eth1/hwaddr" = undef;

"cards/ib"=nlist("ib0",create("hardware/ib/infinihostIII"));
