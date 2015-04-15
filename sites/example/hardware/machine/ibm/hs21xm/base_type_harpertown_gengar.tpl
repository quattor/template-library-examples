structure template hardware/machine/ibm/hs21xm/base_type_harpertown_gengar;

"location" = undef;
"serialnumber" = undef;
"rack/name" = "UNKNOWN";
"site" = "Rectoraat";
"type" = "7995";
"model" = "GLG";
"vendor" = "IBM";
"support" = "31-05-2012";
"bios/version" = "-[MJE140BUS-1.18]-";
"bios/releasedate" = "04/04/2011";

"cpu" = list(create("hardware/cpu/intel_xeon_L5420"),
             create("hardware/cpu/intel_xeon_L5420"),
             );

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

"cards/nic" = nlist("eth0", create("hardware/nic/bnx2"), 
                    "eth1", create("hardware/nic/bnx2"));

"cards/nic/eth0/hwaddr" = undef;

"cards/nic/eth0/boot" = true;

"cards/nic/eth1/hwaddr" = undef;

"cards/ib"=nlist("ib0",create("hardware/ib/connectx"));
