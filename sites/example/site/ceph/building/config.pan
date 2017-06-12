unique template site/ceph/building/config;

include 'site/ceph/server/config';

variable IS_CEPH_DEPLOYHOST = { match(DEPLOY_FQDNS[0], value('/system/network/hostname'))};

include 'components/ceph/config';

variable CEPH_OSD_LIST ?= 'site/ceph/osdlocal/simple';
include CEPH_OSD_LIST;

variable CEPH_OSD_SCHEMA = 'osd-fetch';

include if (IS_CEPH_DEPLOYHOST) { 'site/ceph/basic/cluster' };
