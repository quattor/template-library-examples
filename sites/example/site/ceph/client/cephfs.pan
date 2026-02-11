unique template site/ceph/client/cephfs;

include 'components/metaconfig/config';

include 'site/ceph/client/config';

variable CEPH_CEPHFS_USER ?= 'root';
variable CEPH_CEPHFS_GROUP ?= CEPH_CEPHFS_USER;

prefix '/software/components/metaconfig/services/{/etc/ceph/ceph.client.cephfs.keyring}';

"contents" = if (is_defined(CEPH_CEPHFS_SECRET)) {
    dict(
        "client.cephfs", dict(
            "key", CEPH_CEPHFS_SECRET,
        )
    );
} else {
    dict();
};
'module' = 'tiny';
'mode' = 0600;
'owner' = CEPH_CEPHFS_USER;
'group' = CEPH_CEPHFS_GROUP;
