unique template site/ceph/client/libvirt;

include 'site/ceph/client/config';

variable CEPH_LIBVIRT_USER ?= 'oneadmin';
variable CEPH_LIBVIRT_GROUP ?= CEPH_LIBVIRT_USER;
prefix '/software/components/metaconfig/services/{/etc/ceph/ceph.client.libvirt.keyring}';

"contents" = if (is_defined(CEPH_LIBVIRT_SECRET)) {
    nlist("client.libvirt", nlist(
        "key", CEPH_LIBVIRT_SECRET,
        )
    );  
} else {
    nlist();
};
'module' = 'tiny';
'mode' = 0600;
'owner' = CEPH_LIBVIRT_USER;
'group' = CEPH_LIBVIRT_GROUP;
