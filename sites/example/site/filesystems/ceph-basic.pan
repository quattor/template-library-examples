unique template site/filesystems/ceph-basic;

variable CEPH_OSD_DISKS = { 
    # SAS disks partitions
    disks = list();
    foreach (disk;data;value('/hardware/harddisks')) {
        if (disk != 'sda') {
            append(disks, disk);
        };
    };  
    disks;
};

prefix '/system/blockdevices';

# SAS disks partitions
'partitions' = {
    foreach (idx;disk;CEPH_OSD_DISKS) {
            partitions_add(
                disk, nlist(
                    format('%s1', disk), 10*GB,
                    format('%s2', disk), -1));
            SELF[format('%s1', disk)]['offset'] = 1;
    };
    SELF;
};

variable CEPH_JOURNAL_PART = nlist('data', 1);
# ceph OSD and journal fs
'/system/filesystems' = { 
    foreach (idx;disk;CEPH_OSD_DISKS) {
		opart = 2;
        append(merge(CEPH_FSOPTS_BASE, CEPH_DISK_OPTIONS[CEPH_FS], nlist(
	        'mountpoint', format('/var/lib/ceph/osd/%s',disk),
       	    'block_device', format('partitions/%s%d', disk, opart),
            )));
    };
    SELF;
};
