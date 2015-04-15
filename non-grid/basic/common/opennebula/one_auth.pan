unique template common/opennebula/one_auth;

'/software/components/filecopy/services' =
  npush(escape("/var/lib/one/.one/one_auth.new"),
        nlist('config',format("oneadmin:%s\n", OPENNEBULA_ONEADMIN),
              'owner','oneadmin:oneadmin',
              'perms', '0600'));

