unique template site/ceph/basic/mdss;

include 'components/ceph/config';

#variable MDS_NAMES = shorten_fqdns(MDS_FQDNS);

prefix '/software/components/ceph/clusters/ceph';


'mdss' = {
    ml = dict();
    foreach(idx; host; MDS_FQDNS) {
        config = dict();
        if (is_defined(CEPH_MDS_CACHE_SIZE)){
            config['mds_cache_size'] = CEPH_MDS_CACHE_SIZE;
        };
        l = dict('config', config);
        l['fqdn'] = host;
        ml[host] = l;
    };
    ml;
};
