unique template site/ceph/basic/mons;

include 'components/ceph/config';

variable MON_FQDNS = CEPH_MON_HOSTS;
variable MON_NAMES = shorten_fqdns(MON_FQDNS);

prefix '/software/components/ceph/clusters/ceph';


'monitors' = {
    ml = dict();
    foreach(idx; host; MON_NAMES) {
        l = dict();
        l['fqdn'] = MON_FQDNS[idx];
        ml[host] = l;
    };
    ml;
};
