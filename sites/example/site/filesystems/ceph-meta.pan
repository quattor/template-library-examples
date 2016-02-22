unique template site/filesystems/ceph-meta;


'/system/filesystems' = { 
    foreach (disk;label;value('/system/blockdevices/physical_devs')) {
        if (index(disk, CEPH_SSD_DISKS) >= 0) {
            append(merge(CEPH_FSOPTS_BASE, CEPH_DISK_OPTIONS[CEPH_FS], nlist(
                'mountpoint', format('/var/lib/ceph/osd/meta/%s',disk),
                'block_device', format('partitions/%s%d', disk, CEPH_MD_PART),
                )));
        };
    };
    SELF;
};

