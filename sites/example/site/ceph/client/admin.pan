unique template site/ceph/client/admin;

include 'site/ceph/client/config';
prefix '/software/components/metaconfig/services/{/etc/ceph/ceph.client.admin.keyring}';

"contents" = if (is_defined(CEPH_ADMIN_SECRET)) {
    nlist("client.admin", nlist(
        "key", CEPH_ADMIN_SECRET,
        )
    );  
} else {
    nlist();
};
'module' = 'tiny';
'mode' = 0600;
