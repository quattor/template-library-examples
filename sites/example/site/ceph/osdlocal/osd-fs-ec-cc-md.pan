unique template site/ceph/osdlocal/osd-fs-ec-cc-md;

variable CEPH_JOURNAL_PART ?= dict();

prefix '/software/components/ceph';

'localdaemons/osds' = {
    d = dict();
    foreach(idx; osdmnt; value('/system/filesystems')) {
        part = osdmnt['block_device'];
        disk = replace('\S+/([a-z0A-Z]+)[0-9]*$', '$1', unescape(part));
        if (match(osdmnt['mountpoint'], '/var/lib/ceph/osd/cache/\w+')) {
            d[escape(osdmnt['mountpoint'])] = dict(
                'journal_path', format('/dev/%s%d', disk, CEPH_JOURNAL_PART['cache']),
                'crush_weight', weight_of(part),
                'labels', list('cache'),
            );
        } else if (match(osdmnt['mountpoint'], '/var/lib/ceph/osd/meta/\w+')) {
            d[escape(osdmnt['mountpoint'])] = dict(
                'journal_path', format('/dev/%s%d', disk, CEPH_JOURNAL_PART['md']),
                'crush_weight', weight_of(part),
                'labels', list('md'),
            );
        } else if (match(osdmnt['mountpoint'], '/var/lib/ceph/osd/\w+')) {
            part_coded = replace('md/(.+)*$', '$1', part);
            raiddev = value(format('/system/blockdevices/md/%s', part_coded));
            part = raiddev['device_list'][0];
            disk = replace('^([a-zA-Z]+)0\S+$', '$1', disk);
            d[escape(osdmnt['mountpoint'])] = dict(
                'journal_path', format('/dev/%s%d', disk, CEPH_JOURNAL_PART['data']),
                'crush_weight', 2 * weight_of(part),
                'labels', list('ec'),
            );
        };
    };
    d;
};
