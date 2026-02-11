unique template site/ceph/basic/deploy;

include 'components/ceph/config';

variable DEPLOY_NAMES = shorten_fqdns(DEPLOY_FQDNS);

prefix '/software/components/ceph/clusters/ceph';

'deployhosts' = {
    ml = dict();
    foreach(idx; host; DEPLOY_NAMES) {
        ml[host] = DEPLOY_FQDNS[idx];
    };
    ml;
};
