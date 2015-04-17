unique template site/config-vm;

# AII opennebula VM conf

# Set network
prefix "/system/opennebula";
"vnet" = dict(
    "eth0", "example.os",
);

# Set storage
"datastore" = dict(
    "vda", "ceph.example",
);

# set aii opennebula hooks
final variable OPENNEBULA_AII_FORCE = true; 
final variable OPENNEBULA_AII_ONHOLD = false;

