unique template site/ceph/client/admin;

include 'components/metaconfig/config';

include 'site/ceph/client/config';
prefix '/software/components/metaconfig/services/{/etc/ceph/ceph.client.admin.keyring}';

"contents" = if (is_defined(CEPH_ADMIN_SECRET)) {
    dict(
        "client.admin", dict(
            "key", CEPH_ADMIN_SECRET,
        )
    );
} else {
    dict();
};
'module' = 'tiny';
'mode' = 0600;
