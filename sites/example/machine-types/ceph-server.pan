unique template machine-types/ceph-server;

variable MACHINETYPE_TOP_INSTANCE ?= 'ceph-server';

include 'machine-types/pre/ceph-server';

include 'machine-types/base';

include { format('site/ceph/%s/config', CEPH_CLUSTER_TEMPLATE) } ;

"/system/monitoring/hostgroups" = {
    append("ceph-servers");
    if (index(OBJECT,CEPH_MON_HOSTS) >= 0){
        append("ceph-mons");
    };
    SELF;
};

include { 
    if (CEPH_MAJOR_VERSION >= 9) {
        'site/ceph/server/infernalis';
    };
};
include { if_exists('site/ceph/cluster/extra_config')};
include {if (MACHINETYPE_TOP_INSTANCE == 'ceph-server') {
    'machine-types/post/ceph-server'; # Else this should be included on higer level
    };
};
