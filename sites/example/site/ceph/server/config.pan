unique template site/ceph/server/config;

include 'common/fstab/service';
include 'components/filesystems/config';
include 'components/useraccess/config';


include 'site/ceph/common/config';

variable CEPH_OLD_UID ?= { if (CEPH_MAJOR_VERSION >= 9) { false; }};

include 'components/ceph/ceph-user';
include 'components/ceph/sudo';

"/software/components/useraccess/users/ceph/ssh_keys" = {
    foreach(idx;pubkey;CEPH_DEPLOY_PUBKEYS) {
        append(pubkey);
    };
    SELF;
};

"/software/components" = {
    if (CEPH_MAJOR_VERSION < 9) {
        SELF['chkconfig']['service']['ceph'] = dict('on', '', 'startstop', true);
    } else {
        SELF['systemd']['unit'][escape("ceph.target")] = dict();
    };
    SELF;
};

prefix "/software/packages";
"{xfsprogs}" = nlist();
"{xfsdump}" = nlist();
'mdadm' = nlist();

function shorten_fqdn = {
    fqdn = ARGV[0];
    short = split('\.', fqdn);
    short[0];
};  

function shorten_fqdns = {
        fqdns = ARGV[0];
        h = list();
        foreach(idx;host;fqdns) {
            append(h,shorten_fqdn(host));
        };
        h;
};

function weight_of = { 
    weight = 0;
    part = replace('partitions/(\w+)$', '$1', ARGV[0]);
    if(exists(format('/system/blockdevices/partitions/%s/size', part))) {
        weight = value(format('/system/blockdevices/partitions/%s/size', part));
    } else {
        disk = replace('([a-zA-Z]+)\d*', '$1', part); 
        if(exists(format('/hardware/harddisks/%s/capacity', disk))) {
            weight = value(format('/hardware/harddisks/%s/capacity', disk));
        } else {
        error(format("Could not determine weight for osd %s", part));
        };
    };  
    return(to_double(weight)/(1024*1024));
};

