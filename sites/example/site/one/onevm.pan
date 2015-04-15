unique template site/one/onevm;

# set opennebula map
include 'quattor/aii/opennebula/schema';
bind "/system/opennebula" = opennebula_vmtemplate;

include 'site/config-vm';

include 'quattor/aii/opennebula/default';

"/software/packages/{acpid}"=nlist();
"/software/components/chkconfig/service/acpid" = nlist('on','', 'startstop',true);
