object template ceph02.example.org;

include 'machine-types/ceph-server';

#
# software repositories (should be last)
#
include { PKG_REPOSITORY_CONFIG };
