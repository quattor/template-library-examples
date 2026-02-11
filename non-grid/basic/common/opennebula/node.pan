unique template common/opennebula/node;

include 'components/filecopy/config';
include 'components/opennebula/sudo';

prefix "/software/packages";
"{opennebula-node-kvm}" = dict();

# Set secret_ceph.xml only if
# Ceph datastore is required by ONE
'/software/components/filecopy/services' = {
    if (is_defined(CEPH_LIBVIRT_UUID)) {
        SELF[escape("/var/lib/one/templates/secret/secret_ceph.xml")] = dict(
            'config', join("", list(
                "<secret ephemeral='no' private='no'>",
                format("<uuid>%s</uuid>", CEPH_LIBVIRT_UUID),
                format("<usage type='ceph'><name>%s secret</name></usage>", "client.libvirt"),
                "</secret>",
            )),
            'owner', 'oneadmin:oneadmin',
            'perms', '0600',
        );
    };
    SELF;
};
