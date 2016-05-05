unique template site/ceph/client/configfile;

prefix '/software/components/metaconfig/services/{/etc/ceph/ceph.conf}/contents';

"global" = nlist(
    "mon_host", join(', ', CEPH_MON_HOSTS),
    );

prefix '/software/components/metaconfig/services/{/etc/ceph/ceph.conf}';
'module' = 'tiny';

