unique template site/ceph/common/config;

variable CEPH_VERSION ?= '0.94.1';
variable CEPH_VERSION_TESTING ?= false;

include 'site/ceph/common/params';
variable CEPH_MAJOR_VERSION = {
    vers = split('\.', 0, CEPH_VERSION);
    to_long(vers[0]);
};
variable CEPH_RELEASE = substr('0abcdefghijklmnopqrstuvwxyz', CEPH_MAJOR_VERSION, 1);
variable OS_REPOSITORY_LIST = {
    append('ceph');
    append('ceph-noarch');
    if (CEPH_VERSION_TESTING) {
        append('ceph-testing');
        append('ceph-testing-noarch');
    };
    if(RPM_BASE_FLAVOUR_VERSIONID == 7){
        append('c7x_x86_64_extras'); # ceph needs python-flask from it
    };
    SELF;
};

'/software/packages' = {
    v = format("%s-*", CEPH_VERSION);
    pkg_repl("ceph*", v, 'x86_64');
    pkg_repl("librbd1*", v, 'x86_64');
    pkg_repl("libradosstriper1*", v, 'x86_64');
    pkg_repl("librados2*", v, 'x86_64');
    pkg_repl("libcephfs1*", v, 'x86_64');
    pkg_repl("libcephfs_jni1*", v, 'x86_64');
    pkg_repl("python-ceph-compat*", v, 'x86_64');
    pkg_repl("python-cephfs*", v, 'x86_64');
    pkg_repl("python-rados*", v, 'x86_64');
    pkg_repl("python-rbd*", v, 'x86_64');
};
