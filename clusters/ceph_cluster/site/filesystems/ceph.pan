unique template site/filesystems/ceph;


variable MAKE_SEPERATE_VAR_PART = true;
include 'site/filesystems/ceph-common';

prefix '/system/blockdevices';
# Boot disk sda partitions
'partitions' = {
    partitions_add(
        'sda', dict('sda1', 1*GB,
                 'sda2', 10*GB,
                 'sda3', DISK_SWAP_SIZE,
                 'sda4', 1*MB, #biosboot
                 'sda5', 30*GB,
                 'sda6', -1));
    SELF['sda4']['flags'] = dict("bios_grub", true);
    SELF;
};

include 'site/filesystems/ceph-basic';
