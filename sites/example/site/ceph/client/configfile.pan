unique template site/ceph/client/configfile;

include 'components/metaconfig/config';

prefix '/software/components/metaconfig/services/{/etc/ceph/ceph.conf}/contents';

"global" = dict(
    "mon_host", join(', ', CEPH_MON_HOSTS),
);

prefix '/software/components/metaconfig/services/{/etc/ceph/ceph.conf}';
'module' = 'tiny';
