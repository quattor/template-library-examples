unique template common/opennebula/common;

variable OPENNEBULA_VERSION ?= '4.12.1';
'/software/packages' = pkg_repl('opennebula*', format("%s-*",OPENNEBULA_VERSION), 'x86_64');

variable OS_REPOSITORY_LIST = {
    append('opennebula');
};

"/software/components/useraccess/users/oneadmin/ssh_keys" = {
     foreach(idx;pubkey;ONEADMIN_PUBKEYS) {
         append(pubkey);
     };
     SELF;
};

