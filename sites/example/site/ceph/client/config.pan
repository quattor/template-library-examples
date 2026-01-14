unique template site/ceph/client/config;

include 'site/ceph/common/config';
include 'repository/config/ceph';
include 'site/ceph/client/params';

prefix '/software/packages';
'ceph-fuse' = dict();

variable CEPH_CLIENT_SET_CONFIG ?= true;

include {
    if(CEPH_CLIENT_SET_CONFIG){
        'site/ceph/client/configfile';
    };
};
