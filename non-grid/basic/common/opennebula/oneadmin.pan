unique template common/opennebula/oneadmin;

include { 'components/accounts/config' };

prefix '/software/components/accounts';

"groups/oneadmin" = nlist("gid", 9869);

"users/oneadmin" = nlist(
    "uid", 9869,
    "groups", list("oneadmin"),
    "comment","oneadmin",
    "shell", "/bin/bash",
    "homeDir", "/var/lib/one",
    "createHome", true,
);

'kept_users/ceph' = '';
'kept_groups/ceph' = '';

variable ONEADMIN_PUBKEYS ?= list();

