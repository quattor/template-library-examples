unique template site/filesystems/ceph-common;

variable DISK_SWAP_SIZE = 4*GB;

include 'quattor/functions/filesystem';

prefix '/system/blockdevices';

'physical_devs' = {
    foreach (disk;data;value('/hardware/harddisks')) {
            SELF[disk]['label'] = 'gpt';
    };
   SELF;
};

#'md' = {
#    raids = nlist();
#    for (i = 1; i <= 3; i = i+1) {
#        raids[format('md%s', i)] = nlist(
#            "device_list" , list(format('partitions/sda%s', i), format('partitions/sdb%s', i)),
#            "raid_level", 'RAID1',
#        );
#    };
#    raids;
#};

# OS filesystems
variable MAKE_SEPERATE_VAR_PART ?= false;
variable CEPH_RAID_BOOT_DISK ?= false;

'/system/filesystems' = { 
    if (CEPH_RAID_BOOT_DISK) {
        block_pref = 'md/md';
    } else {
        block_pref = format('partitions/%s', DISK_BOOT_DEV);
    };

    base= nlist(
        'mount', true,
        'format', true,
        'preserve', false
    );
    append(merge(base,nlist(
        'mountpoint', '/boot',
        'type', 'ext2',
        'block_device', format('%s1', block_pref)
        )));
    append(merge(base, nlist(
        'mountpoint', 'swap',
        'type', 'swap',
        'block_device', format('%s3', block_pref)
        )));
    append(merge(base, nlist(
        'mountpoint', '/',
        'type', 'xfs',
        'block_device', format('%s2', block_pref)
        )));
    if (MAKE_SEPERATE_VAR_PART) {
        append(merge(base, nlist(
            'mountpoint', '/var',
            'type', 'xfs',
            'block_device', format('%s5', block_pref)
            )));
    };
    SELF;
};

variable CEPH_FS ?= 'xfs';

variable CEPH_FSOPTS_BASE = nlist(
        'mount', true,
        'format', false,
        'preserve', true,
        'type', CEPH_FS,
    );  

variable CEPH_FSOPTS_DUMMY = nlist(
        'mount', false,
        'format', false,
        'preserve', true,
        'type', 'none',
        'mountopts', 'noauto,nofail',
    ); 

# mkfs and mount optoins
# see https://github.com/ceph/ceph/blob/master/src/ceph-disk
variable CEPH_DISK_OPTIONS = nlist(
    'xfs' , nlist(
        'mkfsopts', '-i size=2048',
        'mountopts', 'noatime'
    ),  
    'ext4', nlist(
        'mountopts', 'noatime,user_xattr',
    ),  
    'btrfs', nlist(
        'mkfsopts', '-m single -l 32768 -n 32768',
        'mountopts', 'noatime,user_subvol_rm_allowed',
    )   
);

'/system/blockdevices/logical_volumes' = nlist();

variable AII_OSINSTALL_OPTION_CLEARPART = list(DISK_BOOT_DEV);
