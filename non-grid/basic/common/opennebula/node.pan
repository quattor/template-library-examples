unique template common/opennebula/node;

include 'components/opennebula/sudo';
include 'components/useraccess/config';

prefix "/software/packages";
"{opennebula-node-kvm}" = dict();

# Set secret_ceph.xml only if
# Ceph datastore is required by ONE
'/software/components/filecopy/services' = {
    if (is_defined(CEPH_LIBVIRT_UUID)) {
        SELF[escape("/var/lib/one/templates/secret/secret_ceph.xml")] = dict(
            'config',format("<secret ephemeral='no' private='no'><uuid>%s</uuid><usage type='ceph'><name>%s secret</name></usage></secret>",
                CEPH_LIBVIRT_UUID, "client.libvirt"),
            'owner','oneadmin:oneadmin',
            'perms', '0600');
   };
   SELF;
};
