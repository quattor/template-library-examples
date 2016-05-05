unique template site/ceph/osdlocal/simple;

variable CEPH_JOURNAL_PART ?= nlist();

prefix '/software/components/ceph';

'localdaemons/osds' = {
    d=nlist();
    foreach(idx;osdmnt;value('/system/filesystems')) {
        part = osdmnt['block_device'];
        disk = replace('\S+/([a-zA-Z]+)[0-9]*$', '$1', part);
        if (match(osdmnt['mountpoint'], '/var/lib/ceph/osd/\w+')){
            d[escape(osdmnt['mountpoint'])] = nlist(
                'journal_path', format('/dev/%s%d', disk, CEPH_JOURNAL_PART['data']),
                'crush_weight', weight_of(part),
            );  
        };
    };
    d;
};

