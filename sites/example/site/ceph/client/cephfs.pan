unique template site/ceph/client/cephfs;

include 'site/ceph/client/config';

variable CEPH_CEPHFS_USER ?= 'root';
variable CEPH_CEPHFS_GROUP ?= CEPH_CEPHFS_USER;

prefix '/software/components/metaconfig/services/{/etc/ceph/ceph.client.cephfs.keyring}';

"contents" = if (is_defined(CEPH_CEPHFS_SECRET)) {
    nlist("client.cephfs", nlist(
        "key", CEPH_CEPHFS_SECRET,
        )
    );  
} else {
    nlist();
};
'module' = 'tiny';
'mode' = 0600;
'owner' = CEPH_CEPHFS_USER;
'group' = CEPH_CEPHFS_GROUP;

