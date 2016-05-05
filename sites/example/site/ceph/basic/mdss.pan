unique template site/ceph/basic/mdss;

#variable MDS_NAMES = shorten_fqdns(MDS_FQDNS);

prefix '/software/components/ceph/clusters/ceph';


'mdss' = {
    ml = nlist();
    foreach(idx;host;MDS_FQDNS) { 
        config = nlist();
        if (is_defined(CEPH_MDS_CACHE_SIZE)){
            config['mds_cache_size'] = CEPH_MDS_CACHE_SIZE;
        };
        l = nlist('config', config);
        l['fqdn'] = host;
        ml[host] = l; 
    };
    ml;
};
