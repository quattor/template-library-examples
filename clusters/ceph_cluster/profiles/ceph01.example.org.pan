object template ceph01.example.org;

include 'machine-types/ceph-server';

#
# software repositories (should be last)
#
include { PKG_REPOSITORY_CONFIG };
