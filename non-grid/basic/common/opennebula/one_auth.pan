unique template common/opennebula/one_auth;

'/software/components/filecopy/services/{/var/lib/one/.one/one_auth.new}' = dict(
    'config', format("oneadmin:%s\n", OPENNEBULA_ONEADMIN),
    'owner', 'oneadmin:oneadmin',
    'perms', '0600',
);
