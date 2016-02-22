unique template site/ceph/basic/config;

include 'site/ceph/server/config';

variable IS_CEPH_DEPLOYHOST = { DEPLOY_FQDNS[0] == format('%s.%s', value('/system/network/hostname'), value('/system/network/domainname'))};

include { if (IS_CEPH_DEPLOYHOST) { 'components/ceph/config' }};

include { if (IS_CEPH_DEPLOYHOST) { 'site/ceph/basic/cluster' }};
