unique template site/ceph/osdlocal/osd-kv-ec-cc-md;

variable CEPH_JOURNAL_PART ?= nlist();

prefix '/software/components/ceph';

'localdaemons/osds' = {
    d=nlist();
    foreach(idx;osdmnt;value('/system/filesystems')) {
        part = osdmnt['block_device'];
        disk = replace('([a-zA-Z]+)[0-9]*$', '$1', part);
        if (match(osdmnt['mountpoint'], '/var/lib/ceph/osd/cache/\w+')){
            d[escape(osdmnt['mountpoint'])] = nlist(
                'journal_path', format('/dev/%s%d', disk, CEPH_JOURNAL_PART['cache']),
                'crush_weight', weight_of(part),
                'labels', list('cache'),
            );  
        } else if (match(osdmnt['mountpoint'], '/var/lib/ceph/osd/md/\w+')){
            d[escape(osdmnt['mountpoint'])] = nlist(
                'journal_path', format('/dev/%s%d', disk, CEPH_JOURNAL_PART['md']),
                'crush_weight', weight_of(part),
                'labels', list('md'),
            ); 
        } else if (match(osdmnt['mountpoint'], '/var/lib/ceph/osd/\w+')){
            d[escape(osdmnt['mountpoint'])] = nlist(
                'crush_weight', weight_of(part),
                'labels', list('ec'),
                'config', nlist(
                    'osd_objectstore', 'keyvaluestore'
                )
            );  
        };
    };
    d;
};

