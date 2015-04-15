unique template site/onevm_storage;

# vlans are not passed, there is a bridge device for that
final variable VSC_VLAN_IP_DEV = 'eth0'; # get ip from this device
final variable VSC_VLAN_DEV = 'eth1'; # set vsc network in this device
final variable VSC_NO_VLAN = true; # no vlans, use device VSC_VLAN_DEV

include { 'machine-types/se' };

include 'site/one/onevm';
prefix "/system/opennebula";
"datastore" = nlist(
    "vda", "ceph.example",
    "vdb", "ceph.example",
);

variable OS_REPOSITORY_LIST = append('experimental');

