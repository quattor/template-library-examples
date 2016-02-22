unique template site/ceph/basic/deploy;

variable DEPLOY_NAMES = shorten_fqdns(DEPLOY_FQDNS);

prefix '/software/components/ceph/clusters/ceph';

'deployhosts' = {
    ml = nlist();
    foreach(idx;host;DEPLOY_NAMES) { 
        ml[host] = DEPLOY_FQDNS[idx];
    };
    ml;
};
    
