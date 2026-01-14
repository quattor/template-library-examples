unique template site/ceph/basic/osdlist-simple;

# This is very  basic and can only be used when using only all equal sized disks
variable CEPH_OSD_IGNORE_LIST ?= CEPH_SSD_DISKS;
variable CEPH_OSD_DISKS = {
    hosts = dict();
    foreach(idx; host; CEPH_NODES) {
        osds = list();
        foreach (disk; data; value(format('%s:/hardware/harddisks', host))) {
            if (index(disk, CEPH_OSD_IGNORE_LIST) == -1) {
                append(osds, disk);
            };
        };
        hosts[shorten_fqdn(host)] = osds;
    };
    hosts;
};
variable TMP_OSDS = CEPH_OSD_DISKS[CEPH_HOSTS[0]];
variable CEPH_DEFAULT_OSD_WEIGHT ?= to_double(value(format('/hardware/harddisks/%s/capacity', TMP_OSDS[0]))) / 1048576;
