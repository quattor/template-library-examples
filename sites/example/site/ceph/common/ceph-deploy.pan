unique template site/ceph/common/ceph-deploy;

variable CEPH_DEPLOY_VERSION ?= {
    if (CEPH_MAJOR_VERSION >= 9) {
        '1.5.28';
    } else {
        '1.5.25';
    };
};

'/software/packages' = {
    pkg_repl("ceph-deploy", format("%s-*", CEPH_DEPLOY_VERSION), 'noarch');
};

