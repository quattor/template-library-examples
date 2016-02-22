unique template machine-types/pre/ceph-server;

variable AII_OSINSTALL_CLEARPART_BOOT_ONLY ?= true;

variable FILESYSTEM_LAYOUT_CONFIG_SITE ?= 'site/filesystems/ceph';
final variable CEPH_CLIENT_SET_CONFIG = false; # Do not overwrite ceph-server config

variable FSTAB_PROTECTED_EXTRA_FSTYPES ?= append('xfs');

variable ETCHOSTS_TYPE ?= 'local';

variable CEPH_CLUSTER_TEMPLATE ?= 'basic';

variable CEPH_OSD_MP_BASE = '/var/lib/ceph/osd/';
# Include specific parameters, like filesystem layout
include 'site/ceph/cluster/params';

