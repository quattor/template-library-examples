unique template site/ceph/basic/mons;

variable MON_FQDNS = CEPH_MON_HOSTS;
variable MON_NAMES = shorten_fqdns(MON_FQDNS);

prefix '/software/components/ceph/clusters/ceph';


'monitors' = {
    ml = nlist();
    foreach(idx;host;MON_NAMES) { 
        l = nlist();
        l['fqdn'] = MON_FQDNS[idx];
        ml[host] = l; 
    };
    ml;
};
    
