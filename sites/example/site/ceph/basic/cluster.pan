unique template site/ceph/basic/cluster;

variable CEPH_HOSTS = shorten_fqdns(CEPH_NODES);

include 'site/ceph/common/ceph-deploy';

prefix '/software/components/ceph';
'deploy_version' = CEPH_DEPLOY_VERSION;
'ceph_version'   =  CEPH_VERSION;

variable CEPH_OSD_LIST ?= 'site/ceph/basic/osdlist-simple';
include {CEPH_OSD_LIST } ;

variable CEPH_OSD_SCHEMA ?= 'osds-simple';
include {format('site/ceph/osdschemas/%s', CEPH_OSD_SCHEMA)};
include 'site/ceph/basic/mons';
include 'site/ceph/basic/mdss';
include 'site/ceph/basic/deploy';

prefix '/software/components/ceph/clusters/ceph';

variable CEPH_GLOBAL_CONFIG_EXTRA ?= nlist();
variable CEPH_ENABLE_EXP ?= list();
variable CEPH_OSD_DOWN_REPORTERS ?= false;
variable CEPH_OSD_DOWN_REPORTS ?= false;


variable CEPH_GLOBAL_CONFIG ?= { 
    cfg = nlist (
     'fsid' , CEPH_FSID,
     'mon_initial_members', MON_NAMES,
     'public_network', CEPH_NETWORK,
     'cluster_network', CEPH_CLUSTER_NETWORK,
     'osd_pool_default_size', 3,
     'osd_pool_default_min_size', 2,
     'osd_pool_default_pg_num', 512,
     'osd_pool_default_pgp_num', 512,
    );
    if(length(CEPH_ENABLE_EXP) > 0) {
        cfg['enable_experimental_unrecoverable_data_corrupting_features'] = CEPH_ENABLE_EXP;
    };
    if(to_boolean(CEPH_OSD_DOWN_REPORTERS) && to_boolean(CEPH_OSD_DOWN_REPORTS)) {
        cfg['mon_osd_min_down_reporters'] = CEPH_OSD_DOWN_REPORTERS;
        cfg['mon_osd_min_down_reports'] = CEPH_OSD_DOWN_REPORTS;
    };
    if (is_nlist(CEPH_GLOBAL_CONFIG_EXTRA)) {
        cfg= merge(cfg, CEPH_GLOBAL_CONFIG_EXTRA);
    };
    cfg;
};


'config' = CEPH_GLOBAL_CONFIG;

variable CEPH_CRUSHMAP ?= null;
include { CEPH_CRUSHMAP };
