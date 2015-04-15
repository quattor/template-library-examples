unique template site/config-vm;

# AII opennebula VM conf

# Set network
prefix "/system/opennebula";
"vnet" = nlist(
    "eth0", "example.os",
    "eth1", "example.vsc"
);

# Set storage
"datastore" = nlist(
    "vda", "ceph.example",
);

# set aii opennebula hooks
final variable OPENNEBULA_AII_FORCE = true; 
final variable OPENNEBULA_AII_ONHOLD = false;

